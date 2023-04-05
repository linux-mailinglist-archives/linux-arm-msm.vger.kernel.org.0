Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2E86D7B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 13:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237291AbjDELie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 07:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237215AbjDELie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 07:38:34 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9AC3A9C
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 04:38:32 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 20so36995292lju.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680694711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=378I/gGZlt8XUX5v0VEtIxxbJng/T1aUDlAEzlMMcMo=;
        b=K+TH1p9OQZgmI9dQubTs+egT3pRWY+Lpl3EeU1AX7BLJkeIuKwuvuMT2EgjyLdn46r
         MTssKlRaFBhVvVhW830j/MP4QWs6SiY3mSu+FXq+KA2OXXTdmCE6cIeoFAHmqqgYHOVq
         Kh+dVIMN2QEmtWiZtqRe17Qr1sjWCyUCsK8n7PusEQ5iBOo35a9SSA76SXWsz9lgopJg
         M0J6UrwhPs0bm+hMRezXpugxb4c0IcaODV49ZUde3/Ay11jybapgYXfIJo1ceLLLyN5m
         XbIYWIMhFOKkUroEcaSMRAj+rxcBwPnypjslHTR/V6x9nA0E//q00u+FAemPppbXDzLb
         rC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680694711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=378I/gGZlt8XUX5v0VEtIxxbJng/T1aUDlAEzlMMcMo=;
        b=gRpHfDkl0GX3OcokAzW4TpvTyZGCmR74yAmEgIChgBFhOElfJANmSRiiMuRrjgeOxl
         6GYC9VSYCqX3htaYMbfYHOdDaYMrzM4Sxhptjtgl/2jvS8r6uvGV9yjwIFCJd3nKkp7c
         JSIVpTVv1nhNjxHDnJc6M5Khzs/vWpFSkHCMtTBuO9vwbz4KhuQMz0M+ktBLVgwHAXXD
         mS/9LjjA3vGwJNP9qe+9rksRXG4Pp9KJEBOJLztTDtn9RSL1ZZOGrV43qPq+qy4ZojhA
         un3k/B60Gkub3uGyyGTFlk/LSXS04kuq/tvfg5RMs9aMMmSOmwwXv1NkfBygLHM8u1aJ
         VRxA==
X-Gm-Message-State: AAQBX9d+HfNVON8ZXHiN2hGdiRawxvudnGWItRXEmojerYHGbk4IW0in
        f/w41CTY4hoyc56D6SsU+N2ueDb7/pUV3Bv6h8c4mg==
X-Google-Smtp-Source: AKy350aShuFWZOnsO9uiMPtmd4KhuD0q/HPao2SXlOdTQ2JBpssmhXtALI05z1DLB358PL1P//dxeg==
X-Received: by 2002:a2e:3812:0:b0:29c:d6f6:8c4 with SMTP id f18-20020a2e3812000000b0029cd6f608c4mr1680050lja.16.1680694710858;
        Wed, 05 Apr 2023 04:38:30 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l15-20020a2e700f000000b002a2d7a460f2sm2806492ljc.116.2023.04.05.04.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:38:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
Subject: Re: [PATCH v1 0/3] Fixes for PSR
Date:   Wed,  5 Apr 2023 14:38:29 +0300
Message-Id: <168069464072.1851814.16480389656681286482.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
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


On Fri, 31 Mar 2023 19:28:31 +0530, Vinod Polimera wrote:
> while in virtual terminal with PSR enabled, there will be
> no atomic commits triggered resulting in no screen update.
> Update the dirtyfb flag into plane state during atomic check
> to flush the pixel data explicitly.
> 
> Avoid scheduling PSR commits from different work queues while
> running in PSR mode already.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: set dirty_fb flag while in self refresh mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ddf5387d1fb7
[2/3] msm/disp/dpu: allow atomic_check in PSR usecase
      https://gitlab.freedesktop.org/lumag/msm/-/commit/86c56ba51aec

Note, patch 3, which solves a different issue (and which requires additional changes) was not applied.

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
