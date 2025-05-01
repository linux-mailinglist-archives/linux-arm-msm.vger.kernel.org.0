Return-Path: <linux-arm-msm+bounces-56372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F3AA5F1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 15:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09A311BA7077
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 13:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58E817B505;
	Thu,  1 May 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl4GnDnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94252DC76A;
	Thu,  1 May 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105463; cv=none; b=RablW0KMhjyM4RFXM37wCgPRdke1OLmwdRULCDvEt1mcfSYHVnl6L2tx/3OLDvL1I3+57RooqXnXoJRQMbPjLU9XU9tBhnWkta2v/ZNVjWN61TOAmv4prYTAKG6dV1K9au10tWSHj1fzGq+vdCeghDTU4dIAIIcaNQz+PjyL07c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105463; c=relaxed/simple;
	bh=QtW8V05Ll5TgPFoRHUE1CblqZBs5rBw/y7zDbeCz2Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nenzTS3W1uIRkzf3GVlL8oKB44Dz5AacIgWP56Fl/ILJKPWuRlPlNAuIcmr7UuGLi2JUd20H4h2GOkD/ZMlOYh8UbIvTqAxVLaPEtGL/a3L1gEbhuRn/aEKP15xBsxzSg2LNvfhxBfWnIG5uoneCJ9mWi21ATFqt2lakO2DgFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl4GnDnw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72118C4CEE3;
	Thu,  1 May 2025 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746105463;
	bh=QtW8V05Ll5TgPFoRHUE1CblqZBs5rBw/y7zDbeCz2Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wl4GnDnwJXGlIGZ8fC5LMt1nsQT92up9CfvAsDJqGX0AZ/pSez6UWnMczBPvGuoU+
	 vJpRBXQawz0eZXmKgXOu2Tq/YZxgDuPeZmow79KAcR1JahN5qDmv/LuLKQbhMMfCS+
	 LJTiuotSAnjKbzRYkrU25861E6pJu8d28cqTYFUlAC66b1uEeJYG/iN0+0Mq3kCgQZ
	 2aapo/88irzFShq9xenYlP/GmqiMWYtnbkgsJb7ld6eWxYtIO694EfRe3zw2DtORNr
	 XIpfeePuaPPGbdQwnrz+ALQLLNDqCaEQ0T3b3ko8/jMdCY1QV9ggBZ6xX1YEDlSQaA
	 QBx3Syq6+lh4A==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 00/11] ARM: qcom: fix APQ8064 schema
 warnings
Message-Id: <174610545917.3855354.6995417813544260690.b4-ty@kernel.org>
Date: Thu, 01 May 2025 14:17:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Fri, 25 Apr 2025 20:47:00 +0300, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> [...]

Applied, thanks!

[02/11] dt-bindings: mfd: syscon: add qcom,apq8064-mmss-sfpb
        commit: 137d4ebdf6bd86ca6aa26ec4f9a1c5b579905c6c
[03/11] dt-bindings: mfd: syscon: add qcom,apq8064-sps-sic
        commit: 9f8af721495e04b6c3a3a5293fd8afa7e38bee1f

--
Lee Jones [李琼斯]


