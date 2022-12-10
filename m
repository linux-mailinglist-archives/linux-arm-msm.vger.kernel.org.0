Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6013E649077
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLJTpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLJTpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:45:11 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A333C15FDA
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:45:10 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h10so8436059ljk.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR/idzzLFQRF03Z+C19lMecSs29KDfPvTl2giWO+G8M=;
        b=Rq9E2R5vYYzEUsQh/d5F4D4CrFavt6uApH+yqIScQhCWLUjLt/MxwA2rf+RWhvNSAO
         5NpkYauGAGQbD87fsxEUJd90PNh/WqZdsHQVh1lBF8euI92MQ4AlCWWabEMbcIWq+S6+
         deIRy58QQkRHTVrMtSxS4dOOChvsC2RHJSepqwTXuKLfmBmP6bHGcxhMxA6q8Wm/oOh/
         QYQzKzH+B4vdn95oTdgVyTm8+0+WPMSina1WGXWAyrHsLCPPMTUluygxM4vmkmJd3TL9
         XYHJFnQ5caO5duIOY/+6ugBbz+x1pogUBvx3FYunMtSx1yczG9oeDnqD3poHnxvAX0+P
         Vtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OR/idzzLFQRF03Z+C19lMecSs29KDfPvTl2giWO+G8M=;
        b=ROQ6reGLLuQqnaNAqkqXYxEKBSRsWT7hQDyh3zR6QIqLjGth8Bh5/7jlkcF1RkfmRK
         OYzeOV53YJNfBY9lae79FshEpEX5H0TG7OhpVJ8V28rOQGCcvEDzpjX1vpqtI+EZ7iDE
         rEzS2ub8Ek42tG58yWlvrvmeEgmh/jJwEE8HaxEXWPahsHFjKaMZawvO5I/LO2I17KJ2
         thnN2BDXNCwU2a51ofrPWZtEQnJ4c5jeN82RI56C1jj8OiFzfamFXo2PGXDLEu3hMj+n
         J0lmfn3SVlQm/i7ngjDo9EN6zgxgDw62Ia5wSSw32xBWvImcw0KYWsSYeKYbhV1I7vtW
         rmXQ==
X-Gm-Message-State: ANoB5pl8ai3iCva8Upxezt+KWOyPtmYoh5e9VTj1QiEOMGaOTzScUcbV
        txV3FScn1UAzaSpO9LGM4qC1C9De0PGAOBa/
X-Google-Smtp-Source: AA0mqf4ZUWYpUom6HFDWeMHdpHDBeTTzC+/ls9Wgi5g4FAOKKomNBwAk8HW08BDNcO2APNftbhqPPA==
X-Received: by 2002:a2e:bd85:0:b0:26f:db35:1d70 with SMTP id o5-20020a2ebd85000000b0026fdb351d70mr2690348ljq.26.1670701501946;
        Sat, 10 Dec 2022 11:45:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651c038900b0026c42f67eb8sm721952ljp.7.2022.12.10.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:45:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] arm64: defconfig: enable camera on Thundercomm RB5 platform
Date:   Sat, 10 Dec 2022 22:44:59 +0300
Message-Id: <20221210194500.464556-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
References: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
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

Enable VIDEO_IMX412 and SM_CAMCC_825 to enable camera on Thundercomm RB5
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f33e80cc7cf..536276b1610f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -727,6 +727,7 @@ CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SUN6I_CSI=m
 CONFIG_VIDEO_IMX219=m
+CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_DRM=m
@@ -1107,6 +1108,7 @@ CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
+CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
-- 
2.30.2

