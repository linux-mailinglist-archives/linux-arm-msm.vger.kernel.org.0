Return-Path: <linux-arm-msm+bounces-49359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37874A44A13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7D921756A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DB21A08A4;
	Tue, 25 Feb 2025 18:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uloE19gB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43701A01CC;
	Tue, 25 Feb 2025 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507500; cv=none; b=NBheHIeOe4zr1jaSsK/K3bYkVE3/wcQ3rcuIsuMR7dr0HH9x7cqfPPnmTF/YZc0ruMFeEEw4YWcHSSthBxWVstSPClKOLjWNUcsP6KA4C782bmdeJvI3oRuRL5lndM4IoKhEhiLgv9YUEVlpfciZKD2AizW7pb+DJYFU23BrWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507500; c=relaxed/simple;
	bh=+7/cafxWJZy+AV4l9RXgjj6ivujysyr4e5o34yrxifg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZzDTr+M47uJy0YfKlKA6ppG+PdpZ02fcnh23GM4YqwCy55msfJv//oglRptLag86C/qoBC3Ty6dMi5IpUG1nVSt3aGTcGTtVaqnWDKPYYcPqjpPvsav6B7bz4iAsLg/6o1KZ81AUshfJ2TbdXBN+2MAPU/vuBggco/QpjW70t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uloE19gB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A50C4CEED;
	Tue, 25 Feb 2025 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507499;
	bh=+7/cafxWJZy+AV4l9RXgjj6ivujysyr4e5o34yrxifg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uloE19gBFxbB4KFJunoND2RwmR97FD/zUsQpMgrvasdzpmJsyelhdCeJ4ph5zZX0t
	 SbRDGNHuWEeK+XBZTBd9iOhSeH5vAujzhlQ1c2a4WCLLe0dyCBkhv7Liquz4MPBt8U
	 LfeznliMyq+hfv42TDbYmPXiEVVbFmSXw1VlGv0THy4V0Lu1ASmsneiPiBsgBKFh1p
	 K7WyGtQiL5lFmGmad5ruhfkR2+dGajC4f2+uhSX4pcOxqK4J58ZBmuxE4oPbHEQ/38
	 eo5liwd620hlQTczgCc8ZBxtaAzQLiMxYMJOgdYhD/6nF5PNb32n9a8tujDR58FJ37
	 hBDj0q5o2WcMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable SLPI on RB3 and RB5 platforms
Date: Tue, 25 Feb 2025 12:18:03 -0600
Message-ID: <174050748691.199016.9851208961166712307.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222-rb3-rb5-slpi-v1-0-6739be1684b6@linaro.org>
References: <20250222-rb3-rb5-slpi-v1-0-6739be1684b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 22 Feb 2025 02:43:03 +0200, Dmitry Baryshkov wrote:
> Enable Sensors DSP aka SLPI On Qualcomm RB3 (aka db845c) and RB5 boards.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-db845c: enable sensors DSP
      commit: 7373610dde49566fe091545aa0b753cc5e34116d
[2/2] arm64: dts: qcom: qrb5165-rb5: enable sensors DSP
      commit: 341e66232128b674300d4474557c23bb32b7aeba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

