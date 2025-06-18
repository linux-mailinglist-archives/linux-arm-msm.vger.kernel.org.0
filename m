Return-Path: <linux-arm-msm+bounces-61670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033B8ADE233
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7A65179B26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9A421CC79;
	Wed, 18 Jun 2025 04:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uM7sMVVq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F921CC61;
	Wed, 18 Jun 2025 04:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219788; cv=none; b=qb6ilmKPLRHV/KqSikZ2kTcHbmMXZs3yDXTFpxQCAjh46ntIlRsc14B8gQNbU9j3iWF2o8YenUqcKzNURKUPffCKyPLlXxAsaPYT5tuY7uFiXnlohvQsXOcDsCVz9k9FKyjyTRdYHFvFIdi1MwVjsFeQOHnC3gA+tx2sz//1Mqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219788; c=relaxed/simple;
	bh=COJTThaCK/8L2OHP7wg7N3BV+QcaGRYRwyWHYcAv0Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zz4T5s+I24Pg/qEiMnESXl45qoWGus/ZBGPY7uQCM0+CH/z5QxlZlLKaeezdweSJYw7ZNnlLpIvmCej5wRfuzvM5+4/FUAt5tffqwVyiBASRQGPaps/qJt+IILLGFK2mn62iArXp7NIb6OvVgCWekz+7vXRjTAqga09UczFSkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uM7sMVVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DC8C4CEE7;
	Wed, 18 Jun 2025 04:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219788;
	bh=COJTThaCK/8L2OHP7wg7N3BV+QcaGRYRwyWHYcAv0Ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uM7sMVVqZzieykOWf5hS4+9XAGWY4Sqco/0loK10fCj6ghc6oiGvMS23TQaXwkve5
	 wVa/R/hDgRaTVihGQImaN50oiPW5OVmx+S89pC3r0Ftkz+aWESmrCup2n8UhOBCuhP
	 757Kr67qx03FuD5hMzicDCOllU+xR9CX/g7ZrjAF6kTJyiKfywMOu29mDEr2aL4urP
	 cDrZ0tZafmV1ProgWa2KeNB2SPCOHdABY8yT7knLNVt3SfNXIdcoP7Uxmro99Z/f3p
	 Rc9tP4E9vb8ZjiMHizyqzw3foshx8ZqOcvrNa3YHE/eyO25jZugoElb4P41G64N881
	 jfdDfec2ddFfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: apq8016-sbc-d3-camera: Convert to DT overlay
Date: Tue, 17 Jun 2025 23:09:29 -0500
Message-ID: <175021976632.732077.15697211673221786163.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408-apq8016-sbc-camera-dtso-v1-1-cdf1cd41bda6@linaro.org>
References: <20250408-apq8016-sbc-camera-dtso-v1-1-cdf1cd41bda6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 13:38:42 +0200, Stephan Gerhold wrote:
> Follow the example of the recently added apq8016-sbc-usb-host.dtso and
> convert apq8016-sbc-d3-camera-mezzanine.dts to a DT overlay that can be
> applied on top of the apq8016-sbc.dtb. This makes it more clear that
> this is not a special type of DB410c but just an addon board that can
> be added on top.
> 
> Functionally there should not be any difference since
> apq8016-sbc-d3-camera-mezzanine.dtb is still generated as before
> (but now by applying the overlay on top of apq8016-sbc.dtb).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: apq8016-sbc-d3-camera: Convert to DT overlay
      commit: 3a931f4aa3982f77f32050b4869afa76a711e5c7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

