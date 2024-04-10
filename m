Return-Path: <linux-arm-msm+bounces-17040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B9989F2DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 14:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747021C244BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 12:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3728516E885;
	Wed, 10 Apr 2024 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xq/CEiR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C916D9CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753228; cv=none; b=ZJltmlG5EwLzcxx4Tdcp+bZMpfZd6P9eKAdHs9btjTzMsoBD7tYTMvfx9RYLGg+pbcH9mKBRVPLevdA7oD7UbpabKmEXRD0Gil79r2xiIA48lZ+FKDQnRtxL8Gt3kUExC7yVgDDQI9g9ruDRW/ZNWWWCa5xdXQb3yuSoEEEvKog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753228; c=relaxed/simple;
	bh=c5P5lscsnbWC5EHjzQG5JSjk93ahAtvYSeOqjGvj/7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HzyyTlnhfmuqm2NpOxTl8bhcsY4QtZLY6JrzFOffAdCcSXsvRSoi8ZkpFrG+ShUCZ8xltzeumlT4LcmL6GC2kVjYrzOCU4ib9XY0ofxT+mYTSQOmbFNNo1NKwrRFTQoxekObvkjlSuNn94OC+g00Z4DJ7S+Pwnt7Zm9Hx+VmkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xq/CEiR6; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so92409461fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712753224; x=1713358024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3Qk/DJ4ryR6XkF1VG+aVefQinCL6xUnkD758p4/AkE=;
        b=Xq/CEiR68bpZ9rkUUSkFsdEk3+B3xBEIzbiZacgnZnqD/1VttUWDPLWvrSdtxEGTov
         jQA1fGFx1yRoNKcc3oJjEaa4/VpOgPzLAO1ueWmjB9+fzm7Nw+RN8DHbrOZ9hesWhu91
         +xg2g5cnPvEkUsE9pSGPzBCwNTRacAUcvuBCBPbR4Rk3Pn3u43jbp1prJg8IshPwfnuf
         UpsLJZQRoa7sWPFHLBiLN/VXSVe+xK9Wf+KCUyzYr+yLU3L/b80XtJSScG/fUCVKogir
         VZWEDRtWc9O/ZC81doHtvFqERt0Vx14zmjx578DkXXmhcD76Al0WhiHl9SAxa1RIc4LP
         mppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753224; x=1713358024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3Qk/DJ4ryR6XkF1VG+aVefQinCL6xUnkD758p4/AkE=;
        b=ZTjnr+FX6+bS1rys/tDi1p8NizJgfAgA/fYrpvBWCUS6s9BoddbF+bFHLVseOU9IR4
         JfHhumB7phbsXRC9wPIdeFZc0JfnotD+8OPqAnJmOh371nJNUJuE0FPlqHA3BNo+BJXK
         7ICXMcJAUSfOoQrrQM8kUWUP1GlAvkfXQkYtchvAYvmHXAGiPYTcgNGCB23gByg23vTF
         OtK98rniNlc/G3vHyHXYw0K841eJSUlwDc9wNXyM22XybMu8n6Askxjbl1qE67RBBnQ1
         7bhty/zhzWGXLAbx3m2DoOQaAwR7gZhMvMb7unpK+frVLz4gCopmAla/Bl6j5JFQoKm5
         hpIw==
X-Forwarded-Encrypted: i=1; AJvYcCUE0woHbQ6l1v1QO4mUefEPS4kDsE1rD2kehL2UKeMygfcoXVqN2z0wSG1DlhARSRBb/xcCvupd/FlrU6miFjKzESqjJOuqWMe1nr9SbQ==
X-Gm-Message-State: AOJu0YwrhOPqWPW0iGf65oTSOETbj9773HlG5lVpkHLBDCngWTh0QoQC
	Kjtx/h8fGS/wRE+bB812i8WvHGKI5V7Ol9SzqKOIqpHtO+TwRFokoM6CCYYF2Vg=
X-Google-Smtp-Source: AGHT+IHz4nxeX4Kf6VHEirR5NLp0YeiXxNxBQwG9L0Vdn0xDzZmeanJ4D1dLir6knQRmR1TckfDACg==
X-Received: by 2002:a2e:9dd7:0:b0:2d4:a22e:d3b3 with SMTP id x23-20020a2e9dd7000000b002d4a22ed3b3mr1712240ljj.11.1712753223862;
        Wed, 10 Apr 2024 05:47:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:6908:7e99:35c9:d585])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041663450a4asm2150929wmn.45.2024.04.10.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:47:03 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Xilin Wu <wuxilin123@gmail.com>
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
Subject: [PATCH v7 09/16] PCI: hold the rescan mutex when scanning for the first time
Date: Wed, 10 Apr 2024 14:46:21 +0200
Message-Id: <20240410124628.171783-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410124628.171783-1-brgl@bgdev.pl>
References: <20240410124628.171783-1-brgl@bgdev.pl>
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


