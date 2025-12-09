Return-Path: <linux-arm-msm+bounces-84777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3ACB0206
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 14:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 013C63014ABE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC98263F5D;
	Tue,  9 Dec 2025 13:59:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93C722A7E4;
	Tue,  9 Dec 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288752; cv=none; b=tCjSrV07BoUH+ep2Dmvq+Ee17QgkwqW4xwO2SvzNXGR6KHobHpvs411sxgDMTVxejfWBZXPzTdM7hbtoeuqJtL9USTyVOKlrqPKHPpWIab7UIVJuvMmOmgAbXGF6HXLNJobXJ9vURdr92zwP3BA/lOnhpFJrLzAcVOrFHHbC+hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288752; c=relaxed/simple;
	bh=3s7a7psH61+zrjZz4QaWdew8h4qnk8NnNjdq+5zLUKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llJwUqTPLa9ZOB+x6CFe9zmcQiwZ2CNYsCjnKJ7qfwLpiK6hCje6DwB0QpRnsiKkWFBEYO4xl3Eah3RHHjZH/x8lK69yoDoWdg2So9TBkcv7m4Pf2uTNF3zBs4FCksCCQrC6JlImFyQ3quBzHYJtBZx6M4lYTeigy8B1oUuGxoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0DF2175D;
	Tue,  9 Dec 2025 05:59:02 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1623F740;
	Tue,  9 Dec 2025 05:59:09 -0800 (PST)
Date: Tue, 9 Dec 2025 13:59:07 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251209135907.GU724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com>
 <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
 <20251205100432.GO724103@e132581.arm.com>
 <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>

Hi Mike,

On Mon, Dec 08, 2025 at 02:47:21PM +0000, Mike Leach wrote:

[...]

> > I tested locally and did not see the GCC complaint for this approach.
> > And this is a global structure with about 16KiB (~4K items x
> 
> Which is precisely the issue - why use 16k bytes of space when a pair
> of indexed tables will use 21 x 32bit locations per table -> 168 bytes
> - 100x smaller!
> 
> This space matters little to high end server systems but is much more
> important in smaller embedded systems.

For the concern of performance and footprint, my approach can
avoid any conversion for standard registers, we end up need to
convert registers for non-standard registers anyway.

I understand your concern for using an array for conversion, this is
cost 16KiB memory but this can benefit a bit performance.  It is a
trade-off between memory and speed.  As said, we can use a static
function for register conversion, the side effect is this might cause
more time.

Given the CTI MMIO register access, I don't think an extra branch
instruction (checking the flag) would cause significant panelty,
given the flag is set once at init and never changed afterwards.

> Moreover the table + inline helper is more efficient at extracting the
> correct offset value. The helper is a simple de-reference - whereas
> the helper functions you suggest require the code to make the
> comparison at every register access.
> The "if qcom ..." may be contained in one place in the source code,
> but is called and executed for every access.
> 
> Why add inefficiencies, either in footprint or execution?

This is about how we design a driver that supports both a standard IP
and non-standard implementations.

Because the standard IP is well defined, its register layout should be
the default; it keeps the code simple and makes future CTI extensions
easier.  For non-standard IPs, we only apply the register translations
needed.

TBH, the optimization topic is a bit over design for me now.  The CTI
module is configured once and remains untouched until it is disabled,
so it is not a hot path.

Thanks,
Leo

