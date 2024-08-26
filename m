Return-Path: <linux-arm-msm+bounces-29493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A595F32C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 15:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB1A9B20B57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 13:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B78185B77;
	Mon, 26 Aug 2024 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFk8WCMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03918454D;
	Mon, 26 Aug 2024 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679850; cv=none; b=VUE+eRpV1x8xIil4RQ6M0W1x0LHjyG76/yjwlMISMaRLLXxjIdDeITYW2KVycSiODKR5+GeFhayhaz28mLNoawNiPyf/OL1hNj0S5lDzprF4XuliHFscjl496qKlXuxyh0pp9fnCjm+J2AsRm1oFau4zCtNGOlZ5w9Nd6L8QU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679850; c=relaxed/simple;
	bh=iSh+FCPm8ozAsHn79mwz+0IjRqc5lg6/6WhfNiSSqbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlwR1aCLiXnB3L/o5Z6Sd/9MQ23xRO+CCrH7tyEAFX9zCYAvD2u2pcYcvPXL+YHPwD0WJn/sEDfTLtY/OtsnGANEnp7XJIIGnf+JuRYheh9RkijnZl4KDvzsrtNuzqIBLZLDJ3DVmUDcDIO8pR4B+0n4sOoGM05OZmiDBpC1e/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFk8WCMV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7DDC52FC2;
	Mon, 26 Aug 2024 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724679849;
	bh=iSh+FCPm8ozAsHn79mwz+0IjRqc5lg6/6WhfNiSSqbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JFk8WCMVWijA3Eie5EdyLmE3IkYEvHZrlDdIQUWjE1RCD96nkdJSNruqZZPG97YBZ
	 ELhU9cxN2tLeniRrlriq56kxkvoePYE4KWhqGFqScG9lIOX4NAwfJ+L+JwRCUmv2w9
	 nE3tloughjwoRo4eVzM+ls/7mZxnMCEKVgqJkDlRg8CZgtm919zl06wWUpQRsUg2s1
	 MF1Gs5vZB3EskGH0VAG1PdOSTNC02v6yqy62ef40LE8LwLufQ4SS3AW4g21SPVMdvE
	 efJrO1V48ROywlJob7YtYa2qCfe5yyWXRjDDu+fg5DUb6oQOmGXt1/Jb85viy7u8hY
	 n9OW9wD6eR/3Q==
Message-ID: <df107382-5c9b-4568-b9e3-5a893070fad7@kernel.org>
Date: Mon, 26 Aug 2024 15:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't use parking clk_ops for
 QUPs
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 2:58 PM, Bryan O'Donoghue wrote:
> Per Stephen Boyd's explanation in the link below, QUP RCG clocks do not
> need to be parked when switching frequency. A side-effect in parking to a
> lower frequency can be a momentary invalid clock driven on an in-use serial
> peripheral.
> 
> This can cause "junk" to spewed out of a UART as a low-impact example. On
> the x1e80100-crd this serial port junk can be observed on linux-next.
> 
> Apply a similar fix to the x1e80100 Global Clock controller to remediate.
> 
> Link: https://lore.kernel.org/all/20240819233628.2074654-3-swboyd@chromium.org/
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> I ran into some junk on the x1e80100 serial port and asked around to see if
> someone had already found and fixed.
> 
> Neil pointed me at Stephen's fix for sm8550 which I found is also required
> to fix the same thing x1e80100.
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Mind also fixing up 8650 that seems to have this issue?

Konrad

