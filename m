Return-Path: <linux-arm-msm+bounces-34634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E269A1438
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 272E2B21AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1323121644E;
	Wed, 16 Oct 2024 20:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHcvgi6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAFD1CBA1D;
	Wed, 16 Oct 2024 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111357; cv=none; b=PjRkL9JXNYMcc3nPViyQIxlPzED9CT5MJTeXkM52C3hpIC8Vo0MkVT7MHk2KNVEb0rijMCZ4RgMNnrefjGhHR56XFq7LRqQu2DClABhMO7sRdYv9WSFYldZFEJS5EbkiRs3TCd3Jv3DSRNNiOLaBLJwEDta7MvQAs8KSHFlfqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111357; c=relaxed/simple;
	bh=V5DL/YU7lhwF4erblr49VR9vrskp0YdoI0+f2kB6U4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+GWROS4R3van2Fu667nDz+Huwr+xDn4lyqd7MclE+NKwKm2MBgGmfXw6VFnVXeUVxcDkMKwzi5jci8q34fBOZZep4h2TOOcOrZQ8+qlfkC6PkipQqe9iA6I4V9Kjh1s6458ITNAXEVf68ZO+IDGvvpI8G85BRdBFoQMh1MfoNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHcvgi6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36EEC4CEC5;
	Wed, 16 Oct 2024 20:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111356;
	bh=V5DL/YU7lhwF4erblr49VR9vrskp0YdoI0+f2kB6U4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHcvgi6BFJCV6ga+ja9eyKLxvyQG/vaQxc07xz/hDdcTAfaPfYM8ql7cf35mcTOFF
	 ee37HHPtRl8jaRrTHCNOJqcDWofhQnuDHeMUMJw0Q1XwgE7uDmk/XhLZqJMK+q+3sw
	 BjPya2CwtgcF+lF8yp/Cq9sCj7QeF8GMgCxzzd0gFsuyvzztr6HSJ8v+kt6xWUvdTP
	 RVnsjI5SIGZIs1Mb8P/bJPPSNngb4xyCDjzjH/lU2pcde/5sDYvZC5JMNSv5lHiO4+
	 rAQWgumUoYPgiFhK1FS6zKOws8zuq9AjYyruS4k5HDedaZ3GpaoM5myszP+R2Rjiwv
	 D/52k2PGzV46g==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add Broadcast_AND region in LLCC block
Date: Wed, 16 Oct 2024 15:42:25 -0500
Message-ID: <172911112240.3304.14479247298086070465.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014-x1e80100-dts-llcc-add-broadcastand_region-v2-1-5ee6ac128627@linaro.org>
References: <20241014-x1e80100-dts-llcc-add-broadcastand_region-v2-1-5ee6ac128627@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Oct 2024 10:38:20 +0300, Abel Vesa wrote:
> Add missing Broadcast_AND region to the LLCC block for x1e80100,
> as the LLCC version on this platform is 4.1 and it provides the region.
> 
> This also fixes the following error caused by the missing region:
> 
> [    3.797768] qcom-llcc 25000000.system-cache-controller: error -EINVAL: invalid resource (null)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add Broadcast_AND region in LLCC block
      commit: 80fe25fcc605209b707583e3337e3cd40b7ed0bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

