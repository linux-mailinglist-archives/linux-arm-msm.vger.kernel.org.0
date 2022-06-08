Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36483543E30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 23:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbiFHVFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 17:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbiFHVFV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 17:05:21 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CB222719F
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 14:05:20 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id y69so15831136oia.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VA68tU8Jc9kgWMO703PZLr2L2nKtPtdGngJzNOM+IbI=;
        b=R64J4Id6Un10yWpmLrpwQ9IrFKHeIuM0yd5slKvFvXUBYFTeNDbJsc0DDII8S7f7Np
         yihilvK2WcDSltrO5JTXZwCXSX/AZjO0NzoCuddVOypOsjOlyXpaZ2QTSAmJx73BO4XI
         3gNfMVKMHjSVb5mfuvEMbwIDzI614AuuJuFzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VA68tU8Jc9kgWMO703PZLr2L2nKtPtdGngJzNOM+IbI=;
        b=NDm3gKppKJKxufvhKIcnWZBtmzze1Wze5SfLxVNaw8giyMm1zYNikH4joz/ljd+HfF
         Jeuneh4fwPX+5ByYwU8qi5MhgXJsQ/1DDCH8Zj2aNDDO9eZEwc8oeQRcCxeA2GGSYRvP
         SzXGDTYwnkQ+cZteB22jb4UVaCkzYP2/M75UDL2GU/fJqBQ1g+7YHqwJGbxXEO8QE7QW
         xU1gU5OkaXV5yHXIr5JZKlWPlE5utMAXtuWmUBmYilovcEAlVLWgrrpgnNbGwuQaiguH
         9ioh9R+30pBs7E47StbR4Atq0a0M3C3dYyNUeg1nVnmSfsHzYkL2oe69vsUHq08ZcfBh
         fAYg==
X-Gm-Message-State: AOAM530GXv4UX9/NVeNzTIshrjVz7nS/wYYz1wVnM5cOoz//dtdCQ18u
        BBcGwAD3tc2+zTcupUR7qmWaVjj7tjOygRiT/4vuvw==
X-Google-Smtp-Source: ABdhPJz4xugE9u2X8gXA7bGWKinzkwl5XrS/bCZu4dvnfeiEvjtwL5S+Oche29KAAYjoVEaJe1AqJJnc9xwa8njrK60=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3370939oil.193.1654722319945; Wed, 08
 Jun 2022 14:05:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:05:19 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 14:05:19 -0700
Message-ID: <CAE-0n50eJxs13GObtbOfPAUFySUk0hiCzXKrhF5QrBYdV+vrvQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:23)
> Declare that 8x60 HDMI PHY uses the core-vdda regulator and slave_iface
> clock (this is the same config as is used by the 8960).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
