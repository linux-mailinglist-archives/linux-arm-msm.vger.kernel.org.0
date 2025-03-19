Return-Path: <linux-arm-msm+bounces-51951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59221A68C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 693771750E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE46254AEF;
	Wed, 19 Mar 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oh7cBqfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB5220ADE9;
	Wed, 19 Mar 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742385317; cv=none; b=bfjMhSCEAFWpI/gJnnwGBqCgrpp4T1xcNfSGrApot32zxFecn2au1LtOgsKZq4Am9M8DH8JBWC/U2Q1h6tqdVQ5RIhW+XTFGAKeNKaGcEBqYhpNBI4P5KaSd3eYZkRjq8vjWmOv2+HCsoxHculOfd/ccZphf1LaC9nDf8CElZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742385317; c=relaxed/simple;
	bh=ztQFcGPFXj+rfBbSD1qEtrXLqCq8IH5eYGavHTdc/+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPojHioPcAwv9MyCTe+oxfitnfTZm9pI8ToD32/7FjUE4rGcP6Fd5Iope8w2vnTJG3/FgoKtlBKHxGbYfpvg0M9j0H4dV8ALdtqYYv/cnWY8Ax/kEvhOwNJpV+/vVf9YVEcDvQ4QU8U+5BYbjWWiarViX6JT0ht/lo1neYbIzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oh7cBqfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA3CC4CEEA;
	Wed, 19 Mar 2025 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742385314;
	bh=ztQFcGPFXj+rfBbSD1qEtrXLqCq8IH5eYGavHTdc/+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oh7cBqfkPc/TXMt5slxRGUPT9/eLSlec8tQe3qTugfpZF/4micOjd51jk5MdHE07d
	 yibMIrsrBxdGFD0O+daizwFA72r7tbaErpTym996ZcPejGUTIJTc85oK8ZEPFL0wgY
	 lRUjGt6V0NepMzL2OCKmOeQbfA9KZMtsBhFbQ41S8qqoCTZKxJ5x67Yj7Uem484Pkf
	 SFXg2u3B0L50LSMMuAieTE6NxsvYSS/K98ye3dUdFvrOpu7xUCmXDjZ2wBv81I4rwN
	 dl+N5EhOel6RftFvfhJXSWyE+GMC96ZD/Ya7UgBUiIn+zkR6BDtINmLmCYx0OP2M7c
	 os2CnG7NkXrzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tus0x-000000004gs-0Emx;
	Wed, 19 Mar 2025 12:55:15 +0100
Date: Wed, 19 Mar 2025 12:55:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
Message-ID: <Z9qwo5I7_B-zdIjC@hovoldconsulting.com>
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
 <Z9qXFLmnae86_GT9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9qXFLmnae86_GT9@linaro.org>

On Wed, Mar 19, 2025 at 11:06:12AM +0100, Stephan Gerhold wrote:
> On Tue, Mar 18, 2025 at 10:17:02PM -0500, Bjorn Andersson via B4 Relay wrote:
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > The Qualcomm X Elite reference design uses the PM8010 PMIC for camera
> > use cases, but the Dell XPS13 doesn't. Disable this PMIC to avoid the
> > error in the kernel log caused by an attempt to access it during boot.
> > 
> > Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Usually we do the opposite: disable nodes by default that may or may not
> be there and enable them where needed. E.g. for the 4 SMB2360 instances
> in x1e80100-pmics.dtsi.
> 
> I think the same approach would also be preferable here. You shouldn't
> get an error in the log just because you didn't go through all of your
> DT includes and checked if you really have all of the components listed
> there. I think it's okay to enable PMICs that are more or less
> guaranteed to be there, but clearly this is not the case for PM8010.

I was just going to say the same.

Johan

