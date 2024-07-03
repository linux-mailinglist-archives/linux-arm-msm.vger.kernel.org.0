Return-Path: <linux-arm-msm+bounces-24959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02421924FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1FB9286B88
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B69F381B1;
	Wed,  3 Jul 2024 03:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8wmCDtj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372A328A0;
	Wed,  3 Jul 2024 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977862; cv=none; b=Szd92dUG8vwXSzdQvdvEak281oyB/kMgaYEPlAdzfC7p5Rd1KvH07WKlh40/15yqfgrlXCcuYddU+ycJCHPuq4Gsc/j4w6XiORkVDrvcGdvMhzU9QeLQmLl+RZAFHoMsl3KEXDHumgL/Jb0T7h+j5OFyU/14f02FJJkB7xTDjxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977862; c=relaxed/simple;
	bh=fQ7ZOMsBulfwfa8UwCcjgYsOIZM7uaZoJmDHFm9n2i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+fDFKySYWN2AtOQxRxNXDZXGWp4b5bxLsw6fGfq5oZbB9WTSRD75chuk84jCCHEmrtphFF1tRCpIuNqzkAVoYhbU+UsszW29o+fxNsVz6FxXrE3ioEK1H4oxTns7VyJjaaFx2YqHUQzDgEzXkn6XM7nxpFGr9OYkLmuiTrc2ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8wmCDtj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030D2C4AF0D;
	Wed,  3 Jul 2024 03:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977861;
	bh=fQ7ZOMsBulfwfa8UwCcjgYsOIZM7uaZoJmDHFm9n2i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8wmCDtjnpvIqKJB60ldmag6kNtmlJzo24APkajHGqNsCpeAnk2BUjlPuwFoH/4cO
	 AG0sE2IBF/nqa/H+RPUuLX3hyB47YB0yundJNVekz9WHvmdHmjl8RSENMAsuEShV2g
	 08w9RvwBRjh0URnzAwUENEEyD3NJ7kMj3ZcEPds3QNt1tvlTUJXMwCjAFIovpsFO9A
	 n3CHewuYkvZLUajDn+N+GELwELq0ZMXqJ7EafcOepu5Vo3zaLLYKZ0J62Ils339SLK
	 O5WMCGs1dtO6cjGvrJeVFkCGZza/fhXBQl2jktvb9Si83G96CRzPKorIXFyhbmpK0I
	 EgHfx4eDcTZ+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dang Huynh <danct12@riseup.net>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qrb4210-rb2: Correct max current draw for VBUS
Date: Tue,  2 Jul 2024 22:37:24 -0500
Message-ID: <171997785369.348959.4235528262063919362.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702-qrd4210rb2-vbus-volt-v3-1-fbd24661eec4@riseup.net>
References: <20240702-qrd4210rb2-vbus-volt-v3-1-fbd24661eec4@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Jul 2024 13:01:19 +0700, Dang Huynh wrote:
> According to downstream sources, maximum current for PMI632 VBUS
> is 1A.
> 
> Taken from msm-4.19 (631561973a034e46ccacd0e53ef65d13a40d87a4)
> Line 685-687 in drivers/power/supply/qcom/qpnp-smb5.c
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qrb4210-rb2: Correct max current draw for VBUS
      commit: c6050d45cd372e4a34f9f501b30243caf2e810c6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

