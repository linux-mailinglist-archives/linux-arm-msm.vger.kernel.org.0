Return-Path: <linux-arm-msm+bounces-108598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIUTDKa5DGoFlgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:27:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E55BD584293
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 21:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BABB3085BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398DF3793AA;
	Tue, 19 May 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEyWLu52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8s9zTg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF63B27EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218796; cv=none; b=uoGGQNlHB5L0yFZHoKqhtgye7DxxVfN+uQ45MjO0dXVzohbC+JuCs424JVzfXowf5dvc43TWp0zN7A3uISNicpmRBqzFgNUvxF28EJVqnoOUvHaifZBP0RVVv0PtLesuQX2K7BYwrvvvtcEM3CkmAPrS6vFPvRn6D9rWjiv9+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218796; c=relaxed/simple;
	bh=3dsf7JSfILzLf1Dg85CYRzK9TPU/Ka/pPnrNYdz/rXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkFKvjTZpf0VIuiW18ImR5LjEcvGxvlgXbivr9P+evU7BJYRHgt084tdj579MmpX1lltRe5IwodRqnKKWsrPq41obNP1s9NhqfkcrLw2uOo2TdfapRgcORjajXxj6BbgDAqlrndW4ti8mraMGBHe/c/+WzmcM35ueXemi75t08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEyWLu52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8s9zTg5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExMvn2984398
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARLyLN0sP7oII99gUGbM5H6iaCl4dwa9MOH4RUByA5E=; b=FEyWLu521abaZU+8
	iRw4qMinlJ0a0f/Rkb39/FJaNL8DULpVaiZsvKwxfWyiMi/Frr41lJka/eORFWqh
	tcVGZzG/vHrbREtVSjecDyODkRwckZKLoxwp4p0EsXZc35vUkGiMynIJMjYcBFAD
	vKLYd8XIe3p2JZwgmw/QKZtNU4Cke0hLbsfg8mrXQMOM+lu1IHMpUw5DV0laJluw
	ez9sTQJBNgxLvZgXtoyTrQrt/eE20gMMimukCBwCLc8E9pG0ZvkDGvNSJIHPlPUy
	UN1lgNSIQIr1pJJBEaPHbENQq5TSIXv6hffi2zSrBzuAi1IUIiyPBj1yPSM7N54H
	HcXzfQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t163n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:26:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so27725095ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218793; x=1779823593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARLyLN0sP7oII99gUGbM5H6iaCl4dwa9MOH4RUByA5E=;
        b=h8s9zTg5GlnctuRfOxM/Arecnu62XDtE6HmQ4SsOIQ+Z3g00mDTTxVsIzLWiufjPfz
         /qwWkPHEE9xo3QTKKrgg7sDoYJ/IhNEFyoZEt2+Q55EVR07tUNkDUw9PIXpUPsazgMlp
         PqEDJkNCh93VJXawVKsdepbYKjb+C83h3ZmGcQFGXtv4Xg4v6bVAa0lJmybekIsDNuzp
         qMtZ8RUKxb4kyvx0OR2qi8K1u+WVrsYPT9b0eUHWPXgUCLtaMYTxefGvMY4xMXHiy9+P
         tVUn7M61YNzeOUvMhcmxzYA5ajnFPhLAv0nSUQFvB66lXiieqLEPBigE8mFLxgrFmOvV
         vMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218793; x=1779823593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARLyLN0sP7oII99gUGbM5H6iaCl4dwa9MOH4RUByA5E=;
        b=MhbOynXEkPyewhkUWIcJEJmwuj0a7dspN3OjKjYM3S5iQOY8185HG3pd7m5EtbFMQ7
         4816N+/gYoynFDy7V6lzg4VZ26+uCh7JL5dwTvpaG6NuHeAGc6ShMs3nv58McDGip3EV
         5icI6bM7Uf9Wni5fNXrrDOXfDSt6qRszu94498WK/7QmIDoULxorVmfXZmUEvdYEFVna
         sLqobDvMFa4B5jxJGCmV1uOJMaaGp3wTRo/vIp3ycbc/EJQc+bsbAkiHpWb60hcWmALj
         Sx4LwZf14ErVWZ44jVEnIh26isSQnUCMFR5arUqun98dZnSpbvoNz//gE/bbUquadjjR
         K+1Q==
X-Gm-Message-State: AOJu0YwgiLoNuZQiVUhVq8pSujFe2W6R0Sfx4XEarE9UPVbMNhZrSgdW
	9pH3X6IAYdxM6Bz69RAW2xkuDNxpK8zZBXBwyuPTeHzK4bkLuux15M7fd8BIoDSGI3hgF0oAiKz
	WipkndB/hGqQi2IPYr2JqzLgFCpRElKiD/JMAaUZOT0ap14kTj+wxjXDtt5XDAFb6qpvU
X-Gm-Gg: Acq92OGDoNYGf9khCgorINUYBEi4hWLmwxaa9Vt89pSyg1blrSCAUSCnJUESCcQ6qXG
	HUVOHlBS7mhsXINx0RBZ9F2hlF37MMUEgSQ2t3XpyJ0iwjnh7WqZdQOzES2ksWvylzaAlD5lDzY
	I9M+yaylUFuG8FgTFy5R39x4H2NBL8cwLRDs3xUJf9nQuZfHAaJi1z5unyknO4EE9GXmlpq0DMt
	hAMD5ch5FmbAjjVtR36p7AoTZgvePUV64u7smEY4lS6k5SD5pX4WYmQmIKjDugKD1rykqYAYHVt
	CvkAMqgeJv1QkWojuVP0RtFY0HwTgAlhE8Y9wFnq9vtX1j/Tub2xq84vZRaEWBlOYDdlKTs7zzW
	2E8cbwtekOId7XKt0aDjGFBDp7hokIQNJg0YxN0gAUFezBo2QsKFuKKJZiHLvkdLIVMn5H8u4S9
	B3m4Tu93VWZ1bAwDOiiquZksA/hN9UuFu4PV1K5OS1fWLRlcoZ6Ak=
X-Received: by 2002:a17:903:3890:b0:2bd:e01d:eb25 with SMTP id d9443c01a7336-2bde01decabmr114697855ad.32.1779218793126;
        Tue, 19 May 2026 12:26:33 -0700 (PDT)
X-Received: by 2002:a17:903:3890:b0:2bd:e01d:eb25 with SMTP id d9443c01a7336-2bde01decabmr114697575ad.32.1779218792460;
        Tue, 19 May 2026 12:26:32 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b06sm173927925ad.22.2026.05.19.12.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:26:32 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Wed, 20 May 2026 00:56:18 +0530
Subject: [PATCH 2/2] drivers: remoteproc: qcom_q6v5_pas: Add support for
 IPQ9650 CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ipq9650-remoteproc-v1-2-542feb6efb2a@oss.qualcomm.com>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
In-Reply-To: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779218778; l=3938;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=3dsf7JSfILzLf1Dg85CYRzK9TPU/Ka/pPnrNYdz/rXI=;
 b=DuGvqjB7RNdINxtQi2DZN8hG8e3gXxlEqaGklJPHQ2BwM+P7sAvOvpLvlO2x5dfbkvg/qvxBi
 XzaE7oEHiYUApnI30o6bzFcouBIynsiczXc/YcX5THoi7V13xqda21L
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0cb969 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cwY15C4hyq6VauHatZ0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: wTKfu-tPk5SSUWwN-Atl3qWD75ZkPYWT
X-Proofpoint-GUID: wTKfu-tPk5SSUWwN-Atl3qWD75ZkPYWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MiBTYWx0ZWRfX/hT3ZZqzqK/v
 /IEFxee9Z2AB8STNNb/RZnRsVc5m+ovToSAjhcw29FFgRXcJ1aw43m5tZuBUUZQL9H26xuh/V2c
 xWj+v6e3AwlPezOwpJGnJRp/bJJEDzdc35k3lJBtmbjEQXeCzA4WriKv4SXuIF7kfngQZeFpsSa
 Pylo01a2DQ77ue//8Pt3ZRTpavs1qD0jb7EC+TVCRqekEtjMCmHjlpwnEB7v3ZlR2P9K5mi/Npo
 m3KRX9YmCj2dZAD6ENjVHNYQlkcIOrTKOscG7atwnVnvkE4bEW+PJ/OjvCU6tzdGjfHycmiEZkC
 zGD4rK5MjneDWFczJjV5kM/fajx6siA0sRaP4ncjMdk+82GQ+vq8hvmNsonalEwMmjePqYoZh+P
 85qGbcCbXyxW+eD10Fh7jWBI++Tvn9vYCqlVWpC/Znu0KefF73IYz2RMBaRq5lmhJArgWDfyB4O
 D0osez/wCh8cnVQrVGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108598-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E55BD584293
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the IPQ9650 CDSP remoteproc resource data and its corresponding device
tree compatible string to enable CDSP support on IPQ9650.

IPQ9650 CDSP requires an mx regulator supply in addition to the existing cx
and px supplies. Add mx-supply handling in the init, start, and handover
paths to support this configuration.

IPQ9650 CDSP does not use an XO clock, so make the XO clock optional by
switching to devm_clk_get_optional() to avoid probe failures on platforms
that do not provide it.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..0f1a0358fefb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -72,6 +72,7 @@ struct qcom_pas {
 	struct clk *aggre2_clk;
 
 	struct regulator *cx_supply;
+	struct regulator *mx_supply;
 	struct regulator *px_supply;
 
 	struct device *proxy_pds[3];
@@ -299,10 +300,16 @@ static int qcom_pas_start(struct rproc *rproc)
 			goto disable_aggre2_clk;
 	}
 
+	if (pas->mx_supply) {
+		ret = regulator_enable(pas->mx_supply);
+		if (ret)
+			goto disable_cx_supply;
+	}
+
 	if (pas->px_supply) {
 		ret = regulator_enable(pas->px_supply);
 		if (ret)
-			goto disable_cx_supply;
+			goto disable_mx_supply;
 	}
 
 	if (pas->dtb_pas_id) {
@@ -365,6 +372,9 @@ static int qcom_pas_start(struct rproc *rproc)
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
+disable_mx_supply:
+	if (pas->mx_supply)
+		regulator_disable(pas->mx_supply);
 disable_cx_supply:
 	if (pas->cx_supply)
 		regulator_disable(pas->cx_supply);
@@ -389,6 +399,8 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
+	if (pas->mx_supply)
+		regulator_disable(pas->mx_supply);
 	if (pas->cx_supply)
 		regulator_disable(pas->cx_supply);
 	clk_disable_unprepare(pas->aggre2_clk);
@@ -533,7 +545,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 
 static int qcom_pas_init_clock(struct qcom_pas *pas)
 {
-	pas->xo = devm_clk_get(pas->dev, "xo");
+	pas->xo = devm_clk_get_optional(pas->dev, "xo");
 	if (IS_ERR(pas->xo))
 		return dev_err_probe(pas->dev, PTR_ERR(pas->xo),
 				     "failed to get xo clock");
@@ -559,6 +571,14 @@ static int qcom_pas_init_regulator(struct qcom_pas *pas)
 	if (pas->cx_supply)
 		regulator_set_load(pas->cx_supply, 100000);
 
+	pas->mx_supply = devm_regulator_get_optional(pas->dev, "mx");
+	if (IS_ERR(pas->mx_supply)) {
+		if (PTR_ERR(pas->mx_supply) == -ENODEV)
+			pas->mx_supply = NULL;
+		else
+			return PTR_ERR(pas->mx_supply);
+	}
+
 	pas->px_supply = devm_regulator_get_optional(pas->dev, "px");
 	if (IS_ERR(pas->px_supply)) {
 		if (PTR_ERR(pas->px_supply) == -ENODEV)
@@ -1530,8 +1550,22 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data ipq9650_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.auto_boot = false,
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,ipq9650-cdsp-pas", .data = &ipq9650_cdsp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.43.0


