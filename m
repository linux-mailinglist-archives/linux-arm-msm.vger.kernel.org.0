Return-Path: <linux-arm-msm+bounces-294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4437E6B6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34E43B20BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 13:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF78F1DFC9;
	Thu,  9 Nov 2023 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXnxVVo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C211DDF1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 13:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2A2C433C9;
	Thu,  9 Nov 2023 13:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699537630;
	bh=z4g5EW8efgIw8lyxSz+VhaqGLEYZgyBMh5nX9UJ9D5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXnxVVo/03JiIe4Zfd/7TtmO+I8DtX6A62j+QKv7PwuNrWyGtwxed35dvFnWVqg27
	 DdXznxNETaD8qgC+QMCrqjJVRPxnFyGbk1S2FIqMRs0v99vJd40qGC/sZfCAZhVxeD
	 ZjEWkcIvnxByh6K7pP7/Gh5b/9wdSrvFT40g8WXzd9wQM+5w2tpfA3rHC4FMUmjP1j
	 YLzXPHNNtSf91G49eeyWULb+X36EcDF/TLRbLOCpetzlngRCLYvs8V3bDKR+3WoK0K
	 A36t2kY2BJpAs9PSnLKAr1C6No3WlvMogIPRekMLsAoMPj77PxMZQtcUopVkM8JV0c
	 tUH/xoI3eM/YA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1r15O8-0006uh-24;
	Thu, 09 Nov 2023 14:48:04 +0100
Date: Thu, 9 Nov 2023 14:48:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix port sanity check
Message-ID: <ZUzjFFUc1dOE8C54@hovoldconsulting.com>
References: <20231109093100.19971-1-johan+linaro@kernel.org>
 <0edf26f9-46c8-4c9b-a68e-a92a78b5684e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0edf26f9-46c8-4c9b-a68e-a92a78b5684e@linaro.org>

On Thu, Nov 09, 2023 at 02:28:59PM +0100, Konrad Dybcio wrote:
> On 11/9/23 10:31, Johan Hovold wrote:
  
> > -	if (!altmode->ports[port].altmode) {
> > +	if (port >= ARRAY_SIZE(altmode->ports) || !altmode->ports[port].altmode) {

> I'd personally use PMIC_GLINK_MAX_PORTS directly but it's the same

That's what I'd generally do as well, but here I followed the style of
this driver (and using ARRAY_SIZE() is arguable more safe).

> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Thanks for reviewing.

Johan

