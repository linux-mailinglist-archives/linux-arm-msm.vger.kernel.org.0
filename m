Return-Path: <linux-arm-msm+bounces-69524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4AB29F50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6B392A0DB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7EB2765C9;
	Mon, 18 Aug 2025 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFptGhZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB632765D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755513790; cv=none; b=DJiSdGfv5YzkgMDn/ku+xz8FsUkbrfd/vAj7VLx4SaArcwPWXmcdlYs1cZ+LXUS1t4b1C2VKYh2Acobhf1EiVtNnFQWyciDbkncMn6LjxGWQnHm1mbPSesnYfi/81ZqiQlM5q1KeZ+Doyrlu8tEGf24algsLBoIphEgBly4jfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755513790; c=relaxed/simple;
	bh=S9VSDM5jqebQn6ppMPvCLrzPPe0FY2feGfVJn2+LPCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFlx1Pk1JYJF/l1yDN/ttBirpTZpaIXd22Fe8s4MOhoZA8u5ruNPAhcubEH8M6k0bOLXLAkVKJ9W586K2lWkQASVX7+eAwtT5JOWUBMxy8/t203tXJJu3KBflhUyZahpYmoNYPRyrQ3rw1r7glmw/6ZZLASDK+ygPIfj2CFvLZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gFptGhZS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so2107770f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755513786; x=1756118586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XbGznGOQfvJHcocvwS/Z24rOYOuhwreRmG7kAQ0v1cw=;
        b=gFptGhZSfz2Khb15Zp9GFlzuwUx1O/UDEOSp/i90Xzn+pLtn+ypY08PIul39Z0kXyS
         8CHtkyN25t+p0VKez/0jXyBlVEUnznZnwvSeQLAu9k4xT9EOiOzr7kwzWH3nwtCF2Ris
         NmgUsCCtUQ+A74OKyqENc5J0ukolZCnj6hmpSXiO0Igypb3gQKy88UJNSboLRbLDgF/V
         nMpR3RtotgFalL87k/SpD55Lb/bWoTv0FZpC26nsBYSWoyrWIx06B22ePTQAsObxJvWd
         WPnKPfbdvGgbCUDzHRmT3R/ec6Gl+23MHSQ0y2vm8GvUG7iIpa1uS9f97ZBGkA2dsOJU
         u+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755513786; x=1756118586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbGznGOQfvJHcocvwS/Z24rOYOuhwreRmG7kAQ0v1cw=;
        b=Pv+nBvUf7ApsqcQ1z8xSaBmAEeP/CRZAiGO2S1ZYzBu71AJcMr0BkKNqc3VTAcFOm5
         /MmQJBShnopAtrOVYsbUrufDE2dZq4/1YGeiC4Xw2bQo0h0AInFZ1SiXyH/GinxEauLc
         1AVgYS6qgNAvMayXYHRKYKsZLWcr77TK3PM1npEDPL+MvTHazB0l5fAeiYG9ySwmaCHS
         YD97SPIaMNRbFDqzK4K3UrFz7RHH/i3gvMUEhqu4Sth5hanUixKwMuAnQu9T+TOcV2q+
         8ZphfZyaf0VUtjdxH4hO+7liyd1V7g26DfI8e9eZwMKRb5Qwjo+DOROheTWzf9SDBFxy
         jBhA==
X-Forwarded-Encrypted: i=1; AJvYcCWXpcxSJRgtkRo2C40pfJw/Oqr/jLuJrOuXYdvd/U8OpXsPIR1rR8owquA42RJ2+zgaKvdIZr+ZW+6LbHrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUQK7sXM0fo8p36T1KuBWbval7/6JbFew10MjY+zX8qXiKyHK
	qjyfj+/txR1nKXwM/kpiIePerjKPQd06MhH5R4Jw50Cus7yO9uMwnvy+7acsVVjXGHM=
X-Gm-Gg: ASbGncsWYSXOaviXEO7DqNZV+MVsecqZ8GUCFGbC4Vgt33Yr9o4S8FaCqUW6oTKvIob
	4BmYOyGew/iVe3wkDu08zTdwqZDH/i85Oz1ThbeqmxKKhsyw4/X5oHdR7JwDD57bhYUYuI4CCaA
	G9K2R23hz/BHct5J1nNrhoTi4nX70TTp8Plxq/oi6VK/erXYx7d8gpqDBAfyWACQpou/AfX9k49
	aAQT4LMk8U08sAOwez5R2Ky119qLa7dljhaEAqEY2JpHDHPgl/2q8VYeaXJYAMlJck+cuHkgyLP
	G5KtiH6pb1mmqCa5o/xqug2cbxub9b+yA+ZBdC/LmZ7xuXm7vjchfY0a+pEMP8T+OYE8d2lnzVA
	TfSx1xWiRJRyk7INeu3uCOn+kefVJrEgL
X-Google-Smtp-Source: AGHT+IGmrz+NJ9uq/Yd2P6zntY6aFk7dhU1duwti6hABUkh3I9hT+tCDAjtvE0e5UxtkaTD6+xVHWw==
X-Received: by 2002:a05:6000:2503:b0:3b7:974d:5359 with SMTP id ffacd0b85a97d-3bb68a170a2mr8136679f8f.32.1755513786303;
        Mon, 18 Aug 2025 03:43:06 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d6e:23fa:76e1:25d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb652f93d7sm12782350f8f.27.2025.08.18.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 03:43:05 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:43:01 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add missing
 pinctrl for eDP HPD
Message-ID: <aKMDtRu0cZk0kaBP@linaro.org>
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
 <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
 <pmhy2ogyorelllgandehtzlen64tzegp5pc6fkg7al7xzjcb2h@lq4lpaaavr6j>
 <aKLZ5M12Q-qTuB4n@linaro.org>
 <ubagrwewqqyvdgjmibhqp57x7ttqukqtv6ziftwsayuomlght6@j2k7i63rldsd>
 <aKMCfJW-Qv4Z-gnz@linaro.org>
 <CAO9ioeXhBH_=+KMMBzxZXsQu_y57tdMQW5dwHV_dhwG3gUxytA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeXhBH_=+KMMBzxZXsQu_y57tdMQW5dwHV_dhwG3gUxytA@mail.gmail.com>

On Mon, Aug 18, 2025 at 01:39:26PM +0300, Dmitry Baryshkov wrote:
> On Mon, 18 Aug 2025 at 13:37, Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> > On Mon, Aug 18, 2025 at 01:33:43PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Aug 18, 2025 at 09:44:36AM +0200, Stephan Gerhold wrote:
> > > > On Sat, Aug 16, 2025 at 01:06:50AM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Aug 14, 2025 at 03:30:28PM +0200, Stephan Gerhold wrote:
> > > > > > At the moment, we indirectly rely on the boot firmware to set up the
> > > > > > pinctrl for the eDP HPD line coming from the internal display. If the boot
> > > > > > firmware does not configure the display (e.g. because a different display
> > > > > > is selected for output in the UEFI settings), then the display fails to
> > > > > > come up and there are several errors in the kernel log:
> > > > > >
> > > > > >  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
> > > > > >  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
> > > > > >  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
> > > > > >  ...
> > > > > >
> > > > > > Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> > > > > > bias-disable according to the ACPI DSDT).
> > > > > >
> > > > > > Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> > > > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 9 +++++++++
> > > > > >  1 file changed, 9 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > > > > index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..613c675aac296f931293a1ba3d8506c6663bad21 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> > > > > > @@ -1001,6 +1001,9 @@ &mdss_dp1_out {
> > > > > >  &mdss_dp3 {
> > > > > >         /delete-property/ #sound-dai-cells;
> > > > > >
> > > > > > +       pinctrl-0 = <&edp_hpd_default>;
> > > > > > +       pinctrl-names = "default";
> > > > > > +
> > > > > >         status = "okay";
> > > > > >
> > > > > >         aux-bus {
> > > > > > @@ -1236,6 +1239,12 @@ cam_indicator_en: cam-indicator-en-state {
> > > > > >                 bias-disable;
> > > > > >         };
> > > > > >
> > > > > > +       edp_hpd_default: edp-hpd-default-state {
> > > > > > +               pins = "gpio119";
> > > > > > +               function = "edp0_hot";
> > > > > > +               bias-disable;
> > > > > > +       };
> > > > >
> > > > > I think this is common enough. Let's maybe push this into the SoC dtsi
> > > > > instead of copying it to all devices?
> > > > >
> > > >
> > > > I had it there before, but Johan commented on the patch set from Chris
> > > > that he would prefer to keep the potentially board-specific pinctrl out
> > > > of the SoC dtsi [1]. So I can either address his feedback or yours. :-)
> > > >
> > > > There isn't really a convention for X1E either - we have a wild mix
> > > > where some pinctrl is defined in the SoC dtsi (UART, I2C, SDHCI, ...)
> > > > and others is copied for each board (e.g. PCIe).
> > >
> > > PCIe pinctrl is a part of SoC DTSI for SM8[4567]0.
> > >
> >
> > For some reason it's not on X1E.
> >
> > > > The reason I chose this approach is that I didn't feel it is guaranteed
> > > > that the HPD pin has external pull down. It seems to be the case on most
> > > > devices, but in theory a device could maybe rely on the internal pull
> > > > down. Might be better to have it explicitly defined, the 5 additional
> > > > lines are not that much at the end.
> > >
> > > I don't think anybody will use internal pull-down for this, it would be
> > > too risky in case the eDP cable is bad. I have checked several laptops,
> > > they use external pull-down or two MOSFETs.
> > >
> >
> > So are you suggesting to put just the "template" (the
> > edp-hpd-default-state node) into the SoC dtsi and keep the
> > pinctrl-0/pinctrl-names reference in the board DT,
> 
> Yes.
> 
> > or to put everything
> > into the SoC dtsi? I'm not sure if there is a use case where there
> > wouldn't be any HPD connected to GPIO119.
> 
> Still it's a board configuration (pretty much like PCIe config is).
> 

Ok, thanks. I'm fine with either approach really (putting it entirely in
board DT or the template in SoC dtsi and reference in board DT). I'll
wait a couple more days for more opinions, otherwise I'll send a v2 with
the template moved to the SoC dtsi.

Thanks,
Stephan

