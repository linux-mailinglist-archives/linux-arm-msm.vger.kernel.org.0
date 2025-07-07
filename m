Return-Path: <linux-arm-msm+bounces-63953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A5AFBEB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 01:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62AC94A2329
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 23:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A58289E2C;
	Mon,  7 Jul 2025 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTe6XAek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BADB1E3DCF;
	Mon,  7 Jul 2025 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751931813; cv=none; b=BpMuNd30UT3TmDR3VBpLkZaJmrhhvOa1F6GtyZGVcR9Qt/RHyyZe1dTWWQrOvbmrCl8FVVjOe3ZqCMaisC92f0C+Enhv3faoqYXAGvvVD3RtDTO9cSr9b1DxvgZ6nXYTy9BZ7sboA1uAX+lwoZBaQt7d8lnQyFL4IBa2AS78Dr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751931813; c=relaxed/simple;
	bh=7mAnMnj2RWqNy4x820kId/oWnSWvGuew4bVJXj0krkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4AtTEzcDMzFqBBA+TVAx2al1b5LQnYJZe0lIai7T0GpMWqp+nEtabg6SflDNnwYDiX7bndWmZi9IR75Cyez/mdNH8y1anyR0wrDKwx78L+pfHhSuryZsIneoi7EXSYnf2NnMfW8SsUXYS/COLCQ7e3hk85KMVzbTj4WwcjjX0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTe6XAek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C172EC4CEE3;
	Mon,  7 Jul 2025 23:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751931813;
	bh=7mAnMnj2RWqNy4x820kId/oWnSWvGuew4bVJXj0krkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UTe6XAekVmfo/gC0LDurKPzcFMQFaW8Fvoa4j+MNgG2MNDeXxUX3aVDxqxs7aUlC/
	 +SwLFsicatSTqI0bpLQcNqt9h6aUk6XH4pCdyjPgFwalc1udMTwF1Sdd71iyHzoDoN
	 JbNmHqP0HsdcDA1GCgDy4iaPt3rOsIhaWoFW5WyIMYuLvNsKd44VvpL0jeQz9LiRD/
	 hI9OgYrqaho3ZKEnatWfLnlzvwYjolIjRICnPbCktN7pAyD0vvVLPQoj9kByKMbkm1
	 90vdmAUpdT800d01rE4esH1bBxkkxAARXmp3OFL3yBBJyClB+ER2efdwUlNiMU2DSj
	 /lq7aGyKC7+QA==
Date: Mon, 7 Jul 2025 16:43:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Viorel Suman <viorel.suman@nxp.com>, Li Yang
 <leoyang.li@nxp.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Wei Fang <wei.fang@nxp.com>, <linux-arm-msm@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH RESEND net 3/3] net: phy: qcom: qca807x: Enable WoL
 support using shared library
Message-ID: <20250707164332.1a3aaece@kernel.org>
In-Reply-To: <20250704-qcom_phy_wol_support-v1-3-053342b1538d@quicinc.com>
References: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
	<20250704-qcom_phy_wol_support-v1-3-053342b1538d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Jul 2025 13:31:15 +0800 Luo Jie wrote:
> The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
> to that of the AT8031. WoL support for QCA807x is enabled by utilizing
> the at8031_set_wol() function provided in the shared library.

This needs to go to net-next in around a week (fixes go to net and
propagate to net-next only once a week, around Thursday/Friday).
I will apply the first 2 patches, please repost this later.

