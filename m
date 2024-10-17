Return-Path: <linux-arm-msm+bounces-34801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB39A2BDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95E03B24155
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0271E008E;
	Thu, 17 Oct 2024 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1CDtvXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4E1DF246
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188722; cv=none; b=mIROp1CTLzNwUhnPknzdXkPr2FyQmE6Pph/y0+3PPYdhN84ZiUKIvM7ms9SF9YDdeBZcrQLFqyKN4hAjjw46e9SlnyXeqamJQioe+hF/e5nrjAwtI6W2hSDxyERB01JxWF40bYdKi0jjgYSu2G2S2Nw0eSECUldz/mpVoaEt+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188722; c=relaxed/simple;
	bh=z9gullE2/djCQd7k5PGKfGuUrtvUKf8lsI3Xgek9AFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VuEzrQYY73zYSQGpnxv9QIbGM8H4z87NA+p5fWEZqhlCsAOvzWnzvHk8YhzmQkIZYhNDsKS8Ldn+c6ZyZtXpJC5/9ynUnTte1wftEXnKhxF7nDUXnnp4CBFP8r0HD3FPCOQcv1ixicfBswuG0Qwo6zbihl4YYl0IzCpWfnNuTSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1CDtvXJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fe02c386so2395515e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729188714; x=1729793514; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxiQQYnnLiYe1NRYLfa18e4fbcMTEYgNWx6js0FYHU=;
        b=o1CDtvXJGzTGMDnruAs+abheYhVExHZd+snyzA8Owl3nsSaWVMAl0zSEu/wau6V4Y3
         qkSAX7BSL9gHjcQSZb9r+SI+DOKtWjgEnXWRFW7CgcDOuv2F8oE7dUMIzKgqHtdNmKC+
         I5j1o9jAsHxnwN1XkQsxZmLIc/FSXsqKejNZQlCQliKB4CG8M0GPRSbzMmTik64vnoOg
         ldRr919Ume2g3y1V4IEM35SoFiKvuP6XvVZnsQmHPgnuhKvuPBgeWTMj2xF82TXzcvD8
         nPUVdy70tQlAq8uvvEdWY/h1XtURKr6jkA4J74Hk+WBFYrCRmFKZBEQ5T/ly8X8eA8Dw
         43Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729188714; x=1729793514;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZxiQQYnnLiYe1NRYLfa18e4fbcMTEYgNWx6js0FYHU=;
        b=Hew4oopf6BxH/pbZHQtYllJTcx4MSOYjqHFa3slu6nruZiUVDXWY0EnT+XyS07aZ+S
         b3z7F1epL/h6Pm6SoFqiD0xCj6/Dctb8OPPzrFCYILGFqfgyCrWHoIxXZ864UML/6bTI
         Fp0YnkTf6zbDlv7ir4UGdac4R4Z6f5sgHTYMPGnrPTwgTVi/Xg0HOUDHq+RhJVQZP9o6
         8/3cAY0kH4LM3Jwrb4ZRhaxoCtia3YjGmOz8VL0avfru/7/bMMK7Q+rplYDE2GAJ/oBC
         Nnecyw4dYMyujgGjptO00gxADCBHFsUJmYJRFwT4BmgFRWZeck2XRMF+uyG1eqvuua3M
         gjzQ==
X-Gm-Message-State: AOJu0YxyQV/O9tAOCXjaCWBlzYEcthfICDegCEB/3DRQ7EKnx1fswEyT
	PyOHD8mhjp46cv4qDC4GNDNtoSOujjkbTNmt17mbfg5Hrm8adGgk4s2/4/W7yVWigRxbgCg5bvT
	b0vA=
X-Google-Smtp-Source: AGHT+IE5cnTqQ5nNqL9y5fKWUoLBqqEK62VLizium6/dxI7EPCeyNqDLop8VMZBt9ejWsGJejoilFA==
X-Received: by 2002:a05:6512:2c0f:b0:539:e2cc:d37c with SMTP id 2adb3069b0e04-53a14ff6cddmr12725e87.3.1729188714046;
        Thu, 17 Oct 2024 11:11:54 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb232fsm841113e87.109.2024.10.17.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:11:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:11:49 +0300
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Add SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-dma-v1-1-e6aa6789f116@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGRTEWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Nz3eLEIiNDY4MC3ZTcRN0kY0vDFENjIDawUAJqKShKTcusABsXHVt
 bCwDDVe4EXgAAAA==
X-Change-ID: 20241017-sar2130p-dma-b391d131d108
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=z9gullE2/djCQd7k5PGKfGuUrtvUKf8lsI3Xgek9AFs=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEVNlS6PCgdeyOaFQx3n6iIhMvdxOmsyJUyi/Q
 UzIwVb++ZSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFTZQAKCRAU23LtvoBl
 uGpWD/4k1swyZNeHRK7hgB70TpyATfXe1b/wlp8gNQ2MFbcIrH6+/IPk8cWQdMpqaHrr6mB+Jry
 BwKAqikkOmKT8rvkl0xWEFyD8HI7vrbouF7hXcFCHxi+w2dqOCls6jdQqm0j+XhNIObhaxVg46g
 JeBMVdMtya9WhCtLOapsfupqLB0PXcWijqiPX2dKtJlbDRSY2RMZD+wlgwxA/zuDS57amFVzY44
 eATUu6FxPADBt3efcBvsqWJquia8ayWxETC0ybG4rjEI1p5S1Bu4JbehMDFhMzTZx71UOMEmK0u
 SiWyW6CQt/p4w8F1TGIafHCXpkYlcvj7etxMslgewL3fBnEItXsiSfhaqcqZDpuybP5N/Vw6L0z
 5zV+e90q9OeNPtIk+wD2JbAYzRfwOX3KJ02Gnd01vStMlnEmoIXAe3HlXznqUSYoJuZFZkd5doC
 xvtH1+Mpps/blQOyoBkNAR61wRw6azLYxSpY0cS0vZCFg/Ig7IBzFdLrm26vpMZ9xXW48PtcRBp
 HvMI/gx0AMXsO51vE8dttlDkKwXCuQhKiI9BHKkdOifcTMoJ2kpvWKU/WDgkMUHtu7RqEdxKheP
 aJNa/4IUo5SkPbG7vjCdY+Bbm5U93oVLoUsxUOsJfjWGp0riSm/MaYWwgTbTTIE4UvNNaOOcsMX
 MS66c/OucR0fBVQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for GPI DMA controller on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 4df4e61895d2129caf7f2ad9b426d78b60f9c32b..4ad56a409b9cace94a3a4c4ec94d3ad16232f5a1 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,qcm2290-gpi-dma
               - qcom,qdu1000-gpi-dma
+              - qcom,sar2130p-gpi-dma
               - qcom,sc7280-gpi-dma
               - qcom,sdx75-gpi-dma
               - qcom,sm6115-gpi-dma

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-dma-b391d131d108

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


