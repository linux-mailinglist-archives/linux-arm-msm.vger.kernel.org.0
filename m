Return-Path: <linux-arm-msm+bounces-71434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB8AB3EE8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7531A86CB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE7F19F464;
	Mon,  1 Sep 2025 19:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeG4hP1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68321D6AA;
	Mon,  1 Sep 2025 19:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755970; cv=none; b=fZ47Y513QgJwZBoUfWOUgvjhvAeP47Undu4Lg6ozhabAwRjzrYQThZ/r1ZHj0XfZBlcKk1WYY/dc56pjnrO8oxXGSSB1wnO8pRMbeK0Wo37N6Iih1ePPcL2rZdhtxgVLQNpiAtJtIlW5TQVr59TBjhJAXbFmGTDuI47Bfm+ssk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755970; c=relaxed/simple;
	bh=qC6sSXIxuavrBxlbomrk+W4Hqy0DxcDu1Gm++Uu+SP4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+eEsBz246hFUp54Kbkm1owxgjMZ6cbpCF+INo9t5UOQ5vD5P85YHrWxGUm0xZtHlc8Xd5C+mA2zrVIapmsIP4TA3cEYYypGd++s27Y/+vb3XvOPvwfNcX7AZwMrKZdKetzMwsc7buWqw+Xzd51CKlAnIzm2Onx5wkxqBu8Q3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeG4hP1q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8473CC4CEF0;
	Mon,  1 Sep 2025 19:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755970;
	bh=qC6sSXIxuavrBxlbomrk+W4Hqy0DxcDu1Gm++Uu+SP4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VeG4hP1qXqg9hQuFgPgiX7YxLzjGJgKHyTLMxyPZsNATdOmdCgoFrxQv51ptnDi7C
	 NrHDgShD5ALAcwV1XYB7Q8dakt8fgL3v60ozIFL7qD5gs6mxLM0NSNsOQNHrhvyXBY
	 X8gwYDE4ZUQF5DsAvuz2z3vzV9jMcg20f8jG6Uf3cIMuepZw2a8XyZZJDX4AjQwnQn
	 O27gKG19/K3gwnlQpnLceAAWsXvoU0X68NKIHvtCVrFCbisDTzYnn33GqMt/uHLONv
	 FpVFzp1pzlDAHbJaH5DsOXxlSBr7wWKhgDdlamnUI+To243pBi5gsGqkz7sGzmDQby
	 l2cs5U/slDvlw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] arch: arm64: dts: qcom: sdm845-shift-axolotl: set chassis type
Date: Mon,  1 Sep 2025 14:45:51 -0500
Message-ID: <175675595909.1796591.15574673966859221553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
References: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 30 Aug 2025 17:57:29 +0200, Guido Günther wrote:
> It's a handset.
> 
> 

Applied, thanks!

[1/1] arch: arm64: dts: qcom: sdm845-shift-axolotl: set chassis type
      commit: 38c0af1f3fe437ac2f7a5ddce4f35e0fb8a49aea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

