Return-Path: <linux-arm-msm+bounces-52896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF7A77034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E5C165FE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A4A21B90B;
	Mon, 31 Mar 2025 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KrwQOM9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E99189F56
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 21:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457134; cv=none; b=pevEADXCbue2Jw9WLDswzw0bOJ42N47WeIKWzIDoJBeafzDMBpVhC2NEIlUUbOc1rhPV8FHlEkn5qKVzCcM6ZnG0yXnpCKZsPN/OXQdf+roVUslkR1r48PDFuMOITe+YQBND/+zwcL72CyK7bCISdxLW0lcGqXV/lFQBSh5vFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457134; c=relaxed/simple;
	bh=OIAE+MjHZV6xrHpJw7s0jGQ6OpCQDarV8D+ev2zZvbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKL+R4ODAUhPY7oYBtdhKYXTZ5eV5R3K6HQA6r2u+DIBxhOrHTxRh5iqCcfUJPIngjtE4qqo/Tjmz2hWDnAr1XMBLoXNmFjNfk4hIjWGCQVB9VUlDdLQoop0o9oWU8LNdw6Qya8fRA4dYF1rZNVilo9BSO9X93oZrVeFVcE4o/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KrwQOM9L; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2760773f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743457131; x=1744061931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ox74jAlQCOXUz9R47Wh4BN9DQoXSv8br0RYQThLQg4w=;
        b=KrwQOM9LSxI7RmzExePii/L5v3829vp4I3vOGSUVJLrxe8nsywAhy9obqVDnNtpR6S
         bIpyJY0W25kqDrO2475lWbM0xs0brpQ24QDW1lLp6NYFIykNWKvMAT1Dhgz/w9g/C0Wm
         Psj0uoVUJ3SMDDecJrVmzc/gYF05oTSfqkQvr2XMra7kTV/Tl2eXD6kz+Nn9EMWVdp5c
         D9l9s7FLBf/r3uC6ofugx2nJ98dcqWApRW32+8JvzHhAtoP9FYp3vV27E8N5K7yToR6x
         lbWoLnEZtXVIl1DKzeS0HgMzTnSZLYQC66zyczEEajMoMFt050plT5AiwHlonp61sqn5
         otWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457131; x=1744061931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ox74jAlQCOXUz9R47Wh4BN9DQoXSv8br0RYQThLQg4w=;
        b=rEWvgPUMEUhJLQ6f2tBXQHG9bMV1aj4EB7jbjx8q9uKDXYuuv8OY9ofqJGXvTl5dNP
         p6KRahui6tqdrIBBYO3zT6fIQMeV0cdhG8AHPBd3zTByu8Md+WHPIJkXE+Ec0ko8u14C
         Ax+J1HLM4yFO0zTNnVnP2mTEbfcL94VQvlceX7FU9c0UMOk8dtjNJRkPcjFWBf1F+nip
         f/1oFq5KGk6YUfmDkkL7Asls9zi94a7biGXCZ9IdJkWPThwQz9qAcy1aw/FRoNhR8NvU
         NZUQiK8i/+gAfDfg2hC4uyR1lgDMJshEumU/DTHfXwRMQcxcJ6QCTNYsxE6hSTmh/rbr
         PZvA==
X-Forwarded-Encrypted: i=1; AJvYcCWUv71u98AYSPY1812JB3AyMTZdiWM5yEzQJA41nZOrUxS5EdDZjOhj37O1B0ofbaykXetuMDF5fyXvrj63@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0L6vjr6KOhKPuxGyM3OOAqHNRolawK8AWnzUu+kLwAwDWaVy
	qJnJSJRDIHozGK1AVteLXWztB7upKfX8VwYlizU8Tqd0NrcB2OM26RVvWvYETH5CWtQ8sD2HdP4
	vXYnJxUhVSN3kz9f9rnRHi8/QIL62fSm88N0juw==
X-Gm-Gg: ASbGncsE6TL2dRV0KXvuP1Fx5wxrzXWnnMuD+d9Uv+LspkEvqgZot/xjl7A0f1G/++v
	UxHAKPxfoR8lZi9ZGjFL9HlYGxSkQln73XX97Q4s5BBX3nVO7cn4ZScTjAUvdEJCET62cVA9QQz
	5K3wYO0xlQz/BfZVAztURX4KLWEoC4
X-Google-Smtp-Source: AGHT+IE9oFoESW7P/0RYmFnE3L5hny15XPQW5TDUPiB2qjZZuZ02OIP9kzJqXS2Yd3vzhwo/5IhHu5gYhTl4DRehvks=
X-Received: by 2002:a05:6000:420a:b0:391:3998:2660 with SMTP id
 ffacd0b85a97d-39c120cb8aemr7727506f8f.7.1743457130570; Mon, 31 Mar 2025
 14:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
 <Z-pJP4PMwPo3L3Og@hovoldconsulting.com> <CACr-zFA_oSySRnA2VaSQk2ND_AHeyt3v=RuPTbABPM7SYown6g@mail.gmail.com>
 <b4983b93-97fc-43ed-a41c-a44f90773062@oss.qualcomm.com>
In-Reply-To: <b4983b93-97fc-43ed-a41c-a44f90773062@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 31 Mar 2025 23:38:39 +0200
X-Gm-Features: AQ5f1JqS7_0iOlATZpsQl1aZ_ovAj_zC9EkVcEt6c_OLO56CTepuvb55ZRJsI1s
Message-ID: <CACr-zFDDPfRXZYUsbMoBASU6O5mBmqiFNFBtZTL9_vbo_7uANg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Mon, 31 Mar 2025 at 17:49, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 31/03/2025 18:39, Christopher Obbard wrote:
> > Hi Johan,
> >
> > On Mon, 31 Mar 2025 at 09:50, Johan Hovold <johan@kernel.org> wrote:
> >>
> >> On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> >>> The eDP panel has an HPD GPIO. Describe it in the device tree
> >>> for the generic T14s model, as the HPD GPIO property is used in
> >>> both the OLED and LCD models which inherit this device tree.
> >>
> >> AFAICT, this patch is not correct as the hotplug detect signal is
> >> connected directly to the display controller on (these) Qualcomm SoCs
> >> and is already handled by its driver.
> >>
> >> Describing it as you do here leads to less accurate delays, see commits:
> >>
> >>          2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
> >>          3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
> >>
> >> Perhaps you lose some other functionality too.
> >>
> >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> >>> ---
> >>>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
> >>>   1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> >>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> >>> @@ -980,8 +980,12 @@ &mdss_dp3 {
> >>>        aux-bus {
> >>>                panel: panel {
> >>>                        compatible = "edp-panel";
> >>> +                     hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> >>>                        power-supply = <&vreg_edp_3p3>;
> >>>
> >>> +                     pinctrl-0 = <&edp_hpd_n_default>;
> >>> +                     pinctrl-names = "default";
> >>> +
> >>>                        port {
> >>>                                edp_panel_in: endpoint {
> >>>                                        remote-endpoint = <&mdss_dp3_out>;
> >>> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
> >>>                bias-disable;
> >>>        };
> >>>
> >>> +     edp_hpd_n_default: edp-hpd-n-state {
> >>> +             pins = "gpio119";
> >>> +             function = "gpio";
> >>> +             drive-strength = <2>;
> >>> +             bias-pull-up;
> >>> +     };
> >>
> >> I checked the firmware configuration for this pin on my T14s, which
> >> does not match what you have here. Instead the function is set to
> >> "edp0_hot" which forwards the signal to the display controller which
> >> already handles the signal on panel power on. (And there is also no
> >> internal pull up enabled).
> >>
> >> We may want to describe this pin configuration somewhere, but that's a
> >> separate issue.
> >
> > Thanks for your review, I will send another version in coming days and
> > drop this first patch (adding hpd to the T14s DTSI).
> >
> > As a consequence I will need to add no-hpd property to the panel node.
> No, you won't. There is a HPD line and it is routed to the DP controller.

OK, I think I misunderstand what Johan said. After taking some time to
think about it in more detail:
- The first commit will be changed so that the hpd GPIO will be added
to the X1E DP controller instead of the panel. grepping the source for
dp_hot_plug_det shows me how to do that. This part is clear.

- The panel node in the generic T14s DTSI should not have the
hpd-gpios property / pinctrl set.

- The panel node should not have the hpd-gpios property / pinctrl set.

I hope I understand that correctly. I will send a new series in the
morning unless there is any objection.

Thanks

Chris

