Return-Path: <linux-arm-msm+bounces-34783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F9B9A2A77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74B02B312D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E5B1F9ABA;
	Thu, 17 Oct 2024 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUBCmXjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BD1F9ED4
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184247; cv=none; b=H5PE6nAb+bjKznxpQOUeJBgFaw9gSLN8v3FGyiEs7uyKOBS6zmVUpp8lt11J9WI4GxSMDannQ8Te45g2vVPo2H2tBwFkUmj4MHSRRDj3R1nKbEB+sOr60I+QGo1nWXr7aHtCkmRTAJ2CAiAzsw/xKqPFfAwe1QYVDFAquq6IMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184247; c=relaxed/simple;
	bh=EdNREFasnhi/0z5YuvNIRWlhf/Ulc9mbRwCCq+WE33A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=euE6tjtaJw+bU1xjGAYA7Jt9QWAaPUnhdBN6sgp3aOAIqKlQSg3ye7t2lxqqJUJrVFIhhYco8DVTkdPfNiXG1SDD32XTIMwcqyf4wdOxX7hqq38TzD91o0k2I+KhZYurp74kJxA9GXQRQATtatiZxc0Q6iz6MDn0yxr7nn6cllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUBCmXjz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539ee1acb86so1568617e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184242; x=1729789042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyTwLX47NvR2DoHadegstK9MfFEhglfs/C29E2xxV9Q=;
        b=FUBCmXjzJxqTtRxG1AdSER9Ou/E1oinTE3SA9+0Ai6W0m8ufgZpor9QSg9mfrBhrG/
         1ifbPRZwDhVIoWB6o+Mc4J4E30GwxFalhoPJmg3U+OrERe5bvQExGc5QFFaxuaDBN7Cn
         1Z518/InELZyeI2NNjTEmMk2qIj8v2jKNzYO2RuMx9rJPpEYpwa1JUj7aVGrj2CLyFzQ
         wAwNAWuKHqoHFlbw73dJtlA4KX0ewz+5vyg9QESop5C/ug773FAHfr61byMuJfQMUHU9
         uVl7o9xNRndv9SqwW/5lMTKnzkAzHGVrooBNqGTRFHagG9vPhLWyrrdV6sGgOtJAJmu7
         6zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184242; x=1729789042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyTwLX47NvR2DoHadegstK9MfFEhglfs/C29E2xxV9Q=;
        b=QriTki3o0a/raWizQHokMoQYR26gbwYr/GpwHgza66YqGCUwXrNB2nObtBriPAdUs3
         lkBPiPxTHOXArd3MoB/s7yjnSpmqMnGe+jenO62Ey4YfHOc3s6pq/+dF6CH+6jIF2o6d
         kgp6Ap7E55J9w0c1YoVMJOfCLwkdUb2ci/V0tAnZahdgZtT9yuz7y+HfXhZlVPqGq2Zn
         XqH69mN12ouYw8iqoTndSxJsoXvtpSVLETc7UApIAGZYgtz4P0eQ3mM0IW47aKxPxroq
         8XSY0I8p9HnRjjwVpepty0tf5OzURe5Vj39/PSTrnMa6YDbD+P7m6e3aJf7TJr4FbwBL
         8WoQ==
X-Gm-Message-State: AOJu0YwK0RhXqZYhB7NBYKw7Opq4OHCVbLo3bDar0AAdCCQVQYoMQYlg
	31Q8iqWciw9nriklRHJpuqIio7aRIXZP4Ml8zMolnhDyjjJ1ry35u26DuXl3+fjEw2orEo2O8x1
	Ns/I=
X-Google-Smtp-Source: AGHT+IEVUeMOrGOq7P6hlvA4u42gq+ltGW/B18NE4kAFy3842m2eSLTfGiH//hPCwdrk1HAbC3h+gw==
X-Received: by 2002:ac2:4e07:0:b0:52c:daa4:2f5c with SMTP id 2adb3069b0e04-539e5732108mr8695855e87.42.1729184241787;
        Thu, 17 Oct 2024 09:57:21 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:59 +0300
Subject: [PATCH 09/14] clk: qcom: gdsc: add separate sleep state collapse
 vote support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-9-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EdNREFasnhi/0z5YuvNIRWlhf/Ulc9mbRwCCq+WE33A=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHcssy+HzuHvxrgGsQlzO0a4jAapsuBMbcfy
 qxdwiRLoiiJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB3AAKCRAU23LtvoBl
 uPNWD/45LCqutMaIpCXP6iCilrcMr4YLUicbVW+r1grPmm+F6l5wTphRnjfaTWDuFqK/17dT9xv
 /RK23QQZ0ZXxzzU83EXTfsTi3KOce25CtR5da9xmjKgf87i5Hw3kyeNar9xtpC2Qv03vJKnHFbW
 F8LM1mKsfP/5MNnMe6qQ+/d9b5KZEfb4WlFVO4+Aw2TC46ahtuK+0e7fs5GFhVntI5lXWhD8AEB
 5Vo9qgzYtrXT3Ttgyet/K8/KeP9kE5WjUfdnJQJTTa0nV8ByyfU4zr0/jNHHZzxvbwDK3mvgiJY
 9ccIgZ2iK0B9MeVVmHdJ3Ha+elkAPeadBdPAgEM3vwMerDY8baJaNgwtDYIYhnHVPhWFvJnIns6
 5M4A39azJ5occ5ksNglSE6Hss6zq24BkvWXOBaQSSWtrLv60k04vRPY2fR3hKviY3T6adrlMYJ3
 TQsighv7TKSL0+e0Gh8ENLg5pl6LQpX4ryix2pSeCFj0pT/3K9IDtA6wsEeCeJU+DGXT/qVpFqn
 a7ZoHCJlVnQEAQbwK/zw7xxzK7Qqt1N4Asup9Nmi4pBk2F8jZkR1YN9aimNPpjL6veuzywegkM6
 5gGPs43xUYlPgX2f/OLtqQ3YZVUYH+9/7+6m+Dy2d0dy1qq+Na/93jCzB/fg0ETE0QReoycaHSA
 kSVbDKoMJKI+7hg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Some platforms use separate collapse vote registers for the active and
sleep states. Extend gdsc_update_collapse_bit() to support separate
collapse_sleep_ctrl register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 8 ++++++++
 drivers/clk/qcom/gdsc.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..95f8e90a8d25673c8a97a03f92cbdad25c3259db 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -133,6 +133,14 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
 	if (ret)
 		return ret;
 
+	if (sc->collapse_sleep_ctrl) {
+		ret = regmap_update_bits(sc->regmap, sc->collapse_sleep_ctrl, mask, val ? mask : 0);
+		if (ret) {
+			regmap_update_bits(sc->regmap, reg, mask, val ? 0 : mask);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dab2e31be8f65408d6d29df42ad5105830760d3e 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -19,6 +19,7 @@ struct reset_controller_dev;
  * @regmap: regmap for MMIO accesses
  * @gdscr: gsdc control register
  * @collapse_ctrl: APCS collapse-vote register
+ * @collapse_sleep_ctrl: APCS collapse-vote register for the sleep state
  * @collapse_mask: APCS collapse-vote mask
  * @gds_hw_ctrl: gds_hw_ctrl register
  * @cxcs: offsets of branch registers to toggle mem/periph bits in
@@ -37,6 +38,7 @@ struct gdsc {
 	struct regmap			*regmap;
 	unsigned int			gdscr;
 	unsigned int			collapse_ctrl;
+	unsigned int			collapse_sleep_ctrl;
 	unsigned int			collapse_mask;
 	unsigned int			gds_hw_ctrl;
 	unsigned int			clamp_io_ctrl;

-- 
2.39.5


