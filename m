Return-Path: <linux-arm-msm+bounces-104271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAFdMujm6WkGmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:31:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112744F9A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DEEC301E599
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBBB3E4C9F;
	Thu, 23 Apr 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxzltWmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRMNeuxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5DE3E4C81
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936530; cv=none; b=gn891IYEKEl6dIfVxl+T6gkw/AnA5vFmi4R+8qoae94jFDSmIDJscR/9/9K2FvoDCeaP3LeCTt+AR4HC3l5yM+PvKKcxaJCYogqFOcdwudUBTSFQ5SYwm6ATJjRbm4dlhO3lTahUpu4qZFB5EYtznHkASvsvaCGWIssCSsNwE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936530; c=relaxed/simple;
	bh=43DjspOXiNHJdI9+IMUXLQ/SDPiADg6BB3xMniQey/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjJjpRbEgOXdihZen5BGGm0WgwqsVkeCCMNGB+nogDsMQFjaVcxh1n/qTzh0e1/I261z0QymeRPw+YSKrM5DuznOmzzffa0Mw6+x41fp8Nx92uA9Yg7j5oTpGj8PZEG2a9Jt/Vgd5D1Xtpfwk5RpVjTVzmDaEtQ+Xh65ymZ3hrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxzltWmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRMNeuxZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uJA53413408
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cU1Q1HOzpIyUGlSrwwBjkIMi/d4z2yNRQMRgG7Now8M=; b=ZxzltWmXw4ICOBcz
	unYL27aCSC/a6M3nFeo15xeAxZzDj+UqL1/N56WvbMXXAT8pcsNfuNbX5jSV3SRL
	Z8PBbMuPmUr3eiTGt4ScScbszbs5RKph5ScdaEb44Ogr7RFQJS87G8muDdk03oVF
	qe5hG0pYCIWWY1wZuohhvukf2qhXCrspjE2GOqLOsqQqrCCW4QQtym9kBpOnmWPX
	nX4Gr+2yU9JBHrU/AweVDavcVmkFtdVldKLGWFIY0lnp3xPuWP03++3rfvPl5EkF
	y85RrOYUO8bAGHbiNwkz3CpzD+Y4fguHCkaIXhv3cAM1dEY2Cp1BW2r8unhylz0G
	TrQlnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6b74r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:28:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e5d7f4b63so13098981cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936526; x=1777541326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cU1Q1HOzpIyUGlSrwwBjkIMi/d4z2yNRQMRgG7Now8M=;
        b=QRMNeuxZ0g5a5sxFfSY5q54HSIKaiiPret0cbZSMTSMr2LF84eof5ZTCxVL0cCfCrx
         hQJ92sDMz8ikrS6WISC5mQ6tbvB2hyPQJR14Hsi8hGDA6MpyX1mIYB4C1F5GjLHWNKY8
         m7jUZ0hL0c7KaxF4vVX/Ba+fPZSguneZajFGESU+gERm+ikEjl3xM93c3m3PNGe375vu
         F4FLicwvaVFJjCe4UwvzUrNysIgLjADi6lzq+O2JeXD0ngQgFrbHs92Hi1ID3l3NDXSJ
         fPFqq/Bx/uL6GgbkViFgmT04C43uwYrmG/SlVM2KlKSmliaIbG5KDyNn//5jkeaQSFb+
         gcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936526; x=1777541326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cU1Q1HOzpIyUGlSrwwBjkIMi/d4z2yNRQMRgG7Now8M=;
        b=Ie92l52xrfriNXHTaigL2vJwCWH/O1MSKaF1nX89x25LyFLJ2UwXpTRnrrua7Ox3ZR
         mJpHFavY9ni4ya3hHvmOaZ7Gcyyf+0Qgcd1oAULgS2iifHc+Eqqq8CoAufM5Oq3sBJOo
         SNJcSCMRsZiPDAOxeoukCyxDuCFVdE9BdvAh4KSjfPZL8I5F+ZzsiprLs1oPQsUv1Di7
         cHO0vQBTgYWaMxWE1NTj4e+MnAnOpJJocaBFtPZ31drPvUbZJfbc2I3qzXOZYWrZiMoq
         RXvZjQi0I54w1hJbUkPD946PPF90QzXTVAYQ3CVnMquCm5rdnYGFMKjt+csSLiPYcafy
         DfXw==
X-Gm-Message-State: AOJu0Yxx7HArhluebLlgnHpp0i3yKq5O9mFfYoQBf/kIya9tfU3LM7W7
	MnM6+P+XXSKgEPtT4B3Q8S+GMJjn6r4B9cHqG41OHoLJmfbA398V2qhEepqs3I9x5TBlUWxF5XN
	YwhcxWgRu1iKbYYXTk8BTnYZWckETjjgQRcYK2Jiizxgu8BthAqp20HweC7IYebMQ8E8c1u+QsE
	Ba
X-Gm-Gg: AeBDievYN69xZ8SUQG5WLnlnH3VFgP0U2y48R8kwwML76GPcUX6VCrIV8wti0hTuJcC
	qP/WMRtQnsrIbSYjrCDACtZ3+8SrDiEvn3/CIxjzuGhlRPaPyAA9i5A7/wAoN9SO4ljBLlmJ+WK
	JMIsEH3wPydBf8dobFZqV+Iyy7AgLsl9iFoiNxAokGsuESErwoLlFY0h+ymqlVduna3+T3iQbX9
	0gn+zH+GCxxEwwclCrL83AsGYoihM6Vv724qxSocNljHTICHFCOKPZMV8RwYLOubKoF6s70vQ9r
	PICF9T81E7Ia+2Tb24L5U82lA54eH4TG545rCpC5x4eGTPSZSgS0YvDTODd/hH+lW9/VA3xBTTn
	SFzahIZdcOBhS7XnyiWYLtyEXibuoxzhkmWKURwTNhZBR9NcyZzXF9RNXmE/xVZ9zyOUpOso3y+
	Qr+JyCZK71ZSrQaw==
X-Received: by 2002:a05:622a:1b09:b0:50d:a92e:fead with SMTP id d75a77b69052e-50e36c1d215mr287662721cf.3.1776936526596;
        Thu, 23 Apr 2026 02:28:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b09:b0:50d:a92e:fead with SMTP id d75a77b69052e-50e36c1d215mr287662471cf.3.1776936526109;
        Thu, 23 Apr 2026 02:28:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd24sm627840666b.32.2026.04.23.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:28:45 -0700 (PDT)
Message-ID: <fd49a3be-bc15-49c8-b006-d0c34048fa32@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
 <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
 <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9e64f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WDzp8sBBVq6D_D8kXeUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MSBTYWx0ZWRfXzp3pSg0iAvze
 JAou2DlOzNKOL4plTgWyA59IEtpPO5cjPntzJOl7RJnBnGyi5Nwt2V7Xv/FqROFnzO+xrz+MWn3
 9roIm/thlhOpa13DcgjISRxCv2MMd+E24onAf2kSzPYbvw94mUnN9Hn2iaD2YIcqfAlY+8G4FYK
 iQGFtyk2e9j2/bk10FOY79be4KOdpREvoT90IxkN1kIPVYd03C51vrtYXqUXy5Z5MikI81OqQAR
 zCS/RbTbv/ERKPRfKSDMaNkK1GIy3ZUKtvdbuR35WH29KiVMJxOfhoPUJ8hocJpG9XdPOdxpZcf
 03jXgwdymZw1nN6aVs8GLSqG8BiiwSGnqpP9+aeTSDPfOtSjFHk3H2OgDwkC5KIbl/FO4M1/yDw
 UWB0LVzXLaIQDTgdAAPcxrUHmVAYixDLdarqYy2KPedzv7KsqLUiURhv7O3WlYvpBgmleoMkBno
 Z+wnK3hevseGpaUWZEw==
X-Proofpoint-GUID: xBiUvjofSb2aSGhAB5k6Xorti81wigSh
X-Proofpoint-ORIG-GUID: xBiUvjofSb2aSGhAB5k6Xorti81wigSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104271-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2112744F9A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 11:19 AM, Ekansh Gupta wrote:
> On 23-04-2026 14:20, Konrad Dybcio wrote:
>> On 4/23/26 8:35 AM, Jianping Li wrote:
>>> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
>>> reserved-memory region overlaps with firmware allocations (UEFI/EFI
>>> runtime). The kernel then reports failure to reserve the region and
>>> subsequent EFI runtime activity may trigger aborts.
>>>
>>> The remote heap node was described as a fixed "no-map" region, which
>>> turns it into a hard carveout. Replace it with a "shared-dma-pool"
>>> reserved memory region with reusable CMA-backed allocation, specifying
>>> alignment and size.
>>>
>>> This avoids hard carveouts and reduces the chance of conflicting with
>>> firmware memory maps while keeping an explicit pool for ADSP remote
>>> heap usage.
>>>
>>> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
>>> Cc: stable@kernel.org
>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index 988ca5f7c8a0..420219823496 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>>  		};
>>>  
>>> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>>> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
>>> -			no-map;
>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>> +			compatible = "shared-dma-pool";
>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>
>> Since DRAM starts at 0x8000_0000, is it intended to only allow this
>> region to be in the lower 2 gigs?
>>
>> (it may very well be for some historical reasons)
> yes, this is intentional. ADSP supports 32-bit address.

Okay, so I think this should be one of:

<0x0 0x80000000 0x0 0x80000000>;

(where we directly specify the DRAM start, which may just be form
over function)

or:

<0x0 0x00000000 0x1 0x00000000>;

to cover 0x0000_0000 - 0xffff_ffff

Konrad

