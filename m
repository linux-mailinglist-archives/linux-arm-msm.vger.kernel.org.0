Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419814C34DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 19:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbiBXSkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 13:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbiBXSkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 13:40:37 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C748225F35B
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 10:40:03 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id k2so4149416oia.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 10:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JG8OwsrxHVatgWkESDwLdKHhhAoyBfhLVcqDq6Xl4j8=;
        b=Nue9dIyLnLRe51dVkAI9WgHex7MOMePw8sXd9sVZ39rl9dgLANUQngeIVHGPbKj6eV
         3O1kZoMWMcr61E8XZwkNNSfVhBdJLiHZAiFspq0RiIXI2UqCFSvgde2iSFiEHH28tvqd
         a/Sc0t6/OxUTUQWKB4AllUyv3M9MW1ZPZ/KO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JG8OwsrxHVatgWkESDwLdKHhhAoyBfhLVcqDq6Xl4j8=;
        b=a78b+wsJq+fXyVcsYQqGaor+vgIRxHvpBD+eB9SEmhmYKmnLPTx8jTMt928AtZt5DO
         Hzxp8VBiIDnaGPPvxd1bN1cDCxNVhXKlCNcJ1YjDMBLINsZ8CcYWdRNZhQuaC0mKBXGd
         7JJpfUGxdIZWiVznHweGbkx14Onf4uqrUCHo8PAfPvwaFEj07QPDsQSCmtdOC8g+BLRG
         NeCxVSQ8QxTSXNjCHoBZDpI3vsh/dzmk4uOk4ye2g1Po0aM7wjT6ah8D/HG0PM7RBnGQ
         3ftvMUlV/Z9bDvhDHCTeqmdbUUcLwlEh5NwRuQGkwXy/uZ6Mg1QDb8DBPc7WAL1iTzoS
         gI4g==
X-Gm-Message-State: AOAM530zJum/W4YRM/R5uc484Gmn5iEsoxX4bjw1LlJJM5T42orT2hTB
        lREnF9OEn+pI7Y707rupjYfNjMlRmIHT8acOXzN8hRwgQwU=
X-Google-Smtp-Source: ABdhPJx3XVZBAQZNQYSBRrLu+brA6da/H1Y+gwNqMyQmx/VI8HDEXVpWlfluK1fpgehTBZ551KVTM8WR/64X1gQR5m8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr1934057oap.54.1645728003149; Thu, 24
 Feb 2022 10:40:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Feb 2022 10:40:02 -0800
MIME-Version: 1.0
In-Reply-To: <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com> <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Feb 2022 10:40:02 -0800
Message-ID: <CAE-0n50nMVEG5ccU=m0hNoyPnWvyugjRSXL9hoW=VOxm6+w2uw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-02-17 10:35:30)
> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
>
> Changes in v4:
> -- replace (strucr drm_dev *)NULL with drm_dev
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
