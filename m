Return-Path: <linux-arm-msm+bounces-33396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5949992F3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA42282DB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0001DACB8;
	Mon,  7 Oct 2024 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D82OKvzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5F1DACAF;
	Mon,  7 Oct 2024 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311187; cv=none; b=cMiakV5xX2/ctvtHkUbcETw8iaZn4hMhCFHqIG+3NTd/4ixSahIQmDmTtMPMfEytIF0UG5WaudcAE9hhuODBVDEstp0pjBMU1MBsk6vGY2E6G62cj+GWkn6PFeMQ4D11sx6zYcIWxGXZXLvCNonSPlcgGV0Sh4rCwbnkKhwJrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311187; c=relaxed/simple;
	bh=lezOR42ihxRPVyojKwdkT8yuC0GYMwXyoKuEBH40Y2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUCrBk55wJ7qcsCj9LwmTTjwsmEn+PQt+4LAwc5KBvVi9vQmirGbbuvdCVSHRSvHtolU/UTCroxBHj63VQtJES44XiDYnp7ZrXpWlWxDZ9cO1bTThGIanEd5h+kDhbld1rsptdEuhDbHgptN6sCf7nqOUmedGnBWJ/MObGW7prc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D82OKvzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE991C4CEC6;
	Mon,  7 Oct 2024 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311187;
	bh=lezOR42ihxRPVyojKwdkT8yuC0GYMwXyoKuEBH40Y2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D82OKvzdIq3LJOQK9NOT3Yyz+CsJ/dPjP3yZ3Vinb7FJkomzes0brqbfWWMWXIDMh
	 90iwed555l6GOaMtZb/0jpdUlSetg/OWJTq9qGkmFMFey0NJOu77Es+aj5YUjC4GMN
	 s+La1kFRykxyq7jipOwt/D3tmtmkgCLXBUKiIKeDw7m1sJErXH1KQge4KL3Moi1jD4
	 nIlW7z262QcMUg0VGatGmgGfEMMLmhR78GFV2CGZVq5ajKhZgINXjRs9Q4FKhu4eSv
	 eLKpnUTBOITaXRz/Z5Lo5ZRde7dop98O6V/HYHtDzAreBGLg6c6cvpIlglSzA7GDKc
	 RfY2zm8bZ/Tfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: (subset) [PATCH] soc: qcom: smem_state: fix missing of_node_put in error path
Date: Mon,  7 Oct 2024 09:26:00 -0500
Message-ID: <172831116172.468342.625142624677266432.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
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

[2/3] soc: qcom: pbs: simplify locking with guard()
      commit: 6187aaae71ec236163d96601b37216e110bf7554
[3/3] soc: qcom: smem_state: simplify locking with guard()
      commit: cd3a3e60ebfe6f62ccf9d2164f6455e0b1ae1884

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

