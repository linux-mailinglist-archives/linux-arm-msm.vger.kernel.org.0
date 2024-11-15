Return-Path: <linux-arm-msm+bounces-37969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B59CDA2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 09:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CC11F2182B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD35188920;
	Fri, 15 Nov 2024 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5SoIKSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3BB1DFFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731657818; cv=none; b=n47kzL9WzzR6lv1Ofj+ci/U03/wSrk7h9A1BF6Qj2HlRmSNaxmwj+mEWwFN5QYjodys6yh2FCpqjGbdZQemiO63bwaO+xEPdk6lZO3xUcSjzSUxdQ4IwFZb13ONQ7RXF9PaRcfdaTzAR/znGTBqWyfnMyjKi1v0hFyKbBvhX6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731657818; c=relaxed/simple;
	bh=CDDWkMTRsaqG8fDpo4QcP5vpY+jE/dyCbCBBW4aAA68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsBwWV/WaR82Rg7J55+6IRB1z/SPj1YavntnyC3W1EI/4j7va2l36BOELf9TnIznjMesdJjFuPQ/zWwJPBN99vEiwnv46VyhDxN343+wIy8ZEi0ZUDhly6Ha7OIym+dI7kJk8PKx+oLZYPvoIrWpjTXwpsOlJWu2SGaWU8RPv8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5SoIKSa; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1454661e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 00:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731657814; x=1732262614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg52ed6dDB7uAWG/HTj6AHSw2HsFAkB0m6M5yLEc71Y=;
        b=l5SoIKSaduG2oacWNq5TUGeuSmi0g1xzI9M+hhgVq1I7oAwA4cPMz2PnzqFUbFMXv6
         EVkIfZRwTyWnbBu08RxNQJSI6xV5ej/TtZi+L90pEllBw3zzM+DXW+E08rUCnWe1AVps
         LolNNCkOWyU2t7yMR8sr0sIs+kohPZvuydmHtAV/xyclbR8uTeXFVkfxCf7IvOpBT5so
         vyPXAbru9tDvY7erlCiDLV0mdaJ4Gqb69G+ApW+o1OSswyLop7aepmp0lfQBtpsJWKM2
         fL/oE8vFa2sR280qxthE1vHWV7dij/+k5MCZ2fMYm2tPfvGzUabJyKqOZ4OqZD0c60VF
         YcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731657814; x=1732262614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg52ed6dDB7uAWG/HTj6AHSw2HsFAkB0m6M5yLEc71Y=;
        b=Nkm9hunweEv1qw/gYQmGaDiyGv+G0EM9LSpR7j/3inqoBrMwkVGqkS/CIOSDxWpUwV
         cBab2o2+HjzDMwv3NnCUY2Svs1HHOhoseoXMPCkUJfoNczowZot4qSURmywugmewuAK1
         46l4WocymvcDbUz1yYvlzM13H8aE6zmrZHNoGjERG8B+Qhn0mWCMqB15DSU+JwcgNQU8
         f5KOyLDySm6fbaxXyQmYS0ic36gD5+RTUOV3lAiDIKTSDWPjAf+LSudljdgrm2o+FCcr
         Dgzc97nMl9MZUCeqvxcqj0HlG8MTtM2p+dbw7Zky10ixJ75ZvXiM0OXwwYGZCI+vpyhy
         6+mA==
X-Gm-Message-State: AOJu0Yy0FHEnd8MeuPpMq9K1MJxi5/nrEgARVGHCIHMUI7GEHWq9swhe
	j92oetueSlRyFKT/EBbQDuvp1bBDYi5VWjO7XWcPQmFgu16uOYkhQLcPRbetSyI=
X-Google-Smtp-Source: AGHT+IEkwODPhmetrFQ7JC1ZlQC8WpzWNpnVaZRGwH7SFyoDcr2DtE+ysrIGhm40Nj0M4383sof/KQ==
X-Received: by 2002:a19:5e08:0:b0:53d:ab50:4e23 with SMTP id 2adb3069b0e04-53dab504e50mr598467e87.0.1731657814295;
        Fri, 15 Nov 2024 00:03:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548e9bsm474592e87.262.2024.11.15.00.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 00:03:33 -0800 (PST)
Date: Fri, 15 Nov 2024 10:03:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] remoteproc: qcom: pas: enable ADSP support on
 Qualcomm SAR2130P
Message-ID: <2iuvbh5ubtc7nwkoducgmsuzgsl7427xcnpi4jgitsbij4yned@c6zwqcaz7r4b>
References: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>

On Sun, Oct 27, 2024 at 01:09:42AM +0300, Dmitry Baryshkov wrote:
> Enable Audio DSP support on the Qualcomm SAR2130P platform. The CDSP,
> also present on this SoC, crashes the device during the start and is
> thus omitted from the series.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (3):
>       dt-bindings: remoteproc: qcom,sm8350-pas: add SAR2130P aDSP compatible
>       remoteproc: qcom: pas: add minidump_id to SM8350 resources
>       remoteproc: qcom: pas: enable SAR2130P audio DSP support

Please excuse me, is there a reason why the series wasn't picked up for
6.13?

> 
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 3 +++
>  drivers/remoteproc/qcom_q6v5_pas.c                                | 3 +++
>  2 files changed, 6 insertions(+)
> ---
> base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
> change-id: 20241027-sar2130p-adsp-fc3fad54ded3
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

