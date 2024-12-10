Return-Path: <linux-arm-msm+bounces-41355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08D9EBAEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 21:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA17D1887E73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CA922ACD5;
	Tue, 10 Dec 2024 20:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+TiFuME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1E122ACCA;
	Tue, 10 Dec 2024 20:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863489; cv=none; b=RKTs2lN3BaZrAdyX1qNiCCxG3IcEKiv0PMH1v1e1FseOkwGh2m7ff85ijXshhAlQuX08D99gC8S0RNLAZ8p0g15lXIJyfuCzpheI2oeUjgJvA9EH+Firjl/PT2XwlkpMfTYg6mS5doL1f7zwwjl1cjKwp5ZWiA8tM0veffa6600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863489; c=relaxed/simple;
	bh=wiUU5YoAOZ55YgXTrWBqWI5AoAogjeS3OF3MSNstWk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfxAQQxAlds7utV3UDws4ERJm30JYsIwCCN6TDRRsnbjs21H/96Lu5ivv+UXfkKIUIdCIK4A0dY7XCbTua4CvFRpkr+Bz/JVzgvNH27hznleRollcMcXCEfPhdPX3AQYIOoBqEU3U9wMo4UT6huRy4JpEe4FzbnnvqyToSZE7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+TiFuME; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38634c35129so2720361f8f.3;
        Tue, 10 Dec 2024 12:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863486; x=1734468286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iwyCGq8tBYpLXJEdw3+rIczGnurdoKFj8KXQjbjaFLk=;
        b=P+TiFuMEG1NA173QcmlA48DkpWa8gvrrY2it6aspRDqEU7CcUWx48EUgrEaZgIVEWo
         Nv+jMciUUy9bjgcujg+G8EavaystUTtGcu0eTa3gt5rrJT6ZWn/1Hn3xDeJF6J4W8W50
         aBzl3Hv4x5gTU/Fv/vHA7KcBZViaftR2ZtFEbOgyBD663U9YAcIdqkCALmmQu7RP8JEU
         FfLYV15Imdon9Vtm9OJDmrMwtTCjcwougWy4QGa1Lp/zhibIqBS41SsNdOuDz9vgmc4/
         39B55CW6ltLJlqSTQfOrDXRFRBX2LSzYTPF9sooSKFySwJvner2EHXuRaBMxUoUSoPhs
         p/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863486; x=1734468286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwyCGq8tBYpLXJEdw3+rIczGnurdoKFj8KXQjbjaFLk=;
        b=E23YrhZvYqVl/mYtUG+g6Vd+Poo0500+K54AF789C6rmCKBeMe9yHJTWM3XajOGaV7
         69hVNcVFd+fve/AIjs5Lmz9oUOp/ZSfsR4X4lDz7SsZDRlFUaX6X9tpHBBDnLLxWdrfm
         dWV/vRijjrIxgtWroFoSIQeFVBIu0hyydIEB+KD3LuJ7KGlVcx06sxR45Gi7u9nsmHjz
         qX/zz8rBOWNLSTwm8heV/bntnAMuSDEF8d9T0bWWtIzv0MpJZYA05tIHtE664nNPUhRk
         +b9SpBMB2vBI8R0IGpHoBdt+fDLuvPC1J8QOkA5HMCl3gcwRNTvRYWx/RgBUGUY+p6Ne
         sWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8zGsqK6+xL1VZ5DYR3QY9XYgYn66wUvz/isC5igJctUhwaLYaqejWEZo2D+xtYjEb9rjE9P7znoXBJPIZaA==@vger.kernel.org, AJvYcCWg75HEXNdnL4IQlH6AS9YtcT00al5+VAL4mlDyGForKmysvjYk5PusXkusT0wFTG62C75y3wTdOlpo/uNF@vger.kernel.org, AJvYcCWqgWzeSGAntP+26wN7WGuxLUNBlXFe4rbIUzmguJWqU6DpYilQH1AlW6eNJnnGPoWhguEeiG74oKSg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkoa6F2J3/BUgpsZYvJD1FXp46uRxhyTgX7iKW9hdcTNK+py3V
	Rb3+v8OSdZqnyI8yHsCXWwfbi/LojguHTxeA+U+mg6HhpQo6OXSnNAj7A6ueNywI46XIbajpe1X
	EobQ8PNPAgjXKHCL5mABUviMEZw==
X-Gm-Gg: ASbGncuoq/UIB8p3S/FR0Di/Ng9IEIkoAW/lh6UfPrV14XPL01rVCSLbZo8p3ah4gem
	D6PsmZFTtKN2syRWcCBfudopK0J3suhBhVg==
X-Google-Smtp-Source: AGHT+IFPwHAdLeO/YMpVL8hdXbKSE0DwHsXkmFGiG9KCRAVZmOE5EzTBijPLZ4yvHP6SCrLORAISTAVMWd4Yn5hkinw=
X-Received: by 2002:a05:6000:144c:b0:385:f00a:a45b with SMTP id
 ffacd0b85a97d-3864ce925a7mr280370f8f.21.1733863485135; Tue, 10 Dec 2024
 12:44:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <20241210-x1e80100-usb-qmp-supply-fix-v1-5-0adda5d30bbd@linaro.org>
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-5-0adda5d30bbd@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 10 Dec 2024 21:44:33 +0100
Message-ID: <CAMcHhXpvwR50GCkTvtkmWW4mvV5o9vbMvrvqLiEkJpKDHP_REA@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB
 QMP PHY supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Dec 2024 at 10:07, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
> are actually powered by &vreg_l2j_1p2.
>
> Since x1e80100-dell-xps13-9345 mostly just mirrors the power supplies from
> the x1e80100-crd device tree, assume that the fix also applies here.

Though I can't verify schematics (perhaps Laurentiu can?), can confirm
USBs still work as expected with this change.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

>
> Cc: stable@vger.kernel.org
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index b112092fbb9fd955adca1ae8a76294c776fa2d1e..1aec536218bc2c9197410a43adec291a31f9beed 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -1093,7 +1093,7 @@ &usb_1_ss0_hsphy {
>  };
>
>  &usb_1_ss0_qmpphy {
> -       vdda-phy-supply = <&vreg_l3e_1p2>;
> +       vdda-phy-supply = <&vreg_l2j_1p2>;
>         vdda-pll-supply = <&vreg_l1j_0p9>;
>
>         status = "okay";
> @@ -1125,7 +1125,7 @@ &usb_1_ss1_hsphy {
>  };
>
>  &usb_1_ss1_qmpphy {
> -       vdda-phy-supply = <&vreg_l3e_1p2>;
> +       vdda-phy-supply = <&vreg_l2j_1p2>;
>         vdda-pll-supply = <&vreg_l2d_0p9>;
>
>         status = "okay";
>
> --
> 2.47.0
>

