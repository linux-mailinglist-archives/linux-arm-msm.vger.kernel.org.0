Return-Path: <linux-arm-msm+bounces-10167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC584DEB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 11:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EC5B1C23068
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 10:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4066F537;
	Thu,  8 Feb 2024 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WnZep+P1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17871B38
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389473; cv=none; b=BH19RqRLNDptQXzfeEPQvP+t904OyG9iHMN807dqDve1AkMw0BD5NLbKXo0MdbgWMrxBokF4Ze8e+y1vQbqOKmQDoIqF++Z/pa36qU2pv/t9WSnd4dCNYVXcqVYCGw0lnYQ7f/pN3GAXRuQ32O7Yj6Hwuphl10pj45MW8qJCDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389473; c=relaxed/simple;
	bh=xJfnEJ+zVsCbj3Czpg60LPhMDPo5+HXP6lXubKlhf+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GtV0OfFgVBDDad1ppVXuxJL00VvZBnoJZTZgJwHLYFWD8ovGwkGnamvzrvVCqU9Qcup6UhSWvgwx5FoL53BRgCunPdQBK36dqQHzVO2ytKdGIdtzEsc39YLMx22Csl2y1n1sZhOaDa7jMXUvD/sOnkfjIMkQLdLeGS46vme/gMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WnZep+P1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fe3141e1cso15616795e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 02:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389469; x=1707994269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkWzwIjo/uZaIYjgKgDNcnhcc1cwlKLdvZXvoZJLBm8=;
        b=WnZep+P1F4+Nsn24SCC7jw8PnKUaajsse5HmxzZGZUM6Ye058QFnSXydVHVWcUkFax
         oZhe5S/sPfWSN6QKYmUtDnBQIZJnEs4Z4f5kWGxSWSYvyfFyqCx/sF6w4NL4AsObpgJ+
         wMvRChH86mLXAsEQkayxx8GYVc7DXOiad3/aDRH06NA/S6BAB7GIdCv2ZF6046n+d2CP
         XeGzLpH434DX3b6Gq6/NnY38f69jBjBCsL9ndwZUhPlYZNaTOTtwdpE5S1GORK1BgHZr
         eQwT3O9zc9xG4FncJbSRIn3D/UiEGo0zwPq/pqN+sFd3L1a0VnS0dXHbmEs4oZxwfQgn
         l79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389469; x=1707994269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkWzwIjo/uZaIYjgKgDNcnhcc1cwlKLdvZXvoZJLBm8=;
        b=h+oHE7RHDy9Q1JSq+SHwUNU74jM/7jBlBCbSYrlsLIR0wKxqQDgXl/I07pGrNk1uRM
         /P7NGbOt/c7Rxh7p14WIYJVv10PegBh+ufYVktOxVXh4YsohmajbyEtmFufxpDUA8kfk
         LHKFdID8S6APjWX0kXDhDfSoaQV20Job9z0I7ye+uR+8N+OoKn5HRvbt2eCrIWo/sb1s
         fKlDpQbOvvM7ggBY0lbe9a/1r2CSAd7k+hkxbM3u0KArVnLdLcblDBKQ8/o76R6IMEVt
         acP4NB+CKpXpObR2xdgLa0lIMK3fhbVxYOofh4CdjsMe0nhWwF8KNWYtR5508J/qfbRR
         /Gcw==
X-Forwarded-Encrypted: i=1; AJvYcCXaQDPrRee+9nEz0C+8yUUC9d/cmqGP9FUGGBp11uO4/vo4EXELYZgd3i+h9ZXpRJaGrlpKUL+cz4wpkw81+3dyXL3lrECIvMNXeDZhkw==
X-Gm-Message-State: AOJu0Ywk9OeXQ2v0Hhb0Sn8aPYbUWLICYHAT1rGzjpWaDViNzLPPy1wx
	H0ID9vhnYhrwicjE40sxBSgib1Wf4n7K50bXZr4bpoLaxS6bGKxpmTNT1dTkwR4z9bm9k+t1boY
	L
X-Google-Smtp-Source: AGHT+IEDQm5VMj88QgMa7T2443WaR0z1L0cupYZAj6nJd5Y/yuIH6Y5K3aV/K/rbrptqrKJPbyMfpw==
X-Received: by 2002:adf:a3d0:0:b0:33b:2100:3a44 with SMTP id m16-20020adfa3d0000000b0033b21003a44mr5785649wrb.39.1707389469321;
        Thu, 08 Feb 2024 02:51:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXdJz84ovdU6pVqpNw60wd7HVwL15lYcM+n6oKgtk++P2/cWs0wiEm4kCDeoSC295ABHv6ze6F0PqI/Vog2Kl9f5nws8pWwqCTIDOdU3oqLsabsMlEJt3WF7y93IGweLBiR6AAK3/44S/b9d9jJwhVUl0Gwp1olFjo978YBfnrMyvovgy4r9By/4HqInf/JKChViz9WnRTL4m5SbOAmlSP1O+CicgzP78T8B9TiCk/JRJ8
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d69c1000000b0033b4719eb6esm3308283wrw.27.2024.02.08.02.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:51:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] interconnect: qcom: x1e80100: constify pointer to qcom_icc_bcm
Date: Thu,  8 Feb 2024 11:50:56 +0100
Message-Id: <20240208105056.128448-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
References: <20240208105056.128448-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pointers to struct qcom_icc_bcm are const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/interconnect/qcom/x1e80100.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/qcom/x1e80100.c b/drivers/interconnect/qcom/x1e80100.c
index 281295a9a077..99824675ee3f 100644
--- a/drivers/interconnect/qcom/x1e80100.c
+++ b/drivers/interconnect/qcom/x1e80100.c
@@ -1542,7 +1542,7 @@ static struct qcom_icc_bcm bcm_sn4 = {
 	.nodes = { &qnm_usb_anoc },
 };
 
-static struct qcom_icc_bcm *aggre1_noc_bcms[] = {
+static struct qcom_icc_bcm * const aggre1_noc_bcms[] = {
 };
 
 static struct qcom_icc_node * const aggre1_noc_nodes[] = {
@@ -1730,7 +1730,7 @@ static const struct qcom_icc_desc x1e80100_gem_noc = {
 	.num_bcms = ARRAY_SIZE(gem_noc_bcms),
 };
 
-static struct qcom_icc_bcm *lpass_ag_noc_bcms[] = {
+static struct qcom_icc_bcm * const lpass_ag_noc_bcms[] = {
 };
 
 static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
@@ -1871,7 +1871,7 @@ static const struct qcom_icc_desc x1e80100_pcie_north_anoc = {
 	.num_bcms = ARRAY_SIZE(pcie_north_anoc_bcms),
 };
 
-static struct qcom_icc_bcm *pcie_south_anoc_bcms[] = {
+static struct qcom_icc_bcm * const pcie_south_anoc_bcms[] = {
 };
 
 static struct qcom_icc_node * const pcie_south_anoc_nodes[] = {
@@ -1890,7 +1890,7 @@ static const struct qcom_icc_desc x1e80100_pcie_south_anoc = {
 	.num_bcms = ARRAY_SIZE(pcie_south_anoc_bcms),
 };
 
-static struct qcom_icc_bcm *system_noc_bcms[] = {
+static struct qcom_icc_bcm * const system_noc_bcms[] = {
 	&bcm_sn0,
 	&bcm_sn2,
 	&bcm_sn3,
@@ -1928,7 +1928,7 @@ static const struct qcom_icc_desc x1e80100_usb_center_anoc = {
 	.num_bcms = ARRAY_SIZE(usb_center_anoc_bcms),
 };
 
-static struct qcom_icc_bcm *usb_north_anoc_bcms[] = {
+static struct qcom_icc_bcm * const usb_north_anoc_bcms[] = {
 };
 
 static struct qcom_icc_node * const usb_north_anoc_nodes[] = {
@@ -1944,7 +1944,7 @@ static const struct qcom_icc_desc x1e80100_usb_north_anoc = {
 	.num_bcms = ARRAY_SIZE(usb_north_anoc_bcms),
 };
 
-static struct qcom_icc_bcm *usb_south_anoc_bcms[] = {
+static struct qcom_icc_bcm * const usb_south_anoc_bcms[] = {
 };
 
 static struct qcom_icc_node * const usb_south_anoc_nodes[] = {
-- 
2.34.1


