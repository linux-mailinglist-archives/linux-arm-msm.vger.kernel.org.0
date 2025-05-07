Return-Path: <linux-arm-msm+bounces-57178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03DFAAE5BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E89A93AEC24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 15:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CFD28B7FD;
	Wed,  7 May 2025 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="c2JY5KPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB2281375
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633443; cv=none; b=iSPdCMGlM+W9T6EXh/YsBcvECONspFEffRq/vSvhkmt9ECcwzTdocdGpBXTt+hYZZNxKS9TG3L3lvvexxtza3iVhxlIeF8fnKd/MLPe5wgxBykX1LTdqd83ieG+KpEcOkvkbds+jvxtsz6afJ+UV3RyQHWibS0Hf0SF/MM3xBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633443; c=relaxed/simple;
	bh=9eQK4QAEow732KG9bEcHB4AIdULBpH4BjFf16UDvexI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZETkUiiu4Ei3kuAU/fHTyo/DyalUnS0C22EWU01v1wIaj+/OLn6DUb424CSBhF9zGibiAFZ4zRX4EpHumX00ZtthR0i873paCCsHY/Cc9vyQWVcbyWcRNU8VPBbkgnrvEvMs0kIuiVcQWs8kTC/Hfk/uBvhjGCflbAXMP3pUgi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=c2JY5KPw; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ecf99dd567so1008526d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 08:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746633439; x=1747238239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=;
        b=c2JY5KPwS7dMGTttlQW9NoqIo1buMspe6KQ3sjhXS2mgbzjSfCuTuE2dbDgCZZyWTJ
         8GILtNqKOYrQ4h1srezLMIPckWgwyjxihZa4i8IZDWjg9q9ZtrCiIh0SfCpGQmi+5xwc
         A9GO5X/0waJnCoOgQnFq8tbJAqcrg+WjMnCcWpcl+L2j1E1MnPYeQe0bP2+Tr2V+e/ir
         aft1PKryDLDjMkPq9W3q5C1NdnVveikiqQ79micevKp9mLtQ2FPhWL9hmN0VZI20XeGF
         4SR/5O3dtPnqk5j+k5ncfmUgEbn8YalS4AkNrct2vnGV/VqQJ5RTe1lD2+2jwKbVvL9V
         mGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633439; x=1747238239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMpiX2oAeFJGOcPhonwGxFO2XwnOZnyIjVcioz4mPT0=;
        b=uWjZk3XIbhMBnbQ1561Rj/Tfdbk1rKWuYrgyOSQB8AYevN92WNvrM91T2WzF90nWIz
         RV97mpWe9cmFUb3q47CkToobyuNyC4x6Dtt3fFLPXevQUd69bPJJgFzHQX7ZHPbzy+Yh
         dDORgVI1RahnVDg0V+GQdxmgiNk+t9tH16sut79fbfpE+zQJqaNrJ7gnL1NOGyk8iEHT
         LDLew1XQE7DPR4/9saoVr9zhpla7qKfjiSC3PCYF22P/3KalUlD9NoE3nKNPKz5CTfxa
         bnFEAcdPntJtYm821fSiB6GKgf6Sq2Zzzv04/+tN+cqg0MPgedWEQKaNlPAXCWcJD27Q
         fG4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhatF/9hoSA6Dq1DTMPevdyk1RHSkDo9Do+VfYSnlro1vNqjl4G4jATLqYC7OuydHY56mVtokozT3GgXxu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdIRXz9p+sGFhcO9CYZJzjxixTl77j8tQUWHUsQ5aYWu0t0Jef
	1DmQUiYrPNFL/VcJ4j8bjZlIz0J9X5XSjZMVpDN1RmGbN/0xQ0NNbv8W/p4Eg5Y=
X-Gm-Gg: ASbGncvBqVRR3pOjX1IoRJ/7LiuHansMieS8mg7LPpyruRuY/yPg+ErblWbzfVINi0F
	nx48sFj22xcgCRhjXIMsWNyzOd5SNtN1VwnUXlcsK5N06ajKckaQpB3nBq6AWaEp+20zfZHpgVW
	+i+E1qUROZ6BVRyhQL3QvcVNjmcZN7/ZJe3UgrUK3VVtW19GSb9wV3dZBPAePuwTqzklDAJNl+x
	2EUxWaTTswWTNmmRIqJyhBIciMIXhTtl3BX5Wh+mFTPW+JRNkBdeLdwyEjFSz+toPOsbEQz4HX9
	ovGZrFB0Tvfe47SNKi5Zy2llqfAj1ZOPRf2PwGqE1/c6YTPkH+DAVULpTIKFUvPMa5YQvuyuLlI
	QmA28jvmPdYDWiBiLJbvVAB5edMiSfw==
X-Google-Smtp-Source: AGHT+IGY3INDtooQYmwyNQCIEwpt7xooKZ7sy3RzrPyXtK9PFRJuzWNKcBsIXTsgY0x3k40zEUppng==
X-Received: by 2002:a05:6214:e49:b0:6f5:106a:271e with SMTP id 6a1803df08f44-6f542b03fd6mr64088116d6.38.1746633438616;
        Wed, 07 May 2025 08:57:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f5427b31a0sm15299126d6.113.2025.05.07.08.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:57:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCh93-00000001CGI-2d0i;
	Wed, 07 May 2025 12:57:17 -0300
Date: Wed, 7 May 2025 12:57:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Message-ID: <20250507155717.GD33739@ziepe.ca>
References: <20250507142953.269300-1-robdclark@gmail.com>
 <20250507144038.GC33739@ziepe.ca>
 <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8965ec0a-97d4-423b-97b9-7848454045d0@arm.com>

On Wed, May 07, 2025 at 04:09:47PM +0100, Robin Murphy wrote:
> On 07/05/2025 3:40 pm, Jason Gunthorpe wrote:
> > On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > In situations where mapping/unmapping sequence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> > > 
> > > Now that there is a quirk, we can also drop the selftest_running
> > > flag, and use the quirk instead for selftests.
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > Sending v2 stand-alone, since I'm not quite ready to send a new
> > > iteration of the full VM_BIND series.  And with selftest_running
> > > removed, I think this patch stands on it's own.  (And maybe there
> > > is still time to sneak this in for v6.16, removing an iommu dep
> > > for the VM_BIND series in v6.17?)
> > 
> > You should just remove the warn on completely, no other driver does this.
> 
> What do you mean "no other driver"?

The server drivers.
 
> From a quick look, these IOMMU drivers have some sort of visible warning
> related to the state of an existing PTE during map/unmap:

Many of them are just using this code.

> while these IOMMU drivers do not:
> 
> amd
> intel
> mtk_iommu_v1
> omap-iommu
> riscv
> sprd-iommu
> tegra-smmu
> virtio-iommu

Which I think proves we don't need it and shouldn't have it.

Jason

