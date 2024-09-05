Return-Path: <linux-arm-msm+bounces-30860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7796D1C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 10:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1A21C2305B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 08:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7A3198856;
	Thu,  5 Sep 2024 08:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYz/qJMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EC198850;
	Thu,  5 Sep 2024 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524088; cv=none; b=jk2sZ9/M9750X0osrrBziSJWW0EH4k7JwX96qGOnbV3rIwCEf1wujZhD0dXqkntcRO9Ju/ZnFN2ZYKpBHOH5U1mgfOwBG6UJfvDkr7bIM1joKQX1/2gYc9DX/CE1DFFmDGwRBgSvCi562ohdCTBMsZ1qjT7ydUG73h7bC9PEP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524088; c=relaxed/simple;
	bh=kMuYCcP3OOiJ6HKzA2P8+5KuVjaUaOZuWeRck+McuWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M92Xaba2DetjHcyecvDioQ5ryz3pj5Y4JdoJiYZ11tTZ1jj8uVe7YP3mOyh803H7XuY7BSuC3ukcI/SA+4iEUf83yNudnexqpeVIZi8Ffe0iHKLRZkijcN/8M3yFCvpIp0wYomIxGX3SNxBodtkVy0Wwq4N42Si9T+3vPKHiu7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYz/qJMk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96921C4CEC3;
	Thu,  5 Sep 2024 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725524087;
	bh=kMuYCcP3OOiJ6HKzA2P8+5KuVjaUaOZuWeRck+McuWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYz/qJMk2yaz7M+8IjykmEa2/8svN2quM2DXi+T3vl3/NQAgGOnVufXsZysqMUuD2
	 iQRsHiXox3KaewwOeedFD0BGFvUwzJOneWmF+FEPyXkWU2aCv6cHpJyGWd/16praPs
	 tNDRUVeT+DnnNEo+PklLDoP0QE6in99U9ZTj8+Yu74W06OmK8RNJtW3Z1q2ZSRVJHL
	 UJyFQ4D40mcIMROWQ9TZwV30k/tgZqFdJhsIbOMgqZnQyQJPNDCzcug7i4vKMR1VoW
	 8dR+xOgSiIqNxRXJT3XH9l1o1ssbqIhp4G52zE87zwRkCNxVErHjb25+oOKX3BZ8lO
	 I26W6MtaGJipQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sm7dx-000000002Ot-0Cmx;
	Thu, 05 Sep 2024 10:15:05 +0200
Date: Thu, 5 Sep 2024 10:15:05 +0200
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] serial: qcom-geni: fix console corruption
Message-ID: <Ztloibde6shReQP1@hovoldconsulting.com>
References: <20240902152451.862-1-johan+linaro@kernel.org>
 <c47714f0-045d-469a-9edf-e4e4cb5090dc@notapiano>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c47714f0-045d-469a-9edf-e4e4cb5090dc@notapiano>

On Wed, Sep 04, 2024 at 02:08:54PM -0400, Nícolas F. R. A. Prado wrote:
> On Mon, Sep 02, 2024 at 05:24:43PM +0200, Johan Hovold wrote:
> > This series is a follow-on series to the lockup fixes [1] that addresses
> > a number of issues in the Qualcomm GENI console code, including corrupt
> > console output during boot, which is a problem for automated CI testing.

> This series fixes the serial issues we're seeing on the sc7180 based
> (sc7180-trogdor-lazor-limozeen and sc7180-trogdor-kingoftown) boards that we
> have hooked up to KernelCI. Out of a 10-job batch of boot tests all succeeded
> after the patch, whereas before most failed (7/10), due to a missing message in
> the serial.
> 
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks for testing!

Johan

