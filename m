Return-Path: <linux-arm-msm+bounces-24199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FCF91774B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDECCB2176B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA55139CF7;
	Wed, 26 Jun 2024 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVpVIev2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B42BD18;
	Wed, 26 Jun 2024 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376262; cv=none; b=QmGJ7nHMZe7B95Y+8ar27rGiG0IsM/4ojKThJEH+XN0KGlwyQChSLXKL8L4yL2ejJzUK5y2UKuaABb0gcqF7oYYBm6f4kXIQuSzjaDg+wLMZF3M1f4sKhHm3fn2jq7hIuKaIRuf3caXLP71/GZO5/qNpLMwTTzmUxPcomO2qYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376262; c=relaxed/simple;
	bh=knPVfDMdmlEat3w4vzuf+eozheVcmSGemCMd1xP3vyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THRr4zFsBzRuLA3tdE9uSIZpS4x49nLPXh+olTHS4s2wRyXTnHSFVIvYqABSjn3/7BmrZoBRlJAdWyAFdwGoIYs1cYkb/TDmVDUMh1dNrX2ysd0AKOpN6rDy9GJx+MYIICYzeRkDBdteve8bEFBfNTZYPPD3J8tZVWs5lErlERk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVpVIev2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CE1C2BD10;
	Wed, 26 Jun 2024 04:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719376262;
	bh=knPVfDMdmlEat3w4vzuf+eozheVcmSGemCMd1xP3vyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jVpVIev2C06y9f+iYov9Ou6yWWNjkNBGIQ4A3hV+EI2GeZKgncPlHsQQYA/ziJ2Ql
	 qOhXQHfQnWD+Bq2XUI0gGBP+RQdHhFSr0p/xNyaAaO6jxEXwcyQ5vgVWvyQb/T3Ng4
	 HNB/zq5t0GXx598hDeZRPybVbgeYHrTlx/oIIm54ZJjCLPITXSmHSAM9qLYXpHzz+W
	 aa07G9dKonWczogyqzvq0pO5xl3xtTpSQ8JvUt4nq2u93cSxvxwqlmLirvTb8+/Bg3
	 R6SvFkpqpHBoagjlMivZX3k3L6x7BccTlI2cJrZ21fQcFhcUna8/Bya1veDDGXrcLU
	 q+6QLgvMRXTxQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/2] arm64: dts: qcom: ipq6018: add sdhci node
Date: Tue, 25 Jun 2024 23:30:52 -0500
Message-ID: <171937625572.44413.10274736381950818769.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Jun 2024 23:01:20 +0800, Chukun Pan wrote:
> It is difficult to add OPP table for sdhci node due to lack of
> datasheet and other data. Limit the maximum clock frequency of
> sdcc to avoid overclocking SD/eMMC cards.
> 
> Changes in v6:
>   Adjust the maximum clock frequency of sdcc to 200 MHz.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: ipq6018: add sdhci node
      commit: 5db216f6e1f85394e79dca74ceceb83b2f8566b5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

