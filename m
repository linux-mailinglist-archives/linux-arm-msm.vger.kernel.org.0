Return-Path: <linux-arm-msm+bounces-62487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E85AE86B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B414179005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8802690E7;
	Wed, 25 Jun 2025 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCxhnIJo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D282690C0;
	Wed, 25 Jun 2025 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862340; cv=none; b=ZLVE5nSozYW55IqnVUNtItwwer2HyKycpFTA+ndHTphIUfpXEuoMP3VmkpOkp0BJFFPNzujwuVHSaof/GH5DDHxlfQnrhR+uDe1MXQ0XyE/4YxrBJKHZ3kj3o3gYhzVOfAl1YfYXWwMa8s6y86PI5cC305ow3nMMNmVH9BDyqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862340; c=relaxed/simple;
	bh=bfUVcmNNQwtwLV/135zMfp6Z0vfH5DYDCkLmywa/sdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4dJWWr8r6qmBT3PoRMZ3+3Ss+k6felhFy3D9M15rDwxrjSTXoGPrvvx94uZvCG+RHkYQ/sucOtunzoXKL9p1oSRU9y0bYNspKogaiEGcFG/Y57FB0h3LdHW4oeaDRSoiyv3jr2iKMfijDb+VAhvGTDXeOYQ9akrFOV7wUpmAoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCxhnIJo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA4FC4CEEA;
	Wed, 25 Jun 2025 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862340;
	bh=bfUVcmNNQwtwLV/135zMfp6Z0vfH5DYDCkLmywa/sdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCxhnIJoxb2x05j5HO/MDrmygO3I70tOQ9dVcYudzHzpJIO2eX92qHUVgkh3ZoNs5
	 BoNX589Dmz2/bTjmM8ujtCE6GMVtgVtBq9VlmrS+5BAxMeByZv9ngMaCXKgWW9xsdP
	 xXH5wOIL1YT7tFGw/pmallFdcctNtfAseavp4fPktc4heD9ltM8j0IRJa9ITBk/1Ae
	 mL4TsnQb81QawBj0M4eamv2LSWBjmwNLempUF/mgAth6ZvvH13W4YwuE4R9c3CuczC
	 RiL5iM3Koyui2IoZuGNeGgwrd6s026o+jDPKCI17MwvbesgViwU/Ry0UoamOAQbxIW
	 O+o6i5OsoFeVw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uURHA-000000000be-0JKe;
	Wed, 25 Jun 2025 16:39:00 +0200
Date: Wed, 25 Jun 2025 16:39:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/4] firmware: qcom: scm: initialize tzmem before marking
 SCM as available
Message-ID: <aFwKBGuvcvUza0Xi@hovoldconsulting.com>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>

On Wed, Jun 25, 2025 at 10:14:50AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
> it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
> can move the TZMem initialization before the assignment of the __scm
> pointer in the SCM driver (which marks SCM as ready to users) thus
> fixing the potential race between consumer calls and the memory pool
> initialization.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Good to see this being worked on.

Perhaps you can add:

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/all/20250120151000.13870-1-johan+linaro@kernel.org/

Johan

