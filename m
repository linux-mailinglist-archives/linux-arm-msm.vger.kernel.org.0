Return-Path: <linux-arm-msm+bounces-20612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBFE8D00A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D268F1C2288A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FCF15FA88;
	Mon, 27 May 2024 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i9Wk1uEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1583D15F40A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814614; cv=none; b=ku9qfy6xm8btkfV2icCWUb5UuSnzoSeeR0dkZvs9TmuwAoO/Ogebhqno0QGD32QAD2Qayb+JsD+a35YLAfWJU5CVeOrA3iooOw2Gwu1UkUnWYaPQsbyUxsT/3kRC2u0ZUYRRkaz8gy5XnJp9Xao/o3kFsUzNrHNvO+TSHdjEe9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814614; c=relaxed/simple;
	bh=VYDo6jzomkuy4JdOPo08LJWfL+6TdFoDBjONKt90Fys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehYzrJ/V4BIvd8Nxqxp5ixO/evTu/mc74IJ/6nPZaFbZwtniDPtcqHAWUMjZQhYKIKXd/+WUGZipCqeHaHrZ4qQvc2KCIkp8ox/yNhUaHtXSVemMk2zPgumcVZsDECAcaT6HMDB3yo4/pvtlB5Po6keTOmdhTkMdAqtv9HfAOEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i9Wk1uEA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-421124a0b37so6867855e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814610; x=1717419410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwqjl/ua5BMkegCLuGyA1/eY3rbR4AbTFjr6wje8pn4=;
        b=i9Wk1uEArmXGRsSaTravi7w/ya1pxnRpXvpQIb8CigF0qN2NCkBnRzE0j+H0ftpKGZ
         JajFpZ4CKYP699OtDIfzZGb1CrPAF6x4sqhPZU0CeghIvF/DbX4qXj+QJHGeHoFULgo3
         1ZMrjAZ9PmOE5rW2JdY/4qNgSmcytrXO7+lkp9TsCEZEpQ6tdfJYE8Cg76UuiP3dp+Jd
         uxoKkQ79eiw9Uw76DngKuKXmgRWPTHS9UdmwbXHm4P4dRwm9Q/Ft2XXwYxxb1OG7OCsv
         pn9meMnR1NpvyspwF2QIktmYANmthaEPkr0UpNxxdbR+1s7GBanTkxZs0nnKktxVdLEO
         Jy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814610; x=1717419410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwqjl/ua5BMkegCLuGyA1/eY3rbR4AbTFjr6wje8pn4=;
        b=npyYxeWduhpIJk6xAXk9RCeL1XEy2iLbEXkVNC7eRPH4mu9EtKOGm1vUwbxP+Hpn7P
         oCIKVQGbx7KlR7XOMR/bk5Tu6HcOz0+O1yLYfwuohnmJ1a1Tsaj+uGd58a2M5Cyls7DO
         80i3D3BV3XwZAqRhTS5w/arhX7yJdXHxD06metsX6aQGwNsVd0DQpJ6ZoEEi/B3QTh4J
         cVNc3Svft9XQFL1kMm6JL1toJedDFRcWkZpfyJvWBHLGIbG3Pg03r/yc9cdGnzasMegv
         y9Bnn0ljKX9iBaRDGqAIQ1PJiqd69TJnUroDPT0tgyYpc22/45WQ8Z37hcJFUmcCJR+D
         nRig==
X-Gm-Message-State: AOJu0YxtRwYzhuEw4oU0h1Fy6HRDHH9x0Zg3wQk8A1si46BhRNDHHZD0
	X7qDqYuCk7Cv9D9PCwDS99SteRfmuvm32EiN0Po/T7xQuUE4Wcjce4vBWifMBek=
X-Google-Smtp-Source: AGHT+IEkkOnfkm2D13BrEQ3/361Fm2xiC1eRGcXiFJMGscUWHvqf4qBhm46RUioe2i98CYXq1xagcQ==
X-Received: by 2002:a05:600c:4fc2:b0:421:1611:cd8a with SMTP id 5b1f17b1804b1-4211611ced2mr17280225e9.4.1716814610493;
        Mon, 27 May 2024 05:56:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:54:56 +0200
Subject: [PATCH v10 06/15] firmware: qcom: scm: make qcom_scm_ice_set_key()
 use the TZ allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-6-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MwBEmBbakFP8mlp72MFfpWCULQKICitWzxgwxI2nn+U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMJUy60Czjqag7xEYc7ahX2YHMBSOfNGP/+O
 3e+knl2ozuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCQAKCRARpy6gFHHX
 cpb7D/4k0RoNmUPSLf9pVkBFfOLzL5VCbdT/rLt9zoANLGewCzYTlfvevPcAPxYcnPdVNxNOOsS
 3VXMio/WlodYtrHhKM1jf3/YJxMis4vXMvQheuHxFiBah7735lA0IDUmZV0Y9SBMLd8XMYbzLIp
 05gFaSIZkhvLVzzRNquuPq41VZpPpHFZnK2124ftvaesthOzdGPenn3F4MMMHunTtIaURjWEmJe
 5exqKcCw8mtxtQhVw9VngQROJKUIE9xTf/8I89j0ITxquPXgPawilUvC3imwaIYv5o92UN75oyZ
 het5o9/XtuuGCnPl0dw8gA4hcOe8SJiZDoQUVAXp8/DBlW0JpsbnWmcioV8DfYHq5pHy+Xp/Ogb
 FTbgrA604bdVrYMxp3NBb/+ciCfiJEzUsTOQBbQ77KJblwh6ga81EPQlvAXriK8lKFKhOAVcpab
 q2kHrKK2NqesBOqKjrJaT1IjGe7jDA921eHyEAXZr0qw27EWYtt43O+7e3s5dyB0fBwU8TFr4ra
 SIlURWmItONYJRVfOhu4IzwRq74cpznca1b5sIksYOPsU0e4M4VNUTazf1rt1WBfvGGGrb/CnlG
 nEgnrJBy5fujQNRDlszNtrIhBemtxfigF2MQZGxyYpe6pzZ301OCp2a2KX0+ZVlntNF+QuKMQm0
 +uP6Ntt5HyVprvg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ea4d71bb0ad3..2c350de1df07 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1218,32 +1218,21 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
 		.args[4] = data_unit_size,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	void *keybuf;
-	dma_addr_t key_phys;
+
 	int ret;
 
-	/*
-	 * 'key' may point to vmalloc()'ed memory, but we need to pass a
-	 * physical address that's been properly flushed.  The sanctioned way to
-	 * do this is by using the DMA API.  But as is best practice for crypto
-	 * keys, we also must wipe the key after use.  This makes kmemdup() +
-	 * dma_map_single() not clearly correct, since the DMA API can use
-	 * bounce buffers.  Instead, just use dma_alloc_coherent().  Programming
-	 * keys is normally rare and thus not performance-critical.
-	 */
-
-	keybuf = dma_alloc_coherent(__scm->dev, key_size, &key_phys,
-				    GFP_KERNEL);
+	void *keybuf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							   key_size,
+							   GFP_KERNEL);
 	if (!keybuf)
 		return -ENOMEM;
 	memcpy(keybuf, key, key_size);
-	desc.args[1] = key_phys;
+	desc.args[1] = qcom_tzmem_to_phys(keybuf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
 	memzero_explicit(keybuf, key_size);
 
-	dma_free_coherent(__scm->dev, key_size, keybuf, key_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);

-- 
2.43.0


