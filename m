Return-Path: <linux-arm-msm+bounces-73988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0744B81A4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 21:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877CE1892E12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 19:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2AA2BD037;
	Wed, 17 Sep 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y15ptXCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2134BA5B;
	Wed, 17 Sep 2025 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137546; cv=none; b=o/btI0p+AlBmjlXtuminT1GoHqK936SxtyuNW+O7AHR9vWZ6qXPs2QyigdUJSfKkU+fB7lfa1w2vH8QzeI/TbF+2Dz2iNYNMQOFlInixZjh3dutNkcxBfoMRagv+A2wlSTEjPWXs0idrT4oaNIl+vAZmCpnd9HK2o8vuAFCH9xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137546; c=relaxed/simple;
	bh=BQ9vg10uTh0RETSo3oUECvSfFUlwcB6Bm1G8JleKmSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DA/u4cP3UlnzNdN0QIZfI0Ka/6Mnpdkxl4G9KQBkPH68nqm1ud0CC4b3NyNo2bqx+Fa9vRnmr6TF9ugl4DMOR0eaExaDQVkIqtPROIEzsH1fBtWIZpJWlNzjWAOcO0E1Iz6fHVF7hcrTxHVc0p+ArpyCPwdYV/AR/HFAZYh8tdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y15ptXCy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A1AC4CEE7;
	Wed, 17 Sep 2025 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137545;
	bh=BQ9vg10uTh0RETSo3oUECvSfFUlwcB6Bm1G8JleKmSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y15ptXCy3OkvHw3yQiaAJRCsM7iDYlMMA6NG6wJH428wPOjHi9p2+XABusOsmRNPE
	 63b0E1ZM4gOVrvIppx5UJqPF+IiBljV6s/yCfOp6h5+A8AAMFCaE7bQtdCwQOA6u17
	 /zDJUsPcChdubKeMJShMk7WMjupHCiEpHU1zgvdYZEVZqEStnw2huVbj7CIlVmnWDJ
	 S4vslk9JAPiMnRSkcKJZjsXpzJHoLOyl4QRGHpvdI9Vff3d92yZHFIo5GgWZN7tSzV
	 PPqXV7CoaaAKqqFlzSnUsA4N0fk8Smuas5ZBLgSE7lQauSPhLiS+rroxrUDop0itia
	 +QukcYE2SdNMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
Date: Wed, 17 Sep 2025 14:32:19 -0500
Message-ID: <175813753508.68230.3127732514683313178.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903-daisy-sd-fix-v2-1-e08c50f3be57@mainlining.org>
References: <20250903-daisy-sd-fix-v2-1-e08c50f3be57@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Sep 2025 23:27:33 +0200, Barnabás Czémán wrote:
> SD detection was not working because cd-gpios flag
> was wrongly configured, according to downstream sources
> device is using GPIO_ACTIVE_HIGH.
> Fix SD detection with change cd-gpios from GPIO_ACTIVE_LOW
> to GPIO_ACTIVE_HIGH.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
      commit: 48e7e8996cf78101da5aa8292647ed960506da03

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

