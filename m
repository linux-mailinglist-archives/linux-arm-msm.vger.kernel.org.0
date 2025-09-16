Return-Path: <linux-arm-msm+bounces-73780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F54B59EB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 19:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6F313B972C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3AC32B4AE;
	Tue, 16 Sep 2025 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAr9KmIX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18232B4A6;
	Tue, 16 Sep 2025 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041917; cv=none; b=dlXO2tK9Lycm7+fWVDrUDLL/HicBJP7XXIoRs9CP90VN0t2XLEpRK9yqiqyGp6EigDVw8jOjtcDE3KwSsr0hS3QHVUyGGbZd5yYYPQ8bkO8wRrc8V6SENoci0QhgXCPnd62D8RCAkZ3YwK4jN1AGY3lxRXqTVad/w+wVzPoTXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041917; c=relaxed/simple;
	bh=LiYxK8nll0TpWm1ejg57wqhRd0MPVNxpvWalgJ0nXbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXOr81YpuUOBVEqP7VUnyYfqobXndwTePEkyDDeTq8+miTOB0cu6akUxmkku6ar0bpRyIZgZoBTwfu41BCVb82cvv+RzyvU4QaH28fl5ipabTYYnUdbHwnQ06ABO5v+sLCe9JJBN8KARsTYgM9rgEHdK0pJFcJ5SeXG5J/ASdUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAr9KmIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF005C4CEEB;
	Tue, 16 Sep 2025 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041917;
	bh=LiYxK8nll0TpWm1ejg57wqhRd0MPVNxpvWalgJ0nXbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iAr9KmIXQwQTNyNRaYWafrtf3s/XzRc1qHGBzgcqaPMR0DvEj1ZdolARjM9Cq2jWw
	 C4lwjlHkkQwRWP52FKTTEdG4auJ1e19GtqKFeynhtA4NYOI3sDxyiviFq2NAPG2xNr
	 TwYTzepz3TTFbtCdjoGn8qwcRy4gaapjrX6wiQ5rTIHxxcp7A+rEhBh3vOmnSnhUZi
	 E6vHuYy6TV7VfZ0HnAoWoxiqbblyinNSmhoK5K9XnugFctrgfRBK7PBxT7hL2tejdJ
	 Vl7GZ2vjWfgwrir0glOYfJPCRWl6oPYPJyuRc4YxWt1cEfqgwCCTkw1MsL0Oz48la3
	 XXiZF+LhK58dg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: enable camera clock controller by default
Date: Tue, 16 Sep 2025 11:58:20 -0500
Message-ID: <175804189858.3983789.4710371695290345842.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
References: <20250909235547.787396-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Sep 2025 02:55:47 +0300, Vladimir Zapolskiy wrote:
> Enable camera clock controller on Qualcomm SM8450 boards by default
> due to a reasonable agreement of having all clock controllers enabled.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450: enable camera clock controller by default
      commit: 520f9fec5d6f5a23e7985140dc4dd9986f0ed140

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

