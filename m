Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BF5671095
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjARCG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjARCG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:06:28 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464AA3FF32
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:27 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ss4so72541863ejb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHSfA1oXDaE/FU4E9HR36vol4vPeD8Mhirv4zCQzcxc=;
        b=OPk9ugaZdL99dXsw8gAtQuCpXq+2Sp7VbOcevQECf2grzH2Y4bJUZWuvovb2ITH1HD
         RuXQ9kI5r2N+sZZCwmJjjav46WA48btEh3yiqccF9jo9hn+ICkRg1D3uiTnWaAaNi+vE
         rur2Dh/MYNLvDZdRoB7NfvSRQBFDSY5KAnnjkMfYEoWYeTruwL/K93rBEBn4NMIo8Fht
         SpeiCYCJB5Pf/DCa7baJm8XGfar9GqReQBowPMYVBT0Ixb0iYGVFvGYAtb7Khrw2/gpb
         7BOfSfHPTYdlyDn7P8aLLPzl8vpDWrWLFvQDgWTvMpZyklAtwdqp9REnpG6+yBDEKRUE
         EZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHSfA1oXDaE/FU4E9HR36vol4vPeD8Mhirv4zCQzcxc=;
        b=Y9nskJv9Eskaw/7ITFURxJppK+9DHYCso6/SayHwvXeUPpXAMRpBNNf+ym9Rd8lFRV
         SptDfzEWp/MA1g/qTfWIEOu1/RTLyr2Nv3wVg5MC5Q2YUrmUJhZOW42blU3cp4MatvSm
         PIDg/idvQsot6xVE/H+zU2tarvStsAENkZ8VlA4ivL4xE62rgnyrzo32mNfcnVk/Jj9R
         BzgF+jiqSeO+PdiJ1PzztlqLG6YmHgZPghHZUY3Iv1Q9tP4RF04KBptdaoKkjDqzFSQh
         rJqMZO0qvOt5KeJOypbTHBCLNuGZBB9CoZlUjNMObqImla0s7l+2PA8/XXsfR6Md5X7J
         /2eQ==
X-Gm-Message-State: AFqh2kpRCSG1SDKKzTpVJREiODMGQwzfZVAgxm0XbhuTBTKNZg5UAIDP
        yi0M21XbeFGtGl+dz9wn7fIyVg==
X-Google-Smtp-Source: AMrXdXv6H0AyvXgNdKVOZT6ptngzqjVTe7RIPAWc/AruVWvl3CNh7mCChhz5F9Jl4JjaZra1OUYsxA==
X-Received: by 2002:a17:907:c712:b0:7ba:5085:869 with SMTP id ty18-20020a170907c71200b007ba50850869mr5622238ejc.9.1674007585894;
        Tue, 17 Jan 2023 18:06:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:06:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
Date:   Wed, 18 Jan 2023 04:06:08 +0200
Message-Id: <167400670534.1683873.14691625332379089234.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 16 Jan 2023 08:33:14 +0200, Dmitry Baryshkov wrote:
> SM8550 uses new register to map SSPP_DMA4 and SSPP_DMA5 units to blend
> stages. Add proper support for this register to allow using these two
> planes for image processing.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/80ca10dc64ff
[2/3] drm/msm/dpu: simplify ctl_setup_blendstage calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/644eddf9f166
[3/3] drm/msm/dpu: simplify blend configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63e3386b86d7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
