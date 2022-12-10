Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AAB649076
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiLJTpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiLJTpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:45:11 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC3715FCD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:45:10 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id x11so8449061ljh.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zzrgB8s/mRzVHCkwIjAwQ6pbjH6hgollXPwDmQAuDkU=;
        b=xRY8zje/uDTdYteSr6Pz7ZhaXnmOyvzv6Y/7bU3Glb/EvgFiFnir7YJZ+gmgHiEMx2
         p9U9GRCagH4s2s2lHcEU7DqXo9yrCYi87fLhoMrOpthGckyWkfdoGi9kxn6a95iWXJ8F
         2VGeWAW4gOXvmz4jd6J0ICxbTftQwdghUHyEGOEgcjheQQue4LSF8EfjQSv1t2qmYHvD
         zIr0oCEXLBYqQyQWLUm9QiaPtWj/CLdAJTG47IC0HHccpKuKi/JOQTpZASCw8UDHRPDN
         9sdceqsH/ie92CETR8NEEV0J6QLwFb7zQOBJCkrzVDQU6x/q33Tt/X6s4ThIi5AtSyNl
         1X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzrgB8s/mRzVHCkwIjAwQ6pbjH6hgollXPwDmQAuDkU=;
        b=oAMbj9MtaAVVlt7UQH41IZtQ25ouMx4rZBpDG/c7COrRF4CDzDleJBG/T8q2I8E4/s
         B7fh7lwEY/dKJpCzloXzv92CWsmKfTB7T1JKqen0MUCRMHpIwTZDgowJA/pfYOcbYOj2
         g3rwCtdK9JGWryDh+tHECLbz4RAaX1rnd+ZS3iqcGNuIyt3tubUZ6Bc42Vfgmy1L2ckc
         XnC3Yb6BPFBDc0RD9HjeeHzF7QJB/VK4F6qqkAaxzpBebMmWWyCxr48fGKtczhCuGn9Q
         TG3GBmpqJgGXtTlt0HOkwR5CpfKyJ/DQca0A5nSVtp3uzQAyi0f5qX+rLSmLN0MjY71R
         ZctQ==
X-Gm-Message-State: ANoB5pmUzfzomSxO9Bpjy9uuxSrE5tbDqMlSkOAWZr/jNXhJuPOIoxob
        d6meU6J7Jx4jFiPkh2ISXgDxkg==
X-Google-Smtp-Source: AA0mqf45IdV9NSgC8PPh+93s0QjRAlQkZvwIX9mvrPASkIv7/TDkLEYCMbEAGeOlHIM10tF9SiHx3Q==
X-Received: by 2002:a2e:7c01:0:b0:27a:185:9846 with SMTP id x1-20020a2e7c01000000b0027a01859846mr2645634ljc.14.1670701501243;
        Sat, 10 Dec 2022 11:45:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651c038900b0026c42f67eb8sm721952ljp.7.2022.12.10.11.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:45:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] arm64: defconfig: build PINCTRL_SM8250_LPASS_LPI as module
Date:   Sat, 10 Dec 2022 22:44:58 +0300
Message-Id: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the driver used to drive sound-related pins on Qualcomm SM8250
platform (Thundercomm RB5 board).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..1f33e80cc7cf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -563,6 +563,7 @@ CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
+CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8350=y
 CONFIG_PINCTRL_SM8450=y
 CONFIG_PINCTRL_LPASS_LPI=m
-- 
2.30.2

