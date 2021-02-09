Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626BA314F73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 13:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhBIMts (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 07:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhBIMss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 07:48:48 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644BAC061788
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 04:48:07 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id a22so6360970ljp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 04:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IHoIJPGGEyf5Znw3WPC1GyqqzVtyq/oWR6wfpfA0agA=;
        b=bU562TrhZDPbyLhkaRpD1+W9AnJJ9c8VCWbmIthSyaHzKWj2Tcc6GTGQQTHlzzjdTF
         17PTLFsX2j8A42RTYWU3u7tAgOwOTTEh6telfp6Pzg2j1tp+UcA7nSaajLzYWTO9++7h
         XwPRvpy7lLSQwT9DUSP13RmBulNFY2ec9GC98rWS/nCWtuxe0VRsovcdR/hwy597Sa5M
         E2yagAdIPmxbL3tFTfza9nzIGkA6ZHB3j9d3mF+Vk4k5N8e0oi7KZN466RsZB4Jk1llX
         EGPEo9U9yQZmmch7kxo2SWliwpt4kLiGtvt4tj19K4rKj5aRpK6IX2bdP5VQAdUdWrmk
         qc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IHoIJPGGEyf5Znw3WPC1GyqqzVtyq/oWR6wfpfA0agA=;
        b=cFukKxjCiAX+VKcgavi0IiJR7TqfK02NShpUrP09s6iQZ9Nue0KmuC5SY0Ayo6gNQf
         1YXfwq/MR8RfE43wwyTryTarRSOIazvVgOloq/5/HDWaZCR6kkeoYHATd/B23dbOFgJb
         APeq+gF+9wT9EQvXzO/EM/ycUqmu7Y2QZLaIuBGVwNdhBkmACyvjrN4oK+92vq3Il32m
         HyNfOR4UD2Q4aLG7wsA4YHOtUL6YT3yT3rfTuECDHBJMdGpn4/p+DEAyjdx7Y677oLXl
         x5r+gbT6KG+A+/JmbRZhvU06f8SAtc+s2bfz9xlCT43XBh2PgtI1qo3fbIgd9WQ1lyup
         wJZg==
X-Gm-Message-State: AOAM532oHW8K9hUX9B6aSXBfKJLVxE81Xp/thI1n/zL0S/mdi6Ow6mcT
        vONfGaWIOPBbmLgH/m1nntVz+g==
X-Google-Smtp-Source: ABdhPJwi/iYRFyUVKIQ8oA26wEFbnl+AyuzcP3PrHjzlYOxb09oXomnaULyg/USbNpF2YHTpQex82A==
X-Received: by 2002:a2e:9f06:: with SMTP id u6mr14320714ljk.494.1612874885882;
        Tue, 09 Feb 2021 04:48:05 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id e16sm1220653ljn.105.2021.02.09.04.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 04:48:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: qcom: qrb5165-rb5: use GPIO as SPI0 CS
Date:   Tue,  9 Feb 2021 15:47:54 +0300
Message-Id: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI SPI controller shows several issues if it manages the CS on its own
(see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
use GPIO for CS") for the details). Configure SPI0 CS pin as a GPIO.

Changes since v1:
 - Split sm8250's spi pin config into mux/config parts, split away CS
   handling from main SPI pinctrl nodes.


