Return-Path: <linux-arm-msm+bounces-44300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02701A0523F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BDD1889866
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A6D1A726F;
	Wed,  8 Jan 2025 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIuHzube"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A631F1A7255;
	Wed,  8 Jan 2025 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311435; cv=none; b=VWkRMQbvw6z0njjnknkD/X36OblPyOeDR6xBvZ05PoBsFWS9LELN4ZBDMapY2tVpEC2rE5Fkg3eEq+1T6oTuIGeMk+yHFwfsOOtZ3u/dU2/2muIoqQG4jWcL9kTOxIuhDfMedPXJ+tXY68LM019Se7gCn60wnRBS33Ib3yDlKno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311435; c=relaxed/simple;
	bh=Nt9n6OFFngcM6fJ+1coEAz3RG34SDG5OzdYvdtKxFTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxSIfLZ7Uh7eb7ml7z0n777eq7+s6B9n2fLWjweHeUwzMuYOACC3V8ni1Ab90PQQiCBNM6hXboDBZJPLc5vvLk1lsLxgPn6d+CGMnKbvgU+xen/3qTYTVahW8rKNwvAkeAExKlMcEcnRj4gEaFquZzDf6ci7NU7TbYZRBoLlWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIuHzube; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CB8C4CEE0;
	Wed,  8 Jan 2025 04:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311435;
	bh=Nt9n6OFFngcM6fJ+1coEAz3RG34SDG5OzdYvdtKxFTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uIuHzube6FFXvTqSBOzhxqiJlv4sLDN/IO/7UVNe4xiq9EGI2p6cMdqm//I0dnAMz
	 fyJXuPnwAJ+9o7B+6mS5Vf+GA8e1YeGaMz/jrGLPmZl6IqqgqmB9d0XMUqTBwYr4MU
	 r6d2tBtIEESqBG786dCS9x2uNHqYYi6gVMKXy8x2mDhh1xPUVlZu37fbGn9uuPpw1p
	 PGL9B4ZhJ7VP9B38Ent5vXRtoJjEjYoZPBTnCb8KezQtz7FU1wnGOa9U4Lp8LZc+Ux
	 0wWJ2XX2pOFkldbNE+71BpKMy7nYI6Rk1DrVSC8WVS4LuZD5CQcXveSCjDRP8ygdMH
	 zsAfLOgXdsKfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Tue,  7 Jan 2025 22:43:44 -0600
Message-ID: <173631142080.110881.13477857225974895219.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
References: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 17:00:29 +0800, Mao Jinlong wrote:
> Change since V5:
> 1. Fix the &CPUn vs &cpun issue in device tree file.
> 
> Change since V4:
> 1. Use ^ete(-[0-9]+)?$ for the pattern of node name -- comments from Krzysztof Kozlowski <krzk@kernel.org>
> 2. Update commit message --- comments from Rob Herring <robh@kernel.org>
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sm8450: Add coresight nodes
      commit: 6e8637db89bf138a0533b5442d9a0b02afa5e3e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

