Return-Path: <linux-arm-msm+bounces-61658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB76ADE20A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 06:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40181898129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0610A1F473C;
	Wed, 18 Jun 2025 04:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V11UbOjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94241F4192;
	Wed, 18 Jun 2025 04:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219773; cv=none; b=AKju1IIVZjxy1gHBUuj+2ftYGlfD3cC81I74pJ5Zt37xpKeP3vbCKcBQkq2gpzQb+G+jCWSdfei2XaXCKmNdfPfewR80tCDnUD0wXwBZxFDm/Dm78SbIHuQrQdYSSke9QO65BFs3uUPRS8ekHm9aL/uPJfonRWkLVWzOeAdUT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219773; c=relaxed/simple;
	bh=IYXNJRGtSfp5Ce5y022NctjZUNhEDLJExv72PoDcEx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQzN/VmfU12mlqS0QODoZFM8yvHJegT9HnfgdO75Gf3rOHwXVU/Ebwln/2m3uAaDNe4zTcBKGfo2udbVabCA8Diq7oiZtYJVrgLOL6aFjZXgTYOjno+A4RkO5f8JtgxGk/TECSEqV/GML+oZmuxk6A/slFFB4gkIADEzqYHxKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V11UbOjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D621C4CEEF;
	Wed, 18 Jun 2025 04:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219773;
	bh=IYXNJRGtSfp5Ce5y022NctjZUNhEDLJExv72PoDcEx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V11UbOjhSSpCHu+/5Kz0F/v2Ke/B1PQNfbVNa/4m5wyRuW6G3Gehuzrx9LGQZhSqG
	 dYsEXroK7zvIlkFWc6moZWaPn05hlFSih2NQqc333JYgtLwGrLbJ/1P1aPfdoro+zt
	 gVRuKAlhuanME3nBnneomW7lU9Kv+zrhJKAhB90OyEFHoXRcFwdXftos5/FrmTT3o3
	 dhI9ykdnvISLUhZTRxI1wnC8EGBK7hXv1mGakc9D2ganz4+k+5HeZYjiSS9SfVJdfJ
	 bTeNKb+scU7KK0TpBMOxyEPylPpE5fPFP2NjaiOMyI015KQJ8t0qLw/zRxNArwUPlI
	 4rvk/GOifLJVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	maud_spierings@hotmail.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: (subset) [PATCH v4 0/4] X1E Asus Zenbook A14 support
Date: Tue, 17 Jun 2025 23:09:17 -0500
Message-ID: <175021976629.732077.4176179596531014776.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426130203.37659-1-alex.vinarskis@gmail.com>
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 26 Apr 2025 14:57:56 +0200, Aleksandrs Vinarskis wrote:
> Introduce support for the mentioned laptop.
> 
> Particular device exists in two model numbers:
> * UX3407QA: X1P-42-100 or X1-26-100 (as tested)
> * UX3407RA: X1E-78-100
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
      commit: 6516961352a1ef39184a34690ff3cc06953f6fea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

