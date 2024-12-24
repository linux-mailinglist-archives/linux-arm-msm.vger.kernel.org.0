Return-Path: <linux-arm-msm+bounces-43221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F199A9FBC08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65686188804D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870981BD9F5;
	Tue, 24 Dec 2024 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ktlePcFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B521B87F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035162; cv=none; b=BSnK5gn31MlvuMvuqsrZSiBmtInnKJ+NDoD8RAxHfV6U7dU+FJ7/DW73ZSeTVRTbAFWvIP/cV9WroLMBN3FEad0JdRn54HBdGk9v8CDoBNcpD+iR+V9iDI9f2bcW5xGN9hxxUi2FaT1ex2qx/g2LZgrvSRYF76Iu14RQsavQzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035162; c=relaxed/simple;
	bh=AcwQoycLm9utovHACbpm2AffXKTkfX3suXvNPJyE84c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChZ9Oq2CCie3BPP6S6nG0Zw2skTxTcjQgjY3FOWj9SQeCNV1toNmSrYXkcRluUVtcHrH0hawtSmMvXjHvPRaXLxGmawNKTvv2sYy2PExzlNagYwmw3Dj+xf9XEBAdcOevsKEppueAdca8xE9Ny/5PRGUYci4Y1vpdcNBVGpNAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ktlePcFt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b1caso54506281fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035159; x=1735639959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TR/QxOQXvLizWT86sa/2IoshodRcxisn/V718Oa/Cd8=;
        b=ktlePcFt/AxqkppC5BPjnXa04YBvK7Ce57ebCZ3kcWXBdKN23MjFkQ5DIDT3g4LEjb
         /RB5C19ZTuMm3LIrZhpxtop7AspVce+2mAm9WjDjCod06VRliF4mjsXfztKJTLFAFNu5
         ujQMxfAGXtxxw+c5FF2XmpdTh8g27bUx6qPpk7J325Kj5+utvamaJU16mpBhIeghmOAi
         4x88MIjK3qiX4Nw4IK7iJV/Z4laH7tyteZvQn6DyljWpyUFkZiroSE21uTksmUgUzjbC
         D0kX146As7XJn8vseizjDi8pnZlCUjgiJNijqaCxgtwFALk4yTW254aFWN79qXu3DFhm
         8nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035159; x=1735639959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TR/QxOQXvLizWT86sa/2IoshodRcxisn/V718Oa/Cd8=;
        b=DXn6inzeMisdnXU92imATAipCeOdJ/KeGHH7uoJJwSToz+X1CZrWSKotcKoRuhTLuZ
         rOjur+favecofBirh9d4QsKrEdaMk/eRG/ETkLrYi0GNM2tws+YldWPRKs0c+OCe2iNw
         DCN8+l5J0zHmYgStqny/WY9t9AZhDXUs+A2CW8g/535a79T73v1BloSboFQH8nWKB4wV
         ViapUcvxk6yyacK/qry0WqR1wvEh1vfo0ZlkObsKIgyoTGKTdfQa9sIcbn7TnhJvuYpQ
         xQDiO9UghWdFjuX+faSVSsPTQo+0AKFozIkNIKIat5LbM8Cvf8ty3Gb59w0Qp0ffjcnZ
         W/wg==
X-Forwarded-Encrypted: i=1; AJvYcCX3pY1XXtd82YRzY6ZNlV2jANxN5q9HWlOZKLjlPjQrrlBWbnmbmSeK8XocyLVCGO2lR96BajgL7WiBVNjm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj49wb9bk+j+8xL0gofYn4UoGj77DZhubVo9jaR15G/AGjqyfN
	II1bO1/xkgWWFAYWHQsosu56EnQ3LaFvi1j9arLlMMPgKiRR3i9G5+yf0+Us3BM=
X-Gm-Gg: ASbGncsqGlvftE4fKvxGPJFK/IdotW1QGo0DXasK76QjgrOT3dt2I34CN9RhITn5s+Z
	jGkfw5hCLWUrn3qdHMCbRlpRoToA2W4+CFxTWN+4DOOhg2O6+EeAXMDyBLosI79tprfAr4m4LtO
	m24zgJ5MPy/c8UxqfCNHj4X1OPhpyBx9VXBAnYPUPLDP9X+DDH2su2y0FEnirzdX5VESQAx6hOq
	6TUZJfWdHAOoqtLSV3lmZFK8Ab4gQSQzv3lK+IQENS7fjujUXhHrMUzVIL6q7iL
X-Google-Smtp-Source: AGHT+IFOfeFBK10sJlw4WmkI7SiGjao3GcU5smVbFwzxZ90JTpX/d0rEVksH5XM2BGFoRQ+HtpnzfQ==
X-Received: by 2002:a05:6512:3192:b0:540:1f7d:8bc4 with SMTP id 2adb3069b0e04-5422956ba37mr4720310e87.48.1735035158708;
        Tue, 24 Dec 2024 02:12:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832073sm1574233e87.260.2024.12.24.02.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:12:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:12:15 +0200
Subject: [PATCH 3/4] clk: qcom: rcg: add 1/1 pixel clock ratio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-apq8064-fix-mmcc-v1-3-c95d2e2bf143@linaro.org>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AcwQoycLm9utovHACbpm2AffXKTkfX3suXvNPJyE84c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaokMw7znaaeRfLp3dc2QiRSO6UNpEmNAkDgCm
 t7hIf/KEO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qJDAAKCRCLPIo+Aiko
 1bR3B/90PaxN1G8SEdn+3uQIdBsQPLCZHWmFrdUYRImseITgrw/LjNaNZx/ClQ2kvW+LY4GTU8P
 vIPrSM/9u5Z1eRVP0Pz4KrgGSQKyd/ZArG3ntuht5dSgu+y+bKDH/0FIkA1fckwPJkpXkY1kSIU
 W6hZUjd372r61FxDaXwKe2fqGUXcHlWQONZTS2kXpk060E6GmZL7CVOd1XS2qTuzT+jZ6mYg06g
 fH6A53lvic8fLdvtG8qaUs87QNT0WYn8PLZSRHMGbWbpZUYDxECndtYOd3jN5DaXHrLZzCWA9PG
 PcRYpM0YJtNXbB9betP0CEDZqPbRTotPNrBTHKu5spDCAZoi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

LVDS clocks require 1:1 ration support in the table used by
clk_rcg_pixel_ops. Add corresponding divider to the table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
index 88845baa7f84234b8554ef59cbfe2322870f1f69..987141c91fe0bc323d84529afbf6c96d247a55a3 100644
--- a/drivers/clk/qcom/clk-rcg.c
+++ b/drivers/clk/qcom/clk-rcg.c
@@ -597,6 +597,7 @@ struct frac_entry {
 };
 
 static const struct frac_entry pixel_table[] = {
+	{ 1, 1 },
 	{ 1, 2 },
 	{ 1, 3 },
 	{ 3, 16 },

-- 
2.39.5


