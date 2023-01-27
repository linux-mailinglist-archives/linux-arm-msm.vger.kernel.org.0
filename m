Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663CC67E205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 11:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjA0Km5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 05:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjA0Kmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 05:42:55 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F2F68AC0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 02:42:25 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 129so5516607ybb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u0DEsVHKXVwSN3PAjhc49w5MtI6q8p3tuYvphFNkdg4=;
        b=lu0Vvh5MuoiiYDYZUTxh7zbvym4Uj0/v6GjSmt68vqvdxQUf4Buqig6SOOwUSz/XbL
         lO/9cqb+CuVhsufP2wulTnuiRl2uiG2IjcDc6ivKuvFEojix/qo2+3r/N4B5rLofVMLz
         M+G+sJV93/IYHsoiQEjGskyIqr24h0NhIbgHpj6EDrJRAv53piOFjlOE4jHf6GwByA9i
         BKtw45jsb2Zh+Y12Y2TbiuAYQ63uAaP+ubNy0hNZq3JJEttGX7LxkDCENU+DZqPgecyr
         AqPcysVFgoqtLkToozcLuK7KLQqkNqWwT6Yb+2Eh3jl4zZN177/2r+nainc7iIMJfmMa
         eNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0DEsVHKXVwSN3PAjhc49w5MtI6q8p3tuYvphFNkdg4=;
        b=ByfZ/UB/GR3M1+bDHU8xOByUiPS+lghKJc0XeWV/LX+hjBV567wgkKYVWZ8tPAm3be
         Gr15HjTGCraf+XjQwnGnFf/DZaq+k/qipYEL5mjCA0oMt50maxZMAOpGxm84n0yZMGn1
         BL+7Fxz4wOws1SYNtjrcmo+k7ba17TP1OyypvfC/VVQEFMIgJwqBSBW3asSn1sSHMi74
         9NYge44ONVCpELF/FwwyKSdYcDglkWyzlR1myW1cJrTjMxetUJMBQNCOolfhydtkVmL2
         9OfgLQsEe/9VglqKZXlRnNXvezv1vSQ9U22iLycf+RGlhZT5CVaDhqcx8sHKm5CkXHyO
         irhw==
X-Gm-Message-State: AFqh2ko3ZShokvdQo7F0D98La7zYP6vrUbE0tkO1FSairC7CUzW2JiVG
        eKHx2tx153iDI/qPNXL/0EVLFiEH1BuRPkYrS+kIQg==
X-Google-Smtp-Source: AMrXdXt4duFzDFzPIakNzG6OqVc1/XNGxgxhi/nSyzIhtE35B4STzPtFyk5UKGZ1IPXCXqZQlrjy22DL04eJMPVwVFg=
X-Received: by 2002:a25:af92:0:b0:801:525c:6726 with SMTP id
 g18-20020a25af92000000b00801525c6726mr3185391ybh.152.1674816137778; Fri, 27
 Jan 2023 02:42:17 -0800 (PST)
MIME-Version: 1.0
References: <1674814545-9453-1-git-send-email-quic_kalyant@quicinc.com> <1674814545-9453-2-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1674814545-9453-2-git-send-email-quic_kalyant@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Jan 2023 12:42:06 +0200
Message-ID: <CAA8EJpruGSXPDd+wj2vZpRQ3wgk3U+Nvvx0hsP=+U503vQ-c6g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/disp/dpu1: clear dspp reservations in rm release
To:     Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com,
        marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Jan 2023 at 12:15, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Clear dspp reservations from the global state during
> rm release
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing
blocks in dpu driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442..718ea0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -572,6 +572,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
>                 ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> +               ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
