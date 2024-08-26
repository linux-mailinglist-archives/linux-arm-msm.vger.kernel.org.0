Return-Path: <linux-arm-msm+bounces-29476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A357C95EE12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86BF1C2201A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3BC1482E6;
	Mon, 26 Aug 2024 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XE+yZajr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A5146A73
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666858; cv=none; b=AVk9DqbLiNX+10rYZ+RZckIZswUfj5kkSYjhaSa3mdG2BXcbifQ8N0mKMjfQIsZh6YOvF/nZYkGyPmXwVda71a+w8ZHD3taZFG0xRa9W9xwa/QodoO/glvmim8e7TPXHqiLD+7h4Xt28EwxixmNpgDjPz66yQOnCPIxSk1p9VFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666858; c=relaxed/simple;
	bh=ConX1xoV1bzBjN+wlA70XCF5X6wLZIQ8hExvfXnxdUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cud4gy5aOjwIv4dDu6WJDhdGYIdSbQWHrDxhkIkZPuL/6LmXvOTGZ8qm5IsfwCAvpBotoB0ztAy16RXS9rK14nPWaqjI8DkpvW601/KRwk+BoVr1Csb/QMwvGS3+OVi/DNrCF0JVDC2pJxzdlTAGSrkkfHTXRZq/q2dcNRqEoDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XE+yZajr; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-371b8d402c9so176028f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666855; x=1725271655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCMHxzrRAUFzpSiPm8CMwi63rbNv1pA6fVNc4IEznk8=;
        b=XE+yZajrRFbVU1pvJfi2m7Ln33oFZLmSafj9TD7Fk/OACJaOmotfePpsL54sz5lTtJ
         esWq0zFPKbkwT1wAwOhq6okD8ey8XmSRmTHsUK/JORAmCyQZMXFvcCycSMIZ9HFgGxtY
         LvzAIk13kqfihMl1zKV/fXLSVnOjpAGwMVsuDgix30QxWwnVCr+e9vLkgzosOmVleObk
         2QdV1rWK2fb/jfRXzKqPQtfoLYi/6g4/8ruWQyMabQsJ1MduHk2yfoPDD0wd99N+CwYe
         s2//MitqcakdM6O0puUDTMFCNR+6E7JCpSc5ByxG45xGm26sZhxdbat6t5tMyb7IJ2FR
         koUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666855; x=1725271655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCMHxzrRAUFzpSiPm8CMwi63rbNv1pA6fVNc4IEznk8=;
        b=j6x19zhfip69U5FaEkdRl+NRhkZ1dgtodMpqMcZftGCb66YeBFRIerzhMWQF/UzrRH
         EhMBlS0rcmutIO46je17pplY3d5LJ4AWvEOWrp28ewjEI7XczT2IlYGZdD15s1CpgDo/
         9lnLGAB1KrZ5pOcJAC7G7beTzgx379b5upvJUgGOHzg+DT41zFC7wkxn9hzNtqhFxhbK
         OgfaAnVEFMCMJbEMNnpKUQYFq3xa4TVkTZnN4IqcSH8VSB/LGodlNMwbOIspPTSoQtLm
         F35mzogZwMsnLnATkFxcJiO5eQI2y81NsdY3VCqKEfNLoQC+AoxqE02hW3EG96QmtuSt
         RoEA==
X-Forwarded-Encrypted: i=1; AJvYcCWXaVIs8xbvDICapfNWVuIRmlHS1bLYE2ADuhFYNputAF6Mug6pJhVxtW3Rr1mTt4ManHbSPrl6ijh9PPeG@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMmeVsyT+criM2d5jA5J9sOUKuOdwB4wWtluxQFJgEL7W7Vc3
	lU4GauyyK7AqpJp7hd0vP6aCVs78vanD1PDiO5aAdH9ayngBZGOGJgix1rVDclg=
X-Google-Smtp-Source: AGHT+IGDbjrb2B74Avky6eGU3oCwj+LoFI4qsrsHH0Pjzz9kol++o/r/gWi6qLtWjpZvcSj6QuH++Q==
X-Received: by 2002:a05:6000:4024:b0:368:654:932b with SMTP id ffacd0b85a97d-37311869b4fmr3577298f8f.4.1724666855475;
        Mon, 26 Aug 2024 03:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:18 +0200
Subject: [PATCH 02/11] phy: broadcom: brcm-sata: Simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-2-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ConX1xoV1bzBjN+wlA70XCF5X6wLZIQ8hExvfXnxdUA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPaAeuDX82FFSM9E7GPDKBAAJHUMIGLxCR53
 Wk0I4/gdS6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT2gAKCRDBN2bmhouD
 1z/GD/4rnKh987w+rowE9WN5LMMk5lpIXrTDF1Oo6JkEirJ25CDRj2sQ92va/oAOeJhejh8xGla
 HlDBqPx+EXsaGhdf/ylIGJVhazNv0+uzaqTYc+gMkmRSFf+TWrYJY2bIeFYgOTcyhwizbUws4vm
 ASegTAtFMOWoeirXz+AehNgShieLrrYGKAm7JSGi+scXFZgQ/xn93v1TZ/M02QWkHcE//iGoroO
 fRm14dbzPmlc30IAvCpwkvr6G27AnlapPXqu2jK7cQzuNxsJ7IW/Wm7qP47DPGBnEdQdN2+FoWb
 ZlGBn8VA/dC1UqxtSxrkK93jlaDZgaFosf2E8qdjsUp5Tz0ylLt796ANXnnrIJchpjOcvgCo6BO
 pJlaTZLh3NSnh/MgaUkuiRV618lQAG+FLxOkqfOoCEkmPhg87S9ueikASenGqVYYhPafvWySuwk
 BS6/0kVFjq/UyGFUJuwtccMe1syDjg6utm3UzHgby8rU7IzwDg69lMPs06674gQ60SItOjDMEiz
 /z3dkObv88z1C6n8YUmcXrSsZhUDaFRS/7uX6rwCWB3CzyjyAcsUOmUcwRkbGzE9xfN1QUGVB69
 RdpwSzoIaQ5SqXhUuKz0q64uI6bSb0/Dc+nzAflvSdqqcLQ+zEHNdfLLE3KONoxjrMLCzZESSXx
 dDK+gMmEU2nLPxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index ed9e18791ec9..228100357054 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -751,11 +751,11 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 {
 	const char *rxaeq_mode;
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	const struct of_device_id *of_id;
 	struct brcm_sata_phy *priv;
 	struct phy_provider *provider;
-	int ret, count = 0;
+	int count = 0;
 
 	if (of_get_child_count(dn) == 0)
 		return -ENODEV;
@@ -782,26 +782,23 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 			return PTR_ERR(priv->ctrl_base);
 	}
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		unsigned int id;
 		struct brcm_sata_port *port;
 
 		if (of_property_read_u32(child, "reg", &id)) {
 			dev_err(dev, "missing reg property in node %pOFn\n",
 					child);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		if (id >= MAX_PORTS) {
 			dev_err(dev, "invalid reg: %u\n", id);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 		if (priv->phys[id].phy) {
 			dev_err(dev, "already registered port %u\n", id);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		port = &priv->phys[id];
@@ -822,8 +819,7 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 		port->ssc_en = of_property_read_bool(child, "brcm,enable-ssc");
 		if (IS_ERR(port->phy)) {
 			dev_err(dev, "failed to create PHY\n");
-			ret = PTR_ERR(port->phy);
-			goto put_child;
+			return PTR_ERR(port->phy);
 		}
 
 		phy_set_drvdata(port->phy, port);
@@ -839,9 +835,6 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 	dev_info(dev, "registered %d port(s)\n", count);
 
 	return 0;
-put_child:
-	of_node_put(child);
-	return ret;
 }
 
 static struct platform_driver brcm_sata_phy_driver = {

-- 
2.43.0


