Return-Path: <linux-arm-msm+bounces-81311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A992FC4F1BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 136AE4E2FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17C1366545;
	Tue, 11 Nov 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA6NfSRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA22D8DDA;
	Tue, 11 Nov 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879389; cv=none; b=VN9+jDi8ukq87tI66D2RvbzFFT6nhMGxwBJFZuDif84pTxqYpBgF1/a3LjUL05YvWuaqrjWE4hQoUuV9Xz0g+OunEG1wDc516DegdLOV4K4CvdfFJZWLADx51VW1AFJdwbgnEhN4jXNmBTXJmt7xSdYrs+dXIwztYAV8UZGAeCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879389; c=relaxed/simple;
	bh=ymIv2XmLKmBikeDaavFp5j6Vf01oLyyEEmybdOlwNE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW3cK4I0CH9bA5o9nnB2QECJGajRBlEd6H75YDHa7BMBjqD5Etln+JEd/afPT6UGCwwEOfKrzYEW/XpwltLsd1iDrvul2mbxV1q7yWb9RVG0U+dAc/6YhARr2ePpEzotWi2HhtIesT2Y0cyrC9kiH7fSOFjuJTA5U30M+b/yNqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA6NfSRa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0F7C4CEF5;
	Tue, 11 Nov 2025 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762879388;
	bh=ymIv2XmLKmBikeDaavFp5j6Vf01oLyyEEmybdOlwNE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cA6NfSRa0UklYUuKU+oSfTLjJU9hDSw6ryaU9+Y6RC3gTnxUm50500ZZqf1rH1s2g
	 K7IyeEKKbt83fCABf/5KT6MNkexLR3blFqcHy3trLKdWKYqLJD8MdXgjEyeYsw2Fna
	 h+R9nOI8yJTSdwHbykW87+TUDqJn2BsUnwkVW/KnLNzo0nYpZytz60VK5IsNTK5zT9
	 E/nP3UolhRZ98396VogMEpEUDFqJ2UmW//QDgeR4r1/XRgKYps3577NSyTh6ngylOh
	 q38DDRUJYLU4o7QmRkNHZ7c6cDSmWzS1oCS4+Wv+ZvbHiR/gW+gJgvvAmFx79TBqjv
	 dNIxQp2WHVuIQ==
Date: Tue, 11 Nov 2025 10:47:21 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Amit Singh <quic_amitsi@quicinc.com>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_riteshk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Use 'edp_hot'
 function for hpd gpio
Message-ID: <jqfmzls6eeydxozzyewkfutqpdzfavlx6mci6pl6f2ts7cjjeg@b32k3pf362zb>
References: <20251031085739.440153-1-quic_amitsi@quicinc.com>
 <nzg7auudxocxnpnjsc2emot7sgh5azvucl72jqzgqsp4jhzint@hykb2xyx66uh>
 <c6ef0324-c932-4c80-8252-97dd3ee255d3@quicinc.com>
 <rqufdgme5cmtbvharugka2zc6c4g4am4j6enrkanc6uaxdbr77@dlptsjv7u7lr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rqufdgme5cmtbvharugka2zc6c4g4am4j6enrkanc6uaxdbr77@dlptsjv7u7lr>

On Tue, Nov 11, 2025 at 05:14:54PM +0200, Dmitry Baryshkov wrote:
> On Thu, Nov 06, 2025 at 03:01:07PM +0530, Amit Singh wrote:
> > 
> > 
> > On 11/2/2025 12:29 AM, Bjorn Andersson wrote:
> > > On Fri, Oct 31, 2025 at 02:27:39PM +0530, Amit Singh wrote:
> > >> Currently, hpd gpio is configured as a general-purpose gpio, which does
> > >> not support interrupt generation. This change removes the generic
> > >> hpd-gpios property and assigns the edp_hot function to the pin,
> > >> enabling proper irq support.
> > >>
> > > 
> > > No, it replaces the use of display-connector for hotplug detect with the
> > > DP-controller's internal HPD logic.
> > > 
> > > There might be good reasons to do so, but you need to describe them.
> > > 
> > > I'm guessing that there are still some issues in the DP driver's logic
> > > for handling of external HPD? This should be addressed by fixing that
> > > logic in the DP driver, to ensure that this (display-connector +
> > > hpd-gpios) works, and then you should send this patch again explaining
> > > why the internal HPD hardware does a better job.
> > > 
> > > Regards,
> > > Bjorn
> > 
> > Thanks for the feedback and clarification.
> > 
> > We observed a specific use case where using the GPIO-based external HPD
> > handling via display-connector leads to a functional issue.
> 
> You are describing driver behaviour. It is known that this part of the
> DP driver is broken. There is nothing wrong with using HPD pin as a GPIO
> in the DP connector.
> 

I agree.

> > When the DisplayPort cable is already connected and the display is active,
> > and we perform a system reboot, the display does not come up automatically
> > after boot with the current configuration (using hpd-gpios).
> > This happens because we do not receive a connect event post boot —
> > the GPIO-based HPD path does not generate an interrupt in this scenario,
> > as the line remains high and no edge event is triggered.
> > 
> > However, when we configure the pin with the edp_hot function and use the
> > internal HPD logic of the DP controller, the controller correctly detects
> > the HPD state after reboot. The internal HPD block generates the necessary
> > interrupt, and the display comes up automatically without requiring a
> > replug event.
> > 
> > This behavior aligns with other Qualcomm reference platforms where,
> > if the controller’s internal HPD is available, it is preferred over
> > the external GPIO path. Using the internal HPD provides more reliable
> > detection and keeps the configuration consistent across platforms.
> > So, this change ensures:
> > 1. The display recovers correctly after reboot when the cable
> > remains connected.
> > 2. We leverage the controller’s native HPD interrupt capability for
> > better reliability.
> > 3. We maintain consistency with other DP-enabled Qualcomm boards that
> > use internal HPD.
> 
> I think, this DT might have been purposedly written in order to show how
> the HPD signals can be coming from the GPIO pin through the external
> bridge. As such I'm really reluctant to ack this change.
> 

That is correct, I explicitly wanted to describe the connector and the
HPD signal therein, and at the time of merging this worked (I was even
under the impression that we do get the right HPD state at boot and
bring up the display, but it's been a while so I'm not 100% certain that
I tested that scenario).

I'm fine with dropping the hpd-gpios for reasons such that the HPD
hardware does a better job at HPD handling - but that's not what we have
here. So I share your reluctance.


PS. Using the internal HPD for detection implies that we need to keep
the DP block powered and (partially) clocked, so we should at some point
figure out how to dynamically switch between GPIO and HPD...

Regards,
Bjorn

> > 4. edp_hot follows the Source device behavior upon HPD pulse
> > Detection [VESA DP standard v1.4 section 5.1.4].
> > 
> > I’ll add these details to the commit message in the next revision.
> > 
> > Thanks,
> > Amit
> 
> -- 
> With best wishes
> Dmitry

