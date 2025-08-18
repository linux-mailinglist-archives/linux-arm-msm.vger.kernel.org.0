Return-Path: <linux-arm-msm+bounces-69519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C438B29E89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1861189591B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BF130FF1D;
	Mon, 18 Aug 2025 09:54:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cdw.me.uk (cdw.me.uk [91.203.57.136])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7925830F81E;
	Mon, 18 Aug 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.203.57.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510883; cv=none; b=bkLEWSsxS+32gv4Z2svTHPm7FIPVPAPsduY2cpUPmAJmhxiI5Co4WMW5IUwIPXBmUmzG5P8wmzOZYCmJ5Idjd6d6yjuCe8OXhznz/+G6f1OGXz8y0ItkjwJVA2ikpJsqeGqM2fC7xhv1si94Rkn/QfXXB2OzRfEQ6E/Q91uHDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510883; c=relaxed/simple;
	bh=I8lfaokORzYRA+TsnF4mKU3HU5Wu654aIFxE/eI4YNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI97ipk5gxfPTIEvWsigFn8AxAwSh4rMuagjKXvV8Ya7mBR/4a0Io/WN2paJq0u9y9qfiQ+O56yXZRkzXUVzjEJi+P+x+B60k4l/1AsSGgaxZO4iemr7VlljhEJ48L7FPwRTIRzvVtShT6KhwtR2BO53lcTjBojmEqvXhxTNDZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com; spf=pass smtp.mailfrom=arachsys.com; arc=none smtp.client-ip=91.203.57.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arachsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arachsys.com
Received: from chris by delta.arachsys.com with local (Exim 4.80)
	(envelope-from <chris@arachsys.com>)
	id 1unw8D-0001lh-0x; Mon, 18 Aug 2025 10:26:21 +0100
Date: Mon, 18 Aug 2025 10:26:21 +0100
From: Chris Webb <chris@arachsys.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Duke Xin =?utf-8?B?KOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: add support for Quectel
 RM520N-GL 0x5201 variant
Message-ID: <aKLxvZDBhoEKujI1@arachsys.com>
References: <20250512112631.2477075-1-ynezz@true.cz>
 <aJ7SMWSWw5l8rS4I@meh.true.cz>
 <ywase3lkm5iimrzyin5grb3hr36zedsvzs3p2z6z2q6532g3cq@25ibqnpmanvo>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ywase3lkm5iimrzyin5grb3hr36zedsvzs3p2z6z2q6532g3cq@25ibqnpmanvo>

Manivannan Sadhasivam <mani@kernel.org> writes:

> @Duke Xin: Could you please let us know why the Quectel modems are using the
> QCOM Vendor IDs?

In particular, I wonder if there's a way to reconfigure the modem to
permanently set the correct IDs so it doesn't need a patch at all? That
would be a nicer fix than adding to the giant list of variants.

PS While the tiny diff here is mine, the commit message isn't, so it
probably should be attributed as From: Petr rather than From: me. But
this doesn't matter if my hack is not correct anyway! ;-)

Best wishes,

Chris.

