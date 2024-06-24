Return-Path: <linux-arm-msm+bounces-24016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9469155C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 19:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236AF288436
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CADC1A01C6;
	Mon, 24 Jun 2024 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rnNGkniw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5319FA79
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719251269; cv=none; b=BKQK9t9WkFUIaWZUhcFJ3TNqDH1PAesJlDMMLOm5ZUD6CnBB7q44BClGxXsO/KYa4lhdfH5GpXc3rxJHxcpy3Btfbi66xadXvJDZVH9V1FC8yv6T4tb3wbgjkXPhKXBZ+JUOrVz3MLGOF3cAwILRURz7kYFEpM1VCMYmhj2oqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719251269; c=relaxed/simple;
	bh=ohdxU8Fz2mDeaBiw2qfvNxp2pYsWpiZOLLaWbZEbBXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJm2OadPjFDlkJoD7cxz3ez+6t6BWME/fuNvkx9CJiIluxsLGoqKMCKOl11Nrf+sJ1AvtepWhQMnVyY8DSPmx1UydWHZoJXIPMBQApSAPwwmv5w66liy5KiKyqde3KPe03GkoXFEh1vJoUU5LP1ZUlYwt9hN1YeBHuY10WTEMDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rnNGkniw; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec5779b423so23588681fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719251263; x=1719856063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19dor3frlktKucc3yoQbNWT6473/8aB2is7dibOXrAc=;
        b=rnNGkniwqrQmWnEfMMxHlEba8HAQldw5lTblKG8ZJ5fARVVNZYnNpuHxY6P52BcL8X
         stj71Qtf5kvK+6kjolKM0I6cWr1o12hSeW9YD2OtZPp930xfOb0uj9mzZipG52BnTc0G
         bw26LiYwTPljGbi3csdjjWfdXvXM7FcASDDWEkVLAwwvYm2LCTmZJar3Ktyp93+L8Tqu
         tJGTLs7ZQ/j6RcnNC58wpgk1K2VtYzsbKhZxXdwT29e0ikDTRN3lYCGSTYAa+eKXr1xl
         UfyXxcHSC2NNvbdR8GQjJIMJAjJVgI4Qj6yDGV0k3n598dvpoU6qdel2SW8/ijQBDV1C
         BYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719251263; x=1719856063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19dor3frlktKucc3yoQbNWT6473/8aB2is7dibOXrAc=;
        b=BfDLLxtkkMEFWdQMA8eVpU0YzjEsqsmJ+GnOSq07/UYA1+/JFo03zCRMWNoKOE8iad
         Jxk/BZspY74vp8GH+k32adIhY/7gh5FzjWcI0Xc7VfFGh75b0ZA9V/M+I/bkEXO0w50S
         B1TuOT5pUfen5r9tr445p7ARX/NPEkNZwRNt3+aP0TrBgUfkrPK7fY+ddy3RRj1O3bmC
         CYo7LwCy1rrdS++Dyr9ylkdFLrMrFjBIC8Gf6oORv8OmTTeEqfeJdH+h0rlfnwU4vv32
         KFypKwz8Ba0Gx8AKbAbb1svrCveyV8AoWudC4EnmnOiRUUOKPsaCytcKuy82pKPFpxGu
         LsjA==
X-Forwarded-Encrypted: i=1; AJvYcCXpn3r/hKJ2UeVMInNh/MRHA4rP/6gLPikBw8FJGQ6M1Nu9Fy1T8/3mBvguVWm+oAuBL7l8xe2VyVgBSG/jA1DkW7jljacxiAOo5colrQ==
X-Gm-Message-State: AOJu0YwmupXtYZVsLoConseGX4LhErCSBKfoumFQmiWdiED9WHujGDT0
	oQ6ASWX/mhquULraX08HmTlK5lLetDMqtwSOc6GqDxPLl5HYTv3rommlVYq4TEM=
X-Google-Smtp-Source: AGHT+IF8CTA6Pf5r+RZJ3Engm2T2PxiUfFSoo1ekVgw+8UlquVeQoifd/SwdniSFe07K8tIcUz5OFQ==
X-Received: by 2002:a2e:9c88:0:b0:2ec:5364:c790 with SMTP id 38308e7fff4ca-2ec5931d8cemr48224931fa.22.1719251262910;
        Mon, 24 Jun 2024 10:47:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec64af4afdsm1753071fa.55.2024.06.24.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 10:47:42 -0700 (PDT)
Date: Mon, 24 Jun 2024 20:47:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v9 1/2] platform/arm64: build drivers even on non-ARM64
 platforms
Message-ID: <jtrwgljegbiebihr3d5ccbhlokqxe5ovasg5xxxh4mrrw2ccux@24iebp7zkqqi>
References: <20240624-ucsi-yoga-ec-driver-v9-0-53af411a9bd6@linaro.org>
 <20240624-ucsi-yoga-ec-driver-v9-1-53af411a9bd6@linaro.org>
 <645b8ae6-10ad-11f9-eb18-a931f258bfd2@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <645b8ae6-10ad-11f9-eb18-a931f258bfd2@linux.intel.com>

On Mon, Jun 24, 2024 at 07:27:41PM GMT, Ilpo Järvinen wrote:
> On Mon, 24 Jun 2024, Dmitry Baryshkov wrote:
> 
> > The Kconfig for platforms/arm64 has 'depends on ARM64 || COMPILE_TEST'.
> > However due to Makefile having just obj-$(CONFIG_ARM64) the subdir will
> > not be descended for !ARM64 platforms and thus the drivers won't get
> > built. This breaks modular builds of other driver drivers which depend
> > on arm64 platform drivers.
> > 
> > Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Fixes: 363c8aea2572 ("platform: Add ARM64 platform directory")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/platform/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> > index fbbe4f77aa5d..837202842a6f 100644
> > --- a/drivers/platform/Makefile
> > +++ b/drivers/platform/Makefile
> > @@ -11,4 +11,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
> >  obj-$(CONFIG_GOLDFISH)		+= goldfish/
> >  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
> >  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
> > -obj-$(CONFIG_ARM64)		+= arm64/
> > +obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
> 
> I made a second ib tag with this patch.

Thank you!

> I'm a bit disappointed that LKP didn't catch this in the patch stage, it 
> feels almost as if it never built any of the versions.

Yes, I had this feeling for several other patchsets. We started getting
build errors, despite having the patch on the maling list for quite a
while. I've just got the modpost build error for drm/msm driver, for the
patchset that was on the ML for weeks.

-- 
With best wishes
Dmitry

