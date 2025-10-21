Return-Path: <linux-arm-msm+bounces-78233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAAEBF9460
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE5218A7E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E3A1EA7DD;
	Tue, 21 Oct 2025 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1mKFefM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F74242D69
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090321; cv=none; b=eYRygbEtpomfYqTUYN2cIDQlJNV1yjAg4fgrIhmni3Orog65/jyNpjCR92wc+hjWu4cQl9E5R/TZtvmO1sPUmb9PTTg7FkM//SJpUp7hsvUmyc5oUwFmJN40FNnpyfNlfyyeM4CTvlvKbga0mkWgIkHx63+/P2yrv9Ufa/VApK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090321; c=relaxed/simple;
	bh=3wFwd/IOKK/nT0u1+epSpc009hwiP3Bw8sQXcHJSm6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZ1ildW5FNhngzZCPrtHDjfdi+etqz/sT9LQaeNFXvOlJaEZHr8W3igck0hyj4As7F9UeeqnhmGAiXoJy2CEpuTlE4NO4VPm1xEzlrgGS1imOQSzuWUba/PpOUBClmZYhLOtPQvkZGhOq2WMnEFZAisfh/nJac/8QiLjSK3ob9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1mKFefM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58d8c50080cso521190e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090317; x=1761695117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hwUWlf6hwZMFmIwJ/dVYsY0EEoapFsLNMfxUgFYeLc=;
        b=D1mKFefMwODr28LrpU8ak0CCM/QM5Fq+yC7MU4gfw6Z2uNEpLaGmQQIvx5ZN/jHLhY
         ViY3+31R3G6eAyOOMSjXQGZRgMfqIyYHueZ5ynBCPIf7baJQFrHZUVI1WijGVvXKFQvS
         AhWWZWyRYF8tBBxU2ck23BPh5IX0Tf2RDasmA8M5o3oq9Gn08y1Cns7xTDiex7cWa3xA
         4pJKF5bMFAsuBHjhDvUBOPhEPA1oip3BY2C3oExzHiAwRxkW1wGpItM+6jF3nDgLChXV
         dJy4Vjvx9ZRn6qYcVaSTGn+P9uF14Oo2qe1Nv7lHWB93BHFvG3Mge6u+QC++RlWc522j
         hodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090317; x=1761695117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hwUWlf6hwZMFmIwJ/dVYsY0EEoapFsLNMfxUgFYeLc=;
        b=eHppgj90VlfoBwFHUOL0P8EIkWc4ag5+GsKCXZ0gAL0GPKSTvfkCoYRY1F7kLU6ERZ
         G4vfhMhCZuVvCntZ8cqq+qiu+NRLR51SBEze+6tM7u2RUAcZyWcydOjqO6ve3pPcmsUj
         +6YHgRTQnNxDIDjSAZvigqLqsEa/J6AI9ej3+zbmoLXFicU7+/hWKQefe2E2grj9IpJC
         3FbZ7oAbgIGh8rU3bi3Z44elktGdotsTDowgj1N9wQ6m0WifGYwM82CYv1lO2G5hEL2j
         xyxiIcdqQ+gctDp46zBh9TSVI6tL9IIKNia44lHiE3aPix/jtNLQhoPP0ViC9ueSnTHu
         njLw==
X-Forwarded-Encrypted: i=1; AJvYcCVbV0UcJGBN7KORtLt26ihLMEXilK/GJN6hO0M6eTAwaq/S8sE+VTvgwwdRO+9FXwMcYgjvAtuWvp/cMMn3@vger.kernel.org
X-Gm-Message-State: AOJu0YwUL48cJS0U7+uZauHm08350jkovFSoXRGgBuj4eL/EK0Q56MqA
	LGRwP26Dfz1NFMhfztF6fOMBrDWOHHYItXpOMvSpNy6oZRXqmBkfVd5Ki95dd+kf240=
X-Gm-Gg: ASbGnctqKz1yUULfxJsPMbfV6usKQC5YCzAVxC4A4HvZ2auxEOy78V5DYP/sm/2zgd1
	oL0WOIPNd9+oShgtsw0gm8weERjkFTzraJJ6H6lcLskuGp+ymb7wN/yHpi9d2ZHCV5D7elUucS8
	igNHUeU6TBFk9znuKOTqdL+aBgC0pyAzfhs6BqeV3DxFa0Z6mzBZv4eflS5o8rPfEOZ47nrRbYf
	JP2i94FErPdSRW/6EJ2T6KdhYYnKnG+5EHWKneOB0+Xc0JELWP0bmCZxW17VJYCQAF6q7w5GQj8
	dv4EZzcw9EktEjf87g2C+IuMfg0ubXcVrV8ZpFYJsuwlHl75dvhkNc+tUVnKUN7VZ+b1foDerMg
	0xsEG3kG68TYux85vmgyz0lHK0f4mD1I5rCWzjlQHv/9MDAZCZbMCdFqmQJr3VnrSa5jmEPnMKe
	7WQhe5VqjIyUOGc4uMvDuxOq43ERJuCCkNZXPm7khlOfxNGawXz4BuOg==
X-Google-Smtp-Source: AGHT+IF70NzTSV/m/vOE0VXr5Z0HxBjw5fMsz8qZC5vlDITGKte/9FFvTIZQ9irU3Pd4JmgKuKr9pQ==
X-Received: by 2002:a05:6512:a90:b0:57a:d649:9702 with SMTP id 2adb3069b0e04-591ea2eef89mr953503e87.1.1761090316911;
        Tue, 21 Oct 2025 16:45:16 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
Date: Wed, 22 Oct 2025 02:44:46 +0300
Message-ID: <20251021234450.2271279-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
all other GDSC power domains provided by the SM6350 camera clock controller
to enforce a correct sequence of enabling and disabling power domains by
the consumers, this fixes the CAMCC as a supplier of power domains to CAMSS
IP and its driver.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 8aac97d29ce3..6c272f7b0721 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1693,6 +1693,8 @@ static struct clk_branch camcc_sys_tmr_clk = {
 	},
 };
 
+static struct gdsc titan_top_gdsc;
+
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
 	.en_rest_wait_val = 0x2,
@@ -1702,6 +1704,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1714,6 +1717,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 	.flags = VOTABLE,
 };
 
@@ -1726,6 +1730,7 @@ static struct gdsc ife_0_gdsc = {
 		.name = "ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_1_gdsc = {
@@ -1737,6 +1742,7 @@ static struct gdsc ife_1_gdsc = {
 		.name = "ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc ife_2_gdsc = {
@@ -1748,6 +1754,7 @@ static struct gdsc ife_2_gdsc = {
 		.name = "ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &titan_top_gdsc.pd,
 };
 
 static struct gdsc titan_top_gdsc = {
-- 
2.49.0


