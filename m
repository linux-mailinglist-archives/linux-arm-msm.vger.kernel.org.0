Return-Path: <linux-arm-msm+bounces-53942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E4A854EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8D80467DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388EE1E9B38;
	Fri, 11 Apr 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMVJvaKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D50A1372;
	Fri, 11 Apr 2025 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355056; cv=none; b=Y3tSpnPC+9wAW+nkdcolvw/PVoKrwVKotwNy+/0kH6TFYoTatTMG6kZSWxhKHSvwUklMww1cKV8dCmbpufgDpaXQhEKDTCSaAuSytvIvs1PjDWIVVI/7EKuN1x94SGOx0UtikOlZq+rpqsDKpm+BW63ZVQYXcnNCWhwkp9A+lSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355056; c=relaxed/simple;
	bh=AjLGdudkEww13Nz7cV5HJs58X3vRvdgMVqM4PyTJpeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkKrTIII7qR87BWppk7ccJa0rFXT6/odoODIqBlQZczWrBMa8YCif5hnEjMldzfrvPP2+TSeimFtrIsb0giGXhKqkofaFG7l7MjxoBPSKwivOppb996rkUTv1tZ9IeHZUO0N5TrS/Fx/Yj6LXUWzr7A+kodu9p0vYyRk6X9U8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMVJvaKI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF37DC4CEE2;
	Fri, 11 Apr 2025 07:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744355054;
	bh=AjLGdudkEww13Nz7cV5HJs58X3vRvdgMVqM4PyTJpeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMVJvaKIvCEhjqbl5AqKs0cpHMyvu1N9cmHbvDrhBSxs7Kdh9vGOrbqCV8OyzU1oj
	 MoAAUhaKELSnT1jYgtHsWFZBKmuto0m8G1IXj1Nq3YBPlyB7bbpOfObfcyroYfONfz
	 JkM7glCX0GBEqBz8N3wVhBliQdK6gIybFR9tGH+6TgjPJma7eFyN2ZhnZn5+BhDYMp
	 Xe6XktaRK5r+dvJK6M12cOtwfUp5pssjCa21VPmtLv0sGiAVEUFBEOFsucn+0HNebo
	 5UufgYKdWdB7vcKKMQLZ6LQ82uZg91TUzR/+WTVa9WieLyWaJExYxLoPI58HaKOWYE
	 ybvRBYUI1P+WQ==
Date: Fri, 11 Apr 2025 12:34:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
Message-ID: <Z/i+6k6VseihdQ69@vaman>
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>

On 07-04-25, 19:51, Kathiravan Thirumoorthy wrote:
> Update the phy settings for IPQ5424 to meet compliance requirements.

Can you specify which requirements are these?

> The current settings do not meet the requirements, and the design team
> has requested to use the settings used for IPQ6018.
> 
> Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
> IPQ5424") and reuse the IPQ6018 settings.

Why not do revert first and then add the settings?

-- 
~Vinod

