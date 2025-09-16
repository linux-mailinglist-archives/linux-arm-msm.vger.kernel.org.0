Return-Path: <linux-arm-msm+bounces-73778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73035B59EAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 19:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F3BD3AFB23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BAA329510;
	Tue, 16 Sep 2025 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQdDOSiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA03329507;
	Tue, 16 Sep 2025 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041915; cv=none; b=c7cqH+h7YerOGSZh3HZaXk7Q8vgaNj8MsEIae8SSdPnE4WPTnyOAqSnzbAeJs+RMgEk7q45BpI5w1wkqgaZtrJY0hBfQB4cN3bcAF8OriHLoD4CYYajvn2l4kFq80S/wsu9qKDRA9Lmw6zQfjCJIeOIw1DxIAQ8kjJ3YPzPzCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041915; c=relaxed/simple;
	bh=5jpgW/taQoRjrH7fWmFshvZbv+5XefS9vlH6JfwCvls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e3QXyuQt/VSqnmJaEBkhzQVblj+2M1+1xUXSqYZmsFKsN5VmCqOjOo16UIzh/U1Yr/GMk2kShlASz+0dTGzf/4N59qLcHh3Jo0i4XRDMmkBrn4zAG+dwnaRbEZhFgzdpHw6voVX5K4YrdeMlN034Pu/llAfxtK/EFQFWLDEpn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQdDOSiE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49FCC4CEEB;
	Tue, 16 Sep 2025 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041915;
	bh=5jpgW/taQoRjrH7fWmFshvZbv+5XefS9vlH6JfwCvls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQdDOSiEGHBu3fzW1a9v4JdpOiweGIwA9tkxB1/4OiM+ZgwueRim5FYVrh7PYUJy/
	 zQyLNt97XZtpnICQVPJ/d2N6yryQuhp3kAr3hi9W4TYizUGArTc7M/IedEzOVbizTC
	 d8ZeqMdcZOJ95AfAIeieyQeYSB2TwkL+YrFFMFeQvx38LkP6iqwOr/biD7g1vFz+Ye
	 +gMvyShyS4o0BRqWDxwzomCnvnacIlEbxUf50ZQM97J+zi2FKUvOxfp8ldLEboR2t8
	 jswp8Ge0ky2W6JCjyCe1SVzkx1vmmlMxlcBNsf1Csv+fLaITziqRhO1XBj9dY5jvsG
	 bvoMDofHBwnPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: msm8916/39: Add missing MDSS/SDCC resets
Date: Tue, 16 Sep 2025 11:58:18 -0500
Message-ID: <175804189847.3983789.8145952973228554616.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 15:28:29 +0200, Stephan Gerhold wrote:
> Add the missing resets for MDSS and SDCC on MSM8916 and MSM8939 to ensure
> that we don't run into issues with the hardware configured by the
> bootloader. On v6.17, the MDSS reset is necessary to have working display
> when the bootloader has already initialized it for the boot splash screen.
> MSM8939 has the SDCC resets specified already, so that commit is omitted.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: msm8916: Add missing MDSS reset
      commit: 99b78773c2ae55dcc01025f94eae8ce9700ae985
[2/3] arm64: dts: qcom: msm8939: Add missing MDSS reset
      commit: f73c82c855e186e9b67125e3eee743960320e43c
[3/3] arm64: dts: qcom: msm8916: Add SDCC resets
      commit: 456dcaf570043e60978352da9b2a55d067fd290b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

