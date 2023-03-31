Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5266D22D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 16:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbjCaOpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 10:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjCaOpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 10:45:35 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6FB1E71E
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:45:29 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5445009c26bso418751777b3.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680273928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0MUvj6InzZLXQQxmjmGO59NHAjC0vDjsk7+Frfxo9oo=;
        b=Z/hDsToqVvIQ4/eMDlsiI9NRhmjHkAqDNmu25q/Q+/6sK5GtKBqZRl7uUpim+c8ZKc
         KQf7fxOyz5daa6dYNVfBaaai10t/CE28EEsg7Uk1n4iqcpi8bj33XMel4ORDD5A2DrOb
         idCPi2QoPeDwhE0qQJ1BMZgb0JkudvpN7/W0yn+DdbavU46S5sZ1V+QS5vAwCatIVo4C
         mibvjDqPwaiPKxK2YyHZuWPg0j8AO+Dt0Ws38nTa5O++BWQr1Ni4PRaKKj659LCvVCNA
         IqGZzAA6i9kGAa0kFkMn0mWms+HBwDeY6ClVrrRidMSny07Dm6fzmm8MkO7XC2AX1gSe
         jP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680273928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MUvj6InzZLXQQxmjmGO59NHAjC0vDjsk7+Frfxo9oo=;
        b=SHZI7ytKhd8BRPzWJk7A5WVbgvQCl9Z1Q+MRO3NYfqldQ7uuFhZwOk1Oy2CQzduVXk
         og+xHIBNRpvVM3NnDqbd6xY0/0MgLU9g3hNxW6UmbUbVzY+9PvSB2aBnV/We8gTJSsSD
         ole0wuArOKgTUBATQEBQt5r1DYTLbCPGJbLkm+mRHXqtKtKA/h22RqsND5dM336sn0yN
         JTCIrIa4L8pvfrzc8hMviV52yedIyug1qevRGYuTLazDPoGdUiT0AFmP4J5m3nL7g/e2
         g2bsFSZZrr8b0C8Ph/TUpjkZC2iUP5ilm5OBqVm19TUZjr2JOehRa39VF8zsEI3rxmj0
         hFxg==
X-Gm-Message-State: AAQBX9cBIvv6WmDPsxoZdR1bojUglzpwQbD7LtLA+7eYrikZc1BqElCz
        viCGaO949HufhPEAaFLDR8ATfQy2PL+Ryuaxu9lanw==
X-Google-Smtp-Source: AKy350YKfTfxSZLTn93/PabzrLMy3cO4bMXqdvdtS7frCg0qBJ1nWyMmjpiUeYSF/Wyv+ZZBUuij7hxKNI9ZCCizUpQ=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr9444843ywk.5.1680273928397; Fri, 31 Mar
 2023 07:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com> <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 31 Mar 2023 17:45:17 +0300
Message-ID: <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> While in virtual terminal mode with PSR enabled, there will be
> no atomic commits triggered without dirty_fb being set. This
> will create a notion of no screen update. Allow atomic commit
> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
> and shows update on the screen.

Will this impact non-VT workloads? If I remember correctly, we added
dirty_fb handling to prevent the framework from limiting the page
flips to vblank events (in DSI video mode).

>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ab636da..96f645e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1158,6 +1158,9 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>         struct drm_crtc *crtc = cstate->crtc;
>         struct drm_encoder *encoder;
>
> +       if (cstate->self_refresh_active)
> +               return true;
> +
>         drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
>                 if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
>                         return true;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
