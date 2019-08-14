Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1E68DD9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 21:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfHNTDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 15:03:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44865 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbfHNTDB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 15:03:01 -0400
Received: by mail-pg1-f193.google.com with SMTP id i18so21665pgl.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2019 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KQB7DJ5gi9ev5acbUL1SU1wt21V4tJv7L8uzpgjR+Fk=;
        b=sqQAnnHwlV7gMa7y3F9D4GehL3IsYU3YCA+AjkPswRUFoMM6rA/5HNjrv7BH+r3Byt
         pxxH3BPx+lEJE162QXuBnQ9n7k/hJo3h5j7GwFzgQA5aCbqnopDbtBAG1hiiL0qeS0nU
         OWbhXJ3qxPbxueBp5T23VPZm4lRjeU+/Pj58jqRtPE2bHnB5+UoysY61CXN7q9Q84Xn5
         O3klIOZTUGju5bBNsTn9lBLcTirktH9tIEg4G/TwxuY01uQ3gUdC3m0u/+vgdF7DD5Cv
         iXGJD/xUVNoFB4NxTY2VdPgIPqhk/hlZXegdkHy/nIIVB30H9WW2KL4Fpcc1JSZlAhgp
         h5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KQB7DJ5gi9ev5acbUL1SU1wt21V4tJv7L8uzpgjR+Fk=;
        b=RZoyNFepfW6D7NU3ba/lRxoL4+9A63rTz3i8vmzsFAAt5DXevV6+2lJyUJdBq3UWQ4
         BwTAp9hfYXR4oxttN10hSYuHShAla564A2dA8zjH9I1nIBi8gvaEaRC5XUmuxzZu2vRs
         kiuIury2W/mkNIeYnwEdNkgZ9CDJ1iz7VN5BTFNaJs93K21kqy8L5XVFPVqA5ghEu5vv
         7bsGbWyGbzvt2Tk3CNk3iNnJo+9C4ubjKhZswQs++f3DxTSj00O6hDzrONhz8VHA7JzG
         fiEDK2miHuCHuJohocagNAIrlY35SgsjBJFw/2qJH2wzAJkhdC6JT0GsumCc1fjjSP/9
         avrw==
X-Gm-Message-State: APjAAAXv8VrXPq7+y0mPP7VYJ/yUAMd1QLsGeACxtEsIDn0KxwHhdjC2
        iPpO1TbAhr2ECE9YQpPrIJGKyA==
X-Google-Smtp-Source: APXvYqz0jLMvYq9Khrkh4Ax5B5T9eielKEyuOLTtZaGXi9oZ1u5iqi5KfUNees6Jp/Evu+PAcUnqEw==
X-Received: by 2002:a17:90b:8c1:: with SMTP id ds1mr1155095pjb.114.1565809380889;
        Wed, 14 Aug 2019 12:03:00 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x1sm471919pjo.4.2019.08.14.12.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 12:02:59 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:02:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, sibis@codeaurora.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/22] arm64: dts: qcom: sm8150: add base dts file
Message-ID: <20190814190257.GI6167@minitux>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-2-vkoul@kernel.org>
 <20190814165855.098FD2063F@mail.kernel.org>
 <20190814174439.GE6167@minitux>
 <20190814183552.5FF062133F@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814183552.5FF062133F@mail.kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 14 Aug 11:35 PDT 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-08-14 10:44:39)
> > On Wed 14 Aug 09:58 PDT 2019, Stephen Boyd wrote:
> > 
> > > Quoting Vinod Koul (2019-08-14 05:49:51)
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > [..]
> > > > +       clocks {
> > > > +               xo_board: xo-board {
> > > > +                       compatible = "fixed-clock";
> > > > +                       #clock-cells = <0>;
> > > > +                       clock-frequency = <19200000>;
> > > 
> > > Is it 19.2 or 38.4 MHz? It seems like lately there are dividers, but I
> > > guess it doesn't really matter in the end.
> > > 
> > 
> > As with previous platforms, the board's XO feeds the PMIC at 38.4MHz and
> > the SoC's CXO_IN pin (i.e. bi_tcxo) is fed from the PMIC's LNBBCLK1,
> > which is ticking at 19.2MHz.
> > 
> > [..]
> > > > +               gcc: clock-controller@100000 {
> > > > +                       compatible = "qcom,gcc-sm8150";
> > > > +                       reg = <0x00100000 0x1f0000>;
> > > > +                       #clock-cells = <1>;
> > > > +                       #reset-cells = <1>;
> > > > +                       #power-domain-cells = <1>;
> > > > +                       clock-names = "bi_tcxo", "sleep_clk";
> > > > +                       clocks = <&xo_board>, <&sleep_clk>;
> > 
> > So this first one should actually be <&rpmhcc LNBBCLK1>.
> 
> Hrmm LNBBCLK1 doesn't make any sense to me. That's a buffer that is
> technically the net connected to the XO pin on the Soc, but it isn't
> really supposed to be used by anything from what I recall. Last time I
> tried to use the buffers the RPM team told me I was using the wrong
> resource and I should just use the XO resource instead. Doesn't RPMh
> expose the other "XO" resource that is supposed to prevent XO shutdown?

So while it's the LNBBCLK1 pin we're referring to, it's the RPMH_CXO_CLK
which has some level of magic involved that we should actually use in
the software.

> Just mark it critical for now so that XO isn't turned off at runtime.
> 
> > 
> > But while we now should handle this gracefully in the clock driver I
> > think we still have problems with the cascading probe deferral that
> > follows - last time I tried to do this the serial driver probe deferred
> > past user space initialization and the system crashed as we didn't have
> > a /dev/console.
> 
> Does the serial driver probe eventually? Maybe you can run agetty when
> the device appears based on some uevent for /dev/console. Or we have a
> bug where /dev/console is created by devtmpfs when there isn't actually
> a console?
> 

I don't remember the exact outcome, but presume it would depend on the
implementation details of early user space (e.g. my regression test
suite would not deal with this).

> > 
> > 
> > So, I think we should s/xo_board/lnbbclk1/ (at 19.2MHz) to make it
> > represent the schematics and then once we have rpmhcc and validated that
> > the system handles this gracefully we can switch it out.
> > 
> 
> Sure, some sort of approach that switches it later on is fine, just want
> to make sure that the board clk frequency is accurately reflected in the
> DT.
> 

We introduced the xo_board fixed clock to have a parent of gcc, but
given that there is a clock named "XO" and it is not the clock being
connected to gcc, nor is it ticking at the right frequency I think it
should at least have a different name.

Regards,
Bjorn
