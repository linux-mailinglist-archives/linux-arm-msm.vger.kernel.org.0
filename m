Return-Path: <linux-arm-msm+bounces-27879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F2394736B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 04:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D07280F95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 02:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DD22BCF5;
	Mon,  5 Aug 2024 02:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1p/9wdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3417C;
	Mon,  5 Aug 2024 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722825736; cv=none; b=e4JvgB14I+TqHlRtly5Wkwu8hXMttVxTTom25KMvJceF7E4B7FVZFs77i3uNZct6n3AXLcuEQ4ikKaEv7mRLV/rfO74ogxu+zu/SZu7RsJewabRyCkbS9fLaiHmb0TJdVYDdd4Fb1S50VNMJAlHMMKn4jVHsRRzvVfu6nhANHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722825736; c=relaxed/simple;
	bh=12XOy2wgtmbpzD7RadOV4T+VYpKQWrb4kS53AkBey3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hgiwsmYzIxK7fb8OOLN+ueMzAUsPwKWHDok5/30C8fTJcIcEpfKp4YKaU9SmGh3dpnVyI87EOxbd9AV2ln/MagCocaocStGjKeF3sUfCTvjuUr8kTaL9mhZY5te3W3n8yZasAYTKbjcINrYjpa//lKb09yo7Byvu/ZYGkGhORYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1p/9wdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F324C32786;
	Mon,  5 Aug 2024 02:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722825735;
	bh=12XOy2wgtmbpzD7RadOV4T+VYpKQWrb4kS53AkBey3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1p/9wdnwzYtY1Jes2FIHCVc1GXgt4SucEu5FlyUG9D8b0qcgo/9yxu1kVbm+biUX
	 3aapV9I5IWtfojYwoIfRpPTGrRw4FkL1FJRG9kmiMlANjiPpc2EH/mliu2gIA3mn5M
	 vOCfUcoiFucmW1CvzhriqMl7BMCAsP2BxUThIX20Gbl5h2pXdpMLvS9uxpD7DfXTuq
	 T9Gc+Sp4AoYGPrwAam0yw3rSQXkWcDaoF5RmnuEalnWpjuNPVE6SoCa7nEVAHd0pcX
	 m2ezACjs14uIiSVsE5LDAZVyT4FQ0Anj6UiYBQkd1iKNghccHZclmbAfHjbUQFbzak
	 +YRp9QYtvCwcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_rgottimu@quicinc.com,
	quic_sibis@quicinc.com
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
Date: Sun,  4 Aug 2024 21:42:13 -0500
Message-ID: <172282573028.504812.10682247954914459705.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240708101734.1999795-1-quic_kshivnan@quicinc.com>
References: <20240708101734.1999795-1-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Jul 2024 15:47:34 +0530, Shivnandan Kumar wrote:
> Add tracepoint for tracing the measured traffic in kbps,
> up_kbps and down_kbps in bwmon. This information is valuable
> for understanding what bwmon hw measures at the system cache
> level and at the DDR level which is helpful in debugging
> bwmon behavior.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
      commit: dc8c4a8aee49e42cf13e32e123de127122dc516f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

