Return-Path: <linux-arm-msm+bounces-27188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB093EC65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60442828CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DE9144D16;
	Mon, 29 Jul 2024 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5DXYi1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36532144D03;
	Mon, 29 Jul 2024 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225547; cv=none; b=beutAGIScoDkyfZEt2o7dQL9smxuZw3i+V9qk07oPBM0SR6blLCi2kOaSjonBsx6b3X8JQKicSQ9OFgaNKGL6VunlgA6wgqKkCEF9JIaAV72NGnw5D0iMXQmLwgnOZHB+Qb8pCeH6HzfCgWb9cK2F9+M2i5ctGt+K3oeCFqY/Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225547; c=relaxed/simple;
	bh=ZvSyVaboexsWB+h9/NpxSy1wxdqwSIv8031RETGRcAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1k1AiibeEMNh+/4+Y/Z8EtRs7HzvwGWZg9jnjSahHFg2QYbRgfiqFYrgFysViwM4jmy0Zgy/KtV0UlBm4JhCkFAtbNsYi2UeE8GT0kHLU6zsxOEitrELUUSidPeHNn2XEM+dDdR2U33Au+6phEvOPGh5Ogc1lEw1wN9Blh0D70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5DXYi1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645FEC4AF0B;
	Mon, 29 Jul 2024 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225547;
	bh=ZvSyVaboexsWB+h9/NpxSy1wxdqwSIv8031RETGRcAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n5DXYi1o262NCg91RjCfKuX8b+KTSGSNt+FSgL5s/nyPZDclTr3KrwRbXdzlB1Iy0
	 Ri/pO5bOjA0atK9o4hxt5aOBdmMB5LxOZH5/eBQQgbck786cF9WNPrSJw/kTCx1EB2
	 rohSXixnJ83YWSKVbrtkyKxfvOJgVXP6iEwIay+eD+0mJ7reG14Em2jJ896HMSo+2p
	 ndV2v2ucKl0E8OKBvwOOsNDSck9YEG30H+gBKwZJQORcgWe3VkY8n+I7kW11fr+KIi
	 GC6jSajb1E3XSxobcre7/N3GyHCj8nhPNaLTRsGxtWrdaBMZpdXMXh1/gpatWJiyP/
	 wAcAZbZhedQHQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] arm(64): dts: qcom: fix dtbs_check warnings for qcom,spmi-pmic.yaml
Date: Sun, 28 Jul 2024 22:58:32 -0500
Message-ID: <172222551300.175430.3657957526572999967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725-pmic-bindings-v3-0-d7f6007b530d@linaro.org>
References: <20240725-pmic-bindings-v3-0-d7f6007b530d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jul 2024 10:25:15 +0100, Rayyan Ansari wrote:
> These patches fix all [1] warnings whilst running
> make dtbs_check DT_SCHEMA_FILES=qcom,spmi-pmic.yaml
> on both arm and arm64 qcom device trees.
> 
> [1]: There is still one warning left that was fixed by an earlier patch
> by someone else, which has not been picked up:
> https://lore.kernel.org/all/20240606181027.98537-2-adrian@travitia.xyz/
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: qcom: pma8084: add pon node
      commit: 611cd69fe4c737c37a79ef7b99a2f15aff252d1d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

