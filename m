Return-Path: <linux-arm-msm+bounces-15030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEED88A741
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 16:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54DAB2A8E13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F33E14F138;
	Mon, 25 Mar 2024 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t5zCXSyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A88140E4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711372636; cv=none; b=mYIzwpZlsKXg5LfFWxdAkfBCma6w47oGmUZ49vNlCY+bUMI64LVmIr91k0slb+5nbKC0GAqPC6wURjyevK7LJku1sL/PyUFcLS8dytSgJhaAV3mBzYW7/Oxbvd+xxYBQgBGIf1JaOP/7nda1laOsQqp7cfn8Rc+vP69Lutr87k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711372636; c=relaxed/simple;
	bh=c5P5lscsnbWC5EHjzQG5JSjk93ahAtvYSeOqjGvj/7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MHO74ntXV1xox2I+myf0qGm3mlk11AEuBMW8K8c7c73poE1AbcWCzIu8M2X7FnD9gKMybRLrE4MgRUFDv7qJWb3HJHaVFHpluTmUWkRLUj7VKRq6W1aSsDnnOh35iNc4weqfAyR9CttSNY6kPGimzRfd60OBa6OxErF1XNyihBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t5zCXSyX; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-341cce3e5f0so976907f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711372630; x=1711977430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3Qk/DJ4ryR6XkF1VG+aVefQinCL6xUnkD758p4/AkE=;
        b=t5zCXSyXeXoyqRCnzuwJ7sWki2ClRtRSnEvkPMJz+mBBX5GTs8b5Gs/6LsCPO32r4M
         xvQOOLzeV60BnuKO7rzLH4h8Ue4xQ9LVLQz1vplTepcSFFNZ0NPMos9l3GcDVrpeCw43
         WFHYCIIY2quw3xk2XXTJz58KhPjgXnDsr+pt/Jp+lLtNpEFptqlj7//mMFC2+UI24Wj7
         JCnCUv0Fh50RetJAsPbDrT/ZPoPLjQ8kCoT3VsP5/klT1ApaEnhgiqtAavVhw5Yw2gYU
         ZiyHk/6lf8PedEa7uynzqFakJJLNsMNQaOKXzsMjNlj2mbGhikG/P7EGEXTiLBOonlf5
         adKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711372630; x=1711977430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3Qk/DJ4ryR6XkF1VG+aVefQinCL6xUnkD758p4/AkE=;
        b=oCCGLxbE/Bc51ReezYnRAJdK+c49IxvkjR1UpNcZqAi7Ndm+jEjfdkWulwsWXaoHCF
         w53r/o6BEOLWnVOvUpbL0pzXxD1GAfGWWjCyEWmmQdxcT7EDLh1RM/TmaPhFsfVCutJr
         o6vF+7MdzwMXV4/fDZwOuTy7Tsp0LprOXkoU4fYhrvEaiFu2BX2/BcrPWD2u3DlDv02m
         VvGT9ZEhopGFKGUXIRMYShp8mRIEQVznzx135pHYfmyWZPOsyhix3RIgbUhdKJaVwZJT
         6lQvuxVAKuasufXVzKWOX/mTj+jNCQuW/sAUHvlMiB8DCDuwS8T4nFWjcg2yPSAZ4yul
         DkFg==
X-Forwarded-Encrypted: i=1; AJvYcCWCCFLD4O+EX0pN3lVZJWTIFoglbuiSVdiCcD6EYWyBRgJGVkOLXsLD+dow1PnzrSotKKtXfUowCuKBNWHW7rYib11jSKR4J7JnG/UKYA==
X-Gm-Message-State: AOJu0Yz0DK6qAQwp8WdsnQ4gTxtRgqozGD7xr4is2LFjIRooVk8qGD5M
	OfEr0XSP5Dm8dCNgtCzlzt8nITlLWMojYcoiYS8RcWr3Lu99/eRnECiIySRdS1c=
X-Google-Smtp-Source: AGHT+IEM3mk7LpxC1e488PCakNoryx3p0VkwguQJKJ4VUTxIHuAPloCmFrFt9hJMR52EAvFfq4y+Pg==
X-Received: by 2002:a5d:604e:0:b0:33e:bfd0:335c with SMTP id j14-20020a5d604e000000b0033ebfd0335cmr6384163wrt.51.1711372630645;
        Mon, 25 Mar 2024 06:17:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:861d:8b72:a859:4ce9])
        by smtp.gmail.com with ESMTPSA id p11-20020a056000018b00b0033e75e5f280sm9485245wrx.113.2024.03.25.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:17:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 09/16] PCI: hold the rescan mutex when scanning for the first time
Date: Mon, 25 Mar 2024 14:16:17 +0100
Message-Id: <20240325131624.26023-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325131624.26023-1-brgl@bgdev.pl>
References: <20240325131624.26023-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the introduction of PCI device power control drivers that will be
able to trigger the port rescan when probing, we need to hold the rescan
mutex during the initial pci_host_probe() too or the two could get in
each other's way.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 1325fbae2f28..1802900328a0 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -3066,7 +3066,9 @@ int pci_host_probe(struct pci_host_bridge *bridge)
 	struct pci_bus *bus, *child;
 	int ret;
 
+	pci_lock_rescan_remove();
 	ret = pci_scan_root_bus_bridge(bridge);
+	pci_unlock_rescan_remove();
 	if (ret < 0) {
 		dev_err(bridge->dev.parent, "Scanning root bridge failed");
 		return ret;
-- 
2.40.1


