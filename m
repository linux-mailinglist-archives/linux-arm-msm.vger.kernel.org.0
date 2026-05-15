Return-Path: <linux-arm-msm+bounces-107980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKSYB0CvB2qrCQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6418559678
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 01:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5381E302414C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 23:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336E03F86ED;
	Fri, 15 May 2026 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VdIm4L7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21C3F6C5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778888495; cv=none; b=oF31vh4cSGDELYxWKf4BPoFU/jc6CQ9OzgzTWdAvLfMVrY/DNG0VYyjtB6OqXaxFou80DRe/VPOjFzv8vC3eaqQXI4l2FOuy5FPgbrZNUIwr8DVOc+/V5hgE/Dfr6yRvq2YYUtNo5hkUa7rthZ2JDGqyT/vdfG6lcedMjettf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778888495; c=relaxed/simple;
	bh=aw//OWk7ekdLqz6+NXAqRiETHV/evtXwY9fM3TOle1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfWH4DE8LCBq6VwAckgBDa9NnEtiYFg5CtAOEDdhJ7uKrTQvHfBjA4hC0vkcoFu87dxiJHWrqvNBb7G0qqTg7arDHJlmyrHpYLcvWjwATzjniV0tZHDsjBoeDbMB5Fa6ViLTAEejLhaB5oiqEMNiZkg+T8o0WQHSXFRYNWSqShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VdIm4L7o; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8ccfcbb3fso34261e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778888490; x=1779493290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y5rcd8ol/OODf2w+e7bAV3jzDI3zj+SkdCDhFbr/Ws=;
        b=VdIm4L7oVzeVWzk/zmjH2JYH6nOx07Xz3Yy14wh7WeBCij5ZHvMgGlhKLbFIkaKZUG
         josOW4Z+tDeJqk/eh4BCl0m084V4Wb3cffgq6tOCGeeCXhqHl5rx8WsqKtW/ZzEVjdpF
         gP53+j3fhJGpW/wNMrODZoscku+4+HUtuBt7QBzF9XKau3b37taU7SNXJlNa6hpjJeOP
         6mpDHlLNdaN1EwHfT3pfXfa8ntyOfFCF+Tkyrp+exn4XoORP/KTI6KWUVOlPRoHqrZtU
         wt7cm4Gsgiu9MSO5KKKFGTDcYxfqzGfVJqb2PI7i2K629pxq5WnQXgTARhOYApJc+qXd
         bzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778888490; x=1779493290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Y5rcd8ol/OODf2w+e7bAV3jzDI3zj+SkdCDhFbr/Ws=;
        b=iG3vGdQJAVQ+AzGRktenkpHWttovMok0Q46wP4Dr6NoDq+enUBtUAZ+WiKd5o0dCWp
         ieuB7VL/UrSYAy42TMXevKkC/7yePkmFeiams+c2nwl+ILwIx8soIbrLGEzieVea6eJz
         o6YK2+2p/zBqjaA2RCBQUV8TgBu9rRv8+D3iWTk0yUtKRCjYPw9kAOsPA6/DlI/JQpxg
         jiIBhO1+lwCL3wdB3hiw9H4xNaZ4BCwB1UgRXNfKzaM27orntMgxOkSpvME4OOcvpR8V
         64jSQ2Hr0yvidce1JcdPKJiHB3mDdKmv+819EvNojzsRQWBsD8k22tPdtKcP7lgGlkFx
         iOrw==
X-Forwarded-Encrypted: i=1; AFNElJ9xcbpTdfyoDZ0lW6FeTyE+8/haOZqQ8TizRVp3UD6WXCd5NvTV536RtICY27liPtALRMf6SFlXXBQTqKmM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkmtrm/dhFyjMSLdVsfmAkC65+uL5lmQgNa717wUQmBkZyXuzx
	njzZ/WwqalP9ApwQZMZvtHIYmILSrgf8qSqpbmuyQsxorItA9TlY7cWCqeUZgMUYU70=
X-Gm-Gg: Acq92OECDlGxAT506iYeAPOzy9cItRO3iG2GadqzZH5XsEo/tmyMOkecfesznEznkM/
	wJFQrudmDGILV1iGBsjthQCL86J81JgT0fj8nlqilzEv4DNw1Q1V1DbgwN5Wsq3Ek70mgJ5Bzcw
	Iu35RLwifWV9xFjebDFT0/+mUkHRch6QXFGTkUqUDcFM7phoozNHQNWqJZ+C2x4UiUOAuKHxU7d
	UFE3YO0VvXJneEWvHwqIjeyqvLnWvPst746D+i36fEzAlmSehgkHZsBEJPHeK3GaXIDclC95Vsw
	lWnIWVZ+RLrrl4m+4RaBmCvhOggMJooPhuxHvG3uTXjGdX9599abaOa9v7f9XoxgdXlT1+cOBV1
	Sz4nE2Znd9JXyw1zEjBG4cCQ9zoZtaBZneFfYtc4QSJJaAhn84cST/GQSXtqV7Tr71EXOp44pZV
	som28xuV5+qfjktS2tzPmlmHv7Qh/rLjjQSZdf66fm7QGY6wUolixOstdRAhegKSVEWiTV+03XR
	vLW
X-Received: by 2002:a05:6512:1085:b0:5a7:4048:af21 with SMTP id 2adb3069b0e04-5aa0e7470b9mr831580e87.7.1778888489796;
        Fri, 15 May 2026 16:41:29 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c710sm1631384e87.7.2026.05.15.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:41:29 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/4] i2c: qcom-cci: Do not check return value of cci_init()
Date: Sat, 16 May 2026 02:41:19 +0300
Message-ID: <20260515234121.1607425-3-vladimir.zapolskiy@linaro.org>
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
X-Rspamd-Queue-Id: B6418559678
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
	TAGGED_FROM(0.00)[bounces-107980-lists,linux-arm-msm=lfdr.de];
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

The cci_init() function is not supposed to fail, and it never returns
a non-zero, so it'd make sense to convert its signature to void.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 01e440b6585d..be41a53e30c6 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -243,7 +243,7 @@ static int cci_reset(struct cci *cci)
 	return 0;
 }
 
-static int cci_init(struct cci *cci)
+static void cci_init(struct cci *cci)
 {
 	u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
 			CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
@@ -284,8 +284,6 @@ static int cci_init(struct cci *cci)
 		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
 	}
-
-	return 0;
 }
 
 static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
@@ -611,9 +609,7 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
-	ret = cci_init(cci);
-	if (ret < 0)
-		goto error;
+	cci_init(cci);
 
 	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
 	pm_runtime_use_autosuspend(dev);
-- 
2.49.0


