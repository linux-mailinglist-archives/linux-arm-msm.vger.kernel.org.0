Return-Path: <linux-arm-msm+bounces-53000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334AA78975
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C6D03ADE58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1B0231A57;
	Wed,  2 Apr 2025 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7kY6LgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE37157A46;
	Wed,  2 Apr 2025 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581179; cv=none; b=mczsdYtv6VjqfIf+j1RRbfjKKe4oWIxSUpcEaeFMGw7c6Q6HPyWg4wGseC2HclZXa8mpzKW9vbOhjOO2GEvs4MKQW48tfTSE+N7APzkdIT+IIPDg41gYy1X0F6v8gvnwDxEMVxaS0HwNIKHpMaL1Jx0S2CUlhVkMJdFtjSK8TB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581179; c=relaxed/simple;
	bh=uqaygQYWMyl1GgGWbpwcRgh0QUOqEAEtiFX+k+YpePE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqvU7R03xSlk5ZPaajyOwBfnO/G/82CER1sVxeeIRSNQCqd3+Rgrhoans1Zp/OVfG43rS7KvInFhW/+rJOUApvdMZXoHjnQM4fvUlOrkAMP0l8mlmoSklBDjC7Yk9H7mBf/i/KqmPNRn4Cd+kILNUmQQnod/Aqwp3Q/Gwe6NwQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7kY6LgN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A9C4CEDD;
	Wed,  2 Apr 2025 08:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743581177;
	bh=uqaygQYWMyl1GgGWbpwcRgh0QUOqEAEtiFX+k+YpePE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7kY6LgNqhQ/GPFW5Ig8z231Z0qXef5qCiLbKCSYgqIs4modigxTR4EBTtWvMwj3y
	 IQDNU3yig4unUArgJs91X0CnhKhKBtQpuh3IcZ+RAVUbrp2ZT64+LytOlsitGSv35m
	 3AuetCj2WLzu5gwiD8kagaiEabGg8cL3rAJ8uDftQvAJzDyhCnpyFrxyDvhsdLVCOU
	 XGjNSNTdDpUeR8RIo9S+Z6MWr6PudSrbRgjswuWkn4V0gH6AeMgm3r1w+1tbfO3E8P
	 twjfHTHnR5eHJoUCyrLrzU6ZGQcsMgmMNLB4fPqbF5I6hJZnP4OS3t6lk8aswp/Opn
	 zvsiQDJhOHd8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzt78-000000002WK-00RC;
	Wed, 02 Apr 2025 10:06:22 +0200
Date: Wed, 2 Apr 2025 10:06:21 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <Z-zv_ehlKIPIiCNp@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-6-srinivas.kandagatla@linaro.org>

On Thu, Mar 27, 2025 at 10:06:32AM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
> 
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

Tested-by: Johan Hovold <johan+linaro@kernel.org>

