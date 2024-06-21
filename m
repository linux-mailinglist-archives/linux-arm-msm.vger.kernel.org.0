Return-Path: <linux-arm-msm+bounces-23516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C1911B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8F41C22317
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843CD16E87D;
	Fri, 21 Jun 2024 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjVoM8Ve"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571B16E873;
	Fri, 21 Jun 2024 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950307; cv=none; b=jplcTEbArZsTXXg390cnVaRoSAPxVQjSzOBdSxuqsvFC14L3jfz4xvb4dOyt7ZHfN13PT7qnOI2Y0jZpwXtsQks39hJRrF4/AMOyFMuWrCVnK97nFbKZE7VzDr8Q6DQ7rfq3ItwYeGl4yZIZlp25Zoharw/QyjyhUFTNuAW4Pkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950307; c=relaxed/simple;
	bh=Pi58QsHkfSwBWg43hVZ5RjfXwbqb9W8glY+hY0DxfbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVU8zcMrteGMsA+gOfQ630o1lgRY/dvFOHD5lxDzzOZrQIbEb3ncw/Tq6BRZLcCby1QwwABjfhbcb8qoYqWKi3Usmhecedz5jVrF1xr9nT/ulXv/nS1t6Sf+i2iHvG5yECoe+W02oeWQ1KC5hg2C0pFIFGKiuJXoQFUwuS2By2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjVoM8Ve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E50AC4AF07;
	Fri, 21 Jun 2024 06:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950306;
	bh=Pi58QsHkfSwBWg43hVZ5RjfXwbqb9W8glY+hY0DxfbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjVoM8Vehs6KYvOTJ0Wd/Dsw5rKkENrlU4+iYqh9ytSarPdNLvz5H5T8l0RdQY2xY
	 Udu87Dy5pfe7Te+73IbxECVsgBvvDNkWTgtfjPWlAFztNrMgyMTq2gMgeQDuljXYw1
	 mFjaTpnQicbP1XkohRTnp6mBxzF5T+K6FB8auaTQWfmgTNhUXD+YlwWoZUhmQTk34t
	 SQrA1QZxjqB+h2a3X2qlKGbN+8zRojobvlGowmHmiSWEy/A7Zpm7S1bic7T1Ee+X4s
	 YUMkQlT5yVivKlwbAGsuq8aJ/ncmkixM3NdYVXy2RTvAIQcsyuhklrO3I/P6u4EVR1
	 YH9Ysjm7Q9oKA==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	Luo Jie <quic_luoj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bryan.odonoghue@linaro.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] clk: qcom: nsscc-qca8k: Fix the MDIO functions undefined issue
Date: Fri, 21 Jun 2024 01:11:29 -0500
Message-ID: <171895028810.12506.13906619413598712077.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617093806.3461165-1-quic_luoj@quicinc.com>
References: <20240617093806.3461165-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Jun 2024 17:38:06 +0800, Luo Jie wrote:
> The clock controller driver of QCA8K depends on MDIO_BUS because
> of mdio_module_driver used to register the driver.
> 
> This patch fixes the following undefined symbols.
> ERROR: modpost: "mdio_driver_register"
> [drivers/clk/qcom/nsscc-qca8k.ko] undefined!
> ERROR: modpost: "mdio_driver_unregister"
> [drivers/clk/qcom/nsscc-qca8k.ko] undefined!
> ERROR: modpost: "__mdiobus_write"
> [drivers/clk/qcom/nsscc-qca8k.ko] undefined!
> ERROR: modpost: "__mdiobus_read"
> [drivers/clk/qcom/nsscc-qca8k.ko] undefined!
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: nsscc-qca8k: Fix the MDIO functions undefined issue
      commit: b45120fbd39825ca0d32e39309c30a9e9d567cd8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

