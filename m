Return-Path: <linux-arm-msm+bounces-107945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCN0MjE8B2ottwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B8755227F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD41E30668F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292A549219D;
	Fri, 15 May 2026 15:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="racU4I5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E9E3CAE76
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858414; cv=none; b=VDTX+CU0h25ubHhSbkH2rp4f6wPIvpaZiAaM3GAL7YGwsi+POgc4R3/YXxyxOcO5cWzPGClOM5diD5w4nGLE35RR+KngXV9ZnzippAFZdeG9ZbvYSezGYjtrCw1Uy8FOuIbqXy8Ovnw3ivOj+dvVAlumJ5zgUOGZK29ur81vr0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858414; c=relaxed/simple;
	bh=mXltyvse+gt9WykHy6SVnq37KIlEwWc4char3Gsh2FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsbTb2FSzEmJupRB1SpE/cJ4CbfuL1shTXkCh2wMAp+fryN/4cdJebR1R0T4CZVEBQ5QPl9UAN93573bq3x+PA/L71EUkraoH+xpNi/pjGwRAvwyh6VQ4Mq3nUA8UmHEYn24qShwPUOUFKpHaU76w4O27XTx0aBxY8RlEHrm8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=racU4I5K; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a409f3f2dbso457739e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778858408; x=1779463208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2IaPJZkrFxEXynNS/UOEiH1OUbqJbyKhqhbo2jqolk=;
        b=racU4I5K+m0Hx6Ak1LYIzKV2gHVMnug7JSWZCOYfwaay/qpij+Ktzje2TO7Hq1NXP4
         IH84lZ96Bi5OBpQ5GIWtafCyD8XSNBYzqAevTRKBs4wFyJ/6VExQRFG5WBNkMPMWnauR
         DUfeg6I1tv0S7av6DnDlvnN+jkttymAzzbeFJvlVhe07UhRyJxk7jnT+b8wev0z8e62+
         sYN3KZPPvU3mlq4+ry5eGeg2/VaSohG9cVL8nHcqOcWDlOkhmC+cHlOSH4qhvmFIi9Q2
         HHgVpo+LEySeFKuYiggA9LLvFhn/er76IibzKd4cupMSQo4r+h0PcMm1wtwHXysl+O6p
         4ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858408; x=1779463208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2IaPJZkrFxEXynNS/UOEiH1OUbqJbyKhqhbo2jqolk=;
        b=tAgx7wmbuE7rkodEwqvy64cpRw/w1zUzGKuN/5VLeChxPmbeDX4/a2yzeZIt9AB7AA
         0Zm+mlYIlEwFFXz39cNZepLhjX3MHrVxKlYQDLlfFEcu1OTxayADclLEAoVZ6AI4vDWK
         yXq9Td4qGKEPT5TQxjiX6P2fPPjQEw/JOjWgSnLIwVpgMahMBBoq/Mlwz6PbhIognbpj
         kYayZMnrufRTDdHothylxYmd1lieJD8C12yCmYPfrvfR58oAQ48EiFtKu3GdtuYh9+ko
         YW0qK8SQ0FjjcWJrRLCvT64tmuF7F4Jem3l+0N777qrsmyzXjLQbDyJy5ypb7S/1KmSr
         uiag==
X-Forwarded-Encrypted: i=1; AFNElJ9ZeBh9fSgnGPyqA5n35wiisjf+y4XQvW1f7il8zoN4Uopai2noU4tAPN/xIwZgcPQT7YUX3GKKazeI7vg7@vger.kernel.org
X-Gm-Message-State: AOJu0YxrAQhzkr6Qn9ppjRhGfrGGMtyM/ZzuTNRgaV9ojE4wg4mOgs6j
	MOSuu+NPL/OWRQRNVFsRNy7cWs4d6i8ucGX2mqJICnzdLgGEYKjp5l9uUGP1nGq7OA4=
X-Gm-Gg: Acq92OGWsug334SNlZkgTNKhVDZROIfEKjUlPHQGt7r5fxDWLqlxOlVIM2p6Uv84vyK
	ctASH0D25S0hpPhFQSs9vV32M3F1Vt+vVZ/y79YiZmnW8mcwSVkQDyCnEiqZOlOeoOygaLVfOEA
	QzDy7ykUoRnKCw4ZBs4ZW55YiXWmIjjHdLZ2vRv570JeaK8XYZ3Gt2pwZMUPrUqVXiZpdEGV8fW
	cHNIpSG4gaqiQ+s4YO6F+kwQ9UteIRR4ym+xPtiyyj4etLEkknMdeLVg4ZBGEP5iL9BAiQaEj2I
	wqGRe3iJGvK9VNqAVS8RJPZ2jDHs50Q+mbvADH4JxW4HeSdVQxZzIwLCBwlmuLfA9/pZqoq71Kf
	GSuXjVl+lU7MPN5u1DEzoD33LTZF/Vdv/chW+Cp0M6ecCZtaeUJpQ8zDqQALs544DOR1LYdpi26
	NscrSK9yjvKEQJyC6Tboo+MP6iuJOK7IgTg5kkWNj8cYypzWejt0j5dXjObzU88bYdLA==
X-Received: by 2002:a05:6512:3409:b0:5a4:1099:b16a with SMTP id 2adb3069b0e04-5aa0e5d8440mr583093e87.0.1778858408333;
        Fri, 15 May 2026 08:20:08 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm1392418e87.43.2026.05.15.08.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:20:08 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/4] i2c: qcom-cci: Remove overcautious disable_irq() calls
Date: Fri, 15 May 2026 18:20:03 +0300
Message-ID: <20260515152003.1604187-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
References: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 48B8755227F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107945-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In cci_probe() the controller's interrupt is requested using a devres
managed API, and in cci_probe() error path and cci_remove() it'd be
safe to rely on devres mechanism to free and shutdown the interrupt,
thus explicit disable_irq() calls can be removed as unnecessary ones.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

	0001-arm64-dts-qcom-sm8650-pocf-replace-custom-regulator-.patch.hmm
---
 drivers/i2c/busses/i2c-qcom-cci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 2d73903f14d3..4d64895a9e9e 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -608,7 +608,7 @@ static int cci_probe(struct platform_device *pdev)
 
 	ret = cci_reset(cci);
 	if (ret < 0)
-		goto error;
+		goto disable_clocks;
 
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
@@ -638,8 +638,6 @@ static int cci_probe(struct platform_device *pdev)
 			of_node_put(cci->master[i].adap.dev.of_node);
 		}
 	}
-error:
-	disable_irq(cci->irq);
 disable_clocks:
 	cci_disable_clocks(cci);
 
@@ -659,7 +657,6 @@ static void cci_remove(struct platform_device *pdev)
 		}
 	}
 
-	disable_irq(cci->irq);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.49.0


