Return-Path: <linux-arm-msm+bounces-24202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69F917754
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20BF6B21EFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9864145A1C;
	Wed, 26 Jun 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ttc+M6EW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87621448E0;
	Wed, 26 Jun 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376267; cv=none; b=Y6zB5nwGxqLasRFzd6ajKTghBycZwrFfdCGiIHvPG7IOFZapGl+a4WeuAHrRLrofU2DWxyQ5idsdeoBxfd7jhswY2yuagR2V/K0nvBUff2bfnSb6jbc5f+oJC3uBm/jnEsO5ef5dwMvmgVeJt+bzR/WvvBEgOboyfYUTYzmWH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376267; c=relaxed/simple;
	bh=zIa9N2NCMv1o+s0I9NXfgepLBJuxyjynCEF5m0tJxBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSg2T5S7AOAhfxUylI4ykvZFreehr8ypw8qDkPAhFFXgGh9sqMLEzoT1yi8xgdZBY2lnvTCptCs2ZssQP7rNFnBjkxZYYOCQcPQ7bPhIirxULPsRd/9Xyu+aCrrDalhXqJ8U4sKT/UGAP9rx2ViCYIaRNOv/oHi76L6UjVHkDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ttc+M6EW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A848EC4AF0A;
	Wed, 26 Jun 2024 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719376267;
	bh=zIa9N2NCMv1o+s0I9NXfgepLBJuxyjynCEF5m0tJxBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ttc+M6EWk8DlyKpulbyOe4YRnVSUL1Y6r7hI5eVmvnfvrI1DwLTHPqQezZSQnX9Ea
	 0GXMr/hLrTzJrNhiLlbvHOe9ih1p4mvrbV2T8ug15gACNj63mDyqZABOpuFinlmk9E
	 gFRc628rSKxws7vzbsb+oP7ec/07mZnsaa32PUT+Ep9bHaak4GyK1o44KPGYzJl0yQ
	 h3mskrx+R1DVxtkcczWDGbI+y60QbicG4amm9OKmo6kd8H/TqfqSp0vAIlc1v4vJ/3
	 R4GX1mSmN7litnIE6qeDWY0YAZXMJDyib1FHeEqYS8t3yifwkJFRQaObyzK9oXF3+8
	 mkBptz17QfKTg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] ARM: dts: qcom: msm8926-motorola-peregrine: Update device tree of Motorola Moto G 4G (2013)
Date: Tue, 25 Jun 2024 23:30:55 -0500
Message-ID: <171937625571.44413.6768999628112053708.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
References: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Jun 2024 23:22:26 +0200, André Apitzsch wrote:
> Add accelerometer, magnetometer, regulator and temperature sensor alert
> interrupt and update framebuffer supplies.
> 
> 

Applied, thanks!

[1/3] ARM: dts: qcom: msm8926-motorola-peregrine: Add accelerometer, magnetometer, regulator
      commit: 65ec35baeb937e91970c5d88118c5638d8582bb3
[2/3] ARM: dts: qcom: msm8926-motorola-peregrine: Update temperature sensor
      commit: c9c86387ea1c4034fec34690c7cf2a96f9c21196
[3/3] ARM: dts: qcom: msm8926-motorola-peregrine: Add framebuffer supplies
      commit: fed1c79fc7fe10900d99a79a36e40443f3267ef3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

