Return-Path: <linux-arm-msm+bounces-36040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC09B1A62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 20:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E67FB21825
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 18:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE29D1D61B1;
	Sat, 26 Oct 2024 18:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9cvFgHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF91D45F2
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729966717; cv=none; b=IN+XpAg6I6+t2G6zJPPpk4QD7gAUq+Nn8EDUtT81lP9LXbCqurQx6WdhRLJ+57gXgyOCwYNjejUMIuFnvNCvLfuKJaW4lCsRkG9Ool/ipqfuhN7/ZuMVK4qn6YnU/kkJ6EJdwAP254yqeZdqHtjAeU7VE3FAhpIxxpHYsolhycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729966717; c=relaxed/simple;
	bh=mLUZ286GPbKzQ1G8TxZd2G/6DT+8CQKrGlwx0R4zdyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrvKYv7Qb5OQGzUg9wGMquzlphcufpL9Zo1R9jsYkocXIP/fIENDqBaAvpz0G4PAYE6qcWjVsgPCnEF6TocJ4CqBhcYVBLlNSku1wLozKWqC/dNRhHLKD79pAPYNOQJO4cti6Ndt4N2qWb4Rj2qkCcpZHjxNyqqsieUx0FLtUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9cvFgHf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3730068e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729966713; x=1730571513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lr+0jRvi1NT0IJOuOscYHQQgaFgqgoi2S8/w67o5wxU=;
        b=L9cvFgHfI6ipBzSAdinQHFlfnZr2NeHxHFBsk9Tmq+WzxHVZir4aklhHyiwaIMTK94
         qWZRUtqyHuWEGS3l0buUbs4cwvyY/a5Ov6IkHz44kB/vwG4FRmd8tyCMXegCJtdMVT7v
         +5wnygnxsgR1t1ouDA+ul/uQ9jdvuvxtO/JZdWSlFMKmu+rrzmhVqdoUJlkAKWATyQg8
         /F5vbtICQ08U/fwDU0LLDaZIDosD+e+pWzS3iXdG/sykUnBTmhJD5AOWZsBxos2IaRQ5
         7QQDiPJj6kXC/hsb0UWBjb5ZnBelfKCVeIeCoAfrbDIwOTQPKIhSnNNDVgVd97Sr/D9z
         cwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729966713; x=1730571513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr+0jRvi1NT0IJOuOscYHQQgaFgqgoi2S8/w67o5wxU=;
        b=jwqnJf7aJKQeOXh7B7tvpiRJ21tuznY00vHjcG+S4JcnS3u1PqdV9PnpbZO5A8iL85
         8VarVrUIOGLyZlWUXanQHx2txcbndyD17tqwUY4CDGk0i/tYbG/O5eHhs32KTfkklnxl
         1hKklnDNrhMgcDarOxWh4qiZPeoUC5+Me4V4KD8gSJVbIXDwkMPEK1infV393PR3ebCj
         TGvQiQ/cpEZBHuzk2CMOoNerF5Zz698HYpXfkOdo+kztBJhO4U4XygJJ2TSGcwzjkO5R
         LPpgHMA1t9qmnIJ0SypjTUYOvv21Hm9+9FjiNLLfGKfc1IX1LGZsncPRxTL4BQX1q627
         LVLw==
X-Forwarded-Encrypted: i=1; AJvYcCWWCiis/kmXWBlN8h7UoF3b19fAEyhGRyDptKSVkjv8x9yCjwHN2IgxnDiopHVKr3+hpOpWRlEDo6V7QyKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4WBR6sXpBpAmLWiOeXtGk9gsIWw32tiuuTlnl9rI0itwG8Rtg
	cPFiIlrV6IyzjXTVt9pD2gD8fsvpwbRo3VeO3XAp5ascwXr1JQqzSe9/dvNP4pU=
X-Google-Smtp-Source: AGHT+IHV18CqxOkaMvlzQe0OOHQoINVJqyxJyEeaJmdcBaU//KGhWUqaFp4ObZCcBr8YBYAq+CXG0g==
X-Received: by 2002:a05:6512:3b06:b0:539:f607:1d2b with SMTP id 2adb3069b0e04-53b348b7c7bmr1048338e87.7.1729966712681;
        Sat, 26 Oct 2024 11:18:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e124610sm567623e87.84.2024.10.26.11.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 11:18:31 -0700 (PDT)
Date: Sat, 26 Oct 2024 21:18:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qingqing Zhou <quic_qqzhou@quicinc.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robimarko@gmail.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
Message-ID: <nhthg2rlfatc2pyhsuoulvo5447cxg7buv4aq3r7r5amsmjjoq@pgfyvvegfron>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-5-quic_qqzhou@quicinc.com>
 <8a60b729-b312-4afc-835b-a18060ad3f03@oss.qualcomm.com>
 <zsphor7rpbwx4km6uxpepky2h7atbgjn2435puygmpssfc36mc@wkquqxud2yij>
 <8c9804f2-ef4d-412b-97ea-f521dfd35ec2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c9804f2-ef4d-412b-97ea-f521dfd35ec2@oss.qualcomm.com>

On Fri, Oct 25, 2024 at 06:45:01PM +0200, Konrad Dybcio wrote:
> On 25.10.2024 1:06 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 25, 2024 at 10:54:24AM +0200, Konrad Dybcio wrote:
> >> On 25.10.2024 5:07 AM, Qingqing Zhou wrote:
> >>> Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
> >>> to limit DMA address range to 36bit width to align with system
> >>> architecture.
> >>>
> >>> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> >>> ---
> >>
> >> You probably also want to mark it `dma-coherent` (see e.g.
> >> x1e80100.dtsi)
> > 
> > Is it? I don't think SM6150 had dma-coherent SMMU, at least it wasn't
> > marked as such.
> 
> I don't think I have any documentation on this, so.. one way to find out!

I don't have qcs615 at hand, so a purely theoretical question. But how
should it break if we mark it as dma-coherent, while it is not?

-- 
With best wishes
Dmitry

