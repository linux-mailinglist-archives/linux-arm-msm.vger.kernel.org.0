Return-Path: <linux-arm-msm+bounces-89017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52315D1F47A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 15:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D74B301B887
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577652D3733;
	Wed, 14 Jan 2026 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMkJHL6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1152D0606;
	Wed, 14 Jan 2026 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399306; cv=none; b=pdEkn3Qm31KkIrmor/UdvystxxjEPKTuSZI38DJ0NM4iK/7DU3/9qwNJbhRqIu+5CiopDu+4VAioQRAB2IxVcVxZUcpa/1L64MGvgX9BtZzLLRkfWhqkf3lppkTOwoEDIVTCq5knAiwgHFgCp629XeHHJeQNIW7zXB6TaR17KHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399306; c=relaxed/simple;
	bh=z1PZ3HGUC5DzEECbp98GiBNXztyK9h1Ncbkz9ixmhkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ANmiotV4qF0igaVPlDVfUCyGvP9o1UenP/g8c6Y2CEKUI2qH56kbGbO5E5opArB8bzEyrVTX0ZoXs70rRMGudB4UzAruh0TL/8ICBcGXWRReChThZotn7hRR6Kd837h/f47lae05TFRwgzCiOuhRPq44Kn2/P3cTtAatSH4MGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMkJHL6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823AEC4CEF7;
	Wed, 14 Jan 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399305;
	bh=z1PZ3HGUC5DzEECbp98GiBNXztyK9h1Ncbkz9ixmhkY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UMkJHL6w8+MAAkORQs/QfOtfPC910oZC4CxhNpE3Kxp3RKLxVA8GGfwQQYrQT+13d
	 XG4XDGawsL3/W8fDzTDwb0ln22oxoGEal6askORJYSplzm36hQW7zzlaT/FPBBXajs
	 gBWAvJz+jLmZUafa4lNj8vNHjp48KrJ3cSNEbMQJWDOYO5r4qnSXTrRTHqt3BTzrOL
	 IYl0Hz9VSujZy3xcgK8zIZl+GnGhk/lZhceRDifC4+AVf6R+7nPiwpVFIWSsbOWVYc
	 +eTVgnCZ1rQAQ9u2NVClJrRE16XtAl7qYutWpCp+rU1JCahkPLNp3t6YI4NJeDppqp
	 ywZNhBLo3McDw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
References: <20251017203438.744197-1-krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add polarity inversion support
 for SAR2130P
Message-Id: <176839930316.937923.6727107841048707223.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 18 Oct 2025 02:04:38 +0530, Krishna Kurapati wrote:
> On SAR2130P QXR Platform, the CC Lines are inverted and the lane
> programming is to be done reverse compared to other targets.
> 
> As per the HW specifics, Bit-2 of TYPEC_CTRL register indicates
> port select polarity. This bit is to be set for SAR2130P.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-combo: Add polarity inversion support for SAR2130P
      commit: 24991bfbbd84d68d5710e1563752047914db941a

Best regards,
-- 
~Vinod



