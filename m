Return-Path: <linux-arm-msm+bounces-88356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE7D0DAEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECFF33011461
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF8B2DBF4B;
	Sat, 10 Jan 2026 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJZYXjhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365482C15BB;
	Sat, 10 Jan 2026 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072299; cv=none; b=S3qSxXvK/qkwhRtQeWj5JNrZYXq6sApNaR+vqjWGf19IW+LkOqKW6uhE5CYLqAwcfZ8Cc8ba797mXfW4lVQD7AEKyR5V6ReI70GhtiKv+ZzKTI6GWhNH0h5SFHpyEXT+4Kkfmo7eDoGzCx578ijUu2ZS7MTHFMEjeZgFT3azCsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072299; c=relaxed/simple;
	bh=urwVegVcaE3xyyZSgmyD2j1DyoDOx3DNsJSuKszg6oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4UxTKNnhA42HMzLoD7sJOYahBawIgskEk1gZU2Kt4v50TFEerNsLudJjSCR1a7D+IOxLPst9xyVVuc2hoCEQJzuhmrEyuucjJ2E6LbhX7HEZYpq0C2PnyxK6hNhADLpuxti2l7J3rwhcWIqWWjhSm+FeGve/xdUUrSrKk17OGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJZYXjhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD0AC19423;
	Sat, 10 Jan 2026 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072298;
	bh=urwVegVcaE3xyyZSgmyD2j1DyoDOx3DNsJSuKszg6oI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJZYXjhzwCBW17b/UAq08Bg+AOkJPQdQrUud7QiZRepvdSgh/55sqlT4s8mmdVHbK
	 JTGutPB4rIfi4o4/hin22xVVD6jRSWteBoU7kf8ipkWzMNtdcXdA0JwtZVdRksMAGN
	 hPWA4IiwvBrd/835kdYzG7BIM+FjEENyq9wyP8olB/Wpxl3n4DZlp8Rr5g/OduRpN5
	 72ZiMC3bW83RshbNDuQ8nA12L0KUysE8qrFcFHu7IUaPQxTzKh7WZgumLJS8Zpryh9
	 hFbHlp7jBH/c8t3ERkIeGNgflppCf7Wz3W/e7MQMNJWxj/kwvC5FI1dkfLSgDwmhNC
	 0pdQJ3hCUvxFw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mchehab@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/3] Add QRB2210 RB1 vision mezzanine/kit support
Date: Sat, 10 Jan 2026 13:11:22 -0600
Message-ID: <176807228458.3708332.1225605556758299390.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
References: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 Jan 2026 18:05:47 +0100, Loic Poulain wrote:
> This series enables initial camera functionality on QRB2210 RB1 with
> Vision Mezzanine.It includes device tree updates for camera-related
> components and a fix for the OV9282 sensor driver.
> 
> - Adds pinctrl configuration for the four camera master clocks (mclks).
> - Adds the PM8008 camera PMIC node, which camera power management.
> - Introduces an overlay enabling the Vision Mezzanine board with OV9282
>   camera sensor support.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
      commit: 141f384413fbeada38f3fa46e2beed9bf8c0f6fe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

