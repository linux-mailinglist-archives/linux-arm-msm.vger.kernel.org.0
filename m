Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD8E5643F7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiGCEAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jul 2022 00:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiGCD7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:45 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06F0DF31
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:58:01 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-10bd4812c29so3084549fac.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dqyiAQCsv4kueiyTuJlZq5fJpSW+HSYtAJH6JI8iovo=;
        b=C29kVsdj8+lLuCNMCq6lYmN1qUMkNEmg4xF1CUfY/ILAWTdg++AUaW6nWmbAPXBEQ+
         eH1xOBFQhZHzzJyzk8917HpKSy8m482OV4zzDDcFGDC1sV6eTjJQVBCfCc71QZnblRAh
         HS9wLDp9Ts5d+qHY5lu2pYMvbpOJOKxBLoT56rV9UBqWOZAlNTiJ3bRTiX/NNNfDPon3
         mZ1S/vLK8JiyaMmvTneY3bOiLGSBLawwFQfakWxxw6qdcYAxbniLJdveO0jFeWv6vClv
         lANYwchkFmQmsfJav9RYJOzFMsTNQy2pEmcIRWwUPKGMVJ0K4FW4g0brT9d9MHeJL0He
         Bx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dqyiAQCsv4kueiyTuJlZq5fJpSW+HSYtAJH6JI8iovo=;
        b=Twzc9IJ/hkiAEbSXjtMdHCnLjb5XSmTkNUAblh0iH0kR0e7D/iH8VHo1dRmD/BK0da
         w4a6A91zRkEDp52yrXNiUnHCS4rHPrmcQ5ktdddthRriNCyoZoQtLbXqgLQ8TEJPiK0y
         RG/5VBBMYztxnAnZn+u/35zl41QpLrINHux3naqiPSUlCMGBROaOeHgXQh53sH5w/ygo
         bG05r+Aa6HJeWgOFrAGyZTwUY6GLuIs8zqSVfJqJnoFHMkDSjlA6Qm+SJrU6lqCwONoT
         ARgf0CGZ5n1+lgAoM4yIQC4LtVXZhi2OFC0Ly84vQM2qVZ+CnGyyxVH8Elx9HWdJyq/h
         jLqg==
X-Gm-Message-State: AJIora9mS0d8Uqpv4RLxFpeEAqkdBlny7Gx3iICJTA0nqN9nUIF8C7d7
        XrvkV9Kh+pG8b6ZqE2wl136Jdw==
X-Google-Smtp-Source: AGRyM1t8c2qtTapQSIxKvoMHitxKKwB148sy9pCaK8nXcebTTvPDyyjc+hNYiwiIwPwXLPvbzz3kew==
X-Received: by 2002:a05:6870:349:b0:f1:928d:c803 with SMTP id n9-20020a056870034900b000f1928dc803mr13019501oaf.19.1656820680765;
        Sat, 02 Jul 2022 20:58:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:58:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: defconfig: Enable qcom ss & hs usb phy
Date:   Sat,  2 Jul 2022 22:56:53 -0500
Message-Id: <165682055972.445910.8675442257693920967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628045454.621175-1-vkoul@kernel.org>
References: <20220628045454.621175-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Jun 2022 10:24:53 +0530, Vinod Koul wrote:
> These phys are used for USB controller found in QCS404 board, so enable
> them in the defconfig
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: Enable qcom ss & hs usb phy
      commit: 974db040c5190b5e925883600d023a9ecce8a840
[2/2] arm64: defconfig: Enable qcom interconnect drivers
      commit: 3d1188df789f777306756aeb201c8709eef6b627

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
