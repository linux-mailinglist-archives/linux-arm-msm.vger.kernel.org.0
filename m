Return-Path: <linux-arm-msm+bounces-73327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67961B54CD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A426618876F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C3306D3F;
	Fri, 12 Sep 2025 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKF/LsS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD52FB97F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678594; cv=none; b=bdVJKnuNzC1aR0GkQPHLh6EC7AzE/qM+l1zHdtfs4KoIMhzvf2MmTl0B9THPjiEbX507bIop//9x7A+jGpspxyBH00b69hM4Yl/hxLv7fNKKB9s+aCKkkUlr2j/cWRbcsLkjGShJbTMXdkBe07q24OZF3br7Ysk4SuR3pBvvj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678594; c=relaxed/simple;
	bh=edwJBANlYBATMWqJfznmjfQe9Te1sboPmlsb4rcp5wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZ/jOmSIczBFsqmAVaHQcDAqPZ5SBJ5QeySINxjE33ILj2J6WlmBfLa8gxVqU111WTAZLCkuUBeb9d16OuZbFhARarz2MhTLsQgQEqwdSGBD9SHAXasERTkgiQpDduUUKtLjsdSBjMylTuA2KvTDyxHI3a+8/Mdc5bx38EGJtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKF/LsS/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fKDh014034
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMKtRR1gvr98NkFlahada0nc1pCDoOH4s0Uqq/hc/XM=; b=WKF/LsS/PAUWM2XV
	I1POHixo3Ch+L34iRRQ9hJZf4lUjKxqL22xSH/dQJk3dm+diZB053n756JOTq9MX
	qAbeTu2VcYx+0bN9xLevJI19AnRWr7O6PZ5gQzGW1jgnhYdm77qR8KeJWCigcvdW
	4WNl7IJaf7CdKtyzK9dyIsk5pSErrCEIgLNUw05hdHtN1izh3lGaeHVA8YefwlPu
	hVLLG6ySFRFT4HVLLyywvm1ei9BIrlisdVK2b3GJZpvryZjCjN0WKDFPyvOGW1zu
	ykOL1P3SNSnL3prr6NDwIm4xi55i0pj73PHhsLLBt1haGjYFL9KthsYrEVzJueeU
	t51ydw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphw92g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:03:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32d8eb60ef5so404162a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678590; x=1758283390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMKtRR1gvr98NkFlahada0nc1pCDoOH4s0Uqq/hc/XM=;
        b=jbn1wZQPI0z75U6smYL4zfGIeqYP5sTJAjshUekv0SMze/ONn/Lc1m4T61e/kpIQYy
         WPTcI0SLigW8mbHyO+iPTqPPvwFwtkBjurnzK6zjC+caNS/A2jZKPN9ul7el0F30YLLN
         UTBvbavjO4Y8afnphj4P/10e9HBpWVdTVPb6aoVMg4jc6aHz/Skn81m84qglsSrOgNXc
         gGU41fNY0tm5OZnnIhXxCdMBpBvHGkTGtoG5IWDl5o4g6OQDfzWbaIbW+ac0CFN/lSyp
         nchK00z5/EHhXGGPrFbY9Jg5m26eTqE5plnKq71guWkJYywDSIl6w3vCuM9kxLZb/EHd
         2F3g==
X-Forwarded-Encrypted: i=1; AJvYcCWM4uqIFY/0m2Qn+OCSMHQy0Ud50S7sWvp3WjSigqGEK8tgjB22CpQvwItH/z8mYxAbghUV5rcJQV35tHCn@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxiD0yUM6Zbx5zfgmcgBV/yLlEeZ13u5UfU4OvExOV/OlonIR
	P1iI5Mq7e4dYgjrvtSmLBF9INjgg8AuJnAUG61eA1jsRJaP7SzfhXPoXSDpS01/OsGFlaKOyQSY
	v0D/qdMS/yNyemmHFv2n+TlfBq+zUp/WAWslJfEa1lfDPn/eA72LSmqxz+ifEdKfUG0BB
X-Gm-Gg: ASbGncuBByD7migA3SDbNp5/1OdpOP3lV1ZDBmekl6vhn/WfqL1mG68SoZmlhDh5Dau
	+7Zq2i4pyNA9s5HCF48WPS0MXTt4tenKRItZByrOpDxXcIt7shRuCZAiqwYBLBzatNwBlxMCeW5
	b7/kWomH0sy4rVByl9pdtaRj5Y9bwPjY5GtBl7wzQf1Bkb/93Ue3OArDY3VSp5PJzRTzrV5xr6o
	LuNF8Px3Kxt2paFWVTJygWyE6j5STHaNpAV4OoDmujToHzGeHLbtBVNV8QEVNLas17xOQjWGJjz
	2hqCNmGaTPa5j9l56HArM/dcHzJzpnHday5O0BTvxeUItZz1Un4PhUHamEvO8x1Cp+iYOO3DrNr
	pgK5qpQ1yVgucDmKKEg3K1evIpaVvGg==
X-Received: by 2002:a17:90b:1d07:b0:32b:9416:312d with SMTP id 98e67ed59e1d1-32de4fcc070mr1755265a91.8.1757678589767;
        Fri, 12 Sep 2025 05:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLbeV2EFA9K8UJYz1maZdy+AMfW1DBGrroF29kzoSYpUtUZhd3N4o5LVMtPmgZDxe9yHDhjg==
X-Received: by 2002:a17:90b:1d07:b0:32b:9416:312d with SMTP id 98e67ed59e1d1-32de4fcc070mr1755211a91.8.1757678589043;
        Fri, 12 Sep 2025 05:03:09 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-776075fdd83sm5311370b3a.0.2025.09.12.05.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:03:08 -0700 (PDT)
Message-ID: <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:03:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
 <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c40bff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eXWC9YIREg2_PHQc8DoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Mwak6uXLvpjbj5cH2i7yA59QRujUqDun
X-Proofpoint-ORIG-GUID: Mwak6uXLvpjbj5cH2i7yA59QRujUqDun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX0+jPdncS473v
 5hKWcpGQXSy43LCYT8p+NQp9nTGNgDufWD1nwL9lmOii6xz7LtnBUKWPcG0zeKalP8TNU01J48Y
 yKCUTX/Y/qJkKiWy7GyoVTUs0oW6O+OuKDTWNF2JSBZyZvO1OSPfSxTc9JW6PwAiRU1ExbCw1Cw
 4L4rgXCyMVEUNBMuBr2hTLuZssqpEhxOC/mczlUp5T51UL75yd9XVpWLV1YmFPbfI7d3jHP4mN7
 peU4EeTAWUeFbHyyTW6PHI+lXhegW6RG3fQRRqGfedQszFX8KrS4BHlXtkYHeWPrIEbw5qDWKWN
 ugMwVZXPZA5H2cbEE97Rev4J0RfTsJjdBsQNK5cbaoIgck4aMNLMKZ2iyx4hqcGe4yfvjd4ww+3
 vn8rZZVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040


On 9/12/2025 6:32 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
>> Introduce mutual exclusion between USB and DP PHY modes to prevent
>> simultaneous activation.
> Describe the problem that you are trying to solve first.


Ok.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>>  	return 0;
>>  }
>>  
>> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
> mutex has a very well defined use case - a sleeping lock. Please find
> some ofther name.


Then how about 'qmp_check_exclude_phy'?


>> +{
>> +	if ((is_dp && qmp->usb_init_count) ||
>> +	    (!is_dp && qmp->dp_init_count)) {
>> +		dev_err(qmp->dev,
>> +			"PHY is configured for %s, can not enable %s\n",
>> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int qmp_usbc_usb_enable(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);

