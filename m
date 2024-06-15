Return-Path: <linux-arm-msm+bounces-22766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 740259099A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 20:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C51B1F22273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 18:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D273761FE0;
	Sat, 15 Jun 2024 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADmwGISo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E584437;
	Sat, 15 Jun 2024 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718477544; cv=none; b=jhxkGA8FGqAsJm+9qlvCmlNy/Nx/9pUgO03xnHQPZkOTgQozdarpxUVHcJZR1O/3A893fSjHChNRi9nUCLWWlzhuJ0/ICHRUkNsqTER9pPvGLRH026Q6o4aU0uQDacSsYu4ufUx3o81w0bXn1uV/laLB6wjWjGKTYgJT6MjrzxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718477544; c=relaxed/simple;
	bh=weQHfrNTmeruW4q8jhq/6GiMueMj2ra6mLv8mX/1y5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NyNHL/CZ2otK60vgSuepw4tV5+4jgymlhjX1yrxwqinbAvTTk+QX9KL7eLrUo6KTQvDQwFZmarS8rjk1gN5cBaC2EEuOg6ZI1GxQJEZ+Ont/VeYbPABSHbrkm6aowQ/MY04yXFFQV2FMyfxPi809+vJNOC9cYvQei3CdqpxUQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADmwGISo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509FDC4AF53;
	Sat, 15 Jun 2024 18:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718477544;
	bh=weQHfrNTmeruW4q8jhq/6GiMueMj2ra6mLv8mX/1y5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ADmwGISoKLJA18cSf9tPggPSGigFP6WsG2NNBa0hbxyPpe2badLizziBY/2OmE58u
	 8o/2bmj2Kmj65zwX/ZbB0kRhzq6iwC6jvMT8iEyUCso7CjNPfPjZtg1oE2ulhOfQEz
	 OrN4Lzbn+lpQ73hKbXNUu9Ey0vHlJgbpCT9QxsLLP96IyWVoQxQv25TurUgsbH+awo
	 1LMSui1yRTGbmnlmpn9sDpZaz7DWghoMy35Ub1Nc79hbjd3k5dqpsEUzd9dWgLXwlz
	 i1/bDsPveFY9uzf3otY9UQ3TERdvYokYmIkbg3C55WFeXRZ7AEOBA8+rjie0h32+TI
	 lranfn0mygauA==
From: Vinod Koul <vkoul@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240417065454.3599824-1-github.com@herrie.org>
References: <20240417065020.3599755-1-github.com@herrie.org>
 <20240417065454.3599824-1-github.com@herrie.org>
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Message-Id: <171847753945.716119.6840883875722992838.b4-ty@kernel.org>
Date: Sun, 16 Jun 2024 00:22:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 17 Apr 2024 08:54:54 +0200, Herman van Hazendonk wrote:
> Adds qcom,usb-hs-phy-msm8660 compatible
> 
> Used by HP Touchpad (tenderloin) for example.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
      commit: cd13368db059de22d27e86665a378aa2a388db85

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


