Return-Path: <linux-arm-msm+bounces-81350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5ECC51061
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999D93A317F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC6F2F0681;
	Wed, 12 Nov 2025 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhevclJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2291B2EF66E;
	Wed, 12 Nov 2025 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762933672; cv=none; b=oYARJ/saFnG2fAcAig+BotmHKjpnS18X5aKkTuhiLQ2WoTllgD749nqUCGjqPGND3cF3UeQ+XZKkZ8ghvU5LWssSwU/DoxNwo+sONOBALfqhNTXjm6+9BGjcDWBSPDjCJF0QmnWprNzLZPoWXDmOR8VD/LM/1CVgC6Cry18Jv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762933672; c=relaxed/simple;
	bh=mgG2cga3vOSOw5eVcByKf/McYLnyjoG+CFxD6KiL1t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDLBhvhulHXRIh333FO9oEgAfil/MIk1omhDL/Puf/7oDcpp0tGM+8r7KzWlZM+uIBFrcz+xcpQk60IAuuZnzPo3TpAg8O2ibxfPlXZSCMF1sxjvxRC0lyvR9RjWatVEWeAlk2gjzGtgSfkOYFSymJ+nhCefNBWMAWTtI/Ehm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhevclJV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BFFC116B1;
	Wed, 12 Nov 2025 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762933671;
	bh=mgG2cga3vOSOw5eVcByKf/McYLnyjoG+CFxD6KiL1t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nhevclJV590a7RcnoXuHHqzi/q/upHhaiKbpulS82dYcEl6z2cgVL1eLF/2UdyDkP
	 Bdf8B21c1Q/YgzpQlIKEP13ZoDR/vYeHNQyG8UnH+W8S1ePeelfXxEAWrz9Ll8UVEu
	 nkau1eBsQ5p0ub5IaC0B3RjR4Xk/N/y/1tmpqndv/8i0B93fOWBHnA5rH/p/CFHDOe
	 1B2K5vMY7et0+DQSmkEX6vY2hDrXO7dTTmNtgQIqT1+slnUVMP2aw6XBMlfPpWC38c
	 1KuoCnsDuORxs+3Uf6bhPMzyVmAZYbfVIgNnDUpIO2Bwg+s0FMKndwpYibYSkVu3X3
	 gsajP5+64AG1A==
Date: Wed, 12 Nov 2025 13:17:46 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] tee: qcom: initialize result before use in release worker
Message-ID: <aRQ7osB9rElutHuv@sumit-X1>
References: <20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com>
 <aRLcO7dveqChPNb0@sumit-X1>
 <2ec200e4-cf28-4881-837b-4455da047619@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ec200e4-cf28-4881-837b-4455da047619@oss.qualcomm.com>

On Wed, Nov 12, 2025 at 06:42:04AM +1100, Amirreza Zarrabi wrote:
> Hi Sumit,
> 
> On 11/11/2025 5:48 PM, Sumit Garg wrote:
> > On Mon, Nov 10, 2025 at 01:28:32PM -0800, Amirreza Zarrabi wrote:
> > 
> > For the subject prefix lets try to follow the directory structure:
> > 
> > tee: qcomtee: ...
> > 
> 
> I believe we previously agreed on using tee: qcom: based on the reviewer’s
> comments. Currently, there’s no commit message with qcomtee:.
> 
> https://lore.kernel.org/op-tee/4rbfpubsaxgv2buksonfigbdkw6geas6l7pycxuukdymqfohga@ohd4hqzvra3w/
> 

Yeah I agree I haven't been too picky about it earlier but lets follow a
common practice which other TEEs also uses based on directory structure like:

- tee: optee:
- tee: amdtee:
- tee: tstee:
- tee: qcomtee:

-Sumit

