Return-Path: <linux-arm-msm+bounces-56124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49302AA0BA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5D1C3A98E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBF52C256E;
	Tue, 29 Apr 2025 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="S+eQ0Oz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2A524F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929718; cv=none; b=Hb1u/IDw6T+jy/sjFtbkN9HekAZPHPX7UTqQZzmQ+UG6DgyGX/CX4Ci1/qejz2SnXVohcS9LUQ299ribkByWm6dFLnOWG1e2TTHaivEgaK2x2/yMJoh/+v2TrS8cbNYcMLpV+KLO1dYQyrEMv9pIc1cLafJbn/wrmRul2kAUNZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929718; c=relaxed/simple;
	bh=mVM/Yh+EjMotQXljCw2AwGgMqCoQCKG3tGxcQcDUNhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cppY92nSSbsHzxe4tmppRWMXbRPy68/7qrw5bMTImEwYKtA3BbjLpoFo8h+9lCJvNXf9LIa8a7YO9CWDotDRERJgC7n22aJThqa63l2AEe7SZZ23ZksxVbWYeUxQtBWdMx6EXHKiVe0q//YsDDp5EJxNshgpjlsS5Vq4ObT5/+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=S+eQ0Oz1; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c54b651310so955527285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745929715; x=1746534515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=;
        b=S+eQ0Oz1BQ4QanqmHdJETb1S3D5nAxKv2XoomTzIpC5GGEqh3wiw95n43vVx++d2t1
         +he4NYO/M6bva5+J4msyPNbpIfO5391s9IOtG4jMMGC36YAQk+0J2Pf6psl5/pkyuuYF
         PFI3HIxDkDz0E7SufmGrL0feYHMJYHfXWZgOtXes2vCW+sHJzOYXp0Hq5a8hHFJJ5XMb
         OwBsHmdxqJrYQPFCwiF4gvPUYCuJRAcjQpE++V3lm6ViCRKWn+VRhxvBapyRYgjBbkcU
         8n9LqiI5yuDFhnUKXmacp8VsOtlRSDMVi5pCEPjfVSZkDcJlNxvqp5jnOdJKt5+zou8r
         0sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929715; x=1746534515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=;
        b=jm4EokHhwZL9SvxhhZLBSUGz8+srFz/P8lUJIiMJkJK4Uoyi7pAjZVd6CGaXEYcPez
         B/h7y2iJTjqSitG4phN6R2tJB1CmcHd+8flUOUN4vJy/MQI+4tcrDNSAFCUY1xZvim5Z
         xdV1G3h6ota9dOJ3yz0p3Lsyw5focimwBS5+fAD7nxtf+GfkLmLEJHMauTdSvEbzJEka
         euRK6Jtq+JHlpURveYHLcwKgZMugfVlDWMOsEQHNRXnOgnZQqOnrDKNJhDD1TVqBI0kx
         30kfi+dGCojfdQZbdO9E7JXnNYcjkgKV6zGTsmqHCGPMIZE7agC6/5WFRgD6myso71SQ
         POMA==
X-Forwarded-Encrypted: i=1; AJvYcCUt4Uy1QiQxG8QHkPerxRwJAMKjOBJQNk/juwzD3m828FxtmVkEszCK3uPKt2+Dw+4sDmXfyYWeIu3iLnSf@vger.kernel.org
X-Gm-Message-State: AOJu0YwTusR4B9URAs1BHjiVVp8hLLrrjTq/yqvHQzGKavRKgcHeprtl
	zPJmDrVb5aU+WL7fgk9EWME0Pq1/CLO32KnOxw+Pfm+t9J3Mnl+f8PMg/Aq0nRI=
X-Gm-Gg: ASbGncuJ9AqUN4Z7Q5Hslnv5T+BKbd0x6y+LRi3qT6vs6vzbfhFumm8rnsGq4twWolM
	mdg4jhDby4d1sgvvhg6CRWedQ5WsIH4kRzBWo7NZGVPclRnq237at0uwSnvcdhFZE0a7qq85yqD
	tRSlhI0dAfvvxgHBtE0Xy4eKrvrr4bhKtPCwmyaoH3HykXkKTuXoqm3IWWfvJZowDbzXRYrHa5l
	wx62br2zsPHdvsAYqiHfnmtJ0y/lFZ7+j7Z6O9/zpXG16sKPYMb48GXztQjYC+G8pf66NBsEf3L
	aNEHF+AzsdvzfkpwYZTrQkLS2u4JoVT2JS/3fIiSEWAuSik1Ak/FAWuoxK9QRnf4utoafPHSIIl
	OSvaOZbcGVqQ8+dFTiZY=
X-Google-Smtp-Source: AGHT+IFMhbf9NGzyK/N2zlhF/+Cuicwqh6Ml7VdJKCsWNEjD0dprXI5tx5siEqKxqV9DQ7d+ym50CQ==
X-Received: by 2002:a05:620a:1a12:b0:7c5:3e89:c6df with SMTP id af79cd13be357-7c9668496famr2024432685a.12.1745929715358;
        Tue, 29 Apr 2025 05:28:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbd048sm729195085a.43.2025.04.29.05.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:28:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u9k4g-0000000A4bg-179H;
	Tue, 29 Apr 2025 09:28:34 -0300
Date: Tue, 29 Apr 2025 09:28:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250429122834.GA2260621@ziepe.ca>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428205619.227835-4-robdclark@gmail.com>

On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping squence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.

I think if you want to do something like that using the iommu API the
expectation is for the caller to do a iova_to_phys to check what is
mapped first? That seems kind of lame..

Maybe page table driver should not not be doing these WARNs at all. If
we want to check for that the core iommu code should have the WARN_ON?

eg iommufd already has a WARN_ON around iommu_unmap failures so having
one in the ARM page table is a double WARN.

Don't really like using a quirk to change the API contract.

Jason

