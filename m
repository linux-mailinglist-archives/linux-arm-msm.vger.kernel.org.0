Return-Path: <linux-arm-msm+bounces-31506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454C975144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91881F28889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36643186617;
	Wed, 11 Sep 2024 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMzzZvuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A9183CB1;
	Wed, 11 Sep 2024 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055829; cv=none; b=tZVRFyNJnl7tfJDhdojE+xFfREncYMexhrdvAnQ2NneARd0gbya5QRWcZnmQ83rLeCjuICInwoEXAE3/JgE4SvHzN4FeNZq1A6JUz09UbYBbbRqK+wDvzrE/Xo18wR5gZ58RGdC8Oxnf7+za4uApwzFMvTLps37knq7cVgak8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055829; c=relaxed/simple;
	bh=XGH4fqWa/9fWdPNDRDACY+LXke8v6guB2qi3oabmQF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzOhAyx+bD+Ex6FiDXxzyIHVXOSH7j8/joQt3ebTPG7pbK7jwji2yPXyhnCS1bvLHQo1Kbc/xf5HdjQIsUd+xTXJY8jVmle4g9B7lBxvXa4QwykDodBLw90oIasYxdfT5/pzULxixZSXPpJw+T7nY3dbVzAucz4jy5GmzlWAzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMzzZvuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C4FC4CEC5;
	Wed, 11 Sep 2024 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055828;
	bh=XGH4fqWa/9fWdPNDRDACY+LXke8v6guB2qi3oabmQF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMzzZvuXiwrJkp4QF0vVgrilLLXBTS92zyBUiZqrEwTtuCn4oOOEvJqmlvSJt5x3e
	 WUJR3hU9WWoiiD4BmDOBM52axdUjkWVLy0Wdu41UG3Cwl5dQekHCaBa/6H0OBrYlrt
	 9Hu3TXHP+OgVOLJ58X2eG+CNeSLzCVi1Qm49Rka1N/vD2HnSsRMnJoyJckMxrUdJza
	 2ipRDR7Sd/91FNKmTQ3b2MysLmiURnScL6R0GtOKaElBrQvWjUkURP5QVllruE4CzK
	 89UzLLXbiu0/NLnq2VW4E9OZtjBfna72VcOhUZTQM7yKmi7EfWJ5NPG4NCklg71P9+
	 QX3t10OYEugIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1soLyR-000000002zM-16i7;
	Wed, 11 Sep 2024 13:57:27 +0200
Date: Wed, 11 Sep 2024 13:57:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qcom: qmp-usb: move driver data initialisation
 earlier
Message-ID: <ZuGFpx3VZOGP-6Ii@hovoldconsulting.com>
References: <20240911115253.10920-1-johan+linaro@kernel.org>
 <20240911115253.10920-5-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911115253.10920-5-johan+linaro@kernel.org>

On Wed, Sep 11, 2024 at 01:52:53PM +0200, Johan Hovold wrote:
> Commit 44aff8e31080 ("phy: qcom-qmp-combo: clean up probe
> initialisation") removed most users of the platform device driver data,
> but mistakenly also removed the initialisation despite the data still
> being used in the runtime PM callbacks.

Perhaps the copy/paste error in Subject can be fixed when applying. The
summary was supposed to say:

	phy: qcom: qmp-combo: move driver data initialisation earlier

and nothing else.

Johan

