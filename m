Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC797316A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343611AbjFOLbm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343626AbjFOLbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E893F270E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b3424edd5fso25863391fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828698; x=1689420698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5T8GgYIqVudWlnsC3oPDKoAyLE+QLU/Vc0UJQqOQEms=;
        b=asxgBI7ZjmLrmbZmvFQpyF/5eFUTJQWWW7xKqJqFCtjlsV0LV7ZxW7CJ9oqI4vd0oj
         4LPzImZ6wWupg9kgiUwvnSiwoBPIXTKiBAlXZx9T+p+A6Gt2dI9hArmwyNxiZeqpRw22
         QHWN7auMbRPeq3+WXysgOGpLScuvTkMZeJ05E1bEix8FIVKMgOTvVGSEfk0g4JiqnBIN
         RpL64eej6Q3bHM9J85d774/erJNuo6JMCRRf4v6ei65hYaWmxP5QRZfCZVDQ0m8LFEIT
         gVA5mQIlskllXR1VRwp2V/3xjTd6wlPCgqTxGKf/7pgiFUwE+bn39vHttwfqr7toC9wb
         Adsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828698; x=1689420698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5T8GgYIqVudWlnsC3oPDKoAyLE+QLU/Vc0UJQqOQEms=;
        b=fHZ9jD8XmEOb8jZknBmZA+beI4rwBRWCk3tP0lwdcUlPZ6YKn6D5qz4LQB80dAA8Fq
         A2HGOCW+iXgLvFbWMDm4d38TimGIoEAJbMDrMd76G3V/wK5PAd7nnBQqjpZHATrHVRYl
         wqaUGti33wTtBrJvChO+cCqrh9s8O430oHGbwnlgTnYUoB1+JOPqyUFPPNBNLC51Q08Q
         es0YH3Kzh23CT/WXc7cxokyMxn0YWUbUCtCbvmnH/VCpb9uYkSur+bqyKHsPA7GSXBSE
         UoTIOOTnMYRcrFW1EKedHwPaPBe0+DiuuiOHzc5wcI9N5v0dqMJnONK/m2xmEBLreTfZ
         7Ygw==
X-Gm-Message-State: AC+VfDxjIRMKIX2tGsYiLTnvnm1rlwC96/najrshYtZ2kC7ZLNTZm/SK
        VA5Bvc1uoDzkNZuJ7QRc9/LG6w==
X-Google-Smtp-Source: ACHHUZ7anJq5+jo+HNiZTaLF+2RxcGBAkP3TUmnIjwSU0KcnYb1vyWAXaCDG02wduM41vfWbpKYzEQ==
X-Received: by 2002:a2e:3c0a:0:b0:2b1:fcb2:3029 with SMTP id j10-20020a2e3c0a000000b002b1fcb23029mr8451714lja.28.1686828698241;
        Thu, 15 Jun 2023 04:31:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
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
Date:   Thu, 15 Jun 2023 14:31:27 +0300
Message-Id: <168682860387.384026.8615794645993103495.b4-ty@linaro.org>
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

[06/10] drm/msm/dpu: add support for DSC encoder v1.2 engine
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8c4094b275f6
[09/10] drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0d1b10c63346

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
