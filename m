Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958825A6A5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiH3R2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbiH3R1i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 13:27:38 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E021153
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:25:06 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id p187so9811085iod.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SmSdpqqfvhuzBeG/p+7mNhDOexI5aI2aAxoNsJihLIw=;
        b=MwDNBXN8YnULPfgN5yg8hA/ERoe4PKJ3NdV4H3LBuK3diQMkKr9cIVUpBkhp0GFul7
         xFM3eJ+klfy1CjKvDD1Do+ILnhEFPDprBhHlJ3Xr7sCEauXpNsnplfq6tPGAs3ejXHNH
         8lfx2cndEqpo6Na7ga1peK96Bzlgck8g6Ahbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SmSdpqqfvhuzBeG/p+7mNhDOexI5aI2aAxoNsJihLIw=;
        b=7AHc0MJdQ3tA9phL7fOQKY41jHyfKolq6/OKH4rL0t/fLwVfY5PctvgRl3t9941AqP
         4+ZoSEGn9lzfF9JmjbxbfC4nyVTke2Zv/FdFjyu/1DNg1KgZ83YFay4Scj0uxMlG1EV5
         bWkDJqKYxJad75zuuIYq+h759Qu2PjN5kYJR9Ckugf9j7vvIEzdybiHtb41oxYD6lyaO
         57DB4zt2HKAjpRrMw6bn0ekUkgU/OU/yDkUXnTqKzq9QCO+lPShwvEahkpavb9YKZuCY
         3T+LAhv8labs2zzULUHRbKyFTouG3aBbgQxyL5MhensvDRG0KWco8FWvBHUFH5sGRcMX
         sdag==
X-Gm-Message-State: ACgBeo1Zp4cVOAdW1YBXl1YAisATIcmH3ZONFpqlMXW3iqUI5Hl1BuYM
        ojFGyLlmFVpy0RykMGu4W6zHU0WB1cRbg06j
X-Google-Smtp-Source: AA6agR4bSsSQ81IZY95K/KTXjG2i0EmU19bH2UX128js1mSz+AqYlmGyEd7F+mf2HzEVpvWcdTai6Q==
X-Received: by 2002:a05:6638:4704:b0:343:49db:f1f4 with SMTP id cs4-20020a056638470400b0034349dbf1f4mr13200082jab.204.1661880237292;
        Tue, 30 Aug 2022 10:23:57 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id p8-20020a92c108000000b002ea9d1b0102sm5626416ile.39.2022.08.30.10.23.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:23:56 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id n202so9813359iod.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:23:56 -0700 (PDT)
X-Received: by 2002:a05:6638:14d0:b0:349:d176:d376 with SMTP id
 l16-20020a05663814d000b00349d176d376mr12105487jak.58.1661880236045; Tue, 30
 Aug 2022 10:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220830053307.3997495-1-sheng-liang.pan@quanta.corp-partner.google.com>
In-Reply-To: <20220830053307.3997495-1-sheng-liang.pan@quanta.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Aug 2022 10:23:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXV4x-Hpa9-GUzkwS+cxfvpL93HBCUrn_bvMK8hBAaBA@mail.gmail.com>
Message-ID: <CAD=FV=XXV4x-Hpa9-GUzkwS+cxfvpL93HBCUrn_bvMK8hBAaBA@mail.gmail.com>
Subject: Re: [PATCH 0/1] Add a new board device tree named 'evoker' for
 herobrine variant.
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Aug 29, 2022 at 10:33 PM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> This patch add the initial dts file for new board 'evoker'.
>
>
>
> Sheng-Liang Pan (1):
>   arm64: dts: qcom: sc7280: Add device tree for herobrine evoker
>
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/sc7280-herobrine-evoker-r0.dts   | 333 ++++++++++++++++++
>  2 files changed, 334 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts

Just as a heads up, usually you don't need a cover letter if you're
just sending one patch.

-Doug
