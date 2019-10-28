Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA36E7779
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 18:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404113AbfJ1RSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 13:18:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44832 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404112AbfJ1RSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 13:18:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id q16so5666666pll.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2019 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=al2Rd12hk7dN6JAAxnkLahBDEIvO7RPzw6SmvVKtces=;
        b=ZF1SiL3aNo3Cu8ZjC4BP9Vgp5LnT1B/FdytiksaFFaCT+gihNoA9Do1mrAeruGtnmc
         8VcewWSgwGy+h7iWnxmDEKaUUV9FpeCUqCH7lY6nAub9KnkENay2rejNUzqnwQ/SfQu7
         Fk/hz1MNU/hYfp0AKMK0JwAEGMCJYRGcLZAhpvCyCaEtuYua70afvvEbhZ4QfD/Y+C+2
         nmWMN1+gklEb4DZUR6ltojx/q9TgJ+81EJXYq7G9/NIyMXnmmZi/O7jinBzvAbp+bY1z
         uXyNNJjPAk10ejv0i4YecJYClu+/lW2ilg0xxFD21dt/owr0FhYwVKZod3UvqRUrPsCY
         b2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=al2Rd12hk7dN6JAAxnkLahBDEIvO7RPzw6SmvVKtces=;
        b=hU2eb/LSJJUrOnVDIR8AT0aCm8n0mdYUjBTIxPxAJprNyAdF6UksV5Q6U7+XOi5NZm
         vJSp+ylomPiUme9BvpFhzk0GyzWrUs2KtLN2tsPN6gKGbB+C/Daul3wSDAwNZwErUx6l
         FWtHLsu0EgHMfzSJsnI8qWQKnDbRrhJVlnK5hfwpu7p1/5B5Hc9ail8ihBqaBqA8NvZf
         KwQ5MINN/H+WR3zUrESKJ8X/LofOGpYxU7IobclHcX5HBrTb5cO9wMLbobTXKCcZKnRq
         aVlw/JGJdK2XzNuwkhDpHzaihVPlNMfTAVp2iziqE8emWxT5Et+NrxT5ueJIgm8RPeOA
         wrEA==
X-Gm-Message-State: APjAAAXpXZxRoqNb9HqCa2+SvzFcw6sm0W0AxoEwKkaN4S1G11B88biF
        Ri5rI7XYStR2YUfTWhFwNORhJw==
X-Google-Smtp-Source: APXvYqzwJGHJ2FuWF88+zopx/Wg6G18xL03gdif7+dab8rhMsCCn+8Dnx5FsAj4J7qWFXtbEqf3+1A==
X-Received: by 2002:a17:902:244:: with SMTP id 62mr20590507plc.14.1572283121593;
        Mon, 28 Oct 2019 10:18:41 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i7sm113353pjs.1.2019.10.28.10.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:18:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable ATH10K_SNOC
Date:   Mon, 28 Oct 2019 10:18:37 -0700
Message-Id: <20191028171837.3907550-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ath10k snoc is found on the Qualcomm QCS404 and SDM845, so enable
the driver for this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e5e83dbf1433..c350ca25ba8e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -308,6 +308,7 @@ CONFIG_USB_NET_PLUSB=m
 CONFIG_USB_NET_MCS7830=m
 CONFIG_ATH10K=m
 CONFIG_ATH10K_PCI=m
+CONFIG_ATH10K_SNOC=m
 CONFIG_BRCMFMAC=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_PCIE=m
-- 
2.23.0

