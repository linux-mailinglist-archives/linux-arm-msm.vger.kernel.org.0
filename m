Return-Path: <linux-arm-msm+bounces-48656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F845A3D753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 346AF1890D42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECB01EA7FC;
	Thu, 20 Feb 2025 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsHTUefo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7D51CF284
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048624; cv=none; b=EnEj/u1Lol6mOkNy1JqfaB0WRJEudv3V1XWzZGxJzBGlPtqSvgIDbKUllapBKqHYng/pgurur/fnT6YkFbw1IutMxIYY5hLqqbZlceZmSgwy26mcnnWU6/y7CfEuoECS+RE9fCb07jxx27s0p8KTZudB3OMOI3B/DbHVNmb+3gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048624; c=relaxed/simple;
	bh=gq1nLSZGIi0615Ppw9bMjMKUijD8x1x5ap4YkeYVRfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPOCRQH+f17R38uQ9HmzaWpkL1bysHV4hH/mTE5atrqUDNGgGBD2vGbBrlPHzljYfDbFsD47H/xEfX6ufJdy4/bNuix/Xnx0Y0o3tvhEEBMT2IGztgM8Trix+woM+nD5zW1jXVbYBfxZQbqtzi6jpSKHdtLJPDfJ7qrPelgn/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CsHTUefo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3061513d353so7720381fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740048621; x=1740653421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9/oubRry3os2Cx+3hy0pjXTxP8tcsJBQmGx+p/CdbBs=;
        b=CsHTUefoji4ibbT5fvQiMxzKZ5qjy7kfY8wcvNOwVOBiqPJZVtKlSe7M1p+fAdOlJe
         6u5FJI9ayz27r+DEfk0oVuX5+9+9TEfZJym+GlnPoA7R2UlXG/XtwNHA+PAwYODZAQzf
         kkUDxRZyZT8Er+xzpSPC/oFH5hK8GsCrYjTftzjdZqJ/nWu1hkdjEllgDH4DXsZh7Ytc
         8tlRUGU1FGibPFAmtHpOiadx5s0EWLlgEiXOYJp70J0IQv7smK/Ey3vxz0y7JH0hjyHO
         k+08MU7agmUGJdg3+WhFd+tCHHsn9lFXlaJQK0EZXt8TsigWYYURnbC35zQ5jZUGZzle
         w2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048621; x=1740653421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/oubRry3os2Cx+3hy0pjXTxP8tcsJBQmGx+p/CdbBs=;
        b=DeuMs3aWO+Yh2CQJhBkNOzCzOSQ1sHYpfCR81hRtpgxUcRZftGtulDTp0u4RUKHsUz
         jFMxaX4C6rdS7QZvsuTY7Cj3pWVPsb+oYxNFYacwacAc9AhQiHFKR0HSQreslHumHJla
         ezV+zMxLGEothzXKvF8uZtFGiWzfb5fJqynWHEOeRxx33CAM1mnRKTw8Dioz3yy0l9O7
         lw+XUL01miYNxRxkcTzsmtJ9m4GpyAGRO+pEowcX1AxywbNaZ3hFkpCsZB4Bk+eNUmlW
         UkQX4VE23RHIH26wS/PHHdjlfm4rrCyKfvwSJqnWVJwYr5AhJPf9af3vpyR8vZKerpIm
         td4w==
X-Forwarded-Encrypted: i=1; AJvYcCVLPiAV7b6zlMdOC/BBKzBPFXjGBlCo0rnP9nRMn8nN+JTvHC8LJaQFRz/UmJzh0dJ64JloV2e2mnhN4MVS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+e4BrIuE52y+u18zMswFoOIdhcimjulri7hul0X6k8QGnIqI
	cxMF7dD+T2b8PMWnpyJCx/2QQvKWJ6h/17RTzuKvDihjc6SPK/H/41zBxmNExVo=
X-Gm-Gg: ASbGncsnG4mkYvcFlg0b1sV/GCXdp5VHfA+HO2xJSSiCih4Hl7S6BBR1nE+JmYZNC8O
	HiUmuxRH1ga+YPrAhX/0SVcrFQ6MxfEgibaR/4XCMbghJQUhfbKn0Od8cLqsO+r+HmmK/SMvjuu
	k6ZjTx+w1HwyfZLqI3XVffex7/oMrfDL0G1pnpZVTL7XXJktNl4EktakQEUbhFdXX9bQdo6ZTEt
	bSHwOQGnsz8j3WP0AuaLKKLGTiBjEngIl46PgddbkBqxCLznjfdTguSmT0ACcYckZ/cn9p7psHa
	ON/EMIXu2kxNt+zpzEniCfeJ7JKxqvs6kyOhawS+e5N6UASnyZrAQmiM8xsf3NSLmtMCEv4=
X-Google-Smtp-Source: AGHT+IGDyF728+k8BN/ocAWv5ZgL+M3ykKw/NVBvij0H7cvdwKQpUwgrrE9HiQyWU0qxZo5WaL519g==
X-Received: by 2002:a2e:88c2:0:b0:309:269e:3ac7 with SMTP id 38308e7fff4ca-30927a71936mr62101081fa.11.1740048620618;
        Thu, 20 Feb 2025 02:50:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2c6f5ba0sm14386401fa.46.2025.02.20.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:50:19 -0800 (PST)
Date: Thu, 20 Feb 2025 12:50:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] PCI: dwc: pcie-qcom-ep: enable EP support for
 SAR2130P
Message-ID: <wa4vr63eiaiqq54aauxviwph2wbosrmfypxpxtw7w32la6qz7q@flhdoc4k3d6e>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-4-94b20ec70a14@linaro.org>
 <20250220072310.kahf4w4u43slbwke@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220072310.kahf4w4u43slbwke@thinkpad>

On Thu, Feb 20, 2025 at 12:53:10PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 17, 2025 at 08:56:16PM +0200, Dmitry Baryshkov wrote:
> > Enable PCIe endpoint support for the Qualcomm SAR2130P platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index c08f64d7a825fa5da22976c8020f96ee5faa5462..dec5675c7c9d52b77f084ae139845b488fa02d2c 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -933,6 +933,7 @@ static const struct of_device_id qcom_pcie_ep_match[] = {
> >  	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
> >  	{ .compatible = "qcom,sdx55-pcie-ep", },
> >  	{ .compatible = "qcom,sm8450-pcie-ep", },
> > +	{ .compatible = "qcom,sar2130p-pcie-ep", },
> 
> Could you please use a fallback? I'd prefer to not add compatible to the driver
> unless it requires special config.

This is a tough question, I have been thinking about it too. But granted
the differences in clocks used by the controller I opted to use
different compat strings without a fallback. I think it would be hard to
describe the schema otherwise.

-- 
With best wishes
Dmitry

