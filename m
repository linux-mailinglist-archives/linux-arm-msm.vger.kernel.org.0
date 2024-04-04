Return-Path: <linux-arm-msm+bounces-16398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29787898797
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 14:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2C231F212E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 12:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CB712E1DE;
	Thu,  4 Apr 2024 12:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="as3ZGbsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch [185.70.41.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012512DD8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Apr 2024 12:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.41.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233611; cv=none; b=uFdjAI6qHejJkyhJYo0KgkJUlorJlCIZQxzrI+dzBIgduVRaFHco++MXE/oWoEhoJLn6UgfJXGhvQ5RHAVtS2WDjNMq3D0Skiwo+hH/t5XkOnHtgAplpckBVEk+FcOt7swP9OQRxVY7V4vFnzzsTwkQv20W1opA6IjEFKFPI6Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233611; c=relaxed/simple;
	bh=HgotfOiEj8Ilmv53HbS74QGnER0fEQ5zc9ClqLPVz2g=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ejIhQ6Ai8PnsrO4Po6nj6EdPNkYA8tLt1yLq/AtykVjlm01w0p/XzpVxcV0R0UKvzgJ6yVHqikseaWkCgjQi51lijjguYDkNn/zI10faKsugHVYMetRhygufYnkgs5MoC0DRqCbFn6T+MLsyFTZvFQzCc2zy1cIQIKHbfiluBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=as3ZGbsG; arc=none smtp.client-ip=185.70.41.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1712233055; x=1712492255;
	bh=HgotfOiEj8Ilmv53HbS74QGnER0fEQ5zc9ClqLPVz2g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=as3ZGbsG59hWrmL7A3hPbQ94OPPPEzxHPap/vWikUJAeEoVst9jo8mxySROZ6PGj7
	 j9xIaKxK4C2MeTCMr0Gj+E2GMIE0g5ymID1vseRjo+QyiRKg7tVZuLe3BUIRmqTxof
	 QfK3lkJ/Tk7xboa4EO8nQI585sO6JEuc46w15gt4F/I2m9zwEIuPYijmFJJl5ouLSa
	 Hn/dzpz8+apSn3kVSvXazBRnyfcqJs9GCyTh1DxUTLrMUQyjPhMmEh9Z7xFcnwzstY
	 L2Rzov1CUnz0Fd22p2mRjqPMvsdpFwSfkT/PRF1Od4KBKXvd+8dZDaEIigIWYfgd2o
	 4wR4b+IQGchug==
Date: Thu, 04 Apr 2024 12:17:28 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v3 0/2] arm64: dts: qcom: msm8916-samsung-fortuna: Add touchscreen and PWM backlight
Message-ID: <20240404121703.17086-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Like msm8916-samsung-a3u-eur, the Grand Prime uses a Zinitix BT541
touchscreen. Add it together with the necessary fixed-regulator to the
device tree.

Most of the Galaxy Grand Prime use backlight drivers controlled with PWM
signal.
To simplify the description, add the backlight with the necessary clk-pwm
to the common dtsi.

---
v2: Add &touchscreen. Keep i2c5 enabled
v3: Drop linux,keycodes. Add PWM backlight


