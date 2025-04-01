Return-Path: <linux-arm-msm+bounces-52960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B147DA778F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E04188F1C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59861F0E56;
	Tue,  1 Apr 2025 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZ1uhco5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4C1F12EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503725; cv=none; b=Gj7Qdb76804FmafZOfNk944bPnVg+OfvMZ6OsyqWt+pd8rxZUhQN+Qke7q+cu9xajr0TtvKu0Os+kEFqxtqNfqigjMXuTrX/Ep6jGJF4qlyZGD/vkGN4uGDANN++Wufe+HdgraQs8FjuHd1p1AWif4YhoAKJfbmydcZshmWo474=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503725; c=relaxed/simple;
	bh=bB0Q88NaQ1z3A+sAKvbKfweAcqrwjXi0SB3rHqKzM6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3PJ1d0BUa+Lz8XUvK9cXqcFol3ky59q4EGwfRUugC/KGIXP7UeTRJPu8Tn5eSF2ajvcXStMhbfbFCxXi8nmDJ+LqBF/Pf9Dh/Cg2eRlGH4OanChZP/SQkLwDCWh+e9nNo8E/LZhSx+louNrI0UuFasI5idY020xqvYihFm8QYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZ1uhco5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0618746bso37169235e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743503722; x=1744108522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=094SZ9fz+o6eVY5ZaePMpljZ6ZXESAEN9w/PXff7gsU=;
        b=yZ1uhco5TGtEt2sLKCs3eIpdEgSFHue7Jj+dZdYa7Rt1xGwOKaWeP1mP8396IbKqwv
         A+D6SPh4U0lihS14ZhRUH6gzU9XXq45ErLmXw5Jwcf4mHP4G0RyU7FWP89TiBXhCwF8N
         ZuRPDTBsY5fP0ut1l3A3os0q6Vi2x6DQ375hbaOwcrFs4oojYius9WU/5yh+7Hf1s8bb
         sFWHjRFicJvwoSQNX7wMERcj3BxIGUzylimyxNWxiXQHqFK6j2UuZ/R9g1TtHzfavJff
         whXSpypw8SWzmbLOn3KvRPfHhSClzeelxNSNYWJ8GHCP3z/wRGUzO7HIXsBUV3LcqWD4
         mxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503722; x=1744108522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=094SZ9fz+o6eVY5ZaePMpljZ6ZXESAEN9w/PXff7gsU=;
        b=fSiIveFB2zYq1cKK7bUzP9g69EGnEt63ztmM9hpg3OVTCrBr5GBPDjmplBkSra7wyG
         DNvb2cXIlSv3XHeYYtz7sW/vmJqc6CZSlCxbQlskbtarDBKVsmYOWpa0TVJatTI3p9uo
         kNlqlDHhLNa9DssoSNJiv9YZdAmpnJIlnF4cJ9+s2NY8rudWAvI9L3hqRpg7ggrlDgR3
         vbbwathW70aQvLM7g1zQBXq3fqDZE44eXZlUmr6HVWLd+7pA9SQEGsxPNCKASGpl+iTY
         LSvIabN3VeHcuoDe1pFY4Nr8OyIO/aHECofvbtELAQdgYr1usRw9tt5xv9iWtReRvEcx
         uCNA==
X-Forwarded-Encrypted: i=1; AJvYcCVWcKXMcFdzDl7EP6rb690t2VSVM0yvQk1l+aiVisHiiYcpRzFjaNtHc5Aw8HpasKZBlBD3Je4/TF47R9lv@vger.kernel.org
X-Gm-Message-State: AOJu0YyPobUQ0t8Im/ufcOplop6LtFFwAbxWXDFL9g1jZuL78SNUZxCa
	H/RTfLybKvNM6aAnN+OlQWMlL34dmDBRGwb6YuoDcNs7F502NHgFaNV3fHRu1mQ=
X-Gm-Gg: ASbGncsuhZFoi2NBLhKLA5mVopS+ol0lgMUdq+l7dUdbl5DRtUj6I3BsNRJZAsCnorr
	LX1bFBVWUsHG9+w5FAUhznrdArd1GPGLEJaBp2o4sT01X86e7jMN/APg5dI8pu83uGYQnVwdkms
	lPdcBV7/frYnvjbc3w2HRfT2g8jN6JQnN6dttxTGzMFEv9D/N23rtz/IvGM+YJbT4q3qel/5K8g
	7OnzaVm4nCrdfsJT3MopPkJqDjZ/F7NecR+hRw8Lg2lbvvs+aFwlkk4e3OWooXvEn6PjxTrqjZ2
	Qr9QaE4n7EysjhU/h+ibTVSERfXO2jFYf0l77WlbvMI=
X-Google-Smtp-Source: AGHT+IH0MYFlI+kNZ16n6YuowDwZDpAgl0lcpbfUtl1S5hYwQqcUs9sspCA+WvoevEZPVnDHgpx5gw==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr102696825e9.5.1743503721639;
        Tue, 01 Apr 2025 03:35:21 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658c87sm13912049f8f.9.2025.04.01.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:35:21 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:35:19 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org, pierrick.bouvier@linaro.org
Subject: Re: RFC iommutests_: Testing software for everything IOMMU
Message-ID: <20250401103519.GC2424925@myrica>
References: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>

On Fri, Mar 28, 2025 at 10:11:13AM +0100, Joel Granados wrote:
> Custom qemu device: pci-ats-testdev
> -------------------------------------
> To support IOMMU testing under qemu, the pci-ats-testdev [10]
> (different from pci-testdev [11]) was used to emulate DMA transactions.
> It is a full fledged pci device capable of executing emulated DMA
> accesses. It was originally intended to test Linux kernel interactions
> with devices that had a working Address Translation Cache (ATC) but can
> become a platform capable of testing anything PCI/IOMMU related if
> needed.

Yes please!  Maybe "pcie-testdev" rather than "pci-ats-testdev"?  There
are other PCIe features that are poorly tested at the moment, for example
PASID and PRI. The programming model of devices that actually implement
those can get too complex so we need something simpler to precisely stress
the IOMMU driver infrastructure. Driver unit-tests alone aren't good
enough for exercising TLB invalidation (DMA after removing a mapping must
crash), tricky cleanup paths (eg. killing a process bound to a device
that's issuing page requests), runtime PM, MSIs etc. I'm guessing testing
newer/future features like TDISP would also benefit from a simple device.

Some time back I needed a device like that to reproduce some tricky races
but never got round to implementing extra PCIe features. Although this one
[1] is based on virtio any programming interface should work as long as it
can instruct the device to send precise DMA transactions, ideally many in
parallel.

Thanks,
Jean

[1] https://jpbrucker.net/git/linux/log/?h=virtio-dmatest/latest
    https://jpbrucker.net/git/qemu/log/?h=virtio-dmatest/latest

