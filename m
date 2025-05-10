Return-Path: <linux-arm-msm+bounces-57513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A711AB2181
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 08:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A64F21C0080D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 06:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3711A841A;
	Sat, 10 May 2025 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZetzR1e4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11D61DC9B0
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 May 2025 06:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858080; cv=none; b=uy27o3tZvA7sUSbrPua0ZtRSNxYvzXFeTdmHuLwgM8GYDyESNScESgHD4renfXbTTTzLd/B/8TCrW1Pg8dP/AhQ3beTof1Jf8hIusWGemMX0UY0S4Vv9AZvmKAAg3PWzCNkcuKX+An6d6lUk0D8sev5myT8RJ9h/rPn0AvWCgCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858080; c=relaxed/simple;
	bh=JymhY2Lji1skbyDvgo/JCt7WXfz/HRAkCCgyXAqNJ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdmw6TrkOqvqgrMvkIUSITRAG+xJoH+t0DTFhMoMJs7XARfIbaCgo+EdUBXuZVMIHcUcRmzKpsJ6e+I/+s7Ka47sKK19iVr5aKvWDVJCXl9Na0ZcmPozC02HbHwOhaFABnYbzJ7FEI4bd2qkjMZ8gZ03g3exwUReY2yhI2cBBCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZetzR1e4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so1315848f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 23:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858075; x=1747462875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZIcjD8vza+9SQ6jTMzI89exoanQPlW8N3/Fn2TsVOg=;
        b=ZetzR1e4/krip/tZuYBzSahAfKJVBj4UC+KmkX+/KYnY176xT5UnmBz7GS6Z7dImij
         2HY0+C77CEV/5rIuHmKcg919SIzQ9YmTT2lPurGyKQtgLC57fa48sr1BBv8lNTQVUTJg
         qVtw2e9LSB/A7DrMf0c7aXxT+IMX5OPhFsgMOjbKl9ZYJytFUFG0ok2sLg0O0Ol/+Hu6
         OL5lf2pdI7q+3mKpkMagC5YvBvV1Mmwv+hqYu8x9Ydx53eOPx2oPqVYLB4gtzDgJ8VI/
         lxZDphZo0JpDBSILduoWArj+SXHz/KN1jg5sL29SXiCaq3+jg/SjYw9ODY9G0Z0S/4X0
         ghpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858075; x=1747462875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZIcjD8vza+9SQ6jTMzI89exoanQPlW8N3/Fn2TsVOg=;
        b=OEXzw93mFpP083pGte33HyR0TiXY7uar4bMFK7A9BfhYwPQHdtCzxljzDP1qLeYt3y
         6h/iQFA6s5wXW3YhsTAzqft4TBBTMgVKzjLCvaitdAoLPt7JXz7EH+F5zyGEm3QrzPJx
         kqDRGXA1R8LrYoJrTDl3Rwh39pjdUvIlLJOEaKs8ZoheemmBMqv2FvexNjIQUuPYoH+0
         bRBSrkMsLPkccN/cqjw861fgj9cx4PXVojQe4+SloL6KIXA7291dqUOLViRirmC6DHef
         LHsP9dGD7rpUDFVWCk2ByNDOZJwz44fa9lp5x8ahyY/+0D3TqjAlvtFu7wCiQkri21NW
         z4vw==
X-Forwarded-Encrypted: i=1; AJvYcCXwYbsXkU9Kxb9Z7T9BbIdmcXmrgMrzyvQj2iS1haGxx+Dmd7QNv66e8QdCjU8fXRlowZR7/w+e0QOZCByi@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBseHisRODiQTMuIfcbwImzW+Lz2UjzPk9uc8cvIwjSu5Fp6V
	fgZ9px8sZOc7H3pvQJU6sSPX7n5llFHTanSMq486lESRsmhJoBhe6+5H+5OUCA==
X-Gm-Gg: ASbGncsnVHk0ZdLeWde5xSoROxlXk2YhUg0LirJaprFwLt/sxVbXKlM5vXSUzZ9OAw3
	+hmu5HgpHfqhjh7eJjngwqHSsRhvznwkYGukJ2X6dsIh7KLXRw+5Dku28KTsF0EGEXiotMdxsnd
	VhkQhocfD9hFDIc/j55tm+JrkG84K1mbaN+TuZLhUXSjDLxy8Y/06UuTYkXz+Jd1qtwRa7aPyFl
	WJkpz1/ThGkfmwgyEGSSbmsYI016hZXskWzDruhwgeCL7MtU8eg9CYKuUbnPgJZFvgy3Xr10Hq5
	vonQqlVBS21qes2kpzLqHZYHIvWULPxsANtU7gK+UU1aUtIcETVHSXdTA6pZkF8JgfOH3Ml11v/
	xuAluBbqZbqUznF0VeFue8OsvVuMwNrbOIg==
X-Google-Smtp-Source: AGHT+IGMLe8aqclfiaDHhJTdSSRAUPgdl8jvh/rZ+9Djc4Iov48r8+FjoFb55hRx9wfb+8KeZU0+Xg==
X-Received: by 2002:a5d:6604:0:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a1f67e3861mr3909565f8f.0.1746858075313;
        Fri, 09 May 2025 23:21:15 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm95560225e9.9.2025.05.09.23.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:21:14 -0700 (PDT)
Date: Sat, 10 May 2025 11:51:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] PCI: dwc: Pass DWC PCIe mode to
 dwc_pcie_debugfs_init()
Message-ID: <txuz4ri5z5tbaqguwyaekkxexffdkpe5knvw6xr35kikrbqjlr@27rxerrwmrdg>
References: <20250505-pcie-ptm-v4-2-02d26d51400b@linaro.org>
 <20250505183746.GA989979@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505183746.GA989979@bhelgaas>

On Mon, May 05, 2025 at 01:37:46PM -0500, Bjorn Helgaas wrote:
> On Mon, May 05, 2025 at 07:54:40PM +0530, Manivannan Sadhasivam wrote:
> > Upcoming PTM debugfs interface relies on the DWC PCIe mode to expose the
> > relevat debugfs attributes to userspace. So pass the mode to
> > dwc_pcie_debugfs_init() API from host and ep drivers and save it in
> > 'struct dw_pcie::mode'.
> 
> s/relevat/relevant/

Fixed while applying, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

