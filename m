Return-Path: <linux-arm-msm+bounces-58066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DBAB896A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356A9189BE45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 14:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD701DF963;
	Thu, 15 May 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6uy7Ivw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321211DDE9;
	Thu, 15 May 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319100; cv=none; b=Syth4tfcNizRQgbX1VNYR144NKfXpwc3l3dvrUy0IMdcofDQkBbvKxhv1UtYa4fOMQDmD6QXYQ7WrJojXIQcQJGAiNgYPPS7miJDxdCAWOLe4FGJMVrhXQ6sVUvsZ6f7P3pUHkwoz87uawAWz1ngfMG4KnL0dhIsWcOWC7FvwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319100; c=relaxed/simple;
	bh=tWrm7BPeedjVfZdi0Xy9LN5h23eDVe5370ORyn81HXc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JU05EXzUrr5JwtJzIlOe8UVe64XwzEL0abUBq8TiXY3EirVPguzpBV9PqjdEyTSY78linNdmCjJobZS2a9iER4q8O/UYG7+rVf4OfLsCb4UlyDYa/rI53aE22vMzXCG131JG9q+Q5PmFWyR3SaOfecoFDh1aNAx+V0qz31FtXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6uy7Ivw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35D7C4CEE7;
	Thu, 15 May 2025 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319099;
	bh=tWrm7BPeedjVfZdi0Xy9LN5h23eDVe5370ORyn81HXc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h6uy7Ivw5uVytRpIjUIapvQr1UD2XRbIsnpYepOmDyjGJSONCl9xg6X30Lc4WLpE/
	 6TTtIZS9zF1sZvEdhJzHunjHuZH785SmkJmy3v1NqHt3H6NjpIfvbulcA2J8auFvYu
	 pb+PMmaNroSKboOgr51QHqBWXVvzjlIoytD+Gtr6bPWvq0JzIftul78PgRL0R21Y3c
	 VT8HouAaLACD5E8B8OJ9hY6trABjNKSTRN399UDi99SDHBdhjXHRNwy8OROapf3vrF
	 tx6KhQTltmhJ8XfrFn7GwpVBbbSN5dP/CfRfrRt4fyPdoMI/W33QSbxJzSi9djnln8
	 efBh8+ND6CwXg==
Date: Thu, 15 May 2025 07:24:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lei Wei
 <quic_leiwei@quicinc.com>, Suruchi Agarwal <quic_suruchia@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
 <john@phrozen.org>
Subject: Re: [PATCH net-next v4 00/14] Add PPE driver for Qualcomm IPQ9574
 SoC
Message-ID: <20250515072457.55902bfd@kernel.org>
In-Reply-To: <27cf4b47-2ded-4a37-9717-1ede521d8639@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
	<20250514195821.56df5c60@kernel.org>
	<27cf4b47-2ded-4a37-9717-1ede521d8639@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 May 2025 22:19:11 +0800 Luo Jie wrote:
> However, from the patchwork result as below, it seems the dependent
> patch series (for FIELD_MODIFY() macro) did not get picked to validate
> the PPE driver patch series together. This dependency is mentioned in
> the cover letter. Could you advise what could be wrong here, which is
> preventing the dependent patch to be picked up? Thanks.

Please try to read more about kernel development process.
These patches are not in Linus's tree or the networking tree.
If you want to use them you have to wait with your submission
until after the next merge window.

