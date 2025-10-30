Return-Path: <linux-arm-msm+bounces-79717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2583C212B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7ED1A66D4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951DA36A5EF;
	Thu, 30 Oct 2025 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQ1LwDU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEBF36999D;
	Thu, 30 Oct 2025 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841370; cv=none; b=BIFSCWUwiP2wNEVBxdbI3U/7BRx9mGX102bAHiotOeijrlXaiKrgj+frUJeUn/xR52LUEFFgStMzD9jJ9iC2EOcgp1WquT55DcWU9+mbX+VX9lEFpzVQWHQoTs2L7A7nhGU/AtZGCiI1xRyjKAaQ4oVuaS3nTs4VpsP8jP8NwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841370; c=relaxed/simple;
	bh=esEDitFY+eKi0w4Fo4gIT8Pjk6G3tHQ/TLMDwKA91U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QoHhePHMi/X6MZaGgF6GuSgY01b/4v2EYfLu+9h56Xy0cGQgO9M5RyVOCyFfMd2MYDq51Ha6drQEO6YEQqwX2vuaMJJ4mCvsKangebVhLZwMD/GShrdyo4eQrQtnd+/h/PDdTlqZyU83Q0c6y2AerWNskNGSb5lPzrU0BCQUteM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQ1LwDU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA16C4CEFF;
	Thu, 30 Oct 2025 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841370;
	bh=esEDitFY+eKi0w4Fo4gIT8Pjk6G3tHQ/TLMDwKA91U0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sQ1LwDU0ooQQGNjoH1yFPuTjUPx/GFzz9Eu4GMY4zSZe100BTBNNIcFsH/+ygoMv1
	 dJ29mSidPPFguHAHKA1A478FDI/vvGHkYPpIevPWVPdb5OFUej4XhDER6pQfGw7AMA
	 hRueb9HNLJnqAB792aDq1QXfMNFzIxTSanGullV3qZ0OdK9Qjj2f4GkKQuUG6ufifn
	 og4Rt4CkP37eFwoUUQcemz5NuNLPj89GMXMxJAwYUnowBoJXX+b5KL9KC5fE+jAG3t
	 RKfgXGgf/x2CJXQrqOTr5+GoWwBCYw+QBNJilGEonbSrMZHTnxjUZeXfhCbP+JyknX
	 Y6Zj5LVeKNXVA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smem: fix hwspinlock resource leak in probe error paths
Date: Thu, 30 Oct 2025 11:25:42 -0500
Message-ID: <176184154234.475875.1842457668599794270.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029022733.255-1-vulab@iscas.ac.cn>
References: <20251029022733.255-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Oct 2025 10:27:33 +0800, Haotian Zhang wrote:
> The hwspinlock acquired via hwspin_lock_request_specific() is not
> released on several error paths. This results in resource leakage
> when probe fails.
> 
> Switch to devm_hwspin_lock_request_specific() to automatically
> handle cleanup on probe failure. Remove the manual hwspin_lock_free()
> in qcom_smem_remove() as devm handles it automatically.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: fix hwspinlock resource leak in probe error paths
      commit: dc5db35073a19f6d3c30bea367b551c1a784ef8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

