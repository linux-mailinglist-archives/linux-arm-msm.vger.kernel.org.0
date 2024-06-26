Return-Path: <linux-arm-msm+bounces-24314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B378918547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F76B1F2858B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F66018A94D;
	Wed, 26 Jun 2024 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1CFGL6q/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321231891BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414445; cv=none; b=PzraHLD+JZzzOEL8EcLc+Aig/NyHGIxABPmNxsB/tXF5K4EfkahFru+Fa8hJiCPloMT8yal+7SH6FcKxP6t5gXUS9On+BZSkucFweT6XZWfhAW3wpHxcnKjrPohTc3zgfOEikrDCTp+NzpXLqlyhhAEBW2t48wJpUsRDViqhiJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414445; c=relaxed/simple;
	bh=wXPMzNtNlpsPJeeERAGhiFsCceMNMb3huYtSRM1DPwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOVOsxYOCzLzL1T7VA6h5eWojoUFOW1Ub4dUFTHcPvCYdZC5ZclUgxLwTpgZRN8f1Dkhv9HY7hTRsTuZdjz2FXUToM3DDF9aPMPK2oLciCDEHVgP/1syQETk03P28R9uVV56wV3zBdXvq2XArZkRHfqnAzXIOYhHzz+0kgbqj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1CFGL6q/; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so76805461fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719414441; x=1720019241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPxOJfkJIWCY4sqntkOf7FIbvrW1HVZyYX7BT4XYMJ8=;
        b=1CFGL6q/2aGvnWYJoCUN9Ar1l28aj+2En5Px8PWW+ij3f5viv8qy+/fFR+X0jO2yCm
         r5xKYAtR4LGz5U8Gntx7YRB52OuwsZmhrkvQyK1+bkM993ny10m03o/BcCC/4f70/kZ1
         SOv7bvPypXzBq8XZcaK7Ch2EgIxLKWukydROY5MUs42nSz64/VMwp4nNm32uNV8z8LSt
         o8JXBdXJhQfkj9pkbeNPAbp0qokI5L7Tx4UwOej3Bn+4lkZPuTzKbd+E9FEqx2G0LM6J
         CWqOmwHd9LwauHu5N47AZXc8s6AAKgn0qrRQ1DTYs6yWR7Hmalfy22zD9lOlv5EAsACw
         ZuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414441; x=1720019241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPxOJfkJIWCY4sqntkOf7FIbvrW1HVZyYX7BT4XYMJ8=;
        b=eWbhtAPP4hDdo9igOU5TkRbqnFm4QDiTtZaPlH9bfckzHeRNrJU+dwezpMzxXGQpKy
         cTqviunNwtZBaMCnm1aDWUPyleCgbSCuoQi8R94hbw5noCVzC8z24y9sQcq3suxeguYD
         Uns6kQFscVJ9Jo1CrOcR3bnoqpFmqlz1gMKxsJ4YH17B8k70f8DMTuLba0mwWsNwPNKt
         5CbS4a75VN/vSTQzG8u0aa1C147buNBXsV9v++nb+JBhqLLvkcYFomUKe2jYQLD989As
         CIddfWNtX37rW0dD++V51vA27ZYw8hIm35pz4XKKCvObg2FzVx71cCdwCTVWpBnPnZ2n
         PsLg==
X-Forwarded-Encrypted: i=1; AJvYcCVSWSHqnyYp1XUWnAg023MmTN1F1VuMuvJl1sS0bT43KZjJWltl3ZRZfFROvMN7TuT8OcRid+OkalQqajEjJ0gjGE6rjmEX9Ag6dWRWFg==
X-Gm-Message-State: AOJu0Yw3dd7adNY74QnrOMrMrcMX2YZHvz6Uvi73EsK9YvfMwOb19R9s
	sSvXbQTud0DTPd/Wf/1cFL7QgUOm7tTbwNit7FGyy4kNWaY/tG0GgJv9IgCYHrd9Iaev3/2l6Z6
	x5F7/CaYkl7iQnWtlanpMcYs8K5gX3LfGC1qdKQ==
X-Google-Smtp-Source: AGHT+IEUkNjLlmTxavRfhMndMCySdn3PbAFz1s6PnS1Bxg+VsA4owIRUUH76BL6HCSdoGMnwFnx4HSaROo7ZAfFCFEQ=
X-Received: by 2002:a2e:9f10:0:b0:2eb:fc08:5d83 with SMTP id
 38308e7fff4ca-2ec59389fffmr76705281fa.44.1719414441210; Wed, 26 Jun 2024
 08:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626-qps615-v1-0-2ade7bd91e02@quicinc.com> <20240626-qps615-v1-4-2ade7bd91e02@quicinc.com>
In-Reply-To: <20240626-qps615-v1-4-2ade7bd91e02@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Jun 2024 17:07:09 +0200
Message-ID: <CAMRc=MeAz8yT_-YR8dSW+hZrezbhsTcc+oSdCO=+sZ84M=fkmA@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] pci: Add new start_link() & stop_link function ops
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, quic_vbadigan@quicinc.com, quic_skananth@quicinc.com, 
	quic_nitegupt@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 2:38=E2=80=AFPM Krishna chaitanya chundru
<quic_krichai@quicinc.com> wrote:
>
> Certain devices like QPS615 which uses PCI pwrctl framework
> needs to stop link training before configuring the PCIe device.
>
> As controller driver already enables link training, we need to
> stop the link training by using stop_link and enable them back after
> device is configured by using start_link.
>
> The stop_link() & start_link() be used to keep the link in D3cold &
> D0 before turning off the power of the device.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  include/linux/pci.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index fb004fd4e889..3892ff7fd536 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -803,6 +803,8 @@ struct pci_ops {
>         void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn,=
 int where);
>         int (*read)(struct pci_bus *bus, unsigned int devfn, int where, i=
nt size, u32 *val);
>         int (*write)(struct pci_bus *bus, unsigned int devfn, int where, =
int size, u32 val);
> +       int (*start_link)(struct pci_bus *bus);
> +       int (*stop_link)(struct pci_bus *bus);
>  };
>

IMO stop_link() should return void.

Bart

