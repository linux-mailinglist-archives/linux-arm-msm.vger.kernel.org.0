Return-Path: <linux-arm-msm+bounces-48328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C1A39569
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 09:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D25A816468A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F026222CBD0;
	Tue, 18 Feb 2025 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bh6WoHHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E77749A;
	Tue, 18 Feb 2025 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867187; cv=none; b=CwmBBD5+Zb2JDzBcSrgIQ50wgWgw9PBs7aQr+7YJhRmX/ZVWmvw+VblV6KC4SPT+Ws9GgvyDR1m/upOO5VTfQpgDTdmDZY7zl8O1y6pBEEOxWlXXOV9SospOQHvfKI6X48P//pw9l4bg9ECiZVfVuZ1OGop+oGsNFNbdCSGJbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867187; c=relaxed/simple;
	bh=vw8VUAUqd1LTDPrqZW2pq0bIjio3+TrURyjC/H9+pJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hN1aTPuj4qhOyYZ7S1UVaOQNW7cz/Pgw0P5vVaa6PzFrXKldqp4hZpyqzb/IJUpL/mj93UXnhBWlLozA+wuyiIlZpMaAwOtfPDiAMDnOektTvaQMHn4W6F1r/lRv8gtWS+DjtLb8LdDN3qioFgTj6fj72igcBxd6inHPfhA5apU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bh6WoHHs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vw8VUAUqd1LTDPrqZW2pq0bIjio3+TrURyjC/H9+pJ0=; b=bh6WoHHsvHllgvyNgEjPnv7jOv
	Gvnz4nl3mQlat0BS86DYJiXUPixN/nzmhnS2BJ+RYRMGqoKSqIi8RJS4czXq57hzIkP8JLe2S/lkl
	90Rd5Ofhm2BcgD+gyzquBhVYThB5CBZj8rwPzEsOFwayPj2uXfDzzbvfXSjqR5s5H0Sb3jgIJWxDn
	Kvz5CVSiWxOsYGr3+5Ds1pI0piIT+iv3wVbOKQ8WjG+RKoyG5G6YPLvAAHGEPKO8X8qnn9H9p4yTo
	9i3kN9rMAmSSAAlzOBAKpAUBHG1LXj8Mq7rKiwBkaP8ErPXJHZKR9q/TRN6qCrkUn8yTTN8H/e0/u
	qnq+GOvQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIvu-00000007Gow-2uJl;
	Tue, 18 Feb 2025 08:26:22 +0000
Date: Tue, 18 Feb 2025 00:26:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
	kees@kernel.org, linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [RFC][PATCH 07/10] printk: export symbols for buffer address and
 length functions
Message-ID: <Z7RELnyWRLietj9b@infradead.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <20250217101706.2104498-8-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217101706.2104498-8-eugen.hristev@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Feb 17, 2025 at 12:17:03PM +0200, Eugen Hristev wrote:
> log_buf_addr_get() and log_buf_len_get() can be reused in another module,
> export the symbols.

Err, no way.


