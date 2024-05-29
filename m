Return-Path: <linux-arm-msm+bounces-20861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5248D2A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0D311C240A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6D515ADA6;
	Wed, 29 May 2024 02:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFjEqvjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0301815AAD9;
	Wed, 29 May 2024 02:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948129; cv=none; b=utu2bNw7azimpdVkVHe1910sWdqw5YNb7/KB9A2sfiJ2xmDIqnd6oO5tXEHnOOGrN/R+a51chP7wjpDf6YZQa+BjYoKsi+FW/vzpAYeRsNu0n3enT40yNZXq0gVDSW/fNz8pAU8PTgPnGEmEnapCDaU7EhMAipM7Dk8dGsZ9bxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948129; c=relaxed/simple;
	bh=ki9XafRlD+raZ2EDl7VVzXwlVnr8DZKn1SI2rrt8tUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7D5ERxKIiHyEGnhPqxpt4WOc/C6MStnk7E4ymjoUd+2pL3G3mu0ia7f4wipNegX8x3+kLOTmYp1hEt4Brqoqgw2kUmtD1DE9KlpOljL7dWVaCdUi+Y3MbNhW8QNqtRGI/hwOgU5JBM3fVej7vM0/OTTWsKBJB1EQ/MiTK2KBiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFjEqvjJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3287AC3277B;
	Wed, 29 May 2024 02:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948128;
	bh=ki9XafRlD+raZ2EDl7VVzXwlVnr8DZKn1SI2rrt8tUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFjEqvjJtpkcg5xU69L9xbKAN3Cm5y5pykOP3LwK23usR9u04uwJmbTh3fPpfTU6b
	 h94sFotVBKSsF2QA6w527Ume1dfGPymsZE5TgwMI75cUEpvvD3AW7c4+7J/4tKWrsh
	 R9OtrHzQoUEBWNMDZ0ww24Cu7fWwST+cjDqAKhMoN+vZdrVvVi0EtT3l+oQBi5uQnT
	 8R59pIJDwvvaRwm+6Ky4UXVXH8qu1q1hBjVIEFwV2q65PsjxswCrrh3sNslj9DO1C9
	 wvtUU0/icnx+DidqSpRRysgGUU+8obZybh0wwVWQdjFJfj0YxQqGHZEy46aptGt07R
	 qehuuPeFJc1ew==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Subject: Re: [PATCH] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs
Date: Tue, 28 May 2024 21:01:48 -0500
Message-ID: <171694812081.574781.1941116620101881567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
References: <20240509-stromer-config-ctl-v1-1-6034e17b28d5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 May 2024 10:08:04 +0200, Gabor Juhos wrote:
> Since the CONFIG_CTL register is only 32 bits wide in the Stromer
> and Stromer Plus PLLs , the 'config_ctl_hi_val' values from the
> IPQ5018 and IPQ5332 configurations are not used so remove those.
> 
> No functional changes.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: apss-ipq-pll: remove 'config_ctl_hi_val' from Stromer pll configs
      commit: 2ba8425678af422da37b6c9b50e9ce66f0f55cae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

