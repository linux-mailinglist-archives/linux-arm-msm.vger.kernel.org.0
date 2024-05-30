Return-Path: <linux-arm-msm+bounces-21111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE88D4D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55370283F55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CD9186E45;
	Thu, 30 May 2024 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="SNLrioTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783F186E32
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077600; cv=none; b=LfdwEDGmgfdqY0oRoLg9ixFxTIFHAk2TXJALRks5Vr8yVHhZ2IiwR53O7eK71Up8iixA0yaSKhISPza1XU29TL+4stoTHlBAlyV6BGTE0PR0c9GX312E13nxNzWqf7WL37dmuuQ1ReCLwPWR6HQoZWW2y7d74P8t+YfyP0LZY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077600; c=relaxed/simple;
	bh=BGMSN/kC/1lZ13GJSRoJIin8hbP/S2F+1oiVPejNK2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBuU8z3iTi1d+knQBVKwIU7FBoA1FoiD/mGfQGFqsL8Tw3A7D/Cs8yk2w97pcuos06jGHVyCpEyrJtnxfldulbf1Aku7HAPPdMlEZLT6zBLD3gxjzA2y3DcYT5J0AlMMPJK5fsUrsb1TJXfPN+PqvN1llV7qUnWF0XnVptfQE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=SNLrioTi; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 12B2D24002A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1717077591; bh=BGMSN/kC/1lZ13GJSRoJIin8hbP/S2F+1oiVPejNK2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Autocrypt:OpenPGP:From;
	b=SNLrioTitIddFNzbwC8sn9LrQPRdnqkJAneKIoS+seESGWiZr2mRV9SY7XJ10+D9n
	 2edRPFXgT1SX20pa8FLwO46ofOPIdz88Y9dMwIUwrp02XA6lkoXjndxBmvk6tUIf5Y
	 i+P9EIPjWiKDXQMa7vfBMGTtuKJvJqlZzrVZDOCboBEi3DKN4KmfuDXhzn8XANEtWx
	 MyRpMfnuQFnPMHEjXcoO3T2LpUV0ZShcXP0bZ4DMOMBEdDWayKLOz8+2Kov0g5OO/l
	 Noh3zUozxQJDOEGv4WMHlBpkAirdeT18MEGhlK1mwUbqUfWMgW7duxtPUxLyXHpIvq
	 6P/13DkmH1fOA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Vqnts4VqJz9rxN;
	Thu, 30 May 2024 15:59:49 +0200 (CEST)
From: Alexander Reimelt <alexander.reimelt@posteo.de>
To: andersson@kernel.org,
	petr.vorel@gmail.com,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: Add basic support for LG H815
Date: Thu, 30 May 2024 13:57:40 +0000
Message-ID: <20240530135922.23326-1-alexander.reimelt@posteo.de>
In-Reply-To: <20240403104415.30636-1-alexander.reimelt@posteo.de>
References: <20240403104415.30636-1-alexander.reimelt@posteo.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Autocrypt: addr=alexander.reimelt@posteo.de;
  keydata=xjMEZg0fSRYJKwYBBAHaRw8BAQdAIcaNTdj3NWDe5HQPCUs6oYyQygAJWP9LCzhr+C7RwMrNG2Fs
  ZXhhbmRlci5yZWltZWx0QHBvc3Rlby5kZcKZBBMWCgBBFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIF
  AmYNH0kCGwMFCQWjo9cFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQHqi3OKk8uRJ8ogD9
  EVg4zgfmC2SqXCgms6LETAzVX4CrAS8yMhyd7Md921cA/R8lhm9B96RYgA7MvFPFJb1T6JFY75Jg
  QLXrtIE5llwHzjgEZg0fSRIKKwYBBAGXVQEFAQEHQBGDuxZLOTvppxyM4G18fSR6xzT0xkkPOia7
  Bh6L1vAAAwEIB8J+BBgWCgAmFiEEM+Wy6sI/mP5S0zIFHqi3OKk8uRIFAmYNH0kCGwwFCQWjo9cA
  CgkQHqi3OKk8uRIa1wD8CZDdCAKXstgXY96eeSSP7MecEF5TBdmWOiVgjlEIpoEA/RnGuDaj06B1
  F51wyGAjYXSmn5qFoNHu3yXyLUkFz1ME
OpenPGP: url=https://posteo.de/keys/alexander.reimelt@posteo.de.asc

Hello

Thanks for your time reviewing my first revision.
Changes:
- status is now the last property
- corrected the node order
- droped bootargs
- corrected subject prefix
- removed unused regulators

Sorry for the delay, I lost access to my device for a while.

Best regards
Alex

Alexander Reimelt (2):
  dt-bindings: arm: qcom: Add LG G4 (h815)
  arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts  | 234 ++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts

-- 
2.45.1


