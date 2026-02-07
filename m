Return-Path: <linux-arm-msm+bounces-92114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHV+HigDh2mpSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:17:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2DD1054BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A64A33029257
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 09:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8395D30C62A;
	Sat,  7 Feb 2026 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2wAH+CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibd3xx/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320402EC0BF
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455830; cv=none; b=O2KAL869GNJIKyHvBPm3Cuh3usIdsmjWeaUC3Oz/2a48hPdICoHos425RHtbMst3JfzTHfkQ7nP2qpDV/27DiJpYGtp5cMpRQKWGQyMiYSxB5AuBHVmWgz1VCbCPx43cZC+946k/bDpPdS04rDW9x0L10Y9dY9/6yRDbviRb2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455830; c=relaxed/simple;
	bh=9NTj8bze6eCT0gE44OzOQat7Pe7A3mxPsta0j/QPQbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sm4iQopbfiuTLJ0FKAJuAmDEJhFS8Vaaaoahe26sL/covgYzgtH0O4yeDutbYZnRePZilCxlkUV9ojMHrFkBZnbC7QRtvp3uIFArs2PpEjAopt4dT1KW5jgF95KBvg4wKTUkOy1G9n/S3s5x+RAxEnbTCzZ2klZvJ7j7kikwcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2wAH+CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibd3xx/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174SfN5370429
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 09:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YDwncRQ168ONlLDkORs7Ecnl
	lvkOETKSKd/v3Pe+RYk=; b=Z2wAH+CHV5GXOnQAn6e5aNvaVwV9hKHnoucdD0fl
	WAkYpYb6KpaAPQj0WgxfwuFN1aBET/jgAh2lrBOmQMMckgZQO1U/tsZLXPGfYzqq
	s5ONSI/h3f7ZJOEdnwJkEjmr3symPMvLIYrZcp5z5YLfzrDcdKx/4xdA/H5NI0qh
	PSoCShabfnGrD0CxJHT05cwlQZRv5/KmplmXOHnpK1+8D2rqUKGiZ4/c3AeNgaQq
	XU/1Kb7raBM5hrnaCA0PMSkTCI+EpH22y+6ZzC9Cj4ingc7nIy0ypOcAeyvLikB5
	4vBQg9VVLI/hAfUHiDnNcxPIr/sVONHmf1GsF/Dq1KgWYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd0d8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 09:17:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so774617085a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 01:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455828; x=1771060628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDwncRQ168ONlLDkORs7EcnllvkOETKSKd/v3Pe+RYk=;
        b=ibd3xx/GQCkUVLLxD1eA++Mt+5FKEhjD8G1S775JOdek75kxLB/xVwfp4UKvGv9BLZ
         8NAE4hIZAnbsu+x4MF2s4Ag00zhwS0V+w+3CyCB0nvFGrkx5ZHaTJDdSvlwDbQNL+R8v
         D6KhnY1WuT8uHDYe6f5j9CKilvmoi1EglBimtX6N/N8CQX6ZHF13GqAfU6VhJArHiTAb
         2ux0BffePt4UO+XUzsxqVwsBIX7WIpNzQFsS3Xizum96HwlGBElGKMGLEe33ISzN1Jnn
         2GOquFyALLDzeYRSz692b8SnRKZ2SvmH88Sm+ZloIQg1nzIA0xSPivO362b2mG+XCoSh
         Id/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455828; x=1771060628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDwncRQ168ONlLDkORs7EcnllvkOETKSKd/v3Pe+RYk=;
        b=Jvf916cwVdX2bpZf47KMe8tEHTCsIMcEfrY7TLrPv6knFvFz6t9NU1kShplBUQb1WM
         i+snPVHT8lB60hoxbpyhITFzqrrYAOPKpldXR9etEu8rZQzMh9/R/mDgEC1ONuUAcL2v
         XWTG8fkYo/CstrxJ7LUDWV7XalXFqktn45jx1JtZoupMVxG9Ub5DYhz7F7GgSESXRwTO
         V+QMSgJzxpiZRykDysShGjdvpYODV5qFMYpJLleCGO0Ou7P7J9OjJb7FCQKSYZdV035S
         xIKyHIm8Qtcb5vrfL54fFTZhHPfRnRNGndj+9YTFfGPQarNIzxrDQErBe7jdi10xnwh/
         xvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlS3JuOWD+4iCpVMxjpkbjh1FwMsSX5aFJo7v963jhPpEjZz+keeW8AD9it0gARc1VoL2KBoe0EpBq3awr@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhHKAPc972IUH90hIPQ2S9A1xU9YMo3soXQoafzQId8duFple
	/Z7PTwtfOrPKJorINepmXGb8RCu9+CeVi0nZPpOrkM2t/LxU17SoCC5wbB1p8ACfE33SiYrQB2J
	Q4pd+1uJS+UzzHE9j9Nv+ZpUzOuFiGE94KW0zoiDnIa0GwjJ1Kwj4IQOMKmj4P94v7hPA
X-Gm-Gg: AZuq6aIdhC3Tjg4iE2AfRLoiYbYaNs11srjRnCyF/fDWiEcCHBPiNIDf9Tbj82n2umi
	DJ+Br+wSAbbIjjsens3KyxdJamVE9Yk5K21js9LgUBOtbHrS7MrmYhfv4OF0knA6Ri7xPgdHrRu
	iRg01O6RXM6E48cX3aEb38+OYJzP3Jw56G9vwGaC9cJf3Zktovp+DNIialwLImz+HB01DUz3X5C
	mkLIZgSHuveN6ebK9bxai25yuANPPaYUpfLQDIilj0z8A6UZeibiTdggx52ajWp8Ig1c0bqbM/E
	yJbR8rc3y0zwhNzl9lsQm7pCVZcBA5OribcNBZ45ey9JsfKX9q9Usy1zafU6ENYdPIgWfjHmPzf
	Ft8SkHuyeeMLgb7Y3rWAcKCxW/BzyemgPuw/ujpsukCN+teAqtgcDezl7LWhJ1HF4whL912xPLT
	nJ/yFVr1+UENEwSe1kmW9b+oQ=
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr709723385a.60.1770455828398;
        Sat, 07 Feb 2026 01:17:08 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr709722085a.60.1770455827958;
        Sat, 07 Feb 2026 01:17:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6158615sm10860231fa.0.2026.02.07.01.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:17:07 -0800 (PST)
Date: Sat, 7 Feb 2026 11:17:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stable@vger.kernel.org
Subject: Re: [PATCH 02/10] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
Message-ID: <62fl655uwn4fevonuuhxs7rplpmcdgkghrivaihhptz3e6empc@snkbjhydc3mu>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: zv4ADUht-LUAD615e3Pw5Ocu7cqazzu3
X-Proofpoint-ORIG-GUID: zv4ADUht-LUAD615e3Pw5Ocu7cqazzu3
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=69870315 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wNLNz8utBmpzwjt1yvAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MiBTYWx0ZWRfX6GhSb9n7+5Lh
 /HUlXg49Fs2ZitxENHgNsrzoA/1tYTnoWiSvCg/lZzubiXpj/jrtUmL/PrID3tb/OQmKmJRKMBF
 ucDTw+mIORvFHq25RFbEuSe97r8ISTwgGMR+S8Nf0FJEEUoJn/3VSxspVdwWWNdE92FeZDSRj/l
 KIMzBUJ4IbVYeKSQ4/8F+GaZlSXtxlSG1r2y3I5vnJvP9rO6DlKyp3XFQSbxQUQ7GFAN7V0+CRi
 GXT0FXR8dp56hXTu2g056QQaqucyYmElY4yig2v6LCJJtnttbvjKJlkPf8AAdJD0Uy5a+M7n0Ae
 zhukgaOdYhb/ecWVxGKNEFb2TP53D0DhdgF2TGXaNvurWRxOCAw/htRKeZJXnRU530QE1pLl5JB
 1awvdyaY8Ey76DyfpIexOMAm4HGKfNH+q0Xp3rtbsiJPuDsu7eLFpP8qsIPYuBI3gGcTw1sK/N9
 bvNtJHlDTwT5vmj66xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92114-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA2DD1054BD
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:14:03PM -0500, Srinivas Kandagatla wrote:
> As prepare can be called mulitple times, this can result in multiple
> graph opens for playback path, fix this by checking if there is already a
> graph instance.
> 
> This will result in a memory leaks, fix this by adding a check before
> opening.

I think, the commit message should be improved by removing the first
'fix this' sentence.

> 
> Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
> Cc: Stable@vger.kernel.org
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 528756f1332b..f68d4b4974f3 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  	 * It is recommend to load DSP with source graph first and then sink
>  	 * graph, so sequence for playback and capture will be different
>  	 */
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
>  		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
>  		if (IS_ERR(graph)) {
>  			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

