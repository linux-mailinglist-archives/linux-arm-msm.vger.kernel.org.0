Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64CF84DD1CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiCRAOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbiCRAOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:14:21 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED6415DAAB
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u23so4412522ejt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivABL/zW17W3xsGsFU4NNFD2vIhj9kJM89ziwsXeP4A=;
        b=I6jh5qUUAfPbuFRo6X1vzR4jyxk+Jwj+tM+hcWGcNJ80NKQdHD3dt4WyBUnPLaQ43u
         fY4hRGaRDpfdxsttq4ka6QQ3hsN/FLOiF/BWyTy1eAv5/n1k20hVkDNHY/wy2ucHyIUT
         LyPuzoXHOq8/3MYayGZMQIPpAv4JbHhGQwbek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivABL/zW17W3xsGsFU4NNFD2vIhj9kJM89ziwsXeP4A=;
        b=Wakj/Fyl6KB0egVAvAU7eCTLJ8783EgR0F7QXzKEWA5fShNvJrk3Gj4P8Z0t3WoV83
         iv2vLWoTohomiP7xf3rGaKDGjN1CL1HebErlhXBQpUn0UzrfGSwBP/7rKiKxCPKO6KY3
         4MHbe7hHRUnFdrecO8McdNS8dL+crS0IYdCrHIHxBPxEqOhPmPyHPEMGueKiv6Z/LpDU
         ODorgOJb0lCyjiumj6ghzC8RIqL8x4mn8HV4MRCO8KJuSQ/uEH6IqKYqLn2qfOsFUP+N
         Q10fzy0hDrFAHA+XiVmY6dvQQNXdoFMeWGRlej3JT5qWGrdLkICOElCF7n+LmN1mKhZU
         YTow==
X-Gm-Message-State: AOAM533ijVDiLZ+vdxS7cK3kj7PUpmkfx38sWCcB4zpxWqnHrrREuq56
        XhVHFP/3ZkPRbPBwc5M7/ftumsSXwKVAywcpROw=
X-Google-Smtp-Source: ABdhPJwvNOQvJMDROgDs9iz7rLck4Fity08/C37KvhKFv/z5nv/snmtGpWds202Pfh9ayGb9yRrIWA==
X-Received: by 2002:a17:907:3f9b:b0:6da:6f2b:4b1c with SMTP id hr27-20020a1709073f9b00b006da6f2b4b1cmr6506076ejc.765.1647562380623;
        Thu, 17 Mar 2022 17:13:00 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906c00900b006d4a45869basm2972301ejz.199.2022.03.17.17.12.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:13:00 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so4025253wmp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr5932331wmb.199.1647562379575; Thu, 17
 Mar 2022 17:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com> <1647269217-14064-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-5-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:12:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQV-2LTmVEPuJJYUhTpBT15A1fKAsRbZgpni8rGNNFsw@mail.gmail.com>
Message-ID: <CAD=FV=VQV-2LTmVEPuJJYUhTpBT15A1fKAsRbZgpni8rGNNFsw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sdm845: remove
 assigned-clock-rate property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_kalyant <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
