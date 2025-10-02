Return-Path: <linux-arm-msm+bounces-75748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08153BB231C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 03:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D4987A7D8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2757179A3;
	Thu,  2 Oct 2025 01:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKwizORP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26934BA57;
	Thu,  2 Oct 2025 01:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366835; cv=none; b=bfp8AAWJZF1ADZ57oSSKntSHBb05/Zxcvb6qDlveEo+E0hSwRC7S9jVPbbYf8k8PYgMs+vce2Y+FMJRIRvmImoi0b4NYvSllAoMoM1MgjyduNxxrgoxkz5H+bvRZCaFuDI3QMEVcVGiKjACUv5EJ8kaUIJAdRFIbO9oLZPQx45M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366835; c=relaxed/simple;
	bh=pjPnjlspczDRAF5pe/F+7pe+bZIvPBL5uhCJyWOQgPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek+znhXrv5kaPQBcCC9qs/PObFR01zyPVXc3A9G3kHb7i1i0WBAL9Y3yzEBg2cn03zsF2qJ7LGl+sFQFrD10bArJproqi7TITNiClLsMzwDo1ZFUEXNtZWuwR4byJMCYM+2SyuOp15hH39bhKGX9jcMksdKTlAwUGJbVWSuit+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKwizORP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81FEC4CEF1;
	Thu,  2 Oct 2025 01:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759366835;
	bh=pjPnjlspczDRAF5pe/F+7pe+bZIvPBL5uhCJyWOQgPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iKwizORPZ3bybzpXw8WDhuWw+ZtXR15IsHQmV/WPGp7+YWpVoEcuyaUgnuaCHkAQS
	 nJRM8kHq8d9mJlLIpqJ5zpbrh14SZhS1QEm/mrQV8bXwiT/hprxclWKR/b0GRAiok4
	 V+uQFOKKlz6rcTy7XQykm+s1/jWP//9/pLpk63QLHQr4rqQYwehtq5pE/9rShuHvBS
	 Q3PKWUiSAWzYbai0Fc8uuFF3DpPK+1S9CRhZwNkk9Vyb3Vlpqp8SDKXr5gTyHcfU0Q
	 t+GL7EmdvJ9WpFAtltg4GnON/V9Q7r7n+fTiGOc6s2jfFrJh7PMEFL6CA0o2TTGoSB
	 CUbn9mK1KC3RQ==
Date: Wed, 1 Oct 2025 20:00:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/8] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with
 panel
Message-ID: <175936683208.2810010.4903153430543479196.robh@kernel.org>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>


On Thu, 25 Sep 2025 11:12:47 +0200, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 82 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


