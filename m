Return-Path: <linux-arm-msm+bounces-52902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2020A77081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D773AA348
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794A82206B3;
	Mon, 31 Mar 2025 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ5zHHyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE63721D585;
	Mon, 31 Mar 2025 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458253; cv=none; b=hkN4Lc8Ujff2UpXTJqoFe/XxasMkAst++GQDFfVDtjZ/Y3UqbXsIvjblGJw/StxQL1xApxImwyUolrRSRpAA3/J4XflHm9r5rfUaSCB89g71e5n8VEDAwo12OxJz+Gnvqhl21UTfftCsSsnKSIMqReFUFB48cIV9zIdQtdL5ios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458253; c=relaxed/simple;
	bh=0SC49GluQt35dc/B1IxMxRyJDWYyha+qoNq31/69WlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBiGBVpKlw5lwL73Cv8sKNBaxhjiA6Oz9s5bh337EPf/KcI9IqwSswfw9PbImNLYPdiGaZNrioZo6/aB8L6sZttU6ejsEuJssf8M8EiALu13T/POVRNQHE+WihBKGonKKyk+0I4Qgz2wdgR29yikF6sF8Zs69HKp9hNZCpKqdB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ5zHHyp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f2f391864so2935764f8f.3;
        Mon, 31 Mar 2025 14:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458250; x=1744063050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iiwuMgMZPSI1bROGcFSqXkGbRUsP8lA/8b4W/QYksI=;
        b=XZ5zHHypyVLRdNYhxDC6IULSpgbIXf6MLooXeqMi/Pcm3VocvzD64LFtuu5AIKjnZv
         VSnWdMv6ule1SJS7LcrDp9qNUag4RSxK4xX4M47FZG8AEL7x/yGsZeRDShzBg3ebxO8X
         PBn0ozrOd4cLgeZC3tpMps6p4IWmGjrLMQjZ6Hnnk/f07qQ2119oAMys3BsRiPyeXMLR
         aTNghqtnivvC75pHSac5JqxkMuT3D7cc1ploNH3yNOEDMEI3P4IJFlzMtVBMod6mayyv
         l1c3jxQ13ACMJX0BgwiWAk55Ot/H7/fonFFiwE0jWGiwAOAAUBMQEduDjf7SN0criSne
         wWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458250; x=1744063050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iiwuMgMZPSI1bROGcFSqXkGbRUsP8lA/8b4W/QYksI=;
        b=SjeGK+TA+AWVEkNqFDKOvN6inTiJ8iHlCKwktDKLu9gbBQw7mmSwzyCJG+hDvOcQ/x
         w3pcFI/X7K7/2uvO5KLJXBBwI4XoEMaI9foNxSO2eBxTYvk8zTedyRAzYAhW0QeB434P
         Zrs8Thw/S1q2TvftfEiOaR+rB5Ho8LQCiz337IKNhWRk7/ZZE04L4R0bdLQQXqI2I/qf
         bCYi0+x07jI89M1cC8XCZCGqSBDtx5nhLX3HCb4+YlYrLBtkkxn2TwjPg19w8KoAZwDV
         yepGibncwoUjbZk80wgkJkt8y7XkYiIE1xL8QQX9o00eStNAZ5dLNX/Jd3NanAb3trg0
         6TYA==
X-Forwarded-Encrypted: i=1; AJvYcCUZzgR6u8YXSqqCUtWUni7tJbwdqo1ERLfbNVYTXwZauelvHDI0LNq0ehB46JTdfQRHATEr0cqyi7r0zDtv@vger.kernel.org, AJvYcCUzHkHheaguaXdmQ9/52E0ZJ9kqy7IHeouxY3Z6r0/R08oNfLyIspjIepJShznVjK3F3cLyFtNHhVqe@vger.kernel.org, AJvYcCVfCNEg/xQpf1Kz1x3hbtflwB6s+2PF/jwkRa3OD2GXuWwzE6vWYvcF0sVG8KT6wW2Nzdm7pnlXZvdsp0qa1A==@vger.kernel.org, AJvYcCWrTK1LdccFERnDf5End2EolHPH6ZwJuV07+0wRnlLlq4aR/yp0nETn2hTbpB9+EXD1IJA7l8+HM8yb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz9EOZCb2wvVF5xqar0uHhNObrRsQDahQGI3RKnuP/WtPdDC7m
	vfuGMQAvUd3TBKV2BjFDCI6gpxAUazImAvPLr3Dn3CFrfnKeO50=
X-Gm-Gg: ASbGncu+uakBXZxZHCleYVTgAFlAtD8xGX4Xag1zv1z1oS9IAHeKB33R17ePvtrtlnI
	OeO5u9xN2nLmwUdtnn/3khQBUSliR7LHXVHJZJy0TzlUgknFj2BcNbHCRfr9ZERC+2VjU80Iixz
	NK6a4MNMAcOKYAvWnSkM20eQLfQt/Dpmnnsdf5ZpobEDckZrv+sJA0bsYXVtRybKtny+RaO1Fyf
	mfABbOYIbl1rp9Tv7e0PMdUmI+IBSa9bmm5d4jAv6all8ohO8jtnWUNfVQT/3VNQTBuyO43VcWA
	vyj9dyeYRcOPP9fo2FPrCv2GDtGYvEmbkWh3sC3doA+69nRcbU8DnDl66Q==
X-Google-Smtp-Source: AGHT+IHhZVGcuyhPZ6+Sw6ztkVfq/m2RXTMk6JPKGylv9ScKUAajJJRwfDM5lLgECJ4Cs6ydsBH0eg==
X-Received: by 2002:a05:6000:2701:b0:39c:2264:43ea with SMTP id ffacd0b85a97d-39c2264456bmr944053f8f.3.1743458249824;
        Mon, 31 Mar 2025 14:57:29 -0700 (PDT)
Received: from alex-x1.. ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm182244665e9.0.2025.03.31.14.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:57:29 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 5/6] firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
Date: Mon, 31 Mar 2025 23:53:39 +0200
Message-ID: <20250331215720.19692-6-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331215720.19692-1-alex.vinarskis@gmail.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow particular machine accessing eg. efivars.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..0d2467c04248 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1986,6 +1986,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,x1e80100-zenbook-a14" },
+	{ .compatible = "asus,x1p42100-zenbook-a14" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.45.2


