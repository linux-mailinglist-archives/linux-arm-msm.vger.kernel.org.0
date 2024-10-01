Return-Path: <linux-arm-msm+bounces-32852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C98498B72A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB899B235E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AF819C56E;
	Tue,  1 Oct 2024 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g5SB8AL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8E419ADB6;
	Tue,  1 Oct 2024 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771880; cv=none; b=mBBgbdwtXscvsQ0CvhUpQCfP+HaYms46NqEiHE/amHtgI2VDJiN+FPu3f+Sr9jZlusag9nO1ejsMMdtAQ9g7qEHDo+hhF3iSwoMuw/t3kpwWxoEWEGrtq0XRRFZ61OndxOPfg7/nRrNIsu+n4nRs9JS4e0TrpfajaR4NNo5lMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771880; c=relaxed/simple;
	bh=kG+EL0rn+XcyRx2CbdffaboTJsLP+hsn1SasbxStq3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFLFksSI+NlKk637x+xbfzfajshwGLOE4dQVE+BdP1Z9bhedOEH7S3jEgo55OYt7gvYl6gulPhawacJkD2AmEiq2TgnsTi5AEaVKjw9KFzkRIuDYLfpyARvxzcSOgiAYPsacOUDjKzIgTuwAyubxc6yXhNU9EC8tac85+OzpmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g5SB8AL+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qXoOcYfzZE6E6pgaLVSBFi51h/CsL3grM8P/EAXiFLw=; b=g5SB8AL+kYZylbyKBCQIZhHkFF
	VMAUyHANorRK7W5JUUhuXxQIhlJ93M7+FfLAs0MHwW3tElzaqWCoiYRuon+z1XJYoEVIWvImfVuOL
	uvCceEAqQB820eH8cfbh8udPHdLfA/4jFisbhZjnsVtWbvDhX3/tliZ1S6bkELOi44wRkdgBjM+tq
	ZtrUxuAEOR5B3V63qg8zUTnItzRXLZTMzArHFaQNBoxSj9pm1kEmspy1TGT8yNp7yAEDtPMAYUShR
	bBVVEvnCkbis0P4SGiqp6TCnupAgSSWqpCNPXJOCnWOkIL8DTmcyozQoXAqJxFSWz7b3Ek4XUSpVv
	/tXAAW8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1svYOG-000000024pT-2OIF;
	Tue, 01 Oct 2024 08:37:52 +0000
Date: Tue, 1 Oct 2024 01:37:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
	snitzer@kernel.org, mpatocka@redhat.com, adrian.hunter@intel.com,
	quic_asutoshd@quicinc.com, ritesh.list@gmail.com,
	ulf.hansson@linaro.org, andersson@kernel.org,
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Message-ID: <Zvu04AYu0zUEvjBs@infradead.org>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com>
 <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org>
 <20240924220434.GB1585@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924220434.GB1585@sol.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 24, 2024 at 03:04:34PM -0700, Eric Biggers wrote:
> What about a block device ioctl, as was previously proposed
> (https://lore.kernel.org/linux-block/1658316391-13472-1-git-send-email-israelr@nvidia.com/T/#u)?

No.  This is a file system layer policy and needs to sit entirely above
the block layer instead of breaking abstraction boundaries.


