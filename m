Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6697A5E82DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 22:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbiIWUDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 16:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbiIWUDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 16:03:41 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3E5121E54
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 13:03:41 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c30so455767edn.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QMROfvwPaQqqwGBxEwGan/jO/nMMkjUtia8DhAnWKNY=;
        b=C8KMtT7teJco1xJOXhJGd4+IdEHjTvW90OBnWsyCdahJQVKnVt1Za1E8XxlPzWkdz4
         0Ku7TrQdCY3z8n7hRCmX98D5jLxxm6qAXGFqCCXwMg+pUpVbs+bkHpr6982D2vZ6tLuD
         BHMfzA98bLHPgQtyKF5WBsQCQHtN3/L2PkZxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QMROfvwPaQqqwGBxEwGan/jO/nMMkjUtia8DhAnWKNY=;
        b=RmHxImhXAvEmofHrdnpbb/7ms+LdxQ7DzVu12EqnQ58HIK7zU2VM1ZY0Xins0Wyv3V
         XoYf4nA/g+n0OoDV2wDPRryfu56wjo4zg1j+WZIVPU65VuJ6o1Ppq3CW3VzazJ96hFJW
         3R7kRbILXDeuFU34oBB1K7w2cQZ/OgX6/lr/hEphrNLw1oA5QMT7dcwx3UBtcv5a3xko
         o7C4B5h/9H5x3i7ZdLGZa0YxxRj5nHnQKmiCru05ZIK3Cgzz78x20QSn275FmMEBiMfq
         tPYkpzi7e2XLph+WxlRoSh5Hgan2yLuOdZgC3srDwlnmHIgSfJhhkHwdvJyNrzgAqdsL
         teMw==
X-Gm-Message-State: ACrzQf24hIAvQmwoYaBy0oAaeQ3cP6wvuI8+JOUZVYxIEfuCD+G3vlp/
        CsDzjoeghbIzNZdrNoWgn1kJWq0hSdpcNBr5
X-Google-Smtp-Source: AMsMyM4u6rzkH/QRHx2eNRodZmhWHa5CsbfcmNCErl0lXSAZFiswqTWcwM+3dwGG0sjc0+1lbTaElw==
X-Received: by 2002:a05:6402:354b:b0:454:5162:42a6 with SMTP id f11-20020a056402354b00b00454516242a6mr9831154edd.281.1663963419509;
        Fri, 23 Sep 2022 13:03:39 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090653d200b007824c5fe95esm2760238ejo.50.2022.09.23.13.03.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 13:03:38 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id g3so1465686wrq.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 13:03:38 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr6186264wrr.583.1663963418082; Fri, 23
 Sep 2022 13:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220923094242.4361-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220923174224.v3.1.Ide53082044aac56877c4ff5725777769e377476a@changeid> <3cadff28-197a-5e6c-cbb8-eb9e816e5166@linaro.org>
In-Reply-To: <3cadff28-197a-5e6c-cbb8-eb9e816e5166@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Sep 2022 13:03:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UAw0sSvDpH0e5yKyXLnYiGnxxs_BTWSO5ozKqH0UswWQ@mail.gmail.com>
Message-ID: <CAD=FV=UAw0sSvDpH0e5yKyXLnYiGnxxs_BTWSO5ozKqH0UswWQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Separete LTE/WIFI SKU for sc7280-evoker
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
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

On Fri, Sep 23, 2022 at 5:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/09/2022 11:42, Sheng-Liang Pan wrote:
> > evoker will have WIFI/LTE SKU, separete it for each different setting.
> >
> > Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> > ---
> >
> > Changes in v3:
> > - none
>
> Don't sent the same version. Either fix what I asked for or keep
> discussing the topic.
>
> Ignoring comments will not get the patch merged.

I agree with Krzysztof here. I can't see any difference between v2 and
v3, so I assume that you meant to fix his comment (spell "separete"
correctly in the commit message _and_ ${SUBJECT}) but somehow did
something wrong when sending v3.

In any case, other than the typo this looks fine to me. Feel free to
add my Reviewed-by when the typo is fixed.


-Doug
