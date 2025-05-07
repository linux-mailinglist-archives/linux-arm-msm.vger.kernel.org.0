Return-Path: <linux-arm-msm+bounces-57167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F72AAE34E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F4318848CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AC5289809;
	Wed,  7 May 2025 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SxbO0evW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC3289377
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628843; cv=none; b=BNqi4mPgYt3ALOueomHp8PkglAX76NF2J7FJgrAVzqPGZcT7XXZNH2BNNcC6Rsg4NfDdYpFG67mzp4o9xhYaUXUhbP1A8a0ZmkNQCMIRRBoQsFfA97V8dxTYjuemXffkpTG/YN8BRtXhJQjZa4E7zrc9yIDFqTC3RV87PL68N+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628843; c=relaxed/simple;
	bh=cUb158x33akkosvBbXGRgoNYLmW5StrRgcPT7blbiXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4Mng3juHJuER+VNw5Hf/bQ/q7dg+0epmME67PXj6OIu10IkcaLcPzaqXHIP2ToLqxtvTw17VIyqbk71DvIQXNp75aTv1CuX2ZK76PglZoyusnyZ26qvQ35hsTD9yhMjLnK6LMJSW2/ZzI36QjKo1nI0PJeChqHz/7TLSsfoZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SxbO0evW; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c54f67db99so113387185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746628840; x=1747233640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=;
        b=SxbO0evW5Z0FwMJ9ZNJxYXb89n//48gvBEGuxfB54XEALJ7sVAH77gUs6I/QJrU2O3
         QB+TQ4TvTWxDPH7807sdv9yCzFTFbNRTjll5bb/rp/fRkIQbq5sP7/H2ycLRGSdCN0DV
         kwWwBYs2VdVQQRm2bws7YS8aiJl6MRYbSZtJFZPkE7Hb1fKfULXQWcnsbCDESfTwv8bq
         bBfBWbmNyq4hcJpeE1vm9XrAdUguO4fcv2s77Wz4Mz9y7VfhSLdXEoBC3/iN3reyYvMX
         gPxkrX9fKw0riCgckECCQkGfku+UbF4mVw2/sxYIAn2L5Q/02zBXE5vYtdFq7tM0wU0N
         lDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628840; x=1747233640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hE5pqIIiTRP3xPbQUA3RBdQkSkJonXNdeQ/5U/JPsWw=;
        b=LEx01DC1zT3e5T3fin9kFv0vKZ4CKPACrzhbhkFSl0fbnatB41Fp3+xErpMYqLsIf8
         YRptaqcS+E4vY4pLTIvBn2ofALpE3bggCGqEXf9qWx5Mp3mQ3ohLxZD3TAd0vKkhmGqm
         sUR2sbkABqK9+mILSoFqrtnCKQfGcmgfk+KuvJ3tioRF2KzTWQQW573W7eK6KmbYKl2p
         JX9DU6pi6AL7GSgmiBL8UQqAWUAkTTAH3TgoHY05fumKTYpLU5xZNY7UKgxdMGKCmzsg
         Cgg0hONxQsSp0+kGCi6GeKc8XgY74enLif2krRLoHh27cktAS+7lRzf4j/YUajcX8WGM
         NbnA==
X-Forwarded-Encrypted: i=1; AJvYcCUsrSpH7/zDAO2bCNBIX80QV2MANAG1zi/3fnDwXyPu90nkJ/55YMYp+Rs/OVQbuuRnymnSxwO7W+jolW17@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+30/nfaxgHpMDk29hvbyf5ieJjqSOfOOMaQj2GAhqnBdy3BI+
	v8EFse2u9KJ24pFnFda9TEQGBd2HylgxYEdqewejeK9TrZCxUE4npW188ouMLvY=
X-Gm-Gg: ASbGnctcVI3xo6/z8i5VpL364ZlUe+bY3sn2k1jLK8cgjDYmMtdZaMdvcveC4pJiGnh
	vwXN55sz97GOBjU0E0K5PiOQUf+XEHtFT94x/xRsEFMyCCCiSpwlgp2gyLZbWLQGUsiXN/LziqX
	9fTuk+gS/UGMyxrc9c4/5dAtVUNHE5D/prmFVvsGAyxLLdUsglnMGTDyt0W1S+B3F1CYTfJxm3P
	8thUSavtsOIheK2n+TxokuPMOh7ZlmQDvJ0Ij3ewXt29gzgWaAD2YPVfPDswZqt6coi+eT5ME/a
	XFKYnl+S/3prfhjdiW3W5HET5VZQ3xheQ9nq6afoNjgD23KLUnklz0qqCxjQikYt5WhtvuyUyuR
	wt/PdtDHl3eE5OMjpb1qY/sz6XgYPFw==
X-Google-Smtp-Source: AGHT+IFBJ2lDgmMwPn9NZnZ8/xbfRhIS1u/h+c1wZoIdheyW8lXaMbj8dqq9Df2szLQOMYCQifNTEg==
X-Received: by 2002:a05:620a:370d:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7caf6d53f0cmr559703785a.23.1746628839912;
        Wed, 07 May 2025 07:40:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf752a60fsm159257985a.42.2025.05.07.07.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:40:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCfws-000000011tV-36y7;
	Wed, 07 May 2025 11:40:38 -0300
Date: Wed, 7 May 2025 11:40:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Message-ID: <20250507144038.GC33739@ziepe.ca>
References: <20250507142953.269300-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507142953.269300-1-robdclark@gmail.com>

On Wed, May 07, 2025 at 07:29:51AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping sequence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.
> 
> Now that there is a quirk, we can also drop the selftest_running
> flag, and use the quirk instead for selftests.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Sending v2 stand-alone, since I'm not quite ready to send a new
> iteration of the full VM_BIND series.  And with selftest_running
> removed, I think this patch stands on it's own.  (And maybe there
> is still time to sneak this in for v6.16, removing an iommu dep
> for the VM_BIND series in v6.17?)

You should just remove the warn on completely, no other driver does this.

Jason

