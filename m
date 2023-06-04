Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF35721436
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjFDDBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjFDDBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920341A7
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:42 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so5884364e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847701; x=1688439701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZsc3aGkFQ4mtkU8bHm6rosN4mKrVYoDnfgPOZGJhME=;
        b=QCey47maO+t74HGIdbJrsjx7ZXdv+yxbH2TwtWnM/Qs9ITfhHQdwl4tAsT/MVb8TKv
         X5uqXdC3HKnX4ErwLk93llLPkFfDZyk0l2s9lsVbXYDLUUJTcQ6FgkBWo2/gc2CG57v7
         5Gy9kmKv/NixurvbEg1kRxdTLQgdxlS1iCvhXgiJjJZQUdS/QnoQYcMaoZ1q6YCKv+4L
         v9JvmiOTB1A4CkwfNoBcYNyereVfF3VREz6LJXASdiDPGfh2xSYuCk8GrQrVgizBEzJc
         1jwP9pLnn//9OAf0y3wgVQ343zqQydTdZgfPoE22oKv5ZdSDC6VkdStOk74TDKyFTVxO
         REGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847701; x=1688439701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZsc3aGkFQ4mtkU8bHm6rosN4mKrVYoDnfgPOZGJhME=;
        b=OVYiVWu2W3Eep9VxwAyryVQVuTw6BYTiB2o5SguArf11CTKEyiE2Ba4bho1jkrxKEE
         JXp+n09kLt8e9ZzNvvmA1e4fUDAp9HcwLKJIS2Jlh0pN4Bx28ANtB7kOXSnjNY8uvATB
         bZ0g4phiGqkwd3231thAwQhb8X5j8lnuFEFqFtQu8gV7UyKQkuHW7SG4HoKucQUfQ0PT
         lJ597U88+s6QBGkY6e4QD3E8/JWrXVyiciKP8euN9DSZbQ6CK1U4S450bFrtSEVFQtRc
         yrTj8sy+A8+Ui/UF3ALuqglhRn1VAxqFcIdfK9hSm8OvQiL92GBFHxzhpDozfOUPQlQR
         tcxQ==
X-Gm-Message-State: AC+VfDx3b3ueDF/7aw32oSL2kpn84o6U4XFdK8pVyfaFfVSDq+KV4F2N
        5jHIUFnj/a91gS21CgqFCF/XVQ==
X-Google-Smtp-Source: ACHHUZ5d0YQUCBNH0BnZQCDKBW0ZR+yGOC9h7dCtgJ9kkcgMZzJEi1nlx+baS2WEvceSbXjICdkBUw==
X-Received: by 2002:a05:6512:118c:b0:4eb:412f:9e0e with SMTP id g12-20020a056512118c00b004eb412f9e0emr2085756lfr.26.1685847700899;
        Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
Date:   Sun,  4 Jun 2023 06:01:28 +0300
Message-Id: <168584750430.890410.10572067780292340630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
References: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
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


On Sat, 20 May 2023 23:01:02 +0300, Dmitry Baryshkov wrote:
> In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
> This function has just been called (from dsi_calc_pclk()) and its
> result is stored at msm_host->pixel_clk_rate. Use this variable
> directly.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6de6c28d97c0
[2/2] drm/msm/dsi: use mult_frac for pclk_bpp calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/374918d2c396

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
