Return-Path: <linux-arm-msm+bounces-57759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C0AB5DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365A7189B9DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541BB2BFC7A;
	Tue, 13 May 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npmR1eXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208641FCFE2;
	Tue, 13 May 2025 20:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168943; cv=none; b=IP/uX8ErMoPVMiz7/ZF/fTvjs+ocbQpvoE1CUyYqt8HKA2NUIpQDZGLLHMOZxX9N4Ff/b6N35bMLaD3KwbmGjFbqYFZMxv7UZdUMbSFqaHtCiPgvfa9yMdC69NSoclCKPwlZicGvulihV7qMZLl9wppqFu3LAzoukQxYq6UFLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168943; c=relaxed/simple;
	bh=VsYhnwU3HDJy156Q7aQk2LJpAChRBes3GR8H7yXnH6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izEf1x2VkQIdC6u0AGT4Wk0qChiMdueVtc6hhRB90ZcmvSPaXuGqtgwGhkR3fzIrIrY8E5hDj7pi0qm0maO9Aka4vUYGQaQ8pik0UVjWuG0Sk2Mq7syzCpeYSARfvuVqc1H6/m9dnXR7pLziemx2hif5OABRWh42BdBYxq0kcvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npmR1eXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A451AC4CEEF;
	Tue, 13 May 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747168942;
	bh=VsYhnwU3HDJy156Q7aQk2LJpAChRBes3GR8H7yXnH6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=npmR1eXWa9VMN9VX2yYW0Dw7sE0Leb1h4nsvmiuV9Y6QJsJIW74+P64d7PEhGmftA
	 gsXNsANKDdJbpqznBHXpsbomBIRgVASBAmxVQS/1BQ80Uhu0r/3kEkvXydPa6Yj6rG
	 qtwLgQGVLFAj0j8+48K9iCRl8Plbf1uoIlzsATGn9vwXQxyCMBjUPD6lBEhBugZpyp
	 HPsECq2Q/GWcDJu5vztsax0iMi7AdcV2EctSvIHq4GrF2c37lIPtxFX/XKaJ2JAnJ4
	 3yTucw7VbUtqilwEohIHsY+qmAHC2rA+4+By9GHpYT1D+hvWyUdqeHrH3uIpiLAiyq
	 D8kIg+YVONXqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8150-pas: Add missing SC8180X compatible
Date: Tue, 13 May 2025 15:42:11 -0500
Message-ID: <174716891498.3696994.12462267803258694149.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428075243.44256-2-krzysztof.kozlowski@linaro.org>
References: <20250428075243.44256-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Apr 2025 09:52:44 +0200, Krzysztof Kozlowski wrote:
> Commit 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and
> SM8150 PAS files") moved SC8180X bindings from separate file into this
> one, but it forgot to add actual compatibles in top-level properties
> section making the entire binding un-selectable (no-op) for SC8180X PAS.
> 
> 

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom,sm8150-pas: Add missing SC8180X compatible
      commit: b278981b5ac109e6f6986b20a5cb19654aba8f68

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

