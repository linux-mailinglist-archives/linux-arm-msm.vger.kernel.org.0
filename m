Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B064CC895
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236785AbiCCWHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236796AbiCCWHc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:07:32 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F8B172E76
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:06:41 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id s5so6115776oic.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=r7kKCHWz3Rfv0TQHHwtEWE4mf+UhKdYlq+PNtd3O+F8=;
        b=Z/JYd4+V376HcbtMkvRBhrUgb5bIqQI7F34q31nMVDyB5DKCMuF39gIVI7GHkLnK5z
         xwecd6zPlWqMWR83kkWkOdDZRbFCWNM5KowBFcTzELnIZyrazGRjk+9YjZMMPeCzfSen
         Dc4coFcuRY/XfS2qdlrDgBfiaAjeb+BrfQnDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=r7kKCHWz3Rfv0TQHHwtEWE4mf+UhKdYlq+PNtd3O+F8=;
        b=NmIMAdCZoi2GsA+tkdwubaVPVSFgyeEoPeV4sn3MpS0rIVYJC4BPtPFrfkNC2XQFg4
         WrY4AKiuzWtsfSDF3V2B+hcdrOi2wb/XgJ5RcA4z1shxw0DV+xUNDboCPv1QN/4vYXqx
         UEiWZHhcsTBUupX6GF8PXCFtSO24kFgzxuuG2AKR9ZUUvulvkY5VXCtKcmV7u96rWtYu
         AbBcan1b4RzLchdA08dhLopc5yBhFnH6OU6ArmCdOtCRbzN+W0AhFM/qh60Qafd4KIdO
         k5fP/fIOxmJpkE34IfzljQf39obp1h3DzZJHV8h66GWDEQbATXMam156BYEnQ+9ry8xh
         IH+g==
X-Gm-Message-State: AOAM531Q7ha/ZgcOoWH5CHHclca5uoOrPN/w6WYOzfk2TaTfxLpf+syB
        Am4jXN8PiBY8R5Icwg+oFAxcTndXnPvyHGIPWoUesA==
X-Google-Smtp-Source: ABdhPJyMZuWL+CCeZIqQWqg/RiahdrvQ8SCiVP/B4EwHgyJoeXa1tCMmS59sHA3zE1RwwWN0mnFkZj+JMSwmHPiUj3g=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr809414oiz.32.1646345200874; Thu, 03 Mar
 2022 14:06:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:40 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com> <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:06:40 -0800
Message-ID: <CAE-0n50sRHDaBdKADrqXMR1Dc7s=Stj_eY3Go=VPTTHRHtiUPQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-03-03 01:40:01)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
