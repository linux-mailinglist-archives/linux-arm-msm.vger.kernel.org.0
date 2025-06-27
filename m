Return-Path: <linux-arm-msm+bounces-62713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FE4AEABE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8AD562734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F27217A2F5;
	Fri, 27 Jun 2025 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+HcB2Y3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804A16DEB1;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985229; cv=none; b=sOLW8Jd+23NQas0oaAidKA3r3h0vDfn65kcgND2e8bV0PmUBmv/UHEA5uQL8ZNuEU1abnMknrc5OBaIrY/2Cq0cX9ULF8M9Rqq6T5dlQYijYpMaz8QbPaAqxtrkzN/VC7GZ0HEefO3f6q/TL0sVZmMF+sm/mBzv8kDXCWoa9bQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985229; c=relaxed/simple;
	bh=N6BtiYtAE91IjBviDHOKuD3lvCAmE+hW+1yotu7D/9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cv3Yw0dJINb0PFf9BoLNDVoGtGKCIUCrwo1yw8pe/dxIIYvSTnOtnpHTo4TQzhRagbGilosVitNTi91fuzD8TNQprD1QRDN8XIZLWa+oO1zfa3P9BTxDMJc24d7LTBqlSSWc+gGDJCdP1UF5vGHExDRThIWsxpZST1a1bWQER9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+HcB2Y3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B1EC4CEF0;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985228;
	bh=N6BtiYtAE91IjBviDHOKuD3lvCAmE+hW+1yotu7D/9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h+HcB2Y3aEPv5xWqHZTcTioJJpF+LEjGSG2p45BLGMVfee5HYtBrACShOt8LDtDAW
	 eG/scDecAw78231X0JNk3lktihknlZBwq1I8lOVueVb7gNjm+1pvPq+zzYq3nBugTK
	 awtCgU5rmsE6CHdBv4la7Tyxe/GQxrlI6jPurORwl9fkZYCvLQZYC5jLMd3tH9Kk2v
	 TfsysL8odTD389uqTpfmi2PXxmEYhj+PDw9mRzg6X6lOgU1aJEyrr3MM7r7Me3si5X
	 Q+gPWA5JyBuSsdKUgNp2z9EfgdqZwkuQ5gVrGpxA0/AXvyg4bCC+UdJR8SUDtx+tq2
	 E5hQmMmxVyYkw==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250617080401.11147-1-johan+linaro@kernel.org>
References: <20250617080401.11147-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom: m31-eusb2: drop registration printk
Message-Id: <175098522832.106297.6161787629116315639.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Jun 2025 10:04:01 +0200, Johan Hovold wrote:
> Drivers should generally be quiet on successful probe so drop the
> registration printk from the recently added M31 EUSB2 driver.
> 
> 

Applied, thanks!

[1/1] phy: qcom: m31-eusb2: drop registration printk
      commit: 2bff9083c1744dc8751ddc0844a65e3bee89f519

Best regards,
-- 
~Vinod



