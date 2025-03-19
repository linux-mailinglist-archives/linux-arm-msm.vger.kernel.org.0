Return-Path: <linux-arm-msm+bounces-51939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E157BA689BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 088B1166A80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8D925334B;
	Wed, 19 Mar 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEh1EOjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ABE253339
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742380509; cv=none; b=mBeCwqbpKf32p5La6Va4sRrZjAW/kROMBT/qVhWyL12F6KGaOrgwxbMj9XF0kSqzC94iroK/67ICKeFGRUH3yx2svaBvmrz43Eyh7Q8Z9vBZE285QTuwXUmgfRCGU5w6QD43ekYO0hFoACxHPZ+91Q/D3xlYS6od/5tXLMNGb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742380509; c=relaxed/simple;
	bh=KCsRkb8vN36baSyiy6rhEXHNSa5J+ZegQpsnCp9SCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfUw4cFdfo4SJjk9MmuqbVwyCdSUVdsMnvUDf2RriSj6m2lNq7r2yNj0zMiuvJ4EhP0G4P1rCkn0UOwT0WZzOOoH/UkN5uOb+BPsJ7k+6rXru/ogbePDVoL/k0E1cvC2WlkbcIZwHqTXXlrjacWNI6FTYpDA3Oo9Wh1hzlGsNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEh1EOjj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1311718766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742380505; x=1742985305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJiELQ7SXzvhmTEHFyv/E/da9nG/EmOnRVtuGWlgjU0=;
        b=dEh1EOjj9qH7Ii15X81bYgkXUWds768UHhJHooKHo6IS4RV2WSAbAls26QnQ1zftD1
         rNcacrzwtCaavKnxPLgesX/t+W3dDFMx9Je6V8Nmwt5tK/VyTDEUkvCKX6CG8czWSEmT
         aAiafS+Oqf6uHnaccQeUIC+olGL6fA/rNx7K6ijBnEuf6hSuwe+uwfTqGegDKbMlJDxb
         ALDSA6lz4+9Wni/2cA06MNqvdXUWlPWPg3chYMRJlJNFXlh3NF77+yAH2madxptzXiyq
         VdzDFrNsm88AqdD/6SDxNTJ4TKMiOUrbtgA2C/Lr4KhSRMjGsy5udK+/uMc4qncUnbdF
         if+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380505; x=1742985305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJiELQ7SXzvhmTEHFyv/E/da9nG/EmOnRVtuGWlgjU0=;
        b=LH7OLPTYqB3LZYKrWnY6UwMFTxnAkg2KwzH7E6W9CNnRfDDYNC4CFIVuWT2RV4iqtH
         tz5uMSA8WaYpiWvMAkiOvyGjrqOSUzzmY0L1wZSb3MjNDwIyw2yJZUtpmxrhXvkw7SKe
         F8XCdLO06lV8ax1+PtnChgEWoXNtx9rbrs1yLdKVuvwheuWxENM/o3cIsRxwSgn4FfVK
         EoUsFLvYRw5T3JpRuhTkNc0CEztzg+pJc2XIzZJsIaux1RoK4CoXPRcQOt1qNBkXh7T2
         FNcteDozeCYSK5/WOsE5aGEw4BWngxedoU1aalYm6BsopYJBNYEP8wfi2l1BgW9Qp9LO
         oUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUP/wnHn7bSPnNTp4J2QxIXeH+0gYht/EnnXOzfMWD3a7+Jr9aPJ+EP4EcF1dgOnjHsH5yCoaJu3PqY7050@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAKGarm1NzY9lDrznSGUnJWh1gybqbVd7rsq4qRVbsTEV1aZP
	TzJtvtBZVLLCKvJ8zSkwy83x4PCYFl8YRDCYPltRku3Q2Wg+hvEE0sKYtemcv9U=
X-Gm-Gg: ASbGncuGFDsZZERrgeKXaCbDIwX/+RJ5FLuO+v+kw4FGiKCYd/wxLhDYWqGefbIBafr
	n6pK4j+ks4bmOiS36/z8mR6SwwfkAqX7JR6IGqhc+DBU1ICD+XWx0nK67qsemBRsf1jNDSysV2y
	9Y8bztzk28tDMpWnf1VY+UZEYBWRF6uGIVO8GeFTP8l2VnpQQOVWWaOTOkT3O8oB4aO0kViPfWt
	ocBsKjZAkT4+wuL8stHRrZI6WN74Y3YZFQbViSJ38QRUUgkE7RJFrb5DLBsr5JfYVUTa0ULTWYY
	t6zOWj96AIND1qKpFJOm87zJzyl9cgoNNVQvC2WqAqAqYR/4CjRjV6XZ47UYuCsxnKo=
X-Google-Smtp-Source: AGHT+IF/qM0/SASBIGdjRrvuMPa5qGcIobujWIpo2w87RLiD6k2szichS0jUQdcbOxhJtXSDIis2vg==
X-Received: by 2002:a17:906:d7cb:b0:abb:9d27:290b with SMTP id a640c23a62f3a-ac3b7adcbb3mr239283966b.9.1742380505236;
        Wed, 19 Mar 2025 03:35:05 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:1274:3124:56cf:f607])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cf09dsm971492966b.121.2025.03.19.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:35:04 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:35:00 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	bjorn.andersson@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom: phy-qcom-snps-eusb2: Make repeater
 optional
Message-ID: <Z9qd1GJ1418CbaOt@linaro.org>
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
 <20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com>
 <6yykvszzbhonc3dkwhva55arsdvp4hv4p2fo2vv6ftwr46httm@wnofgs4jaqaa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6yykvszzbhonc3dkwhva55arsdvp4hv4p2fo2vv6ftwr46httm@wnofgs4jaqaa>

On Wed, Mar 19, 2025 at 12:20:07PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 10:22:56PM -0500, Bjorn Andersson via B4 Relay wrote:
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > In a multiport configuration based on the SNPS eUSB2 PHY it's not
> > necessary that all ports are connected to something.
> > 
> > While this is allowed by the Devicetree binding, the implementation
> > current fails probing for such PHYs, which also prevents the multiport
> > controller from probing.
> > 
> > The lack of repeater does not alter the fact that the PHY is there and
> > attempts at describing only the used PHYs in Devicetree results in
> > failures to initialize the USB controller.
> > 
> > Make the repeater optional, to allow the these PHYs to be described in
> > the DeviceTree and for the associated multiport controller to operate
> > the other ports.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> > index 1484691a41d59a7eaf257ef44300827c668bf7e0..8897d2072ccfcaa5b4a510c17761dcdeed5bad0f 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
> > @@ -401,9 +401,13 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
> >  				     "failed to get regulator supplies\n");
> >  
> >  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> > -	if (IS_ERR(phy->repeater))
> > -		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> > -				     "failed to get repeater\n");
> > +	if (IS_ERR(phy->repeater)) {
> > +		if (PTR_ERR(phy->repeater) == -ENODEV)
> > +			phy->repeater = NULL;
> > +		else
> > +			return dev_err_probe(dev, PTR_ERR(phy->repeater),
> > +					     "failed to get repeater\n");
> 
> Can you use devm_of_phy_optional_get() or devm_phy_optional_get()
> instead?
> 

There is such a patch from Ivaylo already [1].

@Ivaylo: Are you planning to re-spin that patch set? Might be even worth
putting that patch first / sending it separately, since Neil pointed out
there that the bindings already have the repeater as non-required.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com/

