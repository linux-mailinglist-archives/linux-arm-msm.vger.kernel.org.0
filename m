Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9A42B540B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 23:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgKPWCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 17:02:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54682 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgKPWCC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 17:02:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 328C91C0BA1; Mon, 16 Nov 2020 23:01:55 +0100 (CET)
Date:   Mon, 16 Nov 2020 23:01:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: sdm845: add oneplus 6/t devices
Message-ID: <20201116220153.GA1003@bug>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-4-caleb@connolly.tech>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi!

> Add initial support for the OnePlus 6 (enchilada) and 6T (fajita) based
> on the sdm845-mtp DT. Support includes:
> 
> * Display panels and Adreno 630
> * Touch screen support with synaptics rmi4
> * All remoteprocs start correctly
> * WLAN / Bluetooth
> * Volume / power buttons and OnePlus Tri-State switch are functional
>     The tri-state switch is a 3 state mute slider on the side of the phone * USB 
> support, currently forced to peripheral as type C detection isn't functional.

I have similar switches on my joystick... but I don't believe modelling it as 3 separate
keys with "macro" keysym is the right way to go.

> +		state-top {
> +			label = "Tri-state key top";
> +			linux,code = <KEY_MACRO1>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +			debounce-interval = <500>;
> +			linux,can-disable;
> +		};
> +
> +		state-middle {
> +			label = "Tri-state key middle";
> +			linux,code = <KEY_MACRO2>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <52 IRQ_TYPE_EDGE_FALLING>;
> +			debounce-interval = <500>;
> +			linux,can-disable;
> +		};
> +
> +		state-bottom {
> +			label = "Tri-state key bottom";
> +			linux,code = <KEY_MACRO3>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <126 IRQ_TYPE_EDGE_FALLING>;
> +			debounce-interval = <500>;
> +			linux,can-disable;
> +		};

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
