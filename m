Return-Path: <linux-arm-msm+bounces-49358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20171A44A0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44366173E6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C75519D886;
	Tue, 25 Feb 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+texdWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149C19CD16;
	Tue, 25 Feb 2025 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507498; cv=none; b=ZwOfvWyotMpxul9cvLV4lAlvTlhvK+vQvlu+EQy1YEa/UESeoDFvCT3iY6yQMvmsx/IhX4PAqme6d3/pre/8GO7JrA8QNOUo1u+JqYt95DTUyKxLHqOLZllbXuWusYdV4Fly5e9CFQq/qzv/xtSIuXCtv5VaIJ/kRLRsfRx3miY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507498; c=relaxed/simple;
	bh=XajVPJNW1tQyN4EJb/RT08qArQ7yOIXcYudYQz8u/mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVBmuDCFf2E2Xn4JRN+qV/ZdAPdVo7z4OqRWZsEBNAl5eOxaufaVNXW9Y5RN4AanXNCMsSNhifwiNRkZlj2DSWphyhf1vpUCRzGrOarvea4hocl606t6S7WqZfixym19vVq5aYdfnbbW/16XENaenZJOPhMuiprtpuCJkx3QVJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+texdWU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8B1C4CEE8;
	Tue, 25 Feb 2025 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507498;
	bh=XajVPJNW1tQyN4EJb/RT08qArQ7yOIXcYudYQz8u/mE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F+texdWU7Siojxf3FmWdNUCsIkVhhLl+7T0FlEphR6VS3Oen/LGEkKa2iAv4u0Ch5
	 YCQgdwQh0fBg0TGwW5u9zIn5+2Gf17eLZcY+AYmS9oNi5PnGZ2/kCskqM4gT6gtKqZ
	 wDA6IybXRhMInyPUApaPSwb1P09F2oWe73HlHt6JyLljQAhQtjSDx2/7RGhFXQYAR2
	 uwSPv7Fm/Rj/ijwYavg13MWyf1TkGH96WX9I3rGBou1myXCpNlEO7aLHSdJ0zdauzh
	 xAVuTbNZKjKby8ZiDO6RfC99vJMfBOO+IsvBuvSEi/VbO+DoDZwFTOdjMqCgmN6CZC
	 z9gIhgdLzJO9w==
From: Bjorn Andersson <andersson@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/5] arm64: dts: qcom: ipq6018: rework CPU Frequency
Date: Tue, 25 Feb 2025 12:18:02 -0600
Message-ID: <174050748695.199016.17344226153838513978.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210070122.208842-1-amadeus@jmu.edu.cn>
References: <20250210070122.208842-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Feb 2025 15:01:17 +0800, Chukun Pan wrote:
> Changes in v6:
>   Collect Reviewed-by
>   Small typo fix in commit message
> 
> Changes in v5:
>   Collect Reviewed-by
>   Change the labels of mp5496 regulator from ipq6018 to mp5496
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
      commit: 144230e5840c09984ad743c3df9de5fb443159a9
[2/5] arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
      commit: a96e765a7b3f64429f7eec3471a2093355ab041e
[3/5] arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
      commit: 0c4c0f14b7d704bcb728d018a74788771dc9286b
[4/5] arm64: dts: qcom: ipq6018: rename labels of mp5496 regulator
      commit: e60f872c2dc4c1d9227977c8714373fe6328699c
[5/5] arm64: dts: qcom: ipq6018: add LDOA2 regulator
      commit: a566fb9ba8ffecb56c50729390a9ea076f5c9532

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

