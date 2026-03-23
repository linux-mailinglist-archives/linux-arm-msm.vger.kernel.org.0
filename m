Return-Path: <linux-arm-msm+bounces-99418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MNYNkTBwWn0WAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:40:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B52FE59B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B04DF3043D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB60382F20;
	Mon, 23 Mar 2026 22:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lV8xFN9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FY9r2Xbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E888382F3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305541; cv=none; b=qHth1olqacQ66DDBIUSlO3n+J68OvkH1/aTuomvUXc1naxJoHdRUMEZPjn99uC78I/xSPpILambWFHYEDEFy4hxmbOyKEMALv0qPssFpXxidAqVzoTSo1z41bmgd8cJLyhY7I2IzEQrl4+rM8QY8DGw6AvtyF9zV/MblDX/zbDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305541; c=relaxed/simple;
	bh=sxyYbj3zxGyfRpI3tYXCbVwGVDNatdwD9Ux1a88/YYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAW1QMQ744xddU4h63o6PF+Hn3z+Gxbs2y6fdUmVTOSPC6qRAVF9f9Xqml3HVsuZZJgoevMzW8XaOMeyJ9POsAohNGoKcijj4dIvpGsohjZai27s/BbcknJimRwSM7TVKhpRKoNGr7QqBBUHD2eMpOSmZe3wqjcT6uFv8xaRWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lV8xFN9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FY9r2Xbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXlF3817467
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oI+beZBCKKS
	Zpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=; b=lV8xFN9/TBAjLhYgdfMNI+bKSB2
	QMU9jSC21p0V9CmIVqHuf0fkwMeDgVooN5ACBDkl+867BOWlYh/bGQSxzYBZrGbH
	e4XGmxE5bWCcYF4FzFU7hGEtzbDDH/PdudpOfCKV1jsceQJKMmwurSm73Bgze7jN
	y5eLOQ2vznshyrfLbfnDjinmXWZdetHrnsCHiBKXrpb27L3L7KeMhDotKj21XQG/
	EHb7deJuyqdes2uGIueJgmpSrLRdrm3N5/9DfbacG1YYExHUTy1pNVqdcZ+GIjeE
	JCY3JWlLtG6HcrgmCMeJpcQ7ijfZq1JMDRxz7IWKaLh2VGwYjGVnEgmFgeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w2355-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:38:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so177359391cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305539; x=1774910339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=FY9r2XbwGL+lXKLa3C6SMz/HHM8DbWXLJvQPobXQYVbnhwt7sr/KUJkkhyR86WBTnA
         90wMHkIWoAhHhPzZhfcNZWg8dsN8p1A15LedExpkNYn4fzK5YsisXrcy/2AyVFifad4g
         aZPtDh0wF61VQ0TYem4pTbwOm/ddXdQlsTFMKPf2m3MdqfcN3WXK3BEl8IYixZOvfLOn
         XPo6a+OjWw7IHSI7ONimEIQ9ffEur5WQioayqQO9gkgazm+ZT3PGK3hJjStxIWG3rppR
         iKF4SXB/ljzZAjlRzaZu1hrgIoXOnScu9QZjABHwoLr+p/WrV5pOoSL8kLMCJh6dsNeH
         tQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305539; x=1774910339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=sTfiTFbwusv7jHGGZeBPmcboxUZd/GNuVm27s5MsklqeFqcY3Gtz8jCFhNXrjmcCd1
         vLgelBO6vg2Qk10f3SEPT82O8MhVNU/4yZUwwc9HaOhLqc7QMw2leRUqXhyinsWNKBKO
         1Xr5t/+rqZitbn/mt0PfDyNgHQTAKIsfD0m9KD/SukdTsixwbRQZlblX/lDCyXU3ISCN
         ENRuy8DbKaj2Q1rIBlRx+LYVEr/5hcogy9fthQVRU5t/ZD6pcm13/zcKzkU0Fm7OXNvC
         kW0t3pziwP7n89IQy4gZwqIoV1Y4jzyVnwWdDlmOPP4TFmSDSUocAXJwFdJn5TWUbfOO
         dA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwmLgFBVQ7CDyj4E+KZVxzN4un7ekcPo0drd3E/KTd0/uan7rkFKI6+YLfYzUM8+HiugsoBWy3BNnwsed2@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+h7v49O9ZA73E+Agqbl7IQYQpBvUg75swlOoif+yqtMmFsvJ
	MeltX4pz+bfRrVggr6Wl2DYHIBKSWblpcKiZ/+Io9/EAh3L4sV/TkBty0zY4odIZUohUqW7QBBe
	xTnlIhNi2M7r7YNymCW++uJDbPqkGSKL0lIT+Wedu0h5s1A/5TlNtaMgRxjMCNnuffI1B
X-Gm-Gg: ATEYQzyeKKkwZOa0sPMt9jcRq60RCQhAdWl2FEFAE72VGub8qhfdDB/yMcwHCu97vj0
	hZ6Xb8pjmb/GPD7LuGt5JT/Ch9Apa/vF9RaIaGifL0ltpmnTK5HVQJlpp/xbmLilFD4M2oFsAE2
	/vG4XGEDHmgzwsbyg+EBfI2z2s3BmkgUghW3NkZzbH1gc6Zv+3LCFLZO0qf2vGo9rPrcCri9jlt
	3R0oU8AUf9vWO/opY2dTI1sEwNBV0Vz6Qalhr8wpjBuBMYlGuZWW5vi9m0gk06tY1f/EPh/BmgM
	/EGb9MLtGt+h4kmxi/I0RG+cj/ekHqkuhqCAbCocIgTrAaji/bhspRRWAAcFuq5FIxoA42Ptiuv
	DOt2M25NZLM3GbL60S+pJOE2xlBItgmNAZVTJvkB/v0EhxHfw75WXT9E=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr116997371cf.11.1774305538534;
        Mon, 23 Mar 2026 15:38:58 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr116996401cf.11.1774305537179;
        Mon, 23 Mar 2026 15:38:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
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
Subject: [PATCH v7 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 23 Mar 2026 22:38:34 +0000
Message-ID: <20260323223845.2126142-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1c103 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Ga9JKTHzo0WxSTOISMeVDQSoDmN35twG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX/jwNU1QVCJ6C
 XC2N0aYOy855JpwT/15BhRIZEY8rsi0aNw8bdYZ7mHM6doJ66EOfqdDkue1sl3hRKoqgK+ZnS1f
 vecnbAI9mMI7rVy0by1tH036Us57AsmbTrCYOY48mPaAHEoZOyrKrHGgYL7FY0j2UffmbEmguG9
 /g535YfjJQOj/o+iNgowSWqkqistdwdSAIRVHt8/n1+TYjWbxN/V0ksqdmdqb+ySL4QtX6ZNkjc
 lJIXdUlAAAhsIOSsyFClun9m47mwKcwniXCzInOQaXg1t427a/Q6G6/LYCcV04saowh2U02z2ae
 JbK+VubjletdVLAOmZwL8ZNco58x6bRwyls1WHBNSN8/Xo0rGI6RRglW6kwxolG+RLp9uNf7PAZ
 cTWs+lCD6sVs+z6zTZ1NaK5DwBO7D8p5FLg29oeSitv3+J93LllE09YfKNzTrhi4vqq3yRLULoF
 F/T3tl9SA8S7I1CKkWQ==
X-Proofpoint-GUID: Ga9JKTHzo0WxSTOISMeVDQSoDmN35twG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99418-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 549B52FE59B
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


