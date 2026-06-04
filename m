Return-Path: <linux-arm-msm+bounces-111266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PRUAG7/bIWoaPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:10:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFDB6431E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EtvjZ67U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gkCqmE+l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111266-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111266-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 599E9302815B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DEA36BCDE;
	Thu,  4 Jun 2026 20:10:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7803C060E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:10:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780603836; cv=none; b=LIL25CImEOGm9nOA+jo+qiljkNRujiZmKaKh2eHQ1HunKNwcfwbu53WjotcIe3o6gBJ+oZJGvo+J+QGOxrYjqt5RB3KWkWVHi6WhjCCiFF15z2g9bJ8sVtpClrDc3yJnwpd1pgeMB80UJieJF4ob124xdEyILV13CkEzRJZKNl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780603836; c=relaxed/simple;
	bh=wHoGXQU9dFdgruL7hvn5v4jzjH/vWWmhkuYCdF2Uji4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttdTMxrh+PN08cRoMu/XyDPvn3OmPLUWmuIyklcKFS8h5OeQZik/oEGl6qiqEJFMNH2xtuE7e1qdPf6M0qYwdtp1QtIT9/dh9eY+qTL6sxjO82FH06nj9VIyUMoD2oUWJDYOzxblM6QmT6aJQufxZnhcVEvOkPQHxhy9BzZ7zd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtvjZ67U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkCqmE+l; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EjhDD1132208
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 20:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DRR+DEsprtUEBKuBcsLnY2CFiQ0q3UugCfTWP5lB0eI=; b=EtvjZ67UmwfmuA+P
	l62GxnULxz8Pff/OAWdONMrbm8Qm868J57GU6ZUhKDVyaCkElO14hCfrDgalIQWa
	cW8dMGp/0L5piu1IJWYDXY3FYGe5fpgKzDWp+MfsZHYv0SQICX4OjMbU0ejriint
	tR6qFyX361w5cbw9ArX1WkKdocTcS70Ac/JSYF6Ro0n+DxzgTp02yBH9PAerh9po
	a2hQ/NvMqDbYjsw+rO3V7yq/KaWOyg3IDX6UpR/Cgr9a6sU0Z8LmHFV8yCz6q7oQ
	rdUVwsWiRNnAmM6WaF7FuMHO3daLJAFcpxNZ8YLIsMVUNCX4NOBZOtKSMPWqlCGp
	uF4YkA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsk1tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 20:10:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8604fbe71eso420215a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780603832; x=1781208632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRR+DEsprtUEBKuBcsLnY2CFiQ0q3UugCfTWP5lB0eI=;
        b=gkCqmE+lh42O7QRHCZsPbjIQZZr7HWpqnZmzIguHo6/JKoKaNLYUj6lU/1cE7GG3gw
         J2VtTFPEuedRbOFZkitOI1LV0jNKwJL+3RpEXuikPiWmz6FR51oCgmzhKqhaFjQxsdgA
         ZJugAxBFS7x0bDqY770Rgya6citMI3BM2pl4dJ8rbhIq5/LffHfwFBzseFqHZZXA5kkq
         UKBSUcNd9wj4SPTV0+skINmq3jpcs1YgH4aNlNLbkzeoegtZJ/Kn+/NZzgyZy9H9dEOO
         6iiDDyVuNi6vVB1dLJlaCwZt7aN+s8xqqMufAdDpKVWTC/7MEE1TwT4IyFeHv19VNhvc
         iQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603832; x=1781208632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DRR+DEsprtUEBKuBcsLnY2CFiQ0q3UugCfTWP5lB0eI=;
        b=XUu1NiL0EzGO3K1gBD/JMRjQ3HNHfNf36gsmXYnBpz/aRaIgyMCmN4nOwKHDSt/uai
         vW2dno1xwD+xPZb6zKHIHWIH3r1xL2zE9sKTZgH1YY65mBSZASDKLYx/EcMTgqIif4NY
         I9Acz+Kj3fPDy3GIi1ZZYL/Z8BHWLRUYtqet4+3oI0eg8kSNS72KVlkcKNbbqSaqKoPU
         3a7ctRqtD0Euod20NxswM3ccxsgILU49vNid9IYN4t8BflUK8mXAMVjo0D5DZuA00Aw4
         iMTRWVq9SznpCn+o9NLtSznrxCyBB9BT7Tc3xx1cwP3xpYnv14usvKds4cY3XPcb14vL
         aKSg==
X-Gm-Message-State: AOJu0YwUQTxKfeWZK86cX+80f8J/SchjzfeBg/qn3VszXePKeznAbD6m
	plaXjEqKpQ64IGXeQp/f2KfqPpbeK0W4NNRfGEZlPjYW9B9axKF58udm6fL5NtcyNTjChdFxueT
	sAkW2zbRgBxLFpFF5vK3wzFr/aI6RbG3qNfiEVGtIGfQkB/F1Nnco/k2+dIpPaEeuBF7hmbYBMT
	5Q
X-Gm-Gg: Acq92OFoeA+zfkfCs1Dtw3ZynrzrFXSPMnM9EhOc15njxnXmp2sSa/7l2d91mwIuQan
	VJAlU5q73P/EuSpgZkhWBBj6thrIPhkp+wVJDzPH7Tj90yYQLg0ilTZeyXhvxDA9E8AnIz69mK1
	CySKjLSAUNFyQ0minGWGUcLlUAukn/HLDJi/bjauYnzD6b3hACwo4Jnk1nw35VLHkD/WTtjr0UB
	gGueK+CICeKKomcoybpoIU4wQMwkYxQjy4A82arFiN/kcgwyXanSSIAD0dIddh8Ag1NsP8HdCoR
	B9ELTdWBBMZPJAiIqy6Wpehso2Lu+gFnC87o3FUcA6a0HLDy/wN/Ni0X5td8EyF+RD+2vScH0tT
	6lBHUcnXGQXNAme+iVFFWXREokyiqqQ9FQN2wEUavPTe2M2tS7r1fZTw4
X-Received: by 2002:a05:6a21:103:b0:3b4:b275:c5b1 with SMTP id adf61e73a8af0-3b4ccf5e49fmr579424637.26.1780603832563;
        Thu, 04 Jun 2026 13:10:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3b4:b275:c5b1 with SMTP id adf61e73a8af0-3b4ccf5e49fmr579390637.26.1780603832039;
        Thu, 04 Jun 2026 13:10:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428290067dsm6721425b3a.53.2026.06.04.13.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:10:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 01:38:21 +0530
Subject: [PATCH 5/6] drm/msm/a6xx: Fix IRQ storm during msm_recovery test
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780603799; l=3392;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=GwZLyTIP4u6tN+9squk0q6Z3W6Z4ioTBobufFLsa2P8=;
 b=C3/9ME743B0Lm0FCKaGp0Gd5+Ja4JNQooQqlM5wA8ze9CDAbYXpQc+igMT6uAcMJrOFxQWaMv
 K16zIciLA+/DuGvDYLk25lzrxjPB/JJ47Z0G/e+r+9geen0PHobjunP
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: sGbQJxDZpQbtGPJDxEP9DEUl-97KTZ82
X-Proofpoint-ORIG-GUID: sGbQJxDZpQbtGPJDxEP9DEUl-97KTZ82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE5NyBTYWx0ZWRfX9Gm4gjgqBPSR
 0lI6u5aexzjmLRlE35ArRTqhvNZSPi1Ws6kIe1G6P74UAloUrxMzp29DatlsheFfpelRk9C5qGj
 eYgcaKVZAzBaX+NM0W1fxixAkkTt/Jtao2AMQJ92oag2DBLgnJ1X9+QM4/8rtdqrFxutoCdlQKR
 V25zNIsItk6BaKaTzwedCUa/JyV4TuLvwbem2C5uQ72bI+Sa2axGso0mha5e5Cif8XsfAg/shh8
 1HfWIVu7Gl2yJNi82V++P0fzOAFy0nGtBL2diFS7Ht80+gIZTJyKDZfG4eK9N/wBrCbB/YGCCvF
 +TjwDuq1JwmiBYN5wSudNX25w7umnXN617j0tv/jMPg3ynqsCAISlnGmIZnPmto0KKZbtQpcC2K
 CI0CXtGIOUTP1AbER02no9NZFiu3Lf4NjhIN1wku115nOwp82WLciVIeSFi41Z9qkkG0tBCO37N
 /58j3arabfJacnTp0ww==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21dbb9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Tlt2A13xodhnW1EGk4cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111266-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BFDB6431E4

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Once a hang is triggered by the msm_recovery test, the gpu error irq
remains asserted and triggers an interrupt storm. In the worst case,
this IRQ storm lands on the CPU core where the hangcheck timer is
scheduled, blocking it from running. This eventually leads to CPU
watchdog timeouts.

To fix this, mask the gpu error irqs during msm_recovery test and
enable them back during the recovery.

Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handling")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
 drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
 4 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 2c0bbac43c52..f1df2514c613 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 		status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
 
 	if (priv->disable_err_irq) {
+		/* Turn off interrupts to avoid interrupt storm */
+		gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
+			       A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
+			       A5XX_RBBM_INT_0_MASK_CP_SW);
+
 		status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
 			  A5XX_RBBM_INT_0_MASK_CP_SW;
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8b3bb2fd433b..9a4f9d0e1780 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
 
-	if (priv->disable_err_irq)
+	if (priv->disable_err_irq) {
+		/* Turn off interrupts to avoid interrupt storm */
+		gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
 		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
+	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
 		a6xx_fault_detect_irq(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 9e44fd1ae634..0f6fd35bd587 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
 
-	if (priv->disable_err_irq)
+	if (priv->disable_err_irq) {
+		/* Turn off interrupts to avoid interrupt storm */
+		gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
 		status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
+	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
 		a8xx_fault_detect_irq(gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9ac7740a87f0..48ac51f4119b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *work)
 		msm_update_fence(ring->fctx, fence);
 	}
 
+	priv->disable_err_irq = false;
+
 	gpu->funcs->recover(gpu);
 
 	/* retire completed submits, plus the one that hung: */

-- 
2.51.0


