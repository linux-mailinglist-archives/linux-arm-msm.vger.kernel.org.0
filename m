Return-Path: <linux-arm-msm+bounces-21671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026A8FBD15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0C20283A07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F1414B06E;
	Tue,  4 Jun 2024 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHpcDNGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25DD1E892;
	Tue,  4 Jun 2024 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717531880; cv=none; b=X6Nh2E2/5Fp9Pv0PF0P4BKiTImYtYdBDwEGSII7zH5FvNU16Osmhzh7eSFk6T+tAF/jvTUY7D7yMys5fPGqF04+zO/ezVudD3t1PwejZWQ1jjIzh45zF5AflLW08ZMf3DR9xwcnq4G/ggNgTw2wVhn7xq0bQHPzYxMGGTCMnULc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717531880; c=relaxed/simple;
	bh=twnupjz93McoR0BFDdq2IzHLjGXZb5LKMqFXGWo0l+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B3lnx5Geof53veHga9QT1ZFFx29+ms0FPmw+UHsa4P/1AQBugngcHlqbYoIiB3CL7Mwp6bcj9DstqVB+uDARtICh6iXkqseqTdTQ/YJFpQgUWKmbFOjWSBpOfPDip1BbNXWw6HmRq8js2nlJiRRx1961AMpMyD+sSJAXzZIaoXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHpcDNGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B86C2BBFC;
	Tue,  4 Jun 2024 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717531879;
	bh=twnupjz93McoR0BFDdq2IzHLjGXZb5LKMqFXGWo0l+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uHpcDNGdzHSBeNg90QwAe30exQIJdLIwZCSrl3j4yR8fmxNaf8UchvFCy127DiA56
	 YoWJuHbGKEuE4hMcqGIWWYRF4qDn0dVm7qgKkx+a4g0O3Z+gxix4qPCw6DSKFXdcqK
	 BCd6SEClN6NyS2Jx3bNgGLBs4g2oLV5d346pBww2tom3Zyfb/hjrFPjW0L2/4+I/HZ
	 QxOwm1dasudiQXCZbdDxpXkuG9NszWa2WP36n8km+kSkrQd6EZ/S2fvAcHNGw7sQ/T
	 5Ac2iRiq6ylAIc1sdo3GMblrjOxxK4GoKxjrEmKPYoPvu5VjFcmX4T7mV+d2MEmjvI
	 +w9eun4kntAGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Cong Zhang <quic_congzhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer
Date: Tue,  4 Jun 2024 15:11:16 -0500
Message-ID: <171753187385.705550.6841992262467405701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240604085929.49227-1-quic_congzhan@quicinc.com>
References: <20240604085929.49227-1-quic_congzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Jun 2024 16:59:29 +0800, Cong Zhang wrote:
> The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
> number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
> of EL2 non-secure physical timer should be 10 (26 - 16).
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p: Correct IRQ number of EL2 non-secure physical timer
      commit: 41fca5930afb36453cc90d4002841edd9990d0ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

