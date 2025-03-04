Return-Path: <linux-arm-msm+bounces-50240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F25A4E8D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C46819C6949
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6362E2D4F6F;
	Tue,  4 Mar 2025 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJlWyxRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369992D4F69;
	Tue,  4 Mar 2025 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107629; cv=none; b=dZFBHGs0/+i38oK9KzVRZF+zwR7SjuhMIfBzsTNhW+AjReO0kKUe5OGrpzAkTP1UflnUBgco4q2JBfiWjFsh5GfF0atGpQxmco28/h72LmV2PER3pecSwkGiDNytf23iCCASu0Agdnmf21Qg92Uo3GY+3Ko2ASmIx+szWVVBbz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107629; c=relaxed/simple;
	bh=9gibLqvWUPuANTGwlU/le9ljNRIT06WjyHahCuDGN7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbeaMFOj9I1130GJOw9Hko+I/DmhtxldR8GI1Y2cRZzhHufRnJWnqh3bKEjRH6TC8IP2mqurq/PfJCzouesfVGallB7Zb0Tvjg3cBMIA1trpMp/oqo1q+3pCvLn/JMO+JYH1OQxZMwJZnlpMbSjzQ3Y4ceDvsWajG10+cR//oWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJlWyxRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2B8C4CEEF;
	Tue,  4 Mar 2025 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107628;
	bh=9gibLqvWUPuANTGwlU/le9ljNRIT06WjyHahCuDGN7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJlWyxRquQJVEUZFM2yX8IoqEqNmfWnqUrXVNXGteMg0z431fZBPIZI9nTyU3kGIy
	 yHrZy25cWQgAIDhgzPE5E5WZrij25jlgTUxvLXBeJWZGXddc0dG9f1TamBJ8Y8CExX
	 Y9jwmTThu85IbYq+9parubm5L+DL8QIUvEHumUvj80c2k+p0YWbggEc65dYV/d6D4r
	 dfCvGGovmtoGww7ybti4+tpY7pDafMJAshzr4N5Rfua6rpn6P7N2PwDGM3IXHP1wGl
	 HXUBIbovjZgwL6mhvCqXpp55lE5yqVbRuwtirdzxvWu8nQqPGAI2bpr8WOhCPf8ch0
	 m0Tbj0s2EC+qg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1e80100: Fix thermal trip points
Date: Tue,  4 Mar 2025 11:00:15 -0600
Message-ID: <174110761295.741733.9570226432916228065.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Feb 2025 12:36:17 +0100, Stephan Gerhold wrote:
> There are some mistakes in the thermal trip points currently used on
> X1E80100. Several of the critical trip points are too high, so the hardware
> will trigger an emergency reset before the kernel has the chance to
> shutdown cleanly. We're also missing GPU cooling in the device tree, which
> prevents running certain GPU-intensive applications without reaching the
> critical shutdown temperatures. The CPU on the other hand throttles itself
> automatically, so we can just drop the passive trip points there.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: x1e80100: Fix video thermal zone
      commit: 801befff4c827aa72e3698367c5afc18987a6a3f
[2/4] arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown
      commit: 03f2b8eed73418269a158ccebad5d8d8f2f6daa1
[3/4] arm64: dts: qcom: x1e80100: Add GPU cooling
      commit: 5ba21fa11f473c9827f378ace8c9f983de9e0287
[4/4] arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU
      commit: 06eadce936971dd11279e53b6dfb151804137836

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

