Return-Path: <linux-arm-msm+bounces-87498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061DCF4AF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DEC2300A51D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B42D33D505;
	Mon,  5 Jan 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usUmWyLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631033CE8D;
	Mon,  5 Jan 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622129; cv=none; b=r1tEGwBW3dfNUykbSakgBhIIzjggXh1KiRX/NslaDWNzVgkBwj9zouSsYPIVyDptD6d9GeNbpHJ/YEntVxSWoGrp6JwDEQ9/NZNi7FsnfS4mSikfQEtjeoi/TuygOteYbtPoeLH3fvoP2rUhcj4bRnKK3BUkr0rGJw2Xk9kqf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622129; c=relaxed/simple;
	bh=NZqLDLnd1FHPajxHSK2z/fFDLFW9K7NvY1/kz3U+r3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0ItsXbRYt0cUjJIV0Ay2pDQ9PbEXP3r78l6jPVFDyMiELJluLXkrqJGzej3a1hUc/gwf21cvczdfDjX183cQelpzKDHNe3X7bjiEuHio8maJFPQhRPgmr/d4FLVywwi9zWf0xcp08QtuvfNlyI3MAojm2jDGHwouwmLPm/mQJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usUmWyLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB2BC2BCC6;
	Mon,  5 Jan 2026 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622128;
	bh=NZqLDLnd1FHPajxHSK2z/fFDLFW9K7NvY1/kz3U+r3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=usUmWyLPTVskcfEfD0iMku0BQhQAut07whbYSpPq7STRcnwnVhJiIFGhchW6tmptZ
	 UX5dCEwWIT2tWLBALo6xcwOcb5LJWLPXm3rHlQqq/M4XOJlWUn6PLlDBXbB3ghN856
	 E3jLA31Jk0tNLGg5Da7KZxWv7iIBSKqzz1/dhQ6KfKBAifd5D6Og1NaQSeu0HPTc67
	 p4R/pfZXvY8m7YxKRa3zE5OaKCLwwjdnez8Htt7F/CA+YRLSwP0DL1w7xzOmeP+/HO
	 pu+uqhk42TGZzwIV0aRkw82cy9mN5TUb0EO3RDKsX/hM8k9lU+BO5IBqaKSmCFXXgb
	 TMuQbqlpwGOFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] Asus ZenFone 2 Laser/Selfie includes a battery measured by voltage mode BMS and a simple GPIO hall effect sensor. The following commits include support for these components.
Date: Mon,  5 Jan 2026 08:07:45 -0600
Message-ID: <176762206366.2923194.10285379259334522401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
References: <20251208-b4-battery-hall-v3-0-84e2157705a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Dec 2025 16:59:19 +0200, Erikas Bitovtas wrote:
> 


Applied, thanks!

[1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
      commit: 094a6bbe84d43f04485d565f8174af66d90eb6a7
[2/2] arm64: dts: qcom: msm8939-asus-z00t: add hall sensor
      commit: 931b763e63b317d65f2555ea396f39bacba35b7d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

