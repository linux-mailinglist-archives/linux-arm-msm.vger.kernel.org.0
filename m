Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59885664C91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 20:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjAJTeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 14:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbjAJTem (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 14:34:42 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870E61EEFC
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:34:41 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w1so12887937wrt.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQFwvZLb3JKcBMwC1kA+HNwWIggAXnvVftqTF3gT/sk=;
        b=jWv6LNzEqD8dL3dqbiODzZSTw1Q9LP7SQf2YbtGfdTDv6M1pzPRUdBC2HyxURoOXk9
         Hpa7gaf9qNDHMU0lt6WBVBfEVN2YBIBHOmOWsrwgM/GAR+xklslRG9lEXb1a+zn8U2/l
         Jkw4eOiO1HsbpBnA8bLjvEjQZFqP6HLBJVlndlZjF2koCwERfOjLc/D6J75oatQWqN5u
         QtgJrXdhGR9YznH/LKZGJEaop/Bq649BM04n2fsP09Wqbv5B5p7QYbPG95C53NVu/o7I
         Yr1zu3fvoyJSNT5BKWgn48/GqLIhV1KVf0jB+eQ0I6gNYDfXcs7PbFK5qay+/qQxgYQW
         lMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQFwvZLb3JKcBMwC1kA+HNwWIggAXnvVftqTF3gT/sk=;
        b=eVDalEZvdE2lP43YSPVeTeYqP0l+AQyhmPxdHjXBeSKIanHVOFVhGgWJmh+RN7cctd
         ffLQ62MGh76+AF5jY4+Tmhcejj40E5XsEqlS2ZBOyGaQ1vDzbCJSbRKRuh2nThtF78pf
         cEhLdhvgEiIa6992ajV6SDh11lX1wcBq/EffRWUK4Vya1R04uv4CbbscqcgkuV9MPVOn
         rjBUJllwASOhVb8zRlQS0YIJ8xse3aG4JBEU28+frHcqyt8gqeXcFBLKeX8CXMHGzm0V
         4Y5ka4iRbaK+gFZbQ8u7Yti1PTxGvtkerRSiVM1y6gnfvJjaWXz4IAmsfUF0/mNf98ne
         DGEg==
X-Gm-Message-State: AFqh2krNbZdb9HCdlCYPIhbsEcWXWb3LtWwcpFY3HFw/ewxNDQwbdcbJ
        WyU/Y/+czGMiWcWr6bufDat1ZQ==
X-Google-Smtp-Source: AMrXdXudo2op9o2PQ0tPW7qQ/24be1foK2g8YUuiqO7i5c1+L/Fa+cXdA+sYCunBnPZJA3ocDVxhxg==
X-Received: by 2002:a5d:514c:0:b0:2bc:7ec3:8b2 with SMTP id u12-20020a5d514c000000b002bc7ec308b2mr4627175wrt.68.1673379280006;
        Tue, 10 Jan 2023 11:34:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f3-20020adfdb43000000b00236883f2f5csm12222271wrj.94.2023.01.10.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:34:39 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 10 Jan 2023 20:34:34 +0100
Subject: [PATCH 2/2] arm64: defconfig: enable Visionox VTDR6130 DSI Panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-topic-sm8550-upstream-display-defconfig-v1-2-9941c8083f10@linaro.org>
References: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v1?=
 =?utf-8?q?-0-9941c8083f10=40linaro=2Eorg=3E?=
In-Reply-To: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v?=
 =?utf-8?q?1-0-9941c8083f10=40linaro=2Eorg=3E?=
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build the Visionox VTDR6130 DSI Panel driver as module

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 004c379eced7..a538a0ebb0f6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -765,6 +765,7 @@ CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
+CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.34.1
