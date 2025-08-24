Return-Path: <linux-arm-msm+bounces-70491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517FB32D0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2811B27C0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E371EB195;
	Sun, 24 Aug 2025 02:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi8fXqnv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7E61E98FB;
	Sun, 24 Aug 2025 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004162; cv=none; b=CrczvdwsMZphZNAWNg/FfAyQIifPvHL55sQDZc/aNc4P3KdX2Tg2IlAkrhAHhHxzwDPQSQx4J8W+zYgKl8VZeZaDhZL2Cd5VOmMlgAnR2jgv4yqjisi6RgC5WtW1wFqA/ymgdnYH76hS+zE+au7OkkniT9S1FmHHemcy2wUgPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004162; c=relaxed/simple;
	bh=bF6pKB1gHOgsKgmbN0vYZVWUVNaSI+7tCwLKpxe6a6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeWD8lf9Fb0HDAEpkwXFnvi3o4d7UMAPvppgCY4jVdXH1LI2p4xPwIcWDaWJdjL91fDRciPKFt25hfjOIHHIMwpcZ0nhCR3nug3IWVlOwwcMaaxj0TAmWMr+jGAQjuruksGYQyaR79gn7pE+K4lR0pzRFqBmv9hiogOQpfc6gqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi8fXqnv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877AEC116D0;
	Sun, 24 Aug 2025 02:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004161;
	bh=bF6pKB1gHOgsKgmbN0vYZVWUVNaSI+7tCwLKpxe6a6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mi8fXqnvDocQn8lw6J4qAFYE8AdBOjAU2kaGaHjYFA7GCD7Orowu/JVh+3/o6kuVZ
	 dlUMyOy1ysMPSnd2XgKVGZYkhIDV8wF2oHYS3KGwv6r/JJQG8tAN5VXnXtNSsoUzvs
	 +lUbp5Hc87/3v4cIjsS4dD6ffnlack3MUrSldvgNeBnjT/nrrov8UteA8ndtC3aFI/
	 utp7Znx7jNi0EDUSZUUEMyJaWt/xZEsX2l2ciUUkBh3T5CbS+7tCuN5qqb26RwH1oq
	 gnPW8CPDN1Q3JEybpv85mTzNtcKbVzNEQykUOQ1AJDplqoxceAq3t3BiR5dcJYzfrn
	 1M53YJ5wgLBoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: (subset) [PATCH v2 0/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
Date: Sat, 23 Aug 2025 21:55:34 -0500
Message-ID: <175600415281.952266.1294757377396546630.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701183625.1968246-1-alex.vinarskis@gmail.com>
References: <20250701183625.1968246-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Jul 2025 20:35:52 +0200, Aleksandrs Vinarskis wrote:
> Follow up to previous discussion [1].
> 
> Disable camera specific PMIC pm8010 by default, as some X1E/X1 devices
> do not have one. Platform that utilize it should enable it.
> 
> Affected upstream devices:
> - none
> Affected devices submitted upstream (did not land yet):
> - CRD, as part of CAMSS series by Bryan [2]
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
      commit: b9a185198f96259311543b30d884d8c01da913f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

