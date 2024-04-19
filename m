Return-Path: <linux-arm-msm+bounces-17914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066528AAB73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 11:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5971C22131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 09:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFF37BAEE;
	Fri, 19 Apr 2024 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGUF9Kg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED076402
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713518800; cv=none; b=pd4K4MwtSm4xU4aWjdpqm9l+AzZ+Q9JrATS5mPzM6iaujyMdjbCPZZcI9DR3IcYTOna2mgvEjBLl2Rl/Hb6uJIm2ZAjQh9wsq2nBC8nJr0WTKVNJ3PghiS9eClxG/UqUWfwamiTHP7RGHKjlnIaAZbCgSfvfW4hWEezLMV5PM/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713518800; c=relaxed/simple;
	bh=nEQE1bgcahfGAeEROm4nIOqoBwmVPoodJbRFX+eJFiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUKFLqJCVHGdjTmb5o5yJDmfF+b7rSDN31urXqIdAL6+2O95Qu8cnp08hKcEGci6H4zUPgC617ao+im5KjEUG2awinASNJN7Xd8+g3Q9axeW802RWSQgUT4kNBzPdC9gN4JPuES3dg7l6zYEaX4MG9AqF4h4LFRQX/SQaoZ6Axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGUF9Kg+; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-22edcfcd187so730036fac.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713518796; x=1714123596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f2k6wBjEwpSJIIcZ8MPn1YroTKsxMSXWDSsv1Yc3sRE=;
        b=zGUF9Kg+YfIg5reVeeXUQSnLyDkpUGj4ulcrTG/5U9jobWew3+UbDq2OCWNOICgrin
         7hq+3cPPix++lBy9F14RWm5Kz62j93bljrW2wyIbZfSBeV6hVlDONbm0khRSoONFcdlX
         m41WZ3vCnL/HRQCbm9Qj5cOGZ83h+9xNVYIElD3ISyaC3qoGA2OXFv93nWqtkEmGcRmf
         xia1REZQMbnyGTtMXEg7PqQug4haRsaTWrvhTunIto3xjfTmbDau0evVRjD2xId5dtLs
         XrYMSEZPOuvjnznpUiRiIb5UH5FkSK+75423udCleJnPXJH82URJBsBFXKV9Z6T+oSqn
         DmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518796; x=1714123596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2k6wBjEwpSJIIcZ8MPn1YroTKsxMSXWDSsv1Yc3sRE=;
        b=hXPDkg2pacB6RhpPWUJ6tU0BiOjcYdp4T2B4q3ctbHwy8TYmNkg/GfwYIRTudSECzJ
         GqaBHBXrKvnLOVgjZLePt2wyOYf4ekk080arz2/C3bDBZelmzVcm5qGn27HUfm2jDYMw
         M7UW50qPpWfwA3+gjbN428kZXA/4k80BW1eJ/iUQZOGK7a09qzHpqN+lmLtyYBGbeHfp
         gMUINHHPc5dPgdlMlQRGCPvxZgSzEX3W+6LIGzVo6pMiz0sKgq+v834tiUCgYSx8BB7v
         A4+64SAwUM9i8rUOnCI9HK+8ZEXmks8y4ShXzeaGtbR9qaTS778QYqgByb45YBPfOfry
         GM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWfXcIFo0iQS8YqBiHUlNDz60uCCk272Lx+ADKB+5f9Y3gjrmzd2713Wob5nwBDsFzfisZY1x/XQYUdQM1lr1ufJBdzZOCpzZlrppMxg==
X-Gm-Message-State: AOJu0Yz+0UJuLTMqZms3cU897unW1hJVnntmnElbqfjemZ6ru642qNa/
	QCSILhQOxAZs0VQgHBcoLmIn+hft0sJ5iw8QbsTGV95LGlNBbrAQcajy7yC0xlofYdX/FtOgd/Q
	=
X-Google-Smtp-Source: AGHT+IGPIPPIitXX4Yw0hrulDjF2tnglO0Qdegfb3hKjRqYEF4E5wtIteUhkJR61YJc1aF7VAjq+9A==
X-Received: by 2002:a05:6870:12d9:b0:22e:c37c:453d with SMTP id 25-20020a05687012d900b0022ec37c453dmr1625314oam.30.1713518796449;
        Fri, 19 Apr 2024 02:26:36 -0700 (PDT)
Received: from thinkpad ([220.158.156.51])
        by smtp.gmail.com with ESMTPSA id z17-20020a634c11000000b005f0793db2ebsm2715872pga.74.2024.04.19.02.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:26:35 -0700 (PDT)
Date: Fri, 19 Apr 2024 14:56:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v3 3/9] PCI: endpoint: Rename BME to Bus Master Enable
Message-ID: <20240419092629.GA3636@thinkpad>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
 <20240418-pci-epf-rework-v3-3-222a5d1ed2e5@linaro.org>
 <ZiEy4EVcVpUry9qn@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZiEy4EVcVpUry9qn@ryzen>

On Thu, Apr 18, 2024 at 04:49:04PM +0200, Niklas Cassel wrote:
> On Thu, Apr 18, 2024 at 05:28:31PM +0530, Manivannan Sadhasivam wrote:
> > BME which stands for 'Bus Master Enable' is not defined in the PCIe base
> > spec even though it is commonly referred in many places (vendor docs). But
> > to align with the spec, let's rename it to its expansion 'Bus Master
> > Enable'.
> > 
> > Suggested-by: Damien Le Moal <dlemoal@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> Outside the scope of this patch/series:
> Do we perhaps want to add a bus_master_enable() callback also for the
> pci-epf-test driver?
> 

Makes sense to me.

> In my opinion, the test driver should be "the driver" that tests that
> all the EPF features/callbacks work, at least a basic test "does it
> work at all". Other EPF drivers can implement the callbacks, and do
> more intelligent things, i.e. more than just seeing that "it works".
> 

Agree. Feel free to send a patch :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

