Return-Path: <linux-arm-msm+bounces-100105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLO1KmsaxWnr6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:37:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 366173349C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1126302D766
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5BA349B1D;
	Thu, 26 Mar 2026 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXp0jmzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dm1bRVAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086983E928F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524961; cv=none; b=gf5yTSNIClpjpZD7v5/MIYE/CRXAb3dHNZeGwbayh6x3W1mcgHMcEpX9acOFtTBhJ/iXBjtKUcftHtIDDpJQpuGxqNO5YqxrH0J6430X7YTQIXXiBYfi3IjHgN2AVkegqvTJiTdii2Iylxg2/+4VT1HRVbbNfpT+1XBJL7VqP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524961; c=relaxed/simple;
	bh=V6ehlQa9ayCL8rKi7VK8KBiRrnMyybzMPfmXdw+OW+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kgF33Jzx+thKVbZ14g14y0Bal7sZboe8RiyDUPJGa7QYR8jNiBQzv54423GlZS4jXfDdrDiQ/YG7DbS2F6O4Dy7qIFMOgL4fb8YMdmDZGUmLgYbn4gigqUdG2AVCeUMUmJtL+pyX7iJ7GWdcYFmo5lQi6Xn7jIeC/hz9CV0gy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXp0jmzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dm1bRVAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6uH4K1061708
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=V2JUEb9XnLWYEtum+/ea+IwQpPPOn5jZptE
	ogwy1kX8=; b=AXp0jmzEReCh6Y7hMk/XLf/JiLMeuWfvOAjGt1u5d5XfxiGzqd5
	YwOx2q/o+V/nXdl/cbYD6KvsWkkQnZDK3zbXyD/IMCBOyoVCp10L4eu3K0lsYBJu
	FXk4ikt5plMZV0z/4MpykXiuNy5spV8p6ukChBzpY7A1xih8FAGGD+amq9cQnyPH
	50BxqOcAR7hBVlGjeYdzFDCQ1WVTx2oCCgk2ZdOwH4xgzlcivyJ/YN4TQcDUhvdi
	U9qlJ2prREI14X+GqPnqfgZBYkOuh6beLRdI1w5q3LIppZc6tsSYRgRPcqW7h8S6
	BMUe2KELpJf5REqmpZ0wj1/wVE6oE2Sp7mw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkstes0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:35:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so204376b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774524954; x=1775129754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2JUEb9XnLWYEtum+/ea+IwQpPPOn5jZptEogwy1kX8=;
        b=dm1bRVAe8vmJslkuoZG526GRkGKxj2VX2Hoti2V5/7SX0Amy7m2mIas3QVAWj3GNAy
         aCM/62bWI308zntZmduqtHv1zOe6l2qgzH+I1La8I7uSI35wDe6Pg7Apw8eamN5RyaGo
         IjvrBQmQzZGox+0msnQT229/wP1/OXnTdq2JDhcc5KepIgZmsNqvYTq54e8NXQgHy9FX
         naFmzVMs85UVGWVa/CewqA2LW1J2zO2za3WIKSwduyq3FVtSTVfb5IIVYK9HQwVKIJIT
         lAi+/uXNAQZ+YkDV7w2SffC+dklyCNoH/RW/AG5bpjT7yamRCwPPW3U2nIHJenuzo90W
         PoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524954; x=1775129754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2JUEb9XnLWYEtum+/ea+IwQpPPOn5jZptEogwy1kX8=;
        b=lFTkzVhCc6Fyuch5P/QMbFnHNNtZ0P7dK7N5XFEvqPd1D8M5z1yJ1VweBWhs3OlK+g
         VslQ80uaDl+eLXLPe+BUCeBpCS5GQV7+xHnUAI3OlDUNhlo1OofxDL0AiT6v+euA5FnP
         1bnDXfLJloDj9762rfDVudFZ2zvvMkTuZ2MDdOI5MF2KoOEUQOezJiFkqd/mZAjnh+XY
         F2AnbM8mYQg0dQtqSgKcCboLa5zn9MT6qa5mgl7Ga/3KCx71xtQDY82/Qa1V7DVnl8o7
         8fDxXdN42WoxvBQlGQHqzjDm35R85SRV9/R8DVNN1Wr4JlFVDE+IAjj9/xEjjIeZvdEv
         23FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzll9H8zr3EdcT9YqQ9l/04JNjbvP/JQibTQNUP01EzPeGsDigaJa+x0tVTP2zR0YaWKupqmU1aSwubWXs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jgNLpFmt6zh1v/4mRV5zhVkB52EYuXCX/BjW5+e8ehaCnxYZ
	rXeo9wvmb55W/YOlvLAUwvIAYcufq9z+vuv1Ra1E8uQoGVOhG1ZuU4KulH0luPtv0Cb9guVbj7/
	hxsLJXpNC4uFFLnuj4a+e98FpNy/TkJu8xiGxqZk+mlQB/TEG+hRw3t9q6LpqXomjzYHq
X-Gm-Gg: ATEYQzwPn2goCq1+CYe7aV9DXh+XPqUfqioMpxnH2qud2w4UcTBeE3/972LIro7vFjg
	e5WdjreFivhf8INohcFRdg0MRSjzGN6dSkJyDYUQ2/p3JXrGC0sdLiMYLNBLlD49pGuws2fxWjm
	bOsbfxoefmwKKvltsPrkuAyUssQIZ2+QZZ+5ykiJdXaMZCNskv0GqCRfbTQKaOgBNrvM7UkJtTA
	KZR3aOJqlMuGdz3H473nui9MPrcGahfcrxjjMX2v2c/1xQfN54fDUGs0aqwmzMhPS65YMeO/jIV
	mVeIL3pN4J9XYB0j+bHIx3Yz4FScJUZkj2ljkL9dBQpUPDQOTVh0WfqbnixAsNSbLYaj2rxPgqc
	U70M8F9aG6QgNy+4QRz4DiJoBeVx3SKEhcXl3ntS7F0hTHddTN7k=
X-Received: by 2002:a05:6a00:2ea6:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c6dd34f8dmr6892620b3a.0.1774524954482;
        Thu, 26 Mar 2026 04:35:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea6:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c6dd34f8dmr6892574b3a.0.1774524953812;
        Thu, 26 Mar 2026 04:35:53 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7cf78d9esm2213782b3a.0.2026.03.26.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:35:53 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2] ASoC: qcom: audioreach: explicitly enable speaker protection modules
Date: Thu, 26 Mar 2026 17:05:31 +0530
Message-Id: <20260326113531.3144998-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MCBTYWx0ZWRfXwYJhxwXZDNCj
 /m+Gm3U4cWn1Gm1dFO9hPuQnVceOvInBWJnqQvJEw4sxh8MgBp2JrK+6F2MWdWvPEUa1ngf0cV5
 sQPu/k7c79EIK5jZTgp0WuB3skBlI4+cOze5FqeVUP5LjoJ+yuudQqBoMWh+HcS5IZpNPSBtak4
 LSI8HCWMmtZIPBx5lC+Cz5M4eYY/AyoLAfi5YB6RdkyxfSI3KWu032Fg//RKy/fB3bB3lbaXB7T
 P+nRtZ89F8a2be9z1Axp9vkya/pL23EVFyGzszB4M02/lUp55/zwIejKnUBJhDs9cYZXMk0cgM1
 vWoWAeXQD4+P4BfDR5m/7QwPqYQxMsjnKOCQ6B1ukhEfAuTLegJgTKTzl6HXgsll/nrmcPf7XJi
 lq/cPb4LwC4R3aaG2uef2UA1l8OHWWpTeRRfKkYp+hC3Raq2VJ6sL8lt9aTmwGhTftSGzoYVDzl
 +q04lHEhmN1fLe9yl2A==
X-Proofpoint-ORIG-GUID: 7DGthymoSbQGkIQnJqSN0R0f89cNnIH3
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c51a1b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7ID5sDieJ04PZcVNw4YA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 7DGthymoSbQGkIQnJqSN0R0f89cNnIH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-100105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 366173349C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Speaker protection and VI feedback modules are disabled by default.
Explicitly enable them when configuring speaker protection.

Fixes: 3e43a8c033c3 ("ASoC: qcom: audioreach: Add support for VI Sense module")
Fixes: 0db76f5b2235 ("ASoC: qcom: audioreach: Add support for Speaker Protection module")
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
Changes in v2:
        - Added fixes tag suggested by Dmitry.
        - Link to v1: https://lore.kernel.org/all/20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com/
---
 sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..ff8cd55b0d89 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1365,9 +1365,14 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
 						   PARAM_ID_SP_OP_MODE_NORMAL);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION_VI:
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
+		if (!rc)
+			rc = audioreach_module_enable(graph, module, true);
 		break;
 
 	default:
-- 
2.34.1


