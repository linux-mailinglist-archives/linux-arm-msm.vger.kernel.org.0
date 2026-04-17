Return-Path: <linux-arm-msm+bounces-103553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP9cORZb4mlM5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:08:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8F41CEFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39C56318CC09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039A83358BE;
	Fri, 17 Apr 2026 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKxIZaTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/gDPaPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B887313E10
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441865; cv=none; b=GQexVDE9QHP8ruWSubJbWo9ujkonGzckNxk9gyFjCypBgXys9RqISSWhQ481w9PFjf7iyaTUF6BRJ+LKSTvLSinRIbUigUh8lVllyMy/426a7AGP/OIlMvdwiKCsItPzJm+QoBpC7exJgE7+AH1DQxNE8dN3yHejoID/ufJod0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441865; c=relaxed/simple;
	bh=6V7eVC2GxmE1K8IKhduq2aNH59vZ52IZmutAvqabAiw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=A05609I5CgoDTfU6rSfJwhWvbVB+Tv7p+LWZqytUY5nCJSErDRLd8bL+o43kiO3s39WLKJzW+25QI0irHfY/+P8BAQ5BAsRjiDCcV11x1Goz2hpFR+xXgAbc4ThIrgR4hl0SOwq5Kt+YWJFoW/q6jDX7f4M8zm71fzWsrp1jKKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKxIZaTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/gDPaPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4HO04068746
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+mn50hNqMsGQm0c8Bz+ul01zBPQIvWzZ6FGvv2HQAc=; b=WKxIZaTR5dM64kxL
	79L0Kn1ziGBMmaSnHOG3HGYiMoAguzNrAl6L/uzqfdri7edxsdEHi9PqgGzI5DrN
	KwLYUmyC1C+jN4MFvCI7uJki0R5Hozgq9bqMl3AT6G1jmS8iP/fKMFKiLNry9QoX
	EQkSh/axW7N18S90IjUmW2qiPxj86tX2BX7VBUJ8NERcazTfxMhoaHNH42zZDBvJ
	cOyFq1utGzIdV4pVhDDAuOLUrR767Rh/Vn0A74+glpkouB6m1n4zdVuA4L29uFK4
	foAsF1uTwKnVbS4ojlZg+L+g9SsLo2NFCoHjsNOTrTi0Ga2ndXwOL5gXUiVl8z5r
	kZjnVQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu1ffh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:04:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79798cd9b9so197182a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776441861; x=1777046661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o+mn50hNqMsGQm0c8Bz+ul01zBPQIvWzZ6FGvv2HQAc=;
        b=I/gDPaPf5IXwWZq1mDMA2jdr7fFy47OarzIZ2euTcS1kEEhV0AQhFLlrAO/zeXTqqc
         M1xW5qV9usJxHagw7yuB1rv+tJmoNYWZFk12B7p5F/Ma+gNbIPM2l4pjRFEqvWZ6T6gU
         6TT4/kdrZP3PRuwF8Qvc/RROwJFggTaD29ZmXmBasH+DzTF4p2PsDx8Ime0ZEiRdd0GT
         khh0ztZ8EpymJEIE/NkIvwWTol7yphS4/laIzGB4sjhbxGdlidtnJzR3R5lrtx5YaZLN
         JUomXHrsOMr4hBz6BJt4Yz4/SdtPpMrlZOYVYCmns2+J6ITvo2d3myVga2gNOU8opJRV
         CFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776441861; x=1777046661;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+mn50hNqMsGQm0c8Bz+ul01zBPQIvWzZ6FGvv2HQAc=;
        b=pcEXUNYxwklX/JK4/1X55uMEhR+cSCWYt7fKByDMIO6CEZSMsex9+vmZhG97UO3TO9
         huDOklEedapAi5NBlhluqoqzafr16OhzxbHArazlGpVR6WQGT1Ixqa0BWUWEBGzBgjfI
         7I3n+jGU/l4HGWTD6bZlqjUMePkhgs9YWEQ/yZPpSSt0UZUhGylh+wHdhg7abL6yEe+d
         1Ix6VuNYoiBe7cxfoU7srJNL6I6znh9GC6xydjIVipwHSeeBQysjwsj3TNRhv69UxLfl
         w586WLY9oTCVthrgV/m7nHKEg4JPLcaHWQSyBvf3IqfE8gc6XmjbbfcqahxpSnWjFYqr
         9w9g==
X-Forwarded-Encrypted: i=1; AFNElJ+GuEMSg+3BVkvliOSAwWnCEn3FngYut5mTrTGnDvlUH2mNZnnFq45cWbUxMSNj44eLdwvGo3tihsPKcVn1@vger.kernel.org
X-Gm-Message-State: AOJu0YwXv7/H4AaULHkrgNNsWWq46Ci4Sm4M3mQVsDIN9qet3dkYk42o
	LhR594e8xC7azMHfArZ5jfSZR5hTwlnwQdEZRIvM3u3sBgH3pwecGnIv82wVNtVTNIsp25p09Sj
	zscgn4zLW+KZumGSPqyLPxm2cfqUHeI1mU9Q5DDGMrZlG4VuQhFoHeQGPrBDMC26sBbDX
X-Gm-Gg: AeBDieuAzjzlNuOluygQpXLdq8Da9JmnAWiz1ji9KHhM7alePl/te3xMUdxEHYmPAPs
	boU4uc6UrEdNYLJ91YDGP4uZOw3S6aSd+IniiBhWcNMYNlhToBx8AL8I3Zs4V5/hDWQYBkCiT6C
	6XKbr8FVCxBIt4nt61FZLNQgxsEhH5c0cYj66WjKLA7BmIHhxFzeu8BooOHwnDeHUZxSkq3z0+x
	oOKxGB7v5SEoKRP0hfK8ehtW48jyIRKNUDDyZDoVut093VGhVKU0oe+N7EV31pyuPLkmaxOuRki
	Xqoxp3kzNwzeeY5E+6c/2+aDlrXoCuQIizQH7RX6WLURf/FzlAtD+fdBpeBOWEhD9kxDEpeoKsS
	mopyDP0riZ645rSa1nnCV0GcFE2UxareUxFRISaeFma4e9FnuOYfA4X+5aR1DF+qu
X-Received: by 2002:a05:6a00:4b01:b0:82f:390a:69df with SMTP id d2e1a72fcca58-82f8c8d616emr3650555b3a.35.1776441860909;
        Fri, 17 Apr 2026 09:04:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b01:b0:82f:390a:69df with SMTP id d2e1a72fcca58-82f8c8d616emr3650474b3a.35.1776441860173;
        Fri, 17 Apr 2026 09:04:20 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d6adbsm3256264b3a.18.2026.04.17.09.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 09:04:19 -0700 (PDT)
Message-ID: <54a670dc-4792-13eb-4240-29bc3dcdb33a@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 21:34:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] media: iris: Add power sequence for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-8-7d3d1cf57b16@oss.qualcomm.com>
 <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1de1a366-a325-428e-9dcc-1333bb85ed82@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e25a07 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bWAOSzAfB_7jWjvagxkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 8tmqwvfEaiw3L824W8l5RqNpL53-Lffi
X-Proofpoint-ORIG-GUID: 8tmqwvfEaiw3L824W8l5RqNpL53-Lffi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE2MSBTYWx0ZWRfXxJWZ9XatJY3w
 Beel6vs26d2amSa+gCmHaVezv22CpXJchAbL/vH7DFORqbYK30wv8YqfGfst5QTwAO5HZox6NBS
 Hxqq/Az0wyvsg3Q8Abf3/5nUbLIJRqBvwolOxGdgSnx5YPI68ddg8ZVMHvZZEYaNITIRazNF3hC
 licmbDbJ/tgffKqc8GhFFzyYqrRczU+11dclf85yDkTp5r8502AXGRuVhxGi5PLNcTG3duaO+m/
 /1HABnDUguqapyIleIkmJJ0Hce3oSFFPKO0jiP3UoleP6SLKvHnkfk3F/3GNqgVdqnShfD2DLOp
 L69YhI7EosObunqgh7GFWBgn86SC0UH2UxtfH3NJg0Dao1XSkaKu4ZVZETcEFb5bF0bAslraY0w
 A7O49OXalN20BVnRSRccYsH6KTqA1KRwJlfmkK9xVcMTMcO23tgdXLqF/w8Lbjtya7R1nsNgx+F
 jMcRPHRCKILkKrC3w9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170161
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103553-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60C8F41CEFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 3:19 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> Add power sequence hooks for controller, vcodec and vcodec1. reuse the
>> existing code where ever is possible. add vcodec1 power on and off code
>> separately which has different power domains and clocks.
>>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |   9 ++
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 123 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>   .../platform/qcom/iris/iris_vpu_register_defines.h |   7 ++
>>   4 files changed, 140 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 30e9d4d288c6..e3c1aff770dd 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -61,6 +61,9 @@ enum platform_clk_type {
>>   	IRIS_VPP0_HW_CLK,
>>   	IRIS_VPP1_HW_CLK,
>>   	IRIS_APV_HW_CLK,
>> +	IRIS_AXI_VCODEC1_CLK,
>> +	IRIS_VCODEC1_CLK,
>> +	IRIS_VCODEC1_FREERUN_CLK,
>>   };
>>   
>>   struct platform_clk_data {
>> @@ -208,6 +211,12 @@ enum platform_pm_domain_type {
>>   	IRIS_CTRL_POWER_DOMAIN,
>>   	IRIS_VCODEC_POWER_DOMAIN,
>>   	IRIS_VPP0_HW_POWER_DOMAIN,
>> +	/*
>> +	 * On Glymur, vcodec1 power domain is at the same index in pd_devs[]
>> +	 * as IRIS_VPP0_HW_POWER_DOMAIN. Alias it so that the Glymur power
>> +	 * domain table is indexed correctly.
>> +	 */
>> +	IRIS_VCODEC1_POWER_DOMAIN = IRIS_VPP0_HW_POWER_DOMAIN,
> This feels really fragile..

I'm thinking to add wrapper and use the power domain name to find the 
index from the
platform data instead of using the enum values. I'll try this if that works.

> [...]
>
>> +static bool iris_vpu36_hw1_power_collapsed(struct iris_core *core)
>> +{
>> +	u32 value, pwr_status;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> +	pwr_status = value & BIT(4);
>> +
>> +	return pwr_status ? false : true;
> return !pwr_status

Ack.

Thanks,
Vishnu Reddy.

> Konrad

