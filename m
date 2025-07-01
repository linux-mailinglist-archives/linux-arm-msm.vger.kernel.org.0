Return-Path: <linux-arm-msm+bounces-63295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06237AF0698
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 00:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0CE4A2846
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 22:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B05223716;
	Tue,  1 Jul 2025 22:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyfG+f/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD91A0BE0;
	Tue,  1 Jul 2025 22:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751409174; cv=none; b=RzsVwuJEwDKNteDhxEHXwHpIqL8TQUfpqZDW60vuxMrh7qBk50FFOQk3OLqAmwiLettuU+YEaNd5/CXQoxcvqzWivTEXDttE05y8+g6uYYzDgYXuMFdO0VZDFLPwSpK8/CcwHX4o440WWK7t4CwAF/7vUfa8DY/QChh7NlJ7NFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751409174; c=relaxed/simple;
	bh=eOpjsXIujiWCh/1VyzJyspu8eJOUHHgxcTY+na6+odw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+9DMsKjKg0dxsoRVmnLCp+Da8T+xCMZGuf3GG5Wd1MOc5o9V528gbKxIjWliWdMqrETRTP0e4+Y9Iw2qejxOx7B9SdPlWY/nRxI4cU+Jib25GEusJTvfDHWdsHr/3hVqS5pKkDhJGscTzMBnpWji/HML2vLHTsNvM7VqaRlZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyfG+f/D; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a9741b513eso9546951cf.1;
        Tue, 01 Jul 2025 15:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751409171; x=1752013971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tdYhgZZCEXbJGpnYrPmW0z48GoHhWoQONygxFgNasxg=;
        b=lyfG+f/DS7U7eD7fpJ+MMvTILXrxokt0LK0iH1PHn3yGTEKF9lG/kBF+7wHsdaCyIm
         ExB4P9mB1yCydH0129OHbvkDcgFPCQZgINOylf6aqM0PW6LCPLYUKSRInuT05yi37wEw
         T7Z9nTrXbPOa8VH9lhBF9og1pUcd02oUZuhdMIAHwvdKWBI8aksdGu6WSgFXedUgXXjr
         58rgy0ZIPR0mvSbo9LTLZp909YAbvMeD+fNCyLAZ0eQNeD0CoGsi0cXKly34lBdbpeC1
         /5YcLhX2DIOkve7F8FtxXGkeBWEF54O3QMKLzrUA4vMtgLP2Fm91Ft2FXsdF6HSYVe0p
         /Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409171; x=1752013971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdYhgZZCEXbJGpnYrPmW0z48GoHhWoQONygxFgNasxg=;
        b=nMqd4XLSxHKOl89QnxI8NQbk3AoceH4fjdKMQvklCikUHoMoqPUwU4hWxw1S3kEAYn
         H0AOZf6jpbgSbXiOsMl87NsC0Mw4wkm07BdU/0oOar+QoCyZDE1d8R6B6Yh3wyxPfyN8
         V4rUDtkCyLLup8q3RjuTyhZw97SGKD3MK9WpNgTysjXbXi6QUkg4Xw2pXNlNC3f/QwIH
         ZWUIQWkOIW3JfK+4wBUJEiBzV7IVJqGVc8/UU+DXWWXQGN97/B0C/Mvp2vxwW0ht5FrP
         r7/q51uAaK8wJX2D9aZngEIC09SsWHyJZd4PqFUTjTp/19EI6hZGP5ihIq0cSAGPrCZy
         2suQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7//AfkNtywF3kXODpUtmew316fS1q+REZ6VOrJ4A+OwJQXOIx7XJh/sTjdATcYq4hfMN/QTj1xDmomK52QA==@vger.kernel.org, AJvYcCXDY8WSKv8IvenhYRW9gJUVigTjCHL6p7JY5OCH1tjZQkx3jb2iVVzO4VvFQein1yJzWHAXaXMHIUak@vger.kernel.org
X-Gm-Message-State: AOJu0YxUuxJGTSDFTRIz63hQ0oUk9Z1UqDa0HESe/jxC7UDiU8kVlz5E
	2znwisxq0AX242DX4HGo7Ewae2jQk9yqOsRvq1zfzNSseLFQSyEQag9f
X-Gm-Gg: ASbGncs8flt/wtamoyYt7DsCnT0OdcLe61pI0MiQwgCRo/DL8ItkzIMi4wwAE3ngKy6
	N+ibPEKJY3lrkZVVSLjQ8wOVIWowNfdDF7d+aOuHwf+Ph3ktvjkwubwTNm0zhSYeI8w53K73SXp
	CyVw0ekuNqtW1YMKN3zZ0B5kXraF/PJBketOUaSq/PsMhwUv5xSgnCRfpSpKyjjcEs499U1PYru
	vtL+FCiNN5EywTtd7Sr90jY2AAW3s+NQHgifNbm8uLPdC42HAJvM2SBoeun4PY28oupbZp2WKiC
	GezXrdGdaJr6w0BbRUln2YWTTr8pPFJjndWpgUrWB64WyzWWFw==
X-Google-Smtp-Source: AGHT+IEtwfsZWwZbAPRSv2MAu0spgXNaGCGHNcfwitMEjFEbDWIAHNxKAIPEfbe4AtoxXTldN+F/Nw==
X-Received: by 2002:a05:622a:304:b0:4a9:5220:7fc3 with SMTP id d75a77b69052e-4a97691056cmr14087461cf.18.1751409171485;
        Tue, 01 Jul 2025 15:32:51 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::9bde])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a7fc106202sm82155241cf.9.2025.07.01.15.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:32:51 -0700 (PDT)
Date: Tue, 1 Jul 2025 18:32:49 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google-sargo: enable charger
Message-ID: <aGRiEdXs6pwRH5CH@radian>
References: <20250630224158.249726-2-mailingradian@gmail.com>
 <f931e284-6ae6-4177-83bf-c6eb1ce583f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f931e284-6ae6-4177-83bf-c6eb1ce583f9@oss.qualcomm.com>

On Tue, Jul 01, 2025 at 12:55:14PM +0200, Konrad Dybcio wrote:
> 
> 
> On 01-Jul-25 00:41, Richard Acayan wrote:
> > The Pixel 3a has a rechargeable 3000 mAh battery. Describe it and enable
> > its charging controller in PM660.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  .../arm64/boot/dts/qcom/sdm670-google-sargo.dts | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> > index 74b5d9c68eb6..d01422844fbf 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
> > @@ -33,6 +33,14 @@ / {
> >  
> >  	aliases { };
> >  
> > +	battery: battery {
> > +		compatible = "simple-battery";
> > +
> > +		voltage-min-design-microvolt = <3312000>;
> > +		voltage-max-design-microvolt = <4400000>;
> 
> Does this match what downstream sets into the hw?

Actually, downstream sets the "empty" voltage to 2.6 V. This minimum is
closer to the "cutoff" voltage at 3.3 V.

The maximum voltage is consistent with downstream.

