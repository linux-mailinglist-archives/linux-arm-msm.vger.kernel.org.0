Return-Path: <linux-arm-msm+bounces-101467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBr1APYkzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD14385ACB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21A9C30451DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989E33A3809;
	Thu,  2 Apr 2026 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbP/Iwwk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXo5RIFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D4D363C53
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117510; cv=none; b=mXAH2NR7q3MweZP8ayYm4ImHuERE9jeg/a3VwIwQ1iy0ZQZDyquq2lfn7/fWRCeYMxI7AQwo1oDKmHaWDXkuZScovRD41S19CRgaw6Glt5d7XtHfdxGIO8CK/jDoCi1bV0rqalAkzIBqbsCbP+35LiwjS1yGb8V97AnFuFCk5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117510; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjOb3nTaERnpbd5Zx5u5HSwsI/eUiEJNt0QzUGlFHk7woOMbRzUnCTRHnfkzIhPA4NXe554SzfFPlAl7m9zxthLRfDEYnvDgE/VqIX4QC6qG4276dRmYUtwpkhkJ02nGm/Uj/RPr+/T1okCkFGLlnVBD9/jAfdVmBopMCe1rLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbP/Iwwk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXo5RIFx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326q0J63745952
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=MbP/IwwkA5P/60aFd8tkjI+Wggg
	68f5Xrm5x+SEKkn0LU/wpgt+4NUM+f91z1TIPzo9kCj3cOstMHHCB6jXiKiUYbkq
	/NVKO9l+S06qVHNtd1Dm2D8Qt0j92y5Q2ZyQpS516JCUYvtDg0eLFZloTYszfOed
	T7Bkt8sCU4A0RV0jcrqa3ZEpLKkVmiruYYlFj+x/E4OJrwIkRJM9qHpEbW0USQvJ
	7P2WqFdAIe/molFcmYx/V4C14uHOq4/r73ZjZHOOzM0mv8rvs7XxwFinF/xmUfW0
	hhbEe6OR49yQeapdpKOkH9DircQ9gK6MQCTKJ5nQVF3dQBRHNRMlXnEQfTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324m801-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50925fed647so16601611cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117500; x=1775722300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=XXo5RIFxZLvbawLShlLl/h8R3xYBksbUucP9YQDzm+V+aoFgeQiA7FZ924MyZ9h586
         iG+CblDlP9UpZwoCM59UXvvbroDB7qh8bqCZEs0tpWeLMMuEHQFpu1IietR4IIDFbGvu
         dbaeC1M85D1TJ+pGtFJavG7kyEPG6E1BGIlGZsKOXTWgRieEMS4yNuHFpVtdKyach74D
         5U2g2VorMgaHRwuq9Ulkfab7Oq0Z0TOhqvqYcdbaB2c3zQwk6aTqdX1FXZXrmgf1Hg2M
         FLekyzgbe0EqXoMyJdA6ste3pJHLWFnJ7vhfjSCU6Q5Olr75ZZAUKQ1RjTdNKPzky2Xp
         A1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117500; x=1775722300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=o8CxqUogD0XweCQ3o5hB+DT6QM5us4SxfIa6m1rTK+05wSvKNZkFwaBZRUmAbGuQ1z
         bOOhn00rqIFRdYUm4cQehk2sw+z8P05zkWradWCSPO7KhJkBCpsSYH31hud1dvNisCL3
         MM4mDmxxYal87OubzYz8GKP8gFjxGNV3o5zMay4IO3SMTr/y/zZMf7UY3XOhHJfDfMXg
         AL9rdsjq9iA049oh68c7MfUKLD8+nJPoaosDonq9JBoPTGCLI33VtCnwIRThZ5Tms36p
         IHyt9NWv63X5aOzu50uWFLJZrIAhPsKcvmXxV4TuFtP3iHATO/yJBojiiEgeHa7mPac9
         DGkA==
X-Forwarded-Encrypted: i=1; AJvYcCU1WaCZ5hY/P7NargBQlS0xC6IYBK1fCGUFSHQzAhu2KvRcMt9jrJfldOW9Of+j1HxdOq8Gd7hALyiQZf8x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Za2y4OFVDysmK4mf4GPBUmp8Zm1MUrdVyEQAwQY3YCxa0CfP
	j92AcEue2MlF1vVOJ/Bk61PGZVoKyV1tMxuMI2GH1mm8DkXXalr9+R/rzjcnASKMRSJk1Igc9rh
	b6McHdNaHqTEgvSewQx2V89rR3h0cNK86fViu4t1wC+065KpQE9IrYZwmsrDgJrkdk44G
X-Gm-Gg: ATEYQzxFd/TvS4PF9A6Fiv97DeRgD94dVEy+BQR63rg+59n9ryQt4QDIJmXo2uuUC3U
	HsJerWps2PHgN4qKqcqCdMFa9+keFlgnoRSHnKjXlJgKlsoSvllyvaLeO5fArbsbfgX59V3USj3
	HVvWsd5i6IgY+Xc7CjNL9YdL5UWNUVKNPrbT2XaO/6HgeBunfktBkZ4mUkSQgKQuyBhWBH7LHOv
	9uwnZfE2L8wnkzcT229yBSFFWvKkZQQK+iMJ+hw4jGd/PysZWpf0ymCzgeNcc2sfmJDYdCRupUr
	xS89REiefSLZxE8kF/YHJm6A+xUJ6ppk4G0OnbTlw2TdcFb9IKKjCEvbddAMuznq6l1v/z97irM
	kiJZTQ7okRqH+xcrbfUoYMJh/YWVed1v/zqlY7jPRDUE5hmb/LYwB2yc=
X-Received: by 2002:a05:622a:8a08:b0:50b:7113:7170 with SMTP id d75a77b69052e-50d3bd858ebmr76936441cf.39.1775117500550;
        Thu, 02 Apr 2026 01:11:40 -0700 (PDT)
X-Received: by 2002:a05:622a:8a08:b0:50b:7113:7170 with SMTP id d75a77b69052e-50d3bd858ebmr76936211cf.39.1775117499905;
        Thu, 02 Apr 2026 01:11:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v9 08/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Thu,  2 Apr 2026 08:11:13 +0000
Message-ID: <20260402081118.348071-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4lMTTqZ71hLXWJCV_ZfU-lQjVb0J9Zc5
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69ce24bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX8yPb+duaOOBT
 ApI7mgrhYy84SbDJCJlI9WWU6Cp/1H8TrUmBQZ4MWw/OYLE7ymHVj9hHVgDfa+JVVyhPs8DRHLn
 JFXT4WroG2gFgV796OXeprUzcEw4HzsrAFm4kRP4TtCucfTV56LNsrpNIX/KxbIWeVvCSHPFiKM
 m9KB+YCpRGdS6e7HgXchF0fDxmTj0B6Q6r7WcyPW6ceGpMroGXGeGkJx+3UOa9LtjohPqMYqQN2
 HUQlwC848W6vP+EVVwMo4D53bG87WgWEDOeG5UBYxH7hyb84soy3aY1OZDkdzWlYLhN92E2Ek/E
 8LE0BpTh082bF6xnl1tACGFRcerrZOfSZ0an+ZNURhCmVEJlJKNcTgH2QhC5YNGOhdjCzvxs4Yn
 TPNuhkCKJPn+XRcCvF7QodPFKA+LG+glOCkicTLuaJ5blnGYOtGho4H16qyfSUJxxKHVVhpNmIk
 W/px0taHpPvK6lHmHWQ==
X-Proofpoint-ORIG-GUID: 4lMTTqZ71hLXWJCV_ZfU-lQjVb0J9Zc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101467-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AD14385ACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for LPASS LPI MI2S dais in the dai-driver, these dais are
used in Monaco based platform devices.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..d31388ed3ccf 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -96,6 +96,42 @@
 		.id = did,						\
 	}
 
+#define Q6AFE_MI2S_RX_DAI(pre, did) {				\
+		.playback = {						\
+			.stream_name = pre" MI2S Playback",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
+#define Q6AFE_MI2S_TX_DAI(pre, did) {				\
+		.capture = {						\
+			.stream_name = pre" MI2S Capture",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
 static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	{
 		.playback = {
@@ -484,6 +520,16 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
 	},
+	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
+	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
+	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
+	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
+	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
+	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
+	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
+	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
+	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -636,6 +682,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 			break;
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.47.3


