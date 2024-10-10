Return-Path: <linux-arm-msm+bounces-33828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF099823E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A6FA1F217C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35491A08BC;
	Thu, 10 Oct 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHkqxmCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B550C191F62;
	Thu, 10 Oct 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552679; cv=none; b=C54wZaKd6W+zajYGJURr6ySG2q5RGAUVKhiZlK6eo7ygZtsCj/VpPcPxkGmXqsH94KL4XsPXp85vpGtL7zpwH1pij99sYXiPjPuVN6Gp09L7OJuKxxWvtOS9npo8Wjfj0O9TfYm9Vm3bfWmUFU+RuF01Ry5OSHw+FvaO7DR3t0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552679; c=relaxed/simple;
	bh=hFyXa07iWorjQWvMdN50JPjDPyCLhfAo3h7fIlqw8LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbgELHC/4LieAbIZyBDBOSqldFxCaa1ytkyndppqtJw5fIjc6u938qy6fV6S/lcJuWH6S5KRhu3F5FVFqfp3wDurYzscVYoEc+VbppuG3xzJaHcUjQPm7seaSqTatAibkOdD6tizQOyA8wN2LyLugMx/4pPN0FJrQ9E4yR78TPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHkqxmCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FECDC4CEC5;
	Thu, 10 Oct 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728552679;
	bh=hFyXa07iWorjQWvMdN50JPjDPyCLhfAo3h7fIlqw8LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHkqxmCjdTeL/1a/5oI9irGBnBQqAOltfxidDM+2A9OxrJ9ZTRsgItKJ4CVtUl/i0
	 vcakMHqe8LKZtS+x/tszet6aw7NBJVk+2Il6fCn8KFMNIl2/ommVQAeObUy0sRdeXg
	 xpf/Tk+SwyErfxAiBv+gpyqyDm585z2G7foE8cERURCf6WMmp935ZISBk88RAs3o3T
	 0vsD4ZP3tteN7WxSCXyps9x7FpUzHwbxAE5dD8hyOTaCW06LJ+RVigDeQyuNTExDwm
	 aZEyC9VWpNsaqwWMgU9pwwBN/LEUgWH46+jNOE4KZoUZtkZuL6UaVN6AOiyMk9P2MJ
	 ZEpTyf1BX/XzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sypVz-000000001Yq-3K7e;
	Thu, 10 Oct 2024 11:31:23 +0200
Date: Thu, 10 Oct 2024 11:31:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100: Add uart14
Message-ID: <Zwee62wbF_t4Mm2p@hovoldconsulting.com>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-2-f7166510ab17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-x1e80100-pwrseq-qcp-v1-2-f7166510ab17@linaro.org>

On Mon, Oct 07, 2024 at 08:22:26PM +0200, Stephan Gerhold wrote:
> Add the uart14 instance for X1E80100 (typically used for Bluetooth).
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

