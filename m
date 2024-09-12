Return-Path: <linux-arm-msm+bounces-31660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2E977445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 00:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61BEB1F2521A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 22:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D561C244F;
	Thu, 12 Sep 2024 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZY5QZvqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E018EFED;
	Thu, 12 Sep 2024 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726179752; cv=none; b=P4IW7ZG0O+zYeXc3WXHr/ARzJ+3m8kqBbUus66orO0lfGk6NndY9L2vtQamX+zMR8ZHZRLrj49sKgoml7mi6dKPHtnYaDrUxIPQeGhpkc4KJTbI2Qw7SehD3MXJmph+CykY0/e7EtAMhKlotqfcsFXUhewRqWOjii44VgZFdlOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726179752; c=relaxed/simple;
	bh=hVc2+1JhJrTDAc90j+3UZdmeysg/R73KqlkXDprBFz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7IzAop4A0H4nxy+zPr0A83JqsgLdVOFJgbS1sZwm/bJTlpI9VS+VtZEqcFuuTtXYt08Z26vJ+/JU+o1S2YZZaTjJYYced7SuiBIOBs7U4cbtmIVrnNos2fj6phfzO8MMldiwwOplKhHsha7djEYFNyQTXnT61zeyOYZg+67Xkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZY5QZvqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8D4C4AF09;
	Thu, 12 Sep 2024 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726179752;
	bh=hVc2+1JhJrTDAc90j+3UZdmeysg/R73KqlkXDprBFz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZY5QZvqZXLUlUqEJETl9eoV3ckuLiTSYf50KU/bs+HKqWJtOeYuyn4Ur6SjAOVOSl
	 qdLqij56rf9Pw+lZkHvBwYTpTrQPQVEHYmZTt66M/HKxQgP67y2rNiPuGsIJb4CNk9
	 O66iTMW6AE0lQ9FU3beNP/vbtYeqHTuvfvSVA+fpjjLcgNEdpJ1of0S1rggSlay1RN
	 Dbu8rrsBDcME0JutWUMmJAdyg6/uyw5ZtGUNstYeEt3d/uhkK+wWTqOjuCeT5PeVft
	 psAB7k5lSA4+xL4Uk/hzOSYx5GFiapCQ8OaSHTMui3YhIbB6TBLIp28YgbbKSBIxGA
	 PC2mB4QH/Uddw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-536584f6c84so1980938e87.0;
        Thu, 12 Sep 2024 15:22:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGL7OzSGXQyR33mTj8JRQETU/TWkTqTqzd0Tq0wd/pp9bdp2LY3kGwwf0fDgxHYvJ0qzkd3RtroijW1FP7@vger.kernel.org, AJvYcCVO98Sjg99vjjXEBUcXn7dh4ZB48iqnvxvaM/8Jul+WLtq8wrCpuI6d3jPdSNY2AkqHaZeQ13s+0geu@vger.kernel.org, AJvYcCVW4T5pKTW6XgWZoKK7iDqMu29IttxQI4QihHD0IrZ+IVins5oXo/Gr5HYvQFiQuuEvT7ArtVRSg1gl@vger.kernel.org, AJvYcCWKeTR5i6nDXDaV4fMtA+1P7fafwx/BSxVPlSUaNSpjtnSe9ZQ8ib8PfBoZXi0+eQA994Ln5qytSXU/ST/bdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+laNdiPgjHzvPsTVJsSpMb1KsbeXzNbDcGIIOWEzrdkuzntJ6
	PUfxxb3UugOaRjb9kkWiuNyNA1GDTD3V4bd3kh4NcQEujSS2pvmPymr1dK/Sv5Ny9DuCGPDpyKb
	SU7pOJDgONHvE17V8HKKzmBHxibc=
X-Google-Smtp-Source: AGHT+IH/wdIIuZ88OoM/jf7dlzTynCo2+ye8Eysc2JxBu22F5fKIu3OjeOJ+ZEntKBGxxv54+qUvrqHi68b4qG6OKGc=
X-Received: by 2002:a05:6512:3b06:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53678fc23e7mr2060932e87.20.1726179750638; Thu, 12 Sep 2024
 15:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com> <20240811-dwc3-refactor-v2-5-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-5-91f370d61ad2@quicinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 Sep 2024 07:21:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGJDoprCrjbyifAKzjyKv6_OewP1n7+so1-q-5kmn8DA@mail.gmail.com>
Message-ID: <CAK7LNASGJDoprCrjbyifAKzjyKv6_OewP1n7+so1-q-5kmn8DA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] usb: dwc3: qcom: Don't reply on drvdata during probe
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Regarding the patch subject,
do you mean "Don't rely on drvdata" instead of
"Don't reply on drvdata"?







On Mon, Aug 12, 2024 at 12:07=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> With the upcoming transition to a model where DWC3 core and glue operate
> on a single struct device the drvdata datatype will change to be owned
> by the core.
>
> The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
> glue context around before the core is allocated.
>
> Remove this problem, and clean up the code, by passing the dwc3_qcom
> struct around during probe, instead of acquiring it from the drvdata.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 88fb6706a18d..33de03f2d782 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -546,9 +546,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *q=
com, int irq,
>         return ret;
>  }
>
> -static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int po=
rt_index, bool is_multiport)
> +static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,
> +                                   struct platform_device *pdev,
> +                                   int port_index, bool is_multiport)
>  {
> -       struct dwc3_qcom *qcom =3D platform_get_drvdata(pdev);
>         const char *irq_name;
>         int irq;
>         int ret;
> @@ -633,9 +634,8 @@ static int dwc3_qcom_find_num_ports(struct platform_d=
evice *pdev)
>         return DWC3_QCOM_MAX_PORTS;
>  }
>
> -static int dwc3_qcom_setup_irq(struct platform_device *pdev)
> +static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_d=
evice *pdev)
>  {
> -       struct dwc3_qcom *qcom =3D platform_get_drvdata(pdev);
>         bool is_multiport;
>         int ret;
>         int i;
> @@ -644,7 +644,7 @@ static int dwc3_qcom_setup_irq(struct platform_device=
 *pdev)
>         is_multiport =3D (qcom->num_ports > 1);
>
>         for (i =3D 0; i < qcom->num_ports; i++) {
> -               ret =3D dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
> +               ret =3D dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multip=
ort);
>                 if (ret)
>                         return ret;
>         }
> @@ -699,9 +699,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom,=
 int count)
>         return 0;
>  }
>
> -static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> +static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct pla=
tform_device *pdev)
>  {
> -       struct dwc3_qcom        *qcom =3D platform_get_drvdata(pdev);
>         struct device_node      *np =3D pdev->dev.of_node, *dwc3_np;
>         struct device           *dev =3D &pdev->dev;
>         int                     ret;
> @@ -782,7 +781,7 @@ static int dwc3_qcom_probe(struct platform_device *pd=
ev)
>                 goto clk_disable;
>         }
>
> -       ret =3D dwc3_qcom_setup_irq(pdev);
> +       ret =3D dwc3_qcom_setup_irq(qcom, pdev);
>         if (ret) {
>                 dev_err(dev, "failed to setup IRQs, err=3D%d\n", ret);
>                 goto clk_disable;
> @@ -797,7 +796,7 @@ static int dwc3_qcom_probe(struct platform_device *pd=
ev)
>         if (ignore_pipe_clk)
>                 dwc3_qcom_select_utmi_clk(qcom);
>
> -       ret =3D dwc3_qcom_of_register_core(pdev);
> +       ret =3D dwc3_qcom_of_register_core(qcom, pdev);
>         if (ret) {
>                 dev_err(dev, "failed to register DWC3 Core, err=3D%d\n", =
ret);
>                 goto clk_disable;
>
> --
> 2.45.2
>
>


--
Best Regards
Masahiro Yamada

