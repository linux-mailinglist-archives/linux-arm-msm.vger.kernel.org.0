Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E83A532906
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 13:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbiEXLap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 07:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236672AbiEXLal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 07:30:41 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD690880D8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 04:30:39 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id x7so11275186qta.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bGLq4W32TEzpUZBXnWRpdyd7/FBRGgFvTqPNT1jEfoA=;
        b=OAKqDk3Zf2X9iX5TDmh7ABpCDzVGMUrpUY8i6x6nJcwoF12F3W5mAEj2t6xv93hbYo
         SvZnm8yU58A2KMSqCKgsdkPWHTmFO3UvANgtMFVocPMJjBCD0RYArw+Sy6P/NnWM6gb+
         ihqbRdP+zooyMawnQUTMNCamUE5z+YXZx1552uiZbUDlzzWCpj4HnqUx4hRx/IXA1Rm1
         GiAhUUo0rV41YOoBdkwhrYkuU6uuUh6G4KaQVc6aLMdIcxF1ABvti9SSrLXXNuvrqMga
         9Ax5oakjTNn8gmAYKrgJVk7GMmLq5D8gtAURyFnoJVQfLbT3YXQCtx/dAKBVDECSxjkP
         Rn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGLq4W32TEzpUZBXnWRpdyd7/FBRGgFvTqPNT1jEfoA=;
        b=La5J5HkJH02bjp3KDv1Hw1fhEs2gnfG/23ms7C0LtcRdknzweyqltqysq3FKgwfrsj
         U/xZdi0Io9jM4K8rRC5uat0Lg9YYZqkZBF1CqRMMf51+syDp4ybX1mjLt6s4tqHcUDLh
         p5fqSGh0QuU1i3LvXDYyBG1A+xt9BQ6qOnw7hFqGeHR2BkxDDH+AgfjSXJJ/fd4CjrAS
         9xmF1PB3xDxKB/qnXLau70uRVGzwV3/VKS8uvQcoa5B7ZMjyHNudWYLNlGowJE/L4lhP
         c+SkyXNTsmjGxUNxks2HyHazere2Zx7eSBomtAMzcS/V7RTAlsehqle8c1engbeYTuFk
         c/dQ==
X-Gm-Message-State: AOAM532XOJ/A29/Ma75fWMZG4MOLYSDvFP9TXjcBQ051sAjwBJnvIxi8
        KBOOEzPPJUHI3+oaR37zTQH5FAZAUzxkAcZkhYYTjg==
X-Google-Smtp-Source: ABdhPJzWUliZZ3coRed1/OyusyZ5AuNUEzDPp+9amUhMmBiouK3cjF+RoHYC0NtfjmsJyLr1LVC9fSARx4kUKXhxdD8=
X-Received: by 2002:a05:622a:188e:b0:2f3:dc9f:946 with SMTP id
 v14-20020a05622a188e00b002f3dc9f0946mr19907509qtc.682.1653391839062; Tue, 24
 May 2022 04:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220524103534.2520439-1-vkoul@kernel.org>
In-Reply-To: <20220524103534.2520439-1-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 14:30:28 +0300
Message-ID: <CAA8EJpp0F+wP0Uoz+i07f0C1H4UJVdJdPrFquvGUEMB8gQUu-g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/disp/dpu1: remove supoerflous init
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 May 2022 at 13:35, Vinod Koul <vkoul@kernel.org> wrote:
>
> Commit 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in
> encoder") added dsc_common_mode variable which was set to zero but then
> again programmed, so drop the supoerflous init.
>
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 51f24ba68375..388125c8bda1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1798,7 +1798,6 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>                 }
>         }
>
> -       dsc_common_mode = 0;
>         pic_width = dsc->drm->pic_width;
>
>         dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
