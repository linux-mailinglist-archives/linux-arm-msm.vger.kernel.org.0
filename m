Return-Path: <linux-arm-msm+bounces-13296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5E870C60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 22:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E852861A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 21:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7115B1E9;
	Mon,  4 Mar 2024 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPCfcJOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9E4CE04;
	Mon,  4 Mar 2024 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709587432; cv=none; b=q8YwzIOO4QXbCTjQwt1vw4vXSX3J5UNjsG+QSwtN1VxSNEarvLXuzpr2TylBgiCBQ0EVKuawsZwY1osqKux2i3x7QbZtXRf1QeYRZNUdUM/qyw97YaQnStz8wBwo3wiOrfUPBN5SPDDCpWlX6C47SMK67kS8qSc0MtKkvEi5AhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709587432; c=relaxed/simple;
	bh=oHG8INmOw2dZnUZ4IgJMy+5PKtU4MlAGQvFPT7lyBrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFXDs0HxXJauch6oBHVrdIgTOhbWyP7mInXSGiphsn4AcFCmi1QaYBqO/fCkPLukukG1ic48+zhKjFpQb00OVV0kEfh9kbwBQeOLN9o3SK1iy2kHnQ7TVzZaGVpBrZXIW0n7ZW5gMhQZTvGcardkzkiZezD55q+OT1oeBceD0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPCfcJOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCB1C433F1;
	Mon,  4 Mar 2024 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709587431;
	bh=oHG8INmOw2dZnUZ4IgJMy+5PKtU4MlAGQvFPT7lyBrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oPCfcJOXfoiijcd30ibk5W9bR1oYw1sWoydB4wnCmyP87kswUgpvWeMMeKeXmEBRS
	 8lc1+Ft8Hq7ytQN0ufGhmQbhfHF5GB2gFKKXeR+rUHe9Hnbi1kiRaKIhKPReO97/Wz
	 cgcrJNE47a6ElRD7XyxKIJ92eBe36Q43JdkLPNc72eyxbGs6QHwgszkxkOAd5VeLy/
	 ZIjK53zf909VdfVpnHH7MZ+9ISGt88CszMY8k331RFrlxnT7OXT+2x98pM/eVHvchv
	 rjH/RqnVRy4Bqe08eSz4iZK+9N0s+J9Xs40izwnRsgHephOlGZKDn2FAhvHAh2ASBk
	 P/f4zndgu08xw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: qcom: msm8996: Hook up MPM"
Date: Mon,  4 Mar 2024 13:28:40 -0800
Message-ID: <170958768033.1828118.14643732925847174246.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221-msm8996-revert-mpm-v1-1-cdca9e30c9b4@linaro.org>
References: <20240221-msm8996-revert-mpm-v1-1-cdca9e30c9b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 Feb 2024 01:07:21 +0200, Dmitry Baryshkov wrote:
> Commit 09896da07315 ("arm64: dts: qcom: msm8996: Hook up MPM") has
> hooked up the MPM irq chip on the MSM8996 platform. However this causes
> my Dragonboard 820c crash during bootup (usually when probing IOMMUs).
> Revert the offending commit for now. Quick debug shows that making
> tlmm's wakeup-parent point to the MPM is enough to trigger the crash.
> 
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: msm8996: Hook up MPM"
      commit: 4f423c4cbe26d79d8974936eb01e0d6574c5d2ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

