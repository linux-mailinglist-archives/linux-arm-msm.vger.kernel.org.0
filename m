Return-Path: <linux-arm-msm+bounces-18449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2598B0C8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 16:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D2EB21876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 14:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A17C13E02C;
	Wed, 24 Apr 2024 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Dnto/3XR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A82E646;
	Wed, 24 Apr 2024 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713969035; cv=none; b=ildidR9VHIujt4ImQ29UfyOpLYtgI/5T8Il7h9ZQ1NHPOnjcFQn5YoCaxDt2wKMnw9+QnShcHr1fYbMRsCgbTU0vhtJTwxTeHAfAGR2yMMe9n9olKAmV0esNsjenAEqMy1ZEosWTxozIUB+A8Gy9kEUi2cYkkOvUNPyM0THSm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713969035; c=relaxed/simple;
	bh=YuHq8eA6SLCImHbONPdueoD/jJr5PUsm1Eh9BqfAMj0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rRnYV7CwOSwe4I9KHCw6fcYdDrLHPvwthbHdDpGgUxiDXaGxilM+zZ2vkhoViITLf9dScqyW31WICBZS1mo5mMYBYrz6uqsp6dON1gQBQPiWUOfL1Y1NeALgMAfLGH4YGRR6aiAdAbN2isPc4+yT+Kah41Fe7rBhG3YtAtOlfec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Dnto/3XR; arc=none smtp.client-ip=185.70.40.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1713969025; x=1714228225;
	bh=YuHq8eA6SLCImHbONPdueoD/jJr5PUsm1Eh9BqfAMj0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Dnto/3XRvMRkn7pB/ihDgb7fwrQ84Fw9+HWL7sV5CXy30r93r2IorgCl3zSw8ubhW
	 MjYlWcjmBuvsIt5XHkbUwJ+PIUFhXGqpa5E5DoN3AlybmfBVToou4grSiz0tHjtSUJ
	 89mfV0CY+pjNpWCdI7V5idIlg2XCbT9Ang1c63AqJsPnRTiDNDqJwTo7XSABLcPHRP
	 u0Fd8qdWpqmuXAHhSnm705D+4aIhGWlUuf4Ydxf8FrMuzKo8IIT+jIAWCE/g/gGzvX
	 v6Rc37Zp7vOx6YSQWC7XwDa5ULYjv4qzqhYhepONOrDkYu6B4NTrYXx0x2sOnWKslb
	 AabyLwU7kvsjA==
Date: Wed, 24 Apr 2024 14:30:09 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jakob Hauser <jahau@rocketmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 0/2] arm64: dts: qcom: msm8916/39-samsung-a2015: Add PMIC and charger
Message-ID: <20240424142952.24134-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 0890518e4e5b3ebfb83d1e0e134db4545b8ea97b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The phones listed below have Richtek RT5033 PMIC and charger.
Add them to the device trees.

- Samsung Galaxy A3/A5/A7 2015
- Samsung Galaxy E5/E7
- Samsung Galaxy Grand Max

---
v2: Split the connector into another patch


