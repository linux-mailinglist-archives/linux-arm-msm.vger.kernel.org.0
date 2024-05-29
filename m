Return-Path: <linux-arm-msm+bounces-20862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA48D2A52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC431F266BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B3815B13A;
	Wed, 29 May 2024 02:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ek/w9WLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9C15B0E1;
	Wed, 29 May 2024 02:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948131; cv=none; b=uIwxYvGula5DYHpL+eN80U0TReoUojPjVkKzba8XgEddwd57Me/8vE92fV3eoKsnVz+dGvkNk/6D5lGDiFtFqoqhH0TCq7hfCHofz/lvYfYueRtSHLGBFZcz7Ud29DnczEhlLEagTLjEDP4KNAX/v0gqOKAeN87hUg7hfMeYXO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948131; c=relaxed/simple;
	bh=+uMsDt5EmxdOC/OHxLc13z5QE0dgku/alf9Xw/YyhJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahG81Yf8TR9EShrLfQJyZQ+5cbEg+1KtilS/4SYRWle3AkCTOKoW8fSNoGLgn0UYaboWCA0GahpTizocT7tVOwZpCGShQlwn84ltR5z36tIZmGGfzRFs1TjZ/CVNRM0DLrY5RbZqVwKnQNExgkpR4JA+h0U/zU+rila/AS/e8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ek/w9WLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63B2C32789;
	Wed, 29 May 2024 02:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948129;
	bh=+uMsDt5EmxdOC/OHxLc13z5QE0dgku/alf9Xw/YyhJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ek/w9WLGm4IXIUiYQov5MLxvm167sv5NlqggadCAZkaCCBGZBdvB1EcsYn7kqMwQP
	 /H86rKECRm632y03+mfQCYvTgmEk7PTcFT1C0JJWMSUas7InmKAi2LMAbhsEWqRP9q
	 XfT418MIbMEXJmXr3BUf4R3bp+TBkKUW5cseNcIk4aZT+a/99ukKCx2/TDCIDfnEGl
	 2/hqk0IsC+23k+SpHtooQcBnsD1Tdcsk6iaZLYnGPyKeKdVIFcGsOR63OlimLl5Jxd
	 ypYmNJIg0H9OdMzg+D26lSK0dhaGAalBF40Tc2/0voH2z3AZc+K6uA5KLAKS9dM9Vp
	 9jXcForm4FvEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kathiravan T <quic_kathirav@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
Date: Tue, 28 May 2024 21:01:49 -0500
Message-ID: <171694812080.574781.5750214161295750418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508-stromer-plus-alpha-en-v1-1-6639ce01ca5b@gmail.com>
References: <20240508-stromer-plus-alpha-en-v1-1-6639ce01ca5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 May 2024 22:34:14 +0200, Gabor Juhos wrote:
> The clk_alpha_pll_stromer_plus_set_rate() function does not
> sets the ALPHA_EN bit in the USER_CTL register, so setting
> rates which requires using alpha mode works only if the bit
> gets set already prior calling the function.
> 
> Extend the function to set the ALPHA_EN bit in order to allow
> using fractional rates regardless whether the bit gets set
> previously or not.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
      commit: 5a33a64524e6381c399e5e42571d9363ffc0bed4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

