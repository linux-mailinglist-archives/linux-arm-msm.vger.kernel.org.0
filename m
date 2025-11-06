Return-Path: <linux-arm-msm+bounces-80531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC048C39888
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02C2A4FA3D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A933002B7;
	Thu,  6 Nov 2025 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJKlKLns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1302253F2;
	Thu,  6 Nov 2025 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416544; cv=none; b=Ctb9HGq94KsOiL+KTWGkEg5NKvj6Y0b2UvS3Ko7tm3NUGjdk7eKpVtTyLtoRxkKNLceicbJ9YT8QZUbVJ3mgeWidmw36Q2ThbO4o6OvBOLFMuyYZNI+aKW8dTVgLOxthSkn3lXZC4koEmAkZHkHRRm16MRjDUpE2+YXbNTcM70I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416544; c=relaxed/simple;
	bh=KeZxaBiMaFqGzHOEC/KGKPC7r+2lteiyS+bw4+ABWbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pySmc/cYzAJx+TprbsYBQBlSAvxR2X4A/hEj9Ptr9bHgrkUv3KujiPsyzIRf7ZkmcmqfZiKtSQ8D04wqpcgHWbooBTHTVHAmKkpHQ8N6gKPfY+yniGgFkMxDXYwW/Tby54yoDApOQBEs4BxZfjHUb9gnNiBh0tDSUovI3vo3h+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJKlKLns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B6EC4CEF7;
	Thu,  6 Nov 2025 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762416544;
	bh=KeZxaBiMaFqGzHOEC/KGKPC7r+2lteiyS+bw4+ABWbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJKlKLnsxkTwBMFSsdrjqV8bHU4W00dtKsM94WUleAqWJTjGRbkMSGjd4Umeyso3J
	 HAhr1XW7rt6SuZv1OX333guxLueDsTxzy744Ufpy6BQmphlKI2wDTsh0GP7bumuksC
	 lwbnwqLmB7XQtUdbm2fmeKoa30ZlwhwvReNH3HamDTMxa0VbxrfyWLEzrpYS1FVo8Y
	 0somk8OW5ZQqGneyApgIljne1G7K95mdFCBWPU1vriagpDV6CiB+QheD125DxQpOmo
	 xotZbuqWe1kv5qTyuo5bLwk773C4fo/hCGBspWcc1P6InXi5jTxeioXx3yqAyAxDyy
	 v4ECozEt6g6QQ==
Date: Thu, 6 Nov 2025 09:09:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, wse@tuxedocomputers.com, 
	cs@tuxedo.de
Subject: Re: [PATCH v2 7/7] firmware: qcom: scm: Allow QSEECOM on Tuxedo
 Elite 14 Gen1
Message-ID: <20251106-gay-brainy-flounder-ae76c7@kuoka>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-8-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105154107.148187-8-ggo@tuxedocomputers.com>

On Wed, Nov 05, 2025 at 04:41:07PM +0100, Georg Gottleuber wrote:
> From: Ettore Chimenti <ettore.chimenti@linaro.org>
> 
> This is needed to access EFI variables from Linux.
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Also incomplete DCO.

Best regards,
Krzysztof


