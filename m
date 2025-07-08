Return-Path: <linux-arm-msm+bounces-63977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53E8AFC4E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 899B17A6487
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D73429B8D8;
	Tue,  8 Jul 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtwPQ/4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E6629B22A;
	Tue,  8 Jul 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961621; cv=none; b=NPIYlZBQyC3xWw4eARx3Tx1u4PTVhXXU03PvJbIwFvCondMi1W9ujlKFgWvwJxKplrPKmAcxl8Ss7lkFDIrmSYZ3v86ji3w/hi/vTu5E8qLpABQXSFL12TyIcKupKhXyyLZ4qzbZGAuOw/YHQ/+vdSm20pSEwBlbjmTRvgs8Sn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961621; c=relaxed/simple;
	bh=BMM3sJt83heGjNOVvMoRv9MYBKN9oMoy7Zi25giJUiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrXQgHmwsS4YH8d4tts7gax42oa3+p2CSyo/+dWKZY7CZJO8zKbohM3mhjYmHckQ+SRaZOyPXmgEqFQwV1pbmB0cgrXC6BOexc0FSC2MjhYzCFyIKmMUysO9u4PYHVTmwQt7GUG3TIGB//JCMTJX2V+UU5eW1bPGGMaSGlibkDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtwPQ/4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93A3C4CEED;
	Tue,  8 Jul 2025 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961620;
	bh=BMM3sJt83heGjNOVvMoRv9MYBKN9oMoy7Zi25giJUiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtwPQ/4nCU4ueeB21szlCSRckHZT4lQp4nKBB7iPZaxV2fVHxcgBpe24TpJF1vp7J
	 pI2b+xLU2pPhwZhjdiJJLd5ZyjX/QcAb0qOf3CIwWohvyfECWKz1bMv9j3BB7OIfOz
	 CBDTV3hQayIgAD4GYLwbfPp5YpHEV+Z3kAUsnHGJPTfI89j7PhFYR0mSJfo+RK7Gk6
	 ksakrXkzyxzQcR8abjkWGYNhqa6UUfsa9828IK2aTBBRMCDiaO71S4imv6blzjTbfA
	 TgFjJHz51C07ViHXuqj7NnN1TmMnnxKmie1mMxwjoBlxXK6SKk9CM3Uurr62XCRhmA
	 LTW1E6EhpxRFA==
Date: Tue, 8 Jul 2025 10:00:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Document the Milos RPMH
 Clock Controller
Message-ID: <20250708-industrious-spry-millipede-862c15@krzk-bin>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
 <20250707-sm7635-clocks-misc-v2-1-b49f19055768@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707-sm7635-clocks-misc-v2-1-b49f19055768@fairphone.com>

On Mon, Jul 07, 2025 at 11:56:37AM +0200, Luca Weiss wrote:
> Add bindings documentation for the Milos (e.g. SM7635) RPMH Clock
> Controller.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


