Return-Path: <linux-arm-msm+bounces-43218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A68B9FBC10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6367161A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADB11B3954;
	Tue, 24 Dec 2024 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8Nx1c68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900338F82
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035155; cv=none; b=I8B+RDaNRCzR3bAjO6nT/YaaPvJw0wSq0kihs0wjH5l9iR1ojWzl1OKFjqgytWtr0RF94k27xxN9TvJuvRn3wLN1dNP0UqZ7G64YIMAPrwsxV05J/EKnwKk4VIxfvZiXtJWQNx1wkqgi8yeUVEiiyLia1u28IYCHqWiqLDojABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035155; c=relaxed/simple;
	bh=3U1TwzJ1pyUqdnTLdK79F6b6GmUNZqhe24OdmxIkjmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fcGKwU/BpdrrGZn/lJf3N+IbP+3L7gF5WN2IFJkHAXCgj1ZwelbmT84g3jpfbj5Xn1Hsjwy7efHUw6OS70JNKfpEpyb5Z8wroztr9dxxG9r18C+zA0Em/Hahg+D0jEcXrMmmF6D/V7lPsrTzrkthZWWz1vruiW98mI5nqWO4IeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8Nx1c68; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso4457157e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035151; x=1735639951; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDmgpCS1TtAcCs7bKxCTDRpYqQ8Q3KTuwQ0z9PiQfTg=;
        b=a8Nx1c68/Z9WgAAQqw62I/Wo+AEoGxXDwnizVxvYydeWqu9/WTztipNNtliOKVe+cl
         VOo1JuOmR7XgmdZJY7y/VQNZlYoGGJ5ecKkJs7xwqBEPxY+gPL6q5+PdApmdSwlSAUPX
         mPBUzlluTmPaSn8kZC+2/FVQrWHX7CRtp91pOEJ/zXldUeAukX7eqcGhI7WlaXNvyGNr
         AfnzqHwKfb99Au0CZRsfKuLrNc96FjeesWrX4Kbt3mLKpdNZYbJutS3cSuHS2ZvGH/ji
         I7qPTWN4rx+vs1YLAW9hrUxfuC7FsXjy13B24weNg9rd3aWdWrbriPU720KzZg6Q2e1A
         p5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035151; x=1735639951;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDmgpCS1TtAcCs7bKxCTDRpYqQ8Q3KTuwQ0z9PiQfTg=;
        b=QDa9IkRM4Gl9SQpmJWdPKBT0Yh/tELUZgoui+W8e/FDGGFwanWA+WIJXSfCl/OEOQM
         KbW7IUFFfxygheChT1f4f4VApAo6KpprOg3DYcoYiIqOzUFtxZRGM8s+KSHO0RFT+gMp
         qGE2COtBvXTEyCKBeQO/JoWeTeuguckWsK0cdwVWlHa39O3gbG6GA1CZWvknGVpADfOL
         mscQ5WW0AnhkShk2UCGn7wcOqQjrq/9jxmJYOfxm3WsobouqUITxscYrigA1VESHZFai
         dlnpjuvkIt+4BbcQVdznZXssx4v1dsYfjbAS2lHVLH0h+dWeRqgMIQw/mjPjX0NGSvZO
         q0rg==
X-Forwarded-Encrypted: i=1; AJvYcCXnR0tr+tJq6bcoZIvuWQazLn9PBeXPeDct06siUw3GgjSVhMrIa/3U+faOzM1daUzK7SkReM785R1B/bW0@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfHdDHdSqWGA3BtTFREx9w+tSMiwh0UzxxHzB0oaGYRrANJnL
	qwZd5pIAimmmAACsu98CRzhX+e/MmxyJS5mddXYZI/wb3nC033nNhRGfnp+tt5s=
X-Gm-Gg: ASbGnctDOsYweh+7DWKPV5g14qaa1V6BziuZbT8mwzZnyTid3iOpGyK0GmXSRI4x1gH
	TSyghpXOQLdB7ozCqw9LJARkQ2xnEM2Jkk/aH6ZTy7VvKnxt4QeFOUtcCaqI2qv0fBqZeZAllik
	QYIYBok/yMsZ8qvFhTb5B+xj5kOX2VDUpkOb3XF7SWkpMPgia2/bnU0Aj8MX2qaE5VASZuc6h0F
	t7cLr0x9rHcO5KOhxIcq0iX90DIgfjVxfzr65iC6gwcHRkykebhg7J3CoOcUdoi
X-Google-Smtp-Source: AGHT+IEWxwi9T12k6XI7VSDNch/1nVukuMHqB8DdsYw1+A+rYHZ86431J3BA6dABEQmSMVQgHxxYyQ==
X-Received: by 2002:a05:6512:acc:b0:540:1dca:52d3 with SMTP id 2adb3069b0e04-54229540670mr4893009e87.29.1735035151382;
        Tue, 24 Dec 2024 02:12:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832073sm1574233e87.260.2024.12.24.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:12:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] clk: qcom: mmcc-msm8960: add support for the LVDS
 clock
Date: Tue, 24 Dec 2024 12:12:12 +0200
Message-Id: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPyIamcC/x2MywqAIBAAfyX23IKJ9PqV6GDbWnvQSiGC8N+Tj
 sMw80LiKJxgrF6IfEuSIxRo6gpot2FjlLUwaKVNo7VBe169ag06edB7IuwddYNblCVWULIzcnH
 /cppz/gCHzWPDYgAAAA==
X-Change-ID: 20241224-apq8064-fix-mmcc-8fc79fb0ace0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3U1TwzJ1pyUqdnTLdK79F6b6GmUNZqhe24OdmxIkjmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaokMjZHjg6WztMnNvY8f0jGTVeIpxRTwDLxWw
 E2slNTrHauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qJDAAKCRCLPIo+Aiko
 1XwAB/4qyRUvD3OR0f3pk15yPMFzUPW9rGabt5UhS5yg0FKzmsFUpQDgXaTNs23D1EWmXlOdeFw
 m7JFZb/wEC09W9GLtaBlMq7I7YXzevaQpeYV5VUivUoZ3ZfEtrZp6HMt4a96XziNcbbi+qMQVJq
 gy4aiUkA8+N/Dw1+Xk3NolWySAkkV/2G4yeZ9u2nkkHWSyVohVNP4dj3q1aBALoXIundPfwNr4q
 LPWVUblIbkxlzRsd2moVmZAdBDoksVJLC+M2PLl2tMh2jJML4LCyvah7cGYuvrm9jKmBkUA9M8n
 LxXl9L8D5D9jfV77ngVPqwErZ4kdajDPzVFpIxKRhQOIXVC0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On MSM8960 and APQ8064 MultiMedia Clock Controller handles special LVDS
clock to be used for the MDP4 LVDS / LCD controller. Define
corresponding clocks in the bindings and handle branch clocks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      dt-bindings: clock: qcom,mmcc: support LVDS PLL input for apq8064
      dt-bindings: clock: qcom,mmcc-msm8960: add LCDC-related clocks
      clk: qcom: rcg: add 1/1 pixel clock ratio
      clk: qcom: mmcc-msm8960: handle LVDS clock

 .../devicetree/bindings/clock/qcom,mmcc.yaml       |  4 ++
 drivers/clk/qcom/clk-rcg.c                         |  1 +
 drivers/clk/qcom/mmcc-msm8960.c                    | 61 ++++++++++++++++++++--
 include/dt-bindings/clock/qcom,mmcc-msm8960.h      |  2 +
 4 files changed, 64 insertions(+), 4 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241224-apq8064-fix-mmcc-8fc79fb0ace0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


