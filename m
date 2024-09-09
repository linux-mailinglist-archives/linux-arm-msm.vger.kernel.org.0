Return-Path: <linux-arm-msm+bounces-31334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF54971BC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03171B24FD9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5251BCA0D;
	Mon,  9 Sep 2024 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HnsuNF9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31031BC9E2
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889917; cv=none; b=d62BJ4mkk85XUiLadAEvheRlC1UCGltESRHfZei6AekyDOPXJ2BJ1vPtPz/X/IERuO52DENHPfvBWvwHC6sUhRRN5WFy362v3SB+zVzMkxg5cCbc/pwJPqV+Rm7AUsDmFpyBxrBkWdgnnB/W37uL2Tcq9oZ5TsletuCTDsE/sUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889917; c=relaxed/simple;
	bh=zfZGJPZ+7n/u+R7h1aiFdsdkEzudbMyrWwt0mCMNVy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BW/PSg3vtm6v124woVRheF8iM69lLgXBLndtElRd5uw342IT+CLp9fnWqcYuYwX9F3YcbERwtkK6G9a0uHtKM3b5doh8YpjEq8IqmuBENzwMMw8L+UAJkt7sng36NXhjiU5XcR4RHRdbskbLHnWEttFwTvofGut3+dVGaMF3t1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnsuNF9u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb1866c00so2645695e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889914; x=1726494714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ca+bwI9Pu7F3YUoAaUsqSsRV8VpFvNoCThNciak41Q=;
        b=HnsuNF9uTiZz2KD36y4vGRhG/UVM2phfhdiPAuKuD65LaqZkhdxaZSA9R+8agSAhoJ
         EHSCt45YtgBi5Pc3N3qtjJkixOtVo6DdwQZp1qRL3iGXRg/XzR4PIgqaMXVojPSSnK8V
         OL8rz7NSaEvl8zlExlCwG5J04JHKFaF3QOhsi5nMp2l8QAB2Jc1Q+i7gdg3Pj0hj8TvS
         Z/1PWM0EwqXoThYVNfjDBMDfQhvAzymMoKZLS7PMeIN3XbL+SBkMXoygI/4PXiQwEu6H
         hBXO+V6MB5vqoHdP9em3KOO9wviRLN1SToi6Di2WMo1PNuAlDHG+41nipJ2PXmGXTJEE
         KTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889914; x=1726494714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ca+bwI9Pu7F3YUoAaUsqSsRV8VpFvNoCThNciak41Q=;
        b=YJ6h0Way49emY3KK9hUyC17XYODtEbY3Ip3ayyE2T7EnAJe74QlhebbxKs9QodV6lj
         1NfOLivWR0krjgTjaldyLm1LCG5f6I1tA3fa9eugtwvtWwpLvZVnja4DuH1m7P9syQE0
         i/+2dTc/iIBQV96hUk1Bpq1e1X785S20vMAokM3M6gRBVpVwMVs91k1b8cO+JqfDMZFo
         7v2dH4AwYkwJ3e0GuWT7C7rXBEcCnYkkDK52rDg7WQiB+L4zgQaNqIODLnccyBymZD2C
         9LpOJyjvU6cBqdaUTww/SXqBw0nO4bj2A2w/gBTo1qbENO5XmsZT05/S2jdsihELRg1f
         JnsA==
X-Forwarded-Encrypted: i=1; AJvYcCVSEJL5qjfziX5jjbkx0HEL2jFt8XlxoMbJ/XF2Ij7o3JuxONlxsEkr7ooI4jsPt41q1jzx6TWkYbx6W4aE@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYHp1HTrP0SstNy9dX2AR5z6eShej3egR5FzCdfNzN4qlVarA
	xQ7n01QwtREvVmPIMiuXBSzpfshKMs1r4XH05odQRVIEa04Wmn31/wLSiAhALQc=
X-Google-Smtp-Source: AGHT+IHwSOk/fpUD97Xcan+P+CIOyJe34rmyJqYvmDhNziRzvW/wcrZnoC+6JMIT/uTXpLghlRozEQ==
X-Received: by 2002:a05:6000:18a5:b0:378:955f:d242 with SMTP id ffacd0b85a97d-378955fd30emr2248356f8f.12.1725889913898;
        Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:22 +0200
Subject: [PATCH 11/17] regulator: mtk-dvfsrc: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-11-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zfZGJPZ+7n/u+R7h1aiFdsdkEzudbMyrWwt0mCMNVy8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1iyrWzON70Cq7VuXn8aYsCpNlvo+gCyF8zr
 /RcPqSw97WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YgAKCRDBN2bmhouD
 1yTND/9Kx2lZ3eCZZI46T755Vu5pa+AVNHwPIjhtgawTn9QLWZU4dx/nKarepxpIrJmJoAiNmef
 l9zUCIQ7tTRLh08J5eaODQJjDqqHS9iKGibJ1szkjME/jAk8tK2AuujylmN7rFF6OnjGZRy1hIX
 +MEkXzQnCsG3sWC79oLxmePYDAS9w79DyLnc+Y2VG416EUBy0sWemV843d/iP/ImkgfSQ8Z+rF0
 NqNl+VSGgnBY0WeVjDR5J/LugNaoWcKIOo9oL0JPMMyqLCIbAyXKnZNOKH1RgJohboAaKvvRWcj
 pvqFAWqbP+cDOVyuibuNXPW57C0G9xz0AdR5CEvDaxMCzVsog/Mp3P+IPNH0DsLfNaLxMcub5pO
 7uG43TuDc8R7IV6+0Kwgq6NsaOT+kBsDFBWodE0Kh2TzOv2uZ2COlbSO4fhWQ4xD+D4oOwxNtVa
 tkUbOckx0oRsGIXgLDv4DqJxJrzypzsLm12PnHbgKcTSps9z5zMpn193f6UCX6fJO9G6V5/GbFg
 sqWqNLxaDkdNgDua3Pl4lXKyL+90l4ssXiY9uwL788ThSvGGxE4eazeXMUmZ54lNbDvsDYJVzVj
 ozpmtPHcblf+kCN45ItBbo+Di94pYfYELDshUwux8NWiV61d+WNWYfAV21pMl+w6F26s8fo25Qh
 ymgij+ek/OQx8QQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Have in mind that to compile this code, you need pending (off-tree)
patches, which I applied.
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index 9bf4163221f1..f5662c569464 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -19,7 +19,7 @@ enum dvfsrc_regulator_id {
 };
 
 struct dvfsrc_regulator_pdata {
-	struct regulator_desc *descs;
+	const struct regulator_desc *descs;
 	u32 size;
 };
 
@@ -107,7 +107,7 @@ static const unsigned int mt6873_voltages[] = {
 	725000,
 };
 
-static struct regulator_desc mt6873_regulators[] = {
+static const struct regulator_desc mt6873_regulators[] = {
 	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt6873_voltages),
 	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt6873_voltages),
 };
@@ -122,7 +122,7 @@ static const unsigned int mt8183_voltages[] = {
 	800000,
 };
 
-static struct regulator_desc mt8183_regulators[] = {
+static const struct regulator_desc mt8183_regulators[] = {
 	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8183_voltages),
 };
 
@@ -138,7 +138,7 @@ static const unsigned int mt8195_voltages[] = {
 	750000,
 };
 
-static struct regulator_desc mt8195_regulators[] = {
+static const struct regulator_desc mt8195_regulators[] = {
 	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8195_voltages),
 	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt8195_voltages),
 };
@@ -159,7 +159,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (i = 0; i < pdata->size; i++) {
-		struct regulator_desc *vrdesc = &pdata->descs[i];
+		const struct regulator_desc *vrdesc = &pdata->descs[i];
 		struct regulator_dev *rdev;
 
 		rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);

-- 
2.43.0


