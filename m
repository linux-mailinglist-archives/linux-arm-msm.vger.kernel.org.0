Return-Path: <linux-arm-msm+bounces-71439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8AB3EE9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549DA200DDE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1181832ED2F;
	Mon,  1 Sep 2025 19:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDZ1V7s9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A83324B36;
	Mon,  1 Sep 2025 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755975; cv=none; b=tSyHmGtXvnHdU7B8FPK2uoQMYMK2aTz/Y8FHhFzqWymBBKLINoziWc3lGogtF0FS0i6HrR9Xszsq76pIH6Zeara04/EqXfZmQu11kM2SnLZp2HliJ59kaYqLcT39reOfkYAj6ymlVGRyQ4s5y8w6m5CrxkrPrxj8cbYk4haPHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755975; c=relaxed/simple;
	bh=F22kYAKgLZQ9BzqKk9Bh58QyWlMuwhhBGTyHW9QZS/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYIoiKIG5T8s1te4GA4Ka8dHD8UEPfr9pz5BNMCMw3qRIGe816PvdmLFMBuL2AYB0nfo3Qi7fd8AQWdKFY0Az6ZLsIhZEmLBCfaDUDJrc6TqqMPt9Zy0Bm1HA0pSOm6VWE3FPWc7ReV+Su0b20MkAX6FL98lBOjZUw56c6w/Klw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDZ1V7s9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038CFC4CEF9;
	Mon,  1 Sep 2025 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755974;
	bh=F22kYAKgLZQ9BzqKk9Bh58QyWlMuwhhBGTyHW9QZS/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aDZ1V7s92xDoRZDuS6cGe5taT/5RfifxySh0LafQ/h7iG7P7BxcB9gnPY3H+y04Bm
	 1wEoTCcLlb/rj806jqxm+Jj8icnhZdl6v/PqH3vrp3fNp7QI709qEKuAX1kuEzeX00
	 uxEluC2HT1ItuiVqj5zOMcnucdfKocoUOU25x3+dcG8oxCylhppnmbCtNF6l7r3N4C
	 379Dwd1a+EDYVC/wWCiYXwnKwutpqwKDmzVI2FRDnOMHr9Y2kcpN6y9vVukvj83X+q
	 hF1UnPJOXaYM06bzH9gzjUf4p5uGmDkSa0BBfXSvET0xiCWWWENkq2Yx8QmDmcY7gA
	 4ySruMXtCyL9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8976-longcheer-l9360: Add touch keys
Date: Mon,  1 Sep 2025 14:45:56 -0500
Message-ID: <175675595913.1796591.10885468488042934130.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828-l9360_touch_keys-v1-1-1ce5a279c399@apitzsch.eu>
References: <20250828-l9360_touch_keys-v1-1-1ce5a279c399@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 28 Aug 2025 22:25:50 +0200, André Apitzsch wrote:
> The phone has three capacitive buttons on the screen bezel. Enable them
> by adding the keycodes in the dt.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8976-longcheer-l9360: Add touch keys
      commit: 6605a07f441cf1e056ec8ea6e553c893151d5527

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

