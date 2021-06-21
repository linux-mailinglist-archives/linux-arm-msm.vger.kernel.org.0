Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82FB3AF9DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 01:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbhFUXzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 19:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbhFUXza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 19:55:30 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91B1C0617AE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 16:53:13 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v13so9434661ple.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 16:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLTgOAPTL/hdLPXehUk7jin9tlU4DA3I5amBsr+XFlI=;
        b=IakNO8AV5d2AjRngN+nO9dr4scVOZ/i0GXGfPwpIa86ahW3Gx5lGZr/Qvp7nX9QLEF
         ah2PHyMzxecYm5jvWAhtwLlNrNpFAqJF7xOfwTdlDZQDqN2rtdNZFIoQTtMU1ur4ZApC
         7UbMpvJg4P3n/t96Z0aCStxGsE3he4J8bRing=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLTgOAPTL/hdLPXehUk7jin9tlU4DA3I5amBsr+XFlI=;
        b=hJ09CMdxIokzxZX/fwzdcfRDPRtBpYwya50HVhDUtHfWchpNbEwTnOUglx/Zlc4vFW
         xU2Is1m/Xp/4fc5SGzjd0yinc8PABc/jp8ejeqliz3+BCIsq4alRaITADOq0niRYna+8
         MWTxPHCgHBv7cwt3sOwYn5ML7eckL3YOk7dfpnCAd2otXh5IkHlU1kZty/3xZTuJofLR
         WORAPKphYpCGyDiQ/jH5e+Z3q5b2x5llL/xQAAmruVQVUPEtGFtp81feWmEAulNiULbm
         iE1C+CIDShloHjYIhAitzN1TIslXPURCGckiPtV8SEasaomUxo88cozLTV3NAXwRE05x
         JH0g==
X-Gm-Message-State: AOAM530mJTAlwEsLAv51nycwIBPqbWGllCqKbVc1ejo6s6Q7lnaj37Jy
        Z1xPtErupZS/LVlH/1c1JA20tA==
X-Google-Smtp-Source: ABdhPJwRWBAs+yleFm5GhcTuxr1KlXgWqhCk+RoJTuTTOnsjL0UiSKVoBvEouzqIK5zI5rTU5FaO7A==
X-Received: by 2002:a17:90a:be03:: with SMTP id a3mr611377pjs.43.1624319593246;
        Mon, 21 Jun 2021 16:53:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:bdc1:a4b1:b06e:91d1])
        by smtp.gmail.com with ESMTPSA id s27sm4339663pfg.169.2021.06.21.16.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 16:53:12 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        rafael.j.wysocki@intel.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, adrian.hunter@intel.com,
        bhelgaas@google.com
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_c_gdjako@quicinc.com,
        iommu@lists.linux-foundation.org, sonnyrao@chromium.org,
        saiprakash.ranjan@codeaurora.org, linux-mmc@vger.kernel.org,
        vbadigan@codeaurora.org, rajatja@google.com, saravanak@google.com,
        joel@joelfernandes.org, Douglas Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drivers: base: Add bits to struct device to control iommu strictness
Date:   Mon, 21 Jun 2021 16:52:44 -0700
Message-Id: <20210621165230.2.Icfe7cbb2cc86a38dde0ee5ba240e0580a0ec9596@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210621235248.2521620-1-dianders@chromium.org>
References: <20210621235248.2521620-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

How to control the "strictness" of an IOMMU is a bit of a mess right
now. As far as I can tell, right now:
* You can set the default to "non-strict" and some devices (right now,
  only PCI devices) can request to run in "strict" mode.
* You can set the default to "strict" and no devices in the system are
  allowed to run as "non-strict".

I believe this needs to be improved a bit. Specifically:
* We should be able to default to "strict" mode but let devices that
  claim to be fairly low risk request that they be run in "non-strict"
  mode.
* We should allow devices outside of PCIe to request "strict" mode if
  the system default is "non-strict".

I believe the correct way to do this is two bits in "struct
device". One allows a device to force things to "strict" mode and the
other allows a device to _request_ "non-strict" mode. The asymmetry
here is on purpose. Generally if anything in the system makes a
request for strictness of something then we want it strict. Thus
drivers can only request (but not force) non-strictness.

It's expected that the strictness fields can be filled in by the bus
code like in the patch ("PCI: Indicate that we want to force strict
DMA for untrusted devices") or by using the new pre_probe concept
introduced in the patch ("drivers: base: Add the concept of
"pre_probe" to drivers").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/device.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index f1a00040fa53..c1b985e10c47 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -449,6 +449,15 @@ struct dev_links_info {
  *		and optionall (if the coherent mask is large enough) also
  *		for dma allocations.  This flag is managed by the dma ops
  *		instance from ->dma_supported.
+ * @force_strict_iommu: If set to %true then we should force this device to
+ *			iommu.strict regardless of the other defaults in the
+ *			system. Only has an effect if an IOMMU is in place.
+ * @request_non_strict_iommu: If set to %true and there are no other known
+ *			      reasons to make the iommu.strict for this device,
+ *			      then default to non-strict mode. This implies
+ *			      some belief that the DMA master for this device
+ *			      won't abuse the DMA path to compromise the kernel.
+ *			      Only has an effect if an IOMMU is in place.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -557,6 +566,8 @@ struct device {
 #ifdef CONFIG_DMA_OPS_BYPASS
 	bool			dma_ops_bypass : 1;
 #endif
+	bool			force_strict_iommu:1;
+	bool			request_non_strict_iommu:1;
 };
 
 /**
-- 
2.32.0.288.g62a8d224e6-goog

