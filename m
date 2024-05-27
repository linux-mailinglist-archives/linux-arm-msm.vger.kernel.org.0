Return-Path: <linux-arm-msm+bounces-20518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172B8CF7DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13A82814DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBAE13C8E9;
	Mon, 27 May 2024 03:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/roNF1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46970C132;
	Mon, 27 May 2024 03:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778881; cv=none; b=D7Bmdw5NonB5XTPmTJ1bAIlewdvzpINMHOmc/F7ZBR2SKXV3eLZASRLuXKq9Li7DGL9k4eN5yka30Q7kbmF6ELXFe4rznHleC4Zx7oRR2RnourVwkWqYeZd01jzmAdjmsiI+NfbbUqKJm0u76c8PVFgz5kEQ5gGVI30PGzoydZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778881; c=relaxed/simple;
	bh=flUijsb6JPO8rckrXhLA9lI+MOLleWiQCj5im32EopM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=admc7dEpWkFEOkaWZ/g71MclL8LjeZvb7QQzkpdVbnNgnQlOFCWYqlIch7nEVV3OMzSRfEwv17DFO9Xo5zqnoidUnp58eH5+NiuT/eE4SnG2nGVIdER1hRKXxCbmWLovcXCyKEjSHm482RcPS0b/4iQI9fHkgcasPVDHrjhpcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/roNF1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF7FC2BD10;
	Mon, 27 May 2024 03:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778880;
	bh=flUijsb6JPO8rckrXhLA9lI+MOLleWiQCj5im32EopM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/roNF1Y+u9OGBbahkWQ8+88wIhig4PkKlKd2NDsEMEBBEh4w6K4t8rE1CqaPvjcd
	 Ek1ZEeG4zP/xslZtbupdq40bNSPJnVn1p/LCjmQL0AfArcbhKGoMsaLfx5OT8WSqxS
	 M1WPMbBbq3DHP+vfiBw2wnFMq9ToFwu20c2YDVIPBaMm52KlZ9XnsqOjfxBPH3+Z67
	 hQrQVGv6Bt2YomdjBBLBwubvj6fkn3C0C50uHo7REbuciJJI7S711nL1afksq8Z6FU
	 mJNZOcMW0ElhUMV+GAFhdDVltCTst5SDlA3gzHCr2mqzsRvu/ytDBy3qSqyIUhsl5y
	 /4Zbfq+ouH8JQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakob Hauser <jahau@rocketmail.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [RESEND PATCH v3] arm64: dts: qcom: msm8916/39-samsung-a2015: Add PMIC and charger
Date: Sun, 26 May 2024 22:00:44 -0500
Message-ID: <171677884204.490947.12271016923376370366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424143158.24358-1-raymondhackley@protonmail.com>
References: <20240424143158.24358-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Apr 2024 14:32:10 +0000, Raymond Hackley wrote:
> The phones listed below have Richtek RT5033 PMIC and charger.
> Add them to the device trees.
> 
> - Samsung Galaxy A3/A5/A7 2015
> - Samsung Galaxy E5/E7
> - Samsung Galaxy Grand Max
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916/39-samsung-a2015: Add PMIC and charger
      commit: 6986a75d06a370b57811c79d269f1c014cbc7199

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

