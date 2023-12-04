Return-Path: <linux-arm-msm+bounces-3327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 705538039D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16D11C20A19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889A92D631;
	Mon,  4 Dec 2023 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maFYKgAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6252022071;
	Mon,  4 Dec 2023 16:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703B3C433C8;
	Mon,  4 Dec 2023 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701706343;
	bh=MBDQUUo2JUiiYc8FoOPuMioHnUJ1IL95bAxMP6fsTc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=maFYKgAy9vXSF6Gy2o1GLDwcHNcLaKj1Jc9FvTqK2Mxc+/o0ynF09qajAtMn87IO2
	 y8e0jAZP9PNAPyOuEb6iYccjK9DF9BmVvucMIdTWHxWwaiDr6iEtWNLcTsvs5NOteG
	 omn6p9mW7JuH7d0XlpAaINdmmrgX63Vv7HnY8KrAVPhtW2aYkxvsw8qceRnFPZi+Oe
	 lM0dQ783jRTPCu6nevIiSFn8Pnb1vQyLlqPrUM0KHBEgS99admyMNrGsAfnBlvbo9F
	 AHelvpBw3OUD6fpdpDmCE1fe0R+0XmAm6AY7bsQ+k8rsDSfDiDG5ZPrllg4eOsrb7y
	 ZgZE8c/CMopGw==
Date: Mon, 4 Dec 2023 08:12:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
Message-ID: <20231204081222.31bb980a@kernel.org>
In-Reply-To: <CAA8EJpqGAK-7be1v8VktFRPpBHhUTwKJ=6JTTrFaWh341JAQEQ@mail.gmail.com>
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
	<20230607094922.43106896@kernel.org>
	<20230607171153.GA109456@thinkpad>
	<20230607104350.03a51711@kernel.org>
	<20230608123720.GC5672@thinkpad>
	<20231117070602.GA10361@thinkpad>
	<20231117162638.7cdb3e7d@kernel.org>
	<20231127060439.GA2505@thinkpad>
	<20231127084639.6be47207@kernel.org>
	<CAA8EJppL0YHHjHj=teCnAwPDkNhwR1EWYuLPnDue1QdfZ3RS_w@mail.gmail.com>
	<20231128125808.7a5f0028@kernel.org>
	<CAA8EJpqGAK-7be1v8VktFRPpBHhUTwKJ=6JTTrFaWh341JAQEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Dec 2023 14:12:12 +0200 Dmitry Baryshkov wrote:
> Ok, here you are talking about the control path. I can then assume
> that you consider it to be fine to use netdev for the EP data path, if
> the control path is kept separate and those two can not be mixed. Does
> that sound correct?

If datapath == traffic which is intended to leave the card via
the external port, then yes.

