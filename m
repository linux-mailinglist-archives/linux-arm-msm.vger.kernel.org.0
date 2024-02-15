Return-Path: <linux-arm-msm+bounces-11204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A18566DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 16:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7AF1B2A8CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 15:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C340132C21;
	Thu, 15 Feb 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MpjcItyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2B131E25
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708009253; cv=none; b=c8bQ8RIb1Aj+5zHQslNdv+Fl1315of8DCipNb+EUN3u3jJ8o5P8vP1EJ4YHS9AYh5on+7+mdQcMnEjUn977Gn0Hdff2/5tcoYX0AJOdMb9Yr8uS/DkFNXLtko664+T5GSNug6HK29wh9IhgstNYmOlZpwvtN0H1kx9th0ih0a6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708009253; c=relaxed/simple;
	bh=TuiNAUvyq1clV8TcQUgStWd7GbVGRghSxXf3rSzZwzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ruhd0AFGG+FCaIF/b67tBjPinfl51HaPx75pVqo2PIsD2v5e0cveq43YBqyXxa/hLd+NUOx7RNsfbu62TtWNB3eTGbfzfXiqTh1cbvonIvVHPUOhXfB5L3MQ/tf0pmB4u7Ch+1cIN3l5cD+JvhehA0+mmtpg+q2rFtkXlSxwwsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MpjcItyx; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60777552d72so9369447b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708009250; x=1708614050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ0BMQ4fbAPxFZIL+ExAw2UZkWvzvacKzKpaYXVa9bs=;
        b=MpjcItyxaCUbywq2/eFa9EpNJTbqxHjYzxiGUvadyJ4OpD2g3m4X/lGDCmwdji0F89
         ZI3iiZzXixEt5Ceq2UT/wY6vmjXC6KX5du0vxdF+ZnJH0R4cB96e0DF9PgVExW/+PJ9G
         owZiDKQ4YK3LEngMTT6K1FVQmx2pltalCWdLGmxV766sl7oax+LSo/5H2dJ7jIBfOCG+
         NfeLZACVrTmdxU4rSK1ptNPKzImM3PtzV3W03K/9imOLSjYcvzQJcVGA7a+cKKrbzfVE
         KvGCKypdYp7V70/ltmKfLfVkw2SUm5ku6/RfV+DUnaCYMBLfJG5LnMRxHfhK7cfXTWBx
         Y/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708009250; x=1708614050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ0BMQ4fbAPxFZIL+ExAw2UZkWvzvacKzKpaYXVa9bs=;
        b=BlW/aHZH8lCd32yo7OEdWnngbZV6W/mRBGt/Bp3Nn3d1/bzaoKNeLMYYXyo53IL5U3
         ePIeg1Ae7RVQP7dt9LbkuF13iesrMwncJcbOkNmeB5r5yK9CjvPKoarmUsb++nWw3Zi0
         zn/j15qp8EQ7kxmprj8WHKOqOdcS9k7HKY6i5LVWWboYxtGUtBxqCwebHyxZrK2rIfAH
         pfYwDhH5NG/9fUmE1crIoYezVWoesBYcnRsRkQxjBUrNrtAGekeNdWZbG2fHu4SP1peH
         kAwL4/XX98BuT1T6WpgxAxY7EvzJ+gThkpsZ/MPgXS3a/wI0BWsr8Jqha/t/4pZ2zVWV
         ofKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1diRR2sZqAf/G28DwpKqyCqoappLdpHHyc1YMWbqDPPRzvnh/iCNTq9FxCW0oK2zfxORVftnGUt1ehTT4FNRjshKllX/0d1CVUI8lug==
X-Gm-Message-State: AOJu0YzqBrdYfjzU6x9ealui1ZTgmByp5qAGzKdRdm1s01OhtTNMUzkC
	9UP9d7+pZGBOF4cYfh5ikl/wOimsz8rVzhFGUd2wsoGI+MUcwf9kza4D/imz5ezX6lSz/3XIkfB
	EtMrDlYVDsEJsgMfR9oEaRBMkYOb/9DocetNZxw==
X-Google-Smtp-Source: AGHT+IH1iXXNMam85attnJ7ZRIB2/4oXnewhRdPWa1d/MOJ9E89Emu3qeIMg52lohwW+P6inqZ48cubKQOYzlT5hKRw=
X-Received: by 2002:a81:7994:0:b0:607:7e73:fce1 with SMTP id
 u142-20020a817994000000b006077e73fce1mr2063382ywc.26.1708009249786; Thu, 15
 Feb 2024 07:00:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com> <20240215134856.1313239-6-quic_mdalam@quicinc.com>
In-Reply-To: <20240215134856.1313239-6-quic_mdalam@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 17:00:37 +0200
Message-ID: <CAA8EJpqV=w38TqjfTp6OurAwHjR87PpmQTs2jUo6O7vF1-T-WQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 15:49, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Disable eMMC node for rdp433, since rdp433 default boot mode
> is norplusnand.

Are they exclusive?

>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 1bb8d96c9a82..e33e7fafd695 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -24,7 +24,7 @@ &sdhc_1 {
>         mmc-hs400-enhanced-strobe;
>         max-frequency = <384000000>;
>         bus-width = <8>;
> -       status = "okay";
> +       status = "disabled";
>  };
>
>  &tlmm {
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

