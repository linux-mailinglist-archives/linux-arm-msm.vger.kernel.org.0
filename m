Return-Path: <linux-arm-msm+bounces-93961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCg8LHqGnWnCQQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:07:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED90185E3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFF7A302DB43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6DDE555;
	Tue, 24 Feb 2026 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zglZ478f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7EE77F39
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930943; cv=none; b=K0YrE7X/x8W8CxxBcMnSEKs9YRC/tHo/HGtKDQsVoix7xvCGBaurk0cDUPOW/xZUXFTpzWiD1vUbYaqAz/Dq4EsskJfhdvbrAM2racgLnPkwrsT8WA4JK/XtPYRYuadosAvP1EVSGZiP7M4kLtlHnvM6Ua6qPz5158wAlf3SYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930943; c=relaxed/simple;
	bh=5J6iaC7/QP0y+DGKdkyTxTIHUxBA4h55M+mc4qRVvNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tWyCWCJCxRv1zLVszRnfhvO6hyXa8p5HjOHtpARm2nutNDFIPly01S6+bMz3XQvfHdiBBKh/dRNM66n4FFinFkhhy2vO/+Zjpm/27B6kw/aJX1kBkkzq1JWcEw/tpc38kJE7XHbbkB679AnGDBZio2uaRBNa+NcX67codLEZs6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zglZ478f; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870d35c89bso4805561fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771930940; x=1772535740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/K0d0r9ZG4mPQL7eWE9IREvrR7/jaMHMpGlBofp7zVE=;
        b=zglZ478fXho0bsUZIVXn9XdfU34QzhV3XIHnJ9NLoSiEEct+CX663m4x2dlTbI+SZh
         LXTbtSSB92Y3FMmi4OUEHvUvnyAzU83IQaFU5pWVFnTQ+kifDD3Aqf11jaIiB7G2QNin
         ZJ1/gmG09de+6ZWLrHOKQBlLEZdbExa7X6WCITNMATPrQE8ind7hHuoy5J3Gbmd4YHyM
         9XWNRZYRiSstjBCQLohsmzwfj7Svz3NaRFfHg7NaWPT4WjgnfAkpH8L13qyCcbttfbWE
         DvVvCRYNU9f2DDBRbMVRt1sJTUdHZu84O6TYk+OR5VwEd/yD7IkrlAMZuo0V0oVO2a72
         VBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771930940; x=1772535740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K0d0r9ZG4mPQL7eWE9IREvrR7/jaMHMpGlBofp7zVE=;
        b=stYkjJ8oiVx7kjnYHlMrsYZBVPMHI+POQfEJ2x0hYjgziJWNwgnF59HgiOtW+2f5wL
         MtKbTIwI9OxO9pNAwQX5zXin2L9ibAX5bI+veGKU9IeM+gHAhPVIdteK4b6g7kdazfLn
         qOJY4j+5zyTX3UOfbCyTu33iBFAvvfyKmK5fM4PSxnncZ6EomqeBGs8NXxK26Y+3TYLv
         F4uLPP1FZud6ewxNT/5/7IjKbL7TFEXKa3IRcC7U1Irve+JHcwTL3ixFv03ffALAnNYo
         nQEJUOi1nyfYjAcc1hR9bHwRlamn+DfuYiqYzu0s+N1uQRwK4WsgMuGvHcvH9TjYII4l
         Hp9Q==
X-Gm-Message-State: AOJu0YwVg2IrVn3qJehrhGFFyuXylNltKRkgiJPVIKEy9LVYCuQ0dAqD
	nWedEJ86v8jfOaaCLj2RnbP0JFfpIyY8zrQXwd1jpVLMuQV3k1KlQrw8JD0svLcVu6c=
X-Gm-Gg: ATEYQzyezz0uOSgU+Hbjvybrv/cutoVrudGx9eTkNwNiLnlrZbFuI9bU2S1MiImV6hZ
	zWQkOew84ZknBHNsaYyvRGnmSf7Omxc42nA/tdaDIOA9nQ0yWl0rnguJ+2S/JrC8th+w01+fcPs
	xmtQzLR66Y6QpSxipcfdHHHkDMyaHI0VeAadPozIJYD5N89Hatt0r0SYhsyiMwrDrG4Am8X3HYx
	anrNGtngKDoDCfvuYoDJwjwIArrQjvKcDBuHOnbyMZdY7nmDYV0uDWpEeYqQT35e0HX8D3/lIN1
	1KvtcIWUPYNesQNtUcqB/Hxy/Isjy2zRmMjdt6qM101uERKTLGghm+ntcd2dWjDAzhq8uhVXhIw
	1XF9FUJv5HuunqNLlqqjqO7IXy3aefUzCmaaWhHzBcf0OSkknEq886sx8UtoLa55xt9i8+6kDgR
	Qe1H7+pY3EKHhOBPsfmYGdme+pizmENbEBuZaGO6NOXviQlFYjII+XRXejdhR6j0G84A==
X-Received: by 2002:a2e:9a13:0:b0:387:170:73fa with SMTP id 38308e7fff4ca-389a5d66672mr19816321fa.6.1771930939813;
        Tue, 24 Feb 2026 03:02:19 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7878b37sm21095791fa.9.2026.02.24.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:02:19 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: pd-mapper: Simplify code using of_root to get root device tree node
Date: Tue, 24 Feb 2026 13:02:13 +0200
Message-ID: <20260224110213.3929063-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93961-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1ED90185E3D
X-Rspamd-Action: no action

A few lines of code are removed by using the global non-NULL of_root
pointer to access the root device tree node instead of its recalculation.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 1bcbe69688d2..64d2ff0dddf9 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -615,15 +615,9 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 	const struct qcom_pdm_domain_data * const *domains;
 	const struct of_device_id *match;
 	struct qcom_pdm_data *data;
-	struct device_node *root;
 	int ret, i;
 
-	root = of_find_node_by_path("/");
-	if (!root)
-		return ERR_PTR(-ENODEV);
-
-	match = of_match_node(qcom_pdm_domains, root);
-	of_node_put(root);
+	match = of_match_node(qcom_pdm_domains, of_root);
 	if (!match) {
 		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
 		return ERR_PTR(-ENODEV);
-- 
2.49.0


