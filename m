Return-Path: <linux-arm-msm+bounces-44271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B4A0506F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3DF3A24DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE9F1A76BC;
	Wed,  8 Jan 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6q0Prye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494491A706A;
	Wed,  8 Jan 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302403; cv=none; b=R92ibzIgX29bngbouETACychQHmK/1iEekCuidRsIQIoDYgbRYKBsJRaMMFbsWjtnhgZecx5hXNsyuU6FeJ+0gZXENiLfo72H9HGjLYgKeALu7xYTbPFvq2EdKx3RPYAe5qFgP0lUJVH03b4C7iKp6yMjlKGO27qwBUT3AjlOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302403; c=relaxed/simple;
	bh=MO2/BdyLBB8lwImf2FSQ1+0w6jt9i0bHztlZFChsyoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FL+PmKG6EsXguIEbDFfwc99Z5hK1/VKZ1gLItgx6Ppy47GblvCR0A+MQ8NCADJeH6kBUlklEomWxvD/+RcpZDUPlWSEVSdDDEjC8Ehk+EZMwnwipBfwRVN3Mcm3YAiLY1CWBTff6qCoFFFt5qPwJ7hRK3qBDH87IuTru4pYfxvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6q0Prye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D05CC4AF1D;
	Wed,  8 Jan 2025 02:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302402;
	bh=MO2/BdyLBB8lwImf2FSQ1+0w6jt9i0bHztlZFChsyoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6q0PryewTYNM2t59XKp5POo6cqWUScDUF01GkegXs32u/tUWADOf8X482wlcOViy
	 Jcx7ul9XEJR2oqy5Cl3Z4vNylKLqA+m3RMa+kWORlXi746B8nrsIUhgQNGPfM2fKUs
	 s/F+LPQZpuEXbWr32bhM5w65zy+f2cm1N3X3PaKfI8y4GZc41TtELEW75AxK/zZ7Eu
	 FXLCD4vvdO/OK+IJBkY6F13alFtmfEjASIM3ULZlqMjPl+l6e6XP4Z/KTFwwkqZO76
	 ISUoF8OuNaZc/UhtFCcWz0NRdIR3ZqRuAKwsqnQwMcFMDzokdbca+yxqPC37sm7Sn8
	 8Amc0vN7+iIOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Do not turn off usb_2 controller GDSC
Date: Tue,  7 Jan 2025 20:13:13 -0600
Message-ID: <173630239529.95965.13231058357016952200.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org>
References: <20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 17:55:23 +0200, Abel Vesa wrote:
> Allowing the usb_2 controller GDSC to be turned off during system suspend
> renders the controller unable to resume.
> 
> So use PWRSTS_RET_ON instead in order to make sure this the GDSC doesn't
> go down.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-x1e80100: Do not turn off usb_2 controller GDSC
      commit: d26c4ad3fa53e76a602a9974ade171c8399f2a29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

