Return-Path: <linux-arm-msm+bounces-57014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D9AACEC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 22:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B5A1BC07A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2A625761;
	Tue,  6 May 2025 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8v7+Z63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C00D372;
	Tue,  6 May 2025 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746563004; cv=none; b=Jxqp8ZTK79txLXxeHC0RYSRTJGzLad/g8gRws9l/3cQ+WR34RyYKqjxbXcA/zIuY91YiYHSCgelKpx8ErUCysTSyqx5r8Z0vVXecMRNVupY3oZEuncyV8ToYzlPaT2gPlAJ+wLKb7pBDhiZEJj/pYCNeEy8ocvlJLXnRenyuDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746563004; c=relaxed/simple;
	bh=JZoS77bwlb3qo0vjs7rkqCS4ofr7Fru3B+rU59+jDAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEuvrVDm5G+dKrHYyT2dEaG9f2JISYQI2WMoR3sWFK5pTG0f3TWtOud0042edNbdpKA28zUHyOvd5k3Pc5kLtQ7NwkEaA9i6yRV0FOvn7w7OZdtWHJM6Hu80QZFzAVIKmfOhjiIIjknFO8Z3ai8UwexKvy7936JAMvN7FRi+XHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8v7+Z63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1EFC4CEE4;
	Tue,  6 May 2025 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746563003;
	bh=JZoS77bwlb3qo0vjs7rkqCS4ofr7Fru3B+rU59+jDAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8v7+Z63AUZmTM6mHNpAl6ots9EDK1X4LCKQZVEdhnbgzLPe0A5TKE0HwPQXdyyNZ
	 kTRkriSKyQpB344LDzQKbzCXjZcyq2t5vLVNVvraJriFQA4KF1FaA2qZ0dlwHqojHb
	 cQEVYtTguGIzCjkM+93OzT4a46AYW9pVsyjuKiCyfmWzMxuSOSwaFx4Ak9Q9Nux/vK
	 zS18CyoDrdHMtCHCkITnbks4LJcHLQIfLK82aNLZEPpN/+g2esQYo+4f18nMRuHEqO
	 VpXxjBmybGBjvZzvCIgVkd6sROWjVDPPMSvqPq53sgbkD3A6pO8zPh4maFX7oXhnRP
	 HfHRfZmzA9elQ==
Date: Tue, 6 May 2025 13:23:21 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <4lmt5cgg2tanrughooxw73h2brwyyc6ifqgo3ju6iz4enkvkic@umeijjk4ijxg>
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
 <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
 <CAO9ioeWaPKXHgNGPx5q34+RP59PMLD+EVK5fQsN89KC9A1ca-Q@mail.gmail.com>
 <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d79790e5-52c9-4135-8f3c-af797145fa2d@oss.qualcomm.com>

On Mon, Apr 28, 2025 at 11:14:18PM +0200, Konrad Dybcio wrote:
> On 4/28/25 12:48 PM, Dmitry Baryshkov wrote:
> > On Mon, 28 Apr 2025 at 11:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> On 25/04/2025 23:49, Konrad Dybcio wrote:
> >>> On 4/24/25 6:32 PM, Neil Armstrong wrote:
> >>>> Add DT entries for the sm8650 iris decoder.
> >>>>
> >>>> Since the firmware is required to be signed, only enable
> >>>> on Qualcomm development boards where the firmware is
> >>>> available.
> >>>>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>> ---
> >>>> Changes in v2:
> >>>> - removed useless firmware-name
> >>>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
> >>>> ---
> >>>
> >>> [...]
> >>>
> >>>> +            iris: video-codec@aa00000 {
> >>>> +                    compatible = "qcom,sm8650-iris";
> >>>> +                    reg = <0 0x0aa00000 0 0xf0000>;
> >>>> +
> >>>> +                    interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
> >>>> +
> >>>> +                    power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> >>>> +                                    <&videocc VIDEO_CC_MVS0_GDSC>,
> >>>> +                                    <&rpmhpd RPMHPD_MXC>,
> >>>> +                                    <&rpmhpd RPMHPD_MMCX>;
> >>>> +                    power-domain-names = "venus",
> >>>> +                                         "vcodec0",
> >>>> +                                         "mxc",
> >>>> +                                         "mmcx";
> >>>> +
> >>>> +                    operating-points-v2 = <&iris_opp_table>;
> >>>> +
> >>>> +                    clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> >>>> +                             <&videocc VIDEO_CC_MVS0C_CLK>,
> >>>> +                             <&videocc VIDEO_CC_MVS0_CLK>;
> >>>> +                    clock-names = "iface",
> >>>> +                                  "core",
> >>>> +                                  "vcodec0_core";
> >>>> +
> >>>> +                    interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> >>>> +                                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> >>>> +                                    <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> >>>> +                                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> >>>> +                    interconnect-names = "cpu-cfg",
> >>>> +                                         "video-mem";
> >>>> +
> >>>> +                    /* FW load region */
> >>>
> >>> I don't think this comment brings value
> >>
> >> Right
> >>
> >>>
> >>>> +                    memory-region = <&video_mem>;
> >>>> +
> >>>> +                    resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> >>>> +                             <&videocc VIDEO_CC_XO_CLK_ARES>,
> >>>> +                             <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> >>>> +                    reset-names = "bus",
> >>>> +                                  "xo",
> >>>> +                                  "core";
> >>>> +
> >>>> +                    iommus = <&apps_smmu 0x1940 0>,
> >>>> +                             <&apps_smmu 0x1947 0>;
> >>>
> >>> I think you may also need 0x1942 0x0 (please also make the second value / SMR
> >>> mask hex)> +
> >>
> >> I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?
> 
> I saw it in docs only, maybe Vikash or Dikshita can chime in whether it's
> necessary. It would have mask 0x0 if so.
> 
> >>
> >>>> +                    dma-coherent;
> >>>> +
> >>>> +                    /*
> >>>> +                     * IRIS firmware is signed by vendors, only
> >>>> +                     * enable in boards where the proper signed firmware
> >>>> +                     * is available.
> >>>> +                     */
> >>>
> >>> Here's to another angry media article :(
> >>>
> >>> Please keep Iris enabled.. Vikash reassured me this is not an
> >>> issue until the user attempts to use the decoder [1], and reading
> >>> the code myself I come to the same conclusion (though I haven't given
> >>> it a smoke test - please do that yourself, as you seem to have a better
> >>> set up with these platforms).
> >>>
> >>> If the userland is sane, it should throw an error and defer to CPU
> >>> decoding.
> >>>
> >>> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> >>> would prevent .sync_state
> >>
> >> Well sync with Bjorn who asked me to only enable on board with available firmware ;-)
> > 
> > I'd second him here: if there is no firmware, don't enable the device.
> > It's better than the users having cryptic messages in the dmesg,
> > trying to understand why the driver errors out.
> 
> I don't agree.. the firmware may appear later at boot (e.g. user installs a
> small rootfs and manually pulls in linux-firmware). Plus without the firmware,
> we can still power on and off the IP block, particularly achieve sync_state
> regardless of it
> 

Not "available during boot", but rather "available for a particular
board".

We generally avoid enabling device_nodes that depend on vendor-signed
firmware until someone has tested the device on such board and specified
the proper path to the vendor-specific firmware.

Are you suggesting that we should leave this enabled on all boards for
some reason (perhaps to ensure that resources are adequately managed)?

Regards,
Bjorn

