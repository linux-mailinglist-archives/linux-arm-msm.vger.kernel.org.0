Return-Path: <linux-arm-msm+bounces-57644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5EAB46A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 23:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B9AD167986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C88C292925;
	Mon, 12 May 2025 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hteDYr8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C022338;
	Mon, 12 May 2025 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086543; cv=none; b=fXRV8AzIcMKeYHU2Ct5sHKWOKfTxPQ+fyyb1u0Yrcd49AmzuW/NtUcY9R/CjK3umCy7+0CQza7EGauIINjRvkOQ+PfkOaJADKGAletq2ZfU8AshNLHvlLRV9RKcJG9xZPwJLr3/O5ldr6kkwRFg7gt/t50jfo1riBz1RCUocQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086543; c=relaxed/simple;
	bh=LuAOPUZgGmqT5sqplzTtEFTdMTPrEXMUaf/Wgr76LTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLkVojxUhdpHmhWJQUzOo8KT8fsrbUw54WMsGlhUNDqbiNy3Recdpm2kE+kcy+0TjheTM10OLDcjExz7l/Yxym6Te8H4KflxQsRH+WAhRGDeBuaV54jQQGOYeEXmxNllrHCcGTRsAGmgFvnIt6ClqFEGfCgUaDK/xLa9kOEqcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hteDYr8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCE9C4CEE7;
	Mon, 12 May 2025 21:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086542;
	bh=LuAOPUZgGmqT5sqplzTtEFTdMTPrEXMUaf/Wgr76LTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hteDYr8UbIqtSpmDpi//Sm6v3/BOIM97fYkz+iFZr8MUZ71/BwEmiAB0LKzKDko+z
	 iNCvoG7adDNx/4A1S8f2Vmb8oj4LdqKOpAJVTd8DSvuPW5S93d0FnHiMKgPi+ryPki
	 F+Omv5eWLtP0CO2jl6/f1P4nZjnMw+O1I+GZ4HebNTIwKW+GJ5y5znobdFedGhybVG
	 ZMiF/D041d17Yu+KaScZsO1FeOwFh4oHOA1U0k7RNzv1R4mgqV34LtL8CqaTsfg2ct
	 bvFs2N4VPLs0Oj3W+iwEyjDdnn3uLBzuBg9rBBc52S5OknRlJoCnhW/g46BYeB0CIO
	 oCnFUHJ8vbJWw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Add video clock controller for SM6350
Date: Mon, 12 May 2025 22:48:49 +0100
Message-ID: <174708642734.3671.5958647502216393277.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Mar 2025 09:41:00 +0100, Luca Weiss wrote:
> The driver for the SM6350 videocc has been lying around in some branches
> of my git tree for a long time, let's upstream it. It doesn't get any
> better by letting it age!
> 
> 

Applied, thanks!

[2/4] dt-bindings: clock: add SM6350 QCOM video clock bindings
      commit: b887afb9b2362b15c1ee5585df1fb8cf3a3384c6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

