Return-Path: <linux-arm-msm+bounces-103531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC77I7cz4mkZ3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:20:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05141B902
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0645E300B875
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A75E383C84;
	Fri, 17 Apr 2026 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeDMRh1b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fgu1Wd0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452A346AFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431961; cv=none; b=DH+APsFUVQYA5HDcRDW9/FpNqvDh7KaRBzKGrnUJCMIxa8l3lqoLm7INp0Sd14f1lL8dWVD+rOz0saN4HMId0Gchec0z05/n5r5TojoAh9vxYZZ+jBUbKc+9AyYkoYmbxFwbm3O5CkKWPyjQCJtlupvt3YkX6HmiCkKJStmjOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431961; c=relaxed/simple;
	bh=ggu3fcSLSVC/gwdrbugVRpKevQRxWEyEWuPI7XNs4ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsUsbGKxH4hgaCviy+i/C9luDvuh7fgh8Gu+1EwkpNOHpkk25n1G01NbYNPgaKboPKE6e61TjNz/1J3SK8ymyNFq5JRIlv0q/xKU8m0zHcjC05usZu7Lf0nbyLBMKcyDShs5HNm9Ic4sNZcHu29weSaMZLpm/JQkezE1InsiS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeDMRh1b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fgu1Wd0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCAfEi727591
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=65UkOtvjXCQohOax2I90x+t/
	26bErWcIiCCRd9m+28w=; b=ZeDMRh1bWX+Thw83zvkx4Cii40X5zHeb0L3A/04L
	wZhwzTVRcOKJS2YLayzImsKvZUGfE1qYFSJSbexWCukq833w0cQm29m07IdJjdId
	d5vAlWXCf0kYnkT42ix8imgM4dI+p3CTjGqaKLGUd+2aUy9cqRJ2qOaK/jEvZh2t
	ZglQlJFW3T0pC2VoEZooeIdnmqrFIQ2tNyWG+gukRibjNiIzbXUOAmJRrLgv8Qkl
	ohS2omqSlclg1Zu5nvGMCt3VvOD9pbpWdBGF3JDUQsMO3KdeJARMq3Dvdzz1cjjN
	U5yqm14mhf8zuBlAYGIRV54COsY1+SyYNqKYHeWqF07fdA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqsdfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:19:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dbe11b1f03so1438032a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776431958; x=1777036758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65UkOtvjXCQohOax2I90x+t/26bErWcIiCCRd9m+28w=;
        b=Fgu1Wd0h2YMdmfwQR+GANsnG4arGmKlMGuRmf36uIuCIGz2MivTrK0GxrhTu+cSkBO
         zGo59HxBkQ4fN5Ly/lD3zV/XWdQCYp6+E1dtvEfI45zOIYAzABpLSSun6sT+7v+iM38x
         r8a/2Rc6Tdr3Y6WcBMx3D5RRXUn3IIJM/r/3qyINySPIQEnbaJ0/tx5bYtoaFSPSIb+j
         M7WwtlfYwkjgtB9ZWmrrhx8qLUegmRr7Se4M9Mg0ZVcxBfGP09fASc31OHKdq4q5yb77
         eFD7PhiCtzdCaNGHayFHK8TCQqJ5j1KzPWqYJl+o/TagArmtYm2E03IQ6fLLVOgT9Mxw
         Bkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431958; x=1777036758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65UkOtvjXCQohOax2I90x+t/26bErWcIiCCRd9m+28w=;
        b=qbpIeJVua/1rUEKdvtutLaYWKT4xk+fpp29d0f6xNTe06yWbmgU8ZuDQeTfHPCMtdK
         mg9z/dfhnhAWqplpLDy0lYSt+AyeO3s/ydlPokZeJfH29nXeJ8oIeqCtbGmfwjyz8YYE
         nfEBNa0jR3XaCbJK1XqM0/PPNzzBAIPbrM/PsXeGDMApYfJungIv2BLz8rm8Rl1w9zNR
         T4aAaN5jXpRGyVdBxPm90YUswzX1E7uwmPXrSDyBt3N0eq+xq5UuBDHPfmgY+9dwwKwW
         cx/YxZsQ3j3mmWFdwBL8A9WZCeLJMxK3fwNxHG/m3/TXcqBRrjho76uIB7T4V4Klz43o
         inig==
X-Forwarded-Encrypted: i=1; AFNElJ98d4nT6WfQwnSIAvQyvRiAPOJaAiNicQJ2LPyiHFPeUFe5f0LD3+SV2q9JEDU6KK5238Qdsf91rSzCZ6c8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41P7e/T4+Qe4mvYonQeoyvJplTsEl11y5M8SL2ou8R6XKgvVg
	uK3UYy50WtoXa4cjhsVCsrBnO5ms2JzCRGayUELmwgZw7RRlZuk8ifugmiTySfH68+tjt8Lp61v
	OcB4KC3Q83apspDaGbFC8U6HYt3Wnkz5YC8BumxQTcGrQW0HnC2/qXKIrdWiGQxLvLirO
X-Gm-Gg: AeBDievafowGyOOHav2Qg8oOJbftkkBhxIFSCjz4J/qZSg6M8yxd68JXlKKFvLzRj+Q
	qExMug7jzqVIqzT2ynIFNH0HCkOMbmgGdjK7NEAx1r8qRpG5G/mau6WEuURKpQvQtAUEkZcntlx
	e1Qrej70o1JOsmGL5wHRYRTWeQXpETYYRSv43XVDP3gdU2e6Xx+8gIs91nxpHbmpwEr9PK2Ny5b
	NJZPZ8WywJvtFq+Uq+i0LidnaEvqXWNt7WshUNHBOxDNDxGz5NHmguaeIlclwpb2TRZm2AnFQwF
	1KJvvOq4e/dLWHEzCDlHC/pF9RVnc/9oLvdmRHNwWJzd6EwdTAZgkxzSQVh1J/I8JcujtkJnn5C
	ZdRfgvoh/JCGyHgUsuVXEjAXjWL9gS0UFv1HT2CIevaavBJ1lShZ6NkythwLRq2iiIhzemwwwYg
	MjYQ3qmt1habK5CAzd3vev5zXeB8Ig8cJa374tJmpEIi7cBQ==
X-Received: by 2002:a05:6820:c85:b0:68d:9ba5:de20 with SMTP id 006d021491bc7-69462e15f9bmr1443904eaf.13.1776431958416;
        Fri, 17 Apr 2026 06:19:18 -0700 (PDT)
X-Received: by 2002:a05:6820:c85:b0:68d:9ba5:de20 with SMTP id 006d021491bc7-69462e15f9bmr1443873eaf.13.1776431957807;
        Fri, 17 Apr 2026 06:19:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb740f71sm3559701fa.37.2026.04.17.06.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:19:16 -0700 (PDT)
Date: Fri, 17 Apr 2026 16:19:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
        Ninad Naik <quic_ninanaik@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible in ACTLR
 client match table
Message-ID: <yel34g6ugumgqcuhe33pzaaxqvmjcdakdg22wb53oq2snpbb5v@6wfisbcwzyvs>
References: <20260416152652.958229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416152652.958229-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzMSBTYWx0ZWRfXxvlYF+W0mfRW
 JEPoLb0E8B7ISAxwi3pD5MRF9AEEwHUhSCC2fROSvn+8s1+7NDrqmxpP1H1ISA/yTPYweZz7NoJ
 loVZoVCltFLlffFuWVA++d7sQtZPRRaZz4a9XkZqtdsHZLbinbptf4tg3Mvt2m1KkY2UsSEWv1u
 JMfASEiUiy3/PhbHfnWtGrCFqIfWKzZAbV4p98EaeXEPJ4QoUUCQZQHwqoHxtteZWwqKDk6KVHN
 5d0KO2k5gbBhJ99UYm7uh8oMJPvI47kjLawt/Cf5mdhqQeI7s4Sb7cky80hoUFh9ZF3SRSRejvM
 BZWWntNpQKywm7pmPKBSmA+UM+Ux/SfpQD+1sn6B8R3bCEsBHxXdTyClaW2mTicPUmHmC6W3kg5
 fOyqLTXbN2esQ1N38d5aNb4K8oHwFN5JSDw5lYFFRr0Bv6U5WyDig3+uuFMTeApx5x3K8wNlWAp
 NXdb6FFZzogDgW7WVoQ==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e23357 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9JSiRKcJkFx5kB4R2d4A:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: tr7aIBcd_EhkYdEehvdWiDY5sXND_s3D
X-Proofpoint-GUID: tr7aIBcd_EhkYdEehvdWiDY5sXND_s3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103531-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D05141B902
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 11:26:52PM +0800, Shawn Guo wrote:
> The qcom_smmu_actlr_client_of_match table used "qcom,fastrpc" as the
> compatible to configure ACTLR for fastrpc SMMU clients.  However, the
> "qcom,fastrpc" compatible identifies the fastrpc transport (glink)
> device, which does not have an iommus property and thus never attaches
> to the SMMU directly.
> 
> The actual SMMU clients are the per-channel compute context bank (CB)
> devices, which use the "qcom,fastrpc-compute-cb" compatible and each
> carry their own iommus property.  Replace the compatible string so that
> ACTLR prefetch and caching settings are applied to the right devices.
> 
> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

https://lore.kernel.org/r/20260408130825.3268733-1-bibek.patro@oss.qualcomm.com

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index edd41b5a3b6a..2d006049dd61 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -39,7 +39,7 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,adreno-smmu",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> -	{ .compatible = "qcom,fastrpc",
> +	{ .compatible = "qcom,fastrpc-compute-cb",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,qcm2290-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

