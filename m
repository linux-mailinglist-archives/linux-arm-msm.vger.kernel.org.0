Return-Path: <linux-arm-msm+bounces-72150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E88B44AB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C14D54759D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BB413B293;
	Fri,  5 Sep 2025 00:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jY/QQlXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158F85260
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757031312; cv=none; b=tOWQf/FfCFKGhnpJnEpJ5np/3w40mwhajNOlYJdl33t7P3xVL4O356nqgEw69lZzKCyC9ubRR3c+2isk9sHVIaPxltlERKYftFt0ebDcJuCRYa9naJwGLM+EuaYC+x5Yfu6i4NjZo9Iwni770Nji/w4Q+ydTg6z0qVxArVKJl18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757031312; c=relaxed/simple;
	bh=Nq0tYidYcWS7UH25GXS90yDlOI6V78+FMA1zNge1d5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ/S3UTJ/9xBK+Ui8RCKxMrR5TecqsDd/uwv6mQ+khQxvhj1910UV24yFr0uBaHyyiRYCC0cnExFxyZzy+yvcl/rFAkiXYyx2sgXb9Etso4fEuGBfvMR9A07HPOr8kCvBIzr4WKScZ7CBbeSrKgCXeklsbOZdyLheC6bGWCuQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jY/QQlXW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so12434515e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757031309; x=1757636109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1n/rQnUEn7GyoDZq+ztDxxjMsob+AoSXhZdfC132cBM=;
        b=jY/QQlXW+u68hBDecsKP+XYKy00bhXjjQHeBt18e0JUeqhlLcEtM1K023F8DYbq4hc
         HA2az4zSd7QeLuVCbypOT/SrkbSkRot5cngY5Vti4rbVYmEGlpf18PlhV0BdNkiH879f
         ws6j2bB8G75JN74+SKVbyUF12Tjd7ZQH7WfLnydPmgtmf4Lm4eMj2fbIX754DVfmnw3n
         KxtL7Wth7cZW6oGjyKBlLi4YjxBUg6tv1Ks4FCEmpBiUl/Mq3Nw20+wxEpnA0mr4R4FX
         DQNAt/WRFY9MOBhMAaYssvKPUhxJ7wyvZ8CKbCq/Li6/imzxLwCf/2FW5O+mD0pSC2No
         7s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757031309; x=1757636109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1n/rQnUEn7GyoDZq+ztDxxjMsob+AoSXhZdfC132cBM=;
        b=oaHdO2o7XEhx8przR62VdBfykRg9Imx0i0bkRLuAhqaHul3zfJ5d/eaAEOrXEj4q/C
         UJswhvBLwMHBf8WXYCblfU/+7E2OtwkSs7YX3oXlukV2FGlh+u06HFLnieaRiCtQWOvM
         EyTaXwKKSgF/SpVZo7mjGI6rXCQIOH52tgcBApZADjp21KlJzhy0BBEYnUAa5xU7YfKV
         oZMY/8kgt7zf29iDx/j/g9jBNI5IT5pHkpS3tKfSITYjkCJSEIOdHPJx86rLw+N0bcok
         i+VuW04l6d+Uie/6SMV4tUuTOkBBQyMuU8qX7TqJreyk7clzb+95u5vwREme6W5QX9yv
         4V6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWITgknQHbuNiHWquc+uC7A997jjc1jEeQvuiPNzi70M2BhsVNo/tBCDG3JDEw5+8T7exS+6dgeopl+NT0R@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYhDm/OhirwjJvuir8nqTtj63PvZFrFsW2GIYDOHcXqw5liXp
	FFxJ/B1ux0XRPgiISm1rVNjxRbkWz04j62Ftm+29ERXIkeDvOUf3iVBCIr7zwo59y0Jetg/nDkx
	PFUxiVylIbr/7AdMH4Ii+mSO/pV+gTPkQgynpEo6t2g==
X-Gm-Gg: ASbGncv/7JAkYdkMDiZVPxG/eDjoHgBCUfLf65cCZvCm3BMb+KiK4p9seJEaiXNDKMB
	y+B0wPiY5i1Ugw9s8yW1dVY5jPk+XB7AW4oGnd0+iMb3JdVWyzFOINqaB13GSOeAcbM0ENf/WF3
	a0U358Qvp4zWzEVmRlaGHXoZhg3Ah/BdgnbrsTyzknxa2hVnc2NWwhz3qxsRRQNC0Uf2xmlBgDp
	EG3bQ==
X-Google-Smtp-Source: AGHT+IGj15U2Ts3kcu6tXtZt1/h5FIY/A1yk077GAC+Jyg1MndthZQ2lQpMOj8u6CbNn4gsvAMKWNZ1fsXJvpx9WBYE=
X-Received: by 2002:a5d:5f46:0:b0:3d5:6551:4016 with SMTP id
 ffacd0b85a97d-3d565515fe6mr13823174f8f.14.1757031308792; Thu, 04 Sep 2025
 17:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
In-Reply-To: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 5 Sep 2025 01:14:57 +0100
X-Gm-Features: Ac12FXzgGD8FfSa_WME3qIhlvvQzp0tW_Hx2PtWKp2ZbsjrohS1FvpsYw3rDPSs
Message-ID: <CACr-zFCjrQAM0W9NnWJTwGYc=MnR8ODawW-DK+LJjRJYJznaEQ@mail.gmail.com>
Subject: Re: [PATCH v7] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

Any feedback on this patch ?
I'd love it if you could consider it for inclusion in your next qcom
pull request.
Or if there is any issues, I can send another version quickly. Let me know !

Cheers!

Chris


On Thu, 14 Aug 2025 at 21:16, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
> panels. This patch series adds support for the OLED model which has a
> Samsung ATNA40YK20 panel.
>
> This series depends on [0] which adds the edp_hpd_active pinctrl node.
>
> With this patch series the backlight of the OLED eDP panel does not
> illuminate since the brightness is incorrectly read from the eDP panel
> as (to be clear this is not a regression). This is fixed in [1].
>
> [0]: https://lore.kernel.org/linux-arm-msm/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org/
> [1]: https://lore.kernel.org/all/20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org/
> ---
> Changes in v7:
> - Remove patch adding edp_hpd_active since now handled in Stephan's series [0].
> - Properly add OLED brighness patch as dependency [1].
> - Link to v6: https://lore.kernel.org/r/20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org
>
> Changes in v6:
> - Squash patches adding "edp_hpd_active" node & its user (Johan).
> - Sort new pinctrl node correctly by name (Johan).
> - Use correct function "edp0_hot" instead of "edp_hot" (Johan).
> - Drop review tags.
> - Link to v5: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org
>
> Changes in v5:
> - Move edp_hpd_active from T14s DTS into SoC DTSI (Dmitry).
> - Link to v4: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org
>
> Changes in v4:
> - Rework HPD GPIO into eDP device rather than panel (Johan).
> - Drop review tags for HPD GPIO patch.
> - Link to v3: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org
>
> Changes in v3:
> - Added review trailers from v2.
> - Dropped dt-binding documentation patch (applied by Douglas Anderson into
>   drm-misc-next).
> - Dropped eDP maximum brightness patch (will be sent in separate
>   series).
> - Removed duplicate nodes in T14s OLED device tree.
> - Reworked WIP comments from commit messages.
> - Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org
>
> Changes in v2:
> - Use the existing atna33xc20 driver rather than panel-edp.
> - Add eDP panel into OLED devicetree.
> - Add patch to read the correct maximum brightness from the eDP panel.
> - Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
> index be65fafafa736a0401a5872c40f69cb20cfbbd90..d524afa12d19b2a6f22a24b9bed6b6b40248375f 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
> @@ -10,3 +10,11 @@ / {
>         compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
>                      "qcom,x1e78100", "qcom,x1e80100";
>  };
> +
> +&panel {
> +       compatible = "samsung,atna40yk20", "samsung,atna33xc20";
> +       enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +
> +       pinctrl-0 = <&edp_bl_en>;
> +       pinctrl-names = "default";
> +};
>
> ---
> base-commit: 33a21dab19b31540dfeb06dde02e55129a10aec4
> change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
> prerequisite-message-id: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org>
> prerequisite-patch-id: 658fd45e0cb953e3c667a30f2cf78cfd3582d552
> prerequisite-patch-id: fc665d8cdd099464e6fa4401489fde70b65bed30
> prerequisite-patch-id: 13ff38b40f2dcb283be82485e88ca4efc249599b
> prerequisite-patch-id: 7d02075f074ad8f32eeaf5ee8833d0c6a230cea8
> prerequisite-patch-id: 380fed6c07ca1ecdb73768054454e47c984d00e9
> prerequisite-patch-id: 1f8b24fc983fa23abc97512e15626394ce760ffe
> prerequisite-patch-id: 7d29e2fee2b19cf2d12d54cca052b1c1fb808c9d
> prerequisite-patch-id: c5bf1706ecf4df7782707bbf0d18a0568842b562
> prerequisite-patch-id: 34889448fd92cdc916e7e19eac8446710d2a646a
> prerequisite-message-id: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
> prerequisite-patch-id: ceed93f46ae27c7980c5b57022068daaad8dc8c9
>
> Best regards,
> --
> Christopher Obbard <christopher.obbard@linaro.org>
>

