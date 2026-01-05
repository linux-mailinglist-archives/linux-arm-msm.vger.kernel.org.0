Return-Path: <linux-arm-msm+bounces-87483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D2CF4296
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4706A30090DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CFF33971E;
	Mon,  5 Jan 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkbsFiYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42CA339716;
	Mon,  5 Jan 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622103; cv=none; b=UmZPVZ50Tn+ygWi83ICDmtR4HPGSQzf9Ijv8YBA5arAbwEunzwC/Te1ASKxpESbCAQIBd+I+puVNq+0XURi5ljZRj0xngTFNbB5Dt6DU5sCs/ueUkmhuRfktJ/SpLHG5/R1rg8aO8UGkBd6wXO5ryFFzCm7CJY0goYcYAladp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622103; c=relaxed/simple;
	bh=Lee0ba0GV+j8voA0ve0PNmpmtpyEMpDps7I9V5nU3TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLnWY71jcd/a6/DHmapUn2kv6YjXATQEMOboeUciyq67M5ub/UosFeOFdq7/yTSwR7M/QMPcuXrSZQV54xMMpzKcXLHiNfx9zhCBrqYHBLpPWYlX7O2hZV8ATN3q4q0/RbfOYJQFcKHBDbWG4mq/IC0VWkxsu8yxvrEhCBWY6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkbsFiYa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC5BC2BC87;
	Mon,  5 Jan 2026 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622102;
	bh=Lee0ba0GV+j8voA0ve0PNmpmtpyEMpDps7I9V5nU3TE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PkbsFiYaVRe5RYf/BKz6fomCAtTsJ1n+UEC+3VzsgPQk0yvVfgZNPFA2tn0G5XhyY
	 ekOMeveBrafnebeUaTdDiyaFemxKOzx1XPZAMM3Ek///NkTtDszW63o0dIbsoy2MIY
	 ppOkwGlQcXCvxkenTDsq8M+cGiAUP8NX6ibO4ZMVX+4n1XBZpQkNd9CQbI/Kz5S20S
	 7093UOgJRdt/pLsPF8DjxWvrBEDwMZwPmTVOAsX6PmOcyHNyaudNZYyfPgwhx5SaJL
	 +2br7Puhfo734O3xL3tZ+rXKV/v+AiItJX5m30iRwDJ1vtEmNLzp2wyV0KL+kz8yAi
	 6rEmseNuQGmqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Eckelmann <longnoserob@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
Date: Mon,  5 Jan 2026 08:07:30 -0600
Message-ID: <176762206393.2923194.5107204884919213947.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205-slpi-v3-0-a1320a074345@gmail.com>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Dec 2025 22:58:58 +0900, Robert Eckelmann wrote:
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      commit: 2a7dac907be27bd0b86a6f2df3f5feedcb538263
[2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      commit: f4e6e3f827a0c53f38b3186335069d855ea9e9ff
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort
      commit: 5bde31dc7b17b668a02857c30359ac86c23c9e55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

