Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB6D5643CC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 05:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiGCD5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbiGCD5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:57:08 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1358B1F2
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:07 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y77so8956765oia.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixFS/lLVzK4AnsiITvXFoWkkOR9udc4jxnq+DXxte8Q=;
        b=ELDIg2fYmhNeuZS++FOlyGI7qQrJirWA67ek/O/GrP5yzY/ghQ4CdkuK7h5/GrW3gr
         1xwOy7pBdAEXa+aDGAa9weODT4On2ZDw/DQBRAWFvHkMJ2AWM4qLDOscQsPsyY8dBSi/
         8G3AKT8MyZz45mv0IKyFDy8dI6aeSrgeE5F5ByhdyIZn+xBCZKv9oReW1msAEYh4MjGO
         LSfUXS4bT3DAs0/ymlxwI00TxQtKcA6il4240yEdOksnu/3EOnu47y8lh8K5T7LZMSpn
         OWaFmFv4txw00507q6C7Qsx5DtJC6b/ODoct1HICemIDD9uq3NVq8up5GIO0LnJnaPmq
         s1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixFS/lLVzK4AnsiITvXFoWkkOR9udc4jxnq+DXxte8Q=;
        b=yJd7H6o6nCU1ahHDfzPTONhbG+y8z8tDuDP25YLneaplvCUJe2D7Y9F4LJGhERwZdl
         c3Oilp1IymZh2JXQoBdD8oJjB4MWPnzrko7/8l/4ALKAHh3K/cuH03BybyQh6fxskOBA
         ihhmidMwZBVuBZNhhSpcUwFVF4c+FxvGk8st/QnXqPci+aDo96sd+eOjgT4RqlnwfAzA
         +BILt0eFNfvB9353Txu0E1eh9QEuP8BGFSbMLdtr3n3BNMb1IJf6uJR1SuiJvUpFfWKl
         5S/yVXsaw5XaolM+A8z4GBuq0cIqJvnt3gkXX+kjvQjtjLr0zdEv7wS669OhHrZq8ohm
         E4Zw==
X-Gm-Message-State: AJIora9PS2By2Dekv8d6ftZMfmUawhUwnWzyA4mFTkWoUuk7B9Qs7kyb
        MiMu0fugK4bIvvMPJYyFzKae5Q==
X-Google-Smtp-Source: AGRyM1s+D4CWrFB7V3Go5Nk6+CmS679ArdDFI7J3XZkIV/vfXB6uXOEqOFaxv/a5Y3dUyi9JYukbJg==
X-Received: by 2002:a05:6808:f02:b0:337:a7a0:204f with SMTP id m2-20020a0568080f0200b00337a7a0204fmr4055532oiw.68.1656820626379;
        Sat, 02 Jul 2022 20:57:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 5/5] arm64: dts: qcom: add mdp_clk clock to the MDSS device
Date:   Sat,  2 Jul 2022 22:56:02 -0500
Message-Id: <165682055971.445910.12967450195410688611.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org> <20220615135935.87381-5-dmitry.baryshkov@linaro.org>
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

On Wed, 15 Jun 2022 16:59:35 +0300, Dmitry Baryshkov wrote:
> Add MDP_CLK ("core") clock to the mdss device to allow MDSS driver to
> access HW_REV/etc registers.
> 
> 

Applied, thanks!

[5/5] arm64: dts: qcom: add mdp_clk clock to the MDSS device
      commit: 2e4ae611ab73d8e35d6059fc30cb4da4cd568d4c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
