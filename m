Return-Path: <linux-arm-msm+bounces-33868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F353A99878C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F220B21053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B891C9B93;
	Thu, 10 Oct 2024 13:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPruOcVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A61C1ABE;
	Thu, 10 Oct 2024 13:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728566655; cv=none; b=Ic9uJj0vURnPmT7ZeUbHU0Boypa5oCoQmLsENWnCssuE0wdsyrr89FA3AcxaCfVnSTwdWqBoX4dRINmPVl90e6JUFk9v9X+PuhdEYtemOAujlyt5+5ioeZVLSqqypoMFcR36CGZhzDlcUGoLfDqOQ42BLDB4157H4jR37D9I//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728566655; c=relaxed/simple;
	bh=yP11aur8Rt+Rw0tYaqkcFxSY5kmdndx3o4KpjKCWejM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkhfVOZutHWTrY1Dip7MPz7OhzI/BQXWD0UKWzrFlFem1a0MN8xgtHRnecR+rE/zxZT8yiLJykWY9lQNvCFSgpn7bYARumrDd1OX1k54nKN9jyVWhGMZyJNGVvvwfHwn8r1rI+aymBelUyJKGAISYP64j+9iStjB/6+XzYaUkDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPruOcVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98CBC4CEC5;
	Thu, 10 Oct 2024 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728566654;
	bh=yP11aur8Rt+Rw0tYaqkcFxSY5kmdndx3o4KpjKCWejM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPruOcVf9a7yImnkIMPT5Qi2hcOUQZgNyvBh1PkUztPUB6D+bgsdPKFetO4b24n3/
	 2GBXgw5FqXTsxRZZDl4djnjRK/Hz75LV8u8TCJI+kbsMKXPjlV9X3/uBExi2RtlVtM
	 HfQyCPrnkgtROHFUgb/F4+QNv9rqlOPVis3SRokPq2diRhSc1ArlGek0Ek9+elIw5U
	 32X6QPgP/+R/1atQg0l1DHelVFZnYsD7OaGV0mvTjpOyPVzPQVzV4gwefrMEl8JJ3y
	 ycUvfRWeusiuUhZXDaynlDcUGsqrz9SN0YFpCMFYFUlO2BXwIjGcDIRl+ESTc6TvAn
	 537M2tGZe3A5w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syt9P-000000004nT-2lyW;
	Thu, 10 Oct 2024 15:24:19 +0200
Date: Thu, 10 Oct 2024 15:24:19 +0200
From: Johan Hovold <johan@kernel.org>
To: neil.armstrong@linaro.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <ZwfVg89DAIE74KGB@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
 <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>

On Thu, Oct 10, 2024 at 01:46:48PM +0200, neil.armstrong@linaro.org wrote:
> >> On Thu, 10 Oct 2024 at 13:11, Johan Hovold <johan@kernel.org> wrote:

> >>> As I tried to explain in the commit message, there is currently nothing
> >>> indicating that these issues are specific to x1e80100 (even if you may
> >>> not hit them in your setup depending on things like probe order).

> The in-kernel pd-mapper works fine on SM8550 and SM8650, please just revert
> the X1E8 patch as suggested by Dmitry.

Again, you may just be lucky, we have x1e users that also don't hit
these issues due to how things are timed during boot in their setups.

If there's some actual evidence that suggests that this is limited to
x1e, then that would of course be a different matter, but I'm not aware
of anything like that currently.

Johan

