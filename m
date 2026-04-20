Return-Path: <linux-arm-msm+bounces-103854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APrUMBuv5mnvzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:56:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A6434BF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F33D93004603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0365E39A072;
	Mon, 20 Apr 2026 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="m6OruEcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3C34DB56
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776725782; cv=none; b=BGX3B3Xrj2glS99nHu3HFNiUGF6mOKlqG/CICsw21D7iDmEmlRw1C3e4EMF4YdWFmOsgWrV5ED98VUrTgtaakUKP/G9wZwAZS84pN1oEGguOrDGwLp/y95XmOyili3V78H3H56ntlnunWEShMNYfNaw6qiDcgfIGY3IqcyPIbko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776725782; c=relaxed/simple;
	bh=HxETj+r6/c62h5v/ZQo9q8wwwtXio08jZSnj3FSr8os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9+iEyngu2ovbIqP1uno4ZgP+qLks5Yrqe0eUGejBYjhWb6WV0Ink4GatQims5BlKXxh9CRyHu5XtWxhgIj9QLdHX/Z4XS/w0uisZYEVL7R9blJFpmT4z7NxnCceTVEIn0gzl7/LznCeiD/JffrklbdlIZh+JUncyhK5UzHM8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=m6OruEcU; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4756e74f8edso2526729b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776725780; x=1777330580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxETj+r6/c62h5v/ZQo9q8wwwtXio08jZSnj3FSr8os=;
        b=m6OruEcUV+RxxHF5bmojsdSMXPifizCGbcAMnOS2vyEEt7WMtoiS56hMGC+2tTq5hI
         cWMSBHKYq9h6Wdcm3WdUvQRzfdpKFE642w0IgAOy6u1YQcc/VCFDcuDcxnPFeBTXAzKj
         atlGe+MmH87ibnTn3g2loYlYCq7dpEUxdFDMq3Vebt2uWaS5hLtTP3X9bQqFXSaEq2pf
         RRbZhC7fK9J+KaWi6z7LblGXj1DPAfKnp4dbRahnfSRuuNHggTmdhLd5X5+5HOBQ9J8T
         DRlo/GSJGKfqA8c1mRC0RfbUXTmRGsOD0YZjstgKZ3Mk915kiDhKi/QIo7sE4l8jZaUj
         y5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776725780; x=1777330580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxETj+r6/c62h5v/ZQo9q8wwwtXio08jZSnj3FSr8os=;
        b=XhH6rWSLPBAA6Sx1ZbmJkCosI9Xg0nXAQrNTWh/pvON6X8+nYWhBXof4XG57pbfISy
         ZdMKSwrLP1lIYPOT/sOKv/uhfuSjPCjQSKrURsspIzr8OOnJvKGtus8bLafccwHBbv+c
         HK6dCw10EZJQJdidoT9UPCFfAdYqvPS5qspq+YXzWdyNs5StHEBuVSeKCqSqoo/RAFQ9
         IX8NALx9fMp/CpI881UYbpcyWEFvvW070C4nKTZGqFir/E9JAQajXZWW0dpEn2mxVV7G
         YacmfZdTJbVwA0kfE1hNGUzE3SJ9i8ZFq/d8uWXAw22fzwkZlLpqLwotG0NTliS4k9OS
         R4KA==
X-Forwarded-Encrypted: i=1; AFNElJ/lS3sTz73wYTIK7D17u/sQ6sbAt4ns8QFk67Cp2Up2xfVINU5l1YZc/wosLqZ0RENRgb7UwTcM6z2+8Tyw@vger.kernel.org
X-Gm-Message-State: AOJu0YxGM+RvnGQjTHM5TBSh/s0PSXE6a4wSrUxKhZAtZlwo3vb33AX2
	w+/tg7CPeykP1yoZyZdp21QuaaAjpCluulw8BOWOlvzcnNg7grT+mhpRuZrNEe6JKhE=
X-Gm-Gg: AeBDietP5tlCNbvYbEsYsrK2c9DPLY2RCtuZz7jk44SDOjxJ8Pq1OPdkhipZkunHmOS
	SNEAAO+eQGC9FXQ36dhlXUv4UhgRdV6nI12Kufmh3tl5osRwP0Gf+t5Kn5Gei7wj6esa1iCTzEu
	vN0G2C5TRtG0+VttlEGmZXouVw1rm2aERlthpmbiYyMM3eqe4e+WWpNguYPDiRYZEmqHqxSrvZq
	/rWf/lTvTl59wLw0CpRMCVUsX3RpqXS9X4UK5TFPWfbgz7MOpPpd15s3X22nrQQ/GC5YuI47jQj
	vKuXlB37Wmy0sx8bOuEhiZaV8wfdFS0+92eWn5cHUeRQ5tYLTv9M5HeMV4jiDR4HEAoi8/c3oi5
	4Lrj9bin/x76Ihqh5tjUnz+gsM5qZdwdUlcgih+WecU/mbcTTs0x0OGJkTMUKtxnI7NIFZejzCM
	i/qG1hcHPN
X-Received: by 2002:a05:6808:448a:b0:479:d2d3:a399 with SMTP id 5614622812f47-479d2d3bdb0mr3331712b6e.15.1776725780355;
        Mon, 20 Apr 2026 15:56:20 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799fc19273sm7702863b6e.0.2026.04.20.15.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:56:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wExXO-0000000F7qQ-3pLG;
	Mon, 20 Apr 2026 19:56:18 -0300
Date: Mon, 20 Apr 2026 19:56:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ekansh.gupta@oss.qualcomm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] drivers: base: Add generic context device bus
Message-ID: <20260420225618.GP2577880@ziepe.ca>
References: <20260414-computebus-v1-0-4d904d40926a@oss.qualcomm.com>
 <20260414-computebus-v1-1-4d904d40926a@oss.qualcomm.com>
 <2026041418-volley-composer-6363@gregkh>
 <c4f21420-c299-f161-2bf7-c9b79ca15037@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f21420-c299-f161-2bf7-c9b79ca15037@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,oss.qualcomm.com,kernel.org,nvidia.com,gmail.com,ffwll.ch,8bytes.org,arm.com,arndb.de,quicinc.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-103854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6A6A6434BF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:04:26PM +0530, Vishnu Reddy wrote:
> Looks like the device have specific iommu configuration (via
> of_dma_configure()), then using the auxbus or faux bus types does not have
> the bus notifier calls to iommu_release_device(). Please correct me if I
> misunderstood?

I think the general feeling is the open coding of_dma_configure()
calls in host1x are not desirable, it should only ever be called from
bus code.

If you need to create struct device instances bound to the iommu
somehow this needs to be much robustly designed than wrappering the
host1x stuff in a new bus.

Jason

