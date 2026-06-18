Return-Path: <linux-arm-msm+bounces-113691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QQkaEyZ9M2q2CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 07:07:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F70A69DA22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 07:07:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ZW/4EAL5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IG18Y1n1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113691-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113691-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 757A9301112C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 05:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC0A37EFFB;
	Thu, 18 Jun 2026 05:07:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDD37DEAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:07:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781759267; cv=none; b=BfxiHmhN8A2smPctC/GzNhcOEUwqfdjhrDZk+Pq+XQXkmIH3//DYlaWsGH7i1+jqomxlrPcKMNa9cNRpSU0gg6XZg/ntiKPpT56AZHC+IFTQvQmnfwbXpgU6dyg8O79GuX4nvlj6BHw0TBIG+GjFH/8glDQfmECtHncSiaIdPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781759267; c=relaxed/simple;
	bh=B3ziYdbDhd8pejGixMLf8xvt1EMsUg6EN4/WBF/GqmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjtjyUzRkN4P6gBcs0R08Lt9rP/en8eKk9ZRD95/eCPmymOwrlWbpMvWhw5vbKw8S75TV7xjs0jlE69F7DyUcRNhpFu5SC4rhtLuTN9B0tLyNuYlNrGi4mktFBgtJiT/W5NDsrMPhSWS84sbRfijdZ+eKOI6eXB7+MSZJrWuiO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW/4EAL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IG18Y1n1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I531BW3061728
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i9/tMblIXT/+IsiJVmvct5WjsscMVhiD/oY7oGSARsU=; b=ZW/4EAL5LCW6/DDf
	CQihhQ5N0xu18TgzoeCwD9+Szv+fMWrbnCq5Fg3EY+U0Rv90LxIBIjs/pYYWOlRT
	9Z0WNigW1l8FKMBZfDjwdsuMUXy+I4qkijdct/9b8G6agaGvHOCjtGeeOGLDg5iJ
	9VDCfgU/g1mUDXCqKubplMx9rZDBTnF43UUYUwMyzpQ7Xf/tSOVJmwWyWYRUepFh
	AUMfyOVSL2ohi8W9rA2jhRgFIUPTGlYJbUAFAS5AxAYUWqz4a/olTtrHz4JkUNQR
	Zn0TwyvsZOEWtgBGaAlIbwcjHxa3Rjz+NVTcrVw11ETKrDGaGMViTKEN6ApPPTV1
	nqKg+A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm1w0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:07:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304f23c55b2so526456eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 22:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781759264; x=1782364064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9/tMblIXT/+IsiJVmvct5WjsscMVhiD/oY7oGSARsU=;
        b=IG18Y1n1IfhxO2ySjrKXv6xcLjg3uSmu1LP3lGpd+SIS1EJuudOtBZALb1JoM/1NtL
         RcfWoiiFimqZL4cs/HoYRWy4we/db8uVGVs8SlvLBA/wArDNXWY4ydQlWrRebEcAGkGp
         ZSC0GZo46UZNKS+OVHTMHrFdMi5ITUop8uSKoJR1JzDMvJOqp/iskofaNdu3tPprc7bX
         Ut5/0DtmxTjmRpWGWscwZ1K5it+2aSGG91av9CnLKMJ9podSIXgnXp2uWGGzX0s11ev2
         Mf7U4hjpfE5wmbbppSSTfJhk8EwRnO4pvto2fVGFhFSIhrm1KwyrS87wZ0fcnUjji1sI
         UnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781759264; x=1782364064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9/tMblIXT/+IsiJVmvct5WjsscMVhiD/oY7oGSARsU=;
        b=PHp5klbYoooo+Sr5kUSJRWsarpywSY2KHmiB7H7yoaY4HB8hDmWc4K9seMAosM2H+I
         a4HAIsasPj2SUDpXWUopwvZKllHMBddaz2Ze4TdHtzKFidTCrJgNxHezCc8AEZ9VQJ3F
         188RfI0D5joshRudvtS6rSjx0DZVAcwIbw9x061lU2dw9LDtaOixFfgaTUXQmgeOHDQF
         nvrpJT8xYyVVolEKQalk4jIrObYNw8m/Qo1bRaPH3dXFDWHRgwpeOWasqVHyi+mpH3Ff
         G2W5sEeYdDoEEdO+VYEZIqpf9OejVqK9RpvbckcChKS+WUF5PcHNb/ZFknQa+GncuNw+
         2wQg==
X-Gm-Message-State: AOJu0Yyu3px7YpJkbnHqaLzmQ2sOd8mQ7qcP10zMamlQiWoIEDEmxEGC
	go9LuEw3gxLCvo/2t56QngL0mdoDLIEYsf6k+EtpZevA+WCxAoKECfRALCb5uGoNVfU6nbc54Ru
	ptmbyrgN8ueMoC2uWtV2pEhfqaW7zZDqltPzecybNs41allCHhTWASFcwKD5+S0BA9GRz
X-Gm-Gg: Acq92OHDTjnKnmeQe+/2GQseUKAMykQZKYq0q2UtiGdrgja7UOSZUESI1MFi0SfvHGs
	xxrXTb/oxF14WQhsX8+/DzZNRh51UkcNZpLcpbtIKVW192b+sDazHCnc/bK+R+8cHTupaExlp74
	FbvxYEftub3x9hN0BYJ6yCDOk/KUL0k4Y1pngAsOxESRj4lqqdTIzbKF00HX9oIPhsL9Zbz4jbv
	eXhByKCofnPpTlezAYk94JH+OzZ8YdVCLHuSLu1w5GRxetuwqqCrAOTCK1CG/Qk4I3S+XB/RiKL
	6ul/YpyO4DmCHg/mpkUVHwnl/s2nW15sjTrmpEDLrRvoaDLD+xKZ7u4LDp9ZQrNpyK8ZHrFw8Ff
	FjgevH3+JwVuruHomPbBkRbdHIleWaABQRsmsAWj3PlQ=
X-Received: by 2002:a05:7022:3d8c:b0:135:578a:cde2 with SMTP id a92af1059eb24-1398f6f4707mr2821603c88.34.1781759264415;
        Wed, 17 Jun 2026 22:07:44 -0700 (PDT)
X-Received: by 2002:a05:7022:3d8c:b0:135:578a:cde2 with SMTP id a92af1059eb24-1398f6f4707mr2821569c88.34.1781759263833;
        Wed, 17 Jun 2026 22:07:43 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.107.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b910c51sm17780940c88.4.2026.06.17.22.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 22:07:43 -0700 (PDT)
Message-ID: <d2dd36cc-c5ee-49c4-ba5e-7ea0e76602a1@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:37:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
 <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
 <d4d01a6d-4c9e-4822-b0f6-b98e8ecf34f5@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d4d01a6d-4c9e-4822-b0f6-b98e8ecf34f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA0MyBTYWx0ZWRfX8nDN3WURFgUE
 320tUSLIoFp5SXvYFWg6VFPE4UbWoYmbeXepGmV7kv+EJXbOIl3ZXVWsGl21qzu+hRgA0n5ed7n
 cI6OfBwFjaszKocdAhqRiuYzpG8xsfK7tWsElzSbSgSI7JciYyHen2I3WrOpVAPfmMfTeomh4wv
 VDHrQ/8N5rXcBs7nKeos+9t7oU+BqecxJGhXpR53Mk8ZRHklim9vvoDY1A9NV74HknbutYB3wj9
 yBIfn596NebvQCDYrHYudh+SHfQyt4gdI5H9h5LtbjZI8YGMn1rbidLK96CIq/4aM9QamLNl9EA
 3I0LEyqqaHcc4pcZ+jlLaKzktyAssLUjS7340Zgge5O4bxj45xm79P6MyhKPHMqLO/YPq8hplSD
 x8MlnzXdKESOj2LFMbwW5h1ozwZf01Cm9VxnDayUS7m6GO4jAoQR9mAdu23Lfheu/JZJpWU3wyu
 xG/s9yIqSWkmTfRtvkg==
X-Proofpoint-ORIG-GUID: P7mUutDYQdpf8Oh6MLjMIy87Cx2LtqBt
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a337d21 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=6s0eN8wnNFkjVaM4b1XlIg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vRCb6_dfN601Ubi85e8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: P7mUutDYQdpf8Oh6MLjMIy87Cx2LtqBt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA0MyBTYWx0ZWRfX4PhQ4IZWNU3W
 FsQKyFaUKY3JsXfQWI65K9JAdXnSGD6BkINz7hy9U7AwLE8kcgUoV+ULTz6NffRZBZ7KvXH+nUI
 OBHzrovvjsvq8FbbiZRpu4eo13QZHIc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113691-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F70A69DA22

Hi Konrad

On 17-06-2026 16:35, Konrad Dybcio wrote:
> On 6/4/26 8:50 AM, Praveen Talari wrote:
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power
>> and performance protocols.
>>
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power states(on/off).
>>
>> The SCMI performance protocol manages SPI frequency, with each
>> frequency rate represented by a performance level. The driver uses
>> geni_se_set_perf_opp() API to request the desired frequency rate.
>>
>> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
>> is obtained using dev_pm_opp_find_freq_floor() and the performance
>> level is set using dev_pm_opp_set_opp().
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> [...]
>
>> -	ret = geni_se_resources_init(&mas->se);
>> +	mas->dev_data = device_get_match_data(&pdev->dev);
> This really needs to be null-checked

Sure, will add in next patch set.


Thanks,

Praveen talari

>
> Perhaps also the functions within that are called unconditionally
>
> Konrad

