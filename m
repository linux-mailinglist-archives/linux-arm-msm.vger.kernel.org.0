Return-Path: <linux-arm-msm+bounces-87284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EAECEFA9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 05:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23116300EE6A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 04:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D3322339;
	Sat,  3 Jan 2026 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoFAWFv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0B63A1E8B;
	Sat,  3 Jan 2026 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767414871; cv=none; b=cpa2DT2HMAAUPBQJ1P6XO9HY44BM1e2TZDkNxP9cT2k0beyTaTiulDkVSs6NsRbGM4TzDv/ado/Ed9nv6WBkoxWuncOBE/M6teIaDUlRDLk2TpE/8niuEZOkjRYcWM/fkVp3He5KqikjWBwOKBid5AIL8mHxTHSpuKBCZO3oxLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767414871; c=relaxed/simple;
	bh=p4A87N5ftzlH7YFKC1X2sdFtN5r6pL2CEkpBHwe3nWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pgxky2TBoR+ef0RLs9f1h5oqIA0fCBZzV0CuvHw3s+IYM+ByK1ou8WQ3eGtFxyIMr/ppNtv5IkEnvHKiQ28bDI7IHGhyqYzqyfrJreqV8Uc3/SpI/sdU0ptj0AbS90/R7TdwU+qlpRHFd3Re/zEMqG+BtMqqWcSL8KMFzxwJwxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoFAWFv0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0CFC113D0;
	Sat,  3 Jan 2026 04:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767414871;
	bh=p4A87N5ftzlH7YFKC1X2sdFtN5r6pL2CEkpBHwe3nWc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FoFAWFv0lY+JVohu01zqcCw8tuwA1uHc05+YrtEMK13FmWN09mrTGtnGwBcFoUY9Z
	 OD1SD1GxaH84HSesyeIvKXu8qF9R3gqoaTyc4kFECH8n7SfmgJGRTgJ0VlE7QY+MUL
	 gcVEvSZvtsqsEH8zLPlndtmFrIYrvxi3Y2wcqOTO+XShu+VaUZPd4e8hpBfT47Bs4a
	 cgulWgrF8Q6ar3V2V/W+0AY5LgjOiPjtk+UjyIEz6unA9J9NcMJIBY+4blcBN+lNVn
	 J3HBE+5EtTDrSeGpzYjm/GaALsoQY11LPmZgZi8ov+Li8lpwtKXTZyU3sLJs5JwAng
	 k7JjYLrX7fG5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 22:34:26 -0600
Message-ID: <176741484218.2558240.11360428266466272086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 Jan 2026 13:50:31 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
      commit: 9c252f3c8f390fae4ca09de36c9262a35ae88ace

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

