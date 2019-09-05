Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7FDA9C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 09:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731944AbfIEHwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 03:52:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55643 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730785AbfIEHwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 03:52:19 -0400
Received: by mail-wm1-f65.google.com with SMTP id g207so1513219wmg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 00:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8QTtt8+sGnSqf2GZqqr6eKF9qx6336YqhCVxZTe4hN4=;
        b=P3M2iaYypKmONmySetZUFaEg2hS2Zw4ANUaBhR6r5Ydm74kgAH+IhORp1ZlSO3+SvG
         bPCT3dkX2yVgIb96qqnsLFsYvscdlxnkL5q7N2vsbXFwuzu0KFsjgL2cm4cVMQIVCiHg
         E3HyFv/qZeAvK2dR5fvXAwdJ6ohLBAUxXUlpSrnwZygHBjnfzUXN7K/XTGA3fFhhPMLp
         aef7z4TL+zPCwYLGdxAx8P883nSG9rZIhxXDy0ApUIjVYUWVdz2yX3BC0F3ldwajVhor
         yFM9sHNlHvSqgAqu2mpD6gLSQXdhjL2FV5gmXWXcKoqfAWr8dBPfgBb+lndVXZwEXGIy
         zv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8QTtt8+sGnSqf2GZqqr6eKF9qx6336YqhCVxZTe4hN4=;
        b=gjEOCqbz5HyF6SAjgXE5MhAdwDKiHe8ZseZB5NSjXpQX0kVnSteoobWMkf8HZ87XLd
         N7dc11bx76mw1NdLeytpknG5AzVJVhAlLA8uNr2uEao8t157fY52DluNq2tNdCeVqEdL
         3QZyh554ih/68EsfGLh5hm7E/jmU7A8AgZ/miROmNLlBQpdH75uVzQaRomZyuCigVp2k
         ct3ZTooW3aR8NCCqtMZW5Qrf1B/kM4NWw3oGGz6mLwE50TmeT7CULoPSPbps5K/4nZoq
         oNu7W4hDaK7flBdYEbn9JcrbmjOYvHNKHAQmKvk4P54nmueL69mU1E/H1YEzJJV/7iCr
         FMLQ==
X-Gm-Message-State: APjAAAX0P3i+3RXDTcvmSR0cwT4Mn9q0NLfjc44R/IX2tYBFM9iq8qNu
        GTYnGDaFpJk6kKDIaLx+BdrVTQ==
X-Google-Smtp-Source: APXvYqwzQVlp8PCbFWrdVBA5xmrr3ZHShk2IdYXuGYRwilcld1G0FXOEOyA9G0LVuEDXC8E5xXtsSg==
X-Received: by 2002:a1c:7919:: with SMTP id l25mr1454666wme.23.1567669937202;
        Thu, 05 Sep 2019 00:52:17 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id a13sm3418784wrf.73.2019.09.05.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 00:52:16 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wsa@the-dreams.de, vkoul@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: Provide option to disable DMA
Date:   Thu,  5 Sep 2019 08:52:12 +0100
Message-Id: <20190905075213.13260-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Used when DMA is not available or the best option.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
index dab7ca9f250c..a14889ee76b0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
@@ -40,6 +40,7 @@ Required properties:
 Optional property:
 - clock-frequency:	Desired I2C bus clock frequency in Hz.
 			When missing default to 100000Hz.
+- qcom,geni-se-no-dma:	Prevents the use of DMA in the Geni SE.
 
 Child nodes should conform to I2C bus binding as described in i2c.txt.
 
-- 
2.17.1

