Return-Path: <linux-arm-msm+bounces-100898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFPKIg/Wymk1AgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:59:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0681360B86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71EF1300F125
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185C139DBCE;
	Mon, 30 Mar 2026 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+Lh1jeK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSPaTAno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5869334C1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900319; cv=pass; b=ddZYG8IZUimP0StWJ6QOVKocXiqLAWBKZ3AKwPn5apUHCBnePFEnYGmBvoGEssVcpdklDe0VffUjPBba72k/gAk2huf09oDAH/S+fOHC8sZas3fyUghHi3v7kuMK0fI63TRXVo8bCKmTOUw/UJ8+2Ne4EcqjnuiiURIvyBd4x4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900319; c=relaxed/simple;
	bh=fXdDMVWKaIDHaABdyKU7Sj8ZL17NFWLM4LFDNlNG5sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoUMgKXePIhSkbBNj6sAfBwCcFC2VmWqccQtXUbNC0r/yG38w7dJ4AFBv0RjWWQaiABY97XRwzwr9ysYCs2MtaHf1XTW2ObYHkoPk9JD15PtCo/+wcmdAE7qE3Os1lrbYqhYUrzsEWzpMG2pxZrKHuXLlaxOBKVjX1uoMbzSFSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+Lh1jeK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSPaTAno; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UHAVKH4013755
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BYgmQX9+7HJDFRI8vACIRqbXCl+Z+u+oPt2KaFypG/k=; b=a+
	Lh1jeK+87PsB/vP6pgt94QDKcoUuSlq+S9Hg5U+BJ1Y6leK6lGVheYB8h4Skdzps
	RIhy4CZPlLo/oKcWVBGRrBrIiY/5uN80g38Gf8yi/zeQk1fGDnHUxVdJIYdyDe2z
	GE/v9hBpvlr8buExcZYKchovLnvA52E4ktOXTyCrExWsz8GR7zp13ozHsNNDaZZ2
	U6mjonr20j79t8RF4v11qwSMJeSH5qCzMaav8Df3a/bPlnV4XSer1B0XxRsmmxoW
	63k55hDJz/tVJtbW7TR8vSqTh+DL+7nWAuh06kO0Az6INkTIauRIKINv8cN78vAH
	iMPXpVkj9//wN1/MI06A==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regsycp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:51:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d74211ff80so8649493a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774900316; cv=none;
        d=google.com; s=arc-20240605;
        b=PKIqm61USey7/kNS4j+aPrEPtF+jYkQhUUOO6aMtWNMshGwh6/N6p6UsDjZBsdjio5
         23gqpJctP4Fi0i6sK4pToCL0WisMie9+IeEKRc6ufZQPqW39EKMCeW4U9aTgHGvsyciE
         3HcZm2CgmyGkjzCC+I/PRXJvSfeFn80+XmUdvRlPcNzorZY1gV3OkqeUq6Om+AipRqC8
         2jYSrDr6+2TnxBzcMFuWKF8SsIEmu/sDvlJ6nv+32APpCAOpEjcM0aEfqSzXgq/JOS5n
         sr9VLTty/Z/FCb2L9tlERZh+tQtrabbFMfuUB8GGh6xIW8MD7sEenhgj2jQuaoRWVeEX
         ekRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=BYgmQX9+7HJDFRI8vACIRqbXCl+Z+u+oPt2KaFypG/k=;
        fh=ukMDB2t2ctwHCO0YAAAlr1VaMIo/bghaalYTwQxDQPc=;
        b=BsvedZn3TxDfmgHusjBka+YrnFyAS+CYc3BXI3Gf7HNb7bMLCF8aXywCBDii+lWVN+
         mZAK22/nwha2xUa50cXmr222doSdEHipEBqUqDdu0i+evY/+inxJY80rPXVgDgrP47Es
         DPC+FMVbXDehhxtL+6xCNOisnrNlC8Ikazbu37/TmkTwapMMFmNLG7hWMBNAPRHDrOaQ
         KeXFkMoSg5zNintCJ/TsI/5pkihEj9PBCBL96FcY//jeMxNfb6Cvo3ThUeXUk4K24tUS
         MojW0UlNKcf9XHasALmGLwWlfIC8SbPgqZ5zYSOG/OYKvKI5dGqi/U/peqkXdFAc8C5Q
         /KrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774900316; x=1775505116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BYgmQX9+7HJDFRI8vACIRqbXCl+Z+u+oPt2KaFypG/k=;
        b=SSPaTAnoicZX3Z5o7EWS2ia6v5V6oAyUXhAf66jFwzenAI7sNvjaORLwc1SRAKeCdL
         kMdxMEzZtzC5KF7UySjV6OhmRyxMmQosMcZyn/7a0MlgoKi9qP0arcUPcFuVk3BWGJm6
         wq8ju/Zp7moujUv3YIRFTnYUvtJVNB8NM43NKATQOFEmumZzXIf19uNrXDPlR8Krp4wB
         9J889bvuxNwZ1amo/U8OprW5O07b6IROdnpgT6d0msSkli7QBwAasSfnBSbbbWBcQd1j
         q+vj6ZKRJ9MRWup8t54lQrIb0IXd22qdYRHd/Hn0pz+KD9wRe9erCBh/j8nkn2wuNIDZ
         qlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900316; x=1775505116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYgmQX9+7HJDFRI8vACIRqbXCl+Z+u+oPt2KaFypG/k=;
        b=Pg55IYbOADRrz8kNR5IZi93gnmF3j7P7q/+0OcoqGwGhWa5MS9qF9lwAAYdwBqt6Sv
         jhMOyhLZADLhrVFGUdFL2IJuNLrWERwbAXkrdsa1dUqplFBTiGvDJdaOHQVMYj0D5CsJ
         3GZay1LwZGkUa78GNDku96C4nMtC8mgSXViHTBog9l/VcqhH3x53Hq8n+2IfLkLYsPYX
         aFOtVB0/s80yGDACFPoFqUUo0DAy3Vz8g8UQ0qlPYqyrLkkgIl3FwsbsdETWig1MoTfe
         NMEA4ep7qO0YSMm8+NpMmUFmJdh5w7iaj8LSSAkjUN7iI8eRFUWWg+us7Z+g2ZpX9Tpw
         9Bow==
X-Forwarded-Encrypted: i=1; AJvYcCWJdgjuPuRr4kHegp7NQ8iKnWnlFkC1Ss87cIgwfVpJdcDG0Vh2cxepOL2O1stEBPRea9e0uuQx8ldBecA9@vger.kernel.org
X-Gm-Message-State: AOJu0YzBtVRsQ2TiQhPfCc1GbMPAleSIrLTW6KC5VY/jGfFZBjdBnpZI
	OJo2nP2KaMATYQp6qA8/fYNC4T5QZDO5nRxpGnUsmbNrd7xnJr5nJwM0kk3VEdf6T7TXXRsPO9x
	o+WazDrPiIlTIemj5mYqqApCB787QsDakJlp7/7yNvZlb9j6Du/J8musR0e5oWsKBvc1gyyjXv9
	4ycfnqlGjuDVFpnEEa79iUiOgxUjg2hRR2mM8ZGlDU+6k=
X-Gm-Gg: ATEYQzzI49GqbNncAZrP+kdi1R5EM0ZFeyGK/mSbD4oaR+zmflZ6NwOaWPCZvi37Dnv
	pi8htACb6IiH4NT2mGMQgfvXmGUC5jtneEZgXoJQhNqIUBGf/iz0Jb33OTscw/hvgVQCLEnep4k
	zraWy5+MxlbwNFlHTIF+6nmwmCR3fLi0XXaBOHnQNDHtMqlATLzDKkLIw+fdjrPG/4bNQ9JoKsS
	SyAaY78c3G3+BeADG67jESp1gbmql08d6lqqw==
X-Received: by 2002:a05:6820:6285:b0:67e:3e13:3315 with SMTP id 006d021491bc7-67e3e1337f8mr308918eaf.34.1774900316018;
        Mon, 30 Mar 2026 12:51:56 -0700 (PDT)
X-Received: by 2002:a05:6820:6285:b0:67e:3e13:3315 with SMTP id
 006d021491bc7-67e3e1337f8mr308891eaf.34.1774900315543; Mon, 30 Mar 2026
 12:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com> <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:51:44 -0700
X-Gm-Features: AQROBzDzeXlufVAcHp-mfT91Ri0TTEd0QRnKKZ9AjJjqeYURY2jinS7-RfD9G6o
Message-ID: <CACSVV01RxTce4qEkt=vPb8AmPSuTLVTh5DR5gCAP2n3U3vkDqw@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] drm/msm/adreno: Coredump on GPU/GMU init failures
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cad45c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=fHbsih_gTjd1DzczjOkA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NyBTYWx0ZWRfX8456yDj/c9nS
 QuIGMU0lJFsE9CfuAWJ76kibTzBZEsuhU1zepQT3QkXUJs03fGGSBqqdUz+d3YeIHT4lo9h7sgW
 h6qU80+USy+w74NaWZr7eNjX53MDWLxgMuh/xCBn4WJ5XACU+JGN7/5uSq1NLtGGYl+A4+AAZu7
 r8gPHnTtZIn7UyMRbqV7Lm3E1oPvWRWEaDXEn1uqt6l6+ZuY7zLcFDkINOw7HGtCV30DTk+0rHp
 EWM+7t+De8HYyapE69TiZVMCQYFrsLYKzibjFamuUKKEvwlAKhqmCu+eqLpajn1lW54Eu5s73yd
 G1lmFvXeE6lt/vmBGJAj/X3H3K8DRE8tNZKFWhWtixMbpv6O3+E6EWLyPrAAePkFwOpRqE/fUeR
 cbszoHaUIdu3m4HCuDFj1zxiL/dpcjcH5IEZcAq7SyoIwqsSnR+L3+48KapPVORpSiwwsb6lDVz
 ImQqpTFZd7NzmL4QJTw==
X-Proofpoint-ORIG-GUID: 2ihfrHCSRHRCQ0q7h0NKfqyveSZRp3cK
X-Proofpoint-GUID: 2ihfrHCSRHRCQ0q7h0NKfqyveSZRp3cK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-100898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Queue-Id: C0681360B86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 5:15=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> Capture coredump on GPU or GMU errors during initialization to help in
> debugging the issues. To be consistent with the locks while calling
> msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
> msm_gpu->lock.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 1 +
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 5 ++++-
>  drivers/gpu/drm/msm/msm_gpu.c              | 5 +++--
>  drivers/gpu/drm/msm/msm_gpu.h              | 2 ++
>  5 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gmu.c
> index 1b44b9e21ad8..916c5d99c4d1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1335,6 +1335,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>
>  disable_irq:
>         disable_irq(gmu->gmu_irq);
> +       msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>         a6xx_rpmh_stop(gmu);
>  disable_clk:
>         clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 4edfe80c5be7..ca5f96e16870 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -105,6 +105,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *de=
v)
>          */
>         pm_runtime_enable(&pdev->dev);
>
> +       guard(mutex)(&gpu->lock);

so, I am a fan of guard(), but I realized this means we are holding
gpu->lock across the debugfs_init() (only a5xx).. which I suspect will
anger lockdep, although I don't have a good way to test that atm.

BR,
-R

> +
>         ret =3D pm_runtime_get_sync(&pdev->dev);
>         if (ret < 0) {
>                 pm_runtime_put_noidle(&pdev->dev);
> @@ -112,10 +114,9 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *d=
ev)
>                 goto err_disable_rpm;
>         }
>
> -       mutex_lock(&gpu->lock);
>         ret =3D msm_gpu_hw_init(gpu);
> -       mutex_unlock(&gpu->lock);
>         if (ret) {
> +               msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>                 DRM_DEV_ERROR(dev->dev, "gpu hw init failed: %d\n", ret);
>                 goto err_put_rpm;
>         }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 785e99fb5bd5..8475802fdde2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -391,10 +391,13 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
>                 return 0;
>         case MSM_PARAM_TIMESTAMP:
>                 if (adreno_gpu->funcs->get_timestamp) {
> +                       mutex_lock(&gpu->lock);
>                         pm_runtime_get_sync(&gpu->pdev->dev);
> +
>                         *value =3D adreno_gpu->funcs->get_timestamp(gpu);
> -                       pm_runtime_put_autosuspend(&gpu->pdev->dev);
>
> +                       pm_runtime_put_autosuspend(&gpu->pdev->dev);
> +                       mutex_unlock(&gpu->lock);
>                         return 0;
>                 }
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 995549d0bbbc..472db2c916f9 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -361,7 +361,7 @@ static void crashstate_get_vm_logs(struct msm_gpu_sta=
te *state, struct msm_gem_v
>         mutex_unlock(&vm->mmu_lock);
>  }
>
> -static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
> +void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>                 struct msm_gem_submit *submit, struct msm_gpu_fault_info =
*fault_info,
>                 char *comm, char *cmd)
>  {
> @@ -886,7 +886,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_g=
em_submit *submit)
>
>         pm_runtime_get_sync(&gpu->pdev->dev);
>
> -       msm_gpu_hw_init(gpu);
> +       if (msm_gpu_hw_init(gpu))
> +               msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
>
>         submit->seqno =3D submit->hw_fence->seqno;
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index 666cf499b7ec..eb5b3a7b81f9 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -747,6 +747,8 @@ static inline void msm_gpu_crashstate_put(struct msm_=
gpu *gpu)
>  }
>
>  void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gp=
u_fault_info *fault_info);
> +void msm_gpu_crashstate_capture(struct msm_gpu *gpu, struct msm_gem_subm=
it *submit,
> +               struct msm_gpu_fault_info *fault_info, char *comm, char *=
cmd);
>
>  /*
>   * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that c=
an
>
> --
> 2.51.0
>

