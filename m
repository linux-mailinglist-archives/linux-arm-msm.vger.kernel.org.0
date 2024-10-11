Return-Path: <linux-arm-msm+bounces-34035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B77999D36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B91BB22994
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4A6209F35;
	Fri, 11 Oct 2024 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnxQB/Jq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B4209F2F;
	Fri, 11 Oct 2024 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629655; cv=none; b=EZztrpYRdiTdrMVoQPf+6442xlX4PNfez115hNgvAQJwN0VlHEpU++R9it2SphHmDho+fW+AOKAbM5xBP4eJNtrBo0WEZ4E1hH6w6pvMooyIezaGiykSvOvNsxzzU4Owod0NQqL+1dQBKIgsr+jVWF3kU6WOKv+w0Hw1zGFqWNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629655; c=relaxed/simple;
	bh=tP6XRrVFUY3D3iHVhKDKvI6f9k1MYiokv4nWapYBHBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXjYpZ8qQog6uhrQ6Lh/lmtxN/PEQrchKkLx1L02tIz0VFl1KCQiTJXJC+jD/CZDNI2aTjuOz14iINv2t1+BC6nVWKRVuzDbSx+Mj1NDq7iDjii5OXH8YGysCAs0qJAV5em/YJ6xZrRp9EbvksaDGMNLDKKCbjrx85iPlgv1QpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnxQB/Jq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D107C4CEC3;
	Fri, 11 Oct 2024 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728629655;
	bh=tP6XRrVFUY3D3iHVhKDKvI6f9k1MYiokv4nWapYBHBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnxQB/JqPwjkEDlC0h+FoFEOXay8hzJYe0gOq50Ge30FOSMul+DXeXERgvgSPBcec
	 yH5tF64RFS+p+SQ8c05JGGHIsxNS7lf8WPWwYeq2kmPBPNTxZtGYSL5AKUTzL+X9NT
	 a5LjrxEoGEMW1zV10z9i2jyACw/zlfVOiASFNM8fRP+GY/ami4pZ+Yz4f3Ic3es6uy
	 FLz1GHYmwkMRfELHOU9fsbSOjoibV8pY6E9C061xC2XAF7cQLt7XN4GXUzNHPRGpeB
	 GvyGahUmm08EKsU4P8AQ+p2nXlDWbwvwIbEf1U/6y4GTyUvu84TQD26OFhjz3znToa
	 LQaAhtEWaF6jA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sz9XY-000000002mG-44DH;
	Fri, 11 Oct 2024 08:54:21 +0200
Date: Fri, 11 Oct 2024 08:54:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 3/9] serial: qcom-geni: fix shutdown race
Message-ID: <ZwjLnIvKZny2joZ1@hovoldconsulting.com>
References: <20241009145110.16847-1-johan+linaro@kernel.org>
 <20241009145110.16847-4-johan+linaro@kernel.org>
 <CAD=FV=WdxCbQm36sq4RtPMGyi+ZefPYoOQortAN+SDYTAY_m9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WdxCbQm36sq4RtPMGyi+ZefPYoOQortAN+SDYTAY_m9g@mail.gmail.com>

On Thu, Oct 10, 2024 at 03:36:30PM -0700, Doug Anderson wrote:
> On Wed, Oct 9, 2024 at 7:51 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > A commit adding back the stopping of tx on port shutdown failed to add
> > back the locking which had also been removed by commit e83766334f96
> > ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> > shutdown").
> >
> > Holding the port lock is needed to serialise against the console code,
> > which may update the interrupt enable register and access the port
> > state.
> >
> > Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in progress at shutdown")
> > Fixes: 947cc4ecc06c ("serial: qcom-geni: fix soft lockup on sw flow control and suspend")
> > Cc: stable@vger.kernel.org      # 6.3
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Though this doesn't fix the preexisting bug I talked about [1] that
> we'll need to touch the same code to fix:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Yeah, let's address that separately. Thanks for reviewing!

Johan

> [1] https://lore.kernel.org/r/CAD=FV=UZtZ1-0SkN2sOMp6YdU02em_RnK85Heg5z0jkH4U30eQ@mail.gmail.com

