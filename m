Return-Path: <linux-arm-msm+bounces-23239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6990F411
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51AE21F21D2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4963C15278D;
	Wed, 19 Jun 2024 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Yo7W9KHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49C414F9EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718814791; cv=none; b=CxLGcDIszgWvj00wiGy34Bh2ajVWzZ22GsY/wZQXjUPUcWfkuC68LVaSbPOqGDTndf+fqVihS6L0lrL7zRAdxVxgKmTfvGIU5j2Oa6AwX/MrsWCWTz6vSjSveE5hemZOFpBdiC+rhH1zQtLaUxiIQL/wrUrJpRa9MaH/2i5Evlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718814791; c=relaxed/simple;
	bh=FVFYCJ1EGfwnkU654yIVzNaWy+IFuApDG9DYERxXLt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCzDgLS2uzcf0iZ7I87xvtAZEzc9Rc9EK4CwRTBE06kdnEW+LQ/0vKzS8qEmlCC3lEnu2Vj+h2HOa9Jw4pFLcGergoGLF0B9nk3JesL5aeiirfcUTE2ZejbZ7ckWbXcGpOdYm9Yg5416GhbHKMRoIMRvkp45djUE2t1Yq8GUbyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Yo7W9KHX; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4449d1870f6so11133441cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718814789; x=1719419589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UxqMh14wh6rgt2Gb04HuzckvnrRRbYR5Yps3CaoDEDg=;
        b=Yo7W9KHXCsjDk594noZE6DPWa68JqoR3ltK8oYZqYjbiw7nbO+F7ywwvgJKYDmJfNM
         NFvVTm6aVXfypvEo/CAUlsbK9DwnRL69jNbNkwBZlroWJPW3xK2Pw5iGnvudi8/9ay73
         1E8YAYpsqDvjFsWGDgg/Jc4TUSVdrQ1cOfMRJ/+3ySsqkXeTfi6p9frFfLfOD9I6RF6O
         YXz59W+K07hVN9Exbh7Nf4SngTqZ6C7bEK+9FsiyWQn0+52CaNNeZNn3S/YijShLHbcF
         rigOIsZbZjsl3MCEWEmynsrxOrFpyeoD82XunmYcppiYuRcdLrfKAcNJIfQAsv2mCp1c
         mIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718814789; x=1719419589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxqMh14wh6rgt2Gb04HuzckvnrRRbYR5Yps3CaoDEDg=;
        b=U3Kn27O6tejXqqfNukqZXET4fvc5nirG80IOD/mWGN901JA71yPluAXdTNWj1plfyX
         icIorRZovDI0PteNnoqtKhvk6SqlipfulqxW4nfpx2UshTD8NzDSwIJ8LwqXpHileS2Y
         YGbMe+McKaH0zxzAzF62V+FRaT6K/NVAa6mMnNSVhSeNcWRY9nl4PGpFAKQyNbkq/s/5
         8MU4YUPu64MF1edWlAvhZ+F5aM0uwhz1N3Um6oe+YbkVujTfGGOdePuIEZjiCuWlPD0w
         1uM44bm5VaY0OqM0I3PTb5PgGul6nmHqFjGNAOU+Xh59uX7IIdXj2BhqU+J4jOHbjX58
         jxBg==
X-Forwarded-Encrypted: i=1; AJvYcCUfsGGBepVlV5RR2nesB9vkOPEUGlV+7eNqp6rXMrkJuLXCnlbCOmpWWDwTRYbVXqFgXaGoOZO6P34IwRcaozPBHPF5S7lJ3xhjr1WMOA==
X-Gm-Message-State: AOJu0YwnhJzu4Gup4xxuxeewmUNzBbm3F2Ev6I2cU29hPlvxlwRKLRcF
	fzOB8RO4p1XdHOyOCT1lIkQ3c9OEtLOWa98oBv9rOuM7R7jvuKS1PV/IZt8Vx7A=
X-Google-Smtp-Source: AGHT+IEi+7foZgh/9Z0anYpjxAAXArw1uJUHOfsFSQr7PUdyfMayYNr0/bYNAmiUhoW9f3jLzo/I0A==
X-Received: by 2002:ad4:55e3:0:b0:6b2:1094:83bf with SMTP id 6a1803df08f44-6b501df81a9mr31902396d6.4.1718814788824;
        Wed, 19 Jun 2024 09:33:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb4cf9sm78898276d6.97.2024.06.19.09.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 09:33:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJyF9-005AMj-BB;
	Wed, 19 Jun 2024 13:33:07 -0300
Date: Wed, 19 Jun 2024 13:33:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <20240619163307.GL791043@ziepe.ca>
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
 <85f5250f-0d50-4aa3-93c9-2008c6ccb8fb@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f5250f-0d50-4aa3-93c9-2008c6ccb8fb@arm.com>

On Mon, Jun 17, 2024 at 04:13:41PM +0100, Robin Murphy wrote:
> On 23/05/2024 6:52 pm, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> > would be traversed for a given iova access.
> 
> Have to say I'm a little torn here - with my iommu-dma hat on I'm not super
> enthusiastic about adding any more overhead to iova_to_phys, but in terms of
> maintaining io-pgtable I do like the overall shape of the implementation...

If you mark arm_lpae_pgtable_walk() and the callbacks as
__always_inline then the compiler should generate the same code as
today for arm_lpae_iova_to_phys().

Jason

