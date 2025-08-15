Return-Path: <linux-arm-msm+bounces-69351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29372B27D24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 11:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2DD3B05F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 09:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCDB2DAFCE;
	Fri, 15 Aug 2025 09:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBfGXCgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD13B2D9790;
	Fri, 15 Aug 2025 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755249992; cv=none; b=GiwjmzFnCk0bBvIvDKKJ76aGqWcNJ3FmJqxBq3vVtgUFAcfYCw4+PR59PGhJ+bRdt2nW2ejfcugg7Kk56BtllVG3vFjClnobYHXfaCJM6ybSpL3SP/bGFpxz8e16E/KNORxCC/mlZ6sJgD4XtmneqbDhvs1rh6blALlmLGUdO3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755249992; c=relaxed/simple;
	bh=hfyXKa7VqlCzw0dsZGP8/PsmTOCbKgzez9WpVykwbe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkQ90NTEFKJKfRBhv+qYSryhuCi3ypx/a5/BuuM90qDS49gcp2jg2bHkfrRbQfiD/TgrpJh2N9K3i6ajdXbuHdEKpiu6G6JjfdySGjVmA4u2lUcqOQ5vQCJOCPcFbkL67cxIx9PtVYEvd1ciyOA73Rw+rPFcpgh9V8ws4cutubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBfGXCgO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2445806e03cso19545665ad.1;
        Fri, 15 Aug 2025 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755249990; x=1755854790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uo7uf3WJ6z+yWzRmAPAiNGEx7EWhy5TbeTpgbpYSOgk=;
        b=KBfGXCgO14RMkaWX+78CvgENILksJViDbnXzuXMO3h37m1XUlFHD6jKITzHKY0FeKR
         FXI3mtpMiLUYqHMMBe5Agk4hmV4Rs54WjogAdPU7AijxsHeoi13hoYhW+yPpQ194EM7a
         ZotV6S04Cdb9lfeZYzFSlBgq9rWbg9cnzQRyz3sBAdfdg5fV9aaCnbesH4axx99cZdRf
         JYom5Be6b36zl57oMdEHpwoqr7C5T5RZJ2QWidReyuNPPE7Zq+myCXqi/99Wsvltq7xp
         d0BwFmUWAen+SfdVojHJ4L1O025rdTlOOroyQ8q1rDC9CUNAk/+ukDbAP86Px5txhXjS
         7r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755249990; x=1755854790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uo7uf3WJ6z+yWzRmAPAiNGEx7EWhy5TbeTpgbpYSOgk=;
        b=CnSLgbNA4SswWSOy92xu0/o68DFcFPGUmPNSU8WFDCFxquFAP+Twd5TcCBBQnMuonJ
         /GukfwCJWSHxY2QnTfinX0RGAM+LblXBbf0qu161WrLLwkaVHMMNvtsEAjSwvVYT2f3A
         K0P5ilima+1bjqFhUiVIZhsrW8fau40pBMC4sA6bEkHC+cAOdZDgHOVnMCycJgXochju
         TU/m4Mk5jYsgebljJ/Q2xsC9xgvzYHmt+WghlSrQXEcjKsAsnoJlWG0D1JEvgswgz2aX
         38QB0mXzIZcfryKH2wD4QAki82fftRSnMKVTRu8d7loZFmF9fyA+lafIEUt0BMjytAg/
         Asow==
X-Forwarded-Encrypted: i=1; AJvYcCW/mNT4irCCVzQDuQwQOI+vaE4K7iXrLtW/L6AcC6r+XHkacDDizgMcidUwtuZmHklZC8n1pF+BKr/B@vger.kernel.org, AJvYcCW4JJHnT0nCAmeMd6IiB5Xe/0Qnfp5HIgBlQ+etEIFIseC1okDQywxyPBC0DFrJotMGbXvnPuSUuODaiTiWdQ==@vger.kernel.org, AJvYcCX8iiOjMEOHyH3gWLWaFyoWjn12xP8hUEIoaWBQq+JQ3B2wBosBkFw0sHFZlgeX9W7gOj1hRNFMFFzBJPLY@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUOJX1qlfZDZ03hE/Jzl9SDATGHo+Ts4OFKU/ndqrqoz8nm/U
	BBgCDc1C6rtW7Io13p/cqrJlWlro8oRb6jeq43GQi487au5oihuKDzyXnGaLfW/URudotJX/yel
	wHLCEtISWaSnkUvLtAKjZVQ/sPso6fQ==
X-Gm-Gg: ASbGncvH4sOSxTxX1/dZx/P77W6GM2DFCbrpk28OWe4F4HVvAyIwfW8U4Kd8FhL0UOL
	v/cSh/dIH1i9m/6bs69Yma9C7lXJRP1xnqfHU2mlJwlp7RhtS9urSfPmXPEv55JlTLg6axy5GLT
	bGbbOm6042BQtefki2QJ+a+WeWmtevfkT8oxI92o+o/rpiuKicES7fvlu/VjZZt+RM8tAyUQvH7
	Sop3V4=
X-Google-Smtp-Source: AGHT+IEJs0DhVKkrYh27R/JACZ6LJCcxDtk4IGIzVD8IWl0nJ02HH+2s5qsqeAyyLggmI8EGAqi731EEjfq3cr44tco=
X-Received: by 2002:a17:903:2381:b0:240:3f36:fa78 with SMTP id
 d9443c01a7336-2446d7a5a7cmr18869945ad.21.1755249990018; Fri, 15 Aug 2025
 02:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org> <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
In-Reply-To: <20250814-x1e80100-add-edp-hpd-v1-1-a52804db53f6@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Fri, 15 Aug 2025 11:26:19 +0200
X-Gm-Features: Ac12FXzyj1y7ogC1MOBpDITJybutBYnpxJuu6wGW3-_8QXjEWbVdNPWvMl09xCI
Message-ID: <CAMcHhXpsY9PQ6v3Jizt6ZnQkKtzd30T2XbC8mo571nMeG-0WpA@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: qcom: x1-asus-zenbook-a14: Add missing
 pinctrl for eDP HPD
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Srinivas Kandagatla <srini@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Aug 2025 at 15:30, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
>
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>  ...
>
> Fix this by adding the missing pinctrl for gpio119 (func1/edp0_hot and
> bias-disable according to the ACPI DSDT).
>
> Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>    # FHD OLED
Reviewed-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

> ---
>  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> index 16d045cf64c08c02c420787e000f4f45cfc2c6ff..613c675aac296f931293a1ba3d8506c6663bad21 100644
> --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> @@ -1001,6 +1001,9 @@ &mdss_dp1_out {
>  &mdss_dp3 {
>         /delete-property/ #sound-dai-cells;
>
> +       pinctrl-0 = <&edp_hpd_default>;
> +       pinctrl-names = "default";
> +
>         status = "okay";
>
>         aux-bus {
> @@ -1236,6 +1239,12 @@ cam_indicator_en: cam-indicator-en-state {
>                 bias-disable;
>         };
>
> +       edp_hpd_default: edp-hpd-default-state {
> +               pins = "gpio119";
> +               function = "edp0_hot";
> +               bias-disable;
> +       };
> +
>         edp_reg_en: edp-reg-en-state {
>                 pins = "gpio70";
>                 function = "gpio";
>
> --
> 2.50.1
>

