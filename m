Return-Path: <linux-arm-msm+bounces-61051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE3AD667E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D94C3AE1DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912CF229B0D;
	Thu, 12 Jun 2025 04:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA/CU71+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE53227EA7;
	Thu, 12 Jun 2025 04:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700864; cv=none; b=dUaLEapUKkyZRD9mbeY3XDGEM3lKIQWC5k62Y+3rU6dxJsXCn0pLRM6nkZchhSBBJsD4szs2SNHl15JMOKVamIVKIhCrr278bY+B6M68KRf1chplgpLa+kFewopODz4X5vXXH+banUri3qRK6s/5q/K32ma5EKSoQUTOQ/hQbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700864; c=relaxed/simple;
	bh=agqZ4kwIFiAfv2mknwnH4MYpFMkhrcT3U+7UIHs/KXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTNCHZchzDkJ71mcaNdcnUuitxIbarI2lQQWROfmT3ma1a2x24M6lP1HZMbgM9Abv1+ypaqtHjwkkItP1aLUZy/+8DmDM/dXcCcksKUJbaLEpR4n28g42PxOOAzDY8vszZIOprs9B5scl+JQyNEvaHKbqPCU9TRtru1T4vJ/MYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA/CU71+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20D8C4CEEA;
	Thu, 12 Jun 2025 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700864;
	bh=agqZ4kwIFiAfv2mknwnH4MYpFMkhrcT3U+7UIHs/KXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fA/CU71+pyTlGOV9ThEDbuPOU4POnh+yIqgxUrTr5qtdHSxfL9GyMuqYza/yOcFDR
	 Pgg+I7Gg5eOpUWM/c9uGy9ex+q80bZP0lX1mdx6bUAG69Hiy9CJfViamZD/M3mzeZZ
	 TrknE85gBwtPmCK2d7ewu/1A6RALU5NvabNUxew79Yqafoa6mZ6qm6wpk5mOtWHbsc
	 036mQ5VzpBanrT4yaZCvstQgteuL7OdjxfvggMj6P08uVAD+Q6bFCsjpWOj7AGTui/
	 cyi955Ivh+ADidaM2Mo6aQQNT9t6HW0MQxUDJHYIUFiWFHMMDW4Z+iAZM/toj5geJd
	 9jXS62XrQ1qnw==
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
Date: Wed, 11 Jun 2025 23:00:44 -0500
Message-ID: <174970084196.547582.13141993457803698213.b4-ty@kernel.org>
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

[4/4] arm64: dts: qcom: sm6350: Add video clock controller
      commit: 67081281bb0dffd09e5f11c991088e6ac546a4ae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

