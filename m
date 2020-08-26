Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8675253512
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 18:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHZQkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 12:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgHZQkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 12:40:15 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49CAC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 09:40:14 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id nv17so1138547pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=In8/cUpMUysBI++BdCvzS7Kz5Hf4D5DTqnq4rpnWNsU=;
        b=mciSaY0jFN44lkzeRL4/jSD9TVorJR6OUmw1DMamupit7ap892Sl3ZX1K3HoFzQauC
         C6AABpdhE6xdtkhCpT6qwAUA/dQ12qmh7/bsvcxkXkMnxCQnWCNBirajfIOyQLbyPvDk
         PgSLvHo8EiLW/p59Vz1ArWPqOckJxRbPpmRhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=In8/cUpMUysBI++BdCvzS7Kz5Hf4D5DTqnq4rpnWNsU=;
        b=Zi8nB9uWIjleh8zmNFTT0UIP5esfSZStEtM3XlELI6xymrOtq3FhbzYB6v5HiSxYAL
         0+ibZrmPdhWdemc1zo3s2LddhfLjSc3temBxS6nCxzDRYMF10Eot+WxpEX7iVN/84ZsV
         A7imh+BV4+X/hSMlYsePStBlyXQmBrP9SG8U13koUeuUx3o9GMO+ed5Lf842nfFAZ5Hd
         i7DOzEhfSjT/WTtDoTyx8IlmLT1uwzcivn3boU6Z+J2efJ5cMFUhaV89NUlTKykwbqkf
         Dqn/Vl4c49mJ167eat3Xl+L/WOWlssclfd3RFs5AoHfcQ0n/qc4MKqXodhr2wwkiNXwY
         ExIA==
X-Gm-Message-State: AOAM532Kuckid0kzvL7s+bYAEDTsz4G+5+yWnkE7XrwjUssiHAYSWgxG
        mp6/n8dHpjWMxH1VQmCrlTEGfw==
X-Google-Smtp-Source: ABdhPJx/5S2B77QOPU/+ce8ZIu4SInRYJsgrHiSOcySj/ksmSHTPw8vrUM+qJBI1Th+swWdGk2xR+w==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id d2mr6780390pjw.112.1598460014328;
        Wed, 26 Aug 2020 09:40:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id o192sm3670874pfg.81.2020.08.26.09.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 09:40:13 -0700 (PDT)
Date:   Wed, 26 Aug 2020 09:40:11 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     skakit@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: sc7180: Add sleep pin ctrl for
 BT uart
Message-ID: <20200826164011.GE486007@google.com>
References: <1597931467-24268-1-git-send-email-skakit@codeaurora.org>
 <1597931467-24268-3-git-send-email-skakit@codeaurora.org>
 <20200821172215.GB486007@google.com>
 <e1738473c26de45b5c9c7c4d5963f32c@codeaurora.org>
 <20200825163820.GD486007@google.com>
 <10485f6a111c578f2e15dbcc0ceec66d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10485f6a111c578f2e15dbcc0ceec66d@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Satya,

On Wed, Aug 26, 2020 at 09:35:15PM +0530, skakit@codeaurora.org wrote:
> Hi Matthias,
> 
> On 2020-08-25 22:08, Matthias Kaehlcke wrote:
> > On Tue, Aug 25, 2020 at 06:42:28PM +0530, skakit@codeaurora.org wrote:
> > > On 2020-08-21 22:52, Matthias Kaehlcke wrote:
> > > > On Thu, Aug 20, 2020 at 07:21:06PM +0530, satya priya wrote:
> > > > > Add sleep pin ctrl for BT uart, and also change the bias
> > > > > configuration to match Bluetooth module.
> > > > >
> > > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > > Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> > > > > ---
> > > > > Changes in V2:
> > > > >  - This patch adds sleep state for BT UART. Newly added in V2.
> > > > >
> > > > > Changes in V3:
> > > > >  - Remove "output-high" for TX from both sleep and default states
> > > > >    as it is not required. Configure pull-up for TX in sleep state.
> > > > >
> > > > >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 54
> > > > > +++++++++++++++++++++++++++------
> > > > >  1 file changed, 45 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > index d8b5507..806f626 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > @@ -473,20 +473,20 @@
> > > > >
> > > > >  &qup_uart3_default {
> > > > >  	pinconf-cts {
> > > > > -		/*
> > > > > -		 * Configure a pull-down on 38 (CTS) to match the pull of
> > > > > -		 * the Bluetooth module.
> > > > > -		 */
> > > > > +		/* Configure no pull on 38 (CTS) to match Bluetooth module */
> > > > >  		pins = "gpio38";
> > > > > -		bias-pull-down;
> > > > > -		output-high;
> > > > > +		bias-disable;
> > > >
> > > > I think it should be ok in functional terms, but I don't like the
> > > > rationale
> > > > and also doubt the change is really needed.
> > > >
> > > > If the pull is removed to match the Bluetooth module, then that sounds
> > > > as
> > > > if the signal was floating on the the BT side, which I think is not the
> > > > case.
> > > > Yes, according to the datasheet there is no pull when the BT controller
> > > > is
> > > > active, but then it drives the signal actively to either high or low.
> > > > There
> > > > seems to be no merit in 'matching' the Bluetooth side in this case, if
> > > > the
> > > > signal was really floating on the BT side we would definitely not want
> > > > this.
> > > >
> > > > In a reply to v2 you said:
> > > >
> > > > > Recently on cherokee we worked with BT team and came to an agreement
> > > > > to
> > > > > keep no-pull from our side in order to not conflict with their pull in
> > > > > any state.
> > > >
> > > > What are these conflicting pull states?
> > > >
> > > > The WCN3998 datasheet has a pull-down on RTS (WCN3998 side) in reset and
> > > > boot mode, and no pull in active mode. In reset and boot mode the host
> > > > config with a pull down would match, and no pull in active mode doesn't
> > > > conflict with the pull-down on the host UART. My understanding is that
> > > > the pinconf pulls are weak pulls, so as soon as the BT chip drives its
> > > > RTS the pull on the host side shouldn't matter.
> > > >
> > > 
> > > yes, I agree with you, the pinconf pulls are weak. As this is driven
> > > by BT
> > > SoC (pull on HOST side shouldn't matter), we are not mentioning any
> > > bias
> > > configuration from our side and simply putting it as no-pull, just
> > > to not
> > > conflict in any case. It seems that the rationale mentioned is a bit
> > > confusing i will change it to clearly specify why we are configuring
> > > no-pull.
> > > 
> > > > Is this change actually related with wakeup support? I have the
> > > > impression
> > > > that multiple things are conflated in this patch. If some of the changes
> > > > are just fixing/improving other things they should be in a separate
> > > > patch,
> > > > which could be part of this series, otherwise it's really hard to
> > > > distinguish between the pieces that are actually relevant for wakeup and
> > > > the rest.
> > > >
> > > > Independently of whether the changes are done in a single or multiple
> > > > patches, the commit log should include details on why the changes are
> > > > necessary, especially when there are not explantatory comments in the
> > > > DT/code itself (e.g. the removal of 'output-high', which seems correct
> > > > to me, but no reason is given why it is done).
> > > >
> > > 
> > > This change is not related to wakeup support, I will make it a
> > > separate
> > > patch, will also mention the details in commit text.
> > > 
> > > > >  	};
> > > > >
> > > > >  	pinconf-rts {
> > > > > -		/* We'll drive 39 (RTS), so no pull */
> > > > > +		/*
> > > > > +		 * Configure pull-down on 39 (RTS). This is needed to avoid a
> > > > > +		 * floating pin which could mislead Bluetooth controller
> > > > > +		 * with UART RFR state (READY/NOT_READY).
> > > > > +		 */
> > > > >  		pins = "gpio39";
> > > > >  		drive-strength = <2>;
> > > > > -		bias-disable;
> > > > > +		bias-pull-down;
> > > > >  	};
> > > >
> > > > [copy of my comment on v2]
> > > >
> > > > I'm a bit at a loss here, about two things:
> > > >
> > > > RTS is an output pin controlled by the UART. IIUC if the UART port is
> > > > active
> > > > and hardware flow control is enabled the RTS signal is either driven to
> > > > high
> > > > or low, but not floating.
> > > 
> > > Yes, RTS is either driven high or low. HW flow control is always
> > > enabled and
> > > only turned off when RX FIFO is full. Whereas SW flow control is
> > > controlled
> > > by upper layers(serial core), also it can be enabled/disabled from
> > > host by
> > > calling set_mctrl.
> > 
> > As far as I understand the above isn't entirely correct. HW flow control
> > is not
> > disabled when the RX FIFO is full, rather as part of HW flow control the
> > hardware deasserts RTS when the FIFO is full. Software flow control
> > isn't really
> > relevant here, since it doesn't use RTS/CTS but uses transmission of
> > special
> > codes (XON/XOFF) over TX/RX.
> 
> Here by Software flow control i meant, we can control the flow from
> SW(explained below).

Better don't use a term that already has well defined meaning in a
given context when you refer to something else.

> > 
> > > > Now lets assume I'm wrong with the above and RTS can be floating. We
> > > > only want
> > > > the BT SoC to send data when the host UART is ready to receive them,
> > > > right?
> > > > RTS is an active low signal, hence by configuring it as a pull-down the
> > > > BT
> > > > SoC can send data regardless of whether the host UART actually asserts
> > > > RTS,
> > > > so the host UART may not be ready to receive it. I would argue that if
> > > > there
> > > > is really such a thing as a floating RTS signal then it should have a
> > > > pull-up,
> > > > to prevent the BT SoC from sending data at any time.
> > > >
> > > > I'm not an expert in UART communication and pinconf, so it could be that
> > > > I
> > > > got something wrong, but as of now it seems to me that no pull is the
> > > > correct
> > > > config for RTS.
> > > >
> > > > >
> > > > >  	pinconf-tx {
> > > > > @@ -494,7 +494,43 @@
> > > > >  		pins = "gpio40";
> > > > >  		drive-strength = <2>;
> > > > >  		bias-disable;
> > > > > -		output-high;
> > > > > +	};
> > > > > +
> > > > > +	pinconf-rx {
> > > > > +		/*
> > > > > +		 * Configure a pull-up on 41 (RX). This is needed to avoid
> > > > > +		 * garbage data when the TX pin of the Bluetooth module is
> > > > > +		 * in tri-state (module powered off or not driving the
> > > > > +		 * signal yet).
> > > > > +		 */
> > > > > +		pins = "gpio41";
> > > > > +		bias-pull-up;
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&qup_uart3_sleep {
> > > > > +	pinconf-cts {
> > > > > +		/* Configure no-pull on 38 (CTS) to match Bluetooth module */
> > > > > +		pins = "gpio38";
> > > > > +		bias-disable;
> > > > > +	};
> > > > > +
> > > > > +	pinconf-rts {
> > > > > +		/*
> > > > > +		 * Configure pull-down on 39 (RTS). This is needed to avoid a
> > > > > +		 * floating pin which could mislead Bluetooth controller
> > > > > +		 * with UART RFR state (READY/NOT_READY).
> > > > > +		 */
> > > > > +		pins = "gpio39";
> > > > > +		drive-strength = <2>;
> > 
> > just noticed this: in the sleep config all pins are in GPIO config (see
> > "arm64: dts: sc7180: Add wakeup support over UART RX" from this series)
> > and by default they are inputs, hence the drive-strength here is
> > pointless
> > IIUC.
> > 
> 
> CTS and RX are inputs to the HOST whereas RTS and TX are outputs. We have
> added drive-strength for output pins only as they are driven by UART(please
> correct me if wrong).

True, RTS and TX are outputs in UART mode, however in sleep mode the pins
are (currently) configured as GPIOs and inputs (again, see "arm64: dts:
sc7180: Add wakeup support over UART RX" of this series), hence the
drive-strength attribute does nothing. If needed/preferred you can configure
the pins as outputs and specify the desired state instead of using pulls,
in that case specifying the drive strength can be useful.

> > > > > +		bias-pull-down;
> > > > > +	};
> > > >
> > > > I don't know all the details, but I have the impression that this is the
> > > > relevant pull change for wakeup. From the title of the series I derive
> > > > that the UART RX pin is used for signalling wakeup. A pull-down on RTS
> > > > indicates the BT controller that it can always send data to wake up the
> > > > host.
> > > >
> > > > I think RTS in default mode should remain with no-pull (the UART is
> > > > driving
> > > > the signal), and then change it to pull-down in sleep mode.
> > > >
> > > >
> > > 
> > > As I understand from your previous comment, pinconf pulls are weak and
> > > cannot override the pull of controller.
> > 
> > I'm not sure this is an absolute truth. I think there may be cases where
> > the driver has to increase its drive strength..
> > 
> > > Although pull down is configured,
> > > data will be received only if host controller is ready to accept it.
> > > So, we
> > > want to put RTS in pull-down state(known state) instead of leaving
> > > it in
> > > ambiguous state i.e, no-pull(high/low).
> > 
> > I disgress. I'm pretty sure that you want RTS to be low to make sure
> > that
> > the BT SoC can wake up the system by sending whatever data it has to
> > send.
> > It won't do that if RTS is high (e.g. because that's its floating state
> > at that time). I just tried configuring a pull-up (also a known
> > non-ambiguous state), and Bluetooth wakeup doesn't work with that,
> > supposedly because the BT SoC/UART will wait for its CTS signal to be
> > low.
> > 
> 
> yes, you are right, we are keeping RTS low to make sure that BT SoC can
> wakeup the system by sending bytes.
> My intention here was to explain below case from your comment:
> 
> > > > RTS is an active low signal, hence by configuring it as a pull-down the
> > > > BT
> > > > SoC can send data regardless of whether the host UART actually asserts
> > > > RTS,
> > > > so the host UART may not be ready to receive it.
> 
> 1. By default our HW flow is enabled(since we are configuring pull-down on
> RTS),and BT SoC can send data anytime.
> 2. But there is a SW mechanism where we can control the flow from software.
> In that case what ever is configured to UART_MANUAL_RFR(READY or NOT_READY)
> will override the dtsi pinconf pull and the RTS/RFR line is pulled high when
> HOST is not ready(while debugging the wake up issue we came across this).

This is generally correct while the system is running, but (with the current
pinconf) not when the system is suspended IIUC. When the system is in suspend
the function of the UART pins is changed to GPIO, hence the UART ceases to
control RTS.

Otherwise how do you explain that wakeup stops working when you configure
a pull-up instead of a pull-down? According to your comment the UART should
be driving the RTS depending on its readyness.

> So, as far as i understand, even if pull-down is configured on RTS, BT SoC
> can send data only when HOST is ready.
> Can you please let me know which case you mean here, when you say "by
> configuring it as a pull-down the BT SoC can send data regardless of whether
> the host UART actually asserts RTS". Is there any case which we are missing
> here?

I'm referring to the case where the system is suspended and the UART doesn't
control RTS (see above).

Thanks

Matthias
