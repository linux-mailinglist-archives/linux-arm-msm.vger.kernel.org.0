Return-Path: <linux-arm-msm+bounces-107546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M1/NL6QBWrfYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:07:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F153F966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCEC230469AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C473DE441;
	Thu, 14 May 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xq5uT8J1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOti3RSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732F3D9DA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749576; cv=none; b=iaBY9GL0mzpNLmBVVrVZRG4VUhnVQTNrjJJ1RbJrlKEwBlvf8870gLFy+9XtItpXqA+EcaS3niCnmeCmCNngalbaAqO1ZztDJktEA4BV2roB1pBI2KpbwZqPJeBt9h+mN9mbFxqtzKY65msd0TLoKjyHrQbxYdtCt0WhfcPA4b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749576; c=relaxed/simple;
	bh=vh5KIaHQcsvsGTIdhKFA4r19rfxCoAw/feb3ERfGRg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G5AxDALR39EYgI+jedA7cNlleJcJKuawRKkkflDaX7By1Fjl3LpobBian3Be3qFiuELN5MDMNKBg9YaUck6t0AuDC+ectRfk6RJK/+ytdRoH3XVkzU/LukzKdKBnAlM/eAnCNcYED+wpwQ7zEiuw+Z+UMYzZHYdIoYJht8uw2hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xq5uT8J1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOti3RSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E73Ti4359467
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L/gWGxAxU8XUOeT0G9p8NJEU7jkU0jYtw+L
	tJ0jNbWo=; b=Xq5uT8J1HxWrmqqlvA4c+n6DhrKJzqtxcFw2VfiX63g/ftxFdPe
	IxRsn4vpudE+0vK2q3YdOKky86jZ5gpnaXciCtJfMO/HSxEOFQcdP1OEl8uBu+SX
	srfvso0F/oxNGwN5frGFkrye0SM1djiKB6929OH7UbfCAjqD5PYhPhR2qYLuksgX
	20v17hHuxPPW26gl7JVOH7wvUpZ63pyyGPQTcW0n04MEptFyX864LqR5/mE60hqy
	TG8n6Qrzfx7FkWE9bqSHkrb0+Y37hcKY9f3EfYKQySzBDUgrwlHyrcA1Cqa2kJIc
	IFFAICc4kv+GpSVtwkyJfw7wOmCW06NXNbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513g9yed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:06:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc49bef6so117082941cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778749572; x=1779354372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/gWGxAxU8XUOeT0G9p8NJEU7jkU0jYtw+LtJ0jNbWo=;
        b=JOti3RSNUunE13fGhAYsseYUHV6MHpn3XazZiskPxeDSLy9+q1BaRfiMx52/pgj8mA
         FejgGlu+oCaR8jIvB3/DumbjmskeQPDkO1ppB5vK1MumKfb2TOZlwIjdZ7pU1SIRLuMs
         RpG7U7WfVdLY1wUleIkbZrZK5tbWMq5H3Se6GXBhbS4CKimX90/WOJDGR3t9ll1vsqBy
         0kcpnGmS0ljoikyeSljbtVMjbz/6xOPV8u4euuhsXuPO8mlNK8mqCHy7vnFgDZh3Lqo2
         bBfj2XZ2t4PqT5GMJfkgXJ7HDMdSmpCgFmRVYk3Fckr/ikXLYBQ/WtvhLPC1o59nFZ37
         DCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749572; x=1779354372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/gWGxAxU8XUOeT0G9p8NJEU7jkU0jYtw+LtJ0jNbWo=;
        b=k8aif/CEonbJvCUzFvuC3sM4idNFt1J+1VyJK8Ass/BXPiz5JvjVC1LUgHel0UiEZn
         o8EXvXXb0wWL3SLZ6gt+6A4DlVfeCHbQLdt0N7vKGF3vFuHyqna1JwKcqxkxIqqtXllQ
         iP7m05+Ch7su2ycfNwaiqye+yPtCVrY8GHcHlbLnB0+9qUnKNu5wMnVuoQ1EGVNnFMpi
         tELxBjNpVlRerr0jBjVFv8wJV9IPn9Ejdm8xaWfGfmB3t37JKhlR96KqPO+HiFoRw+JN
         JPCKf4hJ7OSdL4NWw81xcKGVxgABdbvO9Wd5y9dPaxe7dAxsiJN/m0SOIvqzICpyaOj3
         UUiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+WnR7rtmDTbW4hGHEgksLT1xAuFIfje0evnJE6UUz+0hK6/qOPnk8miC+w3rIckalNBgPI8R9mKA3UnRm@vger.kernel.org
X-Gm-Message-State: AOJu0YxRzC960B7ExY7ryoXCvPOGDEogm1JCeDev7dchrBvpFXcqWOUO
	jnYADQZGubPUGyGbWunmm3+bUw6ucdYv8GkKYS9/Pz7enVOkzkm418ed3lTsgKHMOXg8pnrWOOy
	6OjpT/tlCSMxNN9V2XARLvBGL2TAxziR18YBLe6dyk0B21VgL2wUAUSR65sYVEs/s5e13
X-Gm-Gg: Acq92OHUFBIznQGEBCyGP3FwDrsfDT44X5UH7CYtIuGLdKE4egX6u/42Hhe2+Oe3gil
	jlmvTwIl00FhbTd121dcaTTfCuFF5Z6eg1CJHZsHKhl5vDJye1pKCqOZo/eNUSftiNpW/rp5hiY
	Tyl+mNnsPZkIsyTGoPLD+rU5I+v1OmQon5l1Mb/sh8oThwvymGZEqrA1gSuPG58JhTaKmo8vKwA
	ZsLu7yKdRBzi9WsZts0M6JZbT4rPZ2WyOAsfv13ZPDc9i9UV/iH1R7Lsp9SlLHy4qTpSHJpok6w
	0ym//sUIv91T4FbAt97c0F1wZtwpgTVr0mimVzLC669GkR5ZhNThucE/CGSi4bE5XAM2PxhrXBP
	mcFA5tYahdIeFM9BU+vf01anoEc9BHrhXtLrVpDIhnqtCuuBGTEGAkyI=
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr85994611cf.20.1778749571731;
        Thu, 14 May 2026 02:06:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr85994301cf.20.1778749571289;
        Thu, 14 May 2026 02:06:11 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm5516099f8f.13.2026.05.14.02.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:06:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM buffers
Date: Thu, 14 May 2026 09:06:07 +0000
Message-ID: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MCBTYWx0ZWRfXwTP5Yj02P8h5
 35vZzWXY5wiD3YGt2GSBQvZuc9v84+yJkoOOvMSuLSBrNiCaxv8sWj6grjp8aZPZ5XX++QSvSF1
 s+hO9EkGIc2H8TFNqCw7kCwRLsmp3V7agEfoS2WnfZ43E2JbxCNbTx3r7g919ieC3x+/D4U++xx
 FgMIC98xIj3Q6feQPUYG685ulFC/CB5YW4WeZmvXl0CxfjJle3jngRzYbiRtQHEgNURGYSxOkdn
 ozwfrz+l29RzlXyrw/hyERXymKBxXKnGXB7z0k83N0b5BolTx4VfKn0megCTRa3YQftlzwHcj8U
 oZn6T2voF597OQy22P604uOQzQhF18p5+Zel5jnXoqfraAB+FdovOXpIDckUMPcBFyft8KJwTDr
 +ocdwPzHYvs2yYzC3glsR9yisDL8xBt/8qiuJ70Vavg6dVVwN9vOVL5lqFljQz5+r1YW7Bnj/Da
 v/uHaxSvgajNIGZ84YA==
X-Proofpoint-ORIG-GUID: r7RI4zGI7oknfHXWAGxoCsRh8oBO1xhl
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a059084 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=lkiG6VF1Dg0u3OGlhKAA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: r7RI4zGI7oknfHXWAGxoCsRh8oBO1xhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140090
X-Rspamd-Queue-Id: 2B0F153F966
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,oss.qualcomm.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-107546-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oldschoolsolutions.biz:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some Old DSP firmware versions use 32-bit address arithmetic and size for
validating the PCM buffer address range. If a buffer is allocated near
the top of the 32-bit address space, arithmetic calculations involving
the end address can overflow and fail checks.

Work around this by increasing the preallocated PCM buffer size by one
page. The DSP is still passed the usable buffer size, excluding the extra
page, which prevents the firmware from seeing an end address that crosses
the 32-bit boundary.

This was not hit before because PCM buffer allocation and DSP-side
mapping happened at different points, and the size mapped on the DSP was
usually nperiods * period_size. Therefore the mapped size was unlikely to
match the full preallocated buffer size exactly, although the issue was
still possible. With early buffer mapping on the DSP, the full
preallocated buffer is mapped during PCM creation, making the failure
reproducible at boot.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Cc: Stable@vger.kernel.org
Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Closes: https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index ede19fdea6e9..3a1be41df096 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -497,7 +497,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
-	int size = BUFFER_BYTES_MAX;
+	/*
+	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
+	 * address arithmetic can overflow when the buffer is placed near the
+	 * end of the addressable range.
+	 */
+	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
 	int graph_id, ret;
 	struct snd_pcm_substream *substream;
 
-- 
2.47.3


