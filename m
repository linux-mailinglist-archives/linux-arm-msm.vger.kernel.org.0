Return-Path: <linux-arm-msm+bounces-95313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED2nKQwvqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:09:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F7520017B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 715DA30AE0E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24FA29AAF3;
	Wed,  4 Mar 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnuxjyGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZyH4uw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90184282F11
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629643; cv=none; b=c+Fhh3+4YyA42UhqG79BVt2tkW28Ab+qHtQMG6qZmxag7Deoh0p9+1sWTzyyYLUtJJvdRrfESGsKbFe64HYVg69cJger0ejECsJGzzBH9CYPnpp43+ss999y3wR140x7NdrviDArUiz8Y4IzBVIj/AEjFwi4VSfRFsPxmuJDgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629643; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S29a35x30GDpZqdvDuZ1vBtfoKrNfPwqLtVdy5u9wB2aPjoqiqA7cjX/S2FwjbNcN4QaiY+iBhHhMWdOn+hFyr4An6CEfkQ1lUDoUpxKlwVCnQBrxAth0WPeDMIyHvl+zhYM9DShvLYKabKPHZim1x/5OfKl4ZVVUTSYPFCUoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnuxjyGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZyH4uw7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C1FxH152731
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=JnuxjyGn0g8xI2Fhz/yc/us5pm5
	dQ1wXrsyOsZJiOhLb1UBZSyE8HP2SeUjDUV4tROqakBkBXIG8HzAaCR0yNKvy+Rn
	83GU+s13of1G0m7YuQCDKz1iR5C8D18Ekag0bUFPqOGBxiyzuie1oR8Mby3zJrq1
	s34xcFGScVL+ME4neSTUfy5hkxXRoyhCwVTOCjBva1dirb0va2Gfs/t+1pgebIge
	yHRwwy1vnFfPeiy2Km/u6nA9qbX9fJJHbJiATqItumoZtA5dXkqPutwj8SGE0VyH
	1RWZUu4B6+F1dup5Ix48PvHXW6WkgILxPe43ajEumCiOpnp06qq/5nn5g2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvkpsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5345282485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629641; x=1773234441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=fZyH4uw7y2/4C0AjD5jSrEGt0dmxAE72+OlM/rfIlFNYNFmfvPxpyTUsdLwrV0AYU+
         xU60BrvztMAw6yegMGYn8vzSMusXgBQXrEbqytblJRxtwqFg3n68sH78CmmpKdTZxomh
         8dByMD9AYqo7ljp78H11/znSRj5LEbZ5o96fZ8ZbKoIYfRM1e9RkpsDM6osfdH388dwG
         qUGNnLxpF0du/OTtorme0VQbv3pOl532ttpTwNy6i7Dn55t13pBtREDPysc8OYO2yQQk
         vDTr4VzrLfU4mPmZW+AQqzAaeiIwsBaa7V8KWWYHZ5ZqBXGQr4A8dmalAb4Eyx4BvwqQ
         Zj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629641; x=1773234441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=ctUX5EQDDak8kWQIEErNzzRKafhl1o4gaW305NbwQA4vVzhBBEZwdi4bkE8KAEDGE8
         0VjqtW6uzMfcp8rSOUb9/QGSC450iFNEK0q86Z4V6+KFOKl2fZ8mII+wybpXm62YVRHn
         cBD2tsFBu4k1lnjOGRAYY75Vd58YJe6uluxycMFV4ZIQiKVJaANWNgq9/p/0OG+pF1UJ
         U0ZPstnm63+lfrJRvG/6q06SkpD72ONAP/oMEEBcJPVVJ8KxsK9srTTO5P+osT+y+8TL
         WvyS5AdaPuuc1DeBvAirmrn4zrjLu03ADc2SQ1phbIPKP/qPsTChEunRFQQjWxooOxsw
         SkkA==
X-Forwarded-Encrypted: i=1; AJvYcCWLRr94j2adUYEochFfT/Kc1VHTx3dBEnufxdK07Z0s6pCkfaEvGuaDSD8OZICoXihh5lm5FDhyBTMreqK/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5MZjXbQSBN7EiRhl5HJ053lg3zEqCc1uXjJkmD7SceFdEP0d
	sqPagT9Z0H4EE5G5MfSs+5S6RkNq4Xp1WL6JtChCmvcHaHxVF6n1CzNG0/q1uGJhB09a/qbxVn/
	zFVvgkhb4HQKCfHKXOdgBe9Wsm2ky+PvB2n2Ry+Ncb2vojYoIjLqvq6cCKD6oLIAcCjt5
X-Gm-Gg: ATEYQzwppJ/cJfRfqXwBvJ5lflluQBUoFQ5v4MMs/r6q8MHHxjeyQWIIa3agV4m3aM/
	dXuciPBDVKrhuole8D0UcJwS9a3a1GqgCe+zB8NBArFrGdogUgJqPGw1u9rpasw0VJa9rL11mfR
	BOARxlI8WuPameC8ZG7mI+o12SQpbElTa7p7ZhB/+zNOCrfXtZC1dF9ZgnqvZFbPvwDNIgIl0os
	zWySTVW/UNYpCahZotdsaainakWXE9NohRKQ5w9kzr8RqnU9KQNLSlPaiLtYdDbNdQCRhq+rnCW
	se8cYxXBTUA4fj/K25HL+TosWwVfltdKrujUhJ1Zq3ZrpDuXH9FwYlj5j4pW3h6zo/CYDUhaso5
	rzQ+3qLka+gotHuEwk8pso5TlsDatVDHNfxsd/kOZTaOrZ1P4xnZmc9E=
X-Received: by 2002:a05:620a:45a8:b0:8c6:c983:dddb with SMTP id af79cd13be357-8cd505e251fmr619597285a.0.1772629640877;
        Wed, 04 Mar 2026 05:07:20 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:8c6:c983:dddb with SMTP id af79cd13be357-8cd505e251fmr619592585a.0.1772629640326;
        Wed, 04 Mar 2026 05:07:20 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 03/14] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Wed,  4 Mar 2026 13:07:01 +0000
Message-ID: <20260304130712.222246-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX2//A7wmcjjwt
 VjRhFieLSiNRqdMfFEDgJJQyd0iQu41aGl/GLprW1nGbtkMjIumdJc9QzQZq44Cs5LTGHO5YSqC
 W3qWqZo0C2qrPzAD9/FH/omdq3tCdQ4pG/iv+TfM9VaNicwEyYcxjPgJ8EoN0SoyGCes8pInd7h
 4TSm2sCH9lubX0OnxiLRaAIHe+qPG42iCbk1+wzCBn/Une7KZRvvbjKOjwUtK8fZqevWMt5lW9l
 Fj6lnrBl4rP88v8skz0asrhZldCJR7FJAB2iEFKh9fMp3jLP7wmLzQbozE6Y7odbPzvM+6fkNTs
 Idu1Vc/KJqtP/QAmHwEp3Ujx9huUpbxABXepUZ+gn2bN/0Q4QTCvKGnp7WHxgMlyfCoevDyKeJp
 tNX9uyFzR8wAJ/KeJ4tdTT7HyJiC6BdknpyZHhDK11ieLDxt8uxUUEz25l+Iv2S1XUe+SrpeEbw
 N9VOWcJSmCPB6GF97Xg==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a82e89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YCa3QZHsNCWoWvkQ0kGW-DZMhkbYBWtV
X-Proofpoint-ORIG-GUID: YCa3QZHsNCWoWvkQ0kGW-DZMhkbYBWtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040105
X-Rspamd-Queue-Id: 46F7520017B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95313-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
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


