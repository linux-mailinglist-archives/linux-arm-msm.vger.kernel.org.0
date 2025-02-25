Return-Path: <linux-arm-msm+bounces-49361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C1EA44A0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06BE07AD049
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB411A01CC;
	Tue, 25 Feb 2025 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcA8lrP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A31ACEAF;
	Tue, 25 Feb 2025 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507502; cv=none; b=uAh5W4Rq3QVbOYKKvew3jMVTD9Cw4GwfmTFzFmX0A/oPty26VP8Dkxt4FIO4UoJDMbGp4ATvB+FYVCSJOM2lvevMuDQR33buNFJ/1LCQOnFGjMbvYFCQppR5MDLsbqyq9yWlc7iCOXYIbN4bgaHkdrqAw74eMDyWX7W3I0cwum0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507502; c=relaxed/simple;
	bh=Ljcntf5brccRTJ55MU9gPsKOqSDSzzamJnNTFtc5gG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=so3ySfFCfFUoXEczNlM+FCauNBQunvc/EbhxTVnZAYVn2IPkHwy4+8NyoGg5RSoDG4ObjiXUPc/qdh1I0cSD1O+kvhL5DdLxZAjY3OeZD6A/zCoZIcImVswGiBDUjKsi8I+sQcVaCkdchM9/AEwnbY334z3zO91B20gv6mSZsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcA8lrP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF06C4CEE8;
	Tue, 25 Feb 2025 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507502;
	bh=Ljcntf5brccRTJ55MU9gPsKOqSDSzzamJnNTFtc5gG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcA8lrP9GsyMOsTqkt/3hBHDbT0M/UEEX3NT7IeYbMy2kgf9/tHIGHz6chVwTIM/u
	 WaUV2apdZqCBrYUcPZGFAsSsiA0VFYxLQcf8Z0I1XQw/75YwsUt+O9w+r64hoJ37ZF
	 76rDYg/linUZW7hP4N04PFk1uv01KjPQ1jsmF0vkZgPN/SldVRrkHo1Gtoxu+BgC9u
	 z9ehCYWe9xbENx5YP2tkhklVkDX9+vhOTCIkTEnycHugzplI73O7ckpC4gXzhdyCZj
	 IL0ZwJSmO/UaVnrqZ/5eCsF171fTs6ddTMxwfobftj+Fc2PTiHkJywDVabpd2e1LMc
	 3mspi6s4BsBBA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix clock for spi0 to spi7
Date: Tue, 25 Feb 2025 12:18:05 -0600
Message-ID: <174050748697.199016.11411675655725111801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223110152.47192-1-mitltlatltl@gmail.com>
References: <20250223110152.47192-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 23 Feb 2025 19:01:51 +0800, Pengyu Luo wrote:
> Enabling spi6 caused boot loop on my device(Huawei Matebook E Go),
> 
> 	&spi6 {
> 		pinctrl-0 = <&spi6_default>;
> 		pinctrl-names = "default";
> 
> 		status = "okay";
> 	};
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Fix clock for spi0 to spi7
      commit: 5429861bdc33bdc37697909b1f62b1214cd335a9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

