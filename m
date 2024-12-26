Return-Path: <linux-arm-msm+bounces-43434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE309FCEA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA293A0361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A9D1D63E9;
	Thu, 26 Dec 2024 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKqKsgC8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C31D63DF;
	Thu, 26 Dec 2024 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252748; cv=none; b=LaGCSTuzl/ED7s3eZxKZH4YAG/LiKFXwiCz4YeGR9I9r6KebEYs309qp1wwMjKmRQIzA2wAQ4LlZNMKF30RAPfS836QDKURce9Y5drkHdgn3PsHBuI8WbO4dnpOjXojm3oTgG301KHuGie+0wt9ex7A+my1uQhkRedPAsZRIa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252748; c=relaxed/simple;
	bh=+2e40L4naeHkPBU1a9Pkqe/W3ex19iNFNzjK1/IFaEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sk1it+NsxgagPacNnBTwvpRGe1IZoDCwytW5ce0OhCBKcjyUnNog1pmsP9l0P6uJaLVP6SG4ZoOa81xTF/YU2ndakcHp/8ri/2o13MEEAZwuFkVfkc+DojOjm+IWB0ZM3m+IHx/iUzXK7JRZZe4jBjwWMx6nXOsyv1Iqm2ywpuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKqKsgC8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C346CC4CEDC;
	Thu, 26 Dec 2024 22:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252748;
	bh=+2e40L4naeHkPBU1a9Pkqe/W3ex19iNFNzjK1/IFaEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKqKsgC8fEZeM5iVSZQ20UBGeTYyTJBFpL6t98cTGlX6FXzGbfRsReHsJd1+qHep4
	 VazZPabKP5KS8TxJct7Hb30Ovxi8ie5dMsAwQneVrCfCIHdyFYRDqn8etIguv18GcS
	 ljz017BbYoYg6mtzwuLE/6cTzUc1GQxjsGnW3kgLFh224xDTV+8VBM4RaSJbZ7tSq1
	 GyK0cP4tUy83XidFIpLGS8Xxjc0IVeG9M7O9sjnM485lVGClriM0JLAtzThcZgHjgA
	 +5SczRrhCrxVQ8V4s+GGF+H0rzkAzn3OzWNCBe1mPIowFtWnM8wOQC0FG0UbdkZYgN
	 MJNsysTHOVv0A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: smem_state: fix missing of_node_put in error path
Date: Thu, 26 Dec 2024 16:38:38 -0600
Message-ID: <173525273246.1449028.16739092974223949443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240822164853.231087-2-krzysztof.kozlowski@linaro.org>
References: <20240822164853.231087-1-krzysztof.kozlowski@linaro.org> <20240822164853.231087-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 Aug 2024 18:48:51 +0200, Krzysztof Kozlowski wrote:
> If of_parse_phandle_with_args() succeeds, the OF node reference should
> be dropped, regardless of number of phandle arguments.
> 
> 

Applied, thanks!

[1/1] soc: qcom: smem_state: fix missing of_node_put in error path
      commit: 70096b4990848229d0784c5e51dc3c7c072f1111

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

