Return-Path: <linux-arm-msm+bounces-43392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E122D9FCCC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0D3188363C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD4F1DB349;
	Thu, 26 Dec 2024 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYSHeaKL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B531DACA9;
	Thu, 26 Dec 2024 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237648; cv=none; b=MTewBqR/r4q8lDT/kM2SuFQqmGXnmW0nEMcqlfdYEEYxNJNBZXzlxMsqxl+yWGgt5zlh0x26sx9JzSnnyqFCINDreJSbxkz53DndGFkWG+4VvkW1wP7nGg1BVrnicdd0Kv8w9+4NDLbQnnCGU5hhR7uJsZReFYQVfTs7FPUgqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237648; c=relaxed/simple;
	bh=+2e40L4naeHkPBU1a9Pkqe/W3ex19iNFNzjK1/IFaEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMKRB6h2PvRxDp+gTlmLq7LlPljrCJg0OgL6jLc6fEfELoVgU3rjkbA/l/dZPfURnQaPobEY1/4USOW7BlBc2/lldYwej1Q4Ow0aYr77kw6Dz9EbTuWBWAXidZ2RJrfqlFYbDNBZZiHszyNHLSRy29y8i6BYgCn7hoEoTI9h3tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYSHeaKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF20C4CED6;
	Thu, 26 Dec 2024 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237647;
	bh=+2e40L4naeHkPBU1a9Pkqe/W3ex19iNFNzjK1/IFaEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HYSHeaKL4h1Vh5PHeFq8Yh1nU5FZUIeG7nNEK3e80E9NVvTm19ePaVrF0NvIbAeFr
	 wgBCGtY8SX0QSxnB4FYbOqxFoB+FOHYOl9rPpb3xs2HIWcUGGuJ3YIr4E27BLSSrny
	 MTEMKzKuKglGdubPRj8NdgWJl6bnhyqrV+BAYzZuZqdXEiXPIXvMHii1tnTm4oaHX5
	 qNhc0aoIJesGR5mPt4Enz5IBKfJZkqXv1txK/el3mg8lCuwOuuik+YAKMwAex1wNXh
	 EN/WB28qOAsv9DsDL7CCWA65nS4g1u0ZumQCYQ22zemAznywncZmHjfCCaq1ozXwnd
	 4YC0s9PznlSgg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: smem_state: fix missing of_node_put in error path
Date: Thu, 26 Dec 2024 12:26:45 -0600
Message-ID: <173523761381.1412574.149245417812403082.b4-ty@kernel.org>
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

