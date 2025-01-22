Return-Path: <linux-arm-msm+bounces-45874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77EA19AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 23:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 365823AA34D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 22:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D131C760A;
	Wed, 22 Jan 2025 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ETF222R+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E7D1C5D5E;
	Wed, 22 Jan 2025 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584596; cv=none; b=TPJoSOwgL9ofNnRaPBOjs47/YQulAu28hvpoDMBeH8w/m56y76To7Y+vVfNbCrjt+WB3h33K+PTi8JYw3DjTQdK9sfsLvMvr3snRzbU8l1rGJLGVQvCS0p4HdkWa8/2nhlXPgaMaEgyIJvqK8ouoIN8Ryw/S2JmHB6A+bBri5tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584596; c=relaxed/simple;
	bh=SCS1mNCqtZoQ6NMPPF/BiXVQyiamgdh7VtWlNvTYK5g=;
	h=Subject:Date:From:To:CC:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG01b9IPzIperytAKK6XH22pqN1BZ8HGRbSD003X5ogi6ZhWN6QKJ/Y1JzhfmQtEBeR/vFHmibCHCVZrUIf8iGsBQrYIENI0vN4bcvj0YI/TYfsWsOghVjXRevZ6x6e87WMBxNTRjdYYrohSBIsS+FxYxDBV/15RljKM7CRg4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=ETF222R+; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1737584595; x=1769120595;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=k2PyUGZRVj9Wc94nV8/QttjMwv5rG5Z32qJhix/WhPE=;
  b=ETF222R+0NzKTJME6lI54KGUlFv4UAu/Flz75V4QLW3oHvyPJLMSdmEA
   MulDj6PqHpl4KyuE2No/NcNdgGKin0eCkYJF/G2Hkhqiy2wf3c4PrDUqS
   4A6nRgizbp5+/p2ZcCDMyaDJVP8b+aZ2AxL313o5kIHhIxqStU06fWIJT
   E=;
X-IronPort-AV: E=Sophos;i="6.13,226,1732579200"; 
   d="scan'208";a="460839371"
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 22:23:14 +0000
Received: from EX19MTAUEA002.ant.amazon.com [10.0.44.209:22014]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.10.122:2525] with esmtp (Farcaster)
 id 6bff06ea-1c19-45d4-8e41-626b3671df8a; Wed, 22 Jan 2025 22:23:13 +0000 (UTC)
X-Farcaster-Flow-ID: 6bff06ea-1c19-45d4-8e41-626b3671df8a
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 22:23:11 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Wed, 22 Jan 2025 22:23:03 +0000
Received: from email-imr-corp-prod-iad-1box-1a-9bbde7a3.us-east-1.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Wed, 22 Jan 2025 22:23:03 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com (dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com [172.23.179.86])
	by email-imr-corp-prod-iad-1box-1a-9bbde7a3.us-east-1.amazon.com (Postfix) with ESMTP id 9A3EF405C4;
	Wed, 22 Jan 2025 22:23:03 +0000 (UTC)
Received: by dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com (Postfix, from userid 14178300)
	id 5DB8310E4; Wed, 22 Jan 2025 22:23:03 +0000 (UTC)
Date: Wed, 22 Jan 2025 22:23:03 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Message-ID: <20250122222303.GA29229@amazon.com>
References: <20250122213427.28169-1-jorcrous@amazon.com>
 <fye2hzgb7pbd7mc7txdl6c57uohrs224ivicgwy3xxqzximard@gvwsey2yqgin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fye2hzgb7pbd7mc7txdl6c57uohrs224ivicgwy3xxqzximard@gvwsey2yqgin>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Thu, Jan 23, 2025 at 12:12:46AM +0200, Dmitry Baryshkov wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Wed, Jan 22, 2025 at 09:34:27PM +0000, Jordan Crouse wrote:
> > Update some RCGs on the sm8250 camera clock controller to use
> > clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> > to the XO during clock disable to prevent the clocks from locking up
> > when the GDSC is enabled. These mirror similar fixes for other controllers
> > such as commit 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops
> > instead of clk ones").
> 
> I'm not sure, how the mentioned commit is relevant to this fix.
> Did you mean e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for the SC7180")?

Oops, yep. Great catch. v2 coming.

Jordan

