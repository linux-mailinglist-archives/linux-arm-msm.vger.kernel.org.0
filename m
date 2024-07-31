Return-Path: <linux-arm-msm+bounces-27457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C53DE9424E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 05:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 779852860CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 03:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D161B59A;
	Wed, 31 Jul 2024 03:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmIWrs8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1818E29;
	Wed, 31 Jul 2024 03:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396019; cv=none; b=NxFG2gZntuaQmoOD/LU1nwtbS5iZPigOltglsc4ILMgtOmX3k8ZlAljMBVx3bG34dDOFSKNpp1abWd1FH14tdSDt6TLXV6W4C0cqLgmTHu7EyCgzaudKOospK8JdCpIEy5BM6LyyeK/0d3hcsqyd4zfMgg0nnqFTCeegL5rumog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396019; c=relaxed/simple;
	bh=qtshCqBV6iqWMIoHAHzizEr08ZbYwq4TZ32SUgKiV1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUluvxRyL1Qj7+hY5Xbp10VqxdWi+gyS9Mi1ajsTvqrvT/8hv3BOXDeWWt/IUNVGJknQWZQm6L6Ew36EM/F0gmC1iYjwk8/+1gsyLoy5br2IrjEZDUvMakIlILpp5KNY2SsQn5vRJb0CsiOkrf8aJ2rIRuS9l6gopeLqx+C+NxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmIWrs8V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D1FC4AF50;
	Wed, 31 Jul 2024 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722396019;
	bh=qtshCqBV6iqWMIoHAHzizEr08ZbYwq4TZ32SUgKiV1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lmIWrs8VrzGO2uwZ1WOGKIMa5laMI8DDxkGHMP/p9x6CestqFvRqKUVqbegYD19zd
	 3jQZ4pDLopuO4dzVAQWR9HwwoLiKMZuAO8I1plAn//czT5jmcCa3JyVCi8EeBKnmHl
	 CGRRrCa/cBjdymLYTs0EdiCCZUhEQEBOMP2a0hfc+d/m+WMLhTzm4R7jy7DTMJDlGz
	 lDZw/QMNAUklOpD6d1lOOSgiM8RsIWESSk+U480Crpp1HtJMB0p4++O8lqtfHGaLb9
	 QsectNxKb0BkaY40J8G+Luz+YkM6IXRQh0pdGA/RJIJkkZmxVrZJQOoLcMUrgLdOEm
	 4ozZ4NuRKmhkA==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 30 Jul 2024 20:24:39 -0700
Subject: [PATCH v2 2/7] clk: qcom: gcc-sc8180x: Add missing USB MP resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240730-sc8180x-usb-mp-v2-2-a7dc4265b553@quicinc.com>
References: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
In-Reply-To: <20240730-sc8180x-usb-mp-v2-0-a7dc4265b553@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=R0uqQiTUzPwBNoqywsCEdClfAGVIswyFvt1nKvbTKWY=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmqa6HXhKPORtMxL7arWGuz5Nc1+kfuav0xmCkS
 jHsKSdhxJ2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZqmuhxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWcNhAAhB7QTbKieA6EEiL/OfvfWqjceh3DmBxUPG7jSK8
 SlgXVOCj+NlBllKAbyrsaU7utkVx3oC/C1J23gKhP9ajH8/LMMX+bRhGiyHRSTwEvYtYmlPQ3QU
 NFQVIgaPJPgzmPHZCxlxwTfTGsfmS1bxixVib5JCVcMhm2Ib5jOIXvgRR69Z2zsXeYmCaLnWhHY
 zMvRypXD0ZIiX897ntD/0aT9rKx8hhNCwLLx+WFX6cVQcIrh15A+HzALiEqASCevNvSMfvWmTuo
 AOpWjZ+NHNIUTudWMPEfFPW2ZTOKXUeqh8Ye6C904yW4tImmA+N5BPnx7L7XpIwswn7vfI6DnM3
 sHiyKmSryV4GUuznW+GVTABwP9wSb3+Mxyk8ULXLH8rJ8GkZutsrUmK69J4jufscYKPoNRZuONp
 pwon6Ag/z5KR61bOXDjqsAOAgEX/GbPxSrKVPRAkh//IeXJVN0xnWyXufUYn4TH1bsCN2tKDRma
 3dkotR8qJZjQzlO5hMN+d5KJ6STFx0Jg3icf2w9VM9H4Sv4Xrv5HeLv1/z0duqTa2HNQgueBxSs
 UbdfUOYfJ/VTwAgP0NvXXqI082h9cRRhxzCf47Uv+6LiCXmgQyoHE6fsinWJblt3vTEPMdbmX8Q
 516y0CXIIV+vRVh2JvWfPowZqLYMdEP3R8+mMVJolMIU=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The USB multiport controller needs a few additional resets, add these to
the driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/clk/qcom/gcc-sc8180x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index ad135bfa4c76..113f9513b2df 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4546,6 +4546,10 @@ static const struct qcom_reset_map gcc_sc8180x_resets[] = {
 	[GCC_USB3_PHY_SEC_BCR] = { 0x50018 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x5001c },
 	[GCC_USB3_DP_PHY_SEC_BCR] = { 0x50020 },
+	[GCC_USB3_UNIPHY_MP0_BCR] = { 0x50024 },
+	[GCC_USB3_UNIPHY_MP1_BCR] = { 0x50028 },
+	[GCC_USB3UNIPHY_PHY_MP0_BCR] = { 0x5002c },
+	[GCC_USB3UNIPHY_PHY_MP1_BCR] = { 0x50030 },
 	[GCC_SDCC2_BCR] = { 0x14000 },
 	[GCC_SDCC4_BCR] = { 0x16000 },
 	[GCC_TSIF_BCR] = { 0x36000 },

-- 
2.45.2


