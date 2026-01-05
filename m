Return-Path: <linux-arm-msm+bounces-87541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2BCF5525
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 533C13008F54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E91C1F1537;
	Mon,  5 Jan 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLilpzwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10153398A;
	Mon,  5 Jan 2026 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640595; cv=none; b=cGB4gjHYwNaKlQAispFEVtJmOj6RbJAZtUSrkdOZr/1l6q92XQaGq0n0iF74/GWQ3DbErTI+HveinF4i1xxqZ9HhZC3qbPHHylyYcd6gpc9b/woUIV6C9xfbGRCy28cNNKE8yuMOlWCRYL2lNc4HCGaGf1ZgRrpirid70HMwCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640595; c=relaxed/simple;
	bh=povE5y5MY7Uwze3qy6H5gHZ1SQ221k5BK3sT4JoYWGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8bxjuZBgwk0KnDEfDGXQJmetAsqLyQGNXSwU/qJEI6pD2O1TA7N5OQNI36wI3gAAsiDv2gLKD63yHgk0rYSawIIBjCbZHFMRZbYluDlN0ihSoEm4eq2Q7LAG+5GX6C/kFTDa+I3nnS+zGEKX3Z6dx0mHR3lAtUUteqRwWsBCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLilpzwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB85C116D0;
	Mon,  5 Jan 2026 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640594;
	bh=povE5y5MY7Uwze3qy6H5gHZ1SQ221k5BK3sT4JoYWGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZLilpzwuyqmHP8n/r5pXfEADIgh+en0I5Bz/Oqta/W9EVsmck2dKAAnlGrWTJ5Olq
	 Fo7saD73xUX6XAK5tMtR0fgkYgamXHid3fkt+YSw8kQnWqtqQ0l3Y4w6We6TqbQWkE
	 rXYEUpt2hdNs/7141RHssAmVmxGpeP48gTA9gHRNKvTz8nX5oFBi4FIGGd0LKe5zeA
	 u3iDPdRCfPkH3fq+FpaeuLR92EGa8cYD4ZcmLdjoiLUibaylMFFaYBaPgOsHh8s6eW
	 ZgR0IhX7iNCDEH8IApQa9xI1fIgwQglQvrAyJF3I2zs59vOGoeblzEdeh0NhEaPeef
	 hJf27d+Y2vpDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	stable@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v5 0/3] phy: qcom: edp: Add missing ref clock to x1e80100
Date: Mon,  5 Jan 2026 13:16:15 -0600
Message-ID: <176764058412.2961867.5718279320057221936.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
References: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Dec 2025 12:53:26 +0200, Abel Vesa wrote:
> According to documentation, the DP PHY on x1e80100 has another clock
> called ref.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, when it comes to power management, this clock
> needs to be also disabled on suspend. So even though this change breaks
> the ABI, it is needed in order to make we disable this clock on runtime
> PM, when that is going to be enabled in the driver.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: qcom-edp: Add missing clock for X Elite
      (no commit info)
[2/3] phy: qcom: edp: Make the number of clocks flexible
      (no commit info)
[3/3] arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs
      commit: 0907cab01ff9746ecf08592edd9bd85d2636be58

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

