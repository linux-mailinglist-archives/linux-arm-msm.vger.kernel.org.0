Return-Path: <linux-arm-msm+bounces-55645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81AA9C8B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2B61BC0E2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B7724BCEA;
	Fri, 25 Apr 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fgmQVASi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F6D24C07A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583195; cv=none; b=bbUCuqtrvjjzm6Jlz8mQuj45JMFhHH5fc8sEyCDHJ4cft9/8If77WmYW85pA2dzxk0JtrgDzuX3Wwoxy0exXkOs1l/ha2Hh+jZpeSANwVZ7vBHapD9alAcuxdMcOdJOOwKfqJU5BpQkpqwVl7EniW1N5RMRKmJuQaSvzYv1XyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583195; c=relaxed/simple;
	bh=66IJFF8tZyQ+XtDp+dxYFdjNhXj7sR1ftMG5k7qIick=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xmc1dznd6OuhQs47922GvqwhI+ZaFDMAPOLxaa4TJSrBir5Andj8ikaLklEMJZWhpC+dd2lZ2N+jdfcLKrF/hZYEnLcsUbYEYuVv2gzlUj0tvlkmoqE24x+w8VAoVbde8jlTzahlQTIJFz4c4UeAUC2HMIP2P2D8c8uE3LgGI6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fgmQVASi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso2361382f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583192; x=1746187992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TgKVC0Gmp7hs9p7yLYcMp+rPuHQS+f7+bOOeFXRsfs=;
        b=fgmQVASicR4SH+b8RGOqbjkNFZRAaYz/zeEdy9DaP3LYtnhZGwAFnD/MJXPPNbv7Hm
         STsLbV2i6kI8E1WRNJxHUqcK+wEgSXVm+KHNkhqRmsmnujUSmqfJpPA1Wp48uJAsxthj
         cZ3yrnJq9Kmiu4Nav3gjy7uvbblnHwug2swGjmkondzLwfE3/oePiy4gmpW9E+zQLlXD
         7bL5NDkuaMzhsDJD4/eL7Q+UQ3U49aHCTEdRP+ZEZP7iIKCa9kmDlLCAtLQ725BjQjRB
         LasD38JhNlk82q45NlJjVYAtZPvpdwmb73jtcijChUx1+9m97VlAHsDa2i6mvi8yhZtY
         eN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583192; x=1746187992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TgKVC0Gmp7hs9p7yLYcMp+rPuHQS+f7+bOOeFXRsfs=;
        b=fZ33aEoYxpYdQRfC4GPIFP/qPKgCr7TJnTKDzrvtGqxBWYaGSbWFePiDPDz3PoToN6
         seNItGKIR5bW8/Hc5/oLBmvuPoW1WbK46PXFiIFdpHAOXZromvNOdIC7vHXeRElGRsJ6
         kJ+BDCsF3FpNbyan1N+ovGwQOqSgt6w5OVsaK3YomU3N8gAjYYd/rTpoXPxCCOKafl9j
         TKc7yqfAgCIFECIkkKUIeLIruZ3M6THuX8jJAh6vpx1hAB6sOyOJeF2SHEohgERPpOmb
         NaMHwLoyPbbQ1PP1bjUc8PG8cGvCwwOt7u9iJ5VSLZJB9T68uIJrysR2nA+gD6DEtT2o
         eqUg==
X-Forwarded-Encrypted: i=1; AJvYcCVqfEM8lv8eQ4qmEUiTH1zxOVlJDpLnSkK4OMELStn1MmyWwtPOOpaxtqmAstFLDkB/OB02HpAuTIaXmC/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+n0m+5O79+e/Igidrw+7ZWkOiWhysyQaW7XPemiVjvkk/De0
	RUfhy0RkawOb24KXX0qqJ0/0brsn8BmsJNo7/vRXnYjILAC4DQsoT9NZ7cKscUc=
X-Gm-Gg: ASbGncutZGjNS8H4UnTfp2QhnHdidtZFszjxR9jJmkQMeR10gzuA+3xL8UYVxvBbTg6
	6shmceUY9hI6PCWFU0uGL/YAseY0UFWNkTP8LNsmbelMgXgVgYW+om7H/aZBtFH9Jes9KfEhq85
	4dhMzgCTKU4UHidGi4uQMoj6xVfD5h0NQrOY04GYVKHsNX3mUtaV0boPQO/KnfWtrvNeLo1hA/i
	JA6i5PmhShGxDT3DvbU5jMRGgofL9qiE9uAy/uL14qpEYnm1eWRtBjCuESiIt+OPR+oJEPSt/Tn
	vtt0XV3/ydDDNVQ1XClmq1+l4OsMlEq0ks40jOHr2vcOwdGhca5q2ZF8bzm5w6X8A5frW0tbhmO
	naa8Pm7Tit9F8PPYoJMexAPn/b1PGJubhcQVVjxg08g/wohv+ZQauXCK+
X-Google-Smtp-Source: AGHT+IE0cfvasr+2ToJg0EBKEjRJcaZvkAeSTDJGgH4fyh6HVWM2G+6IlyQw8XahahxPUHgOjOSGHg==
X-Received: by 2002:a05:6000:1849:b0:39b:330d:9719 with SMTP id ffacd0b85a97d-3a074e2ee14mr1430875f8f.17.1745583191703;
        Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:58 +0200
Subject: [PATCH 4/4] clk: qcom: gpucc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-4-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used, with the exception of
gpu_cx_gdsc which has an explicit value (qcom,clk-dis-wait-val = <8>).

Fixes: 013804a727a0 ("clk: qcom: Add GPU clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gpucc-sm6350.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index 35ed0500bc59319f9659aef81031b34d29fc06a4..ee89c42413f885f21f1470b1f7887d052e52a75e 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -413,6 +413,9 @@ static struct clk_branch gpu_cc_gx_vsense_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -423,6 +426,9 @@ static struct gdsc gpu_cx_gdsc = {
 static struct gdsc gpu_gx_gdsc = {
 	.gdscr = 0x100c,
 	.clamp_io_ctrl = 0x1508,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,

-- 
2.49.0


