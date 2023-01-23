Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC6D678973
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 22:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjAWVWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 16:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjAWVWb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 16:22:31 -0500
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA0738E84;
        Mon, 23 Jan 2023 13:22:29 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id s124so11608107oif.1;
        Mon, 23 Jan 2023 13:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km5MHBFg3WaIEODkOycCfdgVcNvfUAMbE+78TwtWGJk=;
        b=PLOYgQMOFuKbD5p4Fld5VsaoClzdY6k9AgiecTSjUzo3xFC428e8N/YJc+Yd8+ryRz
         aTv0cKhWih9b95H3TZkRfEW2wGSUexIbHeKS9jcy0oBdGp8DyZS0NeZvQkgQG/YfLx/S
         Z8OaTk7kkvuJ+dVmNst5Rf/sFpAnniY3m3GDnhRJ0Rqc+mv7J47XGcXV/8i9AkGXUtfL
         bG0fQt3QdhkrJgKw1CSW+73kU2quKGkm+e4uF4gBMo5bgSWTTOwVTaHyb5tYkX0Pj8dU
         QSo5JfqEoDqLC5I/aK3bx9/aW3u5TYzInmjSGeMfnEljufFM+PwWCUZ2jcterVI/3MHz
         OuoQ==
X-Gm-Message-State: AFqh2krlHOvEPGhUpG93B7HK7Ia/n2BrqyoeFAeaippR5304n8+aolZP
        R8LjMNZZXPZFSyU0kbB+vQ==
X-Google-Smtp-Source: AMrXdXuZaYIcuyOxhHXh9+FUI61XRC36OTfJwV9ek7v/xiD+F6Kk/85rE89xiM1B8FaUhRAbqKN3wQ==
X-Received: by 2002:aca:1a19:0:b0:363:acf4:7f3f with SMTP id a25-20020aca1a19000000b00363acf47f3fmr11030730oia.16.1674508949227;
        Mon, 23 Jan 2023 13:22:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i11-20020aca2b0b000000b00369a721732asm189207oik.41.2023.01.23.13.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 13:22:28 -0800 (PST)
Received: (nullmailer pid 2662050 invoked by uid 1000);
        Mon, 23 Jan 2023 21:22:28 -0000
Date:   Mon, 23 Jan 2023 15:22:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,hdmi-phy-other: mark it as
 clock provider
Message-ID: <167450894751.2661990.692858765334564400.robh@kernel.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119132219.2479775-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 19 Jan 2023 15:22:15 +0200, Dmitry Baryshkov wrote:
> Eventually all HDMI PHYs are going to provide the HDMI PLL clock to the
> MMCC. Add #clock-cells property required to provide the HDMI PLL clock to
> other devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,hdmi-phy-other.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
