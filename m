Return-Path: <linux-arm-msm+bounces-57049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A02AAD51C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC9D1BA38DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 05:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966C51E9B04;
	Wed,  7 May 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRtoL36w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693691E5B7B;
	Wed,  7 May 2025 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595095; cv=none; b=SX6ffiH+KTvJNHs/mzDAMQo7z2lRSYsrt/Qw+i6C0CkG8xoW6OYVYFz0mhdEMgwMNa/tv8GqZHGcA5ltpQgcw+NpIBEcz05L6eGNaZMDW2UaaDM/ShH6pNmTph2jdHwqjd9FMpSJ8UER4qtmLvNkFIiqnYbgRhout00BbU8WHmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595095; c=relaxed/simple;
	bh=UvYxdDTT06iYKixQuhHSencvetVubwX7i3bzxnCzTPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JUboyckHkLA1ky8FHYoHAvkbvBfn7PKJEj6ZVbb5VX0wM1IgV+y52acnVnRCaw+cjNPuRvWjg8ofeSfDH49hTQOxZGFKkjHu0oBcTOsT6Pfcenv4pTuz1ITfSJp5K4hk0TQ81oiGDfsaXutoqWDeyFiUQJQzQPzWl7rb71MLRJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRtoL36w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE42C4CEF2;
	Wed,  7 May 2025 05:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746595094;
	bh=UvYxdDTT06iYKixQuhHSencvetVubwX7i3bzxnCzTPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mRtoL36wkaPxaiTSqjdvLw8Q/AWj7HpHk0UAIL7ktHA+2W4fpU3LwXLWczoIdKJuA
	 xuo92dUcyTm0bvPXmAd6JrWEU4ZKrypQBiOjZxkwbbGg+WD9+3xz3a3y4IfGIaVSlh
	 9WOcyRM74nGPp6/JslAexWFZWFCCBWOxypOshleW8w52+m6aIho2gBEXehSmYEZm29
	 txjDNaXRQPvfpiksi2yJ/POrhdwC3OG3bz2YZ7/ICjBCpW5ZCxHFyKLI0MY/NSuCL6
	 b0fAMWuNpEaFidppTXuJeA0LSZqaAzdxE2lN/Y69v9AOLqHV/3+wP0tCbCK5FCghpB
	 x6dIwXnsE7SbA==
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
Date: Tue,  6 May 2025 22:18:05 -0700
Message-ID: <174659505811.5380.3561194017032215136.b4-ty@kernel.org>
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

[2/4] dt-bindings: arm: qcom: Add Asus Zenbook A14
      commit: 9f2ae52acd5e6c95ddc55d1cc67f44860940a21b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

