Return-Path: <linux-arm-msm+bounces-27866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F32946FD2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 18:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246211F21247
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 16:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E5558BB;
	Sun,  4 Aug 2024 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dr4jxv8D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43232A953;
	Sun,  4 Aug 2024 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722789376; cv=none; b=R/rUQ9VAA2E4WeNlOXGtcFs/YGjKw+tdI5FpAAAUrK/tDsBuX17OiSw45NOjMT54WXv6Qbft0AictbbXp0xgKlrF3gEcuaPD4EdSNvPpkXvlWEpTJVPlmmBenrj6XSe3xFRYKdUXhI94Aq3dpYHRs7UBIpIyP7xFRvLy1R7jWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722789376; c=relaxed/simple;
	bh=fr/EQ9N9Nwyvf1xzY2thmnfz7MjDZQZepdI1/6C2z0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzErZEzmK4qCIZZ0xm2+GS+w2xhcgoeDEfkGGXL6VGOgVUpSuiZ+ESv9Rqrd+b5rrjeCGfvxoqlH9Gro+bvoSnOfrZq7QniIo7Rf9cZasSlfXsYA0ioFWFIIR35vd0U6GscpMKtkd+6sxHwHUuQkO8GYwXBaZneZbdjnTjMqtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dr4jxv8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54233C32786;
	Sun,  4 Aug 2024 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722789375;
	bh=fr/EQ9N9Nwyvf1xzY2thmnfz7MjDZQZepdI1/6C2z0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dr4jxv8Dl/KILm9hJhBkA7xWEyI5yNKmMgQI6gDhXFSecxDkL3iMqOfEIXqvKk69u
	 kBc4NfNIedd5mCIp6q8sz+P+KNC+jOGAZ0yZMrXsKoBJZjSmOopA0/VuBx0NkTx7UC
	 Bs6+kYI++x2K5mroIrIhV1bNrR/8q5BL4QPpQQM25VPTEoYjQl5lmwDPfho0XB38fp
	 WZRw3Ga+dcikCRvsHJam0mPRYtdmWb3Wm6O3u1aRKwmeu6+H39Bf6JqbMJgc8Xn6k0
	 O1euC8g+LbXufjaIfbABLXybiOJ/8ilzQygj0EgU0JeEdrAcktu4r1/k0wJ9tqY6bl
	 jlsFglFbvDTLA==
Date: Sun, 4 Aug 2024 22:06:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH v2] phy: qcom: qmp-pcie: Configure all tables on port B
 PHY
Message-ID: <Zq-t-1jfSg3RmLKW@matsya>
References: <20240801-phy-qcom-qmp-pcie-write-all-tbls-second-port-v2-1-6e53c701e87e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-phy-qcom-qmp-pcie-write-all-tbls-second-port-v2-1-6e53c701e87e@linaro.org>

On 01-08-24, 18:54, Abel Vesa wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Currently, only the RX and TX tables are written to the second PHY
> (port B) when the 4-lanes mode is configured, but according to Qualcomm
> internal documentation, the pcs, pcs_misc, serdes and ln_shrd tables need
> to be written as well.

Sorry this does not apply on phy/next please rebase and resend

-- 
~Vinod

