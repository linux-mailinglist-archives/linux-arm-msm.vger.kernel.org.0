Return-Path: <linux-arm-msm+bounces-33880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0149988C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BFC01C23D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9261CBEA0;
	Thu, 10 Oct 2024 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7N8NU3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4001CBE94;
	Thu, 10 Oct 2024 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569228; cv=none; b=UD6BknZbHNuxjTl3IX8xP19xbXkH72vj3rxQGNCjppaXMRn+3/ZEFEVE+w7KswTr+h/8Jxq6QzLnZcATEJxkMfHrhROnz9W6+BrT/4xByM/UrHTpBlB2bc6Dcw13KczM9g7rh32SGJeWevibFuNwbXsPqEAl/nbYnVsX2B+ud5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569228; c=relaxed/simple;
	bh=Xiy4rlBYHiuS5D/AgGyVGv2LBXW7robiL7MJBKxpEoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRle8Nx973NPq/kqPKVRWkqTNAhrRfZ9B0+pBymAxTjFCzDoIUytMZN2Fp4vnwuH937SXPeCoPlop3LqUkdkRotdLB1tQq/5Ss6x4X5aFeKwwS4HGw7YoN+CzKymBhqnbXRSrygL0gNdp4Mv4EeoHnK2862sn4IV6I59PzgZdAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7N8NU3N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36F3C4CECF;
	Thu, 10 Oct 2024 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728569227;
	bh=Xiy4rlBYHiuS5D/AgGyVGv2LBXW7robiL7MJBKxpEoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7N8NU3NhWGgE6NV9kmIBQk+4Et6zL3/JBuzXTYYlUFyWUI7fz0fMzQca1qAZCdlw
	 /vy29Hrf070DDzyJUn1ItOzP7yiTNqRToDnhPZ/R8tnRtRFY62j1O4+ry8PabAwfkD
	 6unRdFlN07A9xK/s7EmsBEZv9cJ/6Lx+gxazVHQZMui1btoQq1EiOyYikZ0IOALHPe
	 m3FF8amG2vMa8vglYYjykI376IO+EhaWw8s97QxiZHfoLGVfIbTJixUqZjY8wRcUkC
	 pMIJvTPLtdhMRyzTmZFN4A/W9/1qjgvDQ1c6JAdFoZJfk28FbktcjCX666gNkQm1cI
	 /x0lh6rJXi72g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sytop-000000005Tx-0TRD;
	Thu, 10 Oct 2024 16:07:07 +0200
Date: Thu, 10 Oct 2024 16:07:07 +0200
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
Message-ID: <Zwffi40TyaMZruHj@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
 <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
 <ZwfVg89DAIE74KGB@hovoldconsulting.com>
 <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jtxci47paynh3uuulwempryixgbdvcnx3fhtkru733s6rkip7l@jxoaaxdxvp3d>

On Thu, Oct 10, 2024 at 04:45:57PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 03:24:19PM GMT, Johan Hovold wrote:

> > Again, you may just be lucky, we have x1e users that also don't hit
> > these issues due to how things are timed during boot in their setups.
> > 
> > If there's some actual evidence that suggests that this is limited to
> > x1e, then that would of course be a different matter, but I'm not aware
> > of anything like that currently.
> 
> Is there an evidence that it is broken on other platforms? I have been
> daily driving the pd-mapper in my testing kernels for a long period of
> time.

Yes, Chris's analysis of the ECANCELED issue suggests that this is not
SoC specific.

Johan

