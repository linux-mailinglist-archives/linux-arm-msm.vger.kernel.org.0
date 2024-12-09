Return-Path: <linux-arm-msm+bounces-41062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580259E93C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4C96165CCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348FA2236F4;
	Mon,  9 Dec 2024 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FufHW/pQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153A222587
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747056; cv=none; b=BZ4WFmFZ2uGPEV23fivpWC1yKczB+GgcOfFboXzHOFTS9Zj107Ktl1unFjGZK8bJH7Ld/38niv38w9mvkM6vp6kgrPiM9dgrFhAtvXAc73ExJcJFYuir0hIaoWHt5NfPvFnUalkFipLCZhZLcxVeBkMJN33CkkxLflBxvSo9sl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747056; c=relaxed/simple;
	bh=2ItpBQPODjnIYSjwoQvA06FlkQRZbhoJv5RXLp+oLuc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HN1nF/W7aSjNZFudmqpEbKXQ9vjHvtiOOOgmspOWZLs5WgE5H/DMQcW5jNTmhl97SuqsK1GFp8PxWcpIIAreFbkN5dognIbBHGqmW3YYRYCi0uF49wljFa8+BQvGfGLa2qfWljkZlVmIxNdSn/5BSWnoq0amj1aZUaIumt0qC60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FufHW/pQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so217557a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747052; x=1734351852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GhPtI8wgOnDMaTV/aebDQBDsWOSAP4QkIO0/UH54kQ=;
        b=FufHW/pQUrV6WYzCyKuEDPZmvfI9Q7AAb3H/XHFhb6lSXL41DlcMWxgiBUNlU6mD5P
         vKLFJV5QSfNxT84CLxkLeChRMS3DDjvKtVMB3QgZSTnyU7cnhPpwwkE41ZovmXZkIhTh
         4To1QLWqqgv2e1611bFyWqjkHpkZkV47SIgeF1+9sFCx+91xwiN2/Oe4c07rhjn9DdPg
         i8fqFqx5Z92KmSY0SiqlF0YGlICvZ/JOagWufBUrYiVvVfDvThmCsAk1U6FllYIrNXK8
         aau/EeBnCKGqHVqTFrMAUbhie7LU/7W35rDakhi5jrbyQQHABYpNE8OprtaD5FNIEhsm
         IGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747052; x=1734351852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GhPtI8wgOnDMaTV/aebDQBDsWOSAP4QkIO0/UH54kQ=;
        b=PRG7x2ezNMCrZ5HMPicPIox9JqjDM1cSrRrAucVUO0jK/myHPs0oUatMEl1S2cWVqG
         ITJDnOnHM4nGLb0WonX7bpb/W5gHnspCCGwuJ5Jhwiip3j152mfY4YXGBwF8FTnR65F6
         agPlZqv1Dh/34Y5n3kiTBdC0k50eA/xR7YKplaPAFsfAnUSL3v8SNVkhFuj1mEhxO/ha
         6xCeM6XmjYWg9B1qcxkcjQZofKkzfEXmjHICfEbtKpMsRCRGriLmpKqX7rhBHNmn6cRX
         MMz7croUEldfJYrtT1VaZTeq9hcdCCu0vJPVMQppsmWBqZO4xZxDfZKpQsQc9n26PCo/
         fSjQ==
X-Gm-Message-State: AOJu0Yzc5WDaiebUhT9qUbx/xmtmMMwvWVGIajAZNX4RwVanoJ9OJshU
	osjDVuusVzniZAZ2SgBPY/d0Yv5U+Wg/6dNla406UAC566YbIb527C3sbX3lfms=
X-Gm-Gg: ASbGncsylyQtfTdkAC1i2UvNMKDmNn0nWW/O3FoaoiJMQAbaZDwi2NF0DjAzEYuhaPt
	EOlThy0rZ29l+dJwxAC6dDlbdJm+dE/C2YQpcgBCD/aRynVk6tnU32bJmZQIDKT2F1rotQI0w0/
	1m6Oex+G3xenJuvbfpDzMF75OadtnPvARgD8f+Cf7pYZ9NT6s5lqla5UiP+wuFTNPqnL4gfdheW
	EsdHLiLJLHRbuywAkiZO3ZhSzEbmp12AMkEsVBfvG/dEEYmUo+d+ACgJjv4yueXoA==
X-Google-Smtp-Source: AGHT+IHOTya6h+M4f2qaVjLOGQqZ6THQS3TTb1fVk2LGehqwscKKRp3o8NGiskXXumu0NDWCobOvLQ==
X-Received: by 2002:a17:907:3f24:b0:aa6:9c29:86d1 with SMTP id a640c23a62f3a-aa69c29dd7emr15261366b.3.1733747051987;
        Mon, 09 Dec 2024 04:24:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66b96a249sm309925866b.159.2024.12.09.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:24:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 0/3] clk: qcom: simplify locking with guard()
Date: Mon, 09 Dec 2024 13:24:03 +0100
Message-Id: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPhVmcC/4WNvQ6CMBSFX4Xc2WvaSio4OcjqoKNh6J/QiC220
 mgI727DCzh+5+R8Z4ZogjURDsUMwSQbrXcZ6KYA1QvXGbQ6MzDCSlKxHarBCDeN2GM3iaAzP/C
 l/BOZ2HNOCJGy5JDnYzB3+1nVN7g01+Z8gjbnvY1vH77rY6Jr+1+eKBLklZQ1J1TVWh8H60TwW
 x86aJdl+QGBIKycyQAAAA==
X-Change-ID: 20240823-cleanup-h-guard-clk-qcom-2a766000bb46
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2ItpBQPODjnIYSjwoQvA06FlkQRZbhoJv5RXLp+oLuc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVuFnCVQSN2Xt7Diw10/bZEjtDrP5veCHDkbPR
 eHx1ZloLmSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bhZwAKCRDBN2bmhouD
 1zITD/4rAJjeVDGqDdJHuFMtCcZ4nTslkuTsYFzw2NFIjrL0hBVzs+l/xgH8BseAHD3ZdDuknGx
 k3Ha/RJOGmLYIHHuq8bynkElOex7ggmCHa+YaiDtXcCN9go+BLt8eMFZ5dyhD0yeV2K9+Zlmi3D
 qOnW9MkCDw5CEZ4qDJyFMBr43nSJEIOGUbJDz+6I2Yarddkc/3F3+jFo+P5tymXAPxxKddmSkFg
 XPlfwTo+x6AD3lxyvOVlppqCJArK+H68CenofZ2PdPkgCbLKRynGU+BflBRC0W1qC4mTiX4i7iL
 ahmCd6qwcpfM8Ld7MV4GcU+dkrIwhSYx4Vxq1CeB29d2BPr3WvfzBEca0JZ7vLcFarPLNoyrMZB
 wxCDZWSzBCzHO6CC4Qi7iv/LbYLm+M+F1v2/uMWrM6rDmsI3qpnQ5EU8EWMGootTdfz0lz38auG
 BoSi/EpKYtkAFwDeh6W+z5dmAjEH8pRLpLfkmJ59asbPF+tVoW0UEKCTvH4FOGHxpZ/Eft49liY
 DBMOxnymQFtVYp/rdT9d7VhcUtQFp2cX+t7O2NdxEEej3Qf8LJ1tY1NKFODqtUr3aPowRycDSqX
 cZNlG4jt538P1GZbtdh9dDItoXxW1cY015Xy1nSMCgo4K2OGGBaEvK4QPYWNydZZw3mIE8XaTCf
 LX9WGs8JMxnYhpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

No feedback, resending.
https://lore.kernel.org/r/20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org

Simplify error handling around locks with guard().  Less gotos needed.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      clk: qcom: rpm: simplify locking with guard()
      clk: qcom: smd-rpm: simplify locking with guard()
      clk: qcom: spmi-pmic-div: simplify locking with guard()

 drivers/clk/qcom/clk-rpm.c           | 27 +++++++++++----------------
 drivers/clk/qcom/clk-smd-rpm.c       | 25 ++++++++++---------------
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 3 files changed, 26 insertions(+), 39 deletions(-)
---
base-commit: 294c646feab33931bd459930fa28360f5e97c294
change-id: 20240823-cleanup-h-guard-clk-qcom-2a766000bb46

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


