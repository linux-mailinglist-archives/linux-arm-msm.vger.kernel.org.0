Return-Path: <linux-arm-msm+bounces-21844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D00148FDD52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B131F2373E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81160405F8;
	Thu,  6 Jun 2024 03:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNs3EqLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526673EA72;
	Thu,  6 Jun 2024 03:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644044; cv=none; b=cz1UopJW4QvW4FdphAaQXUtp4YKil0y12gtK8Me7EVWk6i93ghJUi+xVc1ZFdCEXGvdOUZXy55rjfMVYrxVSUtXc6BORoZ347MwxK28nxejVrOMEu+x+KTiDGH76c6KkAIuOuF6WuGa9Uq1UcCIQii7XdIS5ijJqnE7mFPAaRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644044; c=relaxed/simple;
	bh=rsPLGW7dQKOe00pkD19iAIenIK0y6o5CB+SwsCh7KXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=spVcIDh0jfm2URpCqUefHddh6dLACXFCwzYxoOdpI7I8CwFXgx88Wxu0iBGEUXOJSTPqV8LFq3M6Lsgkmk0Xpt3K19SA2srcPsnGUwJwGtKSXKGP9yKMhRq5NdC5q41rx2a1XPLDH9ZVrDYiX8RweuoBE89cukNSczKLgzENs5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNs3EqLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C65C4AF09;
	Thu,  6 Jun 2024 03:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644043;
	bh=rsPLGW7dQKOe00pkD19iAIenIK0y6o5CB+SwsCh7KXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qNs3EqLFLkgpjTRbB7LZgr+9I/wnQS/yIGaz7tw98tyfPQoIXRUCUSbiChzuhalyL
	 ChK80GOEQW9386hHnm3CRcNYbUcPHs+SLeHP6b/wVA44IOrZAjrS/rnQYV83h9Tf7r
	 +S+DfEo0I8IARVVtWG97lcQgzOKlzGDi8XXnd0w0fvX+J9ZMuEPFIC5N+JgOh9GHYg
	 xwStSTRLugs2FUTpzqK1lK1liCASxKNKAM8IJrs+y0Uxt4lis75R1d7Xss44HDDtm4
	 BURB1FCRcIQCCeEO0Rv3LpaSJKv8mG0pUFtB3U5NCLIJW8X7cXbZwvg2xxAMvbkRoq
	 I2J2e7wLpuFRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: switch RB1 and RB2 platforms to i2c2-gpio
Date: Wed,  5 Jun 2024 22:20:30 -0500
Message-ID: <171764403327.730206.16478168003566814778.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
References: <20240605-rb12-i2c2g-pio-v2-0-946f5d6b6948@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 11:55:55 +0300, Dmitry Baryshkov wrote:
> On the Qualcomm RB1 and RB2 platforms the I2C bus connected to the
> LT9611UXC bridge under some circumstances can go into a state when all
> transfers timeout. This causes both issues with fetching of EDID and
> with updating of the bridge's firmware.
> 
> While we are debugging the issue, switch corresponding I2C bus to use
> i2c-gpio driver. While using i2c-gpio no communication issues are
> observed.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qrb2210-rb1: switch I2C2 to i2c-gpio
      commit: b7b545ccc08873e107aa24c461b1fdb123dd3761
[2/2] arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
      commit: f77e7bd40c3c2d79685e9cc80de874b69a976f55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

