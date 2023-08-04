Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42F647704CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 17:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjHDPd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 11:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjHDPd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 11:33:26 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB2B49C1
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 08:33:24 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe48a2801bso3882855e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691163203; x=1691768003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6jlXHLj1MUCfLZToewZeR7OtzKxIt9mLVk/gVOh5yw=;
        b=mdnuEsB4ff942lzJOdWVE5DqJm3m702v928B2Mi3mmyo6TIqs665k2iz+eFXpRSDsO
         wxNH7lZZnvlhOUiY1/Ingp+O0ZRLgna3JH04B4vy7QvFlJ9xWJnXnXp5n10x50OXGYMx
         +bzzTM6bUFkZETdlNeqJ3eBuD9p3S4KiCptEMJAo2PrnroTF40rl66GGmzv8h49zg+YQ
         FdEmOdD9PuxiqQ9JcKC6DM2q9d330hRd3Q4Y3qPLOBeI1zJ0OHIIvCrvrLCmXSBcpufJ
         ROJ2c0wA/i0WFKBqWxvJLA3i7LJ2at4dZO0TjY4+Wwx3w+PnHlCEDLr4B8THefjCDIGW
         3hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163203; x=1691768003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6jlXHLj1MUCfLZToewZeR7OtzKxIt9mLVk/gVOh5yw=;
        b=GHyq+tKbCPHv9WojDx4P4xM8PkJDvbItYG7drItPXyvzNK4MhFMxuFXXRu95uRq3cx
         IdJ46rOfQNCcu1Cuke9Q1TgmPXaH5l4E+6DOuUmDQCbcAhYBvJ12Hv0vpCZqqIMM3ZyQ
         I25IDATS4o/Dd6U+mUaHe5Vvda+B5iGH8iLtkllwPNcbLfAEY5ECtzjUpap18whanIUX
         XwngKRdVO23YnHTtZryjrod+64e58HPugxHnsDZwdILJtj9hPFAFiMD68W4aGOAjM9yu
         QZHu4IwU4AnYaYlvtLkzqbge7O04au0zecyBMnXwgnKOPA0i3hwuF4epcA8ZM3BcUgFE
         f6Tw==
X-Gm-Message-State: AOJu0YySNdkDDDdaoIUVve6zrDhDL+RSaXygbA3p+qBCKlu7VPI57tmf
        8Fy9P+0oo1R3/1zR+3bD0s/y/w==
X-Google-Smtp-Source: AGHT+IGW7itXMzBpTRGOomYFU6pVFSKbCE5PJfR8t9U8RbjMcV1bPdCvMMMUsQWTLeJSl+72NkQFwg==
X-Received: by 2002:a05:6512:3d0d:b0:4fd:f876:d86 with SMTP id d13-20020a0565123d0d00b004fdf8760d86mr2138504lfv.50.1691163202824;
        Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 0/8] drm/msm/dpu: change interrupts code to make 0 be the no IRQ
Date:   Fri,  4 Aug 2023 18:33:17 +0300
Message-Id: <169116308154.148471.9274793163444236457.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 02 Aug 2023 13:04:18 +0300, Dmitry Baryshkov wrote:
> Having an explicit init of interrupt fields to -1 for not existing IRQs
> makes it easier to forget and/or miss such initialisation, resulting in
> a wrong interrupt definition.
> 
> Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.
> 
> Dependencies: [1]
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d93cf453f51d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
