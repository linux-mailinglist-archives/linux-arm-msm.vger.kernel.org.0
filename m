Return-Path: <linux-arm-msm+bounces-34884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391569A36F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5C971F21AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABA5186284;
	Fri, 18 Oct 2024 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9ymb7Vx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC30183CD6;
	Fri, 18 Oct 2024 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236062; cv=none; b=g5eNqR50RgYtMfW+68NzBjNaxcJiKoIxCHf+ho+3+nWPdNXKDWfeAZbD9FgyCuqFeTWOdbrF0AT0UxrJkiaGHGMdSZgsRiRB8LE3ws7G5hZLpA7Y+nQCbK52wzDXX6qiFPVqvaRUoCS7hOINm4WKhjcIV18NSrcit1QHA7mn6BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236062; c=relaxed/simple;
	bh=MJsF8Qn96LigTbqdKO51+No0BVUpHqlfSsJKebmL4t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFXJ5nHfg2ovsclbDsTzloRNlxBet3Z26We7ITrmkp3gIIpIEm5U4lPxCZRJXQH3mVQXwfj2yOq9qcbheSNKtWx0BVPuIbxhWiicNPNF2utLi2hEmlnA81RBDUhJXCPjGhYEQl1XuhmCORbM7Ive5CUWtx3WTG/Mt4iPRmzCvss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9ymb7Vx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7F4C4CEC3;
	Fri, 18 Oct 2024 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729236062;
	bh=MJsF8Qn96LigTbqdKO51+No0BVUpHqlfSsJKebmL4t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9ymb7VxYjCm+ZdIGRJVM4YdopP57NaXGftocP1XCnfsUuYH18RJ8ZfOkQw7Ffodf
	 YNxIraRk3LAQgCTLijLQbiHACWjFJyRpvp54z+PFOAVzLvGR400xRNN4Hkgi3+iEU0
	 jDRp+0bPguP2Cm720hL8AmYaor8QDtTy+cBzwuhjVcZQ1FDW38Yvsv+h36ULP3+U00
	 ZrIDkwZt6cZN/3WzDGetriSsvvzbcW1ByLScj/t3Pu+7N0kt+p55YRVsVvTNJ+NQTP
	 OwZdc5Iod3pwvfDFHR7X6S43EXUUKDtix4Wuo0jaKJ6FNHYYpgGEnBtuVZ6LcFubMW
	 +TW0i4rwQfbLw==
Date: Fri, 18 Oct 2024 09:20:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb: Add
 SAR2130P compatible
Message-ID: <7o5rxw2erm2dryipuygl76w2mdyuvodiicn2pxxhh2glhykeej@nhqsbtoksjxa>
References: <20241017-sar2130p-spmi-v1-1-43ac741ee071@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-spmi-v1-1-43ac741ee071@linaro.org>

On Thu, Oct 17, 2024 at 09:14:03PM +0300, Dmitry Baryshkov wrote:
> SAR2130P has SPMI v7 arbiter. Although it has only a single bus
> configuration, use the new bindings for v7 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


