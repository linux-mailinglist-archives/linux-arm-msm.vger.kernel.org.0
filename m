Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF134A4C79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 17:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380628AbiAaQvB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 11:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380622AbiAaQvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 11:51:01 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7390C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:51:00 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z4so28138799lft.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k1wndgCqrVZgmZ7GgzX/+PYCHrDJ0+gchWkWWz6abZU=;
        b=H4hPmCjfJh52Bg9cJb2mFkqA2mV3UbB514Y0VFAg3OsflkmiZ/433ji3MXBjSbTmPj
         69y1cD1Io19V/cmw3oOLycNH3tCzj/7i/eWB0nR6UG8EZCR+UIiVo6vtiinFAjyPwJwc
         hln9XyEwI2alhpHx/FZ8FhV9nANJy0Uv5DiXFIdcHJrvMygv2KaET1nZgtal/u8MyXLf
         MXpag/Cg3MejeWDCseQJUopsfRMIarXvnhs0SGp/kknF3pigwFqzs9PRHDH3X5ncYEZy
         MzwzpScPMGFiQoT04l0tjxXpu6Sls+VHHnAqSJSQq2DQTim0SNFDY7aL9jTnfjJuAceH
         eLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1wndgCqrVZgmZ7GgzX/+PYCHrDJ0+gchWkWWz6abZU=;
        b=sfq8rvvjG3sMWGNxwYiJEJMKxEA92fmYHSWsXwpSE0ztx2KFRZa90pTnsqHFXwoHbI
         L5QWDBeCRC/ku4AVKL8zi9EQfOcndmJM0li3qu+kldJzX6LMosArV9tki8rSKhmL5pt3
         4YOL9M6FIUvrmahbehNwG+y+QckCMjj2VD6BDfK1irLsEb+za14AE6VBy2cwrztllEaA
         gM7PTZzpqd7Ye6uXFQCdcU4S2ENRrDPYtNZn1qWe6NfsMe/3cJ/w1w3N2E6O8c5Lv9o+
         q4hnN83QH/9WMVoevh/k4JCeeqnqSbxe0mrvvdHdpk7HMKY1Owtc/KcRITHTmLO8Tr0x
         4pNg==
X-Gm-Message-State: AOAM531rn95bfjvBNxWhJOQuuUwgdSu4+gNTvtnKQLanxCT1SOouhF6H
        8CfNNAGyqZNXgc9tBu64/0aGiw==
X-Google-Smtp-Source: ABdhPJxRr58XPxpd1fmD8oD3lLZ7WOE2FsC2wlygnVX18vVMADeiXFyuCsysD7dFJdswgM++fjTZjA==
X-Received: by 2002:a05:6512:2144:: with SMTP id s4mr14354268lfr.504.1643647859056;
        Mon, 31 Jan 2022 08:50:59 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i19sm2749853ljm.51.2022.01.31.08.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 08:50:58 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: defconfig: enable mcp251xfd driver
Date:   Mon, 31 Jan 2022 19:50:54 +0300
Message-Id: <20220131165056.2117434-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
References: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CAN_MCP251XFD for the CAN chip used on the Qualcomm RB5 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c72ae4a421d7..bb30afa95a73 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -187,6 +187,7 @@ CONFIG_CAN=m
 CONFIG_CAN_RCAR=m
 CONFIG_CAN_RCAR_CANFD=m
 CONFIG_CAN_FLEXCAN=m
+CONFIG_CAN_MCP251XFD=m
 CONFIG_BT=m
 CONFIG_BT_HIDP=m
 # CONFIG_BT_HS is not set
-- 
2.34.1

