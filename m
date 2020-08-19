Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5619924A3D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 18:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHSQOI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 12:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgHSQN0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 12:13:26 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851DBC061383
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 09:13:19 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 17so11917302pfw.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=svPB6Dx2TnAYZrDOVEx7GGT/OFxWuzJDOOju30QjJAE=;
        b=JwatJcZDWJUg7wm9SrtG/5bKuhac0JrlRAk2L1mqP90r5iyxNbrx1FrO5h+QLq3wzn
         u/9/7f6WiMHmLKp4W7kd4ZNgnbYs304qcIEa149X5Kl7p2bsEsAurgGu46OiDUgo0KRr
         cFZEzsVziWoUcb57aiu6qwn2r2hbBluDXvfew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=svPB6Dx2TnAYZrDOVEx7GGT/OFxWuzJDOOju30QjJAE=;
        b=lVB+1Q+LCudvSl3bm1NZtA29i4bx2ybOF4iJuOX+B8zu3aT8WTecNK2bP+qQ6Gjg6N
         rCDhwMmZDLbo0999vJSUVL5nT3eUMpWsn09L5AmlTmSa37oGh9xrzBjaVwCCUdVUUHi7
         uTkjSfNWGZ7MPlldC+dPEivgiGtuCm3V7noQdfYpJjBGA8QowZhTh9ETV0M/eqTxvaoQ
         xgbvpHlUbM9MmQiixpM2p9vwZ+DD9hDwkrhh/resd1DoVoA6UBVoAR0NIBpyzQl33hum
         un9kfU0u2qMYIuQ+1Xlb5nmHVPBa0ZwxUHDbWKMTFVKZA1wzY2MgY8Te6dNPg3K4tAi0
         Za9g==
X-Gm-Message-State: AOAM532vSDcHATUZjdJEJoQgDLRvPdl8HQteygUUIzQ0Rwkd0v+pAsx4
        L60zcHfofDsGLizIE5va9jXeAA==
X-Google-Smtp-Source: ABdhPJzcLsplNpOc6XnXL8EJZ1d7DWp1h/KUcd/QKTGpcnw4edJEuDOLVWlRLaoEjg+23g98e/it+A==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr19296177pfb.161.1597853594084;
        Wed, 19 Aug 2020 09:13:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 2sm31342643pfv.27.2020.08.19.09.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:13:13 -0700 (PDT)
Date:   Wed, 19 Aug 2020 09:13:11 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     skakit@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V2 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for
 BT uart
Message-ID: <20200819161311.GF2995789@google.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
 <20200817180158.GD2995789@google.com>
 <1cbbc8cf5c918c6a9eee5ef349707fc6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cbbc8cf5c918c6a9eee5ef349707fc6@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 19, 2020 at 07:19:25PM +0530, skakit@codeaurora.org wrote:
> On 2020-08-17 23:31, Matthias Kaehlcke wrote:
> > On Fri, Jul 24, 2020 at 09:28:01AM +0530, satya priya wrote:
> > > Add sleep pin ctrl for BT uart, and also change the bias
> > > configuration to match Bluetooth module.
> > > 
> > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > ---
> > > Changes in V2:
> > >  - This patch adds sleep state for BT UART. Newly added in V2.
> > > 
> > >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42
> > > ++++++++++++++++++++++++++++-----
> > >  1 file changed, 36 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > index 26cc491..bc919f2 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > @@ -469,20 +469,50 @@
> > > 
> > >  &qup_uart3_default {
> > >  	pinconf-cts {
> > > -		/*
> > > -		 * Configure a pull-down on 38 (CTS) to match the pull of
> > > -		 * the Bluetooth module.
> > > -		 */
> > > +		/* Configure no pull on 38 (CTS) to match Bluetooth module */
> > 
> > Has the pull from the Bluetooth module been removed or did the previous
> > config
> > incorrectly claim that the Bluetooth module has a pull-down?
> > 
> 
> The previous config was incorrect, so we corrected it to match the pull of
> BT.

The pull config of the BT controller varies depending on its state, could
you clarify which state you intend to match?

> 
> > >  		pins = "gpio38";
> > > +		bias-disable;
> > > +	};
> > > +
> > > +	pinconf-rts {
> > > +		/* We'll drive 39 (RTS), so configure pull-down */
> > > +		pins = "gpio39";
> > > +		drive-strength = <2>;
> > >  		bias-pull-down;
> > > +	};
> > > +
> > > +	pinconf-tx {
> > > +		/* We'll drive 40 (TX), so no pull */
> > 
> > The rationales for RTS and TX contradict each other. According to the
> > comment
> > the reason to configure a pull-down on RTS is that it is driven by the
> > host.
> > Then for TX the reason to configure no pull is that it is driven by the
> > host.
> > 
> > Please make sure the comments *really* describe the rationale, otherwise
> > they
> > are just confusing.
> 
> The rationale for RTS is that we don't want it to be floating and want to
> make sure that it is pulled down, to receive bytes. Will modify the comment
> mentioning the same.

Could you clarify what you mean with "to receive bytes"?

Thanks

Matthias
