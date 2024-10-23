Return-Path: <linux-arm-msm+bounces-35508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0029ABCC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9D4284A73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E952614E2ED;
	Wed, 23 Oct 2024 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAzx7D4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB714D444;
	Wed, 23 Oct 2024 04:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656980; cv=none; b=KmMJEs9jALaS4MBqTt08093oPKx6vH4ME1Q4EX4PaG7gwQ48+0lQh0JeRdCk5POQ0mWTcYRokzwjmGJ9A55gQdX5eLwKUej4Ev3cYUdot7dDsBdRmZr4L11Cxnh7FpuafJGjtb8oRH5AEKAh7g9T3Xqvjm/BfmeRdSEpRoCS2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656980; c=relaxed/simple;
	bh=JC0/56Incz1HvfzGKSsGBujk6MPwDutoxxSzwrXI2Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i44XZToCllX7Rf7hlDCujhsSd6FpUCkW2TmRKb3r8hMXinL+KyvGbJ0Lz/pblU8OjHC7TULZGgebhKGyBKH4wq1rjzutxvxoV5F20CFfvSrUiT/ne96/72BjY7JBBtLD/jUQko5xG23aUzG5K8daHbHs3RzQ2yQQkSxHDWzIEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAzx7D4K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDCDC4AF0E;
	Wed, 23 Oct 2024 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656979;
	bh=JC0/56Incz1HvfzGKSsGBujk6MPwDutoxxSzwrXI2Yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAzx7D4K5BUEMJtgpIXDQnVEKjWFxR6myJyYuRm3DSDiACPbf0frK3l+TSU6B4Ipb
	 iIgshYfbz7zYopoMd21xtKTV6WBqifbpd0bbEklp718Bw0z9tJlclJuv95UUCC0Q0e
	 4/DdJfR91ctYhcCNoelvWbpElBmqFhlhRdSxXBg+NVzhUmVGa1J+Yu6ylaAPx9z+oW
	 mr/2JFMfUT9VVhE4+zY4hAYcGKCHRouwda/N8ckyB/YWB0VdTKh3KuZinwVGQnnojw
	 aciTguUA46gJOvoNksuRD4Ki4oryb53ZuWydLxyKvVFoZpn0qAyDMyzaw61PoN/jgK
	 KP+6nIePLWJMA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steev Klimaszewski <steev@kali.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v3 00/18] arm64: dts: qcom: change labels to lower-case
Date: Tue, 22 Oct 2024 23:15:56 -0500
Message-ID: <172965696409.224417.15541336565393927964.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
References: <20241022-dts-qcom-label-v3-0-0505bc7d2c56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 17:47:25 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - New patch #18
> - Update also sc8280xp-microsoft-arcata.dts
> - Tags
> - Link to v2: https://lore.kernel.org/r/20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org
> 
> Changes in v2:
> - New patch #3
> - Several fixes as pointed out by Konrad - not entire part of labels was
>   converted in v1 (e.g. LITTLE_CPU_SLEEP_0 -> little_cpu_SLEEP_0).
> - Few more labels found for clusters/cpu sleep states and clk40m.
> - So in total re-doing pattern matching. b4 is your friend for the
>   changelog :)
> - Link to v1: https://lore.kernel.org/r/20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org
> 
> [...]

Applied, thanks!

[18/18] ARM: dts: qcom: change labels to lower-case
        commit: 7b49c9cf4b77a69f03297f515c89e94f21c9b1c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

