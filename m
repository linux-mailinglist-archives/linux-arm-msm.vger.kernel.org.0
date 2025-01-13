Return-Path: <linux-arm-msm+bounces-44904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33425A0C118
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 20:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364BC1885846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 19:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC1E1C5F1E;
	Mon, 13 Jan 2025 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWmruOhC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0C1C3C15
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736795631; cv=none; b=J4WL5nSt9joeJHvSjg4sIMPjtozGlH1LlAxRGoGRYXLdwx2cq8JemsZA9mtAIm5fs25IGfc2WmXyMrV2mffIGwxZdRRcwFd8ZLent+MYh2kgxPnzAMSOrLH1EvetGq1F1PyV8uwQ3D3KysVrLAtfImhKUsCBpBJpZZtO5QYeWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736795631; c=relaxed/simple;
	bh=AyBbVigURVmoxDC6lvxqTJAh2m5iJC3eOggNKLZYlZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IJRi+b7Q3vJBoZb4QgaPqtrLs3GqBRZlGFfD0HD15YmmV/t+700PvD40msD/sURZVgbNtG1G9IHfZHpjCCUt6EsBopqr9rK9sJ8icy+PEzeyxtLto2OCag4SKyBwvY4u20reA9jh5VpGbbSxylJYq5gZWaDZ186SeZSh2DSF/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWmruOhC; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso7886704a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736795627; x=1737400427; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE33POUt2+iszfpt20Nqlmknt+0wqjiuw4LPVCBXmGE=;
        b=EWmruOhCUMAVZfwU5D6yeW2lJ1ub8WC+HECdli/FozkfI0BYlkaHDMXKpmzb77Pm3M
         vY6SqZLZlOyj3T15FuqQvADleITJoY6gyayr2uzKiS96cmr2TexSYv7+7v7CfulJnhZh
         QKgFg6KUU4QBb8eZSuWl03krjpqppeL+pGY+NGhUhZKbBLLjUStyfmBNqaHDQKcNWIsy
         6p73dBGEdR+u0T4EBhJhWJkPnEYeyOGu2+p6uMFThvRFKvZQ3oZ3VbxF1YUM3TRgVurp
         tbTuHKrDPqdXJ6DbZ8oxng/p/7D3IdHvWaTwQnurukfLr8873L9VHT1Xgb0FZKy0JXlw
         8Klg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795627; x=1737400427;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE33POUt2+iszfpt20Nqlmknt+0wqjiuw4LPVCBXmGE=;
        b=CBKPttOAtw+0CbnRP8Q8D943oqxmEgbHWOly1VQAxTZ39TI9Vz+FrPS0ksw44vZFOk
         WrNdkluxkvx7fGHcdsDKKvUhma8hOZ2/A23AldNL3KwfoD7oNhhwceoydLcT+HiNyWmy
         ksT5GI43yZmdt6BPpPjhc8V7F1P5c503wMANMJ2TkTau1KUdlBUjT4+Qd4mDRuRmnQqh
         4IsOVYQDMNUh8HvOnbqzbOLpYcM5bBoegcwCjnBTBgBDcj4bjpUfugCaQPQDLojXSiD0
         vz8aXNjLTq40MJT9h5ADIkxrAa/k+ABqyTlZ+Preh8YNDB1VejO7bDNA1L6spRZ4Kg5O
         Evpw==
X-Forwarded-Encrypted: i=1; AJvYcCWP9HtcPFyj50qE8+2YMCAbRA96B1Xb/uGlH3kNrQ3r05O5pblhREmRlOY658mW2wfSzZ+tXsIDXRKckWvB@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYLKi6eVXWCEwSjIcGkRH6atf5PVIi3QQPTfET1j+smG+zE06
	2Gejz4CYO9im7iw5IxX30CTAFx2GHoc0X/EhKzJrJ+xbYt1B87aMyDQHa7sJO7o=
X-Gm-Gg: ASbGncvtB5yDUDPaakDPsC7PdKfOzD8n9mu1oc+Ibn3VzaMTtze5banN9dGwE11Y5z0
	WN0yKCqwg3HV57IoC3cypI4Vr4m6F4bM9wJCmGaoXDRhRDRqzHk9+gVw/woKlzcdstPFiptsrN1
	qRW/GJfN6W5zY1zRQK+EqkSNy/JvwMGIEujaAH8p/zMVd3XuSr58LYmLtarp5JC/CiNmo9V8OjX
	lS56Rj10xLo1o/qMisq7bvrMAmTxtYudRp2QifFoWYiKZdnFAJln0VrCgNj9Oe2sA6kGyze9MLv
	NwTqvZ7Zi9/WoJ7LiL/YiMO2nGWjVlnfLWiNpeTZ
X-Google-Smtp-Source: AGHT+IHCboU7f9NwsTjWB7S/v4RS6GfG3YG/9+YBh8V6k+rI8SG1CJroMnepLppBr6OtsLwC4toMYg==
X-Received: by 2002:a05:6402:254b:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5d972e1a09cmr20527141a12.20.1736795626519;
        Mon, 13 Jan 2025 11:13:46 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2d58sm5238605a12.39.2025.01.13.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:13:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 13 Jan 2025 19:13:45 +0000
Subject: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOhlhWcC/x2MQQqAIBAAvxJ7TtA1D/WV6BC6m3uxUIpA/HvSc
 QZmKhTKQgWWoUKmR4qcqYMZB/BxTwcpCZ0BNTptjFU3l+iDYnmVw0nPjMEiM/TgytT1P1u31j6
 1C2T/XAAAAA==
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

devm_blk_crypto_profile_init() registers a cleanup handler to run when
the associated (platform-) device is being released. For UFS, the
crypto private data and pointers are stored as part of the ufs_hba's
data structure 'struct ufs_hba::crypto_profile'. This structure is
allocated as part of the underlying ufshd allocation.

During driver release or during error handling in ufshcd_pltfrm_init(),
this structure is released as part of ufshcd_dealloc_host() before the
(platform-) device associated with the crypto call above is released.
Once this device is released, the crypto cleanup code will run, using
the just-released 'struct ufs_hba::crypto_profile'. This causes a
use-after-free situation:

    exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed -11
    exynos-ufshc 14700000.ufs: probe with driver exynos-ufshc failed with error -11
    Unable to handle kernel paging request at virtual address 01adafad6dadad88
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    [01adafad6dadad88] address between user and kernel address ranges
    Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
    Modules linked in:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.13.0-rc5-next-20250106+ #70
    Tainted: [W]=WARN
    Hardware name: Oriole (DT)
    pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : kfree+0x60/0x2d8
    lr : kvfree+0x44/0x60
    sp : ffff80008009ba80
    x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffbcc6591e0130
    x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffbcc659539d80
    x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffbcc65714b22c
    x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 0000000000000000
    x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffbcc657a027f4
    x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffbcc6579fb194
    x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffbcc65714b22c
    x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff80008009b940
    x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff22e006f54f40
    x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc1ffc0000000
    Call trace:
     kfree+0x60/0x2d8 (P)
     kvfree+0x44/0x60
     blk_crypto_profile_destroy_callback+0x28/0x70
     devm_action_release+0x1c/0x30
     release_nodes+0x6c/0x108
     devres_release_all+0x98/0x100
     device_unbind_cleanup+0x20/0x70
     really_probe+0x218/0x2d0

In other words, the initialisation code flow is:

  platform-device probe
    ufshcd_pltfrm_init()
      ufshcd_alloc_host()
        scsi_host_alloc()
          allocation of struct ufs_hba
          creation of scsi-host devices
    devm_blk_crypto_profile_init()
      devm registration of cleanup handler using platform-device

and during error handling of ufshcd_pltfrm_init() or during driver
removal:

  ufshcd_dealloc_host()
    scsi_host_put()
      put_device(scsi-host)
        release of struct ufs_hba
  put_device(platform-device)
    crypto cleanup handler

To fix this use-after free, register the crypto cleanup handler against
the scsi-host device instead, so that it runs before release of struct
ufs_hba.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
In my case, as per above trace I initially encountered an error in
ufshcd_verify_dev_init(), which made me notice this problem. For
reproducing, it'd be possible to change that function to just return an
error.

Other approaches for solving this issue I see are the following, but I
believe this one here is the cleanest:

* turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
  pointer, in which case it doesn't matter if cleanup runs after
  scsi_host_put()
* add an explicit devm_blk_crypto_profile_deinit() to be called by API
  users when necessary, e.g. before ufshcd_dealloc_host() in this case
---
 drivers/ufs/core/ufshcd-crypto.c | 2 +-
 drivers/ufs/host/ufs-exynos.c    | 3 ++-
 drivers/ufs/host/ufs-qcom.c      | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
index 694ff7578fc1..cb9db79ca185 100644
--- a/drivers/ufs/core/ufshcd-crypto.c
+++ b/drivers/ufs/core/ufshcd-crypto.c
@@ -177,7 +177,7 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 
 	/* The actual number of configurations supported is (CFGC+1) */
 	err = devm_blk_crypto_profile_init(
-			hba->dev, &hba->crypto_profile,
+			&hba->host->shost_gendev, &hba->crypto_profile,
 			hba->crypto_capabilities.config_count + 1);
 	if (err)
 		goto out;
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 13dd5dfc03eb..6874c769b697 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1312,7 +1312,8 @@ static void exynos_ufs_fmp_init(struct ufs_hba *hba, struct exynos_ufs *ufs)
 	}
 
 	/* Advertise crypto capabilities to the block layer. */
-	err = devm_blk_crypto_profile_init(hba->dev, profile, 0);
+	err = devm_blk_crypto_profile_init(&hba->host->shost_gendev,
+					   profile, 0);
 	if (err) {
 		/* Only ENOMEM should be possible here. */
 		dev_err(hba->dev, "Failed to initialize crypto profile: %d\n",
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b9f6efa047..d0a1e0f20a2f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -141,7 +141,8 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	caps.reg_val = cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
 
 	/* The number of keyslots supported is (CFGC+1) */
-	err = devm_blk_crypto_profile_init(dev, profile, caps.config_count + 1);
+	err = devm_blk_crypto_profile_init(&hba->host->shost_gendev, profile,
+					   caps.config_count + 1);
 	if (err)
 		return err;
 

---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20250113-ufshcd-fix-52409f2d32ff

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


