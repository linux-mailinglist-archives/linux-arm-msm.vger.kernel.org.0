Return-Path: <linux-arm-msm+bounces-43163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC89FB465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 19:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9551882403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 18:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093B31C3BFE;
	Mon, 23 Dec 2024 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nYeZA1sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF1C1B415B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 18:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734980316; cv=none; b=opYM/3fVvbTCaJ7sPNFvMMGkQJ1tVYHXumoThkvYVy2b7BDLPIeeXwLYwqjHWkpuCAPD4brEH6zme4BLl7kjld7fpHQbPveDMX+NDZc/nZxmhNTNcdsF3oZ6+3F4i5AYH0OrK4CNUZs5l2jreVfLpI87a3K7VP9oXhJPQZC0L9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734980316; c=relaxed/simple;
	bh=9e8k8JsOuq3Lyw7YbfY8XkwYsS2e1ChPhuTYq0muhS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPtalGvmMOdw1vueN4dFQUS6SArIAzI9t+43hlgWm/Os9gRewQFhnKLyJ1e0A4lfdW9VMl7oTO0nqQdTFbh6filer9TcvA6XJACbRdEVgZX4vXLS6k3UqIQqGtYUFWb0h+MGvcGKqEZBX5pEPtNRQqEe3Nq7WTCtnpQlpvVLLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nYeZA1sT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3003c82c95cso36760891fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 10:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734980313; x=1735585113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NafCQxwJmOkvoMXvzQ41cvEv1gNV8av0R9IvJSptuN8=;
        b=nYeZA1sTM2Zhbh6hdVeq0AeDlgg+MNWGPJ8LJxlplPb5M1Pw+u8iPRa6zJWtIYYrA0
         eNgbvsQrndT6hZgoBLFIztLwQsq5MqtyERRoXK2bLZJhh9tPB1CCdYQIY4v/fEsLSg2o
         d4L/KqLhXxLb1eTb7eRV164ZLiC+OFW1on9lXIqwgCnaIwPLi/ccJEgEt5tcLG6oxYGH
         Hdnxh7GLqBudUnmrEej5b68VB3/yR6gy2qZgCN4BY4a81dtg697E5B+nmhpZ9a7NTKRY
         +d1kaYFFJ7IxtpMzw8WlldnEAy9173ww1a4I5brH1heEgQEcQfjs39wsb0k0DKgNCYU/
         z8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734980313; x=1735585113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NafCQxwJmOkvoMXvzQ41cvEv1gNV8av0R9IvJSptuN8=;
        b=PvK+9GFilxw9w1p5NZy+ZFuWEgBturuDKlA0h+5p39snTWzdWlN7qfCI7O/aLb94bn
         jbu6zj6O/904U71Oo/p5p2j978KSylMC+UlVHMcgrhpqreS+lw181vyqFpfDF79ld1mr
         v1DdDZyvvE4NkRKy0A5eoMb+jlXLLwTKKhtCwMcJPYAZVVHkIHED6qEk6iDaVn1zEh0y
         4ZY+DMEjFnvSl7AY25vO3LzRrhJth4YhAhx33LyWkwVUbyhJClA7A4zywSjA/xiUOj7G
         M7h3NGCWJ7a6Df67r1A4qJiC2qrKspOjyZGOPYoK//wVMMQ4aFdEv4hXajUCAEHz3haD
         WQrg==
X-Forwarded-Encrypted: i=1; AJvYcCXk8fBoQiS7/jYc/B76AoN+wIN8cG20TKhU32h856BhflFIcA+KZlnAE7uT1hIX+uJTOJGPsBGcYal6jRhL@vger.kernel.org
X-Gm-Message-State: AOJu0YzkoCO2lIrwUTn6UIwr2U/KZek6xhWxSTAMvojyqvCg7kkxRScW
	Uk6xlWwxb97I6seik+TZ5KBxCEaBZoKswDLZZdI6h98XCRODzmW9AT8L16vHt/8=
X-Gm-Gg: ASbGnctxcKI+TEsyBq1LFYykFYQWtfVahlJizr5xpMLtiPX/ntM0VAHEmoSccIMfnmt
	GQjzDwkgEL7Gxv8g9tiHd99kJGZYSKgYvpMroqBBlglj3AVa1BGBPrybQwRpkPxvMj1tQFOnGzv
	pNbhgufi+lEmMx0D6GzOap/Iwyfi8eS4m/Ab+JFgrh9H4py0khksEJldINO2jOO4dyhAOBPs0y5
	QD4thzIeAXz7AqWVmzSKCor4vBf0dlgKwZvMw49Wqd3tSyTR9RaKbh5+m5YUFQ46W7IgA4c8Bf6
	agSmz2tWJudVysneAXpJiZG0Frk8594ZJBlF
X-Google-Smtp-Source: AGHT+IHPb6SW08p1Sk/egzXNbASrffIvwilfZZMkOde25LLZktxTeqMtZZEbnt5aKm7eZrMKs3usjg==
X-Received: by 2002:a2e:be94:0:b0:300:32a3:a322 with SMTP id 38308e7fff4ca-3046860cef5mr46520301fa.32.1734980313338;
        Mon, 23 Dec 2024 10:58:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30484c377b1sm3344011fa.35.2024.12.23.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 10:58:32 -0800 (PST)
Date: Mon, 23 Dec 2024 20:58:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh@kernel.org>, andersson@kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: PCI: Add binding for qps615
Message-ID: <m6h27swiax7wgtyldwl5sd3ddzh2tgiux3f4bgf6nuqlxsn6e3@o7rhwdjvaydw>
References: <20241112-qps615_pwr-v3-1-29a1e98aa2b0@quicinc.com>
 <20241204212559.GA3007963@bhelgaas>
 <20241211060000.3vn3iumouggjcbva@thinkpad>
 <bf57eca8-69b5-9c21-0350-bf1c07de786f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf57eca8-69b5-9c21-0350-bf1c07de786f@quicinc.com>

On Mon, Dec 23, 2024 at 10:18:24PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 12/11/2024 11:30 AM, Manivannan Sadhasivam wrote:
> > On Wed, Dec 04, 2024 at 03:25:59PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Nov 12, 2024 at 08:31:33PM +0530, Krishna chaitanya chundru wrote:
> > > > Add binding describing the Qualcomm PCIe switch, QPS615,
> > > > which provides Ethernet MAC integrated to the 3rd downstream port
> > > > and two downstream PCIe ports.
> > > 
> > > > +$defs:
> > > > +  qps615-node:
> > > > +    type: object
> > > > +
> > > > +    properties:
> > > > +      qcom,l0s-entry-delay-ns:
> > > > +        description: Aspm l0s entry delay.
> > > > +
> > > > +      qcom,l1-entry-delay-ns:
> > > > +        description: Aspm l1 entry delay.
> > > 
> > > To match spec usage:
> > > s/Aspm/ASPM/
> > > s/l0s/L0s/
> > > s/l1/L1/
> > > 
> > > Other than the fact that qps615 needs the driver to configure these,
> > > there's nothing qcom-specific here, so I suggest the names should omit
> > > "qcom" and include "aspm".
> > > 
> > 
> > In that case, these properties should be documented in dt-schema:
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml
> > 
> > - Mani
> I am fine to move to pci-bus-common.yaml but currently these are being used
> by qps615 only I hope that is fine.

With bindings there is no such thing as "currently". Once defined they
become an ABI and must not be changed.

-- 
With best wishes
Dmitry

