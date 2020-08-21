Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0F624D936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 17:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgHUP75 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 11:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgHUP7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 11:59:55 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E344EC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 08:59:55 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d188so1281830pfd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PHpiChL5JGq/LZstNZ28HM8fDTmJE8/7UUfCPtEQhGQ=;
        b=QRaFm8718FJefFz/ypkWhug9/DCf/520wNooIeoa6t5O4C45AC95WUTi1ttLZiYLRn
         jr7dWao9AJB1UbBIpKv95dwEGAH0dnhLIpO7Y4ni6VA9BaBNQVe0hU3PiXIfSUwTllE+
         X2hydUevanG1SL0jAjD59jjfs0PY0SWj0tsrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PHpiChL5JGq/LZstNZ28HM8fDTmJE8/7UUfCPtEQhGQ=;
        b=fiKrzsboSYoJNyDI9Ezt8joAIUEvrNwbSoRmqcwQu9LtBTNK3gVkVJj06LOMLR6VKE
         5SBxUy049TkRLsuzCnbmAmbMCv7xFf4aXdvqsJFb9lXYtarWRcsWnoriEBAbHub6/6nO
         eVGEJGIotjYo3fmXF2Q2KqS8wLFfmcdGTtnErSEm70qkgL+0mc0sgazI4SCK7t0kBjdC
         8LtIN+/bCsRjND3grOHFMo/DyOlDf/+UFHWwUHnkeMRmVdxk0GrCqK8NrguR2J97TfqK
         O2vjPIadbEM67DfzF+2TBizOsCMVITYmVFu63nDKV73RQmKvekjeL3wzskkLakKS7Xf4
         Bi6A==
X-Gm-Message-State: AOAM531LfkPg7HxTwYz6dzD8O09fa6MZe9Bx6y9FC6wC9uKGqVbosOJJ
        EsFF3ghHZvKvJMV4fXaAT8VZVQ==
X-Google-Smtp-Source: ABdhPJxu94S4fcnRQU+u1dFIIXVlfyW3pAeruNuWAjh/VFOzFXlkhNvwvKybp1t2lQ+XH5CYv1OZUg==
X-Received: by 2002:a62:7f0e:: with SMTP id a14mr3083836pfd.320.1598025595418;
        Fri, 21 Aug 2020 08:59:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id f13sm2885733pfd.215.2020.08.21.08.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 08:59:54 -0700 (PDT)
Date:   Fri, 21 Aug 2020 08:59:53 -0700
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
Message-ID: <20200821155953.GG2995789@google.com>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
 <1595563082-2353-3-git-send-email-skakit@codeaurora.org>
 <20200817180158.GD2995789@google.com>
 <1cbbc8cf5c918c6a9eee5ef349707fc6@codeaurora.org>
 <20200819161311.GF2995789@google.com>
 <29d523f4a46ecce8e4a62a5310528969@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29d523f4a46ecce8e4a62a5310528969@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 20, 2020 at 05:49:53PM +0530, skakit@codeaurora.org wrote:
> Hi Matthias,
> 
> On 2020-08-19 21:43, Matthias Kaehlcke wrote:
> > On Wed, Aug 19, 2020 at 07:19:25PM +0530, skakit@codeaurora.org wrote:
> > > On 2020-08-17 23:31, Matthias Kaehlcke wrote:
> > > > On Fri, Jul 24, 2020 at 09:28:01AM +0530, satya priya wrote:
> > > > > Add sleep pin ctrl for BT uart, and also change the bias
> > > > > configuration to match Bluetooth module.
> > > > >
> > > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > > ---
> > > > > Changes in V2:
> > > > >  - This patch adds sleep state for BT UART. Newly added in V2.
> > > > >
> > > > >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42
> > > > > ++++++++++++++++++++++++++++-----
> > > > >  1 file changed, 36 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > index 26cc491..bc919f2 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > @@ -469,20 +469,50 @@
> > > > >
> > > > >  &qup_uart3_default {
> > > > >  	pinconf-cts {
> > > > > -		/*
> > > > > -		 * Configure a pull-down on 38 (CTS) to match the pull of
> > > > > -		 * the Bluetooth module.
> > > > > -		 */
> > > > > +		/* Configure no pull on 38 (CTS) to match Bluetooth module */
> > > >
> > > > Has the pull from the Bluetooth module been removed or did the previous
> > > > config
> > > > incorrectly claim that the Bluetooth module has a pull-down?
> > > >
> > > 
> > > The previous config was incorrect, so we corrected it to match the
> > > pull of
> > > BT.
> > 
> > The pull config of the BT controller varies depending on its state,
> > could
> > you clarify which state you intend to match?
> > 
> 
> Since this line is driven by BT SoC, they could change their pull(although
> it's less likely). Recently on cherokee we worked with BT team and came to
> an agreement to keep no-pull from our side in order to not conflict with
> their pull in any state.
> 
> > > 
> > > > >  		pins = "gpio38";
> > > > > +		bias-disable;
> > > > > +	};
> > > > > +
> > > > > +	pinconf-rts {
> > > > > +		/* We'll drive 39 (RTS), so configure pull-down */
> > > > > +		pins = "gpio39";
> > > > > +		drive-strength = <2>;
> > > > >  		bias-pull-down;
> > > > > +	};
> > > > > +
> > > > > +	pinconf-tx {
> > > > > +		/* We'll drive 40 (TX), so no pull */
> > > >
> > > > The rationales for RTS and TX contradict each other. According to the
> > > > comment
> > > > the reason to configure a pull-down on RTS is that it is driven by the
> > > > host.
> > > > Then for TX the reason to configure no pull is that it is driven by the
> > > > host.
> > > >
> > > > Please make sure the comments *really* describe the rationale, otherwise
> > > > they
> > > > are just confusing.
> > > 
> > > The rationale for RTS is that we don't want it to be floating and
> > > want to
> > > make sure that it is pulled down, to receive bytes. Will modify the
> > > comment
> > > mentioning the same.
> > 
> > Could you clarify what you mean with "to receive bytes"?
> > 
> 
> When we keep no-pull(floating), sometimes it may be pulled high and UART
> flow will be turned off(RFR_NOT_READY), due to this BT SoC wont be able to
> send data even though host is ready.

I'm a bit at a loss here, about two things:

RTS is an output pin controlled by the UART. IIUC if the UART port is active
and hardware flow control is enabled the RTS signal is either driven to high
or low, but not floating.

Now lets assume I'm wrong with the above and RTS can be floating. We only want
the BT SoC to send data when the host UART is ready to receive them, right?
RTS is an active low signal, hence by configuring it as a pull-down the BT
SoC can send data regardless of whether the host UART actually asserts RTS,
so the host UART may not be ready to receive it. I would argue that if there
is really such a thing as a floating RTS signal then it should have a pull-up,
to prevent the BT SoC from sending data at any time.

I'm not an expert in UART communication and pinconf, so it could be that I
got something wrong, but as of now it seems to me that no pull is the correct
config for RTS.
