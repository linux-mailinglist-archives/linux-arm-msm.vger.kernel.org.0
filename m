Return-Path: <linux-arm-msm+bounces-89705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F329D3AEDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7695130248BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50AE31B130;
	Mon, 19 Jan 2026 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICG4Q3Vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUl+14+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8305A235BE2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836105; cv=none; b=pqeu0NSOoHXNaJzSi0/9LiGCimaymg5WAPJ5Y8F0AL58rl/0DZWeyAy2D8Y4WvwcgYv0bPnm1M8wFwM1lSZK4a1ZpcnsZrRrcSH+jjE66FtHSGBpWg0vvXJhL4lPfGFnuTfEhq+YrpQyZ0XrE1Xx11bKvzbEbq1uo9SZWE1YjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836105; c=relaxed/simple;
	bh=wt2iQRvLcdM7i51XKgR7sbpRcQIOt/YnEmrjxz7bMZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFNqMrCBLLU7Fr/H/JpJXTvv4B8SSzedEoVn3gRO3C0JR85PDokCqr02Ah5a/Hh2n7AVa55oCATjxLzBYl7BAY0w0VnM/DLAZu/TL3XEskwqQOqmx12/2e4BmCY+80N8IXUZUexARKwI/uc4wc91viF5Dd8L2b/qsQsGI645YuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICG4Q3Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUl+14+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kNHL774174
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ap3tAgxenSiHNhV/Re8Z5pL7
	juJCHNdQgIJ2sqs7hh4=; b=ICG4Q3VkTV13loRe4fmYE2ID3MBh/+5iaw9bhXN+
	QdQ/qdlTjHs13ZNWP5jHV+93DWUujSPnzc/C1wOQ0eruhqbj52d7HUWlJSaxVNSz
	DgCCCwPnoeLkMdUjvDiR3FHP2rXp5QFVQ5NHo0wHO5xzhYBn/R/auE13VqqrB4Ay
	lJPBnlxyZfaFh4Q5T9l2yPbqCtww2uzxUxUW16+YOv1LZ3D4mtKwBLpH82E26JoS
	TVt8OKFHN9C2Q4hEvdM7IIQrtLcHYYim9+6Zz1FegRoXtUVMgtDbRr040lTvLB4m
	U/Z4BAOoHPNrOP0J8cxXid95osxywtYDsxb8ESVI4r+PEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a9046-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:21:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so757988585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768836102; x=1769440902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ap3tAgxenSiHNhV/Re8Z5pL7juJCHNdQgIJ2sqs7hh4=;
        b=eUl+14+bBEByYt0h5G/TLnWCMtsU25HtedR7YDD3a4G0CbCdcLOF22xyLHDS8Lpbw3
         zXxNcGx1pzEAcmgNidgBk25qHQSbskyzezju+wQMDqBM6sy/OeBMdhThZbOx4RRd2pSX
         vdsU6F1bpJg4wO5xCiSEClx4FQHTko+xgpbC69tHKRWeD2SRIubKe8kCGyn/4LTeWZxs
         BsuJizQ7Uxo9QsPWgkEM9WB/LGhCE5HTNWdMlea5kZLxkW3z+61sjhDSL9iYLh8IZ+wb
         4C6sL9vo+gkdR1epQ38gp2njaDCO1liATJ6aOf5EaQkWFFf4BgFGbr7U1AfD3Jm3Kt9b
         Ldjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836102; x=1769440902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ap3tAgxenSiHNhV/Re8Z5pL7juJCHNdQgIJ2sqs7hh4=;
        b=MZ3WFjSgiF+qtQYu7NYU15juJNtiR6dPFUtLlv7kovDwNwwt5BA1gBBEcDtQdIM5iv
         BRSDkeo32UsQuyt6mw4f/GDQAcbP8UW6NBQFU6LfrYtyirmrjyg2YmXsIGNN3q52rwG6
         Mz9TRaFxB6bKOp/ruYhvvNQ1QRnzdbbRCwdnR9Ycvuquv4+vv/M3lwL3d/bYF0MjRZIS
         oPB4uO2CBAF2kLknJjV/Dy29j2GCilyIERjx50Ldnpf2OJWzHvDH1onbMD5QjbvLn/lb
         Ybk9Ve6D1QWKlASeDw4DMeWrw2hLAaHozUjh2TDA2yhO89Wa/J9/JL3kX+uU6KV7+tRm
         3eAw==
X-Forwarded-Encrypted: i=1; AJvYcCXyPuodk/iroyyvQpvfTF7cS090tkpZapJEy2L0gWRJLvPMl5TzugdbXYuQPXEt86tD7g+WnAK/CWQoMTDx@vger.kernel.org
X-Gm-Message-State: AOJu0YxB6xWHgqAemmt8zgcr7aUDGrXVB2pbgTieIYQ93m+GJ+SbmYa4
	EJh4Z7jQIxopGlxoR55dn8BuqeC0AeLr+mMxgOeN/AvvSqWwXJ7YzzxP/6NaIx+y/9tjImbLsT4
	qQSdRp2syeIJari55eqFBX+JA0h2WUUnzxF3Dv2XLaopDLekwP8pw2LRD/dw9Etae7quXHD3n3X
	7E
X-Gm-Gg: AY/fxX5lRs+nET+sMUrytbt5liLlqZv25BRXEVw6isnmkBCyWKpSHxO/EZWuKwVtCFx
	XKAki8VC1BBj0+beo6I2GyYZ2zAqPkmpq0sDZK8v1WF83XIvBDwugP9EtGD23T+G96hQLERYQdC
	ET/iNXrCZ+Zvq4XIfjwVjgzZt1F0wWTec+ZkoqiN9XJnZ8Zz6FWY9pWdSO1BENt1Ku2ePSqlQnx
	O881siy/K4xV+JoqaAgec7NrDqY1CFZLmGneQ3rXwbY7+dTg3h0ZEe2/crkkPLLe9B8HygKKHvA
	vBUBGb1BPFnqaxyKqMfviKOlCJhHWPy5gl6szSHwnsCfo9iDSIe2QYnJ0qEKboFvqNOypvsYQ8f
	anynxne48Io1O0ogb1qcX65SK
X-Received: by 2002:a05:620a:29d3:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6a670434fmr1543095785a.24.1768836102282;
        Mon, 19 Jan 2026 07:21:42 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6a670434fmr1543090785a.24.1768836101680;
        Mon, 19 Jan 2026 07:21:41 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569922032sm24757404f8f.8.2026.01.19.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:21:41 -0800 (PST)
Date: Mon, 19 Jan 2026 17:21:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Message-ID: <s7b4wjprfgeaif7rzjozilp3zktrqctltr5bpprae6z3t7kjqh@k343qdom6jfk>
References: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PAoBqkNLic17SqWDEYnikFA1lVKHkQiB
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e4c07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4zAq9UItTR4ueoMMHEYA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyOCBTYWx0ZWRfX+2own0pDoYO2
 zF34gqtl72ms6fO6kUjayGlfUSP7CSgqG5LA25HxDU3zf5jRJ1TGCfexS+RyPZknHF7ImJSKFY4
 ZCGZurC0a9xGKxHpBudV6hrbIvOzaGI5C/0fzzV9FLMo33gJ0uHrcXc+SCvy3E9mveUlQES38aH
 wWGb65h4bf0KftJEZAaZU/zBkWc/3iJvNvGafq4FDzgBO1Pzo3a3d2PiOF0xzce7UdQ3Fpz5IJt
 fdFF+WThNc/PyjGs4WDMuoNxcPWVy1Cupmv0bERw1M1eNvTebJ52Em28g0VRCnK5UfQOqCQ6BzG
 bwdwigh+sAROPZKhTT4rGp/0NiS0PgLfN8sQKoKzCzD//PLNnPndlrQOqnqB7v1aHfS4DBnfrce
 ZRrH5ASoDHepuAGu791xDMlMfmxQppXfDnXO5fUDMTc8ZPvr31DncrcRNophJnF1Pza8l/SN8cl
 NlWZrZWWysdlIyirueQ==
X-Proofpoint-GUID: PAoBqkNLic17SqWDEYnikFA1lVKHkQiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190128

On 26-01-17 05:54:47, Dmitry Baryshkov wrote:
> After commit d228ece36345 ("clk: divider: remove round_rate() in favor
> of determine_rate()") determining GFX3D clock rate crashes, because the
> passed parent map doesn't provide the expected best_parent_hw clock
> (with the roundd_rate path before the offending commit the
> best_parent_hw was ignored).
> 
> Set the field in parent_req in addition to setting it in the req,
> fixing the crash.
> 
>  clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
>  clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
>  divider_determine_rate (drivers/clk/clk-divider.c:358)
>  clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  __clk_determine_rate (drivers/clk/clk.c:1741)
>  clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
>  clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
>  clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
>  clk_round_rate (drivers/clk/clk.c:1804)
>  dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
>  msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
>  devfreq_set_target (drivers/devfreq/devfreq.c:360)
>  devfreq_update_target (drivers/devfreq/devfreq.c:426)
>  devfreq_monitor (drivers/devfreq/devfreq.c:458)
>  process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
>  worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
>  kthread (kernel/kthread.c:467)
>  ret_from_fork (arch/arm64/kernel/entry.S:861)
> 
> Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

