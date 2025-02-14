Return-Path: <linux-arm-msm+bounces-48074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A54A3687E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25BA518943E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A491FDE1A;
	Fri, 14 Feb 2025 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOmXrHzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1B1FDE12;
	Fri, 14 Feb 2025 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572713; cv=none; b=UkzW4iDVF10E9PHN13uvvqHZb3oYRbsRZfuSVhD524IMC0RCc7vQZwA4cuyEo7A/++h145lH//EVg8DHSWQgMpbTTghxzyRgHlw1f/1lVfa9Ta9JVOCDuREr4jtbZ4W4jjBKmLNui9CfAP6yBbJD0+hdh07zFbuRdPZudZi31lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572713; c=relaxed/simple;
	bh=jabKirllUxcwql5mR6xctWDxwPEvXktLTMG69gr5hJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBPd3JVG1Ou/gcrk7AbCL9BCg58fi8Z2cumMN+BjVBO7AzAiwzp6trXOTngHwvXxL5WOeCXFYcH2k9f3EKwgcUBgaTj6cb0NpgojeRkC23U3UvedVtmxC2v6W20Eoc2iEeTkwpaSgd/egy61oxq1a0N8u3radPmhu1WMExYBSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOmXrHzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAD0C4CEE9;
	Fri, 14 Feb 2025 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572713;
	bh=jabKirllUxcwql5mR6xctWDxwPEvXktLTMG69gr5hJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOmXrHzZaXXkXfSVouoMSU9Dfg0pH4OkmALQfloSpneEDDOxgglyaXb2k1YHGofX0
	 W6D5bW9ImnKDn93bO4qvNLmXTe4dQwFU7pAjUf5MTte1964TrcsMC4JOdIA3Z18Y1T
	 Zp5/402IBCVIa1wmOZgyiQM94Gk3/mEXGUUggCepAyIog7XCM2nV0vpl1o9m58qFI+
	 Igg870aUIiXlT5rJs2BdAEKU0RI43S25PYHG8ULoHOi1CasPRdIAGAOrhHNVj7jr4g
	 JFS8bdIEVrrXeHH9evHW+6RRSqfn4MCBF2fBihFAOcI/VmOcUrMaSv3anmTX2XX2Er
	 wnwni88zIjcMA==
From: Bjorn Andersson <andersson@kernel.org>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: uefisecapp: fix efivars registration race
Date: Fri, 14 Feb 2025 16:38:15 -0600
Message-ID: <173957268919.110887.5072726541164891700.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120151000.13870-1-johan+linaro@kernel.org>
References: <20250120151000.13870-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Jan 2025 16:10:00 +0100, Johan Hovold wrote:
> Since the conversion to using the TZ allocator, the efivars service is
> registered before the memory pool has been allocated, something which
> can lead to a NULL-pointer dereference in case of a racing EFI variable
> access.
> 
> Make sure that all resources have been set up before registering the
> efivars.
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: uefisecapp: fix efivars registration race
      commit: da8d493a80993972c427002684d0742560f3be4a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

