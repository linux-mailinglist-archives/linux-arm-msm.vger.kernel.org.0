Return-Path: <linux-arm-msm+bounces-49015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B5DA40739
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 11:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23DF33BCBE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CFD1FE46B;
	Sat, 22 Feb 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oc2fscaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042D1DE4C4;
	Sat, 22 Feb 2025 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740218427; cv=none; b=HqJrpIa+m2y9Nvm1QrsaJBGzM6ABhydRwm0UE7W7WYO+LkKoLqXz60ExwK9DFiCkJn69HnkkBlPqXN2HLZKPHsV/lZvbrytj6PSjKUsJOzWh6fcUzspgFLR6rBODJephkM3FF9hSPRHSHM0yRIEVB0/otzcgkEQHwMNK3PIgEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740218427; c=relaxed/simple;
	bh=O0GBKjyjvst1Ef+k3JkpAQlW8scAA9rB7DUZrqOeRDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAlK0bopKsxoIOZ2YIaBbTmQnSHG4+bCU9nCNm08K1bRIb3cGDHvdUw36dkJQ8VJ5Ucfx8RdZYYN7+75mNHWSQkOCWDaGznJZCq/4Ag9q7ekMwjZLABZh+7f66gLHYSZpvjeMU3f8YJbmIDdvJSQnakLGEQRB9dI5D7CO+JJJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oc2fscaE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FDCC4CED1;
	Sat, 22 Feb 2025 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740218426;
	bh=O0GBKjyjvst1Ef+k3JkpAQlW8scAA9rB7DUZrqOeRDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oc2fscaEwhy/TUTIxe3wf9j8WIRhkk1A87kqKUKxmzwZ2RSIbP5HuqEiQGHMS41sJ
	 IuMORh5KiiBrcUB1G/rfWq9LwRjHBeKZy4pihkOC++Fsyo/TM7rJ3pxYLcLNvbf5uP
	 mzZAIwcGrLLv9EZbGix723ngzBn374tQ+t5/XgIxoA4NrfHDjTun3v6qzdU/AZ2ZIb
	 DgoswH6eLC3JeavzhgcuZBD+6E2O0trw9wh4ERrhuVK6aP3aN0D8S+9Zf3uUaPSgqN
	 tim1TXV3XWb8KC0v4O9A6IucpXEraDL6o9zdZtGTKlsbg4BOGAY1iI3gvTlFkgwxXU
	 0dj7HLInl2eOA==
Date: Sat, 22 Feb 2025 15:30:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to
 set the link clock
Message-ID: <Z7mgNoJTIE8bbxte@vaman>
References: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>

On 21-02-25, 11:38, Russell King (Oracle) wrote:
> The link clock operates at twice the RGMII clock rate. Therefore, we
> can use the rgmii_clock() helper to set this clock rate.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

