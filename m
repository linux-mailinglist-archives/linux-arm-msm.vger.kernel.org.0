Return-Path: <linux-arm-msm+bounces-43391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F79FCCC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EE0C1883773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1EC14B955;
	Thu, 26 Dec 2024 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryilrF/v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AFA1DACA8;
	Thu, 26 Dec 2024 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237648; cv=none; b=CtVXt4tTpEDgLNrRGtxL2/ywgVmoUVAubZIJ5tT+vb39DjZv248A1RZJ0yp11EYlVD1fbhPEi/KDosEX9cMSds8+Ema9bVpbHw4JU96CW4f5d9TE9juqNmLNY0+7zhu1zsyHayNvBDWfXinQz7rYJ7t8r+ksZ9CVSKAPd+fCoaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237648; c=relaxed/simple;
	bh=rI5TJEVOmVg3jB5r81bJVZwI5+2SjCeYCtwb9zylZGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRoAaj017tHRrPUW4LUW2xh51HIJmxB+3cvujYGbFksu2lAtKS2YJt/S9G9ofTzQ4SMbg6ImFWOEynExH191jtlcf4U1K9FhuNmCPk2tpQ+ffZtJfoAXPNBYzyO8n+XYyL0jBsYhOXSXMShwAZOdfmImjXXI9LlB9kfyAWgmXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryilrF/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B24C4CED4;
	Thu, 26 Dec 2024 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237646;
	bh=rI5TJEVOmVg3jB5r81bJVZwI5+2SjCeYCtwb9zylZGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ryilrF/vvbNpmx28RH6iPL7+AgIwA1DkeCoB5Q3jIB27AqIJD4KBdMwurIEr2M0a4
	 Cbwd0SKZn2rXp1BWIq2aNi8IxI7VJ6N7y6A7IeQForTqK8A/1b6U2z92ivJToqZ/QY
	 8kVc5d9UEnM7NMylXuVyBGLGrxicYiCMZUGkm2+nRNT9URTA8uWuohF4Ljfmisp5xs
	 o7rqyP2604oAlrOMnV9QxIYgaLon9Mn2s384qJbRowOeFBC3Ph7n7qEw5nubOLHb9N
	 iM2lXpHFe4OAx8UpNQ8b6k5g8IQ3UziK49crZl8fC5aFkSNtEcje0Vx+K7/ERwAIWz
	 8TrxaUUi1VuKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: simplify locking with guard()
Date: Thu, 26 Dec 2024 12:26:44 -0600
Message-ID: <173523761381.1412574.7014199213538241692.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
References: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 23 Aug 2024 17:38:42 +0200, Krzysztof Kozlowski wrote:
> Simplify error handling around locks with guard().  Less gotos needed.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/3] clk: qcom: rpm: simplify locking with guard()
      commit: e18e8bbb97f0a51459163cf8abe116cae64b7207
[2/3] clk: qcom: smd-rpm: simplify locking with guard()
      commit: e534612ec7e60989d5b32c90ea2b2f61e5abde0e
[3/3] clk: qcom: spmi-pmic-div: simplify locking with guard()
      commit: 7fe3067b885df61691660e53141a0fdb2cd14c48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

