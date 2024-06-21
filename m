Return-Path: <linux-arm-msm+bounces-23498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A961911A5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460371C21331
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 05:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AE012F365;
	Fri, 21 Jun 2024 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+ZkkU3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90D63A;
	Fri, 21 Jun 2024 05:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947762; cv=none; b=ecD1On7WID15zGmcC7NsSPf0TAF7cOzn+HHYGMRUqDvykS3o5URfmqPkX5vQGU1zcUTgxGAUG4v0qCUHHYvYX23qHMDKJJjPSoihFIJZFJqSFbD0VPh4dMi4eDJIIutkkemJVpdyGrjzJDCasVqhBCQ1+ZB23SyOK7Ow7get4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947762; c=relaxed/simple;
	bh=ngUYofA4miFCa8feNw/DYHUDVbMkg19F6VlgbGgdVuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qn8qmm/M49b2d1c8uyY4NMx0LboFmlCF9x2JlFbdhtbnY5+0QAtmt1IJi89hFxq+0R5+uZkzu5Yvh1lE4YcbDA0cSspZvnqI6KR+6wBxAbs1HvVekvOZpiZDI0FuxuCfy6NiEOqJ5l23COAJCB38KAHa6ZUfMqxvYamd2U09JYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+ZkkU3G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A986C4AF08;
	Fri, 21 Jun 2024 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718947762;
	bh=ngUYofA4miFCa8feNw/DYHUDVbMkg19F6VlgbGgdVuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D+ZkkU3Gf0VS90UE4S0jfWEK3rm4/hvTpc17Boqxbmia6kKg7+Jkw6lVhvAL5uXuR
	 2WY53qHdb2sdWRaDDLAlfGYdWmzseEHT1wzlXmD3OugLEZKar3uHQ8XXl+yX7SJQuW
	 eanRlr/4AE5r1SIIdrnLSWiGrnylBUukb28oB99boR1dfdFZlc55T3T6aUhEPRisFd
	 M5EusB/rshgGcGXbOdQm2o6lTN7CzNHvELjrr6NBXfmQ3vZS0ay3oo5E0KdLmtWeZZ
	 fvtqRItBfc3fgcgV+xi1ICTtI/d1gF1/pFEAqbNahhqeujQNuhQ3gIg5RFPd/C+bG6
	 uAE01NDDmfilw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH v2 0/7] Add SMEM-based speedbin matching
Date: Fri, 21 Jun 2024 00:29:16 -0500
Message-ID: <171894775431.6672.9137172396176465614.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 22:10:13 +0200, Konrad Dybcio wrote:
> Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
> but instead rely on a set of combinations of "feature code" (FC) and
> "product code" (PC) identifiers to match the bins. This series adds
> support for that.
> 
> I suppose a qcom/for-soc immutable branch would be in order if we want
> to land this in the upcoming cycle.
> 
> [...]

Applied, thanks!

[1/7] soc: qcom: Move some socinfo defines to the header
      commit: 9267997fa7aa0b597e8b32cb3fdfe91be1d35a83
[2/7] soc: qcom: smem: Add a feature code getter
      commit: 81bbb2b891174da9301fc0d4fe9622bd4cb6a995

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

