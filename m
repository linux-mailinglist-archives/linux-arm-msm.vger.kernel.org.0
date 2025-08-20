Return-Path: <linux-arm-msm+bounces-70017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B79B2E77F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E9AA23C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 21:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C072DC334;
	Wed, 20 Aug 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBT3DGbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F227145F;
	Wed, 20 Aug 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755725472; cv=none; b=AZe1cVy+kdsCLs4KhKaXY+Oas34WlWx5ahDTAAj4DL2+56aT4Yost2N9vFVpkcnvt0/wlfGvqzPIaX1aNrn3h0aFZveRRTlxCbcDd6nh4rjrlbB8sMsaZIlnIX67TqcQFUCgrRrCEeLnLULkjts1nqOwV0J06xzuAi7uDd5FeWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755725472; c=relaxed/simple;
	bh=jCMpgM/35h5HFuxp/rsGVNkpROr8HBYhsLue4WcCKAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT07bjOWNnl/QeUpWMCE56TmYcuzwNRHb/mV/TtlRkxs8Zvd+ULjEDCP+yKQ5IGqfK6cpSBQ4C4krGjKol+/1kutC7fxs1ZOEzptZh/gYYvuvprFhM5p7lKkCcTyjfdOw7bwA1sXnPadCrkJSiF9dygUtf8q58mRTTjQXYCxgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBT3DGbV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434D6C4CEED;
	Wed, 20 Aug 2025 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755725472;
	bh=jCMpgM/35h5HFuxp/rsGVNkpROr8HBYhsLue4WcCKAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBT3DGbVcJGnIvPiNaKqJAuch0kf+OvT4sFw9TQYM6fi5+T9wCoBEESWoi0/33lvt
	 tWmYruV9UIWSFdDUcQ1AlJPGTn9VYf8mxav5yPJMd6RyYPk6rSRgjzTLyyeqOb1NdS
	 b66v0Fs6wwMXxdHAePZYUEpUCgAz4Cdd3idvfnPFCJXHKJ3fTqqdU0X6eWV97cftqH
	 q7xY4PW+NTiHqkNIM2Gt6IXNxzkwYg1S9wcAzURhMm7RUkJeEDlLiXPdnIyuS068tQ
	 reGR/Y1KiuLrsy50bT2I+AO1132AC5lBZ4MBBvRBsiHZOEJQbIpwzHuqPGY+EjgazP
	 ZL467vjwKS6Og==
Date: Wed, 20 Aug 2025 16:31:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nickolay Goppen <setotau@yandex.ru>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: gcc-sdm660: Add LPASS/CDSP vote
 clocks/GDSCs
Message-ID: <175572547104.1241921.6647030859802746804.robh@kernel.org>
References: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
 <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-1-c5a8af040093@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-1-c5a8af040093@yandex.ru>


On Fri, 15 Aug 2025 19:56:51 +0300, Nickolay Goppen wrote:
> Add defines for the missing clocks, which are required to power up the
> related remote processors.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  include/dt-bindings/clock/qcom,gcc-sdm660.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


