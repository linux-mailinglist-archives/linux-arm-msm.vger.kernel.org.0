Return-Path: <linux-arm-msm+bounces-87492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CBCF4389
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CD17306434A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8346433BBDD;
	Mon,  5 Jan 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAhfCBie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694533B967;
	Mon,  5 Jan 2026 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622121; cv=none; b=ieh95KShrFJQlQmHAMSix/PGuzTmWqRNBOWrtr7iUHBW2W4/wNJCbVVuOQq68D4+mIhyEdzYGFWKOI1uQLv1vXJ8o/hELY1CmDhxfSTDBAYBTIlEyDkq62b38I5SFQglA9jsZGyQjl2o6xq5FzzvHsV5bd0IPsW+Afg1AveUl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622121; c=relaxed/simple;
	bh=6O3+y+HG0ndxtLBKPQttb3kVoj31kwuojSEzjwVFkgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pRYZ7bhwPMhkoGm4difMlhGe6Mr4joDuM5PPkkJIrrVk0kGPwEpCjbmVBdp0xbfoZMO6UfCP7+3fTa2yIO8dpyoyKSIpM4MoRgu0RujifnJAISFJ6keulx7a2xa5LoGGi8B2jTiMBVstrEOJMbE6aichms81Q9DWdmeGx2fsCE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAhfCBie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C26C32781;
	Mon,  5 Jan 2026 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622119;
	bh=6O3+y+HG0ndxtLBKPQttb3kVoj31kwuojSEzjwVFkgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAhfCBie1Xg0Sd5NeIvaj0DHnZTUYf0yfdrLTbA6av+K5Elz4HX0QuKY6/HkFhoCI
	 iwH8TLiHYaoXfZQTFyn/Lpw1LYF3oyjJPclB0RspaJGXmki6gwzRlI+zMR7Jbe/ZPV
	 rnYUKbh7TCTPfa8h1KSrnJFVLtpcHH3wAvFLInIdSTZ5jTMGV/Y7eq8BobUHynFY97
	 ZXj0WBwJVkOmgZWaUgH4RSWvfiWNT47VFK1pX9JqV2/owU9ZNzoUcLZCJIUETqvSKF
	 SReBmjpY368T9kFJ+OL/EhVDqkOgLl8Ag9X0qOPoN6H4L8ycfA2WmCQvv3snbpZXgM
	 Rl6GvaWYEAt0A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add support for SDM660 CDSP and ADSP FastRPC
Date: Mon,  5 Jan 2026 08:07:39 -0600
Message-ID: <176762206417.2923194.10858113169390489876.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-adsp-dts-v3-0-d1f1c86e2e6d@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Nov 2025 21:55:05 +0300, Nickolay Goppen wrote:
> This series adds support for SDM660 CDSP remoteproc and also adds
> FastRPC support for ADSP.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
      commit: c0c32a9e3493f9987fd6635bbaf7260dfc09ee29
[2/3] arm64: dts: qcom: sdm630: Add missing vote clock and GDSC to lpass_smmu
      commit: a044cc859dc93c7a32f0c24745242bd3f0a04db5
[3/3] arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP
      commit: af2ce7296643767a81c96d12a8d367afc5091df2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

