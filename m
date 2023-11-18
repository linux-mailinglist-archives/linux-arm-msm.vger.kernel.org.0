Return-Path: <linux-arm-msm+bounces-1024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E43AD7EFC86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 01:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F137281201
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 00:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC257F2;
	Sat, 18 Nov 2023 00:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1U5NexM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06101654;
	Sat, 18 Nov 2023 00:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F43C433C7;
	Sat, 18 Nov 2023 00:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700267199;
	bh=GSskpSkb+gqp7Ilh5CwUXkWbfmd9WvqPk0X0bLR5x60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p1U5NexMi9d6MmNo06+HGgtQWdWWQOYW3+//xMvP1lzjOS1GdyYhkRVH/MSbNcz9V
	 QtuJ2PXISDTfIxjBOlcwzYC5WOyWTR0qEH6Y1gem5Xi/lmkRjFo7pMqJ92RV8TO5Z1
	 Qzl3U9k2b/hvE1G5pNe8VzDTPy9CnIhECBwhx0M8pwxkTY76er2YBGWGAkyn6f/UDU
	 rSuJDtTjfagGUBeQcpyu8XypxSQGcZGSAOKqcQusTdjWwaOna6dOYVG2fZtS/i61R1
	 QC3zy2ETnJdpFAqVjgK5zpc+4weFZq7d2vlwQDKiWvrdNglCYGQC/sllPBIbwpF7RI
	 fiqsujy/KWNhA==
Date: Fri, 17 Nov 2023 16:26:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
Message-ID: <20231117162638.7cdb3e7d@kernel.org>
In-Reply-To: <20231117070602.GA10361@thinkpad>
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
	<20230607094922.43106896@kernel.org>
	<20230607171153.GA109456@thinkpad>
	<20230607104350.03a51711@kernel.org>
	<20230608123720.GC5672@thinkpad>
	<20231117070602.GA10361@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Nov 2023 12:36:02 +0530 Manivannan Sadhasivam wrote:
> Sorry to revive this old thread, this discussion seems to have fell through the
> cracks...

It did not fall thru the cracks, you got a nack. Here it is in a more
official form:

Nacked-by: Jakub Kicinski <kuba@kernel.org>

Please make sure you keep this tag and CC me if you ever post any form
of these patches again.

