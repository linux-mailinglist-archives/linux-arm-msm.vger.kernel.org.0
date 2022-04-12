Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3352C4FEBB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 02:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiDMACS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 20:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiDMACQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 20:02:16 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC2921A056
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 16:59:57 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id v12so470536plv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 16:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zgyL7xcOAUjOypHELxtMCCquCqKsmj/HjRPoph8p7J0=;
        b=N5j3xgvs/0AfivYhTg39kpBckh9L646vQgUaML9oftFV0OPdPSGk36ue9gvzz8sqkq
         O8NvHN1w+U0ougebclqQgVeiH3WNrPPxJyYP5Hp9PyVwv1hIdQ1Xd4Ln7E4oUMYX4wix
         x/2wgVUuNnY0kEz7jrQP0b5Prya3tG9LOnPcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zgyL7xcOAUjOypHELxtMCCquCqKsmj/HjRPoph8p7J0=;
        b=kRqhtxdDTUEYibBZn6gUFbvwcNUejsxG+I7+ozqhiytovphY3Y8Ajy1KBStEEy2r8o
         pVQfGwhX4WingAwpgTrQV5a83tqQENHLHgA7mvL/ivqv0xZWiXT9Utg+NhwI5/thkrd1
         2kvc6LWyyyOUkb73TTgF265+iau2vUzK/+AWEnR+U4+RGOAwG94q6EbHyNehLYB3gGAR
         Z8B7m4tzNfL+0vI5Gg/E0SDD1aQy97urCM0moGo6fOZP4Noheewx/QmF4avcRKZPNIOA
         1wjpbobwx719JvTKRu9ZO99JXTTuUlXgXKNnITcKi4X3joOw44Z2APYXIoFNzLci8fpJ
         K1zg==
X-Gm-Message-State: AOAM531MwrRcu/Cr5OA71hX2wiyxt4yDOBypyfumC3voXV6TyUCCczYa
        XLtfdFMBWLPb8UWcv7DSwXAhUg==
X-Google-Smtp-Source: ABdhPJzJVBY9h5aDtAUdCACo+XB5WzSYoVMi9TlrWZZ6uaibr8u7hRuCV0vpVGnCZRJe1mXw02WHXQ==
X-Received: by 2002:a17:902:b696:b0:156:b63:6bed with SMTP id c22-20020a170902b69600b001560b636bedmr39940117pls.24.1649807997206;
        Tue, 12 Apr 2022 16:59:57 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:3a41:5079:6f1b:397c])
        by smtp.gmail.com with UTF8SMTPSA id j2-20020a17090a588200b001ca37c215aasm641975pji.2.2022.04.12.16.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 16:59:56 -0700 (PDT)
Date:   Tue, 12 Apr 2022 16:59:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
Message-ID: <YlYSe5/wm06oTJej@google.com>
References: <1649685184-8448-1-git-send-email-quic_srivasam@quicinc.com>
 <1649685184-8448-3-git-send-email-quic_srivasam@quicinc.com>
 <YlSCWC47tITuW/BZ@google.com>
 <9bacee6d-ab44-2975-c523-38164d016af5@quicinc.com>
 <be8c6dae-20b1-3ba1-db3f-119da1e4ebfe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be8c6dae-20b1-3ba1-db3f-119da1e4ebfe@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 12, 2022 at 06:41:25PM +0530, Srinivasa Rao Mandadapu wrote:
> 
> On 4/12/2022 6:18 PM, Srinivasa Rao Mandadapu wrote:
> > 
> > On 4/12/2022 1:02 AM, Matthias Kaehlcke wrote:
> > Thanks for your time Matthias!!!
> > > On Mon, Apr 11, 2022 at 07:23:04PM +0530, Srinivasa Rao Mandadapu wrote:
> > > > Add LPASS LPI pinctrl node required for Audio functionality on sc7280
> > > > based platforms.
> > > > 
> > > > Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> > > > Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > > > Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  84
> > > > ++++++++++++++++++++++++
> > > >   arch/arm64/boot/dts/qcom/sc7280.dtsi     | 107
> > > > +++++++++++++++++++++++++++++++
> > > >   2 files changed, 191 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > index 4ba2274..ea751dc 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> > > > @@ -238,6 +238,90 @@
> > > >       modem-init;
> > > >   };
> > > >   +&dmic01 {
> > > Shouldn't these nodes be in the PINCTRL section at their respective
> > > positions in alphabetical order?
> > 
> > These are not part of tlmm pin control section. These are part of
> > lpass_tlmm section.
> > 
> > In your previous comment you asked to remove &lpass_tlmm. Hence brought
> > out.
> > 
> > > 
> > > nit: since you are keeping the groups the group names are a bit
> > > generic IMO.
> > > e.g. it is fairly obvious that 'dmic01_clk' refers to a clock pin,
> > > however
> > > just 'dmic01' is a bit vague. You could consider adding the prefix
> > > 'lpass_'
> > > to the group names for more clarity.
> > as dmic01 has both clk and data section, I don't think keeping clk is
> > appropriate here.
> 
> As these nodes are part of SC7280, i.e. qcom specific chipset, I feel lpass_
> is redundant.

It helps to provide some context about the pins which might not be evident
from their short names like 'dmic01' or 'rx_swr'. A nice side effect is that
the pins/groups would grouped automatically together in alphabetic ordering.

In terms of 'redundancy' it is similar to 'qup_' prefix for the I2C/SPI/UART
pins.

> If we add lpass_ to all dmic nodes, some node names are too lengthy.

The longest would be like 'lpass_dmic01_sleep' or 'lpass_rx_swr_sleep', which
doesn't seem outrageous.

In any case it's not super important. If it bothers someone enough later
on they can always send a patch that changes it.
