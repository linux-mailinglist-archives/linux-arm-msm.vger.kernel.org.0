Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92C12CD8E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgLCOVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgLCOVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:21:51 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22035C061A4F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Dec 2020 06:21:11 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v14so2962847lfo.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Dec 2020 06:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tf8DiD3u7w6wv6cJWgVSr8vC1830hhxp5RiUIeRowlA=;
        b=niWyANAW3axBreapkmOAfj1Ix11ybAaIRuNYyjrZjU4DSObk65Gvei/CNLMZUz+QIs
         mitUVRX06RXo3DxBDuXrUZvgGlyCCOCFXrRyyTCHzShPZRiLy9dOU+rpoHb+owU6lm2a
         TpxUjTGVt5Ry/KZt0Q0yfS4Wvg/HvfyLxcidzqlr99R2A+OaijA/8l3SApTzyfNC20j3
         yjL7fAAr7Z43J0We60MOK0+Qr40vInRR/HrHR/acM7F8SQn3mTSvMdKKD8gautnU/Hvu
         K9CF+V6n3hPNt5nzMIKr3AsJK8WM0ugj8oO7CXcE315ct4IZ0tVijljdem4Ovl8ZmKuI
         mIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tf8DiD3u7w6wv6cJWgVSr8vC1830hhxp5RiUIeRowlA=;
        b=rNYRFBKpSvk+/g9sAz0UvIyoVqs6abdeD4czOie3BpfzpO1GfTojEqKI/YwbT7TVg/
         BJK/VMNVClzHbndZeeXo8axxSrDWV6LICmJtItBBmwLyIF25TF5KtSXhBazocndbOgCr
         2kzmh0KJx9EX5NYCzeCnL4EG320xO0KUQpr7jSnFNgaR2WnzW1vZsxuBmQjGsQ7OKTDx
         Mur1JisjG0xIKloBiC2yXUVGSYVpIa7RhDXqk/MKMS25V55YYxSPZdFB7hCnBmMcu8Il
         JBReYiUFedgKMQ5tD67D8vo016l8a0X7uLME25+k2uqBplFhmv9C7L4QEPyPlMIpjx6I
         INGw==
X-Gm-Message-State: AOAM5300XNEqsvywKQxfl8shyI2CB1wO+zs4tvT67iDaKQiHuoIl+buM
        x7T3Pjia+0JJCj7mFhJRiDNlOg==
X-Google-Smtp-Source: ABdhPJx3PilQ+vDOxjDHiI9lB1WaJOf3JUnPpBf95p8VV4FWYsnDQwRDhibwOgV0tLfUjfuH+Z8ZDg==
X-Received: by 2002:a19:456:: with SMTP id 83mr1491389lfe.240.1607005269553;
        Thu, 03 Dec 2020 06:21:09 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.117])
        by smtp.gmail.com with ESMTPSA id k185sm575716lfd.294.2020.12.03.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 06:21:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/7[ arm64: add support for display on qrb5165-rb5
Date:   Thu,  3 Dec 2020 17:20:58 +0300
Message-Id: <20201203142105.841666-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for display device nodes on qrb5165-rb5
board using lt9611uxc DSI-HDMI bridge.

Changes since v1:
 - Move zap firmware to qcom/sm8250/
 - Use squshed firmware (mbn) instead of mdt


