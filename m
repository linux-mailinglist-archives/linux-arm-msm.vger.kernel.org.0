Return-Path: <linux-arm-msm+bounces-43456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E990C9FD015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F7C1881E71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0F513AD3F;
	Fri, 27 Dec 2024 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7BarBhY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF213A250;
	Fri, 27 Dec 2024 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272935; cv=none; b=T5USAtLA0Uz95PXzcn7vUa8ygphvdF34dvBHWEmcyiBT9WUmUMwHrm6UMSGjKl/6FM1bYOvO4cyBasKwhTRNVUTQ3RUwEg7H1e8keNcSnzWdHZnUcR0FYLsAVT+ypliZnBeDRtJEUzS2Qad3Sf6IXdr0Pxt56VqCAsaxVz/u7Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272935; c=relaxed/simple;
	bh=qMv+JHj/4r1Jhn6FXcHzvrBN33JlfwGRaoumUMVcewQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOs0U7ln4joiOE9yltZlFk1BqiIZtFCRdlFoKl9JR/LdfUF2Z0BuEP8fen006MuEcUi1IPZghYb3qj4zIMPYhtRxqB4/+VVTqYFdeQfJQOLIZQE8qBG7aPxemBn9i2I2KM2mqyoxrK5fR+LvS1lrrcsCpRnNHhg/HE/sVE+cRTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7BarBhY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADB5C4CEDE;
	Fri, 27 Dec 2024 04:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272935;
	bh=qMv+JHj/4r1Jhn6FXcHzvrBN33JlfwGRaoumUMVcewQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p7BarBhYIO6MIQx+jBnhU2KHvl36jHduETmQc9HoaVC43xPf8NU7qdNHmJQib19NT
	 bdBu2Ye+1ZioFnTOMHS8OQiJupKjLTZbsjpxcIbzwqt1wfVHdUaWiea2/vfQGCYK1q
	 Fts+BQITsBLOVdMXSFZYr6eGy9nIUEs+M71oxkrEOwgxAM+wJsKnsk5HCXA1jBiyAL
	 MMCqW2guP7+uwUwB6duhJ8s+Q4ruCBQhrlPsu1TO+m73og8lp+/C6nRRYrzIWHOWyu
	 iHKubQljBlcA74CSkp7A+bH7QRz0fV2THtWo4M1ERskn5/oEyIVT0EzMdqgKYrFZat
	 PfZR8TPHDfo7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] clk: qcom: remove superfluous alpha settings from PLL configs
Date: Thu, 26 Dec 2024 22:15:23 -0600
Message-ID: <173527291941.1467503.12069046590893387791.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Oct 2024 19:48:14 +0100, Gabor Juhos wrote:
> There are several alpha PLL  configurations, where the alpha mode
> is enabled even if it is not strictly required in order to get the
> desired output rate of the PLL. This small series removes those
> superfluous settings.
> 
> 

Applied, thanks!

[1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from IPQ5018 PLL config
      commit: 3e632d9c33d8a4f0d8f98e69b56bd2f2145d91c4
[2/5] clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from IPQ5332 PLL config
      commit: 41c5ebfb9b4b42b1479f16a50d96146fa945abce
[3/5] clk: qcom: gcc-ipq6018: remove alpha values from NSS Crypto PLL's config
      commit: 5d11fd2a919b153c68cda42c175b4e45668654a9
[4/5] clk: qcom: dispcc-qcm2290: remove alpha values from disp_cc_pll0_config
      commit: b9286a91b59fe9c7f8e231fce8e51df3b1442f6b
[5/5] clk: qcom: dispcc-sm6115: remove alpha values from disp_cc_pll0_config
      commit: 320f7a476c5fe79f50d00c75debfd9f63a0e713f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

