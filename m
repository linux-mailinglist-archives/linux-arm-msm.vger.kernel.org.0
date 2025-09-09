Return-Path: <linux-arm-msm+bounces-72858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F16B50372
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26BE3B7C8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF8C3680B8;
	Tue,  9 Sep 2025 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3/W+Ujy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037783680A7;
	Tue,  9 Sep 2025 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437009; cv=none; b=upjJAOf6wddtCU1okvEW7S7QRlOzrCYY8AqK9yyWG0SHsvQBMtHtv0Ag1FvdwYtU1JIo02c0GMqSWYpZTH3IasYbdLc2KvRs+Y1SGhNuVy4ANyC9ppAyjV6CeCjUDcocrevxXRKJ/ial3P4QLYb8FIH9hT2axGr/H4EWWLUZLA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437009; c=relaxed/simple;
	bh=pIxPGs5AhDh8NcXnu6HcTj1SxT9pjMmyW94TNnfuCYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3UqZSWoshJ/mhg8rX8/TO50IevkJ8hMJUXce+e15MhsYU3eERURDOHkeulK7J9AxEecDxMASgvQkfoZUrKjxM85CDx10QnNZBH9Ut+XXZQ4WYdlUhEZPpxh8Ja0TIYgZCKtyd0te80/QYCSANfwj5WFrf10CLttA0+TRkJ5dmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3/W+Ujy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8639C4CEF4;
	Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437008;
	bh=pIxPGs5AhDh8NcXnu6HcTj1SxT9pjMmyW94TNnfuCYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3/W+UjyBE5P9Uj4Y5HJoSlS/XQH8svybJE3kmQgrE6Mz1D7elFMWXCI4cgBoj4Kf
	 g1gq1rP2FvIJxj0CtDcR6DowaC8Kur6pOrPNmgPQijvGjW6BQl23saYbKZ8bFWz2fs
	 uIc60wYYmPvWG2DnQQjk8VEOq7a3vB51q2SD25yIKa+TChsH1Y/eSdiVTXH8ceuEe+
	 NfxouqJuULRwXaW2zt+c3WeUkmVrm2tu3EeWVe1KMEokRliYKGphldj/DmIYGao+4P
	 B4ZCjKkchKC9/qYpOM4oGa+JcSEzLlK6UFMS9tQmvzqF+QAkDJJSI2B1aMelInZk7/
	 /9RieSM1rk/eg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] Enable audio on lemans-evk board
Date: Tue,  9 Sep 2025 11:56:36 -0500
Message-ID: <175743699548.2735486.564077204832317553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 18:49:00 +0530, Mohammad Rafi Shaik wrote:
> Enable audio support on lemans-evk board.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> DT-Binding link for sound compatible:
> https://lore.kernel.org/linux-sound/20250519083244.4070689-3-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans: Add gpr node
      commit: 3f2d6cbbf4c46fbb9e9aa6fa25a70b0003471b26
[2/2] arm64: dts: qcom: lemans-evk: Add sound card
      commit: 473a19211c4dc762e6ecab9c3e6583afd3200817

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

