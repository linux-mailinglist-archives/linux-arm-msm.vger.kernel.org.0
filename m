Return-Path: <linux-arm-msm+bounces-115823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id clupMQX8RWq5HQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:49:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0F6F3A03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 07:49:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AkYbyi3O;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hhH0r29m;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115823-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115823-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF77A301EC0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 05:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BEE23FC41;
	Thu,  2 Jul 2026 05:49:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974135AC20
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 05:49:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782971372; cv=none; b=Y9N1McSpm6Si6mv/ac9eCAXtrra1KDKPanHUr4rrnDqbQTbbLuyhD6OyZKdGoqKhQGXcloVtXCvYGVXeT8uBvFbg43W1+yCMSMeU/04Eh1iLg6ELaWhobj3K+xB3FvJDpMiiWn/MmrecfFubxRmy3Sv378SYXTm/SRe8veOAZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782971372; c=relaxed/simple;
	bh=aJnuu0wlVteHr2Uj7gxZfX8Qm64eJYYGerVwVSmxCes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFj+PoUBBew5mr4rkPy37qy19pVg5hyi3u+aE8Qg6of+D+f7wAkwQoCP041OxoEsH8ui5fV1CbXH6UgmCrUCzNeUSLCE3XtDuTXpjFpVYRjAtSBMX7Oufag4+gayeFCXstZJuunu2kbJiLW/Zwy2zxscn/hYfHYyhNSMDSzgdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkYbyi3O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhH0r29m; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624lc6I3485718
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 05:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d8sYBEuVXBBjg1Rwjktg9Va2aFEZkAw8WMxXti82Ue8=; b=AkYbyi3OZbk58kOr
	te5Wkq0Ir5KLHGtOon2VuWfjfRVYPtMHBtXco4xvObvw+7IlwMmXVO/GPFEdlCZF
	MypwpKwh/B/85UF7D4T2vJkrXjAy4LIYvw0JcX4MhIYlgyYuBaaF8NtLNKdX6QAs
	3HGCORrLIFYDeX3Uqg0iCTBZiM/HYNKccYJvbEjBTWjPisc4XcqnqUwjtBxpXOPF
	QtKPF3XEprAzRBLCo0BlZRx3xc5Wh0n74B6c4B5Cy5fSg00js9XfIRpKYzZ99VrZ
	eDJQW5caPJcVzsoVVT4q6KTsKBXG0pC3+si4MgoCGFxDkgwHMTc8542YumOfp2RH
	b3Y6Xg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98g5kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:49:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c81db324caso24471045ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782971368; x=1783576168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8sYBEuVXBBjg1Rwjktg9Va2aFEZkAw8WMxXti82Ue8=;
        b=hhH0r29mpw03ste/8Itn7Pcx/F6UCpUTdq7/iQFYxGPfXv8GAHGrBAqZnMYeJeCebJ
         lYhCvMJXzC5/NhLZyKIDNvNfL0Pc9Io+Q0hoSRtxMbe7VMvCcNcil2/ETE8ClrOrcoyZ
         B9G1b+/7mpg26QR/51qrHn91MKkMCq2qwADHLR575bDoL0FjugjnyX53ksLh0EM/tJrx
         5oHtqqvHFF+IHeHImOKtVbMj8zHOWREiOT5FMnF0B0BK2aZibwDoHGaES1FjXYUx2Rc7
         ym7HVGpfBACji+EI5imdorERwT6KZVXjQZlh/DlfRhvKYZffiIF2gV2ET492QlfRQjS+
         sXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782971368; x=1783576168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8sYBEuVXBBjg1Rwjktg9Va2aFEZkAw8WMxXti82Ue8=;
        b=BW4hy+Ur9IK9NXn5FcuTWdITj13Y5bJEtq0uBzNHt1npx/drPIOmrUuzu/0KBFWOgr
         UBg7LRKPvfAAY7CFaZwgtldMe8Rz7OITct7Tg0nsg9TNgk9QOg0KXvOQNG/FoAtNuAsu
         rT4av5UJJlmS3WXGLPzNIyRHhUhTKZVBAcCLcM0LUvNIX+b7RcOv+O0tC9CLJ4xC3BIV
         gaP2WkYyiHJ011jNS1tPr0XOugHb/6bxqras3lUd8ufsNaTlhayjOcYozODCQ2UIY6z+
         3fEgZVsVk3hpxz5YzHHHLnxg2X0n8+Apkl+no5LxSxE5DSTAu1u4GzM8b7vdad4F4H8/
         ItPg==
X-Gm-Message-State: AOJu0YyCwavXyg5QHyj/osOvg6lQT5AT7UVTG1OSo4eubp8b9nn9glR7
	lHkv3NRcc6hS1GXGQYYSZXsLnqxcuSzqXTJxwCR+sgUUlfKWMFOyfDp4aAXREIHqjB/97EIhQ0L
	JqeX3zCuBGtliJOuHEWFX/lLe9xePulQxsqkDIS4dHj8YGwj7bGqVh21TGHYhvpchLWVV
X-Gm-Gg: AfdE7cniU1eg3TehqRwTJtyFWqhcNrBNlz+hk3kDn7j09mIMNOgYanh6T1AwhGMsJrT
	JnZdMhisXL8LEZMwfita6jocYyPXd1Y8+EaMogCRQiXkJd1OJcLN+DmrfMxYbdheB4V9+ta4fEo
	ytpKPMGZzQHvBpoKpxER2ygP/3ScLJFJYg3udXWP8C15yCAkvBseSmaH/EXq/n58xoC5i6HEMyP
	rGnz07o8Q6ZdVC53MrYB34xto0y549gCj81hVJ0lkiPXnaCzmxu6GjP5WjDEuyBTk2jY30ffVcD
	j6mjNK4AlYmrxgI4Zq2F//XQjgokkuVxKh2AReAhMUnSEKPyshf2gluWFZT+1xg2jjdWKo/1A+v
	DAPh984WzY0kv6Srk+Uljpw89iFyc/+VylVbwgHbYZ25h
X-Received: by 2002:a17:902:d48b:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca7e71111emr48372955ad.10.1782971367882;
        Wed, 01 Jul 2026 22:49:27 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca7e71111emr48372605ad.10.1782971367329;
        Wed, 01 Jul 2026 22:49:27 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8dadd7sm8058965ad.6.2026.07.01.22.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 22:49:26 -0700 (PDT)
Message-ID: <46b85bf0-05e1-4df4-a72a-48957d01acb9@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:19:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate
 firmware size
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260701-qup-se-increase-ram-cnt-v2-1-0618a19f26c3@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260701-qup-se-increase-ram-cnt-v2-1-0618a19f26c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Fhc3qHrD7EkcnSdiYU4-fLdgDTxFbjn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA1NiBTYWx0ZWRfX94gPsajEFCaC
 RiGNf+GUaC8zdDSONZ9nUpft97FZoHCh7ntNDJjeqSPykBqnqx+vqjof8GLvqoxc6HtIMqUSH50
 TUEQQZEmjm38jHpxQQJ1yp/n40m4cEl9j6+6MYPjqiTsotjT5UmomWnMJNWlDkkIswem91X/zzH
 Q3utE/gAJ3/XqjXPx864KPjO0pU8r5lj7o9n36joK/ZjFJ+zk3zCekQcB3V1z9IPUv72HDQhOw/
 CRi+g9fb2xfYTSk9a+BcwhTgNI2gwNamujjfpXSSbqgjbpKfunhtsmtvIVIZ4ovcHXMgR+AJKXq
 INlm8KpZPsnIEcInE4Y6p4XgEK9gHmISMxllKJEaW6mujyQerV+EwKC8WRzKkP3DHeLNu70vkMf
 0sIKYG7KSyl2LgYvM8AN0aGDOBSrn/CFlgHTLK1UBYV19NqIN2uZ7XQAmpPjSmTba7ltkRheB1b
 pDyI/A/Ar37o6AUWY6Q==
X-Proofpoint-GUID: Fhc3qHrD7EkcnSdiYU4-fLdgDTxFbjn6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA1NiBTYWx0ZWRfX/w39bHMyTwC6
 MNkcem8Y2NHM5gySqgDVnPxldY+SD8AWTzJE5mCyL3JQDiqnKcwiUvmztKBvclGoZijbi05Dmb5
 duHO/x9Htx8jRFR8mVeDXyuNY0VrHiw=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a45fbe9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1MucfLtolsqhG_ufqeUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115823-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFE0F6F3A03



On 7/1/2026 9:51 AM, Viken Dadhaniya wrote:
> The hardcoded MAX_GENI_CFG_RAMn_CNT limit is not accurate for all SoCs:
SOCs ?
> some targets have less CFG RAM than the constant implies, while others
> like QCS615 need more entries than the old limit of 455 allowed, causing
> valid firmware to be rejected at load time.
> 
> Rather than hardcoding a constant, read PROG_RAM_DEPTH from SE_HW_PARAM_2
> at runtime to get the actual CFG RAM depth of the hardware instance and
> use that as the upper bound for firmware size validation.
> 
> Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
> Changes in v2:
> - Replace hardcoded MAX_GENI_CFG_RAMn_CNT with runtime read of
>    PROG_RAM_DEPTH from SE_HW_PARAM_2 for per-SoC accuracy
> - Link to v1: https://patch.msgid.link/20260522-qup-se-increase-ram-cnt-v1-1-71854d0b2ef0@oss.qualcomm.com
> ---
>   drivers/soc/qcom/qcom-geni-se.c  | 23 +++++++++++++----------
>   include/linux/soc/qcom/geni-se.h |  4 ++++
>   2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index cd1779b6a91a..87907f559bd4 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c

[...]

>   
> @@ -1066,10 +1067,12 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct device *dev, const struct
>   			sefw->fw_size_in_items = cpu_to_le16(fw_size);
>   		}
>   
> -		if (fw_size >= MAX_GENI_CFG_RAMn_CNT) {
> +		prog_ram_depth = FIELD_GET(PROG_RAM_DEPTH_MSK,
> +					   readl_relaxed(se->base + SE_HW_PARAM_2));
> +		if (fw_size >= prog_ram_depth) {
>   			dev_err(dev,
> -				"Firmware size (%u) exceeds max allowed RAMn count (%u)\n",
> -				fw_size, MAX_GENI_CFG_RAMn_CNT);
> +				"Firmware size (%u) exceeds HW PROG_RAM_DEPTH (%u)\n",
Actual programmable FW memory ? something which is readable instead of 
same macro.
> +				fw_size, prog_ram_depth);
>   			continue;
>   		}

[...]


