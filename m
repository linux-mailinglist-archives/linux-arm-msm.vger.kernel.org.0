Return-Path: <linux-arm-msm+bounces-87734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC8ECFA0CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12951307AD7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC5F38014E;
	Tue,  6 Jan 2026 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLPPreo1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6ol/unq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75513B8D75
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722730; cv=none; b=IGT0NdL1sWrWeokrA09vp6eSbdm9y1TKSpgM4xGzj7f62nWJ9XCE8ICMCwiIrHhhQdtHWeSdKOCiqPxvuL9vLS/ywIc4QE5gabIYCGRxGk3OQmJTOSNV6ITwkxLBhzsMOYstUAw/KeO58jJu5s09wJtTsIBfniSEq6LRmw/RIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722730; c=relaxed/simple;
	bh=u4Ucw346p0LskE2Agd4cJRPVq6GJdLEmyHn4EWRgWi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+CMp2ge2SnNGDgb3/LnqS4rPz2v9mpwVKLBBD7PpIa/0D+sJ/Cx7QW0lpGtdLB6BWDzd3w9AO0YJ2EoE1Y0sF4Gcz3UIoW/b+eswqxuPMphkqMo3SKbIrVV5cPaGSCZU0mndV8DpAfW/c+l8aYBSHBmFCBp0QCukOkeq1I/rMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLPPreo1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6ol/unq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GihYU4136987
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 18:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AxdnYtkQsJk/Nx0EcAu08x9Bd7auZ3nLxm9/Y46BzGo=; b=LLPPreo1Kq+ql8mD
	gM6JoQxZI4oP6sphNDmzjcS9c1t2Bhtn8vF3N72RlhkOKE42YkZsWwBcBl1UHcCc
	TWsRS/PjzFE8jDl66XcFusU7bd+8FY84RAEXW6ngcLQuupdFGzHqk//cH011f8El
	qc2lOcN5Ia4GhFX4KJJGSkB5h+/sFXJ4HPh1zqHdMv1ixFuG3GKYFj1N/pl1yqF9
	wbzFstqXR2jgoUd0dSRaUvS+t86HqdqcR7msoypInpYqpEcO3mjXKHuh9ltA6XMI
	RUHg2nWXrafh9ILhzD+4FezlBIyEnRZ6dyF7iPzOOl5nM38M/L6Gtd8pLH0XO8O5
	68nPvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e0845-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 18:05:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae546fa935so2150701eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767722726; x=1768327526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxdnYtkQsJk/Nx0EcAu08x9Bd7auZ3nLxm9/Y46BzGo=;
        b=g6ol/unq+u6bx7yIbfBIBtkBFAic09bPPjdSAXyVqAYLEURuehBBmUzHruIKis0uuV
         8wUDoEASfEibGlQPFQoEpNXIxXQx13DWNdq2zA+SOQTrWpMdLvtEOZ9a0vPM+nqtaHnS
         74LqoSqLxuf5y5+M/ShjXx9/gJOleFaSM1pYBj3034F6zunu+g7qkb7PZUBhrVw3Jh5f
         czPDvRoDQ+F+Y25MNobb5s3wrQu2kAOc0MqEoQkKopHaqgC5G3k5JRNFUDbFTCcbO2IH
         XDdOWm6l1KWfG8oufz7jEsB8GEXUy7jH1Jx7heEQ8tTdNwu3ht3wktINelRPOPnzs6hu
         XNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722726; x=1768327526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxdnYtkQsJk/Nx0EcAu08x9Bd7auZ3nLxm9/Y46BzGo=;
        b=EEfp31eZXac/zZUHZ+Oh+lZg1WSNACk3X4aeWoDi5qbGZ8v39tFNoG17i3Qe1MELq7
         Fs+qFtF/epdRyWSGZMdhj4yYcKHEuEJaD+HEzi94jWBvn0/UlFjCt7ZxGsnINEt5uw/W
         /jYf+JSeGHqFfZP7uKWRrZkRkWLlFDR9uP5QsSOesmHFI4PJuFuaCk63Y4nbK7kyhUfE
         sK9VRI1rzEID4qtP/iWoEhBGOGNuW+RPFLCYJhxT8O2Wcl9MtcSqE2WDyMujbYcG13y1
         21DpSvMhIHiatN183I+6eNTOXSHGvxqb36FrAZ34O0dKhyoZzQHusw6lyGzgZDIsEhKJ
         RGxg==
X-Forwarded-Encrypted: i=1; AJvYcCWj0+ESNrD1etNHMJxwGEsvFINPnRSoMRgsSS68zQbZ3VvAXzmA2nUHNyR1JkVkH1SwlKQXzZE0f1bfcnS+@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvFD05IZfDhNMnIh+3opVGDITVu06qEtATdptaGbEhWkgaNJ6
	zhdAIMcp0zzUIcCig2Et5dtCgof7rcWzrqnEJRbF6ihMfHg0hJ1l6sAog7yTaDDTU558Les3FnX
	ZcnVuO7vHbkOfA5Jsq78tsYueOfh4PE3OQ6WL9DD1q+v6UDjvcNI+hhInCZpg/iiCBoi5
X-Gm-Gg: AY/fxX7NWUT6R7RtY4bxqG7DElgCJdLxPNMKwklnkcCM5CW49IuYNFxAIV55tk1gxJ+
	EF4h1SbkKNNBk8LrIwqKq23EcCMTQVrxuyGVgBZCcQKGnte6EkjiVExwJDWlyCxrt/DekaeW3nz
	49I05IJTKefwTQsNMaRUhkO3OjHBXwb3pCVdSrQ4u6aSlJw88buAowarfpt5K1LNnUQgt4pQ2ba
	sMD48Iphc3sGv4hQJdhBBOV/EXEBJF0VmA7D/+GIaweo0gQeVYrxa9exqg0FR98VgmB01ZbPAgr
	yaScpG44xcVQYix2UVMiCiNm3xbj2BkiuudX5gGZKiOYE/hjCT2Vs8xzx7cKW7M+GNj2kMGsi59
	v/i7m1re01XdA4kjppSTaudYnRptuYT+xxPsgAQUWQ3/L
X-Received: by 2002:a05:7301:4715:b0:2a4:3593:646a with SMTP id 5a478bee46e88-2b16f906b28mr2324266eec.26.1767722725816;
        Tue, 06 Jan 2026 10:05:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPmT/G9mHw1vDU2raXA+OeKBLh9EW3Uit++Kb5XbJqJTvaJem5/JDrr8t0ZlJgydfxs/Tk0w==
X-Received: by 2002:a05:7301:4715:b0:2a4:3593:646a with SMTP id 5a478bee46e88-2b16f906b28mr2324233eec.26.1767722725225;
        Tue, 06 Jan 2026 10:05:25 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm4208772eec.23.2026.01.06.10.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:05:24 -0800 (PST)
Message-ID: <ece56115-12be-47f4-bb50-106a10aa5b42@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:05:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-4-646fee2eb720@oss.qualcomm.com>
 <20251127-terrestrial-arboreal-bird-5a6d9b@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251127-terrestrial-arboreal-bird-5a6d9b@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1NyBTYWx0ZWRfX69kfIlu+wDct
 qP+RR9KKCdvtASAFCPuS/ALVU7hUZ9iqi1H3uVrPRbnmWN5woY+bm8TyyoZnfTzJOnf3C8gHEiU
 W/qWTgmDxx3HXkOBkfqaZFuLzp9Tyn9NPOIWsI0C3lbj+Z2YshcPNgznTcvqddbp/lPwVCQU+qw
 e17mRpl6GekTHZxw1e/4humkMxxQiDOIdP4c9OzsX9a/6TFQRodQg5ba7/z4VG3cRFEHTu2jmxy
 BiDgGAI5JaVOWQLddn/8v+ao3hg8KrRkw8ftZB8rj+1y4/y7qCcAzjxBAqCmtJ3MZPM+jY4dJYW
 L1SYaY67DiBv7OI9YnmHS7iXexggCtddb3wippaMrgWaCaxEKXC/09SDwGaB3xX0HXzj1tXlMZR
 QI/3cCHknwxpLLFPQHdJQS+qygxl6lvxWafW63tMDA/yfAxTfQrsrFoQcRJZmmGtu1CdnfoJYUa
 xHglhgPRSO2ecc0YLfQ==
X-Proofpoint-GUID: sdQBpVy97qypxJTRsUZp2qFij8_yZ9mX
X-Proofpoint-ORIG-GUID: sdQBpVy97qypxJTRsUZp2qFij8_yZ9mX
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d4ee7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pAwv9sAArZx2eUU7DzAA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060157


On 11/27/2025 12:14 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:37AM -0800, Hangxiang Ma wrote:
>> Add more detailed resource information for CSIPHY devices in the camss
>> driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
>> that is responsible for the PHY lane register configuration, module
>> reset and interrupt handling.
>>
>> Additionally, generalize the struct name for the lane configuration that
>> had been added for Kaanapali and use it for SM8750 as well as they share
>> the settings.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  11 ++-
>>   drivers/media/platform/qcom/camss/camss.c          | 107 +++++++++++++++++++++
>>   2 files changed, 114 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> index f9db7e195dfe..157e946f67db 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>> @@ -684,9 +684,9 @@ csiphy_lane_regs lane_regs_sm8650[] = {
>>   	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>   };
>>   
>> -/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
>> +/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
>>   static const struct
>> -csiphy_lane_regs lane_regs_kaanapali[] = {
> There is no such line in next. Your cover letter does not explain
> dependencies.
Will do. Thanks.
>
>> +csiphy_lane_regs lane_regs_v_2_3[] = {
> Best regards,
> Krzysztof
>

