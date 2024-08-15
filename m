Return-Path: <linux-arm-msm+bounces-28703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 011B9953C06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F601C235D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4417B16F8E7;
	Thu, 15 Aug 2024 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRgTSeiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1835C16F847;
	Thu, 15 Aug 2024 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754499; cv=none; b=Ix/FtS6rtJWacKFpdqBO5mmqXd8Cts7pvBFPzj2rlEtP76+6cqDgqH+WkfBEdx37lQNyNQEDlDoQktNXWuJs7CvjmJ6zb6wkqp3WYKRITsLykndWVs+mPmpxBKQfDiWadtuJVWB77hVPDn7V42dIe771JQeGtw2a0F/QrmpDMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754499; c=relaxed/simple;
	bh=KgQPOW7buxxvI4Ojf1vT8IHNswoBbOTrHD6M46wrIPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpoBmqX8FsCxL7YpFwHe+UJNlI7+UJ/dmknZAtElI8E6JEHgidffA3ooR9+akbp8azcmrKkmGn+kSqkdSqDcIIae1tZTwXFgS+Yo5us4uA1kZhKbyRi9rk/WLJcwwMTN249ThfKoWCLXzVHVKSi1h+80AehUQzjOwabni3bG+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRgTSeiY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05885C32786;
	Thu, 15 Aug 2024 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754499;
	bh=KgQPOW7buxxvI4Ojf1vT8IHNswoBbOTrHD6M46wrIPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRgTSeiYxy2BeusW52OfwrCKOvk0+libQkTfq65HnTQS9td8oBc8nTk9WRZoTrphn
	 ejGQCJPMINqjVnq7omhvQiwNEEI8T1KksWdRimKDmHpxtI+/5WkyNFlM4n93Dq0Kx4
	 SOuz44zk4USNPrF2dGv6eQBs8DiaOT8T3495AeTe4ZjVqW2Y7lEVklgUtXwUDd6iB0
	 La1raRxYnkvQA16fLTASBCkWBSGJHHGWop3kjsJNjVHuApVm/T2W0nWdhR3hcYzvEK
	 Gw3wZfMA1svdYEoW5sdaNsbukm2sGWbqFTZG74kXAJ/7diBGjuKdbqyeLmq1xUxxnd
	 lptmSjyxlC3Dw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller resets
Date: Thu, 15 Aug 2024 15:40:49 -0500
Message-ID: <172375444800.1011236.6892556236101392834.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
References: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 14:32:35 +0100, Srinivas Kandagatla wrote:
> Soundwire resets are missing in the existing dts, add resets for all the 4
> instances of Soundwire controllers (WSA, WSA2, RX, TX).
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: x1e80100: add soundwire controller resets
      commit: 8c7dbbed27723c4324c81e78fe239ce134aa8f58

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

