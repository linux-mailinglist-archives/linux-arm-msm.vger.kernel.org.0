Return-Path: <linux-arm-msm+bounces-33884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81916998967
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330381F25CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56F01E132F;
	Thu, 10 Oct 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNECdP7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0D1A2643;
	Thu, 10 Oct 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570035; cv=none; b=pahE6ObjoPpb4Uy+WPvsni8f0I17mqlCtsea41n1Wv0xZ9p55Rb0/jrsB1MteX/EfYTYnUx4dnV6qFgpgJqgMMLv0gVgBPl5kOudEMevlMLzjTsyLlEiOuSa0qT1bmEzz3KhWtKflaTR9knfTBvPvzsZTxspS6rpRZgHsZZ54No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570035; c=relaxed/simple;
	bh=IvfXKC1ll/kv00u18cZmSVby/wOPPigQ1SMJthqTGQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebJy9UZzBqmxUOUMyseGFHxNFAA6OIvab/f3XoTlHgNck/HYh3z1VinPzmEWY+DDRiFO+amGx/C/HwkE3IdCShlpp9RAfULr12nHJbt4FdJjXIhNcimXxjGy8mHSOxq3UGLq1UXUBWKDhfms/QTUPkjoTW7t7I9oDWLoalBck/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNECdP7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510FCC4CECC;
	Thu, 10 Oct 2024 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728570035;
	bh=IvfXKC1ll/kv00u18cZmSVby/wOPPigQ1SMJthqTGQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNECdP7RZdL9/c5GcOA5f0Dtc72MJKTYvEopK6kwW7nxVoVxhnpMfWCgiMBjWB03Y
	 McRcdv2s1rCX42XyyZrz1BRT8uaX712yD5GiLUdJYprBBMCqItgzsa1nY8Fi0GUhE6
	 +aUAx40Lax332DDnJMmZvVgekcBLQQVybT8ENwNEcqrC4rogDTTXDPF3yWVjBKL2Ky
	 4MIe3Hm/VookR7azSbGL7cyPeWUHhgomwgcAymNA69g5/9qYPVc9gcG8r1KeaLmaRY
	 zMRoqZmdKZISj+aOkq3JU0I5Mmzpk5XIg35XhuZwjMH1y4GRnTNCOAY7pvR+twPAfE
	 fWco2at2iUQ7Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syu1w-000000005jD-1LnG;
	Thu, 10 Oct 2024 16:20:40 +0200
Date: Thu, 10 Oct 2024 16:20:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <ZwfiuJW1gkYPFic1@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
 <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com>
 <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
 <Zwffi40TyaMZruHj@hovoldconsulting.com>
 <CAA8EJppWgcyzS14rY2TfX2UNR1iqKBo1=qxHAbwkbeXLrZ2MPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppWgcyzS14rY2TfX2UNR1iqKBo1=qxHAbwkbeXLrZ2MPw@mail.gmail.com>

On Thu, Oct 10, 2024 at 05:13:44PM +0300, Dmitry Baryshkov wrote:
> On Thu, 10 Oct 2024 at 17:07, Johan Hovold <johan@kernel.org> wrote:

> > Yes, Chris's analysis of the ECANCELED issue suggests that this is not
> > SoC specific.
> 
> "When the firmware implements the glink channel this way...", etc.
> Yes, it doesn't sound like being SoC-specific, but we don't know which
> SoC use this implementation.

So let's err on the safe side until we have more information and avoid
having distros drop the user-space daemon until these known bugs exposed
by the in-kernel pd-mapper have been fixed.

Johan

