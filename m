Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594C45643D5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbiGCD5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiGCD5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:08 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28B1B1E1
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:07 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u9so8876070oiv.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AcqUz0o5iNJbz7sCJlLS5hTUdDN3wsKjamQwdeMCFnA=;
        b=t6ywj0lg1iKjjPkCKtu2zaD9UZe2VZDokJ166kzsEHEDTKY4zxSfGF1TBmcobhEXay
         ynt1RqNAV2ZoAjTNQHxg1JAmwh2BW/C+NpcS4LMNnyvY1U5bBkFa1MIXJrKMnK6bVPGU
         SfxqNZGUP9YrHCezkE7doANndETLi8qStqTnUof55nrJT3bcnnkL66pZwVBxze+DubMF
         Xh3MYjnB6lXC+iTxeG8yR1SvAB/Km8LOXddUk5yW9iC4ZUceuLUXF7e+EJUXkduSLA9T
         wsfkZHS4VwDx6Equ6WcO+Up+vhSgwsl8b1SyC18GxgNwXgCK/lYVQx3+PYIVCC4OZcPu
         I7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AcqUz0o5iNJbz7sCJlLS5hTUdDN3wsKjamQwdeMCFnA=;
        b=7IcwSrhhs3S65sIMKFvNUi2Hyfc7qoQ9kI1xoehX1eit64XIXRf/4yk10o5CwyZ6C7
         La7wB/EG2+ngO9R04pNypDb6toU145ZiU3TmGgi+kEHogRVvDrfhPmv3utPU/wBSDn15
         p/bL3k7fGgVIEno15mPqWxj51zI8Bt6WKdq2qP2ghQIuUbH+NOxQSP+MLqfN8L57RyKf
         vyEPbz5rlqSpHoa9yvbozMX7InYuMV22emRRINvV4MsFmb9G43euM8tUugycjpD1JVCm
         UQNcRWX+xh/VW4bhwxex0CZUMN0LKzBJ2mjuiCNH04r7mSM1L/M7s4hjLfyp3x9bu30m
         jRbw==
X-Gm-Message-State: AJIora8zZLqxMz239vD2Xjw0OuItLXrclWEk65KIQDAkeJeu91739Kui
        hCATRtT337iwNacmsQmuai77COlViLAOTw==
X-Google-Smtp-Source: AGRyM1v1b74OM5eSUQBvPTEhdhy2GnF0Au6i4bZhdzbfM1+TIAbRGrQHPL5vJl6/Gg16wyDLObLxMA==
X-Received: by 2002:a05:6808:19a5:b0:335:cffd:b276 with SMTP id bj37-20020a05680819a500b00335cffdb276mr8587779oib.226.1656820627375;
        Sat, 02 Jul 2022 20:57:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm LPG leds driver
Date:   Sat,  2 Jul 2022 22:56:03 -0500
Message-Id: <165682055969.445910.4655926805515502465.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505144913.1432346-1-dmitry.baryshkov@linaro.org>
References: <20220505144913.1432346-1-dmitry.baryshkov@linaro.org>
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

On Thu, 5 May 2022 17:49:13 +0300, Dmitry Baryshkov wrote:
> Enable the driver for Qualcomm Light Pulse Generator block, it is used
> on many Qualcomm platforms.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable Qualcomm LPG leds driver
      commit: 4c377e7b1156dbcb301587e3851d31db50ede07b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
