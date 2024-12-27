Return-Path: <linux-arm-msm+bounces-43464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 505BB9FD03F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE822188381E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13652126F1E;
	Fri, 27 Dec 2024 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYyxKIW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3341442F;
	Fri, 27 Dec 2024 04:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274431; cv=none; b=Ltz+tl2Uv9AUF5E4QsouiIbDhz+HQBrnvXfFwyzJwtQXT8X1hL+c0MzOmsPw5YNpZRwad0RnFtaQe+sTV2QG2oVcMPW5P4Xeb6eDmHx/tjQalbip8JsSmG9tcSlpLu3tc01AwbiRCEAS3AkP6YWJtvI9S41e+dbzTml3jkVsRKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274431; c=relaxed/simple;
	bh=UpBc5qkG74txPSfnvRGVxgRrqLbmlKhxmaLe9ORkGyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZh/3tomG2gRNGh9c5DVOfCMZE3t1sUbEn2hlwW6de4YosIE6cPGznHIeGKc7v3ZT1zNooevaPyT8fWr4CKdvmlIYyhKrb1vOoZXpxVLCCiGvzTKn7C41K4sWtLosZe38/nfl+C3W+S7EN0zx6PTmOWvKSAsALKqb3COtuRCh2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYyxKIW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDBBC4CED0;
	Fri, 27 Dec 2024 04:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735274430;
	bh=UpBc5qkG74txPSfnvRGVxgRrqLbmlKhxmaLe9ORkGyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oYyxKIW7p0Ss2Uy4cVC7u9DQpRwKFha1RBut/xK7LVywhfC0JS4AmL9KcrzvogEBR
	 1Hsv5hSrAH+cTCDHYjNP3O06BBrRPyEkhimANE4Zl4f1cAcwwRp5Z0YFHX6PDt0J0p
	 dKu1CzpPwPJodIE4qO06u5SJ7mPsjPkzs2sp+A/sE5hPAN0d4hwW8GhwBc1kf5TrrM
	 1/FBNGb5y5vjVf/0bQJz7eomA3qDS7s8Q+x2PJZDYxmHRQY8AzA5Z26hmfllJhvgJ5
	 e7FPaHHjJKQqf7M+EoaRMGDX5POYDTKSIL0YR0JzdAad2xCOrqU9RCDQG7yvy1YyRg
	 JgIldaqe0SLjw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] qrb4210-rb2: add HDMI audio playback support
Date: Thu, 26 Dec 2024 22:40:25 -0600
Message-ID: <173527442286.1473071.12713395655975649786.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 02:53:02 +0000, Alexey Klimov wrote:
> Rebased on top of today's -next and re-tested.
> 
> Changes in v5:
> -- drop MI2S clock in sm8250 patch (seems to be merged);
> -- fix gpio-ranges in lpass_tlmm (Dmitry);
> -- added reviewed-by tags from Konrad and Dmitry.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm6115: add apr and its services
      commit: c722e3ce278826f29a2a8500d685130dd0b6a297
[2/4] arm64: dts: qcom: sm6115: add LPASS LPI pin controller
      commit: 4541a5f11e59015d2f4b39864e421bf9e804097d
[3/4] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
      commit: 6624d17a8142776e43bcd632c227ebf0bbe9d590
[4/4] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
      commit: 1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

