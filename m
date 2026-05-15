Return-Path: <linux-arm-msm+bounces-107979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHW0Bz6vB2qrCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97B559669
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 265A1302337B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E2A3F6C30;
	Fri, 15 May 2026 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoDUEDRt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAB3F8EA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888494; cv=none; b=WJieXSh1ZI4K4eb5cEMeJzX10xiMDyPmAWlnAwuVoxMIJ4BFi+AhWDs2RkfXhLn/3i7QnMb+wnQZSbZkaPyfSe5m6b/nl8ZweO2wIpZaVu38MDnvgou2kbJ//ZwgCxA5LjFUMeiylFrtbct3600/UbpgYVKnyn26VaRNPrSLwFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888494; c=relaxed/simple;
	bh=C+qF5H05m+lMwqOx/0QVVROjNJSEOi/BBdhavGVTfi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iU+new/JTuiAso4GRAhlVFfONKIUgrglTK64B4aDvXb44+ZRQy1uw5H6TJfHm9OdwdLOSJCBiUDL4t7qcBlciUR8246Iac1Z6Qa9BgwEp1biB1RnSBqhokf15gHkAoTA+CrnevyF5lUMPcipOAnjj7v5w8riDXPzuumo4wxmXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoDUEDRt; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393933b8c6dso468411fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778888492; x=1779493292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dfTgLeE5mGQ13g3PRCIVRX0SnrFeZ5bvGsKRjJIG5Q=;
        b=WoDUEDRtzMtlMHlNR98zjQcyVL/nLji1foFO3kNwl+nwqRsp1wbz2HiafpS16V7C04
         IeBZuadgkyRoz7Zf5QUABAbUJ6hXZc9edCxDfYJyKRel9NCU0HhehBETz20/twfR3LzZ
         FCoqWQxi3mjVLiVZ8eGfMh4zu8I9+cPW2CyocEr6L9FOQOiju4K6k5SqAneVGeFt8zC8
         S3UyrhbFqyCAyw5BOZNl4IihC5d2pD9c8vTudBkNQCwjIVjXlAQQns123/YTi6h2IwuK
         9eZicbSsAaIhWfekP91dKL+iSY/lsdfLgLEOkg783BJaVyyZnLWv/mRyjJblGf7RDCCy
         RaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778888492; x=1779493292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dfTgLeE5mGQ13g3PRCIVRX0SnrFeZ5bvGsKRjJIG5Q=;
        b=tSByCmTMnjcpDw65ZcN4XFbMCoytOC3X6QfVVJyboB/h3jMp0hlgfxCYPBkTnM9AXW
         HdIpIZy5OYhDG+KGpL5zVcyz9XXEr6C0AMJm+DuVO50o0uQWkGAWrSZYT3GGGvdAM1DJ
         bmSR4M7xW1R56bzlpviFjT59EDKa4OM93spRQk7FCMMpBTgpG3TZ1u7SkSKugugcavdE
         5cUOEWA119oav2zg84g79f7pJ5Fm8uYC+8ZzOzD4Mjxkh8r9vRsBgiChY9JI6lK6t1Jo
         l7w4EDTjP7cZFdGnYk1Luv76Y0beYR0J8bQGK8TTtxy500ZGiFUJE6ZUm+M5dYQNY1uV
         ayaA==
X-Forwarded-Encrypted: i=1; AFNElJ9onezuNsSOZ9mR+elEC20ohhW8xwgplQq6Gg5P6eYNE9IqfU8W5UOuPTKOvJKziLD7vHdHP3Mk7SGc9V6n@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9FFsmAghnuWLtsCoAA5d1e01JgBM1RVM06Uar+yhYr3EEWRf
	IOWBOYThSA5wRZMjGNUJh9YcsnOXo+v0h1kZk9nyNkMp+8bXg0IAdWmYl4LB0QXV6Gc=
X-Gm-Gg: Acq92OFQT94KTnxt3TnWbOx72v3TLeiVUAMNdyR/TcuSEYPNSifReW5d/wJamOv5wLj
	4xusxQs7RwESsFrmkn/687FmigEPw9CvmE+8OPuf3cGwPzWjYFKFbgX11KceIK+ZtkGemvtaDky
	Zx7IqMifUFauy9ftyQXUyl9UA9bxOECZjE2kAnFjFzyI7m4/Otjo0qfSQYGkVO/Z1tE7zfEIxYr
	33GyKVkHvpZg8LXYEqkn5Cbmw53Jc+2kzZSZtvqbDlLIB8cZA5BLplie/RYqEBaqQvSFnzSOUSm
	0fPYrmRZNj31h7QbP1QeI6zDVyMFg5A993puAFgAstPQZ0D7GIi8csecuz0PmjkhYu++yxEB9CN
	KtiY9i8cgDZwsgKeDr1VrYndUQzD7Lj/vRAdPT6aRPYFQasgotr2eIe+vC1FGYnvLPBAC9kxyDl
	3/DI0g1631XdNITbM/r0powta4sc/5ot2MyWGKYPiTmPs0IxP9ItuhBYRpp7Dn01oE7A==
X-Received: by 2002:a05:6512:31c4:b0:5a8:98b7:b69a with SMTP id 2adb3069b0e04-5aa0e76b273mr967880e87.1.1778888491634;
        Fri, 15 May 2026 16:41:31 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c710sm1631384e87.7.2026.05.15.16.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:41:31 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/4] i2c: qcom-cci: Remove overcautious disable_irq() calls
Date: Sat, 16 May 2026 02:41:21 +0300
Message-ID: <20260515234121.1607425-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BF97B559669
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

In cci_probe() the controller's interrupt is requested using a devres
managed API, and in cci_probe() error path and cci_remove() it'd be
safe to rely on devres mechanism to free and shutdown the interrupt,
thus explicit disable_irq() calls can be removed as unnecessary ones.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
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


