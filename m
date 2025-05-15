Return-Path: <linux-arm-msm+bounces-58026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EEAB7BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 04:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1FA18C749E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341B62820A0;
	Thu, 15 May 2025 02:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zif55Efl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94794B1E64;
	Thu, 15 May 2025 02:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747277903; cv=none; b=niKR8ZKuUmHqwxCUXJZOKtyGZmvUkPBtx4Iqz6o3YOmqLv0pclu4uY0LLejLKjwVroFUZ9GundoQqImMCAKk6U/XLzwSh/L7Z1zOHOuFJFcmU1vn2X0FASYnwjsx51nzUcLgmYAidYNAl7Q6Nh3U5NjnPY0ijcHXQWXlBSWcrjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747277903; c=relaxed/simple;
	bh=MJ9NvK4x6c2IC/ufJ5Ze19JfDwJVE60QHIw713vLMMg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mll7JiXCGYMS4ietcnJpI0VmP/dMN0kXQbKPgjJ0SZaTaCdpwJrrEFQcHRj7cCfMjNlRUdP0gebNPjg/IoDTHVvcpRkn3P1LgGatcwJnp8fkn1Zp2v64nsuLaAN7kqT9Qxmvc0QAEnZOFYqoxfpRKRPaB233yzl1znnKPlVwtvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zif55Efl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB59C4CEE3;
	Thu, 15 May 2025 02:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747277902;
	bh=MJ9NvK4x6c2IC/ufJ5Ze19JfDwJVE60QHIw713vLMMg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zif55EflQ/wfoyYxuzgJJHSrnBUs8bX4XFTCXmCfL2k4nVxfdZptpbnKhsYTGJHyW
	 RRWNbiS2iBt8i59yMtTwmGao/t3SUPhPkA5QpG/g8f5xrhYrwb0lj3ahw7sEv4pOvM
	 WNFJgauzbDhZyMYy68n2w/6tSa+mYfoGNC513s65H1XAQr5JXbJwKjAzQ1iXB93pAA
	 0T38+OzdVR3/lPkJlJq3ES50zfLllMLDQHrmSN2znHIrqOZqEqfk5MqjgqxZ5VOwal
	 4Wq37MTo19nZeTjMzkfgnuAh31jvNex/owxuodR9jRj1cQweyyN6qZkhFDyC0abGkf
	 dfW4bO91okreQ==
Date: Wed, 14 May 2025 19:58:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lei Wei
 <quic_leiwei@quicinc.com>, Suruchi Agarwal <quic_suruchia@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>, "Simon Horman" <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, <linux-arm-msm@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
 <quic_linchen@quicinc.com>, <srinivas.kandagatla@linaro.org>,
 <bartosz.golaszewski@linaro.org>, <john@phrozen.org>
Subject: Re: [PATCH net-next v4 00/14] Add PPE driver for Qualcomm IPQ9574
 SoC
Message-ID: <20250514195821.56df5c60@kernel.org>
In-Reply-To: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 May 2025 17:58:20 +0800 Luo Jie wrote:
> The PPE (packet process engine) hardware block is available in Qualcomm
> IPQ chipsets that support PPE architecture, such as IPQ9574 and IPQ5332.
> The PPE in the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6
> XGMAC), which are used to connect with external PHY devices by PCS. The
> PPE also includes packet processing offload capabilities for various
> networking functions such as route and bridge flows, VLANs, different
> tunnel protocols and VPN. It also includes an L2 switch function for
> bridging packets among the 6 ethernet ports and the CPU port. The CPU
> port enables packet transfer between the ethernet ports and the ARM
> cores in the SoC, using the ethernet DMA.

Please make sure the code builds cleanly with W=1.
-- 
pw-bot: cr

