Return-Path: <linux-arm-msm+bounces-36538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FF9B77CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 10:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D4B282905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F019884B;
	Thu, 31 Oct 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5cXVcJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2687019883C
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367978; cv=none; b=R0sF0XZtYhlWwNXqg7oZR4bu/L8lYJqVkqzdlwbKi4yzdtaIu2qLw1hOfUW5O934fJOweauRz3f9vdv27Ko5N9LnFALRcmv3N/MHOTW0lPCA2w3Huuv6U/gAcETBFyiYDfot+WMcH96qFjHDgH+HvaYyeZRi782TzX4vOljoF08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367978; c=relaxed/simple;
	bh=RYO4XHF8sMF3038u8wAdPH1o7kz6vt6GLH7D1TKqDCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anyvyNGoLp6HhmiUQbrDYsNM/I4CotS+cHqWwJZa1K4llAFelkKQGIw6zVNnJnsh5En+VeyZqH+Gt79IVbUruXrCytURCp/tKAEnBoMg9iCBpM06VvrSYVxXDDiAh2pGfMyVNdND8DNAm/vZVTDhjxXrEJWT5mVtBG8oqAOXPJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5cXVcJQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so6340515e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730367974; x=1730972774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NEK6vwWEAJNHhYsycB2YCGu9gxW6fNQnXdwLB+q1lxM=;
        b=F5cXVcJQLwLRDqAr7WTdO6G2cu+OO+Wm3sa1KIQXGPBH2Yli+JbGamADxAEFDSKsEI
         H0FHhETnVxi1Kvy1o2JoZ0R/auzW9q8BC/XcM68xbSe+JvqF9QrFJuly1551B7B/HqSC
         tWmknu+sET+RKVy/IKDIgp7HPAYC4/mpw/Fq+h1HMgWJw3F2K//h3ir6Qf4LsJ9VxTiB
         T5qqwHR09dQULPJTkDTYoR8+yAleIh+x4T0v8syKLj+P3hsWZvDFNWsMa5Gub/oJKFm5
         FzhSZdhzuWw0aNPmb7lByHlEFIvYFwwzUoRHI2bRXDZ8pxbJ9bO3DX6wMpRejfJmO9k0
         JD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367974; x=1730972774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEK6vwWEAJNHhYsycB2YCGu9gxW6fNQnXdwLB+q1lxM=;
        b=PJSQ2/vicVLUjMcE3aebD6y/+QfwkhpvVcpN/EQeh4Uj1lZA2ZyoXJxwrBeZ/v6Ulo
         X4Q+WY+uRm3IC8cCA5PnLqJ4f+r7Jk/o6kRABz1lOqSrNG9Fh/J1yjPYZi2HsL3/14Ae
         LoRq9J3Y4iNSfAqXsCFwdHEWThA2qdwb2FN05cB70TE9sESXBkBF0sf/2brcxyQlurkE
         OFKkMykXcUDLrxn26mBzW5X+/wWSYiaZY3nRph42w9ldBtrGcV+fONRYU+Uxm/yQwLbr
         7VL1E14m7q17tXlAme69pRhz6YLz7FCjOBN9W/16Is12N5bmSK14r1bGUJJ8MrwTUUS9
         FNrw==
X-Forwarded-Encrypted: i=1; AJvYcCV2DYVNWRmgIoZizfFy3rZS3bqWDP9jIFm1in8vj2sftstHdrwbUndMOj/sDynPbDfNtv1jt3n2gD2MzSkw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51NvVYqdwCbMB7TE58ebuEojoq2pPKiGoltQOTqMODA9cKPOH
	PizgwFsD/ctUld4le3tCB+UNq1D/fwgWjC+ebKRGuV4235BIrQj7v/Bj9ZJZXMs=
X-Google-Smtp-Source: AGHT+IEdZ+urCQxf+7znEF1H9UI/lZQQmByTJ/RCUfklpAIbWk8uzsRa+zkNEnQ8IHX1S3NNI10CCw==
X-Received: by 2002:a05:600c:524d:b0:431:5aea:969 with SMTP id 5b1f17b1804b1-4327b6fd631mr22079415e9.8.1730367974433;
        Thu, 31 Oct 2024 02:46:14 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4a46sm1581364f8f.41.2024.10.31.02.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:46:13 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:46:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
	konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	quic_jjohnson@quicinc.com, jens.glathe@oldschoolsolutions.biz
Subject: Re: [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows
Message-ID: <ZyNR5MD/HAS5w7N/@linaro.org>
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
 <86y1251q3b.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y1251q3b.wl-maz@kernel.org>

On 24-10-30 17:02:32, Marc Zyngier wrote:
> On Fri, 25 Oct 2024 13:32:24 +0100,
> Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > 
> > Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
> > is the speed binned variant of X1E80100 that supports turbo boost up to
> > 4.3 Ghz. The initial support includes the following:
> > 
> > -DSPs
> > -Ethernet (RTL8125BG) over the pcie 5 instance.
> > -NVme
> > -Wifi
> > -USB-C ports
> > 
> > V3:
> > * Asked around and looked at the firmware, couldn't find a codename so
> >   will keep it as DEVKIT. Will update it if someone from the community
> >   finds something else.
> 
> My machine has the following information as part of its DMI tables:
> 
> Handle 0x0005, DMI type 1, 27 bytes
> System Information
> 	Manufacturer: Qualcomm
> 	Product Name: Snapdragon-Devkit
> 	Version: 2.1
> 	Serial Number: 5
> 	UUID: 63b5fc8b-9c50-89aa-fd0f-3fcef93dc291
> 	Wake-up Type: Power Switch
> 	SKU Number: 6
> 	Family: SCP_HAMOA
> 
> So I guess that Snapdragon-Devkit is another possible name. But given
> that it is a bit of a mouthful, devkit, Devkit, or any other variation
> on the case would work for me.

The point was to have something unique A codename would be unique.
Naming it Snapdragon-Devkit (or just devkit) will be confusing since
there was already a 2023 devkit (from Microsoft) with the Snapdragon
8cx Gen 3, and probably the next compute platform will also have a devkit
as well. So probably "X Elite devkit" could be the right option..

> 
> > * Update type c roles as reported by ucsi. [Dmitry]
> > * Update THUNDERCOMM to Thundercomm. [Dmitry]
> > * Update regulator names and sort Order. [Dmitry]
> > * Add x1e001DE devkit to the safe list.
> > * Mark regulator-nmve as boot enabled.
> > 
> > 
> > V2:
> > * Fix Ghz -> GHz  [Jeff]
> > * Pick up Ab tag from Rob.
> > * Use Vendor in ADSP/CDSP firmware path [Dmitry]
> > * Fix reserved gpios [Dmitry]
> > * Only port0 supports DRD update the dt accordingly [Dmitry]
> > 
> > Sibi Sankar (3):
> >   dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
> >   firmware: qcom: uefisecapp: Allow X1E Devkit devices
> >   arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
> > 
> >  .../devicetree/bindings/arm/qcom.yaml         |   6 +
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 814 ++++++++++++++++++
> >  drivers/firmware/qcom/qcom_scm.c              |   1 +
> >  4 files changed, 822 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> 
> FWIW, I'm running this as part of my KVM test rig with minor changes
> to expose the SMMU and allow the ITS on pcie5, and things work as well
> as you can expect. FWIW:
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Marc Zyngier <maz@kernel.org>
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

