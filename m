Return-Path: <linux-arm-msm+bounces-26974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB193B5CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 19:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 488BAB216FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 17:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB3215ECEC;
	Wed, 24 Jul 2024 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/SNlbnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882218E10
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721841780; cv=none; b=dJuASf19RFkAGOOBjd5h/tiXYd2q6WCwR02ATKZM1CCfcTMOTmoX1gGY00eZ3u3AgzynqKwhoxEVHdNXRhqHCbLh8kNHpph/rt4XaNiBS498+59vmPS9npWZOfrwcThmkgN4C2//tGQSQdQWS5L4HnqyphipncyI5ziYYlHuMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721841780; c=relaxed/simple;
	bh=ggnTWcK3pjB7kJizmljAvRwIt0ed0NYaiRHP2Yv3Am4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYCzhhp4P4btpvouUiEzSlvkDVr4iTBljdGcvFQbJ6U0RqTFbADi3mOJowToOZ+nxgZVZrA0A/yA9dgzWwmpoVhGdnSc2n6fnLbM3GUdbnpo5Xy5aQu8XYYQKse99QWGbFW+tg0hMqD0xRoPTPqHOhcnFXkYVEjYHwjwkPfqGec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/SNlbnY; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efa9500e0so5113850e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721841777; x=1722446577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+AnGIHLZqTHOkv8jJV9QlhymBM4MVLY0RrtuPzdfXxw=;
        b=q/SNlbnYk/lOfA2NMTuyT3mzOu23gxVMnd0+FHU9nQMcSook8MziNp7jJfomRQoTyU
         tGTujwMQAhzTKMttVc9OcTDhsxS/Cuq1aF6Bqb+5Ig7S9oLnAHPpKLSedAoCBUjxRWRk
         96Jj5sikbb7IkwT3FQaePXiYwZARKOviMd0IybGwpAzkspK8cXEBaXZPr6C3ezIVawa5
         8wAGRfA24+9MSfgXFW0CXQj1A9M6YaAfrj5Oa4um+s9mtnnr3h2a9BzCt1lIt5WZXjia
         kxBicud/1zXJ2GjXrLkJFPH8stp2wu8SQtte0ml+/09HrFU8beK+t0vOiaZcUHtFYcGK
         nlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841777; x=1722446577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AnGIHLZqTHOkv8jJV9QlhymBM4MVLY0RrtuPzdfXxw=;
        b=GfsOLqD+LF0S3+ZnZiqrh1B4otwhHZFp3qdK70zAYiiIMJsAB5OdL7Lr53hisPu51E
         nIOKKSJRRpLxQr2DV4TlTezHU/+nV+ypEjCBFxMBrFHktubAOFD26ohqFHosq6EHdWdg
         W2OOf4PaU/RBwC20Mkd1xbGUsIksw1KgM+63E4RGoTWeynrsNDjkcgX0wxBWiSfsNXrT
         6E2prIQoE0UPBvlnITrrQiuSIGMPyHSwNvvOXGTxkuzJAm0yg+hWZYKbmytSVy1kydXw
         oLSI4jmdwSpQmPG67g9CLrrCx0sRAIYF9ejgkozdS1wz2K9MXsB68DbOyG/0AxgSdARb
         UqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTnMq9SZvmETMTZx74k/EDzYwciemoeOVrCx5zmxWVwFakXkLvpvvCdJFvRXeOG0C6xp7sHE+sIin1IMP2LIbtdZKbfTUBIWUDP24LVQ==
X-Gm-Message-State: AOJu0Yzi5lYYKTRaLrUC0LabAQYzeqUAC/NkjZeamBPUmFdZIlBeDbo3
	xgM0A2HZhn73D5X5HsKLoa1ze/qCuBFIPZqDmwoe+mKlwmXi1lRU1YOyTErABE8=
X-Google-Smtp-Source: AGHT+IEWwx/MofUxwPo8lvoAod3ASgj4oIkVkizHpzCO8taKghKsAR4f06Rh66vlz4x1o/sMg/kNIg==
X-Received: by 2002:a05:6512:2814:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-52fd3f7fc3amr256457e87.58.1721841776649;
        Wed, 24 Jul 2024 10:22:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52efb8cdc72sm1621095e87.46.2024.07.24.10.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:22:56 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:22:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: qcom: Allow 'vddpe-3v3-supply' again
Message-ID: <nanfhmds3yha3g52kcou2flgn3sltjkzhr4aop75iudhvg2rui@fsp3ecz4vgkb>
References: <20240723151328.684-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723151328.684-1-johan+linaro@kernel.org>

On Tue, Jul 23, 2024 at 05:13:28PM GMT, Johan Hovold wrote:
> Commit 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to
> dedicated schema") incorrectly removed 'vddpe-3v3-supply' from the
> bindings, which results in DT checker warnings like:
> 
> 	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: pcie@600000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
>         from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
> 
> Note that this property has been part of the Qualcomm PCIe bindings
> since 2018 and would need to be deprecated rather than simply removed if
> there is a desire to replace it with 'vpcie3v3' which is used for some
> non-Qualcomm controllers.

I think Rob Herring suggested [1] adding the property to the root port
node rather than the host. If that suggestion still applies it might be
better to enable the deprecated propertly only for the hosts, which
already used it, and to define a new property at the root port.

[1] https://lore.kernel.org/lkml/20240604235806.GA1903493-robh@kernel.org/

> 
> Fixes: 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to dedicated schema")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml   | 3 +++
>  Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml   | 3 ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml | 3 ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml          | 3 +++
>  4 files changed, 6 insertions(+), 6 deletions(-)

-- 
With best wishes
Dmitry

