Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC094C9A87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 02:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238926AbiCBBjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 20:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238927AbiCBBju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 20:39:50 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F2FA1BFE
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 17:39:08 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id j7-20020a4ad6c7000000b0031c690e4123so292167oot.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 17:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fqt2epDNXcKQewfFdxGKfvnn/9tl7eVXMmiDlO3ZPK8=;
        b=fOCi9Mgnwlbw6J5alBDE2zd/lnwvO3wz23t11dliBc/FjSZZB3F4vqnGSw27uhq9tw
         NjaktY1TxO6e/8ISJ7bF/EWiZ87r/9z6xUY3mq17ssTT9GlFT+7xP0cuHVNahEdnwWng
         nGrTY28QLVoXSYCngqgpnNGk4uHiTPlwrz9TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fqt2epDNXcKQewfFdxGKfvnn/9tl7eVXMmiDlO3ZPK8=;
        b=I9VYtu+jSf9lf0EghsZq67vjMupj1608qifiiFuJlOxI2fObIR4Iht/Zl0BUJwqfRI
         Are1ga6E2ZFiHOwnTPv4Nk3lY+3J2Y9lLA+srnGSgbUMxlAnIdwMHu+aLCmIpYmZoiJS
         bkoyym9xMuKBQltUeoGLMqFTMZPR0U7lKoXhH8eK5kHaDBADJVJerH3lTAW9TTKfB0LQ
         I03c4ryFJ39x8kC8aBpEzwyQCOFCr0+8wEW71sXQNI6sfwGulXdTkUwY4oAmBVP16961
         tCgD9kRUJit1tgvZa96iRfmzm2mVfoaKOm3Wy9cf5zrjxSbEV6pg3vG8Rv4r5m9/W841
         7I2Q==
X-Gm-Message-State: AOAM530RNrFAU2MOcDZUiErIBlVk62+rRbAe8n9PTFoxm7EWvcydleLf
        U2abFArxsaYKVFTn/JzJj2shqk3sAuleNMajQiMqmkYnBnk=
X-Google-Smtp-Source: ABdhPJwIYeV9qvIuuF+oMC8rqQlRHkPEiEqdWv89wTOUckhcNCXV08k84Gj0mee+7iuOh0/gleLfanoMttTHMITMtUo=
X-Received: by 2002:a05:6870:42c9:b0:d6:cd4b:1e2c with SMTP id
 z9-20020a05687042c900b000d6cd4b1e2cmr5968203oah.64.1646185147656; Tue, 01 Mar
 2022 17:39:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:07 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org> <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 1 Mar 2022 17:39:07 -0800
Message-ID: <CAE-0n51dR5i3X7kLbvsLrpvwY+vCS3tDGcEXHF+e2kD_cgxyJg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm630: Drop flags for mdss irqs
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:07)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
