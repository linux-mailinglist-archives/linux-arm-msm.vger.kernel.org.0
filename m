Return-Path: <linux-arm-msm+bounces-73326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36696B54CDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F535176A6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E76D305E04;
	Fri, 12 Sep 2025 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LThO0WJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F23054C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678504; cv=none; b=aj8iByl8l+JMAX/eE6CTq0VcfuBAuumflzqUS9uoo4qLWb27t/hohnqtBNYXyy8NBSej6RudeSNi2/UhlMxNdWoBYj5hBNPBsnam3Gbzk9SQCWq3rF+RzO3p4VN4ReA2dhaKzfXMJEgLIHhgxST6nqnc3GJXBpHlZvHKOGTFzSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678504; c=relaxed/simple;
	bh=/8AAvLpDLUvNLFNqA0jzZmGl4oPLi2mhb27u5pyxvXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5prrtLzAwTHOOgDdDUiJBlFrMHOHxS1xBx34Vwf/iA55diO1yZMRn6KjIIy8RzkSykNTPvDBxqX4Ocrcw9QlZPPi4FrBkLN1PCsr1iWNokUghIqVt1e0hBVhCcc6X1zlqtVa/ijzGKUcbkiSALeJoU3sSuN9rjxGxfG+7OKsmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LThO0WJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBB5Qt017035
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR4WV22vf2t/EPkoMZ6ryeD+FVZWeK5RDIR27BMiiCM=; b=LThO0WJbd+uPPfql
	1T9rEvTNfMVif9MJ3ij5xNWCkqiPRYhUWsu++34zYOfSEnJdUDTfwdZBGx5u8VfH
	xmpwjPI4+cVMRRDpIOXYXMLZa05jPm1I1MCntLGcOMP8FcTn5SY554s4VLfwP0Np
	2rtES9jCBlUL1CAihVaHgQ+7dLHSMx3u92rkbEcbqTmzyt0mn74Uv8y4yPw9GDn5
	vLa9znZ/rkzy+eokbXzq0LrydSNBvamx3xMhXAm5cX7MZqX0LaHMnc2GCXujp43K
	1HmLkdiWKvBp8YRYurXbcUTShfrnenWbAVcBVy/FYfaGG4JAhy4qnoyKeqrLEJJz
	UHa/1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx046t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:01:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24ca00fd1cdso2585235ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678500; x=1758283300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tR4WV22vf2t/EPkoMZ6ryeD+FVZWeK5RDIR27BMiiCM=;
        b=aVM7rj+xeCdSpM0ngKzpZNVZ3k+IuU+bqQF87pg+XnfAFa0I73+aqob8PIczsBetnb
         Jd07aUQU9qLbOTXMH1wlD3SMFKHRsTFabkhzXTJf9nKtZvKtmyVWyoyxz6f49np7/nwj
         zBOhamwQtGNSOMtTNQz9z2DGcTSJRf3SkgZR0JC3p7yyr9M6dV65jtvbVD1RBZ2ZSgTW
         wFxeUPD85HYla/rlhuvsW9i0KeWfnGZQh5BUveh3sullsglXjPmLVqMBTptL00C/HVME
         wGzs37SKTerS6Zuj2nVIAro6xmxr+IdEJqq4dicVQVWTvKJ+7++yCJNjCuylkruX2Ci/
         BpAw==
X-Forwarded-Encrypted: i=1; AJvYcCUfDzxg1ZZgFKBTCAROnK0A5Xa4jpKm/lYBfPS7nhyU2smzV5MWgNrYyy6kkbvajjjMQ0azbFwFTVVgY4Rr@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNvTDCPMs5eLrahtG+XABgCK0+zcWVFvL129f1Ux+FN3nDy1X
	faVXOSIuYTdj428KVBwpEWXce2RLlN7s0nUARUsEyVq68cvQzsHHqmc2zqw3oPDiWF4G1OYKOSd
	d6zc4jTioZi1T8uLLOtsq2RxzjGpLKMzg042gVMZfVjIloJZtGOKcXIM7wTwdj8zx+yJk
X-Gm-Gg: ASbGncvR/7gCYh4/0JgWdxgFV+1rBYJROgpzDbtV0hSGzXhtg1T8nod8ACc91Jfo+NC
	nnMhjGt3NV070prI5bsfX6B8n0kT8F3UI+Gu1B4tc5u3t3PJ97ah5I/B0CflryomSK7IG2AaI+8
	aolzYhAxQOhd0a82fxbBAiLbZylp7j1LKNWAYGdXn6DDIYHu80GBXbshIz1+XYD79oexk8Rl/3Z
	nfhL9CtxVTd0JxDkYiLvmyjKIp0Q2ilb5cBmiIsVXfuoRNHmtvxkVG9puapfZlW4vWN1s+Ci43S
	yt9J3tR71o/6esmONtTWh2q3CUjdMLCijipCSjK2zU62xq4MBhQod1RKZSGqSvA1dEYFxec8PfH
	qBP+LVFiZJ+LL1gM6JJy/7ZEr3Gokaw==
X-Received: by 2002:a17:903:1ce:b0:25e:8089:5070 with SMTP id d9443c01a7336-25e80895390mr5790305ad.1.1757678498767;
        Fri, 12 Sep 2025 05:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRWUteHVEdJSYAR1rniB1eDfwR2hwSrNL/NbjOkI3aWK1MO0R3uv5T0gv0XZ2mKId4uJql1Q==
X-Received: by 2002:a17:903:1ce:b0:25e:8089:5070 with SMTP id d9443c01a7336-25e80895390mr5789845ad.1.1757678498117;
        Fri, 12 Sep 2025 05:01:38 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6cc5sm47586865ad.27.2025.09.12.05.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:01:37 -0700 (PDT)
Message-ID: <9fa9f9e4-b7fa-42fd-b367-9d52e0f1f184@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:01:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
 <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfX9kfnlUQue2G7
 3bUKatwL8JRtGMgcVpgz9BBHYL/yk0HIEPvM3J/8V0RPwdydnLsHYe9c/g6fUA+XhcioUgapuEZ
 luAKE1W1h6ceubWT0qGKagCcDPBbEWbMx1OHoCLbbquQKAOTv2V9ZZYup7VxbAapFUa+JzOWoac
 PKJobXnRXDcYIL8dm0ELXCFrIh5HoD+QPU+fL8mdgqs00aIQTIHjE+hPnh/T6TutOpMYSOXfHWe
 Yh2GkRJa3lKJgatDfkdG+fO018fvvX6u18OzlJa270tEbPHJW5Ox+31pqVUFtPryVujG6kUS8xc
 OP07jilnrBZdMhD7HuNdXlIK/GXt2hzPn7KgoC0JoJFhlaEQtHmirvi0OWM66VehBchxxnCrBFw
 /jLCdN+4
X-Proofpoint-GUID: LgdkOVrpLNkhyylL1nQMfVbYp6Z6MBPN
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c40ba5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ctQwHQabY_GzZcauxAMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LgdkOVrpLNkhyylL1nQMfVbYp6Z6MBPN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106


On 9/12/2025 6:31 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:07PM +0800, Xiangxu Yin wrote:
>> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
>> switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 192 ++++++++++++++++++++++++++++++-
>>  1 file changed, 191 insertions(+), 1 deletion(-)
>>
>> @@ -1669,6 +1832,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>>  	return 0;
>>  }
>>  
>> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
>> +{
>> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
>> +
>> +	if (args->args_count == 0)
>> +		return qmp->usb_phy;
>> +
>> +	switch (args->args[0]) {
>> +	case QMP_USB43DP_USB3_PHY:
>> +		return qmp->usb_phy;
>> +	case QMP_USB43DP_DP_PHY:
>> +		return qmp->dp_phy;
> return qmp->dp_phy ?: ERR_PTR(-ENODEV);
>
> We are not expected to return NULL here (and dp_phy can be NULL).


Ack. will update.


>> +	}
>> +
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>>  static int qmp_usbc_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -1743,9 +1923,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  
>>  	phy_set_drvdata(qmp->usb_phy, qmp);
>>  
>> +	if (qmp->dp_serdes != 0) {
>> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
>> +		if (IS_ERR(qmp->dp_phy)) {
>> +			ret = PTR_ERR(qmp->dp_phy);
>> +			dev_err(dev, "failed to create PHY: %d\n", ret);
>> +			goto err_node_put;
>> +		}
>> +		phy_set_drvdata(qmp->dp_phy, qmp);
>> +	}
>> +
>>  	of_node_put(np);
>>  
>> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>>  
>>  	return PTR_ERR_OR_ZERO(phy_provider);
>>  
>>
>> -- 
>> 2.34.1
>>

