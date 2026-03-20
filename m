Return-Path: <linux-arm-msm+bounces-98939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCA5CmthvWl09QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:02:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2B2DC347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 121043063094
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D603C5DD0;
	Fri, 20 Mar 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQ+aaAc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyamLq/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F973C3BE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018168; cv=none; b=JnV0rYpiMfy9Ax/AyNc6bYVgukrSxfun1J3HFRyw2IOrwYYMJY2esPZUeZRx80jkJCv9QTPEqGXqL0HYA7hMrYUzmussAfbOaeNelYy6WrREWUOgCfIbIJHpqRlP9fZJAGADGjE/4JKNxekpyH19M1HrOLc1r3q1jCscwKNMyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018168; c=relaxed/simple;
	bh=sxyYbj3zxGyfRpI3tYXCbVwGVDNatdwD9Ux1a88/YYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onGHq3W03lVGw/uIlcT6xH7SMHj9VAbB98qB+FT4Ip7zQM5IssswehUc11FlQJjwtuNFGSoUu0QiZ3Um4lCz82V2DiX753nEahG+L8PbzAd18OS4wniGOl01GmInQ2JgOwN2iTTxOEp7qzUSA/sItusRx3XDHIO7bZgGVirI9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQ+aaAc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyamLq/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K94UZR700891
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oI+beZBCKKS
	Zpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=; b=FQ+aaAc7h9ZrQOKWPjwGC9xcefB
	kCYkN4qdJBd+zC/4XqZcJe/3yGsE9+MAmdz++r+Hu/oCU94b4FvCbfpUa+g3hgu/
	KXHo7v41tnb7lgLvv+5lmRO8bOA6c2NWN0AkvPXIZmYSBA5KkXMtx2UKqDFHCih/
	rcPqOfL8iL/GS4nuBDKNpp6kEBz3uwBfHwII0omAELAEB2fDbGG0zqhYKukq1mbZ
	jmunCSUB4AVNVPt+Y4nDpQUooznEhFKkAnro0RmbJ1c+7hAgJAe6sTEqUtPoRpHF
	ggh+FqLr6mvXuk95NVmtetkhP0he0TUre5CUIbvun+ZwUiKy5RLyMFZWYGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d139q0swj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso4710501cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018166; x=1774622966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=dyamLq/C3m2W7E1R9Cs4JwUDFKHIYrH+G/ZAhHRzPk8eHxCgZBQJHATQNXfu98/pHM
         1zBULLKIg/gtNAh16txqnNb8qg30tytNK+U3hmjbVZXzWwHpXpTPakytVvSfzihj93kt
         t1vcLT6/JUz/xqCCC+et/xghkssPshIhsyTBEqWaldUeL/YvUCtoCBMGYXUAmLf2JnWH
         LPiwcY89iM3zo1DW4VBiPbQfKJ/182ACMv6PgCN2j5Ni+Bn01EjSs6fdPQ+EEVxis2KF
         nItIGSf9Gk36FeSmyk7L3veVbRlQ9Xhr4Z69siXvfSLcbmKEEpYMGoWwv9rRhpdD60R6
         QqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018166; x=1774622966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=n8L8Atr0AYmAYGZhxABbxs1tn40gNtSyOyrFSTNqacd3tO1s/KczURSGUcS+hE434g
         TFcFe1rqgx6Tqq5If+irsZngGwaHgIeG+sgFDukAJsZ9Noq/NVrXH7OlG5OcmWf9y8+/
         Rj61h3K3FnYDndUbABLLNLItbT4O0hsUVuTN39NLwTgRu5fARKM13ISnoPBYL1lHtzXb
         OSFtU9KRQE6NdMR6JaONEQMAsw97ozKGG0Z3Kit/qyaV6ISItIx3h+zgw+G6Prcqyw/K
         akbPqb6Z1/jb/1dlFnsWdPsvi611mHZpsTZHXKBbZyNzBrZcTORYrqLMy2nj2t7ZyDuL
         vMhg==
X-Forwarded-Encrypted: i=1; AJvYcCUN0WRGKNDn1n+Jz/9H9RxIoIusl3d869Fk7YNOHLGFiJRmwMeA8B/MENza4RqJY1sI7UGLonRR2DLu5z0b@vger.kernel.org
X-Gm-Message-State: AOJu0YzFV+XPZqE7YUd4sVk9/XmKL27P3Ixuqsa8eJG3MPwQbpN21kov
	UIFfjJ5kZ/IHzcPqqeYAhfaWZ8STSU9lOc2+DHqb/8p3NacslY2BOYrGCPQWRkn9L1JmZdPkbtp
	NkyBa3wj42p3EU/RjBA5art0FbuOFBqOXEdhkKMkozDAVxjz6lXdxbAwgqIZsGB58ilzP
X-Gm-Gg: ATEYQzw+U6LaFwddRjWuclchD11A5zXfY8RRgOX8/E9FoCTv9hZmNNRlCuO2KqrIyD3
	p4HXAM8EQesGeATj3S29ZRuEaHCIEDmyAAco4NjM664z6HRx3v+VahFBQcGJYu1ntljm2BsCqnI
	l6ZFCUgUb2B+003m98EjC55fVq9nxeQyH+QSvdD2EN17Q6Anbt4mOfvElb/Ns7+5fLiYZtzXupO
	YqufmydW16ZBxXieFZ95h3BVcRF6TlmlM982ckYsd/ksVkGoT6J7hjdRinMaBW6RT1z3E1eMx+A
	HsSwxc6WrZK21TEC/BT8maOyDaYsW9/9sziOIGLv/owrwvbNdrMx4g/0tKKYEst7NZnA5oczW/w
	9vu25zmOkVeJ00o9bOTDwNhn5bz3FL4uhNePldZQ6p13BXsklajpaGnY=
X-Received: by 2002:a05:622a:5c7:b0:50b:2096:494e with SMTP id d75a77b69052e-50b37473d55mr47732951cf.30.1774018166055;
        Fri, 20 Mar 2026 07:49:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c7:b0:50b:2096:494e with SMTP id d75a77b69052e-50b37473d55mr47732141cf.30.1774018165404;
        Fri, 20 Mar 2026 07:49:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:24 -0700 (PDT)
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
Subject: [PATCH v6 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Fri, 20 Mar 2026 14:49:07 +0000
Message-ID: <20260320144918.1685838-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX949kULSjPDDG
 bOc8k2K2xJ8+sUQ9vogH7vwAy0wEv9imuDkqlt5mVaie5rOYZFS8r3lrOQ0sfFjL676cbNJ4RTj
 Yt46J09MGR3AxxA7sCGsA01W+GfqnO2F2SmVFKxuf6wW4X2jTLiHh+Hmc8bmOf7gWbykjACWOoV
 IsPary27jV6WBfvMfLq25yvitGZw13WkPpexApHeQRm7g/zXI8iv9L19y2owYBQ3j2q1rkjIbsO
 7B64NpNSvl7JSzUjBs+tub9InNVI1JwYfHiqWEP6pK2R/bbHdbCZumVFYoipHOLEj7HVD66cG+w
 u/DJE/GGwkeCX4HzwDiUhaQfZ6xV/7qgpgp36HmTtjDL7TekTB6CrZHEIoaYe+Gm+hQVG87OgCc
 //JMg4Hlw53dlX72+NVRPGMUcp1vVbl3+iY0GJeADnQxXw3HJxeaxnz6VX9LVeOiUu0ZCELC2LM
 Vk3ya0X4DPJ7hAq28cw==
X-Authority-Analysis: v=2.4 cv=FOAWBuos c=1 sm=1 tr=0 ts=69bd5e76 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9Cf_Y2VpklfCb6JthWupVUKnFkB5PgLC
X-Proofpoint-ORIG-GUID: 9Cf_Y2VpklfCb6JthWupVUKnFkB5PgLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98939-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.970];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CB2B2DC347
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index fece0e3def23..1fbcbbf3123d 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -753,7 +753,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3


