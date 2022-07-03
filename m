Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B29956445B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbiGCEAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jul 2022 00:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbiGCD7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:40 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D5AB7E8
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:57 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f2a4c51c45so8816326fac.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+cgJKCVi/2V6eyFeQPzpk+mpnAU8HPC3GWJwFDC+vfo=;
        b=a4SYQ4IUc+a//TQo+CTZWse4sF8lyrwCIrRNU2iDpmebDAM4y6KfFdCSi6y0FtPlKQ
         9TEago3b/gluuUPBw0AOeI2TRCCkR5UY4mWlsYSDq6leJy6rRGPH0KBedKTPOmB3iOg5
         Q1A1ZJpAHI8kmC/iqs6TV2vW+I2fKyunVp4Sv7pHFVtacZCWXONFZdtRBwdwdaC2qOF3
         sOSQZgqjNOPsNSASx+TON0IEIYWCoGIKHIyNHu3lL15Zw92xQKOT/h1uyRnHbWNOZ7jP
         yukvBpmuuiWf11pLv9vgO4TwbLQURx5lDunfj/hMugMVnUpL4xKZ/qxKva7ybb0XcvoB
         mIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cgJKCVi/2V6eyFeQPzpk+mpnAU8HPC3GWJwFDC+vfo=;
        b=I8PZfgLdhNIqa32tf8Sp02UGtZt/vnFpAS7muyalCCqyvvYbd7IS61Y2bm7CGyLxHc
         9vuBSakhfJKaBbsB47Q+M6ydGVGrEKCQ1YZuVS092d3LS//quPHWcZBQV7OJwzsFFW0S
         95trL3eOBj+VWMS98KlOfi2lfoh9ftIdf30dUX37162KMQno6WFjZQifMb8mSk3macnc
         WTs7p65ZJ1w1nNp4DDVNOkv5k/efoa/YJ2BD9RY91dF0nsJ4M8+HF4098/FhMTgw2m9/
         nZ9MD2lZzjdQ6zXdAyvm8mITK08slYsqTQQD4NUhUazU56axPnYwog+Mx2gOIpcGi+mQ
         HHYQ==
X-Gm-Message-State: AJIora+nDGTeoJjPLtwkoz628xextFIc7+aPX/rY9nVDQwQvBWijSqNb
        IkjUq9hggEYLXo9/n3PEuHGWRQ==
X-Google-Smtp-Source: AGRyM1vFlk/n/OswdQIhCfHk0k7gq96bHLiamaLq7rhP6el3dczg6dSkn0/+kTjJTqCSfbsvBGktLg==
X-Received: by 2002:a05:6870:d79f:b0:f3:4962:7abc with SMTP id bd31-20020a056870d79f00b000f349627abcmr14321784oab.152.1656820677385;
        Sat, 02 Jul 2022 20:57:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] remoteproc: qcom: Fix handling of WCNSS IRQs
Date:   Sat,  2 Jul 2022 22:56:50 -0500
Message-Id: <165682055970.445910.10191741648290635149.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526141740.15834-1-sireeshkodali1@gmail.com>
References: <20220526141740.15834-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 May 2022 19:47:38 +0530, Sireesh Kodali wrote:
> Due to a bug in the code that fetches the IRQs from the device tree, the
> optional "stop-ack" IRQ was never used, even if it was defined in the
> device tree. This also allowed a typo in the MSM8916 SoC device tree,
> where the "stop-ack" irq was instead labeled "stop".
> 
> The attached patches fix the handling of IRQs in the code, and fix the
> typo in the MSM8916 device tree.
> 
> [...]

Applied, thanks!

[1/2] remoteproc: qcom: wcnss: Fix handling of IRQs
      (no commit info)
[2/2] arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
      commit: 5458d6f2827cd30218570f266b8d238417461f2f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
