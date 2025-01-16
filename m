Return-Path: <linux-arm-msm+bounces-45264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C6DA138C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 12:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DB11644CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E651DE3C8;
	Thu, 16 Jan 2025 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcL9TxvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5C1DE3CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026310; cv=none; b=usAXaW9xPuLLkNGBd0BrotBYuUarXC/xviSYXHvQ3Gheup9XN6/D7lfAiOonmvxZKuF1LG2cKltFaVTHqnjCpS2w2ZO3PWyCcXsO83M/5vs7QDKmybAkg5Pam6Qb0wD9+EeTZYWU8VViJvPysOYkHOVbsrsujKva6zk7iZCb1Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026310; c=relaxed/simple;
	bh=Zd7jHP+XGlfY47OnGIk7XJX8Utuk+7lFL+EDjcWb7Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ahdxGk5KSRrMETJrFalTcau8M0lx1SKEmRSGvSfOro2Ocz50QdsFImOgGZYuEBYgbgQkCGKLpOcPgi1uHdpH5jNXH0EolAYfh60eCmsZ4p3DO6FqpstoK6XP7aMH/PqppRXh965ESfQ+ILWkUTrS7sGQRwQsmJIK1jn+8i7oAP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcL9TxvF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa679ad4265so388001366b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 03:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737026304; x=1737631104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52cZ4LMER5qN3pwWPAv/+1Mc4HkXxw2FRobsdgIPybw=;
        b=fcL9TxvFJXYizI9l8LMguT3E/rLevim6zyrS0J7C01XdWKSGCCJWwyi9oVBmm0CJng
         ffvHUSi9AAqVbWX7EnLrjxu52QgsubpgyCz6IzdU74a9Q9Rxk9pP+j0I/xS8QbEB14wx
         Xr1IYNIeym+VbJIocrS2fAdfZQPtLU3XH+TniSIRSLGoSQ1pmH9dcqHDnAgUPwnnQqfj
         QFDUvsZDx/OOU/uX8wKxPsg9CRpbkBJWpETMV4OBhnVridoXoXZdcNkBVjkv6qJNCHRO
         xAGuVJ7U220CS088BhgWq/QhLpHxbJ9sVbwhxYMBpyqYsWpXDTmdDaMksT+pCBDxCEvF
         WgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737026304; x=1737631104;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52cZ4LMER5qN3pwWPAv/+1Mc4HkXxw2FRobsdgIPybw=;
        b=LLbuM2CYmfj+dUo3JEtmxM9icOoGWHgOgvVEsOdmw1AxK4RL9AsSfzT2vJOqIn4l5U
         yuG4DPk/oAFt3Sbzy38RoWLIVvwCOZ8U92cLN7oIBvYyUWQ4ZRK/WOQYqiSYduFLSSXt
         51Sa0KnnNWLAgGHlRGxSFXTDWFVkvEkFLUR28yHXhoX8QZb2nMWtMcz/tdZMkphDX5ZA
         //FtZWviNeh7ZhKH7LLeAHdO4RmphxYow8loYlID8+D3Txz1LeD6q1Z6Kn64ATgqKpcG
         3+EFUKUli/B2ZxLVBwsaMOH6Wx68V30uws4SOUmNU02O5wE0t4VQB9MJ2Ww/v0LPlFbq
         rO2w==
X-Forwarded-Encrypted: i=1; AJvYcCUoOdP002GUuqsEMsDh0N2y6UHpzGDh/9u2BaSFJLbsv6p/AQ0XjLjEONCj+nydJcobn6E0t6QNW9tncs2i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7P+R0PiOpPNlImwI1fZX9+5VJtYzJFq//dc6RnXM1t45ucXb
	RMFkq+wPLN8HIF+yRFwKUkClfug7VYaHm5jb0beHXaGDGgr0cCDuoR5u+JHddA4=
X-Gm-Gg: ASbGncsJqOeycxhleEicRmGQJ/tiuW8LJLgD1nh5AgQQV/4ej0c19uAu6SQDQy7EHqo
	cW/U6zAxlJjXRTJs/nL0b+0ALyUIRI0MygOcbJo7T56RGVOMX77SwdN0cyihXK2iDYnp6S+Jxdv
	y0sPKK89CieHnWNiaN8MBsWBRZa4Lv06qvMX6dbJcXusYq4yNBRkEGsMr1QI4xLm/Ox2//osfjH
	HyUIE3DAZm3aUMUEBuKBLeMMoCuV99M62Ed68gY9n3ELiAESzHppcldPAQ++fTiXuy33KjPnoBV
	bB1qPMsg+zMTQLRuUy8jW3k/87asG9pnRAowuQsg
X-Google-Smtp-Source: AGHT+IHpMBoX/IkroSmo+PWN098yPyDq9q0kh7bX4gtU767TKeBokR24kjM0/xfgYfs9ZvIbTgjPYw==
X-Received: by 2002:a17:906:fc3:b0:aa6:489e:5848 with SMTP id a640c23a62f3a-ab36e434f5dmr158846666b.25.1737026304076;
        Thu, 16 Jan 2025 03:18:24 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90da0casm902233366b.61.2025.01.16.03.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:18:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Jan 2025 11:18:08 +0000
Subject: [PATCH v3] scsi: ufs: fix use-after free in init error and remove
 paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250116-ufshcd-fix-v3-1-6a83004ea85c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO/qiGcC/22MSwrCMBQAr1Le2kjyklTqqvcQFzGf9oE0kmhQS
 u9u2pUFlzMwM0P2iXyGczND8oUyxamCPDRgRzMNnpGrDMhRcyEke4U8WscCvZlGxbuATmIIUIN
 H8lVvs8u18kj5GdNnexex2r+bIphg1rTSCaduTuv+TpNJ8RjTAOun4G+rdi3WFp1t8aQ7bpTZt
 cuyfAE0Smqa4QAAAA==
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Satya Tangirala <satyat@google.com>, 
 Eric Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org, 
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

To fix this use-after free, change ufshcd_alloc_host() to register a
devres action to automatically cleanup the underlying SCSI device on
ufshcd destruction, without requiring explicit calls to
ufshcd_dealloc_host(). This way:

    * the crypto profile and all other ufs_hba-owned resources are
      destroyed before SCSI (as they've been registered after)
    * a memleak is plugged in tc-dwc-g210-pci.c remove() as a
      side-effect
    * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be removed fully as
      it's not needed anymore
    * no future drivers using ufshcd_alloc_host() could ever forget
      adding the cleanup

Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypto_profile")
Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- rename devres action handler to ufshcd_devres_release() (Bart)
- Link to v2: https://lore.kernel.org/r/20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org

Changes in v2:
- completely new approach using devres action for Scsi_host cleanup, to
  ensure ordering
- add Fixes: and CC: stable tags (Eric)
- Link to v1: https://lore.kernel.org/r/20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org
---
In my case, as per above trace I initially encountered an error in
ufshcd_verify_dev_init(), which made me notice this problem both during
error handling and release. For reproducing, it'd be possible to change
that function to just return an error, or rmmod the platform glue
driver.

Other approaches for solving this issue I see are the following, but I
believe this one here is the cleanest:

* turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
  pointer, in which case it doesn't matter if cleanup runs after
  scsi_host_put()
* add an explicit devm_blk_crypto_profile_deinit() to be called by API
  users when necessary, e.g. before ufshcd_dealloc_host() in this case
* register the crypto cleanup handler against the scsi-host device
  instead, like in v1 of this patch
---
 drivers/ufs/core/ufshcd.c        | 27 +++++++++++++++++----------
 drivers/ufs/host/ufshcd-pci.c    |  2 --
 drivers/ufs/host/ufshcd-pltfrm.c | 11 ++++-------
 include/ufs/ufshcd.h             |  1 -
 4 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 43ddae7318cb..8351795296bb 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10279,16 +10279,6 @@ int ufshcd_system_thaw(struct device *dev)
 EXPORT_SYMBOL_GPL(ufshcd_system_thaw);
 #endif /* CONFIG_PM_SLEEP  */
 
-/**
- * ufshcd_dealloc_host - deallocate Host Bus Adapter (HBA)
- * @hba: pointer to Host Bus Adapter (HBA)
- */
-void ufshcd_dealloc_host(struct ufs_hba *hba)
-{
-	scsi_host_put(hba->host);
-}
-EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
-
 /**
  * ufshcd_set_dma_mask - Set dma mask based on the controller
  *			 addressing capability
@@ -10307,6 +10297,16 @@ static int ufshcd_set_dma_mask(struct ufs_hba *hba)
 	return dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(32));
 }
 
+/**
+ * ufshcd_devres_release - devres cleanup handler, invoked during release of
+ *			   hba->dev
+ * @host: pointer to SCSI host
+ */
+static void ufshcd_devres_release(void *host)
+{
+	scsi_host_put(host);
+}
+
 /**
  * ufshcd_alloc_host - allocate Host Bus Adapter (HBA)
  * @dev: pointer to device handle
@@ -10334,6 +10334,13 @@ int ufshcd_alloc_host(struct device *dev, struct ufs_hba **hba_handle)
 		err = -ENOMEM;
 		goto out_error;
 	}
+
+	err = devm_add_action_or_reset(dev, ufshcd_devres_release,
+				       host);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to add ufshcd dealloc action\n");
+
 	host->nr_maps = HCTX_TYPE_POLL + 1;
 	hba = shost_priv(host);
 	hba->host = host;
diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
index ea39c5d5b8cf..9cfcaad23cf9 100644
--- a/drivers/ufs/host/ufshcd-pci.c
+++ b/drivers/ufs/host/ufshcd-pci.c
@@ -562,7 +562,6 @@ static void ufshcd_pci_remove(struct pci_dev *pdev)
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	ufshcd_remove(hba);
-	ufshcd_dealloc_host(hba);
 }
 
 /**
@@ -605,7 +604,6 @@ ufshcd_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	err = ufshcd_init(hba, mmio_base, pdev->irq);
 	if (err) {
 		dev_err(&pdev->dev, "Initialization failed\n");
-		ufshcd_dealloc_host(hba);
 		return err;
 	}
 
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index 505572d4fa87..adb0a65d9df5 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -488,13 +488,13 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 	if (err) {
 		dev_err(dev, "%s: clock parse failed %d\n",
 				__func__, err);
-		goto dealloc_host;
+		goto out;
 	}
 	err = ufshcd_parse_regulator_info(hba);
 	if (err) {
 		dev_err(dev, "%s: regulator init failed %d\n",
 				__func__, err);
-		goto dealloc_host;
+		goto out;
 	}
 
 	ufshcd_init_lanes_per_dir(hba);
@@ -502,14 +502,14 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 	err = ufshcd_parse_operating_points(hba);
 	if (err) {
 		dev_err(dev, "%s: OPP parse failed %d\n", __func__, err);
-		goto dealloc_host;
+		goto out;
 	}
 
 	err = ufshcd_init(hba, mmio_base, irq);
 	if (err) {
 		dev_err_probe(dev, err, "Initialization failed with error %d\n",
 			      err);
-		goto dealloc_host;
+		goto out;
 	}
 
 	pm_runtime_set_active(dev);
@@ -517,8 +517,6 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 
 	return 0;
 
-dealloc_host:
-	ufshcd_dealloc_host(hba);
 out:
 	return err;
 }
@@ -534,7 +532,6 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 	ufshcd_remove(hba);
-	ufshcd_dealloc_host(hba);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 }
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index da0fa5c65081..58eb6e897827 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1311,7 +1311,6 @@ static inline void ufshcd_rmwl(struct ufs_hba *hba, u32 mask, u32 val, u32 reg)
 void ufshcd_enable_irq(struct ufs_hba *hba);
 void ufshcd_disable_irq(struct ufs_hba *hba);
 int ufshcd_alloc_host(struct device *, struct ufs_hba **);
-void ufshcd_dealloc_host(struct ufs_hba *);
 int ufshcd_hba_enable(struct ufs_hba *hba);
 int ufshcd_init(struct ufs_hba *, void __iomem *, unsigned int);
 int ufshcd_link_recovery(struct ufs_hba *hba);

---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20250113-ufshcd-fix-52409f2d32ff

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


