Return-Path: <linux-arm-msm+bounces-48970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEACA3FD55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C99087A78C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E002505B1;
	Fri, 21 Feb 2025 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+K7QubG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181032500D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158604; cv=none; b=Ycb+zFSoU63kEtSD8szGaxXLg8ppyuk43CunVMH+kmAyaqpygwQYDoN3XaNeJYltYTV/GSwmvC3adTFUGMjId+boMs7PqleT0OMek8uZaTrZeQa5UpwA9rDaAe4KQR57ilYb2M2hQovpLU8H223NcgyKLnH9lkvODmUbDr5lYqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158604; c=relaxed/simple;
	bh=TvvuaEdFtU9UqfsZC6JoSCudSB2FfcZqsrRdClTssfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z6RjuANmVugDsIF3fOeA+wCNpN2WhZWandur7tVea+XK4C6s7PyQTDHKTOVgUAQPENX4JRztiQ71z9yL+xFQU2aZOh8Rqb1K/gbo7mw4u/mLWxrEgFqGTu2kKvF1ScVubdiYaZYyNsG1DPLxTn3dL3cutUjxI/A1rx++fwwcArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+K7QubG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220d132f16dso38811645ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740158602; x=1740763402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob+IAIS3PcMsuG9oa1uTykNVP/mdisbkDjZEDx6eRLA=;
        b=P+K7QubGh6OsSxzeCkvWAJZSp/HffcG1JJSkpNWSJ+NP1AObC42IkEc50p4O7o23Fv
         1Un+21FJHXOopihnDlEVCgGTxLDv6yFiSIrV43zFYfSQ9h5l7QxkJiMR8437V7OsfViI
         u1RvSxKsDtj5RjlmT7XuSmRsy7Uab0sx3ZDjdSkfZgbhO5nHvRGXWX2ZeL1YgHc/79J5
         cmb6QFSdmT5q5v6JDbhJLrXKgmyQ1yEYlHIC8VBbpBJbYEvEWVn+NX/48DC12YHeWepz
         cdWio32VJ8SRFl+YsS7RMmVAi2EIgbqwOVETKfI1jtw6BUwaTDKhulGk+fcQly+ewci1
         8XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740158602; x=1740763402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ob+IAIS3PcMsuG9oa1uTykNVP/mdisbkDjZEDx6eRLA=;
        b=vua6rNWtgE5wzUTD5C15+szeNcexj9cDWNPnj0eWNZFVpLt+rIrO3FA8c+6yO18u5n
         KFLAtABZF6kylwpYsJXoAMgGhw9Mbsw+hfGUvQl5WobAwJvDeDaT5OX1STMhBb1HccY4
         zVqYpWpYN+x/Av6E6LGFoj6Ns3oohqBtutxqzcVw65W6G164/EHYks2VAq3pq6nt7B75
         zbdk8b0TUauVm2X3crMK7hQXuj6E1oux4v742FYzDbGF3B1bVphNcNj/mhXgNtc4RoX5
         NmCa5qCTypWlcHGhihqoGdbd2kAzYLcfKj60y7Khq7+qRf2EljUd8FEX3FxrFIOICbQw
         FHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV45SyeuviUIDG2Yhk2uIHhzFfBBVzpqL/mCKTs78JoEGJ1Mk5AXV8BnHJosLDHlanEsVdBLqM4Tupl2aH4@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhP9V/uUgpWUd81GJmMLEdWwQte6F6bl6YltVbYsgKeNpD56A
	c0E/O768Ajq20gw5aBJHjXIBM+AsasWxRdH2HnjNpShsvwnjycwCyrqdVZQlYQ==
X-Gm-Gg: ASbGncuV0AbCArmhHSrEmah+NvCbSUoLojuWmiWJEofhTn44lpV1NJP6Nn1ab1vwdxm
	s16AikTWGPm2icCiEo1IGG4+B4Gw36b2e5eFa+tpeMugQOnmiGloS/sNg1dqKZAzyS1dWFtRglY
	b2slBHR+DoPqRHMTWzEhdaENuo5LjfaJbWV8R0lirCzWI49fNwYUK5pyrRNPBvLct7H3oyP5lbx
	SM3OIGPQAzaE78zbVKXrM3AEoHMK6RYHBBPm1pxu8EqrdnIS4f5hP1J4bSsgqT0KlTmpjI6CjRn
	U/NckfUSz2YqOMbdIApsB2B4Uyl6HnRp5snRYcBlDKE1QInboC8G
X-Google-Smtp-Source: AGHT+IGzsgGWotdM0GJDHccBXJBXwgMMkAjpIS/G4maCwqsIVpwHx6wNGdibYi4vAESSIt/Gd8cCYQ==
X-Received: by 2002:a17:902:f712:b0:221:7e36:b13e with SMTP id d9443c01a7336-2219ff50d62mr80161515ad.12.1740158602264;
        Fri, 21 Feb 2025 09:23:22 -0800 (PST)
Received: from localhost.localdomain ([120.60.73.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm141243405ad.148.2025.02.21.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 09:23:21 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dingwei@marvell.com,
	cassel@kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] PCI: Add pci_host_bridge_handle_link_down() API to handle the PCI link down event
Date: Fri, 21 Feb 2025 22:53:08 +0530
Message-Id: <20250221172309.120009-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221172309.120009-1-manivannan.sadhasivam@linaro.org>
References: <20250221172309.120009-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI link, when down, needs to be retrained to bring it back. But that
cannot be done in a generic way as link retrain procedure is specific to
host bridges. So add a new API pci_host_bridge_handle_link_down() that
could be called by the host bridge drivers when the link goes down.

The API will remove all the devices from the root bus since there is no way
the PCI core/drivers can access them and then calls the bus specific
'retrain_link()' callback if available. This callback is supposed to be
implemented by the host bridge drivers to retrain the link in a platform
specific way. Once that succeeds, the API will rescan the bus to bring the
devices back.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/probe.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b6536ed599c3..36ffcd2a44a5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -706,6 +706,40 @@ void pci_free_host_bridge(struct pci_host_bridge *bridge)
 }
 EXPORT_SYMBOL(pci_free_host_bridge);
 
+void pci_host_bridge_handle_link_down(struct pci_host_bridge *bridge)
+{
+	struct pci_bus *bus = bridge->bus;
+	struct device *dev = &bridge->dev;
+	struct pci_dev *child, *tmp;
+	int ret;
+
+	pci_lock_rescan_remove();
+
+	/* Knock the devices off root bus since we cannot access them */
+	dev_warn(dev, "Removing devices from root bus due to link down\n");
+	list_for_each_entry_safe(child, tmp, &bus->devices, bus_list)
+		pci_stop_and_remove_bus_device(child);
+
+	/* Now retrain the link in a vendor specific way to bring it back */
+	if (bus->ops->retrain_link) {
+		dev_info(dev, "Starting link retraining\n");
+		ret = bus->ops->retrain_link(bus);
+		if (ret) {
+			dev_err(dev, "Failed to retrain the link\n");
+			pci_unlock_rescan_remove();
+			return;
+		}
+		dev_info(dev, "Link retraining completed\n");
+	} else {
+		dev_warn(dev, "retrain_link() callback not implemented!\n");
+	}
+
+	/* Finally, rescan the bus to bring the devices back */
+	pci_rescan_bus(bus);
+	pci_unlock_rescan_remove();
+}
+EXPORT_SYMBOL(pci_host_bridge_handle_link_down);
+
 /* Indexed by PCI_X_SSTATUS_FREQ (secondary bus mode and frequency) */
 static const unsigned char pcix_bus_speed[] = {
 	PCI_SPEED_UNKNOWN,		/* 0 */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 47b31ad724fa..1c6f18a51bdd 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -637,6 +637,7 @@ struct pci_host_bridge *pci_alloc_host_bridge(size_t priv);
 struct pci_host_bridge *devm_pci_alloc_host_bridge(struct device *dev,
 						   size_t priv);
 void pci_free_host_bridge(struct pci_host_bridge *bridge);
+void pci_host_bridge_handle_link_down(struct pci_host_bridge *bridge);
 struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);
 
 void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
@@ -804,6 +805,7 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	int (*retrain_link)(struct pci_bus *bus);
 };
 
 /*
-- 
2.25.1


