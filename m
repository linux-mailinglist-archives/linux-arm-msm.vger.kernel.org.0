Return-Path: <linux-arm-msm+bounces-57764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46073AB5E11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB7A19E2A18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A44E2046BA;
	Tue, 13 May 2025 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQb0qC+y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9321EFF9B;
	Tue, 13 May 2025 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169222; cv=none; b=dPkjw47SitcFAuoPqOBVUtX3mU+OPiu9iNOtWtXXYN5JB4+CrqyZbjSBPgE2IYU2TCgug89MLwfG3z5ZZbUbv2MiLZLVD/2sowCTcstKTO/JamtwxewbuG3nTmMobsShPrc6q0zcYa/UgisgAE07akVnQU34e2/sjwQVP/mtty4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169222; c=relaxed/simple;
	bh=91T1VPpN0iD8ktDa7qsOceVNZlZJTp4gav1Jy25LnSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Chgg6VHUG/Fdd67r1xGITWbAMVRf4YyXZnNOXRwwQDtF80Iu1zGUzl+8Qi2QfNVR0jaMRriEEFYLYQV7H9ZJDc8oBO/aX9hlucAWPwS09yEPZdO0FZQs2M3IJ3fMpJ8GgvotEdBxmlMJbNQqxoD5Pf6t/b8yDQx6o3uT3ChgfO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQb0qC+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EFFC4CEE4;
	Tue, 13 May 2025 20:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169221;
	bh=91T1VPpN0iD8ktDa7qsOceVNZlZJTp4gav1Jy25LnSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQb0qC+ym000T53oAyQDwuHJRpVGuGBoVFyShbm+el146dau8o2JDPo5yxkgxKpti
	 LL50ws06ju3UEMaDdSS+su6PDAzv6pLH4NaZOy+obXcwx1X85nF8xUMLLePAD9g6XQ
	 g7rY8Y1qcePT8OjIDPPCyC0u4pGh181Uey9HNrRFpxhSPr6xGxJ1QSfc3gQYofz6Kn
	 A0N/R4uit7/ngka1Qut71KCitesZetpE/SjmhTnHFQL188qDH1P93gT/pCJwmi1JTs
	 S1SQzOBhP7sloLPAa4ZrRSoMG7L5s3KM9G3VfLXYJDAmMsei5WDu0TIKWqVIhbXIv5
	 BzatqSTAUTu3A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 00/10] ARM: qcom: fix APQ8064 schema warnings
Date: Tue, 13 May 2025 21:46:40 +0100
Message-ID: <174716895379.39748.10076819557208209836.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 15:21:53 +0200, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> [...]

Applied, thanks!

[06/10] ARM: dts: qcom: apq8064: add missing clocks to the timer node
        commit: 4b0eb149df58b6750cd8113e5ee5b3ac7cc51743
[07/10] ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
        commit: 325c6a441ae1f8fcb1db9bb945b8bdbd3142141e
[08/10] ARM: dts: qcom: apq8064: use new compatible for SFPB device
        commit: 2a1282861b73a4b8e45904e079ed3279c3f1c93f
[09/10] ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
        commit: 92c377bcafcddd43d4dca1aa60c865cdd2d1dbbb
[10/10] ARM: dts: qcom: apq8064: move replicator out of soc node
        commit: f2420037d90a8354594b3da541e19dcbb60c75e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

