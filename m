Return-Path: <linux-arm-msm+bounces-58123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D3AB8E4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0719189EB27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB051258CDC;
	Thu, 15 May 2025 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8JVAlZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3045525C6EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331832; cv=none; b=DSYxE/IouRqwEbkbQVupaH5FOO9pOAYMNVxTkIOJgMisGR7B0svwVY07I2l/iOTsnFGumduSwtuFse03HHIQaIzCy3f/UbfGbYs2AVONVQH9zwheNyGj2rRCxqUbjdAfo+v/NbgUmbHmYi+h5EJ8zsbgDLrrtvEPxaagPNFR+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331832; c=relaxed/simple;
	bh=9BcbDc+wMcjBAP8s9znmdve14URMaxqqhbuS6bJ9rzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CE0Lmq6zwGqa/QkyW1LYVFlHLi8fUs1SanuiIn0c1imyVAka3upUiTij33fpX31BpbMEH8UMzznWxug6E8eSphA+JNt9G51tRP6IAmgsoSmGNVKsSjQZqdTHZSByYmM06QIpWwmXMC8XX5Vjh5ZZM1YWc8/xU5jj1wPfx54wNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8JVAlZW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231d4679580so1193325ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747331830; x=1747936630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPjC+F7Z8nPKiSwHWeFJrWQCprMTfRI349pBIPdGTYU=;
        b=w8JVAlZWn+GI5KIssYxEaRJirnUDINL0vltTUDhgsNWpxQhdFL4xtOD1yw26upDER2
         d14yJ3WPgBr0CbtEVHi6zX3uN64DygU35BOBbf7Kp/sGfGlRqE+LBRoTUsFgjwDT2Up5
         gAkZVCOAjtcEnTpOMFjRVt+OFdkfc/3LFC4f+/nfxaiQOxUZcg6cgf/knc0z+y8bnNFw
         SwWq6z2pNiCW+qFEFJqNHaB1M7GYTQFLJP0v9L6uzQ1sNn0aizvIqBGTFO4JO63Z7Ihz
         zIM7BpjV1Ngz1nrWs22NPapY1Z3UOZpPBBJ0uuYKot0yQ7rj4a+TfjTalvh5+/BF8k33
         aQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331830; x=1747936630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPjC+F7Z8nPKiSwHWeFJrWQCprMTfRI349pBIPdGTYU=;
        b=cDOQoCuBP9ve5KWwBNrFtINxTSuxwvGO9ywhm3XO36YXWu/utpMiCqVdV6+Wvg/Ep4
         3aeZ/UIf63fO/mqoe+ZiFS9KdAHVvyms0hNBx5p9LJ/P8juUHg8q5Fg5/ji9nau1yZWn
         7PRRXn4T00aljvDz4ohniuzLgOJH/BTC7/btgBpcv1hBJfmtfToujKBNugd9DjuGf8TM
         r3ByK/v0t5j1oglAHwHF2hXd4ZMHIByirB/b2KwokheiIs8qs3SDir3iIwWfpONz2yIF
         heQ2MydxuTbWcQ8346b7bn2En7C6XWSrp5sySo2tya14ycv9rdO8lGBexhIt/6LxheW7
         WfsA==
X-Forwarded-Encrypted: i=1; AJvYcCW/CnzHKOQhOkBGllqFwtYEe9XZy1PSDruJfv8cL8A6wbTBcFLDWKoGX5y9Sxr0kYprbLi7izoO8tr6gcIH@vger.kernel.org
X-Gm-Message-State: AOJu0YzXBsAT6uKklWqqwodl7pGkQykJ7lLb5JJzP1ZRqh6gZeoTbn/w
	/QYNOe3OMucEkUmRAbQpl/t/X3RxJP6uwkRhNyxUpkxtZhR8j4NBs6uGdFye7gnvW0U=
X-Gm-Gg: ASbGnctZHu9v5C6M/a+JGbHmtGJz54F4rl8XouWaeA/5NpNvVxbOJ99TiM/rHctCm1B
	h3IZJ+RNpzteiSayMtzU4njP51skW5GNAyb/M/kZvVwSnQlYX6SJkbf/nnQ+WDhu/RlmsVSmylq
	ddpVl7vIQJZQKfWj2lh9h/m92ltGr7x66t5nGS2892UUl29aRd5toQsnvW9hC7niDk9hpNqb8QN
	4V62wM2jUobAf1y+4xji9ax0ZJdR87seQ2dmVclkl42uGmW6lwFBT2yflR+PPQe6lLcvwEdDOMU
	oChrQnkruVgWddwCOyL0dU5dARVZO34N0U4rAka8rv+dTjJ/7QquOgo=
X-Google-Smtp-Source: AGHT+IF2ygCYFiNlQZ0QPfX5LxxiHLtfqUThk5JO/nc004InEVJCxglEaTN98IxZFKcVTGHlL7qmHw==
X-Received: by 2002:a17:903:1ace:b0:231:b405:c4cc with SMTP id d9443c01a7336-231d45a9b21mr5158125ad.41.1747331830399;
        Thu, 15 May 2025 10:57:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1d7a:b4f2:fe56:fa4e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edb063sm577495ad.255.2025.05.15.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 10:57:09 -0700 (PDT)
Date: Thu, 15 May 2025 11:57:07 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "remoteproc: core: Clear table_sz when
 rproc_shutdown"
Message-ID: <aCYq8xAC7NAKhffK@p14s>
References: <20250513-revert-rproc-table-sz-v1-1-a8c6b5d6f8a7@kernel.org>
 <e178418b-4ca3-4b43-82ce-32622ff19477@ti.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e178418b-4ca3-4b43-82ce-32622ff19477@ti.com>

On Thu, May 15, 2025 at 12:21:14PM -0500, Andrew Davis wrote:
> On 5/13/25 10:52 AM, Bjorn Andersson wrote:
> > Clearing the table_sz on cleanup seemed reasonable, but further
> > discussions concluded that this merely working around the issue
> > and that the fix is incomplete.
> > 
> > As such, revert commit efdde3d73ab2 ("remoteproc: core: Clear table_sz
> > when rproc_shutdown") to avoid carrying a partial fix.
> > 
> 
> Setting table_sz to 0 still seems like a good idea from a defensive
> programming perspective. Both table_ptr and table_sz should be set
> and cleared together in all spots.
> 
> In addition to this, another fix would be to also update
> both table_ptr and table_sz to 0 when loading firmware without
> a resource table. Both should be done, no need to revert this.
>

As mentioned by Bjorn, this is a partial fix.  I'm all good with setting
table_sz to 0, but as long as the real solution to the problem is part of the
same work.  Once the patch is reverted, which I'm about to apply, work can
continue.

> Andrew
> 
> > Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 48d146e1fa560397c11eeb8f824ae0fb844a022b..81b2ccf988e852ac79cee375c7e3f118c2a4b41a 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2025,7 +2025,6 @@ int rproc_shutdown(struct rproc *rproc)
> >   	kfree(rproc->cached_table);
> >   	rproc->cached_table = NULL;
> >   	rproc->table_ptr = NULL;
> > -	rproc->table_sz = 0;
> >   out:
> >   	mutex_unlock(&rproc->lock);
> >   	return ret;
> > 
> > ---
> > base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> > change-id: 20250513-revert-rproc-table-sz-53ecf24726ae
> > 
> > Best regards,

