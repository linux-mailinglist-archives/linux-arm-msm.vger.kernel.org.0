Return-Path: <linux-arm-msm+bounces-51474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B2A61B63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6114719C7782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D79206F01;
	Fri, 14 Mar 2025 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ul6SSsiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB282066F3;
	Fri, 14 Mar 2025 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982492; cv=none; b=V8S3vZmgc4HOJINAueyOUO6Gy1pcAj0gQe2UgbY2QwYAsElTWP1/qTl9YqYOtkA58P8pVjCM91tTrKfAHsV/Nuhyf3q7pX3l20ojJ05Bsh7BSxIlki9mBfBFhi3mdvBGZhAEmg8foH/Kk/2tAreAJmaoMlVNay0zIKRvB7dbt+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982492; c=relaxed/simple;
	bh=DMG9vHIWOAlWHuVKLUZj8NjBupR/jYOKMWwZr0IjvHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iE/BEe5JLbldMwhVM4jnTOnXvhGdbVLPDamFPDinbUSzIMhz0z5RhIsn/Cr+c+H2KSPi8ikasOPYYowD7RAmWxkiDUxtQhZpJLwoI2bvCU6TMbXgSdoj2RaqZCE21mX6H996SJSCGVbUi9omZK3PF1VqQvBniOHZUAFF9kP9DXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ul6SSsiH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E41EC4CEEC;
	Fri, 14 Mar 2025 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982492;
	bh=DMG9vHIWOAlWHuVKLUZj8NjBupR/jYOKMWwZr0IjvHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ul6SSsiHnmLnejitfshjrc04CAX1pnbEDmHwFqJfneHZYlHmZfyCohzaIByzefV0l
	 akL+K0Pc6diSaw8tmReYhEkWjoBqvZ18kXoTiQUN+90JRcu+/v0mMFarAzmmjwIxFd
	 E/Mb+NiEa7UT9hexdZn6HcXz6tyrh5zQ9pbIdh+uo+p+udhmbBgOczE1FypPY2lXuf
	 HBgwllBvLwdCCLuQ38fUZFy4QDTivK+IMhs4E7obZjb9RvRYb5ccPUgx8tIhkVPEtk
	 IVv7yQERlQkOFB+ISl0z2s8qiJGcN4romFXuLds6WvI+yNKVcgbEQC56qrEWcOharb
	 5w6CXEurN2jPw==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/12] This is continued work on Samsung S9(SM-9600) starqltechn
Date: Fri, 14 Mar 2025 15:00:48 -0500
Message-ID: <174198247879.1604753.3196352252010411170.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Feb 2025 19:38:51 +0300, Dzmitry Sankouski wrote:
> Contains starqltechn device tree changes.
> Add support for new features:
> - sound (headphones and mics only)
> - gpu
> - panel
> - buttons
> - MAX77705 MFD:
>   - charger
>   - fuelgauge
>   - haptic
>   - led
> 
> [...]

Applied, thanks!

[01/12] arm64: dts: qcom: sdm845: enable gmu
        commit: eb8b09e61bd2419263a15c37b068982be620eab6
[02/12] arm64: dts: qcom: sdm845-starqltechn: remove wifi
        commit: 2d3dd4b237638853b8a99353401ab8d88a6afb6c
[03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
        commit: 242e4126ee007b95765c21a9d74651fdcf221f2b
[04/12] arm64: dts: qcom: sdm845-starqltechn: refactor node order
        commit: cba1dd3d851ebc1b6c5ae4000208a9753320694b
[05/12] arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
        commit: fb5fce873b952f8b1c5f7edcabcc8611ef45ea7a
[06/12] arm64: dts: qcom: sdm845-starqltechn: add gpio keys
        commit: b58e67cd607e43b56f7cd509bdef0577d4658f10
[07/12] arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
        commit: 7a88a931d09564b3ae84e7abd5cd412af1dd5280
[08/12] arm64: dts: qcom: sdm845-starqltechn: add display PMIC
        commit: 3a4600448befafe598f30d7e30aa89cef8226519
[09/12] arm64: dts: qcom: sdm845-starqltechn: add touchscreen support
        commit: 801733b4757ccef4dfce046639cf3ddeae7253b1
[10/12] arm64: dts: qcom: sdm845-starqltechn: add initial sound support
        (no commit info)
[11/12] arm64: dts: qcom: sdm845-starqltechn: add graphics support
        (no commit info)
[12/12] arm64: dts: qcom: sdm845-starqltechn: add modem support
        (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

