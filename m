Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3525B721458
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjFDDCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjFDDBv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:51 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F41B19A
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:49 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1b3836392so22034861fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847708; x=1688439708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcGhYz/GqIb+yFcR8B4hKzr5pr9rXSrjVBD4SlqsnrE=;
        b=Zv3/BBsGcwLukJLZO3LSHweFQZYg9cTsPw8LRuk+ZqfobsgDqWyaucYc8/f8EbwSOL
         VSrX4AiADBJlZMaokz4kMujfcJ4tF5yleTCJI92hcwvQlm9uWA8rxEZ3Vth1AZc69QtP
         nz94QMnnpnEo35e8Lz3C9H/OyKamd6nm1BmRdtN25tjbNr4oQ8x4vK49d74lnDAEB63e
         Pw6z5UTiiUnml0TePZZ2juCuEA356+MtriTXFz0XqCMsFap4rKrAdzzSPKIgTGTQm3xq
         vU1UAkhju54i7xmq/gbI56MiGbb6s6/olIRqO0GvlPYyjnz3SF+OJuMRtS4j95jNjTHT
         fvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847708; x=1688439708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcGhYz/GqIb+yFcR8B4hKzr5pr9rXSrjVBD4SlqsnrE=;
        b=czQpgNkE944Fm7PBt8tXfDBkRMvANTJIVDZW01LLJTGU3t9GxdwoZ7+fm7wSgwXM3s
         PMuuIPSmtMhnhy8MwswKZwomKP+yQyAgVI6LRHm/Cr2MyU8CL8ojbmPjycRKrsC5gxOQ
         89bSRQ7ACjuP2592h5yNe8HbUWHr+0QRRL6L+y2u3TeLzKegFp7NE3GCjy9sDgulErIy
         38ZAF3NCnPrMcwIC1ym9kGZLXVaYC1JAUvXugTWlkiKCAgUknSTKeVfsksvuYUkJsWX8
         E0W+t+ygpU0egHI0krjvDR9JSj/ximwat9MkNO35DKpCB5VUl6z1nbW0OO7Akx+iBsFS
         uJWQ==
X-Gm-Message-State: AC+VfDyvZ9XJQhGwjBLaKB2wp8QqdEASLI5r5hCxS8t1NlxtNeEP/D1c
        PzjdgqpK3IXFlKzDgeWQkU27/Q==
X-Google-Smtp-Source: ACHHUZ4SfNbgTZKyGk6FqAa9TvMRjdCgeW4TsPTcouRfvtyz4sTlPpSd7yDPXdHm/dYZ1usaVDJfow==
X-Received: by 2002:a2e:88ca:0:b0:2a7:98b2:923b with SMTP id a10-20020a2e88ca000000b002a798b2923bmr2133995ljk.0.1685847707856;
        Sat, 03 Jun 2023 20:01:47 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 00/10] add DSC 1.2 dpu supports
Date:   Sun,  4 Jun 2023 06:01:36 +0300
Message-Id: <168584750429.890410.6494391603289067266.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
References: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
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


On Thu, 25 May 2023 10:40:48 -0700, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/
> 
> [...]

Applied, thanks!

[01/10] drm/msm/dpu: set DSC flush bit correctly at MDP CTL flush register
        https://gitlab.freedesktop.org/lumag/msm/-/commit/12cef323c903
[03/10] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit for DPU < 7.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c20c44403e11
[04/10] drm/msm/dpu: Guard PINGPONG DSC ops behind DPU_PINGPONG_DSC bit
        https://gitlab.freedesktop.org/lumag/msm/-/commit/108ff1417795
[05/10] drm/msm/dpu: Introduce PINGPONG_NONE to disconnect DSC from PINGPONG
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d45be1ccd330
[07/10] drm/msm/dpu: always clear every individual pending flush mask
        https://gitlab.freedesktop.org/lumag/msm/-/commit/625cbb077007
[08/10] drm/msm/dpu: separate DSC flush update out of interface
        https://gitlab.freedesktop.org/lumag/msm/-/commit/761c629d1860
[10/10] drm/msm/dpu: Tear down DSC datapath on encoder cleanup
        https://gitlab.freedesktop.org/lumag/msm/-/commit/997ed53dd693

(Omitted patches 02/10, 06/10, 09/10)

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
