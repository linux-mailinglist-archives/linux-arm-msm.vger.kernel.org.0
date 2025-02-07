Return-Path: <linux-arm-msm+bounces-47168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82FA2CAAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 19:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC67167F21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8D3188596;
	Fri,  7 Feb 2025 18:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="dXPrzqj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18823C8D8;
	Fri,  7 Feb 2025 18:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951262; cv=none; b=S45i8mhk4F8F3KnBigogpLrmso2FhFZurNey+LZGzbB/Ps/fFqxVkTq6qX7OumVfFGgdW/flqOdoY0QWnqOxyrrn6OVQwr6L6aA+64GAWDHs8cE8i63nhuNVsS08gRCk7RZYvZhUcPLOL9bV4otc67RqL7IoHqqd56IU8PqEF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951262; c=relaxed/simple;
	bh=XVe2YdCRlLJADw3tp9Pe9D/PsFgUIabOOWwS99KZzBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y20xKbyV5ZhBJ8dprH4euIrFLGNAizzv5jD3gow0fmUGftWZQL3u3v93aBDAWrXqI4ZfNW86SQspg4W2dt7s/0cs2ZO1OpsnxfRp6B8i7Tg6sVqV1buK2JQC3yVCJ1fO7zAn6LyOeo3wRpjuFF6YeD6u+6wEG5rep/UMdhVLnII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=dXPrzqj+; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=LFjhYwqZspDo7xweE6XX+LKwYAcbn/jfNbT6P6FVPW8=; b=dXPrzqj+rgFVpP6r
	PivxLFufm3m2fT6MbN7FMd4hsDmmYRRuhSYj6sX3bwlgWRbQSZu804XdEimLJZQyt8NU/p1Lvj8yE
	nGvPl7rnzxYQSz/Z8wwk/VHMunmsA+CD/ofmUnfWu33nkQHPlMNv07QwFcOWdas28TumAR/uQpMvH
	LPaxvyYSKFKmgKwU6Kv/k6YBeqTRHToDQPXyZ4fONrSNmXSsrrEX14pILJSLh8sG7AVXj1+PfPKxH
	R2BzhB4Oe/boQam3oJ7zuuwVCnaTNMraI0c5bzlDB7DEnJu+j9rfLRpfQgkN1wwWUF6DRRs0/3Lc+
	nBA2bWCO1qIboqIKhQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tgSew-00EKE5-0F;
	Fri, 07 Feb 2025 18:00:58 +0000
Date: Fri, 7 Feb 2025 18:00:58 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <Z6ZKWltJcyf6euZy@gallifrey>
References: <20250127215859.261105-1-linux@treblig.org>
 <20250201160721.bgfyi3cwilvibl74@thinkpad>
 <Z55eWunU1NRkV2QP@gallifrey>
 <20250207174353.rxsxblcrnkieise3@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207174353.rxsxblcrnkieise3@thinkpad>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 18:00:47 up 275 days,  5:14,  1 user,  load average: 0.02, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org) wrote:
> On Sat, Feb 01, 2025 at 05:48:10PM +0000, Dr. David Alan Gilbert wrote:
> > * Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org) wrote:
> > > On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > 
> > > Subject prefix should be:
> > > 
> > > 'bus: mhi: host:"
> > 
> > Ah, do you need me to post a v2 for that?
> 
> No need. I will ammend it while applying.

Thanks!

Dave

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

