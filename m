Return-Path: <linux-arm-msm+bounces-54953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9208A96946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 14:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1147A17D673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808D627CB15;
	Tue, 22 Apr 2025 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCIdcj8i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528771A317D;
	Tue, 22 Apr 2025 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324794; cv=none; b=b6pvdVaQDYDki3wn2/nrcex0AomKFqQiPCzkEZoL7oh+fHZg/K7asKt/H1Nt4prMIf51jpDzLdNumgM4+bnqtimat12Hp8GVFIDtVoU+9OPCwgj4eUZhXNZQAe64KqiH/yjuxSFqHy+HDuPjxBsHmuMEunhBFLHOXy0e6PinKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324794; c=relaxed/simple;
	bh=5i2eKqt3grM515ivR68NWJHFNMh7VbwhNibc8UtARLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQY4FilfvqkS0XdRMlvEV5afmkw/2SzwbSpdyx9c33R92H62F6Qk7aCIdTJ4Itv2VspyR8DEzviTYIJR/880oduOj2qhl6/yCAhuxz9N9Uer4a6Cy8HNhHZqOQN9Y2U0r6/kx9we0C3mgFebTPF0ojpT4vT9DRT9KHxQ565KLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCIdcj8i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BAEC4CEE9;
	Tue, 22 Apr 2025 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324793;
	bh=5i2eKqt3grM515ivR68NWJHFNMh7VbwhNibc8UtARLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCIdcj8i9zsKYw7UQrtIOwu6YkK3wvt8T98u4iSwj4Yn/hxFhjR1iu/3WvNg3dGmf
	 gXlA7fVu3M+e8fj8wZV4RZzUizSmQmlNAr4jWLlt7W2eu/G01ZS7/YfrtNx/Ob92kg
	 kUIOTI0BFJjJcj+IC4tkdzEC9UIHxZR1/ssDPztrXaLYPmoafMWiM4aFzk6Q5FogBG
	 lPCebaYZ3qIXnYNAjHXHHNc706U9HDKctITrVfrzA2C1OtA6wyq17eUHxiE7952VO8
	 dk08JfcMDNuQgZapXv0eGpZyTkjRMB5u+BXbRoh0X8w419HlV0G0f+MzslEQBoYEFq
	 CeJ7IYOix5kdA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7Chr-000000004Lw-1HSq;
	Tue, 22 Apr 2025 14:26:32 +0200
Date: Tue, 22 Apr 2025 14:26:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: x1e001de-devkit: USB retimers related
 fixes
Message-ID: <aAeK9wFdtnzyD8J_@hovoldconsulting.com>
References: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>

On Tue, Apr 22, 2025 at 02:25:21PM +0300, Abel Vesa wrote:
> These fixes align all the USB retimer related nodes on the Devkit with the
> CRD and T14s.
> 
> This patchset is based on Johan's:
> https://lore.kernel.org/all/20250318074907.13903-1-johan+linaro@kernel.org/

> Changes in v2:
> - Added space between voltage value and SI unit in comments, like Johan
>   suggested.
> - Picked up Konrad's R-b tags
> - Link to v1: https://lore.kernel.org/r/20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org

Assuming you verified that PMIC power-source settings matches what the
firmware has configured:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

