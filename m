Return-Path: <linux-arm-msm+bounces-44817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF2A0A6F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 03:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6CD168249
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 02:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0EC199B9;
	Sun, 12 Jan 2025 02:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXzvlYzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246D1401B;
	Sun, 12 Jan 2025 02:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736647739; cv=none; b=jgieo0H7js3qI8MOI31p9LAFeqNWS2SIF+KM+Xct8eFs98UqNZNQkrtioCDGlHhxXGVVIuSaqCmR0lZRtU77hWCrzJ7ktUE5gsWuapI/4fkqtvnKw+i3lqSTDxHSs7ZfckC7IWTqSG08QoxZIzfsx8835BqIvN6vogr+BtmUb1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736647739; c=relaxed/simple;
	bh=/0b4xLvA0hs/JWCox+96B3z8kYQD65+O8xEt9kwoNZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NAHMnBJBSj/QrU/D0NgMc+YgaZPnKcSctaTWp0roi75PL8Z2rYKSjpq1IvqMkkGw00hoqJwxTrawNy1ZlB8bwy1ME4pcEEegwlO8ILQQ5VSGw+GVZ+kBVJFli5NpkQX9ia0p/HzPI9N4bOWhy/K5pB2k4mzXIz++LJgHV+eLYAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXzvlYzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E08C4CEE3;
	Sun, 12 Jan 2025 02:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736647738;
	bh=/0b4xLvA0hs/JWCox+96B3z8kYQD65+O8xEt9kwoNZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXzvlYzdhqcDTJSWSL2rPc5tWu0EvuCdq+6zGpcj1PSxU5ckbq7GN8GT9HQz5nagI
	 cicHvUwNte/oOPVtDeB3yaDbvNqshnDGmloZhW1FlGuzG7KHn/eYx+Cg8Av0K/u3od
	 OcIRAt3iBE0Zx4kZ25WebxZPzZ+fkpkKbYj8bsXE/14GkNJmPEwG2bS4KuJhebe+4Q
	 Y/3861qtEroprJ7PDPBnTMsG9Os/oK5Q6iTVp1Y4fhcjKBJ8JNuCkcEiK7aBL30Nd4
	 u82p56u4mqbm1JMu9S7awdrrwQLzYaix4xCVq7p1Ow26APdMCshTZ46sKBDFqPf89S
	 MeMxmDNwxoT6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sc8280xp-pmics: Fix slave ID in interrupts configuration
Date: Sat, 11 Jan 2025 20:08:52 -0600
Message-ID: <173664772973.450688.1551105341991073679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250111083209.262269-1-mitltlatltl@gmail.com>
References: <20250111083209.262269-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jan 2025 16:32:07 +0800, Pengyu Luo wrote:
> According to the binding for qcom,spmi-pmic-arb, the cell 1 should be
> slave id, the slave id of pmc8280_2 is 3.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sc8280xp-pmics: Add more temp-alarm devices
      commit: efd5b51452c7e9fc60b51d09716fe163b67657b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

