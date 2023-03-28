Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F926CCD62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjC1WiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjC1WiO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:14 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928B71BD8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id by8so14148826ljb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMXvr4ldGaoMLKgFxzEbhC70jQdRYOcwL2NKARdSztE=;
        b=g8ub7rc/NhXIdRwBUNFa4fvKhu783P1B5PPeqC1IOjSGreMB6OVd7vpmQP9jdEQxt6
         AvIxTKC01UyG0syJ0pIB4ZBUj5oLfgFPgWagPim7k6SJIZgbr07ERJweZG7cV8eunpsa
         bVMAei36lU/+kK2TbKn1SpMBDwZZj9LGiV90QrCt27tOlxrUTJs/K8HsDTfej4o4exUC
         8uHrAzjX6eU0dDHCD1TaQkfw3u/Ny61BHN6yQ+Ro7XlFiRWQkYj3rMXRKlVs991Hs6IQ
         6bk3vV/f1p4ZB/FmMydBqT06XxH7iM964QOvVYjtiNO69azZ3RijWnvaTNxy7Xu5pmlw
         S2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMXvr4ldGaoMLKgFxzEbhC70jQdRYOcwL2NKARdSztE=;
        b=rcAeXY22mRinslKCeDVq1H5nV06nt35C9BdwbohRU36jkfOBEs9HlS0q219HOFTLdG
         mrCWKXiBBCIAEPp3HL8HMsB++0oUIO4w9pE4s77lJ7xXb6W2YTbZv+gcy/uWbSmVCpqN
         IKBWSYM2WK1a4MjOxWK3CR1fahFEy1AdVaOFLJ0P02mGoImJjgLoLJpFqkB1GTVwBLD1
         s7UMUwj/yxWlFOOqyuMA6vvQ8oTB/PE3LbY4FxT2FUjnvbhdI/zPC/1diS+bHhRPpSB6
         E9+oo1wqpOkk89TwiH63XASloWfaAfz5dn/wWHQ2CA731dwagoaQCyp36J0K3hHKd0dz
         GVpQ==
X-Gm-Message-State: AAQBX9e74tyTXoRBQ+FfWhBorzjtMwGfWXUtDvowfDT/mB8OwKb7v+12
        WeGlhyUswk1PH2tx7/7l0hlTUd/OkW72FfL6ikU=
X-Google-Smtp-Source: AKy350aqAslp9vV/FU12wZVxKnQvOaZvbsXVVP/2yQtjnLA/einkNp1Ej7QLuVAWmYih7iXDNAV7NQ==
X-Received: by 2002:a2e:87ca:0:b0:29a:8580:8140 with SMTP id v10-20020a2e87ca000000b0029a85808140mr5299195ljj.3.1680043086953;
        Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] drm/msm: fix bind error handling
Date:   Wed, 29 Mar 2023 01:37:51 +0300
Message-Id: <168004255464.1060915.1769530231444438622.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
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


On Mon, 06 Mar 2023 11:07:12 +0100, Johan Hovold wrote:
> I had reasons to look closer at the MSM DRM driver error handling and
> realised that it had suffered from a fair amount of bit rot over the
> years.
> 
> Unfortunately, I started fixing this in my 6.2 branch and failed to
> notice two partial and, as it turned out, broken attempts to address
> this that are now in 6.3-rc1.
> 
> [...]

Applied, thanks!

[01/10] Revert "drm/msm: Add missing check and destroy for alloc_ordered_workqueue"
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ebf761d6a02f
[02/10] Revert "drm/msm: Fix failure paths in msm_drm_init()"
        https://gitlab.freedesktop.org/lumag/msm/-/commit/35a08e19a1c6
[03/10] drm/msm: fix NULL-deref on snapshot tear down
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3234fe12b3b
[04/10] drm/msm: fix NULL-deref on irq uninstall
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0b5ffe5be6fd
[05/10] drm/msm: fix drm device leak on bind errors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6a44f0dbd141
[06/10] drm/msm: fix vram leak on bind errors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e6091a855649
[07/10] drm/msm: fix missing wq allocation error handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9c6027d5a3f4
[08/10] drm/msm: fix workqueue leak on bind errors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/023691129696
[10/10] drm/msm: move include directive
        https://gitlab.freedesktop.org/lumag/msm/-/commit/110fd0d5b032

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
