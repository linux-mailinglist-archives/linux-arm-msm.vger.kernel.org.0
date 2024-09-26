Return-Path: <linux-arm-msm+bounces-32588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCAB98756E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD5ADB22463
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D24156C40;
	Thu, 26 Sep 2024 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbntdpl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910E1155A4D;
	Thu, 26 Sep 2024 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360549; cv=none; b=HO89b8Nzg9ia2P9imizZjSJUC5IIaa9eFo1VmMbfJ1eLHUPqenn9ZVum/v04gcRpcrOIe+V+xuHHfJAc4xkemaxvtMU2x4Sq128FVTM6ny9m88OtZQi2xApZp+ztE9O0HPg8DnmiB5lpqUAWT4wo2Cjz7xl/eadeMqVGbpJJ3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360549; c=relaxed/simple;
	bh=v2ECB5b4RvqZNQX0iHQLIiWI4r9KcdLBWF4yxk3AOSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJkm+A8voSH0JPJYNwu/5h5Q/+acOdhQfhCFDlIiNQUs4bTBAVYLFMlEJqOcl6NWdNO8AEB3220zTXj11VKQI4Fu1fXlc5g7FX2pdT+kgcFl/OWS++ksTndVxSD63WIDkxDlm+HIxFSj4ivJLCOg3QbDA3MWO9ahCSiN0G2L/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbntdpl6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365cf5de24so1424443e87.1;
        Thu, 26 Sep 2024 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360546; x=1727965346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55ASwlpj93CUVgS/uPubEqfpV10Z+LfDh1X/v5EhTrc=;
        b=Hbntdpl6sArpVeO06/LAqx0HR+Xah2iAusY774jNTmkO3/XMdiOIHMfppaFgyu21JI
         hJJFaQCFutih9giyshyCimpzlCwdqB9Trq+jN1TiL7KsN0VIxkVOqaKwfEKi3iokQCuv
         SFziTx0NVpEV0aZGJHPgsZaeymOGkiEXUehuvFd6AVu8/Dg17Dfb1F3FsbP7U7K416wJ
         f2pYLCbDQSKIqZCpr/C2QnRK4JO/xMrO9rygyRbGtIWihfjLH6ZhGavMEgCCARul436C
         EUljWEIa1iH3aQEb1zrT61PlossfTR+OTJ1OBZ6VsAwKzVr+Rizx9TcCoXO8OteLgYye
         0hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360546; x=1727965346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55ASwlpj93CUVgS/uPubEqfpV10Z+LfDh1X/v5EhTrc=;
        b=NhIn6/P/w5WZl+RjNwqGfbvRIhu9GmtA2oUKPOCDmqEIm0hHpl2LnLRyO1MMj2lXaB
         LcVS10bMTk+imIoi98MdgXOburbIwhVmR9ZbqZg8BTvP2FwdcNXNK7BNDeDQSI9kQx12
         EII+E2FyT7JKCDHgdAl8Nv4iZ1BjheQORMQ7ux6uKlpipEcbJTNLntmcOp8VwY53fboS
         hh+rVxuWJbHcR4GQ4k5/Q01YfSrhhmjblxnjLhJzvfeK5HrPZGec1/zmhupYRM1ubsL6
         rZ/UeITDrYhxN6GtgqT6ovR6wOq+vmrWqeJIll0QA6ONH8Y/FQ5C3nDIIdvf/E404nqo
         oPGw==
X-Forwarded-Encrypted: i=1; AJvYcCUHrMzlkU/PEkpYhc2kWpYPoqCsha9PAcd7t9V68yyLDktTpK8me2k3b35SAn5KbwBLRKYJDc8mHvohxU+b@vger.kernel.org, AJvYcCWj9yVA/VzAjJ7FN0umwb1UtvIHhwArqTznNTEuzpoZTQNED3p/4B2oQ4R6h10wo/9xxDZE2JstsFGf@vger.kernel.org
X-Gm-Message-State: AOJu0YyYz9JdIbWRyzhTnK6CBELPTBDRTQTnDuo7gyi3Ia6m8TMDyrKY
	7OHPdLtgfqueWtD1QQvEG/YVMMJo2xcVAinn6D3b1R+4tHoRINTk
X-Google-Smtp-Source: AGHT+IFWgEE+sHasYvrDYK21b+BRY6sJawXWG5Cz+w/iDC2pSqxYFTfD8uCFk2clFlQFKrCesQdrMw==
X-Received: by 2002:a05:6512:39cd:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-53870496a4dmr4506242e87.14.1727360545541;
        Thu, 26 Sep 2024 07:22:25 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:24 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:05 +0300
Subject: [PATCH v5 05/12] arm64: dts: qcom: starqltechn: remove excess
 reserved gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-5-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=1067;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=v2ECB5b4RvqZNQX0iHQLIiWI4r9KcdLBWF4yxk3AOSQ=;
 b=QS5iR5ozAkiboBPxqq5OTA7VxxvhDKmsx9xy30oT0iTLPj4Oa5ju3I5KMgW5rSMBwFy2gfB4U
 QfFiQENjzGYBZOXU0FSQGaHoRumIN3WATqKc0Y+UYe6XsdO4q5t6omX
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has 2 reserved gpio ranges <27 4>, <85 4>.
<27 4> is spi for eSE(embedded Secure Element).
<85 4> is spi for fingerprint.

Remove excess reserved gpio regions.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 8a0d63bd594b..5948b401165c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,7 +418,8 @@ &usb_1_qmpphy {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
+	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
+			       <85 4>; /* SPI (fingerprint reader) */
 
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";

-- 
2.39.2


