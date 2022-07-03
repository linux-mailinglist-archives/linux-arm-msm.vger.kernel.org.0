Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB1456445E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiGCEBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jul 2022 00:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbiGCEAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jul 2022 00:00:01 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00C4DF26
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:58:01 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-fe023ab520so8803669fac.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6WhkiinZderBeOJxHsAhGfuvlGN4jQvGr3mcVEnHC/E=;
        b=ROXm6HUBUB7+4plaT3RCm8eT5gipo0vfdLYpNdFJa1V2G+GeOtlT4L00JY4EI/cASY
         dZOd6BG+lXaLnds4EmGjnO/aYIVWIMxeo8688Z9Nc5ixYdjs68gta/BuiMCYhTfYoBmL
         e2uiQjgrQq+jGdh0l9qTWjijwrPUtA5u/Bq1u16YQ+fLFv9iqGBfGbynkkXr1B++LCh5
         vF9HmS896miL00jmRNnoMvJZfaR1lQkCIn8ZSAhjdgm3VriN5DA3iiFniLUopXg6Oeuo
         vgjchV4RBkLF75hyTSx0nbFT3QJ5QWOvRsA2VVNACGuGn6t9M25oxAPu+uGXBUN0giWm
         Sosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WhkiinZderBeOJxHsAhGfuvlGN4jQvGr3mcVEnHC/E=;
        b=Hyl0tS/zH+O4KavyahvvMVfgNG4CHVtXVJUSMudNY/j3Sq6vxBs72ey88kk2eHM16A
         BB69gAZpvGAylLNIHLAZb/5Wh//Lbw0VNnj4rXlzCEoDQj2/k39GbEG0vyz/czIew3K7
         tril9GDJ9IEaVzaC1O01O/SRFFLSs5fy8zRXVfn2OJpM4yaMukR3Rrow+deKn9EPYmev
         YHpj1Mbxmwen7vGh6Bc+mLnUVJqaaYJ93Bo0FWrAwwlBL3x5trOVgupmSl0TxgSn3QvM
         q47IQvMMP0rOstg/p5d4TCzzecHmSBWD7bjshWgBv7nhk9eepbCJyxSGVvJTXeP+UWk4
         38Dg==
X-Gm-Message-State: AJIora/8nPObV0zT/7WoGsLUxO3d5Ted4RnpRNEHB3HjMfNQ1IFshu2a
        dnrBhVOuOQZTa+k+mr3ZEJEyQg==
X-Google-Smtp-Source: AGRyM1u2LewnM4ouvLaAci96M2trkkiVNULlUbxt5GHFcPZ1EuMGmiG9/MZFHVVWP3R3fwybWoPlAQ==
X-Received: by 2002:a05:6870:c988:b0:106:3435:11e5 with SMTP id hi8-20020a056870c98800b00106343511e5mr13551815oab.172.1656820679905;
        Sat, 02 Jul 2022 20:57:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>
Cc:     patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Benson Leung <bleung@chromium.org>
Subject: Re: (subset) [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Split out keyboard node and describe detachables
Date:   Sat,  2 Jul 2022 22:56:52 -0500
Message-Id: <165682055972.445910.5367240737082379491.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220627212802.3593012-1-swboyd@chromium.org>
References: <20220627212802.3593012-1-swboyd@chromium.org>
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

On Mon, 27 Jun 2022 14:28:02 -0700, Stephen Boyd wrote:
> Trogdor devices that have a detachable keyboard still have a
> non-detachable keyboard input device present because we include the
> cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
> that every variant board includes. We do this because the
> keyboard-controller node also provides some buttons like the power
> button and volume buttons. Unfortunately, this means we register a
> keyboard input device that doesn't do anything on boards with a
> detachable keyboard.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7180-trogdor: Split out keyboard node and describe detachables
      commit: a10b760b7402563661fa305882b181a75a1d4894

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
