Return-Path: <linux-arm-msm+bounces-73201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E2B54082
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 04:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B796EA047A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 02:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0349F1F2371;
	Fri, 12 Sep 2025 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGMeQtrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76D74420;
	Fri, 12 Sep 2025 02:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644716; cv=none; b=pu6Pk+VedGoIIlzIxNFKmXfuFtr+u6faLtzrpQCXAPe3DLEVQ7gKQ1APtfm2RV//PjUqgLrqUZCwG5I+M7nlnbNVXMky4StQMV+3krfrfmXeVj5OrFXmeZ59onbceF2HDawvhRXcsJE3ygk22uRPnKivr/Xaa6Dfte9AQqLWsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644716; c=relaxed/simple;
	bh=FzNr6jU11BYOrsA8fEAsDsmuFN8EhcezX0jnKLLVtwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIqJfJJUVrb/axhYxCnMVSsSqGfVpJo60/adV8COMkmEDz59Urt1qXOADSQy95Ilthv8smxVdtJtTqWXUdaxTwJYS8+gtKfGZCX8KUq6+m8gRVIgta+go8XdiHIwZkApn7Omb4dUPu1PDLOj9ry3vdxY4EIzCYZa2/pTQjFiusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGMeQtrL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA55AC4CEF0;
	Fri, 12 Sep 2025 02:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757644716;
	bh=FzNr6jU11BYOrsA8fEAsDsmuFN8EhcezX0jnKLLVtwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGMeQtrLDpVVkEPnxT9DlRqXJ4RDsTViTxZX85bKmBIJKd1PHDI+nOyjybLqrNYB/
	 elor/cPRgfJOAZi84IQpIn9YMWmTAxvukKLR6zGVSx+KA6pXRo9Myrx/j2re39m9S5
	 zKptGGaa0r9vCR5GWePuRYEAAZiXuwMaDOiEKNK4b/HEcCNITFu811OFIXUUvXpx4+
	 XMsGd3FDxQjGR7XRb8Jg+rQXo3asURhNqq+yYotxU5JNal0u5zkzBeag1qAAbkmmQa
	 zCxnKFbL1wr/7L4SjDfFkWqCQYyoqbjWlk6gvVOb8k0AZNUsRy3K9PCblVyuNeT/Qa
	 j4PkI/SAtvBXA==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment
Date: Thu, 11 Sep 2025 21:38:33 -0500
Message-ID: <175764471183.3066893.2385641952524635282.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250910134737.19381-1-johan+linaro@kernel.org>
References: <20250910134737.19381-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Sep 2025 15:47:37 +0200, Johan Hovold wrote:
> Drop an obsolete comment about keeping the PCIe GDSCs always-on,
> something which is no longer the case since commit db382dd55bcb ("clk:
> qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state").
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment
      commit: 4ca6a89f38718d6cd84304e6a26e7ddc90e03356

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

