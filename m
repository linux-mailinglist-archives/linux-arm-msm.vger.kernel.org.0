Return-Path: <linux-arm-msm+bounces-4242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD180D078
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167741F21857
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B0D4C3BA;
	Mon, 11 Dec 2023 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7+02ZjY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EB54C3B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 16:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED72C433C7;
	Mon, 11 Dec 2023 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702310697;
	bh=9rFmEbQU4MZkS3VQLzOd79r5Gp+jBwJMXH7fo8EetM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7+02ZjY/7X8I/+BgJsrca+AzH+JW3BiOsETthZ0M9Vy7eaTItqHsJcrgWBRn8soO
	 rVp5qql1We0uh/D8VVWFFRS1A6b6PaPBi15MPddWQ1fWyDverZdOnqYGkHxPleO/ux
	 qAN0BJpImE2sI5oftTYXEA69rUYE42RHMP4+UZZQgaXU3gEpsHBZJn4MShy7kKtW2o
	 N5f3ND/61rdANPxq3eJ+LIot31/hF39tWN3mq0G8LJ5xyxIi2Sy+U4uJnQnjv6DJwG
	 ByvveGsUNa8IwOtSpv5VaQZrBiFY2KTpj46N/GEiaTxwvKze2Ir+yNqgLtdyhy57Yf
	 EaAEbRKPq53fA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rCimu-0005sB-2h;
	Mon, 11 Dec 2023 17:05:44 +0100
Date: Mon, 11 Dec 2023 17:05:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink: disable UCSI on sc8280xp
Message-ID: <ZXczWLyZHhxnraZh@hovoldconsulting.com>
References: <20231208125730.10323-1-johan+linaro@kernel.org>
 <CAA8EJpp+wZbHwetDD5pDAXJJLVO+URoZJuW8OQavf5rSTPNWzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp+wZbHwetDD5pDAXJJLVO+URoZJuW8OQavf5rSTPNWzg@mail.gmail.com>

On Fri, Dec 08, 2023 at 06:34:00PM +0200, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 14:56, Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > Enabling UCSI on sc8280xp and the Lenovo ThinkPad X13s in particular
> > results in a number of errors and timeouts during boot:
> >
> > [    9.012421] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-95)
> > [   14.047379] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > [   14.050708] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > [   20.192382] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > [   20.192542] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> >
> > Disable UCSI on sc8280xp until this has been resolved.

> Johan, if you can capture message traces in
> pmic_glink_ucsi_locked_write() / pmic_glink_ucsi_read() /
> pmic_glink_ucsi_callback(), this would help me understand what is
> causing the issue.

I don't have time to dig into this at the moment, and its probably
easiest for everyone if you just try this on your own X13s.

Johan

