Return-Path: <linux-arm-msm+bounces-96413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBH0Echjr2mHWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:20:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE21242F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51C61300A31F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676BB1EF36E;
	Tue, 10 Mar 2026 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0enkBRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385EF1C84A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102020; cv=none; b=AIQtp44v8dCGFsn8KGFkXInl+kG5hfRTiXK3G5RMOR5IKEsSKrkc6gccVohYMDxEGI3VugbG/3nRYwzuJCfyv7yPpFMB8BZSzyXak6/+eFNO3WZHndeJBzq3E41VVNYMeZDtcoHQv7IJ6x3J5CU3QekD88HU5A99DjGzgzGV7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102020; c=relaxed/simple;
	bh=zT7VHqFCzDwH7dsnqHKBT6R20zasdavK49rOXk8BcyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZ5IyIBeZXYslVoqmAOw4P557GJD4aB33JYG3RPeS1qUrVHDML+/ep5+clugR1jLxr/FWADjhR9b5JOdH+sVWqCBi5yBVm6ysFx8wx8BE4O7hMixmEU6XxGPP/Wsu/OZRNeNmk7XTduA36b5QfWsbltXx59F4lHaLzkdV31hiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0enkBRS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5090c27d3f6so23749961cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102018; x=1773706818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqMq09LrRUJ7Y1qu+vRwg7gsZM0+ELiCGik6jbn1EcI=;
        b=L0enkBRSntbBxvpcK3E5rFUtDs3tB6Xrq1rhI4zRfMGY/V+xRT/EvX4qbhUPLEQkaX
         lzX/aZZJl1YxAyCE/M2GL74Yqt46wbviJohIRk0GfMZbbrch0UR8pT1T1VrH5BbIBZTb
         /Rrj1sZENrzHFWoYOaPnkmmvwN8RvxZIzxu6aquQYg5+C22NIcdLYXrg/pzRaAKt9AEu
         hmpeqR9KZXWBWcqRxehkQYmKqCkFoXm6W2dqI/sfJRIQ3NZcj+rE4xC2YUKUGkAB0MVZ
         Sdx/x7hJW2ZLrBIhb2hrGSrbRfIVi4lFjkB5x6jKf+dUZOzCh4T8x18AOoLfHQAcbAej
         i2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102018; x=1773706818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqMq09LrRUJ7Y1qu+vRwg7gsZM0+ELiCGik6jbn1EcI=;
        b=dIySyzj33+MMDJHkynaHGACNyVgIV7v4IybonqA1ulUKuBtVpzQyhOZ4FOsSrMbZ1z
         BLWOdANSDnOzVAZdRhJRzrN+r7binv4h17a7NKS55n2ngJg8i66/nilCWXfq4p4oVmZr
         nukSc6iXPWiCDHC2PGZL+YNAA4FnTt1OKX1Y/bGRAuwNmzTYV4viI6iIozKRZPT+BQlo
         nn8jF/260VtRFFOJ2cTqah0mHqTT0ocrvm3LO93z1sC1eopPKXjyAhaDXbhWKCJUdZ14
         mzCV1y+1/+JxzVDF6Z87mWPOJzfa/Oo/eQ5xa4WRADt6STnjaYez78vA+kKsQpIpu7X+
         ZHMg==
X-Forwarded-Encrypted: i=1; AJvYcCVf8mqY8kYCAt1aKAEYheS8lRrv8ZyNFIr17xccg9Z9dpcgYm8HbLyuh1OViAHtwJssWYcEJqG9SQ2Wep+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3St5MLbMZgQknJ48+nhieCzS6Ow3xDlxNZvW9tdgeaNB8xL/
	63tE5VUjpJy3UEHH9BmIoYO5D2lI65H022ie62E7eXMrQwZYAZ+qkGdV
X-Gm-Gg: ATEYQzx0AQ1aIffrhLPHvQacKFteYfRIoiqaCQRWDtW18wruagpVASOvM4G7a2Fdksm
	1Adj1FRM3FbVYhcd1BhpiC4IVe/j8UnnhGiPBKMriLllcKZWB9pcbnb8wdyCfvWIRoSiFhHvr3d
	8Troh/JZfjssgOakdA6axS27XBaKZpi/NSZHM2Rvmo+FUSMkZ8gXKMMh1bKBYqeK2TVTJWAjRX9
	W1uGsWimgDugJclzh+rMGOeMddzzL17jWTqIq9d/llmQ4rN1XSiQ17ywuPRJbuaI3W0KyJQvZ6N
	cTauMvJbxC7NGL7wx3jkMov4eF634iK3EhU8HCz9QM2oUzVAUzXRGmAdmGxTXzbB7aouTxyejxU
	dJFLRR6EbrKruTWYBJ4P0QjvwkDMI+qlMg8CL8jd0hhWWRJsmRUAI3ddA9+H2XWH2PQRQalHCkO
	9uOWq2Dwj6DTIPGTWBb9Vh9EkgBA==
X-Received: by 2002:a05:622a:1998:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-5091dc8ed37mr53525151cf.34.1773102018043;
        Mon, 09 Mar 2026 17:20:18 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a1afabsm8615926d6.9.2026.03.09.17.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:20:17 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: thermal: tsens: add SDM670 compatible
Date: Mon,  9 Mar 2026 20:20:35 -0400
Message-ID: <20260310002037.1863-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310002037.1863-1-mailingradian@gmail.com>
References: <20260310002037.1863-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DEE21242F84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96413-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Add the compatible for the thermal sensors on the SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 3c5256b0cd9f..6c84f22ae322 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -71,6 +71,7 @@ properties:
               - qcom,sc8180x-tsens
               - qcom,sc8280xp-tsens
               - qcom,sdm630-tsens
+              - qcom,sdm670-tsens
               - qcom,sdm845-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
-- 
2.53.0


