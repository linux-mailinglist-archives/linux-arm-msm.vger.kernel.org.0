Return-Path: <linux-arm-msm+bounces-49524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA4A46120
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D9C116A106
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DD0221F17;
	Wed, 26 Feb 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4AZUMRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2B221DBD;
	Wed, 26 Feb 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577258; cv=none; b=lZux5sY1JRdFfgTsXHFq0pizgSIp7fP9EAKKWSmYKYNfoVCAjYBQ7hcpcUTd/t3+1znCza8PrOosGnz71RSC6iZULMpjhc57AA/phsnMsoZelIeUdXGqqUveFF8IoOUS7jDS4h/63Vll0adVgdvsh+U5qVjJTYI92Xl6OnPOrp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577258; c=relaxed/simple;
	bh=7Nm2sxzGfrhqpKTsXQs52GKnexHsUMFdQK39ivYGjZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/0THeLvA4OQOba3K2nIe4NGYEpFqGsQkrKND7JKuuOwuzLxgUO1oUArWuLv0XGa8S61xoZfwTrcUOTKcGKWauRoY2iI18MMpPBPC6UhnsnA10dJxPkmX2L8B9DLrVAU9N2PlSaDQvY6QnBpYj0Uh1ftJkXs1i7uf1BS9u8gLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4AZUMRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668BCC4CEEE;
	Wed, 26 Feb 2025 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740577258;
	bh=7Nm2sxzGfrhqpKTsXQs52GKnexHsUMFdQK39ivYGjZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E4AZUMRWlkEg4Ao5QFtWC0soBE0kPh5+GDbpU9hhe8HnbSB90xWG08837z2FhKaMU
	 iFpk0QhilLzm9CQXm/0MuPXJwZbInFuV4ruC1KGN6RRlLm+MhKVGWpGX9I3wedmGv3
	 I0XA+FGathyzqQevC5TnafjooxEZmnF6upReV2Ebj+x8wrjIRgLfTReJ0jJ0ZAJ5GH
	 AhcAzkZkmwdM35g1+54psgkyihj0AcbT4iHfDeVWY7cjUrerG6f+6rr9xx64Sg3vka
	 +wHXm7hgdtHy6HX14IBo7nOdw0CuhNKgl3VXy2Oqj/LGtaSgIss126Z8LAyXyODKki
	 AAGHAfVb6siiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: sm8650: rework CPU & GPU thermal zones
Date: Wed, 26 Feb 2025 07:40:48 -0600
Message-ID: <174057724683.237840.9228702761146202585.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 14:23:16 +0100, Neil Armstrong wrote:
> On the SM8650 platform, the dynamic clock and voltage scaling (DCVS) for
> the CPUs is handled by hardware & firmware using factory and
> form-factor determined parameters in order to maximize frequency while
> keeping the temperature way below the junction temperature where the SoC
> would experience a thermal shutdown if not permanent damages.
> 
> On the other side, the High Level Ooperating System (HLOS), like Linux,
> is able to adjust the CPU and GPU frequency using the internal SoC
> temperature sensors (here tsens) and it's UP/LOW interrupts, but it
> effectly does the same work twice for CPU in an less effective manner.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm8650: drop cpu thermal passive trip points
      commit: 7f9a670396029116424a803d3971ff0e552ff0b3
[2/4] arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatures
      commit: 2250f65b32565eb8b757e89248c75977f370f498
[3/4] arm64: dts: qcom: sm8650: harmonize all unregulated thermal trip points
      commit: c516beb248a96f5a93fb4f9a6cb0dda4155eadbb
[4/4] arm64: dts: qcom: sm8650: drop remaining polling-delay-passive properties
      commit: 30235bb8b0487537ddd7dd4a480c907add6cd19b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

