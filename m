Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD67763E296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 22:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiK3VU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 16:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiK3VU1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 16:20:27 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F878B1A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 13:20:26 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id fy37so44333636ejc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O/Z8JYSlIL5b/NaGmnUjVRx48qydsMASmxAsCA/K9VY=;
        b=JUEoYyGbYelG/R2BnPlxHeOgXELSGTlwMsJBPpwA13wQ1aBwg4OoDo5gbA/GNmqSZa
         bRcwHS+g5pqINlDo/prC0YD4RAuh6Tu4nU30bB83LRLstoc0/Hlnez//3Zrs/sMVYs1I
         MNkKE3p/oT3+gR+V9Bgg+BY4OJ2g1c1lMCT/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/Z8JYSlIL5b/NaGmnUjVRx48qydsMASmxAsCA/K9VY=;
        b=yImND+vJKX+USzRctHxk/NLiGujuRM4P4fxs2CDxl/aVvBiw0BUCFMvW88OC39ZR3Y
         i6SshbBq5Psx5BTb27kvF6WKzIgkLjpWEEbpItUSqlzZhZial3FAjOEDABRBfyyfnXZ4
         yEFaTFDjTARKZX57LYKvDsBWPejuxWNcuN7gGiMpT9F1V62vZvnq2/IpxWlM8HrWkU9Q
         XrivCKTHkX6+Pz6pFTh+joOdFuk4KKMl4KqFle44YNW187obimjmJL3LiFpyU/lGuSn3
         yHNGu8sarxN09IV7tUF+/8niOT2oUClihqZlqndm6ALeScWXRiO20yJoTMrDxPenPBx/
         9+Qg==
X-Gm-Message-State: ANoB5pn47fw8bCyND+gFhalKFrzLZwiVeBNaZiadtYLoibPY2V/Gn6EG
        wCNtEI/uxRHGO+eeXC/uxGoTcy4chyM45Abq
X-Google-Smtp-Source: AA0mqf49kbWOCYgwxmwf49V4iKqdXckUWduVLNqH2Fq9Z0xFcbY+E3Dkxv2U6IDyxuMCdQ5Rad4SqQ==
X-Received: by 2002:a17:906:71c2:b0:7ab:2de1:2e45 with SMTP id i2-20020a17090671c200b007ab2de12e45mr45689268ejk.422.1669843224514;
        Wed, 30 Nov 2022 13:20:24 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007ba46867e6asm1066337ejc.16.2022.11.30.13.20.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 13:20:23 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id x17so29149160wrn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 13:20:22 -0800 (PST)
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr27787482wrs.659.1669843222443; Wed, 30
 Nov 2022 13:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20221130142829.v10.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
In-Reply-To: <20221130142829.v10.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Nov 2022 13:20:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VQ-NTEOtg7_BZRT8zMrmt0B1FEMxixCynmnCH+aciFqg@mail.gmail.com>
Message-ID: <CAD=FV=VQ-NTEOtg7_BZRT8zMrmt0B1FEMxixCynmnCH+aciFqg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: arm: qcom: Add zombie
To:     Owen Yang <ecs.taipeikernel@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Harvey <hunge@google.com>,
        Bob Moragues <moragues@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Gavin Lee <gavin.lee@ecs.com.tw>,
        Matthias Kaehlcke <mka@google.com>,
        Abner Yen <abner.yen@ecs.com.tw>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 29, 2022 at 10:30 PM Owen Yang <ecs.taipeikernel@gmail.com> wrote:
>
> Add entries in the device tree binding for sc7280-zombie.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>
> Signed-off-by: Owen Yang <ecs.taipeikernel@gmail.com>

When you send v11, please remove the blank line between the
Reviewed-by tags and the Signed-off-by tag. All tags should be
together.

-Doug
