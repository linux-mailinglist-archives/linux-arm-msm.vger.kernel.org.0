Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0240674F1F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbjGKOWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbjGKOWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:22:17 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06B41731
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so91967011fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689085316; x=1691677316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1lWCMAO2Wq+27Lr2YJJEVAhZ3/UlQd9TJnV/cIBk7w=;
        b=MsGp1EXbHVqWHWLLVbyk+sBlcLNyKF7J/bk9t5xUgVdzFOlvTuKs7vtMNNs2QM9h0y
         wHksnk4Ds7LgYJXiZebUqdT+bcR2oxUP3t2Z+8mzKT7JhYJxiN9jwJPIvhyy9X4GQ2Zo
         6CRdh3jxsXu6n2JnhgGxR4qEi2+sa/TrnzAWh3WHODrsbhCZirHA8XIWh/hFOiszjmHv
         CcY7W2NjgFmdhEoadtypB6x388K111/zGJc8whNG8mXA64heoRx1swNmoraRuGIHSQUt
         4AmeatQ3naBLzfTEKVNQJUezshdfkVtpM1sgej2yw0I5t4m13M8HYxvsNzZgP9ZeVw9E
         8B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085316; x=1691677316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1lWCMAO2Wq+27Lr2YJJEVAhZ3/UlQd9TJnV/cIBk7w=;
        b=WnPteb14WCrSX/bM4usI2ePCTJC8tFNlWQp5obTSGWPmoUmatyVjA5N9cnndRiNQz1
         vFdIVGbQhDyW1vVzUSKTxCHBsdyQ4FLeyWo2PATaLH6emqlfDsLhyHxPdfeV7DQt7WUr
         QzLIyKeeHLRpukIcyr/Ry0fcUtg/FlQPxD6V6gWO506F+6+JGMyvHjK9fW1nFe5LjMTO
         7QF7REQtwpEeWp5CWjvEr0vUaYxVBC00fZpfK431Yrc9UFO4A99/3Nx0hCx0cS3D8pTC
         k2kXzBV9x8WrCczj5UpjppHTt9I+2FqgltsXQ156Cc7fwg695R8FgJXC/Y3v0LPpjvhW
         ReSw==
X-Gm-Message-State: ABy/qLasGzQtr+0C75Vbs5MqMqSps0zdaaTuqvWJmo8nX9rIDpJNNbCK
        mBjy0AZxYBdCz1lmRn2RuzCCwQ==
X-Google-Smtp-Source: APBJJlGngHUJZ9X9GYWIvjdWd3jqvBIWvRNWDWxXwyK92PFumAsDADmQt1A6Inkp2+TAT78sTjaXzA==
X-Received: by 2002:a2e:780d:0:b0:2b6:d582:5a0 with SMTP id t13-20020a2e780d000000b002b6d58205a0mr13499829ljc.12.1689085316464;
        Tue, 11 Jul 2023 07:21:56 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:21:56 -0700 (PDT)
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
Subject: Re: [PATCH v5 00/19] drm/msm/dpu: another catalog rework
Date:   Tue, 11 Jul 2023 17:21:45 +0300
Message-Id: <168908465043.1869384.8392019740973235368.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 04 Jul 2023 05:21:17 +0300, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> [...]

Applied, thanks!

[01/19] drm/msm: enumerate DSI interfaces
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9400b149f89b
[02/19] drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2891e44f85a1
[03/19] drm/msm/dpu: simplify peer LM handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dec7b5b5f206
[04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d32b4e813596
[05/19] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ff96132b91f6
[06/19] drm/msm/dpu: expand .clk_ctrls definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/44db3665f6a3
[07/19] drm/msm/dpu: drop zero features from dpu_mdp_cfg data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f418c06d7735
[08/19] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/058cf8fe4a2e
[09/19] drm/msm/dpu: correct indentation for CTL definitions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/541f02d8f5c4
[10/19] drm/msm/dpu: inline SSPP_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/081a8df0fe38
[11/19] drm/msm/dpu: inline DSPP_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/bf155602a3b5
[12/19] drm/msm/dpu: inline LM_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2041f2a307f2
[13/19] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0598333aa5be
[14/19] drm/msm/dpu: inline MERGE_3D_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/87a5beebc074
[15/19] drm/msm/dpu: inline various PP_BLK_* macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f5b8272707e
[16/19] drm/msm/dpu: inline WB_BLK macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ba0e5c846a62
[17/19] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e9350a906b8
[18/19] drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4638039e5bcb
[19/19] drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9c9bc8551f27

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
