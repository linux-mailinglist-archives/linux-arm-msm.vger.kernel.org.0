Return-Path: <linux-arm-msm+bounces-23798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB0C913E51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 593C61C20BE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C721D185E55;
	Sun, 23 Jun 2024 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFPXhVkj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCEC185E45;
	Sun, 23 Jun 2024 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176545; cv=none; b=aGwo8GmhNqABOqkZ8pFO8OYr/f6ai7Y2KkC7cCgMqG5548sCV7iZRK0awSvYEFBe/yqHax2J1YTXRGqbnyLa/HGGqdSFe9j60l2wOKSmF6yv99MSKyLE+jwVPFRXycPrtRshPZQHKOHSMLZwhsAme3kS8RiVSMiiIpbDfyY6rB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176545; c=relaxed/simple;
	bh=t7TgurxsfE4m6PvnqrAHv9KBUFSVR7gLduawgM0sIj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xfa7bJBPTl2M7HfHoLVldHGR0ej0bH/qvQnSwfd0RNx2DPaAhnq09dbba+OzVspEdoBhNuTwq6c4Us9Rp+uWqGJ8qce5pA8As9XRSyt9a7laXLcz7tfhr73KIzsJpZl288YVTj14tsIBLR7WrltbtOuoWqCTA39W41uawVSSuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFPXhVkj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D4BC2BD10;
	Sun, 23 Jun 2024 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719176545;
	bh=t7TgurxsfE4m6PvnqrAHv9KBUFSVR7gLduawgM0sIj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFPXhVkjXSJoDO4BYA4vr0VkVk8elqlOB2dI6F0MeBTiu9C6oG2QF6T1zOxNJ634w
	 rABHK4NnW+X44Rdyv53c5znd8scqW7xRrPqH2qV9e0MvyboIDYZ6bDz1LFQ8fVc3ku
	 70XF2iFzSJtlayvU7IGsLHJHxbtGQqsOXEtnZJ8AdGG5KuZWY5kgIXxQyWmFZNi+d+
	 xMCeefeNnkmhVn49ylZG/T41d6ccxA+FnPdkm3YZJZsA+AJ8S5NYzre4eMBW53Npk0
	 17ib7q1BO0Zs9oVN4kNT0+79WklY+ucPtNgtK+VeFHeCwOiFNpo9vc8WJkMsUjqGgg
	 ycFK9x3klEgMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	"Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-gplus-fl8005a: Add BMS
Date: Sun, 23 Jun 2024 16:02:16 -0500
Message-ID: <171917653474.4580.13059967965677778281.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621141319.347088-1-linmengbo06890@proton.me>
References: <20240621141319.347088-1-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Jun 2024 14:13:33 +0000, Lin, Meng-Bo wrote:
> There is PM8916 Battery voltage monitor on GPLUS FL8005A.
> Add PM8916 BMS and the battery to the device tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-gplus-fl8005a: Add BMS
      commit: 61ba969e0e7d26a9260bcc658c54d2bf9a1f0a2b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

