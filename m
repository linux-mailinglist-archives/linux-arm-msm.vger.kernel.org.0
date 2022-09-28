Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9CB5EE7DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 23:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234797AbiI1VJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 17:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbiI1VJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 17:09:25 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1E9F6851
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:04:24 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m15so778150edb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=q/GKAyyF0vF1eWzJ1k0yLeMrfcWHaRkvaCbw2GvKS5w=;
        b=H7SFjs+BVe498MJEl3L9bI5G5W+1u1h2GbtuS7vrhh7P+e05VpYrDNFWp68HOubH9d
         Q/oyVXSpZqMudYWJKw1hR0rNw0iU/7q9vtltmHL+XYsDz8mpYWkSmySMRSMtpwvbxnGd
         PfNzo+l5nF8WRGdAqhEKnszfJW55MkO8O4cw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=q/GKAyyF0vF1eWzJ1k0yLeMrfcWHaRkvaCbw2GvKS5w=;
        b=hQw8LWknGX+GObMvMUJFCj2iMnCXsi5D/rC+W3JwjnsAPCOWlmg6hQK4yo2sfOmoIj
         xnL+EchSkTLh6uaoMbDe4Bo0PWKuET9punIdVSswlkUbbGsyp3o+yKDmt7TufZoIxBZx
         MuCr0qPJnGqGTOnqaS2GQEZY1c/B9XdGhCjB3bC3kOGQssFrxoPz0gs3DUQlGytY0f3x
         1YsitgjpZ3Ag69ri8u+XPzzuaJuSmNYQStH2vVsZ93wjW7khvAwvVvwODu1y4ICShSNK
         W985UBAaKdr9f0gYdzeP32kXyKJcH/9f5B/l/vPbddvxErKVI5Fr8liJK92f/WCqGfRs
         qJJQ==
X-Gm-Message-State: ACrzQf0OfS1EAVVl1CAO61FNJKaXPCZVax/5fcB+VYcSpN5ArpFld1MA
        uaixBaqmAFvtCQtp/KOm9mao8gYDKQjxZ38U
X-Google-Smtp-Source: AMsMyM6Km3A1UfoNMSDejWWbw/OfFbLH/FUIzA9Cw2ph0HH2jCggQujTWR8eMgqACYgrDUuUye/xFw==
X-Received: by 2002:aa7:cd95:0:b0:457:1651:b5c1 with SMTP id x21-20020aa7cd95000000b004571651b5c1mr22473305edv.211.1664399044639;
        Wed, 28 Sep 2022 14:04:04 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id j5-20020aa7de85000000b00455262f83aasm4004759edv.32.2022.09.28.14.04.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 14:04:04 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id r6so4324783wru.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:04:04 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr22712807wra.617.1664399043934; Wed, 28
 Sep 2022 14:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220927112343.2700216-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220927192234.v4.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
In-Reply-To: <20220927192234.v4.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 28 Sep 2022 14:03:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uk8i+JMVEPthpuQj-rNJVzCXaYRrTW4td4hE1JfCDYbg@mail.gmail.com>
Message-ID: <CAD=FV=Uk8i+JMVEPthpuQj-rNJVzCXaYRrTW4td4hE1JfCDYbg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 27, 2022 at 4:25 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> evoker will have WIFI/LTE SKU, separate it for each different setting.
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> Changes in v4:
> - fix typo in tittle and commit
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
