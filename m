Return-Path: <linux-arm-msm+bounces-102384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFHYEmgF12mdKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:48:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D813C552D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 141BA3008D30
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 01:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B260D3191D8;
	Thu,  9 Apr 2026 01:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HN6dFC1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjjudjO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7A2D592D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 01:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699301; cv=none; b=jnhtg/TNvFfyDj6xvpAeKtcvxABhynwRsvaZJ4O7hlPd9gTbmikSvt3Ht3rONA2pDV6sZk/snAMwtoVs2QBgCJ5aEc/hDSd401ll8wf5WQlI+87GZsQEjGeX+RiUzlqlucz/Lah37Bgn4MPpApKC5rwMcbvaVVBBJ9aAc3cn+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699301; c=relaxed/simple;
	bh=h2g+t7AN4N1GKP25VhqaDWa8HerYbLPv8k2KeftW8f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaMEIRNHMPVZ0ZawNsv+LE5hIpewp5cmWJskMWYLf/DAgHCk3bloiKA080jpWPbEq6bXrnSflDOsZ27Z/PZaLaYNygc9Fe8b0rAs3/mSZbBTHidRWSlPSFM2y+ou+0Zswr+CAVudBqXMglRk/6EwxI0Iry/zfL6czduZxDhDbec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HN6dFC1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjjudjO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L2COt3535075
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 01:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=; b=HN6dFC1OsTG9YN8K
	yt19jf0A0AOyT/MnpEHNnWQc5WjjmzsoRs2Eulnj73Zx2EXQiXLncqExanNwQ6KD
	da7dckIQA089LbKqe5u6MgsArFFg/Z6rwJjLqUprfmMYoACltzIvQLAOJNWXTNQt
	/X5XQEKSLG8uhhklJN4g5S5StNbr9dgm+wrjyDqCS1cTi0AIzofC/loEXXik8rem
	OaumlHwlO3bE68qpPWUbchcC3AXRNUIeFdFeBEGydv82YJ9pJle8g0K1CKWXK6oN
	EBQviGacDr1Yk/t0ZdKXhKahGHfdhLVsla+uVIxLhAs8a+DVdwrY9J0XFrzplagl
	7ffR1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9ms1aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:48:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso15392661cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699299; x=1776304099; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=;
        b=NjjudjO+FbbNOQ7RtIH/Cop5vKESmGngil7Nu6hQL6icxbAVlAese+Q7L1kgM6YP5Q
         OPon+RYzwgPOEFaOd2EtsF1ezaE2ALBBVCFoaN0N+BkDcjwz66MJ6Ph5hbkPp7iXFcMq
         WP+ArYSkEedY5EOFcynb/DqI5q/nTPyUV48c7HuJSgnlh27fpgIhh2okAlCYObg/OH4B
         otLNyUNTw0MvDyMVBdtOwLdjlbfIHCFT9uNRByyRUJqB/PMobx5YoFaNo3IDf+ThVzSM
         mjaHTC6uvLSL7R07YiTslaDQNUaDQfKkDvYhQCVU644m0pDA2rAsBQpMorq8dA62iVhX
         FqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699299; x=1776304099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMVy6z35ZLJhTi82Sl8QaK6YUF4LfLQ2EPx4PMUuZ6w=;
        b=hdoemIsFQprB9K6rO7YIrz3XjPi1ffoYkh1+/yFUqFi1CNsKXDEGbBRi7ZpnvEAceF
         p07P1jMlFd2azXlWPKsljMNesQ4n1bQRHSi2OTAKZ+s3s5RxHWCs7jGjYYQmxSVv36tv
         9qVrgNqdeTTml5yjWu6zk1JpxH2IlUkGPcSfPN0gGwOMzPuR7rt92xbaiBD/O2ROPh+R
         QKrEGd7PQ6G10K/eeFakYFESw1HSUb0fMQov/zNkdSgCpA/URmRuMUFzo0UcxYIeMbFU
         pny/A9Ef1/EF0RiiYN6DJKPxchHjNuljWGJTPJJuRTns5wDvHiXf3zCM3fjxGH2meaBi
         2vsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxLK59udDbr85/4NiscPhohhqPvV9o0VA3ckX0h53B/UYPsVMClq9rm3WYADR3tquLtEB8Yle3TdxdD9iM@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9o806AoWmYBJKoD0DnzGOxl+rcAOgoIBmfufl67cDiGhvdKq
	xIhUqiIc1SDVK4Vfe8U4yLIMnzjTZ/aYUxTv9zuvQzMIB5xUZtaD9pG10wR9gER5weZWp0c0bA5
	GYvRSwUHXibI1dcpAc7ivWFk6sKJ7e4u/nZq8fdvaQRgAN3iMPXoePMDJae1Yua5LkuZ3
X-Gm-Gg: AeBDietWTcYuc/fQIxxrERxNcU3mOCmbuJ61i5NeHdY+hagi2oPbQP8tJ+drV+pLDZT
	Mo/eqizhDmCl+wDppmBcdhfHZObdkvYbTwIJXPyjfwkVCB56P2eDY60Eh6URXpDjeOu3c2ZZII/
	fqz+BWmdKb+k6jwp2A/2Omy4sChtpEANT+dEpMN9Nd2YB5tmJ8ORowH4JzMdrW0Z4WudNXkRAtW
	6mapHKYIyW2WUjGAgOtdJcZ5Du3ojPvLdQ9dTTd8WeMUIh3wmiMp+j733R58jbPpghEEMoteLEX
	ODJGquOiVOiHbC9ZfA6d/BV3zKGroCC+bEeXGl6ZBajsD+7Lp+Nt8Ul+Me/xrVYvNY6IRzUfM6d
	a+utO/f8+232TWuiyjS7Qq4AgwwWS0Z0eufDL6QCBsfe1awfXsp/ltL9VHYTbiLQhSHIDkj5l2U
	FCgelzrKkPHUgf+Hj5plmqiI6cJmWmqu7Xetw=
X-Received: by 2002:a05:622a:4a86:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50dc2222918mr25894571cf.34.1775699298692;
        Wed, 08 Apr 2026 18:48:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4a86:b0:50b:4522:d0a0 with SMTP id d75a77b69052e-50dc2222918mr25894331cf.34.1775699298204;
        Wed, 08 Apr 2026 18:48:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc9bcsm5055295e87.57.2026.04.08.18.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:48:16 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:48:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
Message-ID: <5npqhtczzsxxgxbs5mxjk3bvtypcd6cytec2wlsvykjbmg3zkh@cx6axr72b6uw>
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d70563 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3yG1jlHAEcHsLBmebVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hYhJ0lljOvOWs59y0vxOi3EQ2h2565Ij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNCBTYWx0ZWRfX9tVIZI7kD9NY
 nD6skwOu2gNIAWKEmouhnjdggof6PxCmlLJ4c5Bj1JguLaEeU9htykhIIVQ2ZyANaZwo3Z9PyXJ
 5qJ/ZIRQy+VpoPTgrLWoBSaQ1Ng3phqE76LBd2+NNsiHjrgU/DFQWIh6IUKPH0VMD/kBd6UulcJ
 5yz8MEfLYUIYMdExgD8re+YtYvpf81Bv6c4RURNE4RcgfHiftnWiIvu2kyXoFwI2vC/3IxF5AiQ
 QZ1nBydfKk6K7d20mz5xSglO3LuGnmAq3rcjGEyON1lzh6cbJfSZ2rhjG+kn7NVYePTTYY+sg2J
 xRq/eaoOPYYAz+5rgUmT4FpW5OzPk8RtwvjT1Xv/I+cckTmDtNiYN5iiTtyQzNjSGNO3KlAQpR9
 DuFdac/dPUp8v4o+5SApURZ6BK2+IAdgegXwOud4qHl2fTZBa+z2DcNVLxIjGdxsidUpiYBWT3q
 ApaXUBzShhduFekhrhA==
X-Proofpoint-GUID: hYhJ0lljOvOWs59y0vxOi3EQ2h2565Ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090014
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102384-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,0.0.0.3:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95D813C552D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
> the compatible string for applying ACTLR prefetch settings to FastRPC
> devices. However, "qcom,fastrpc" is the compatible string for the parent
> rpmsg channel node, which is not an IOMMU client — it carries no
> "iommus" property in the device tree and is never attached to an SMMU
> context bank.
> 
> The actual IOMMU clients are the compute context bank (CB) child nodes,
> which use the compatible string "qcom,fastrpc-compute-cb". These nodes
> carry the "iommus" property and are probed by fastrpc_cb_driver via
> fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
> each FastRPC session. The device tree structure is:
> 
>   fastrpc {
>       compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
>       ...
>       compute-cb@3 {
>           compatible = "qcom,fastrpc-compute-cb";
>           iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
>       };
>   };
> 
> Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
> device being attached to the SMMU context bank, the "qcom,fastrpc"
> entry was never matching any device. As a result, the ACTLR prefetch
> settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
> for FastRPC compute context banks.
> 
> Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
> in the match table so that the ACTLR settings are correctly applied
> to the compute CB devices that are the true IOMMU clients.
> 
> Assisted-by: Anthropic:claude-4-6-sonnet
> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
> 
> While there is an ongoing discussion [1] on how to differentiate ACTLR
> prefetch settings between compute DSP and audio DSP fastrpc devices, it
> is necessary to first fix the compatible string to "qcom,fastrpc-compute-cb".
> Both compute DSP and audio DSP fastrpc nodes use this compatible string,
> so both will receive the ACTLR settings after this fix. However, for
> audio DSP devices the effect remains the same as the current
> state since they do not actively use prefetch — the write is effectively
> a NOP for them. The fix is meaningful for compute DSP devices, which
> actively use prefetch and were previously being silently skipped.
> 
> [1]: https://lore.kernel.org/all/9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com/
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

