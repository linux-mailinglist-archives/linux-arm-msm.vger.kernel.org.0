Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46F6543E1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 23:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbiFHVDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 17:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbiFHVDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 17:03:20 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63203214886
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 14:03:19 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e93bbb54f9so28747268fac.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=65dBCxsJ6dC2Uyj0TcbkJX+Arrc/ZeAtploHCpvdkV4=;
        b=JZ2d5sKtFvwhs4lLkMBqeCq+MOTix1afL+PKZNuyXaNU2Vx0Nh3veu47lY06+E1tnY
         sAxPLa+shJV1QjcZ97F64XdSjtiaTo2v91/3tmUifh29co+jCBDsbqs2mIk95p1X5XgJ
         iot2r3NUGDjCRictGzl6QvrCnn3tT1TMpNItg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=65dBCxsJ6dC2Uyj0TcbkJX+Arrc/ZeAtploHCpvdkV4=;
        b=OR3fgTugueRcnIlVv2XSFT76uvn8/SW0gFKSEnvsY3sjkb/UHfsAXNBaUtkfRjYoWY
         wzZaQ75XTth5tpofo7TEPQz/BkxgU+Ghh1fTUIoMtzzNaW4Mv59vBA3Ih7ky2bQPOBBX
         enH6zIj/GS5T4aKEnhfEL9AMiigKxmcAJbTvhvNyDwXo6Or72Zx9c4wdeq+0A7y0W2z5
         o1VHjXHECrcAUtQBW8F843MhdlxgZVMd89yRAOHS+gYMmz0MkCVZVM89+IjEyVrbpsfM
         LTOoCrh+as4OLzZAfCg/BGHOwOtk660kdpSJkRTP9XLPSHjBuuI0CrJ7y4CfLuM7Th4+
         eTHQ==
X-Gm-Message-State: AOAM5321vbYkg8N25wev0ItDkpFp/vpnADDclwoiymwu3SWIXuiDutix
        Efdc2U5GXjR8eVVl1vpShlp0UBEDH61Rq2jwcgl35g==
X-Google-Smtp-Source: ABdhPJyUVWcKxF93dWj/tXelu1J2T7r+P63jOMACN654/la794ZorpfGFI+EJb9tB2lJs3lmxKyb/vuZ2OejEiwMArw=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1766467oap.63.1654722198626; Wed, 08 Jun
 2022 14:03:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:03:18 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 14:03:18 -0700
Message-ID: <CAE-0n52JtdmhtKP2_3Qw=fZV+ALW4qQPN81JgVcV+Xmver42iw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:20)
> The MSM HDMI driver has support for hpd_regs on 8x74/8084: supply
> regulators that are to be enabled for HPD to work. Currently these
> regulators contain the hpd_gdsc, which was replaced by the power-domains
> support and hpd-5v/hpd-5v-en, which are not used by the chip itself.
> They power up the ESD bridge.
> However it is a separate device which should be represented separately
> in the device tree.
> None of upstreamed devices support these properties. Thus drop support
> for them from the HDMI driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
