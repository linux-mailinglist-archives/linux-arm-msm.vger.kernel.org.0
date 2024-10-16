Return-Path: <linux-arm-msm+bounces-34612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29A9A0E40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3771F23A45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42A120F5AB;
	Wed, 16 Oct 2024 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzxzG/Un"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9820F5A5;
	Wed, 16 Oct 2024 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092736; cv=none; b=msJIi33InZaw9MTM8pAikaVaVzk63CfESOSqMxmgFkQk3kw64C7Drxs5Ks6RKf3O/MNlhDddpM3xKuub2hT4E7ZYUYtgB4S2cdztTExtL2BsuTUI5HAYZHMtmMKjtne6gp4KQwP2lxAHVtrL7YeO9Ak+qmX2pAloJN06tI+3S5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092736; c=relaxed/simple;
	bh=3zW65+rf392B0+ZMoo3VipThyp2lMfdOmdpqeD14zlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=auHaXFx3NnNXyGygolEovSoqWQ1SazSt46uMmmszZoZKyTHARcdMchMEoFy+FM+DNmZbCWhO1GYqbJAS8L3/7Nw0dUB79AE+HbsywmIn23eKAcmetW0DLyHxnYT/Y6urpxKnK1ZRQL7+zXpz0mP3JCC5AV5jN73gr1/vDi6Rgn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzxzG/Un; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C062C4CEC5;
	Wed, 16 Oct 2024 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092736;
	bh=3zW65+rf392B0+ZMoo3VipThyp2lMfdOmdpqeD14zlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzxzG/UnfPUU+zmfmuFDLu2iNI/MeT4AQWV3pnCH/6rWK9wlC0XiWLT+0rEiBoA8x
	 w/jpieTBUrggLmdkKlZIIh5bK72H8kG96YmnEy7adwXDnY1EffR9Bk9H78I7E/zzVx
	 l8rLS8Tqv5NR+OZEZ/mWYrG/IDbg0Dk1O/7DyRnraLaYV+o8x2KzWFUozDP4lnrKdR
	 CGcjVBdvZdSN4RxZidATFf29tRnve9fSpUgqN2TF1EdqftRQS+rz99y+wwxM9wo1Gh
	 Cu6x5koBOvvaRYBaZyzqKMJ9LBWcOKn1KQ0lOrO2VAYINgty7LkWnhzS9nvVu6E5dE
	 sqGXMIefRrOrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	robdclark@gmail.com,
	peterdekraker@umito.nl,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com
Subject: Re: (subset) [PATCH v4 0/3] X1E Dell XPS 9345 support
Date: Wed, 16 Oct 2024 10:32:12 -0500
Message-ID: <172909273717.703216.4462180003074349859.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003211139.9296-1-alex.vinarskis@gmail.com>
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Oct 2024 23:10:06 +0200, Aleksandrs Vinarskis wrote:
> Introduce support for the mentioned laptop.
> 
> Very similar to other X1E laptops, device tree was derived by analyzing dtsi of
> existing models and ACPI tables of this laptop [1]. Most notable difference were
> * TZ protected SPI19.
> * Keyboard only working after suspend/resume sequence, will do a follow up patch
> to i2c-hid.
> * Lots of small deviations in LDOs voltages.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
      commit: 1aa50217d7fd1b9932d3552a20c2f7fd58d77cfa
[3/3] arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
      commit: f5b788d0e8cdaac7df6ec9a24926672965d87dfc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

