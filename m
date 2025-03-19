Return-Path: <linux-arm-msm+bounces-51955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A5A68EB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9E6188B9CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D034170826;
	Wed, 19 Mar 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofe0cUPd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40F70808;
	Wed, 19 Mar 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742392854; cv=none; b=FFBnKgSRo+Nu63syNZejINnZVWwCjYIboxnQ46QnijuVhYbEk16L7OLDSaoPqRJwdnfDtTG/ASO3i22pw1lQ+dNGbwSduEh5NyZii7ETV9iy9kOARvFb1EPcKY3rUWpv1hpuXKlBFFEwMyQ9SZh58rCQuCms2ZXh7KbJqHA1PZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742392854; c=relaxed/simple;
	bh=uDLeI9bg1YUbhSiMb0QQpss9Md8J2QvM5quswstwtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfHsR7b9cou49fk/0eplft3Agi9tj/0l+/OkKh+Ifsz9KXLg04Q6gn56Fdc9PMdnwdKaMn0BNnlDd1vBo7Dor2xFJkSwlnI9+rofJZ4uKeQxJs2F0AnaHPzPSVKepW6iqBr5Dpv5IZVUMbZi1tXRMywNfQzY+Q1yk2JJgdqmSz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofe0cUPd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C6FC4CEE4;
	Wed, 19 Mar 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742392853;
	bh=uDLeI9bg1YUbhSiMb0QQpss9Md8J2QvM5quswstwtPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofe0cUPdGbj1JkLXayFLP2agkxpdx7EWOK97mon8o+PikboASHbgthiEHQz/va4/S
	 Snq/AgHryN+Rqz8sV+oBvFGGHJ3zCz/4RCr0nTGzZ2+tVZC5tHfliYIj3brEiXwBYX
	 ZDZBxXDReLf0xWagIimiE7Hr2ZP2lg6hL2IoBpXFLNdWyZb4vrBSGowGUAP/NvPrze
	 ffE0/IbzqMSrn4dTsMkhXmyrp8Of4NQiidWSUZuTr3zLXLFFh7SOejqw8BV/7jROxF
	 avKN8iYWIo8tQUc23oPmb4q/46HTLkUEvdJ5pyZNKRUSWJqJZexa6EQDHk/7fMXQrw
	 oVliyAFn1gp5A==
Date: Wed, 19 Mar 2025 09:00:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
Message-ID: <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
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
> 

That's reasonable. Have there been reports of this error from anyone
else, or should I go ahead and enable &pm8010 on all !xps13 devices?

Regards,
Bjorn

