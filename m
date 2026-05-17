Return-Path: <linux-arm-msm+bounces-108061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ESSIVgECmp/wAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:09:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F07AA562E34
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E45F330088B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569CE3CAE95;
	Sun, 17 May 2026 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6cjXfGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrhmLrGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24B2E7621
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041366; cv=none; b=n5YRxOD2IG57DTpbpYDKtjri7fySgWiZ0SJJBuQRkpDedN5ziKwpiEPM49Xrfx08hTZFUn4rSX+0K24e/ZMCao19VY7Zgn6lhFuWsYoYg70x5nVIcFvuRV0zBvGQigHURGax2ngdwouGjQ8B8gOUSiYIwtJKMcSO71enPUZvCCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041366; c=relaxed/simple;
	bh=XGSlU02de47zMiiXRCeQ0fN4mHh2H8ko2KIUO8tl65M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlfLBV2IWx3Wclj7OuQGJlY9Y6mNtQ1MlTpoX2Rs3R7tN9n7gcWU25ChDqN8KBcswT4nBkj9++DfJ4z6rCRINQWmw++2NLcyqu8+g26dbWnr8a0wEYXbLTANyCUgDUA7951KvlXnQTetgb0B6JhX2tgwtv/gNaANITy8OqNF4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6cjXfGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrhmLrGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H3Zt7N2444106
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o8bqS3/TcdKkwNMqm6LLG9pf
	/khtfhDJzPrpTC6WA4E=; b=M6cjXfGXQbjZ2lF4XzbS5pXXvh1WVStBmwCK246M
	3T2ff2M7ORSO3PFFe0j15XWh3FBh4uv0g8czJUaYkCmQ8P5t5Bhp/3rYH9CIXPlT
	p5HJMDGWke8He8ncOlFbtTYkgL/NicIiY1rzBOVUn485c1QPFwNyXYeXfycDEWLZ
	xfEc8Ja3ANvI77flQ7YHM5RC0ilYeBMsdCRnqwxBncyafJrSnuc+F0nvmksIdZVV
	XeOtUUnpKUUysqmWN0rULFS2ojd/OIoHw+6UjFtnWFXTlChyiKdW1FVpTvcqcxKL
	jW8sklW6wkRC91t2YT4DVesrAzhM8HhiO90BcjmbfyJF8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6uae1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:09:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so44013251cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041363; x=1779646163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8bqS3/TcdKkwNMqm6LLG9pf/khtfhDJzPrpTC6WA4E=;
        b=SrhmLrGCX+DHdpz2ELyhY5JWKB5MylT8pDHPiToccNr5d9yfZS7wkvFZ8NhvF4pk5r
         1NnMyFQdR6nCzeH9oVxxxDX6/Jh2F3qb9/yLmfx+ekvBnoEVztThF2hdQtnCDEXdMJ2J
         uyqB2aZ75gRmKtIqVgj+zgW3Yj6IDw/6Z/FQIvLdGIYxnNEK5yFEUm5pYb1YQUyx+QgG
         biLySt80QnMdu4UXG08t9IhVQlTpEUvMyxx5TSm4Tgf245/p2DtVKzooEzUIJYyMQ8aM
         IHT6ehYSj7S2hBWzrXsOipvC1JjEYYQAWtO/HCQtgd76vmz12uksmEI2jUbITqLdm/CK
         scTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041363; x=1779646163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8bqS3/TcdKkwNMqm6LLG9pf/khtfhDJzPrpTC6WA4E=;
        b=kBFYiKo8RvPGQ9Nb3dldbvWnoRg3ryBuBbZNL3fZvAj9DuYwn8srGISgJkVJ3Jt3PV
         1IjQpyayNefgDMTXoYqlV4P79rgdH5f1PRb7l33Az5+95uDEWtE/TzKTkKYer47nPuqy
         IHwCj36yG7vJPis8KyXjTojsWowVLOtoCgvaUnB/i96YChjk7br7OgOntjgsXWnEzhZ6
         SZeXE197EzSzD+Bo5xWVFl/Ig/Z978l7NWnaefBwh1Nk+5T3zn74sSae8it7WPoDdT8N
         8kus8nKN9PBdnRkjPX4IOGbIUVotwyQ1F3M2WMQnSMjxIKOTzjsuZG8CwvnhOriHy4kf
         Qzjg==
X-Forwarded-Encrypted: i=1; AFNElJ9upEUNEIV36NChg8hx47o6kRdD6twcTofOPx7Be9nElJBs2yFBCPaNc2qYG5RVVCl6f6QvLU2NoIl5ztaf@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2P4xXZi7X1bfnutoKED7pMvgk/cED+58E8lUz2Ykq3WJknMn
	1W1k+gkm3MCILBS9PqcekRq5T3MKXe14UPj6uI6z9K6ssUYErvUg7TqNP4RTOyrGvQZsCfcP5y0
	EV3BbO9K3dCqwpslqG0vl5x+k/f0ex2yc9mfT+WIYGowXvmkisMF3bVZbTTEpH52DIGrv
X-Gm-Gg: Acq92OFaP2X0o7PeqOO9HXD98vSPVGfESq1kT7TAJMDDfJYz1ykbkA54wNmcLa0iatk
	6Y4JvEzcpjuF8JO8dPdnskrb4jc3vZh/USUEgSxBCS7j904hxZ4TT9qTpvmjmCzGbx5WdMuJbvO
	vqg04FJfsQM1wTQGNn2tH/1YHJbJsRdkrVWEWTA/gOZMAsXCBti9SaID1giNUh9e3ectO6ipqHI
	eYwY/CY1/9xRtAnJ85AKrfTEy8PGsE60E2zSdJWy2qE5Lz+GcBpO2anXyqQUBB534wolAfR2upm
	rYZ+0wA3GdwGeyokO5jhEMSRadXMcKz0xL5Xq+a6OZcAZCE3tulESHXlP/UCnISlTToPRWJ/qQP
	4QbQPXFvsHp4/iDvtpJqbi7Sm6H3caarxGOrsKbaBxP8ni1KiaqsmbZG7S2AJzHGn/BfEUkDu6q
	LcnDYBrC4jMszRnmMTO497AMXBsg3JB8uijVv3e5xs6BRZAw==
X-Received: by 2002:ac8:5cc5:0:b0:515:6c6b:48a5 with SMTP id d75a77b69052e-5165a086833mr174206651cf.27.1779041362651;
        Sun, 17 May 2026 11:09:22 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:515:6c6b:48a5 with SMTP id d75a77b69052e-5165a086833mr174206081cf.27.1779041362156;
        Sun, 17 May 2026 11:09:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm2808550e87.79.2026.05.17.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:09:21 -0700 (PDT)
Date: Sun, 17 May 2026 21:09:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 10/14] media: iris: Add power sequence for Glymur
Message-ID: <u4twzqwgu75ermwdi5miw7r4gkjw4iaok35jcm6o4ecgpst4rz@a63dq3cihmes>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-10-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-10-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: idfOERaoE4wZxJ29coyT9Ir2xGWFUC7I
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0a0453 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FAHDx9sHcyMoKEza_-8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: idfOERaoE4wZxJ29coyT9Ir2xGWFUC7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NiBTYWx0ZWRfX5sX8XU9MXCj3
 puib9NX/fnCV5jpnLRA7h9RHewK/i/pD+N/5IZcliXWaV5lWYJd59suFtMHIaf9w/S8jRp+QkqL
 7AiTLYihE1qRag0xU5bp3aEbGA344Vg16Ty2+LnjDSY/tm1vHkAJQ4nhQtb+XL7P3xQBsiVtuOF
 pQSTr5hqagEl11VgW6IYVcbe9NaBmQUHvlw9YlGV+1SSy8slR823DI139sh5PvHLZ8EZDqqSScK
 9MJ4k+88tWF9Bd+KUCs4CCuh2FNcifeszndrpWYYUw7npTPx7NbKiz3Ha+mFSAv90wzaetESG+j
 f57ip6nAngDj+CAteTWDtsHGpZU7jgNLPxN7tyquBEjm3eKbjqW8vh8xse71D6lRHWCqDJp/xp3
 yPNGZCK755aUeqB5Q/3IiihZG8dYVDMSh/Z5ukxA/wi29I2WzmNR/oc62uer0kcq0Tdc5kO+JMP
 bqnMcTUhH57FeFDmeSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170196
X-Rspamd-Queue-Id: F07AA562E34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108061-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:25PM +0530, Vishnu Reddy wrote:
> The Glymur platform has two video codec cores: vcodec0 and vcodec1.
> 
> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
> same power rails. The clock dividers between the source and the branch
> clocks are fixed. So when both cores are running, the source clock always
> runs at the highest frequency requested by either core.
> 
> Since both cores share the same power rails, the power corner cannot be
> voted independently. Scaling one core's power corner up or down would
> directly affect the other, leading to under or over-voting.
> 
> For these reasons, both cores should voted the clock and power rail must
> be based on the workload of both cores.
> 
> Reuse the existing code wherever possible and add power sequence for
> vcodec1.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 137 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>  4 files changed, 147 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 1d757cb8e9e1..366e499dec53 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -63,6 +63,9 @@ enum platform_clk_type {
>  	IRIS_VCODEC_VPP0_CLK,
>  	IRIS_VCODEC_VPP1_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_AXI_VCODEC1_CLK,
> +	IRIS_VCODEC1_CLK,
> +	IRIS_VCODEC1_FREERUN_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -208,6 +211,7 @@ enum platform_pm_domain_type {
>  	IRIS_VCODEC_VPP0_POWER_DOMAIN,
>  	IRIS_VCODEC_VPP1_POWER_DOMAIN,
>  	IRIS_APV_HW_POWER_DOMAIN,
> +	IRIS_VCODEC1_POWER_DOMAIN,
>  };
>  
>  struct iris_firmware_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 39e9c78c3a69..68a4997af23f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -17,14 +17,14 @@
>  #define NOC_HALT				BIT(0)
>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>  
> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>  {
>  	u32 value, pwr_status;
>  
>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> -	pwr_status = value & BIT(1);
> +	pwr_status = value & pwr_status_bit;
>  
> -	return pwr_status ? false : true;
> +	return !pwr_status;
>  }
>  
>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>  	u32 reg_val = 0, value, i;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>  	u32 count = 0;
>  	int ret;
>  
> -	if (iris_vpu3x_hw_power_collapsed(core))
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>  		goto disable_power;
>  
>  	dev_err(core->dev, "video hw is power on\n");
> @@ -254,6 +254,124 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>  	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
>  }
>  
> +static int iris_vpu36_power_on_hw1(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC1_CLK);
> +	if (ret)
> +		goto err_disable_hw1_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_FREERUN_CLK);
> +	if (ret)
> +		goto err_disable_axi1_clk;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_VCODEC1_CLK);
> +	if (ret)
> +		goto err_disable_hw1_free_clk;

And this is what I'm talking about for the indirection. To bring up the
vcodec core, you need to enable several power domains and then power on
several clocks. Here you list them all one by one.

Compare this to:

struct iris_vcodec {
	struct device *dev;
	struct device* pd;
	struct clk_bulk_data *clocks;
	unsigned int num_clocks;
};

int iris_vcodec_power_on(struct iris_core *core, struct iris_vcodec *vc)
{
	int ret;

	ret = iris_opp_set_rate(vc->dev, ULONG_MAX);
	if (ret)
		return ret;

	ret = pm_runtime_get_sync(vc->pd);
	if (ret < 0)
		return ret;

	ret = clk_bulk_prepare_enable(vc->num_clocks, vc->clocks);
	if (ret)
		pm_runtime_put_sync(vc->pd);

	return ret;
}

This is the generic code, handling vcodec enablement on any platform,
including Glymur. Most platforms will have one vcodec instance, Glymur
will have two (or it can be an array of those). The only difference
would be in the platform code, filling the fields of that structure.

> +
> +	return 0;
> +
> +err_disable_hw1_free_clk:
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
> +err_disable_axi1_clk:
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
> +err_disable_hw1_power:
> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
> +
> +	return ret;
> +}
> +
> +static int iris_vpu36_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_vpu35_power_on_hw(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_vpu36_power_on_hw1(core);
> +	if (ret)
> +		goto err_power_off_hw;

static int iris_vpu_power_on_vcodecs(struct iris_core *core)
{
	int i, ret;

	for (i = 0; i < core->num_vcodec; i++) {
		ret = iris_vcodec_power_on(core, core->vc[i]);
		if (ret)
			goto err;
	}

	return 0;

err:
	for (; i >= 0; i--)
		iris_vcodec_power_off(core, core->vc[i]);

	return ret;
}

Similar abstraction for powering on the whole core, calling
iris_vpu_power_on_vcodecs() inside.


> +
> +	return 0;
> +
> +err_power_off_hw:
> +	iris_vpu35_power_off_hw(core);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu36_power_off_hw1(struct iris_core *core)
> +{
> +	u32 value, i;
> +	int ret;
> +
> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC1_POWER_STATUS))
> +		goto disable_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + VCODEC1_SS_IDLE_STATUSN + 4 * i,
> +					 value, value & DMA_NOC_IDLE, 2000, 20000);
> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	writel(REQ_VCODEC1_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +				 value, value & NOC_LPI_VCODEC1_STATUS_DONE, 2000, 20000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base +
> +	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(VCODEC1_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, false);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_VCODEC1_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC1_CLK);
> +	iris_disable_power_domains(core, IRIS_VCODEC1_POWER_DOMAIN);
> +}
> +
> +static void iris_vpu36_power_off_hw(struct iris_core *core)
> +{
> +	iris_vpu35_power_off_hw(core);
> +	iris_vpu36_power_off_hw1(core);
> +}
> +
> +static int iris_vpu36_set_hwmode(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_genpd_set_hwmode(core, IRIS_VCODEC1_POWER_DOMAIN, true);
> +	if (ret)
> +		goto error_disable_vcodec_hwmode;
> +
> +	return 0;
> +
> +error_disable_vcodec_hwmode:
> +	iris_genpd_set_hwmode(core, IRIS_VCODEC_POWER_DOMAIN, false);
> +
> +	return ret;
> +}
> +
>  const struct vpu_ops iris_vpu3_ops = {
>  	.power_off_hw = iris_vpu3_power_off_hardware,
>  	.power_on_hw = iris_vpu_power_on_hw,
> @@ -281,3 +399,12 @@ const struct vpu_ops iris_vpu35_ops = {
>  	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  };
> +
> +const struct vpu_ops iris_vpu36_ops = {
> +	.power_off_hw = iris_vpu36_power_off_hw,
> +	.power_on_hw = iris_vpu36_power_on_hw,
> +	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
> +	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
> +	.set_hwmode = iris_vpu36_set_hwmode,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 09799a375c14..63bf0cec58e2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
>  extern const struct vpu_ops iris_vpu35_ops;
> +extern const struct vpu_ops iris_vpu36_ops;
>  extern const struct vpu_ops iris_vpu4x_ops;
>  
>  struct vpu_ops {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> index 72168b9ffa73..e67d98b8c91e 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
> @@ -7,6 +7,7 @@
>  #define __IRIS_VPU_REGISTER_DEFINES_H__
>  
>  #define VCODEC_BASE_OFFS			0x00000000
> +#define VCODEC1_BASE_OFFS			0x00040000
>  #define AON_MVP_NOC_RESET			0x0001F000
>  #define CPU_BASE_OFFS				0x000A0000
>  #define WRAPPER_BASE_OFFS			0x000B0000
> @@ -14,6 +15,8 @@
>  #define AON_BASE_OFFS				0x000E0000
>  
>  #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
> +#define VCODEC1_SS_IDLE_STATUSN			(VCODEC1_BASE_OFFS + 0x70)
> +#define DMA_NOC_IDLE				BIT(22)
>  
>  #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>  #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> @@ -35,6 +38,8 @@
>  #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>  #define CORE_BRIDGE_SW_RESET			BIT(0)
>  #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
> +#define VCODEC1_BRIDGE_SW_RESET			BIT(2)
> +#define VCODEC1_BRIDGE_HW_RESET_DISABLE		BIT(3)
>  
>  #define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>  #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
> @@ -52,14 +57,19 @@
>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>  #define REQ_POWER_DOWN_PREP			BIT(0)
> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>  
>  #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>  #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
>  #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
>  #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> +#define NOC_LPI_VCODEC1_STATUS_DONE		BIT(8)
>  
>  #define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
> +#define VCODEC0_POWER_STATUS			BIT(1)
> +#define VCODEC1_POWER_STATUS			BIT(4)
> +
>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

