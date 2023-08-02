Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75EA76C9E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 11:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbjHBJzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 05:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbjHBJzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 05:55:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66E4E64
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 02:55:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe3b86cec1so4735506e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970149; x=1691574949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fO+AuiVRXnIWsvnH1Ymd8k44f0ol+itxsyVxim6v8M=;
        b=tgNYgj0qIVjuGJlhO1zwYOJH4wDFFO6KHVSXvswSIwBtQ+/sYgG691hrwILiC1l4fQ
         YBla4vPJnmF7yHXGj1SFGXjhJnyQXVvK3Zys+m9tysCyj9iKNCRBWTkImVN4e/U8P5si
         bqKOTTePkxm9Cb66SB8agjMYM97Q+R/95WFdDG32Dt4p8hgTIKEDgLgrmC0w9DSky2AU
         CzRctUk3TjJE8J4lfu13dvQaORdhoZwGK7HGSYlnZqYNb97438KwqpwOggtu/P9QDkci
         QM0YWXCx6CKUHqz2Z5483tIMrpyjZl/ZEh45RdOS4Er9w0vzIHtyIl4185JS05TnNyAU
         k/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970149; x=1691574949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fO+AuiVRXnIWsvnH1Ymd8k44f0ol+itxsyVxim6v8M=;
        b=RPe6sbyWUTk/i9mUwWod+N/v4gNMfp/z1aGXbN0tWSuP3lJi4Ey/d6MNoe06jO3Ndn
         ogWXhOY51ckRnoYgtg24Asl1+0DYB6d8+Vzm7SFZf57tL/wcNPc3u/BMppn0izma4xK5
         g+yFnKaoNM5qgDlIC0Zp6sBf4yrwn/BG+Qbi0kf8cb6L6BXTLvBiH/UrigJetl2yiuDy
         hocl5qBoQbrRNFtGqK1hh/WK1hOz/bPEb00taAEx0MP1M1YWhCtrZDrm94O1ugLMOdZw
         1W7c3AhEEzxSdyxbHzpkMwitBccCWxfBH1Txia0mMATSXgAdtisTOK+WUJV8u00leZNZ
         J9Uw==
X-Gm-Message-State: ABy/qLYst5O59Nno592Eg+nZWZGVuSIY0iC5RpKFeW16QXTb4QtkDRyJ
        dOspbjJxHkAhW3fULEZk+OYMdA==
X-Google-Smtp-Source: APBJJlHD5g/pdDFypWkagFMBOYMpMJqGT86QHOcjMvKmPVNZOHb8bVtcsSWxDrKY2x9petM3Rh0m/A==
X-Received: by 2002:a05:6512:210d:b0:4f9:607a:6508 with SMTP id q13-20020a056512210d00b004f9607a6508mr3674568lfr.50.1690970149138;
        Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:55:48 -0700 (PDT)
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
Subject: Re: [PATCH v4 0/5] drm/msm/dpu: rework interrupt handling
Date:   Wed,  2 Aug 2023 12:55:44 +0300
Message-Id: <169096995979.4183272.6945196622570657421.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 27 Jul 2023 17:45:38 +0300, Dmitry Baryshkov wrote:
> Please exuse me for the spam, I missed the triggered WARN_ON because of
> the dropped patch.
> 
> Declaring the mask of supported interrupts proved to be error-prone. It
> is very easy to add a bit with no corresponding backing block or to miss
> the INTF TE bit. Replace this static configuration with the irq mask
> calculated from the HW catalog data.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: inline __intr_offset
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c54b4c35194e
[2/5] drm/msm/dpu: split interrupt address arrays
      https://gitlab.freedesktop.org/lumag/msm/-/commit/370891f0d983
[3/5] drm/msm/dpu: autodetect supported interrupts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf8198cc3b90
[4/5] drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/40f9cedf54f1
[5/5] drm/msm/dpu: drop compatibility INTR defines
      https://gitlab.freedesktop.org/lumag/msm/-/commit/edb34ac1f65e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
