Return-Path: <linux-arm-msm+bounces-65366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF4B0840C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 056E4188ED70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC20225A5B;
	Thu, 17 Jul 2025 04:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwJXieYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A1225788;
	Thu, 17 Jul 2025 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726701; cv=none; b=MltQBlc16jwXmpaVfZo0VRJ1sht2ce8Dq83Vw1TzsDzO80jEOc645CZTTAWbkD0ehR4vdWoqZHOg9P2aO8MsL+fAdGhzf0gkk3iyV4QDbGWNR3hsQ1JV/YfiV0QLEJJq7ZclzLKRjjDpZuEJniaLsTdKvDXXkwj1SimFBZ5bTkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726701; c=relaxed/simple;
	bh=ge1UXaVBjwhD75e0YB+LesQq7MovJwnHnKIkh1Mn65E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CeipM0D+DgNC24N64hUG/rIIaTpVCZ2jFlp7mJA789l7Cs4L1Hpt70s9fQmLrjuJAECByWaTAAYeXiLSj6hVGkjBkmFSdaE4Jcy6fmH6SxeQE0p3EwimY+6WDAhxTZmvDu5k++4r5mMr8zWKCh4glf1T41y3UP7ngv6jQ3XaJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwJXieYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515CCC4CEF5;
	Thu, 17 Jul 2025 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726700;
	bh=ge1UXaVBjwhD75e0YB+LesQq7MovJwnHnKIkh1Mn65E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TwJXieYb5ij7VjAcHgRvMpFdG4ewBAPkPDvvLH1LB5lsR2PIftVKnKRmsaOQbhWaw
	 /OeuVKpHCRTi/jGMtGwpji16eW6MHv6bx2lqziJoKflxu5R+qjthYbAHFG4S856KSu
	 k+89H7ymULnflDNSteOk53L8QYQIlYNS7GtrT9Y5R3LjuxD3PRyNDQjj9UG/Ph7Z5Y
	 x9mlNLt4CwV+02BVHnWT2fmnMtB6ZTkXatmuICK2c+f5M7Bx421DsR1HQYMRw6wLSc
	 mjNLW+NU3DU3dsFISV88tucA2oj0zCb8Fjo7GmHv7UvR6FjnJBTjv2fUu46aPGcE0V
	 2MtMxcz+m7TwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: jishnu.prakash@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
Date: Wed, 16 Jul 2025 23:31:12 -0500
Message-ID: <175272667130.130869.13927078281181407784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
References: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Jul 2025 17:00:36 +0530, Rakesh Kota wrote:
> Add the PMM8650AU and PMM8650AU_PSAIL PMIC SUBTYPE IDs and
> These PMICs are used by the qcs8300 and qcs9100 platforms.
> 
> 

Applied, thanks!

[1/1] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
      commit: 50b749fab108c2354bb6368d95aaec82e3c99912

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

