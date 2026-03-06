Return-Path: <linux-arm-msm+bounces-95802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMcvG4rHqmnVWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:24:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190C220878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05D49308540C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354DC3939DE;
	Fri,  6 Mar 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZivXB+9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoPKQgjw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8095438E10F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799738; cv=none; b=JZtvv9jTrlIluhiyCEhtm2/Y7gO4+l5+HRqyRRo/iMisiMzFoo2dFdLE/CqmDNSTbQjyp5wfVDKQyeDIxd5XF1VmByk0g/20Vzc0RS2DrOYqsFGJ2tcgb5/cW2ZjPkN0h6UXDcJ/qnfx2+7LUB1tCeo/MpQ4giHp7oQCOoWtvQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799738; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUkVSRQ3UJ+ZDqVatTEvJbup6ab0oZQttRc5/JqL8N7W1Jw5HV1uoa2wyiNo+SAJmYWD/rLUYoHObB9zKxyBGTZc+3V+gfvq6Nz0/IYonZe9GvPrzdGLbsIZ9WyEShtfebzJ5allwl7BmineFO4p1gKmtAU5zrb2GeGX8kEfeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZivXB+9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoPKQgjw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb1uf3406543
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=ZivXB+9sdb9jEnHianVoztRnL6C
	9BzXQPCnKFSF1TxmV+2qMxT42/p0f0DYYF9UyOkdlA4ekBbXM/RTRrFWc1cjq7B6
	NlPhpIgUf8b9E9d6lwriGDcB7K0H+lQWuCfteWePXNdFafxCgMGLaEMdAoDXtYLZ
	SPdaB2R3lyNy5lF4LMoNY5J1Trn709CxentL4JCpSSuFnZIeeyqjxRLAhsWlYkZ7
	Kl+274Jh2YvyIV7eBdVVgJmcb2Tum0ap/4xmd6ez5eXQXZrJCmKSfeXexisfzyGN
	eTPjBS/kxYMEsxxqc4+8JScgFWcdaeoz7RFhYsF6eRwxPjswfgdnXsIczKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u8gpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5033b62efa7so595178991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799729; x=1773404529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=aoPKQgjwYtsn+EF3bdo8MKnFIBNalPawAFrnnoWTiBfVMRnjTSn9ysA1zixd00aF/r
         DBOEp7a/yV1fyOLbFVsJTVhP05y1cHfVvsNY7V7Crb690uI67Xox/ZEJwGqh/RefulLp
         8bIMdzxEJQNSpJ1QMMVbae7P8lp+Lota5U0kx++bAylEcIcv7ijujylvfn3Sm6rpquLd
         TZEGn2Gom45fCmDaBbY6SsX+B/u/AgNsGehOkXWBWxyYzVBpY6wuVReVztpQVOhFE4M0
         tT6N3wTFd3hBOF+6Mu5T+I6LqPU2nc+Fef5ahoefF5XXExcFc1pmRTd/GahBHeMRPjB8
         IDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799729; x=1773404529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=iA2bkjvkNli8XhKZ8PVA6kSjTFmgnB77QfS9yLYAZRWsZs3NcFJPdCwkFOntPL/WBh
         fG67xUVFVJ6KzlnYgb1eJwP3aviZfrDgLMTVogq/2yO/kvVW0zzLvAzgKhRS1g19hOGz
         rRZUQDI5RWrxvZq8CI+JDYYXp378wEjiv6xBakSMRNoMEa4jmOueMtk+tXrmM97sEeHv
         sb5s/OFNDUeSAXq5x6f/qj+cO6AmXPwYb3eRBA1xA/7p5v5aYDJvPTRnW3FAyC7rAWQp
         FxX1b7OwlxfVbOuGH1rLz4yHdfZ94VB8CXc2iwgEJjW4bIxaErMmigbHASHsndD1pLSG
         Px7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm+LSQ8jNUfO4qKCnqWr2RRrGpuuCwGh0BJaxDGlM9jCjzp057odFrqI6RE+hTV0psTI4yXxVcplyKIW8r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wI17hZePcqOY70CWcWmji5ajNOifgWkOOnZIILv46HZIRqkm
	/CLruTaOgZ/SNEESfIOFif64JHO1DGrRSi06oBKGIlVpENLtqPh4OknMrzkLC7Sx9VgnjIP6RYo
	WdJLB+8faARAGeTvt8hHeT64cezwbIyYi+fFYklVznZzgqCP5PM+Ktz/qkPsgsgZNXRye
X-Gm-Gg: ATEYQzzJ/iOzwECMM0aZ4H0p13L81GS6hCj+m4C2MFmxk8UyrBPvd8CchzGrrGwgIY5
	Acica8PNjRsB6QVuXdVr75LRf6sbqC0NHaWYEHU/Kgpsv30OEeWBTOHvzGK+A1lqrwey7ri1JQy
	aINMj9LVZRS2HEu+OMVJX/NBiozklEDZZTojULt76jHMCUW/leLQfsD0fR4qngITAoicCsDJxe9
	v9s86guuRnRFhuEC9rKsSGFLEABohXjIQsPeIhv5gUX2nDb7uH274ELaAzP1KdLzeWoy/Qdk2KL
	LHzrkYMOodsWAAjfPjj0WgqtyNgHytp1y6zbp2h2jtskHJ+DinTMBstjDbp93rL46STYhpaQDi9
	Dq6MY9t08YAS7wypXmnY4OVasJ3jFW7Uq0dFHQsKeiflrh1knB842BY4=
X-Received: by 2002:a05:620a:471f:b0:8c6:a034:9220 with SMTP id af79cd13be357-8cd6d44a501mr233124385a.25.1772799729239;
        Fri, 06 Mar 2026 04:22:09 -0800 (PST)
X-Received: by 2002:a05:620a:471f:b0:8c6:a034:9220 with SMTP id af79cd13be357-8cd6d44a501mr233121585a.25.1772799728800;
        Fri, 06 Mar 2026 04:22:08 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Fri,  6 Mar 2026 12:21:09 +0000
Message-ID: <20260306122115.509705-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX/ux2m/vAsbGW
 6YlYhsokYj7zgk2I9Aid+G3pmqEf3nvDBc0QudDkCITYKYmAaxu3J4x8A5aM2/dTzljNcOHKabf
 Ztui/RGXOGVEa1TxX2ypDB567wcxzTLTWppqQfN+sgicCJxNRkIC+nu0wVBkIXJM3Y64NJhQJ1k
 qib6hMWzhKx5cLmvKaRiSoScGHVkYU56tMZy/KnPgCTFNMcOTSeyRXrCYvFyKpzKgKr2fjLB8wj
 yCF0AF5NW3fgzxpvoZXZGorD/7rT/7TJNdAxjaYomfmMmkh8PUk4azCl4FDvdc85tGjoAyCUON0
 cOaCBqEqvMgGQiWxyXwQcHIHZDAti42NhlivcHE12Atnkj6wvzfn9nfpjAvxDQ0DQX4G5sMLYNy
 5p3g+bMmI0n/yuG8u/3qfk+Wk8Sjm7Na6wxMcL75Ewhc6Fy+tmqWpPIwAIbxge7aCdjg+WeV8+p
 NA6KBPo4MsT+QBTQCtg==
X-Proofpoint-ORIG-GUID: CjRC_wDgSkEJtYRsloaMxlk23EMPvBTs
X-Proofpoint-GUID: CjRC_wDgSkEJtYRsloaMxlk23EMPvBTs
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aac6f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: 0190C220878
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95802-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


