Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193DB6CCD5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjC1WiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjC1WiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBB52D52
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y15so17771171lfa.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zCOYrUpTdIxhDlpcMXELt7+2xWD7OjZuaR8tKINgR8=;
        b=RDhFHGCslj8gOoK8MCER9prpFCD3ZQSxZMp/oLUIQplkptA4f19xKGXghbYQ68Zl3a
         bHhlualsHGYJdf55TbPE6JaNVB6iDsPSh7U8DCLhHOs0j9IyauaEA3NaUR0V+M+73U7+
         IrE4wYH3yY/g+vfwfBVZ8eadGVOGMo6h04st5+lbHnoZTfj5gBfr9uB1XJ7/CJ3RKc93
         8s1c+Y07FpPYVAwnGsTgEhYQVnGjyV5EGYUeQS809RW5MEoFxRP3foYoaIPycLDOY4TX
         4Vy7omzd9LLDHLRquFa7dgbMiqmLoKS/t9BX3yLzG85sO6x83IupFRwfahwE8qhdX5sy
         +5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zCOYrUpTdIxhDlpcMXELt7+2xWD7OjZuaR8tKINgR8=;
        b=pAVSRCJy9zbU/f6Jxa1e+37yGm+q2tm5LPcyp1SHKSslI1u2OEB3eRI1K2pbPf8geN
         uXK4znOeNpQ34PIYu2BmzeHvAhxDPT00b8XdcDTvguFTmOrfdXGnDjXBUMnXvB7kD4Yt
         57+Xgq+RT5BHlphvIwuOA6BMpArDfAbeRImEnelysGDxuEq6cAcdVGqTBKja0itACZyI
         p2KmZnfO7Q0O8nnDcdFFY/xfizdi9JL7ygWjF0caUsrfDfsm+23uU1z0vD8RLkO1Wh+O
         8dpgcygQsNKNlTt9kxIq78b3cxMaxXZ2cBpmR7duS2gR04xClIR7jN+CD2uD5kL4zHHi
         Z7gA==
X-Gm-Message-State: AAQBX9foRtJsLuLld9W0qKSrYIcL64ZaH3AMNk6X1xfpxUlmYeGW6gsz
        AawLM37QkpW/wy43uGBGw0YoDw==
X-Google-Smtp-Source: AKy350Yni7yE8EMNjcQgNBhUoFPCJ9CFPDV7t7eP3GuMk/5HRg8DbkzB8vdZFxmKhLP1H7PbaxGlNw==
X-Received: by 2002:a05:6512:950:b0:4db:28ce:e600 with SMTP id u16-20020a056512095000b004db28cee600mr3829031lft.1.1680043084695;
        Tue, 28 Mar 2023 15:38:04 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/msm/mdss: rework UBWC setup
Date:   Wed, 29 Mar 2023 01:37:48 +0300
Message-Id: <168004305307.1061932.15557156588157558501.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 18 Jan 2023 03:04:25 +0200, Dmitry Baryshkov wrote:
> The commit 92bab9142456 ("drm/msm: less magic numbers in
> msm_mdss_enable") reworked the static UBWC setup to replace magic
> numbers with calulating written values from the SoC/device parameters.
> This simplified adding new platforms.
> However I did not estimate that the values would still be cryptic and
> would be C&P-sted instead of being determined from the vendor DT. Some
> of the platform (sc8180x) completely missed this setup step.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/mdss: convert UBWC setup to use match data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4abcfab7667
[2/3] drm/msm/mdss: add data for sc8180xp
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2c3415835aaf
[3/3] drm/msm/mdss: add the sdm845 data for completeness
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4b411abf95f9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
