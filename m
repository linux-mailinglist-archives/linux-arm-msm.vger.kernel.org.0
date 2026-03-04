Return-Path: <linux-arm-msm+bounces-95319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKigCrEvqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:12:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6446200248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 450C430E9251
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3250831F9B8;
	Wed,  4 Mar 2026 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUywukej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQwZ9uqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D83644A6
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629653; cv=none; b=uni3xMLwvlXhj0/EH0O226/nnL9EuqH6mxxRcSru/3acwv4ie+/rxhzV3jadg7gaQWVLM1AAx9z1NnKJJg0eyweY9+zFnilQlmmblVRkjC9zxqVaJ5BwMLrsQ4V1Xp31uMQx6VFkL4lSPFwwJjUOBNPOEpgk1GAbesU/qXk6Mxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629653; c=relaxed/simple;
	bh=nhF962DJ35ZnGtg1Nyn29ALPxXwZIXyRUxas4dLT8SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSDlD+jmOXnSFpkfM1/GgW609shqHrqlplwO8X1c410HOVULhr56pc/f+U58nU8P3h25kOU5eywIsam4ZRProLruw2o4fWhnv9wWlavNZzd9h6bp7HZGR2MWPA3S18NtNA8aMdADcw1oNXYVgX+P5P/5WxS2oqzd/kifGv70k4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUywukej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQwZ9uqy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CxeC81203427
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZsyVHtwoLDk
	/xLA/rwLKIW8JVwySpk++YyIKH0BTOlA=; b=AUywukejqM4AUpWyuRd0dpMJlbm
	n3giRNHOwspYLWBNAkWz/THBbrhI8ocF6mYS0VSbSv7MtyyKZ9/qTi0gM+JIIn/e
	vsR7chu2TLt/Ij2GsnnEYopxb3U96rdc5hfsGxd0nC3nc2Fd7Mozg5qR/tPXtH1D
	vBFBJAcUaLGkl+O8+wYb6iqyWJW1AUapd51FnWaG9ykLRr6ICQU1gzOBHBfku+jy
	lKahgWtqt8tE0TZE0vBw8dHZZDag5Y4IkDBVcnX6jM50+rm3vrtH9i971T+3XnJr
	O3KOrZBZ/YlgUiLix8RR1mJ87xdmPeE3bCo/Ztit/wRuR/1kdW4RF4AXcuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c1a9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so4205676285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629648; x=1773234448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsyVHtwoLDk/xLA/rwLKIW8JVwySpk++YyIKH0BTOlA=;
        b=bQwZ9uqyykMbhHNMq6JGnv9VUKM0y66HXHg+NaPmQwcvjH6qCFQ8FPrhXLCFf7RsM7
         kSTRHb9C3NbMv6zlECpPn6tVK6RLnK9LTCUasfn5fzfJCMe5k0PxxuVHX3U5h34ZyTEq
         hYpXR2R6T3QoVpbBRUffaeJoMknQMtC0FMYN7sLNvOhjX0DiK15+v0y2WK2m/rOqts0F
         MI4f8RZLVwXSsYCqHVobXOw+F7U4NpayTW6N431cgyGA19t7yaD8/uLye4qBatdnI3OZ
         r81Wu5N7iOpoucijjlH23Ak3/P7LNMHYkbQUeIWzPQ48kf0cWtOzuZvg7WTQN9GPq9ff
         Qkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629648; x=1773234448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsyVHtwoLDk/xLA/rwLKIW8JVwySpk++YyIKH0BTOlA=;
        b=guNW5+ZwbtkfYO8eAN93UufkEgda3OMrGmeQzgnbKRTm2Sio4NjFGwygbU60BpFzLR
         G2Lu93BVBNf6PJ9b3z6Ykr4sgh5rgBXJ1jd/7NecSShQdY+xYZoJRmhCdWCvvZm3sG2T
         ulGHsnX2ZLc6mwnNlmadH89hQxgVEgvZZMJ3WrOVoGBmN5EeIxfTHGhcKPskesQch0nh
         0vaKo1nRP27rVqHMa+ZXvhS8PHW2lcVirOomaFHmb29CO6DQq68tQM7xrQoZ868eRquc
         dbiUe2lGUUYevRv0vgW27yUwc5YTJW6Z+G0CudmeXIX0F33sxBGPANtIKOer7k+H8if1
         caNw==
X-Forwarded-Encrypted: i=1; AJvYcCVbKVUminjthJ3Jvi8B1eYjBi+xgM4Pj+wcFCQYuaYt3fd2zsPLU5bzAyj08L8/kQJRNMYOK5bUb2/39lCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9tHjpSBs34YAsuw9N4Dm2hzeI+45MrWkQAc2seoiTXuh5KMJ
	DAS5VhA4Uy8j5RTUyQxsI9WJOjCVglWHdJ7tQtFdrZlZUpGQ1GhsCxBuzoKRnpWor892rDuL04k
	+Pn5+K/wfFutiddp8Oz/zvAEUOkRRTrRf7RP31PhM9Io4B8YP9HUH5B1slLlseZqq3vjw
X-Gm-Gg: ATEYQzwvRDYo04jx2srrXgNrBkf44ARlNc0dmtjVxBPyo8pM/w3RFTnvqMeEAlUJNV2
	NvFtTInCO5wyitjspaAJWCBHDiBpTjFZ+S3LnaasPCNA0WDgU90TNkYNV3qE35u+D6CNuqkKHF/
	gmk1upXdzfM82c6WvQqTEHkOrsa+Ow2V7kpPEker/wi/FIvYGwHlcBwgj+qzOZIhQnULUyAtpM1
	3JRx0QX9kohIL1ogM//Lju8xO3dqe2oL89HSZc6DBVG6ccJSPT1wNkfBZCWOO9Aoezqmc5H/LXU
	1zu9E8Ilntle4JagoexbeVt3A7+sGQHkphtI6cLwNb0uRJPfRdaj5MD1aK0RZiSYt8GP5A5uYS3
	SRyvm+h5Gacq4fE5klO1Te7DuMKpFAuSK4L45afM8DVo+8vwoZhuJe/A=
X-Received: by 2002:a05:620a:28c5:b0:8cb:d9a2:1347 with SMTP id af79cd13be357-8cd5afa3f2emr198721885a.57.1772629648161;
        Wed, 04 Mar 2026 05:07:28 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8cb:d9a2:1347 with SMTP id af79cd13be357-8cd5afa3f2emr198715885a.57.1772629647565;
        Wed, 04 Mar 2026 05:07:27 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 09/14] ASoC: qcom: q6dsp: Add Senary MI2S audio interface support
Date: Wed,  4 Mar 2026 13:07:07 +0000
Message-ID: <20260304130712.222246-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX3b6AxCGEfAl2
 9YI4p49AHKO7OJw0IQuzcPd5ossDsjMNCXcqW78GR0oUgeW/yRAD/sY3cNzGP5srAJwfpZwCJLO
 igYwG32qZbXjDr2vMBgGRdG0npxjo3e6fLdpP0M8qSXnz9ySdsM7y8uYnyvdXxQ/YUv2sBCIDZl
 1XgvfGNqWKZIBZnM3soN+WNfld7Dd1QxVaD2ICGaqoArL+IxlxqTks74wfZbTmI151SfQ4Wh1hd
 X36cYHpYV6JA0jTJgngYLn/yfMUkZyvDpfRt2BOe6eJKtC3d7TYwIowD5kPX09ybewGVbGJZf2O
 /z9WZvLKQWZkwvHgOznrJ+Y5deBQigsfvkmMfFMT5VOcOBUrQenWv0Hk4FMQxJe3FqQIqs6l5BE
 KLbQQLucQ5uN7r0R7dCuMnTBAXFrLmZQyYU5rBnp/R5SRaPEa7Fn1UL44KvgCWisQrEMWksqeE7
 he6DrISohJcS9MLkKyQ==
X-Proofpoint-GUID: 3uS8A-dahTUARBe-fcuqT9XUHwzrC7te
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a82e91 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aBFzMgE2VLA-TvnT3JMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3uS8A-dahTUARBe-fcuqT9XUHwzrC7te
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105
X-Rspamd-Queue-Id: D6446200248
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95319-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Introduces support for the Senary MI2S audio interface in the Qualcomm
q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
necessary mappings in the port configuration  to allow audio routing
over the Senary MI2S interface.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c         |  6 +++++
 sound/soc/qcom/qdsp6/q6afe.c             |  6 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 29 ++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 0f47aadaabe1..a0d21034a626 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -409,6 +409,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 		q6afe_slim_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].slim);
 		break;
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
@@ -540,6 +541,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"Tertiary MI2S Playback", NULL, "TERT_MI2S_RX"},
 	{"Quaternary MI2S Playback", NULL, "QUAT_MI2S_RX"},
 	{"Quinary MI2S Playback", NULL, "QUIN_MI2S_RX"},
+	{"Senary MI2S Playback", NULL, "SEN_MI2S_RX"},
 
 	{"Primary TDM0 Playback", NULL, "PRIMARY_TDM_RX_0"},
 	{"Primary TDM1 Playback", NULL, "PRIMARY_TDM_RX_1"},
@@ -636,6 +638,7 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
 	{"QUIN_MI2S_TX", NULL, "Quinary MI2S Capture"},
+	{"SEN_MI2S_TX", NULL, "Senary MI2S Capture"},
 
 	{"WSA_CODEC_DMA_RX_0 Playback", NULL, "WSA_CODEC_DMA_RX_0"},
 	{"WSA_CODEC_DMA_TX_0", NULL, "WSA_CODEC_DMA_TX_0 Capture"},
@@ -770,6 +773,8 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_4_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_5_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLIMBUS_6_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SEN_MI2S_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SEN_MI2S_TX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("QUIN_MI2S_RX", NULL,
 						0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("QUIN_MI2S_TX", NULL,
@@ -1037,6 +1042,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 
 		switch (id) {
 		/* MI2S specific properties */
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 			priv = &data->priv[id];
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 43d877322bae..7bd40e32f758 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -130,6 +130,8 @@
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
 #define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
+#define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
+#define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -718,6 +720,10 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 				QUINARY_MI2S_RX, 1, 1},
 	[QUINARY_MI2S_TX] =   { AFE_PORT_ID_QUINARY_MI2S_TX,
 				QUINARY_MI2S_TX, 0, 1},
+	[SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
+				SENARY_MI2S_RX, 1, 1},
+	[SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
+				SENARY_MI2S_TX, 0, 1},
 	[PRIMARY_TDM_RX_0] =  { AFE_PORT_ID_PRIMARY_TDM_RX,
 				PRIMARY_TDM_RX_0, 1, 1},
 	[PRIMARY_TDM_TX_0] =  { AFE_PORT_ID_PRIMARY_TDM_TX,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index d31388ed3ccf..e5cd82f77b55 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -519,6 +519,34 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		},
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
+	}, {
+		.playback = {
+			.stream_name = "Senary MI2S Playback",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_RX,
+		.name = "SEN_MI2S_RX",
+	}, {
+		.capture = {
+			.stream_name = "Senary MI2S Capture",
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 1,
+			.channels_max = 8,
+			.rate_min =     8000,
+			.rate_max =     192000,
+		},
+		.id = SENARY_MI2S_TX,
+		.name = "SEN_MI2S_TX",
 	},
 	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
 	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
@@ -680,6 +708,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case SLIMBUS_0_RX ... SLIMBUS_6_TX:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6slim_ops;
 			break;
+		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-- 
2.47.3


