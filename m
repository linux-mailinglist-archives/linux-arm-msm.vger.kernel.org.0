Return-Path: <linux-arm-msm+bounces-37797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F59C734F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89401F2233C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5570A4C62E;
	Wed, 13 Nov 2024 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ebhhgj2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218E4C6C;
	Wed, 13 Nov 2024 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731507459; cv=none; b=PvM5inZXmRIf+EQz9OzcJuL5q+H7P7bEeiGEW15yOE7GSjXVjXE0Zox/0OgsRsyamWEfi7WwnTVQq9B9GPlg5pX7Nw4NOOYEg5NNTZHfWiGZuYyjjVxYEsoBO0E1s563NJ6BksAQf801Kxu4BnCwqaZodXQEJoehk76ys5lpIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731507459; c=relaxed/simple;
	bh=mDMjXI3W4m6+Xk2V+ULJrYz1UHiu20HxGy4Dx/jvYG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDaeNGgqwE3Oo9ryZGt75LSgWytoJl7gxgbOpihFuw/0hiMF0y/VHjBDPc1nq0g51VnUEpXSVX6oNlGU6c7DYuoXdCItxMJFksrLfLKeUlCfGsFaFQLoGhbPRCHniztp+LFWRS0whWMLy2NE11u4tde3wN4LZELrpLGrdPP1MFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ebhhgj2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABD3C4CEC3;
	Wed, 13 Nov 2024 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731507457;
	bh=mDMjXI3W4m6+Xk2V+ULJrYz1UHiu20HxGy4Dx/jvYG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ebhhgj2wmCM7kmz5sqG/9Nv0Zu/8md/UxwrUJ8y12tUA1KMavgt4+8ehJdG7f196O
	 dOV1pA7K85D27NB8TsX64KPRN4lQ6PAKWmNc85vKDnY1PG7nEbr/bHujdSXQ2OpW5H
	 6GhUo4twTiQbqoIR1/AzZPJthU3C8o4k+piR3+XqFH5YkS4/q6AeSTmNsHEhF19ZlE
	 hbU8YIRT9w0zyD9ttB8ZgsVUFcQky5AI4RR+LbiKGhSXMhjgGlakO6rl8NDFM1f61J
	 Qfdr5gl/RCH1h3/IPm3vwYpi1QgYd3TIs6b8Ve+9ZQyIhVMyA+uHfbkXFc1TrLaFDQ
	 szpBnRASqlKgQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tBEBX-000000001iL-18cc;
	Wed, 13 Nov 2024 15:17:32 +0100
Date: Wed, 13 Nov 2024 15:17:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	quic_mrana@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: x1e80100: Fix up BAR space size
 for PCIe6a
Message-ID: <ZzS0-5U-4nmXW_8R@hovoldconsulting.com>
References: <20241113080508.3458849-1-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113080508.3458849-1-quic_qianyu@quicinc.com>

On Wed, Nov 13, 2024 at 12:05:08AM -0800, Qiang Yu wrote:
> As per memory map table, the region for PCIe6a is 64MByte. Hence, set the
> size of 32 bit non-prefetchable memory region beginning on address
> 0x70300000 as 0x3d00000 so that BAR space assigned to BAR registers can be
> allocated from 0x70300000 to 0x74000000.
> 
> Fixes: 7af141850012 ("arm64: dts: qcom: x1e80100: Fix up BAR spaces")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Thanks for the fix.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

