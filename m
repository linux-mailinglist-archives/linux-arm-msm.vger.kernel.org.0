Return-Path: <linux-arm-msm+bounces-96122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCViN0hurmnCEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:52:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 441702346C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5EB73041A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB00C363C6A;
	Mon,  9 Mar 2026 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/RFu8QE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9fdx82G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915D363C5A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039107; cv=none; b=AxJz40S1Qvc6AvqDi5d2mBoL5JyWxh2iimllK0+ydceGUJ+bU263HXFWJ36IlghFMPmNrkv9YSinLv0DmT9ioYTgXH+2m1pEgpochV7RD1pCziFa95WcAc4Ppw9ewpxNZwMw2g36Ttu9/KP4UkpdVgpZovXhnYJJux6iH5gbRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039107; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfbxxHRrY9pbftEuXvBw5+PzHsJK1xmNZoD7cdgDT+9UmZdhglLaoHwbpmc+XLDbs/aKf2ZjRo6fSD5ji9ZOPvl4if9WkUB8BWmRuLBCI8jm9/UwuvqS1e1kOyNc5tEKkFz8cjqT4J+/E7/CA1awojmTVW3XcosiIPJ6NyOWmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/RFu8QE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9fdx82G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628LTtLl2910558
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=b/RFu8QEUhQsfImzB+Sa8XC+Dd1
	6oNJGDwefPGEG5xw5O423ro2suzPx60HSxzBhBnFYEwFBMj/lBNtlDkuDnd2Af/r
	/6kMe/vZ24jJIiQoDuDAzJhQiX4fHVhsTbw/egMmfKnxgNgeJR00I9HS3jo85qRy
	kDe268BsZwnNW0KFGuaYzGXeyRsVh2PND7c0tIEDrlw7IVj9LA6hddh5U7HkTmiy
	7moq8VLR17IDhIXLrpbPN83y2iyuSKSqVJWMPfi3leXUoidQfMLg9+JMnbRt1vQl
	dSVlbDaejYJxc6d5Xt33nM2MrmQ5Gj3Vgy0XAV6La70DSLmvpdtX4U8cDRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83c6vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso8985237685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039104; x=1773643904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=E9fdx82GV9EmhN/H1xRH9TZ2JB0kc/kCualgDOmrTfRdf8mE8I3V2xp3CC1CpVW6tj
         LP15tKEFHNXd7hZzrXZbngraTdg7IHJPjsa3E5bwlEwUguPuub5NJbUmePZBiFRnFFqy
         BkV5E5pZflZJEp7HwcMG/CFNJ3sEnZYNnZVpaCXYr5F8peMvuLxMqHgao2+lRNDJvQgf
         l4ML9fPVjnTgfswmxGYYOC1JXeSHTvaBhU/X7CDrjZ+AV2fDp4AEM/jEtU41aEWG22UH
         3jfQqPMrzXPrE6fDFccDJrTRT3XuDyp+Er/9VaciVFkJNrM8V8LLNIgiFrvHi4NiM6nE
         SvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039104; x=1773643904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=ldaicXYkjg/928BpppGTUn6U/DRhb7oTRCfvLDN7/fLE/lnbwpiRJWiW3LIKiCfEZa
         bwiPEMs4ZwdHnowNPmnYdmZbxMeKUu88RyWhm5JmJRs8+DB3gkgc9SxPn/ID3QVt65f6
         RnLqGWFM5t2iOVvP7fM16TxyajCIdtR6a4PZN5oPq3XWjWCz/Ez1H9i0p7OANxD6++DI
         DCc0VdA2db6JEx6O7MkgH9K8bZ0asnbNFyKYBIpOKxUdq+JvE8/9LdbBIsS5aNOVOHee
         sYPdwVP2UfPn6xnDQIs1YEApsC2lGqXuMbG8/qW8JdAqYYpuynmOovaKFb/6nHFNPmfV
         nBsw==
X-Forwarded-Encrypted: i=1; AJvYcCUZSvnFLctNN1YKCw3wlLnpozh0FL5P2+fRZZB1LYo+92Dj2NqarVjQiNSgoPYYN201eQowV99Mq3yXalcP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DqRCoxwsrFpJqC9Y8zSTwwkzeFsiVmt6e0JgdEsJa8kXR/M0
	KBI9hf5taioGOG9lQYSObwIw5ofUzRN0YfCKVbIEtTPCz03XP6XMJ45fA3/xqwLkErR8nsyJBee
	oRfrKzVAk4qF1w8zC8OyYdKgtop8SfkGU05ymVte3F1/xxh4pg59iluP0UtmAkyntEZTp
X-Gm-Gg: ATEYQzxcSLcSzmTJmsekUiD2Mbs/dhkMVNOvMZV3257hksU8o7hl6j30bAB2/Ctjqjk
	A0rXQ8QFAhmKL4/IRp28q2loVZ22pJEll+2Q6VL/Z++7ippExhQq+r+954bzFVrx1RefUKSwYBw
	fZreQ+WjRIPms9HCnf9IO8XY9WH5ltrOFfmGKtMl8xEKqrM1BtAsXiXzRBgxIreW5ahJEiaWq2o
	D0SgrHTF/e55OtC14k/qeubmXfVv8C7aiW8Rwn5EZPtaKv9Q/lKbBoz0BTQaHKycE4Df7UQcJ9W
	KJX7sui8MdBTp29KBa0FZdcv0cETfkjJNsXOAG3ZIcAwP8TB7uub7TB8agZmhETZLzM8+4se2ai
	4XzIdbACD5AGwfsmQsI+69HAzurlY+mJszED830jQLoZlQFLYlCk32a4=
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr413623085a.26.1773039104667;
        Sun, 08 Mar 2026 23:51:44 -0700 (PDT)
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr413621485a.26.1773039104234;
        Sun, 08 Mar 2026 23:51:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon,  9 Mar 2026 06:51:27 +0000
Message-ID: <20260309065137.949053-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae6e01 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXwSKrtduxckN3
 mZJxZWVJqiGacZD/AhiawwwZ9i1qVLAGXBURJ/DUTFGbmWF88eP71+iDaF9ID2svsILrf7EizFQ
 5CdrPYskUdjEoAs6YkHy3MYGQU1BkOBG7c+wRD6QieswSIyC7wGN0kSlV8s294lIu2GuyhavuQ5
 RriaYsu/zFfWKsCh1PgL9EDoMzST55uQGLhKPRC8DJvPA5WkZpp5Sa84aErvnUf7Wylb3t8cdVY
 6PmPFdjpuswMrm1pyt0q+irdvCFdtrS+MRNS8v2MmZlDdm1rBYnIUlZarIS3H0NQLrOIENAPgRI
 O2l5bRUDdxkHXHv5gsNe4VRE696ayROqpnLHcBftVPbniotZRDAoohgYKqkFsboyYADLP+Cq6B3
 +Ncyirw2Jm3mvHvvcQ742uHJEMrHbWJ0xoT/2GnGy3bysT3IwFuY0X/zfEecdwvDLA4zBXmuaUw
 A72dKlyAgV7YXuxB00g==
X-Proofpoint-ORIG-GUID: XCUmzm_5uF3j5OjAdas8sWBU_vU0u7EK
X-Proofpoint-GUID: XCUmzm_5uF3j5OjAdas8sWBU_vU0u7EK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: 441702346C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96122-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3


