Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462244B7DA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343721AbiBPC0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:26:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343691AbiBPC0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:26:34 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F091FB8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:26:22 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so895389oos.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7BR1l6XFZ325W/fTS1Iwv6NfRMJK9vX4L6V6SwCI0wE=;
        b=iNfOoboSPQY0xx/g5HNfNm5DFNXAD1PIAGiZXi8QKrtU+wiD4Um+Fb4HFiRtEDAWM8
         iF0Y8iyrPr8IEvjgLPPoHeiOp0oLN5aRs/c6aWAyeUwmQ0OYF6c76HXOQchvAKocpMM/
         CKg37Vq3gWktBZPRw1CK2cmLzJZmjir6uNr0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7BR1l6XFZ325W/fTS1Iwv6NfRMJK9vX4L6V6SwCI0wE=;
        b=y10oOzmcYIZ4LfqLH6qcAqxT04pAwMPFDuLuet1KkFJwluZoUGBiVFzLxm4Nma/eWM
         /9bmcF4u3iezZKbTk1/TpRb5dSYTJGdCU4/y7MR/zykJKogL3FK0zDCp9M39arMyG7zU
         sil8eeHwbB3nxt74LfidsKFXkLJPwi5oAMrDpn+cRNWsJN0ffZkTD3JniGjmppGYT5hw
         XMkPYJ2ryCijSsiPPw1I8GgjnUCVqdLPIcwTMQU/tc5zQH1l2gmRDewKZIqpIMYsitgt
         5Aoj2KSotdTERxoBPrUq75tMTy9byRZCkWqjFfTcVHI24CfVzTEMllpZWLm0EAnZ/3Bz
         D0Sw==
X-Gm-Message-State: AOAM532zghJWZ4KMn1uIWWD/Odaeizx7ALfKo40vqXNKlxPMZpYDMuQE
        gV9Pv28ls6ipRRMXso5Lg96xnSaCLP4ne0k27SkFcw==
X-Google-Smtp-Source: ABdhPJzKrEq9Wnux2sFV/6iNTo2G3nGrxvVpzAQBZk2YsT+qr7Mn8LoHUl823zFOqdCk7jrYIz2NGtSrvCYuat44Sc4=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr293109oao.8.1644978381692; Tue, 15 Feb
 2022 18:26:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:26:21 -0800
MIME-Version: 1.0
In-Reply-To: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:26:21 -0800
Message-ID: <CAE-0n52GOrRgPQUeP8t_yFNRK1B43AhxBKQgC0MyHr6L2txyng@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: populate intf_audio_select() base on hardware capability
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-02-11 15:23:42)
> intf_audio_select() callback function use to configure
> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> interface. HDMI is obsoleted at newer chipset. To keep supporting
> legacy hdmi application, intf_audio_select call back function have
> to be populated base on hardware chip capability where legacy
> chipsets have has_audio_select flag set to true.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
