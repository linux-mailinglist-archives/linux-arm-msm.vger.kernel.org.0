Return-Path: <linux-arm-msm+bounces-87328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 756ADCF03C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0FE0303DD22
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA47323EAB2;
	Sat,  3 Jan 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgSVi0vH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433530C371;
	Sat,  3 Jan 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767462714; cv=none; b=kgFP2TqnbIOIIEydzd7BS2oGuaIXmdcdNvapoPeSAHGsZnkpHa3aEUKF1BWilD1C60zR0OQEE8YbpAqMTJTf+vSZ7la8fqQNeRaEDik12xKCiy9kU6yUHOj7MlRJqRRj0Rd5iKEWzMsO2FIzcpIbO6LX4tO6LIkmSdSVXDgwOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767462714; c=relaxed/simple;
	bh=oJ2T4MIyVZdiGIkxCrYO5mF4w+2FTc0DUdP3Ca7gAmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mt4NBpvMmcE/yDt2t6JGf1Sn5nzOItHjd+XXh+WMhSNCvYU9EvD1zT/cBHhPrvvjVeVO4VwfBVcg/m/17Fq5TjUsuKbPlXwE69ubGdV8fuuRfjZJQO5zhosfdbjdcuzk5Ni+xvHildNa9SqPJqw0ZEvC0ioCE63fffTYq3kenBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgSVi0vH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EB4C113D0;
	Sat,  3 Jan 2026 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767462714;
	bh=oJ2T4MIyVZdiGIkxCrYO5mF4w+2FTc0DUdP3Ca7gAmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dgSVi0vHa6WnIk8NSCNys9TKmZR2fkKyGxADBlwehcb7nANK7SqUk293D2bQHFgEM
	 ojGaJLh6ox2uCzEzCDCvZiWxjGAIhLfk+csHONxg9ddoVuZ7tDYXkkHExIwr2uIgb4
	 NlTmyaceKTFkJBMZmg9vvsbmbPoBi83CwaxzdFxCvVqEVKnaLjZ0X/pbBPjmhUQZlX
	 PFHoYshINtDsyK82ciq4Jpr05Y4KtMx73OiWPef9Qi93WWZc6bohP3j+BbqFcoV/4B
	 G6EzLnflZmxqDdEsAXyAsJE3kVvQ880n/mxJjpi+B4wzONAyBFlX195gj6+cCu8yH1
	 FTnNAmKil8S+w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator support for Type-A ports
Date: Sat,  3 Jan 2026 11:51:44 -0600
Message-ID: <176746270359.2648843.3979502814895728200.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219161407.2075701-1-krishna.kurapati@oss.qualcomm.com>
References: <20251219161407.2075701-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Dec 2025 21:44:07 +0530, Krishna Kurapati wrote:
> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
> regulator, controlled from PMIC GPIOs.
> 
> Add the necessary regulators and GPIO configuration to power these.
> 
> Implement connector nodes to embed the vbus supply within them. Since
> there is no entity currently that can read vbus supply from a Type-A
> connector and control it, mark the supplies as always on.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator support for Type-A ports
      commit: 44d1c77a8af492f00d4c36c3641d6386bdc182eb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

