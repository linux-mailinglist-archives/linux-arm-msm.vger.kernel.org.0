Return-Path: <linux-arm-msm+bounces-104227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOfPICze6WmNlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:54:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88F44ED31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CB343063D7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD0C3DE432;
	Thu, 23 Apr 2026 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHvykJcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvSgEQlj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF80364024
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934256; cv=none; b=B0bhWCs1JavMVBTbX5bhGxYjzQP+M53zAKQEFEcj8QEptfcPzvEe+omN8UTXaRUaIg7F0bn6EEDvpjV2eLD4ewxCWrTMeBU9lc3kIkfKWwrctogJj0EnCNOvq8d+BzS0RCMXyJV7tHVG3N5GRQFDE4BdOXX84KqPDsUmtOcND7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934256; c=relaxed/simple;
	bh=TaRFLsaB+uCdy6/Ybg30L74kgNjYEqc9+CZIoq+2SuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khREEkMxmBpvpbo0++cYFPq1vHlYHWslGF5PI3hJC5LASeARUE84/SWh+XJ+nYrUAlB4bgvj9FG87CcU7Aszi5ZhLrOaXakn/RWFauuOo5VmXMHgPrUbDu8Z/0zzmekJFoe628uW/z2NUXUkA542fqZ9TcScBKczD7uOalxHpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHvykJcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvSgEQlj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N4NFkv1218628
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rm3WwHocTxr9AOinWei4IBwaswTjfmqTJZrZM1lfrG0=; b=FHvykJcRiJJ1/rCp
	pp/HXEZwn/FRZm+x/F3f3xINFLxNLR13Vjmd0qAGUwZmrIimUmZkyLprf6V27QFG
	M25W74M7HV9APPhRdq7/DyLTRccWP66VhpmD6XYKcfZ/gXyfiDKGpZ+P5gS4sgRl
	E8K/YP/0FG0lei2tRlZ6EzVMl1zKRW90XYB8N5aRMtR2aXl/8qhOaPFPNBqBh/91
	k5jYSblxLa7l1XkNsXmOO0xQPb8N6s4eBw0+5clF30tUv1vnlN9XsTeW15ivfg7k
	ksDpDq49whduDeHzC/qhp4w2+A9XW5s/4ThfouUvNvoO2hDbDzRmmu8DkGbiWKBs
	Ijqg1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282twr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:50:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so8970301cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776934254; x=1777539054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rm3WwHocTxr9AOinWei4IBwaswTjfmqTJZrZM1lfrG0=;
        b=cvSgEQljMDeyQhINyD8XPLQ2wN3y1GEK3VbW5b4WvAyJxZys4Z6znuxjNvcs242Dtq
         O19VQS2vTTxjJx4PyNUx5brT2L8MQPFr4fD17gtCVZ0XleuwjKogjhHDK82vAZcemqC5
         byDvqoPvujh4rGkYnguHevhJNwS3I5v5Odtkkpj8kWx5ck1kvMgr2yc29SUMFzjSlLFu
         do7qRUNsf03Wrb5IZlINqb8Hoysw0goVJ0igt4ArntbBDTdAVN4mTMPW5fEeIsQe/jrx
         gapDG71gxIiio1YiysawX52UrQC87g8zovXSFf26imcXdC360RhfzxmTR3EryxcwZ5NR
         usuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934254; x=1777539054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm3WwHocTxr9AOinWei4IBwaswTjfmqTJZrZM1lfrG0=;
        b=N3a9LKVo1C59xwU7GeWYTjAgD6nTn8fSfbykRd27Vb/J1EPjIdB0Thx/+doxEXkcHm
         9umh2fPZxuHXnLMw2eXEUMuClqe7XAMYmJ+riZnsDd9qUib65Px/wCd+pvvnAP+kWxEP
         jqLTCuzloL8YfBA7u8TkkZkP21ZPHRXuEVrpUmichnFvM524/tmQm9UvXklDmxQIHjk8
         LMuDdvqpsYpW0eSaVA4UHynudNnE/NUVnh5ZM1Mu9UEVjY9CUrsYA7EfKME6P9tCSvKA
         A8UeKZmSG4hZhCanvaN0+2CCJKjHL51oU1SCDdKgu/byVZwDG46zDUYS4R6FjnvyQqKA
         rokA==
X-Gm-Message-State: AOJu0YwZ9cU4nkZtoKJKOEZ0MhNPPwJrzX9NKawG5N+PF+zrwjOpJ09X
	fu98qTu7iEHqgk9BZeslL7owpCpgVFKKuGfuZgYzkQZDqiZgPW3vWd7WzppvBVl/647wUD6K28d
	H6O9jKSJaLQ66MgVSD60G5Z1g1NL3lqhZ2WLRbTTyrtMxg6KdfzvvxAKeJ8ILAgcQspzd
X-Gm-Gg: AeBDieuxy8xzOPptB8+Z26xeZ+enCMjWKp8iEpsR5om1OIvzdEpnh4V/dKk+vbDiG36
	GfK8QKULBSgt1e0EXkBcobEj01L8nMJSzOGaDCTOEitAunhtBbxemB/Ny4UXnGz2WqXk/QcLC4I
	EBxJ/wBMQrm0hnc7gXuU7o02eHuq6lFWLe9XoAaqJSJVkOesKjd1Xg/f+prU30kRcWIV7mMblSm
	UK+yLJla37jac7r8758hyXaJzqkR5kozP/9csZ4qxC8+jPzteqnuy5YG3zoRx5IPqGGw56UO+bv
	X4D2pmCm9mwR3EX1FdwWoDaR4SVsjMFZ5SNfrONN5Jdh7eE7J/ySI6DwDx53drh3agqE8t8jGs1
	IMu/DvHN2dts8UBoz336ne2S2Cp6p4rt2u14Pjbk9dWU9+YV8x08VcqpVm2Gs6a9xWL8mgyESv/
	9rI46fAbJiwEFvHw==
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr169975721cf.8.1776934253748;
        Thu, 23 Apr 2026 01:50:53 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr169975491cf.8.1776934253275;
        Thu, 23 Apr 2026 01:50:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553223bsm635852166b.55.2026.04.23.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:50:52 -0700 (PDT)
Message-ID: <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NSBTYWx0ZWRfXwcxLOfYxRLwk
 +WK7FFWFqpaapuCrJN4h9S3dYalwYwquCYxyV9O/WZmBswnzDbpz+iCNEINPh3APtuXoJBjzLBD
 cGktramVzjZGrtbBuOCXSUfs76rd+coMfahIzbLCrbh95Bgkg7rnL85y2HrSt2sSRsGV/tPnF3t
 frrpo41QWEjjPcQW+jg6xc1tq9ah36AMO/VsVyn4ZN4BY7O6ZTmzKbOIho970Z2IhBXEwOymdkm
 yNMnBLNIDtc2gbPfPHS3QR0R4PfLzpeeXR8cz0PjlU3qOq6ofS6ol8a4d3CR/WI7R3ZUcz3EMrl
 AsE+5pgUecL7wZnzI0/2KrtyKa0uy/k6rM2wV++5uXLkHVlNbIo1LwplxHWkrB4hSkxnzrpZq7l
 ix7HbSiUm7H9Y4suo6Vw+42VUFymQHZCjPGbrDGHYjl3UUJmDvBtaFn7Sd6XzofayQuElpnsdT1
 zIkXrt4WxtddnD38C7A==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9dd6e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=avSy5VQ5IeNpoW7ryukA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ywQwu0XpkT1fhKQtnrsGHZb0M2qtmkaQ
X-Proofpoint-ORIG-GUID: ywQwu0XpkT1fhKQtnrsGHZb0M2qtmkaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230085
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9c900000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,9cb80000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104227-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2A88F44ED31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 8:35 AM, Jianping Li wrote:
> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
> reserved-memory region overlaps with firmware allocations (UEFI/EFI
> runtime). The kernel then reports failure to reserve the region and
> subsequent EFI runtime activity may trigger aborts.
> 
> The remote heap node was described as a fixed "no-map" region, which
> turns it into a hard carveout. Replace it with a "shared-dma-pool"
> reserved memory region with reusable CMA-backed allocation, specifying
> alignment and size.
> 
> This avoids hard carveouts and reduces the chance of conflicting with
> firmware memory maps while keeping an explicit pool for ADSP remote
> heap usage.
> 
> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 988ca5f7c8a0..420219823496 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>  		};
>  
> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
> -			no-map;
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

Since DRAM starts at 0x8000_0000, is it intended to only allow this
region to be in the lower 2 gigs?

(it may very well be for some historical reasons)

Konrad


