Return-Path: <linux-arm-msm+bounces-53236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03025A7BCBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 14:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEE793B45E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 12:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C0F1DE4E1;
	Fri,  4 Apr 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1NwqwB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3C11C84DC;
	Fri,  4 Apr 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770274; cv=none; b=sym0Tpxojcm6Rs0m/q4/Nte+S3fJ7cYOOXizxCJtbQvt6PgF5cJ3CgWshTXJdMeHTrlwDX4J+5u5p08+cfF78UX1UtZskSzPJic7z5LrPl7+/TyvCdxe2uhX9WFp+WYAAXF4jzvoR9uN9XhhEvbTnXccqxgUm/0lVIApidyyiG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770274; c=relaxed/simple;
	bh=VvmsBy/mapPiKfdXXiu1j2lKuHaHgjbFqLZsrREc/14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/yiZrvCOfMjZWw8yYxwPckSerx0z//aKjV9LhfQU6Ggfai7zw8PqJ0BXL0UHElAnc1Cx9m1qWtBqlDXD98zvgR5IlFA2UL0Wl+HroNThUeu/0+fOYLGJssMBFXotJK4aYS2AhrZfObEHD71838+lvC5bvlwn6/XDeJ4TbbAVBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1NwqwB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923F1C4CEDD;
	Fri,  4 Apr 2025 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770274;
	bh=VvmsBy/mapPiKfdXXiu1j2lKuHaHgjbFqLZsrREc/14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1NwqwB24nos3tDQ7j5m3JifuV9ILytu8D46XEYOG4J/KP/L+RAFCTSQm1KXrifu4
	 4LI68DGxAZM5poiLYqZ4XI4D+N02CFHr5Invx5bcubxogk0wyHIE1zzCBS6x0CrAoB
	 IOTz+7LUNZIwfw72m1nhuhPP1UQG3wwDGs8TFceph+mz6/z+gdXH2PGNQRxQVw36ar
	 ScmsFUrhWkoso/zeBROuS18/0UFOzR2WBQvdyYObdon3XukPf/BiZWotYRevkAuph7
	 A8Kz7F/4axvslbMjfBm9ZNOj4XQjFx7C5qLihsd/EQ3/qUpfKnL4B4oWRGtYKGq3VR
	 K04VMlZhpxbZg==
Date: Fri, 4 Apr 2025 14:37:48 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Rob Clark <robdclark@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, virtualization@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-tegra@vger.kernel.org, pierrick.bouvier@linaro.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: RFC iommutests_: Testing software for everything IOMMU
Message-ID: <qk32ie2b663it7tjpdqfjecgrlamtuycyxulb5m2elblymzyqy@jcvjiqwgsmww>
References: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
 <20250401103519.GC2424925@myrica>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401103519.GC2424925@myrica>

On Tue, Apr 01, 2025 at 11:35:19AM +0100, Jean-Philippe Brucker wrote:
> On Fri, Mar 28, 2025 at 10:11:13AM +0100, Joel Granados wrote:
> > Custom qemu device: pci-ats-testdev
> > -------------------------------------
> > To support IOMMU testing under qemu, the pci-ats-testdev [10]
> > (different from pci-testdev [11]) was used to emulate DMA transactions.
> > It is a full fledged pci device capable of executing emulated DMA
> > accesses. It was originally intended to test Linux kernel interactions
> > with devices that had a working Address Translation Cache (ATC) but can
> > become a platform capable of testing anything PCI/IOMMU related if
> > needed.
> 
> Yes please!  Maybe "pcie-testdev" rather than "pci-ats-testdev"?  There
Definitely. If it is a more general pcie test framework, we need to
change the name to something like that; agreed.

> are other PCIe features that are poorly tested at the moment, for example
> PASID and PRI. The programming model of devices that actually implement
Actually, PRI was what we used it for. I have this as one of the
potential next steps for iommutests.

> those can get too complex so we need something simpler to precisely stress
> the IOMMU driver infrastructure. Driver unit-tests alone aren't good
> enough for exercising TLB invalidation (DMA after removing a mapping must
> crash), tricky cleanup paths (eg. killing a process bound to a device
> that's issuing page requests), runtime PM, MSIs etc. I'm guessing testing
Totally agree. PRI is tricky to test indeed.

> newer/future features like TDISP would also benefit from a simple device.
> 
> Some time back I needed a device like that to reproduce some tricky races
> but never got round to implementing extra PCIe features. Although this one
> [1] is based on virtio any programming interface should work as long as it
> can instruct the device to send precise DMA transactions, ideally many in
> parallel.
And it can be up-streamed to QEMU if it ends up being used for linux
kernel testing.

Best

-- 

Joel Granados

