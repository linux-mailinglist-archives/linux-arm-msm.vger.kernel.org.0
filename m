Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895316CCD80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjC1Wie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjC1WiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:25 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F1930EE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x20so14160997ljq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FuPPDUcJgL64Qc5i5ibOoN0goVd5i3l12v70KzNl8U=;
        b=er9het2Lu4y4h8jUA4KPhi0YDGkuCCcp2GmD3MdT8HVcWJTIVxdr7UlIdTACH61Ms+
         RSxESLG9/b9PLw/pzOpPELFxkyTFv2MzXlNCFuU0Z3QM7wmM4pSZpwUc4LoUYClTZgB9
         wB2f+ZS/BwHX/Owhm5Jkt7v6PB0BuU964yZjXkhbBhUbtbohKnFJaflwj/9ZzqbSrlLS
         aiTu9RYLMGBx6iNJqkjGIzWK5hFxDwPREmNyrFwr3mOFikjB85JJa4k6ycsqvV2LqDCl
         FbblMCeUOAgBChGbVT22EmRBQjWX/6E+/K+yNv/ts/clcsAb+phi6pALbxjSoROljg9l
         wTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FuPPDUcJgL64Qc5i5ibOoN0goVd5i3l12v70KzNl8U=;
        b=X4eQ5lDtqKU5U1DL99EpDnizhqKByeN/JtG0iqe4xsvKh2griKhyO8t1TJcU3UG8lA
         WUMzzin3T5TUO0f0QrRuKC8VqP3irfR9oGQLlLVFS+ojyhudR9hVNg6jEpLR3t7wBk6y
         rbTWjMakp5VN2/HAL2oN7WWH8AcwAxMeIjNFArVt5qDdGF0+5F7EgG1ESLLDoI/daWDd
         gGZoNg1/WYZCmtER8GzkQCA2Jn8bptm3qjx+PTSc+JQWucnoVPCUATTIGQTjOPRwEv5e
         lSyIUeDog5BEKtfB4Hj4552Cfzl/mQ92Y4bi8+7LZdK2tBL+CsDvHPjyM0IX78Mezcrk
         yjmA==
X-Gm-Message-State: AAQBX9fF8fpRTMA2ZN0miUyN9BtIL5qV5BOGbmO/svd9bgA0Wq/puTBC
        CsDedAbry2djZe/fulPhOAE6WQ==
X-Google-Smtp-Source: AKy350bPbKumo1VlMVHKf/kmOLkRz2OCf8CsDeedL/ZbAs0BUINpS0/8mtGotRdWh1mAdIyWrEZadw==
X-Received: by 2002:a2e:780e:0:b0:299:a55a:f66f with SMTP id t14-20020a2e780e000000b00299a55af66fmr5572861ljc.22.1680043093150;
        Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Subject: Re: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Date:   Wed, 29 Mar 2023 01:37:59 +0300
Message-Id: <168004255457.1060915.6291843271360187892.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
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


On Mon, 13 Feb 2023 11:48:15 -0800, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>   clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dd7904e0f824
[2/4] drm/msm: Check for NULL before calling prepare_commit()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63c3df12d13a
[3/4] drm/msm/dpu: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4d83f101233
[4/4] drm/msm/mdp4: Remove empty prepare_commit() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/191604898585

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
