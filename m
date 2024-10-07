Return-Path: <linux-arm-msm+bounces-33394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26A992F3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E61931F23EE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4754F1DA30F;
	Mon,  7 Oct 2024 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlBxMPKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185281D6DA4;
	Mon,  7 Oct 2024 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311186; cv=none; b=aSUiPLEec5oC+9ktlsk9pppetRle8pDg9UxUul2fIN50/153+GnPNJWu4no4bW6S3FqPeLLPVaNGuBWN71VO+3cRa/91jeFPOUnZdU+7NP8AomMYcoG+G2rskxX3kBCQEB9WVb/ROb1YnRkf7DWdUrNMUjFv3scExNuLxWVN1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311186; c=relaxed/simple;
	bh=KKIDtUlMp2k5s0UfKHtnjNOeeWofsI66GRt8V3jnYwE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEsDbXRPf5OGg+JEUpNQLYJ5H/NDam+o8g9Qr1LGgeJdFlVlnfxPOOpM7gD3upz+zrHuwpjIC67IRro4J8EKq4xSQNNoSD408bK0K9mBtD9ipr8bNjsyriwd6/cYdSo7oc9vmJSl53dJ3Yi9gdXBn+fCy6aqPRdLkJlgu6fXFaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlBxMPKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6302DC4CED2;
	Mon,  7 Oct 2024 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311186;
	bh=KKIDtUlMp2k5s0UfKHtnjNOeeWofsI66GRt8V3jnYwE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RlBxMPKmokbjAUJmfn7A9qhT2xSg5O9ab2UbEUjkZzA7fx5LS3QNSR8NAyHR8/K7N
	 YCOKLNtyqmMorHeJBF5BeHoP/VfRDxR4GFifr9SgRtoL/J4KGNh8llRPfewaPtSc8X
	 0p5iNEb40oaeDlAdcJ8tB39FLCOSfGt0Qgmate2mUdiglZNalRqKtft7rH2weQ6CSA
	 4OGTW3WjxiWxkzqoQbrOC5iAbZ+rUEppbLDWkXuc1QawqcUMtv1G5E/wyGxmRNYrEj
	 5iptO0MHMnV9j5dUaBgbQrJ5EKc2rLCuaXX8PkVfYgXcfLLu/tJ2U55SPcdiUhqn3L
	 r800XhfSCMUkA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: constify static 'struct qcom_icc_hws_data'
Date: Mon,  7 Oct 2024 09:25:58 -0500
Message-ID: <172831116174.468342.15353264537833431485.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905150235.276345-1-krzysztof.kozlowski@linaro.org>
References: <20240905150235.276345-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Sep 2024 17:02:35 +0200, Krzysztof Kozlowski wrote:
> Drivers and core code does not modify the file-scope static 'struct
> qcom_icc_hws_data', so it can be made const for code safety and
> readability.
> 
> 

Applied, thanks!

[1/1] clk: qcom: constify static 'struct qcom_icc_hws_data'
      commit: af65ec1a99233c3610481f410b8ff3f231005d2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

