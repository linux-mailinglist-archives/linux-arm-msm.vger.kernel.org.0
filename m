Return-Path: <linux-arm-msm+bounces-71442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0693B3EEAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4451D17ADD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA5C343D7E;
	Mon,  1 Sep 2025 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWlQE4az"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F847343D70;
	Mon,  1 Sep 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755979; cv=none; b=uxwVDJf+1U2NU/GJMkrtoFjaX5DH5rnwSPUpFwyOOUr6mH2IQLef7u2jYhACwrEd0qF50xkjxJ7BGh3bdYB6zQwJkvK/+XwbAcBvPq9bBtD/0jKfuYu5H0u/ZhiXM6GfjM7wHZSvWAp5w3Jj8sDUm6/FOf/fur6CMmLMt0PCy/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755979; c=relaxed/simple;
	bh=WTwK0ahTPbq+m+GSb6wsGo8Hi5NATVGhDJv7/po5B9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUfW9a0ACpblxFcNnXr70dXx9b/oluS+kZB+Xn1TTCf1VY7nkPqexYwVyjQgU1GATQlYUn1VXydGv/N79qRT5QXq4AnIkG549/Qt3j7kx+ZL+N45KS7++tG0tX4I/fUJEAQZbAhgNS0b1lDROsvOomHfNeBLauCwM9yLJ5F9hho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWlQE4az; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E8BC4CEF8;
	Mon,  1 Sep 2025 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755977;
	bh=WTwK0ahTPbq+m+GSb6wsGo8Hi5NATVGhDJv7/po5B9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWlQE4az6Q0uAwEnQvSBV6jVd0B8rxxvx6k+XybfuBu2EmYbwx4Rsf2Ys3q9BIfSa
	 n8KMlA6cdz9uZ37qdh5CZIlvACYWdcA3opSl/TwXvlAWvCbjthkYLTMEk94Mylprjt
	 2q7rrQSj7bQrmDwTAHkiwsGa659GeRyhGaD4/PkJ18QYZCPxPrZSEObq8vvUT2NeKg
	 HgSzDO40zpBAaPo80MmNc5K4XDcO/WeT4/qExnSUO+VJ86iAaj9V4tkQtTq1wzaAsj
	 id4u+ATTqF0ahV59WOdKLXKoE0TUNQDolw9Lqj7bgKudgK1gcJrpP9h9CPLkKLqx3K
	 rSYXOa9gGcGOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent data paths
Date: Mon,  1 Sep 2025 14:45:59 -0500
Message-ID: <175675595928.1796591.10482834995631170893.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812-topic-7180_qmpphy_ports-v2-1-7dc87e9a1f73@oss.qualcomm.com>
References: <20250812-topic-7180_qmpphy_ports-v2-1-7dc87e9a1f73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Aug 2025 12:48:15 +0200, Konrad Dybcio wrote:
> USB connector bindings describe a ports subnode, which describes how
> its High-/SuperSpeed data lines (as well as the SBU pins for Type-C)
> are connected.
> 
> On Linux, skipping the graph results in the 'connect_type' sysfs
> attribute returning 'unknown', instead of 'hotplug' or similar. This in
> turn is parsed by some operating systems (such as CrOS), to e.g. make
> security policy decisions.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent data paths
      commit: 3d7f446472cb0d9e0dbae0aa09f3647d5649c758

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

