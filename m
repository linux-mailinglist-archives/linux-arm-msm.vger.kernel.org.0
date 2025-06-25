Return-Path: <linux-arm-msm+bounces-62285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E414AAE7912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186AC173717
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 07:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF86207A2A;
	Wed, 25 Jun 2025 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k71rOBxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0C6204098;
	Wed, 25 Jun 2025 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837978; cv=none; b=ojKE6X/T0RzNTS/Nvbd8ekazt7lwMTbRgvE9Hv5UpD9KJ+C1QWcD/xiOvYiEx35kLKDu/m3so1OrQ5HEPDr1PJBIHiR6kaCkthDGu0rT3DGMPVLSZgnWIrd9KCGMf3UmWU3G83vCNnMCcDjG5Os0yl52r4d2U31JuDgUMvwojoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837978; c=relaxed/simple;
	bh=QzwD4sMONbq8aB+WPPxxUFLeFmTcglnxmIWy9yRJUjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPjv2IA2honMXb5FNuiKIqJXpRK9G1u2YMugK9FpWJbxWvbjzDDWMKdpoQT4I8/GpMn9sxus19ONZ4DrLC/vfd+oKZyHQaVWkeIw9cx6mesYpvwEimU5slzT8UzNKpg+otmJIDzi0cik3Avjzlt0XstOR4TmR3VMKoVs8zp+4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k71rOBxX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77778C4CEEA;
	Wed, 25 Jun 2025 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750837977;
	bh=QzwD4sMONbq8aB+WPPxxUFLeFmTcglnxmIWy9yRJUjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k71rOBxXAuMnnj9HIxnQwUhAzmLhCEUaWN7coJoNUde7n1a1zt927o/PmpDRmM395
	 ara8dJdDFsqVNESZgG7hnbOvVk+9sVJJ+resu+4edvufJyMGG+d+mmqswqGl/Oa4EJ
	 Ki/fTxx5WUS21Cyuh/bgfXI3QZFpFwkXTluAmrpY/fTrh7xFaIb78xV/jbfgYKa34i
	 vyd83mUgq3D39ZYt5gBUJdfV16JofG3dwidEsseQdmMa7i658a8njDtWRcMDqWOAQx
	 U18wW5r7a4PtPjJcAcBqlzP1O6J70OXu8xF3OGTHCjAeSkUCLdDL/xmz66qrd+OySW
	 GZ44ICod6YG/Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUKwC-000000005tJ-1Tq8;
	Wed, 25 Jun 2025 09:52:56 +0200
Date: Wed, 25 Jun 2025 09:52:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org, bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
Message-ID: <aFuq2JFZZhC1r3N4@hovoldconsulting.com>
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
 <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624225056.1056974-2-alex.vinarskis@gmail.com>

On Wed, Jun 25, 2025 at 12:41:20AM +0200, Aleksandrs Vinarskis wrote:
> pm8010 is a camera specific PMIC, and may not be present on some
> devices. These may instead use a dedicated vreg for this purpose (Dell
> XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
> 
> Disable pm8010 by default, let platforms that actually have one onboard
> enable it instead.
> 
> This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
> fixes the issue of power button not working as power off/suspend (only
> long press cuts the power).
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> 

Nit: There shouldn't be a new line here after the Fixes tag.

Not sure how this breaks the power button on the XPS, but sounds like
this one should be marked for stable backport:

Cc: stable@vger.kernel.org

> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

