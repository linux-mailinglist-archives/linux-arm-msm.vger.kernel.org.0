Return-Path: <linux-arm-msm+bounces-78869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D026C0D131
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C9A3A4F28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB952D77EF;
	Mon, 27 Oct 2025 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLQKwzDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D332E6CDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761563477; cv=none; b=kaKGsKWnP/IgfiMrqov/qdA7oQxccjp40SrRXPLHtuPMoABI5orXpjOfUXe6+KK8trTECpmsstiaydw7DmVwaEnsaK+xIdo8MiADMifwNNv+RCwtSZ5WWFFNuI0I41hZED3QkQD0JJz5JwL4h09SlNG36rDu92dcfg6Ms1QyHiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761563477; c=relaxed/simple;
	bh=bosUVrTONnDS0EFFq+LVcW6EHq4uQ/rImZGCuc59Vpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLQZOk6Pv14U9WCN59lDdGfhNKeAsroeuk/zBCYdcUb/tvySl7+LgETRBhhejMWudl25CAN6aQtdhirDlEnSOLQnUId3KNzXUYq9/jjsUrOj+bTdQN/rsZ6TdX75PqOk6YJAlJKrijiByNDCbHA0O9efO5gpgB/wF9XAouzWAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLQKwzDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RAAAQb1502840
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8WIQT23Q8Zg1BnAz2MWS0UE2kbwz+Q6IEFFa9VNqtA=; b=mLQKwzDyym9IA/DT
	sZZ0SGXb2BUHepEZibF2ZId8fduvszNKie29iwh/sBpQV7ZWCEnCGvIcrWzJBKIM
	HzoJPzC0XIDWKCxohVolVRMjPU12qbLhaYsdxHJFLmNSG3y1XjAJ4cceVK0Eorvt
	JccgRWzlhAU2b2Pc0x3PhQWzUNuA97PJXc+tcSQwbPJfykjXBf0es83C9Tmhtppn
	r5T+VaXR1Hjt2oyR5X/7pWSNXhp+6hxatZnAUL3ZWssHJrfGo8VpSx/8CNzX/jWR
	3IccZfaHG3fgu1sAvhqjPl3JU0Z6jGoNm9aiLPCgxipJCEImU1/NuvaneqQ75d4W
	M/E4+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a20pns93d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:11:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb86039d9aso8043231cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563474; x=1762168274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8WIQT23Q8Zg1BnAz2MWS0UE2kbwz+Q6IEFFa9VNqtA=;
        b=WnFoXjaDkewngXaqsiAQh0JYHTFI3N1+CoWwyQtMWxrrTdm4DtY07DvJocHVHe8BUi
         71pQG9i7Ry8+XRRWEZLG+7sW6maG7qq1qknpCN2DOyJU+JrQcCUk86pwU9XPMe0mM3a4
         lbK7VXtOr8lsJSBw58Vj4yntU6O9dOKjC7zq7BCwBlozSJqV3NhDDQxliEdTCx28Fkx7
         SqPKYRxFnrn9be/Flx846HBgkcc12NZDRrR2t3qQ0Rp4RXVcRGAPXiTnWSJXZ+Bd89WD
         sQpGFEH3pSBii/OENhegaHlGXl4Qj4Lm8WuGAotwODlfOlZpLPU+42bwQirAL6Xr4+AG
         Bqwg==
X-Gm-Message-State: AOJu0YwuROf0dnCxuO4G1nPGZZC98rP1pYp/qe21e3xwO+gx8U0VBiCy
	+MTJiBKcTfP/QMl/k1wkjRbX3fWviLM6ItjuiWz1NoE08DF7eCcCG8GFK22Fpditd6NohFh5vRh
	JTvu5TZexg51vQEHArwwYoh3FeuF2AK8sKs/La/Tj5okY8hW8Uu9IEinSsUELiD84B+zX
X-Gm-Gg: ASbGncumnKOIjXc7uYYUCIEdpfCdlDfUty+GckxUM/EKa/UipOEpsntwj7P3b+LAwp1
	3jk0Hzovh15zihQbh1MXim2Fr4uRsdnwkGc5yMP38YDJPkxx4u6ShqtngUWdLIWEXWZK4Cf1MRE
	tgXVfQe41U3h0aG5R4ClL82TNGGETsg3cEJpW5G4q4ISLC4aWjZ14mOWBY+3HfQzpiorJM7I0w5
	r/UbfB+5qhg5lTHydrzKs4nlXX+oUyDSakrfbt5s03XM/W6xTUgN8d4A8Id1SispOXo0k4soYDx
	wiV7R/M2bpEof6LUp+HocDkKJKHn8e+ntoFjSiAjPANSlDC5NprtA1Ews4SKohE9+XloE1aAEne
	+uxlgjA2hiugW1mAj7yWPfBSXZIWsqH22T+CKUK0Fws9GsukCFojjjpGY
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4eceef16c1emr45626151cf.11.1761563474235;
        Mon, 27 Oct 2025 04:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp0McDYH82cpews6krOwb1okYKKV12xKV/8IeClVI/HE450oM4Yo+OS37OfzZ2SELE5qFANQ==
X-Received: by 2002:ac8:5704:0:b0:4ec:eef1:52f7 with SMTP id d75a77b69052e-4eceef16c1emr45625791cf.11.1761563473633;
        Mon, 27 Oct 2025 04:11:13 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef833besm5896053a12.15.2025.10.27.04.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:11:13 -0700 (PDT)
Message-ID: <e4f33bf0-05d9-4aad-b00e-fb7cc2c2633b@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:11:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: m31-eusb2: Add runtime pm ops
To: Prashanth K <prashanth.k@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
 <daf0055b-7caf-4ace-8a06-071468273a37@oss.qualcomm.com>
 <1c52e759-15fd-462b-a9fd-ad620da099f5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1c52e759-15fd-462b-a9fd-ad620da099f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kt-UDBy2ZSMiodkmYbNtUaIrr1E6a1WP
X-Proofpoint-ORIG-GUID: Kt-UDBy2ZSMiodkmYbNtUaIrr1E6a1WP
X-Authority-Analysis: v=2.4 cv=A+xh/qWG c=1 sm=1 tr=0 ts=68ff5352 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TkFh0mFV8F8mC-raymcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEwNCBTYWx0ZWRfXxr6k5S2bZl4Q
 XPam0Bt1acGZr/gSKRcazvkCTiYG8MIwfVVq5s3r+dDyCSyVtxRSsWgL6PdEmeUoAMx1U2qIekk
 PRLuYNRE1T8/Ye+wcY/j8ZayfCwKh/AZRuqdj9+kLC/fFA6Uhxvz2x5hvGfeTUps0E5XG9JQnOl
 3kFQVrbrYP/SU8urNrJbvePxvyRvefTayDd+QZzccg+NNFuj/YljI+IIvJ36SZuHE18v0DfCpia
 oypgU+eXPRkToDAkfLGTYRDPQ9hjIDV2SyQrByTjZe1d7uGvI38/E742qSuSJefLyQ2cd1ZV2H+
 1FKU/CjHeNmOiiXJLBt1WJlC784ygNn59bM54CnroykuyQJsiAJDgoiZ76kzyatGR5pkIzE94BI
 pXLLVE1O3REX6KzcYW29ebNIwPnF8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270104

On 10/27/25 12:09 PM, Prashanth K wrote:
> 
> 
> On 10/27/2025 1:55 PM, Konrad Dybcio wrote:
>> On 10/27/25 7:24 AM, Prashanth K wrote:
>>> Add runtime power management operation callbacks for M31 EUSB2 PHY.
>>> Enable/disable the clocks based on the runtime suspend/resume calls.
>>>
>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  static int m31eusb2_phy_probe(struct platform_device *pdev)
>>>  {
>>>  	struct phy_provider *phy_provider;
>>> @@ -270,6 +298,17 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>>>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>>>  				     "failed to get clk\n");
>>>  
>>> +	dev_set_drvdata(dev, phy);
>>> +	pm_runtime_set_active(dev);
>>> +	pm_runtime_enable(dev);
>>> +
>>> +	/*
>>> +	 * Prevent runtime pm from being ON by default. Users can enable
>>> +	 * it using power/control in sysfs.
>>> +	 */
>>> +	pm_runtime_forbid(dev);
>>
>> This screams "this patch is broken" or "there are bad issues" which
>> you did not describe at all.
>>
>> Konrad
> 
> Hi Konrad, I was followed the same sequence from other phy drivers
> containing pm_ops. I assume the runtime_forbid is added to control
> runtime pm from userspace.

Other drivers call runtime_forbid() because the implementation doesn't
work.. Or at least historically the usb3 part hasn't been able to sus/
res properly

Konrad

