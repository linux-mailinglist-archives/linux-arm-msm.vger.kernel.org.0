Return-Path: <linux-arm-msm+bounces-14437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D187F596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 03:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA800282663
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 02:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA2A7C0B7;
	Tue, 19 Mar 2024 02:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF/xkLvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A17C0A6;
	Tue, 19 Mar 2024 02:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710816536; cv=none; b=lxfay4HKc3o9W04cdpvoMCh/kUeMRXyxHgGo5su3BKh9ZhPzcGmSJQinz0vpoBVxbbUOPT9rEHijbBruI8CfFKvA7+blG3S8mgUp/egFtBQBwV6AENlKo2lltzU+0pjeo7Ufufug6jNtkM7EgBLBC6wSk7J0KH61k2yNOH5HqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710816536; c=relaxed/simple;
	bh=KG12zIBDSTpwLyKXLKeQCT1nll5yY2+7NVNysu+KqOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Azx/wThCiSmp/MFCQziFmBVKIQlAlsT8Qkc1XfKT07GrtciGQj++4SDb61Ppket2b6oeCsOa45wVwzijPrccbaUoAALt0eOBRy4GWTtBNCRm+ZVRPmdV/kBJEm+z2Z76ojCQLjggdWn+xAysgvi2StCru/uASwnVjKCrOJUx2IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF/xkLvT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659AAC433C7;
	Tue, 19 Mar 2024 02:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710816535;
	bh=KG12zIBDSTpwLyKXLKeQCT1nll5yY2+7NVNysu+KqOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dF/xkLvTn+UuY3bZzHd/RFkWqFlsc4hyBDj3Tw1QmEUFcuna+3Bg0vJp8ChxAXr9g
	 ZOZUpjxC57c5B3nbcP9ScXQrjPvNrEMBGbdCC+K5V60jZ/cNccn/HHGWi3Vpk8JZn9
	 lwJwcXLA3pvWwzDkzdSSHTK/LsIinTu4VNbOzET2oLxV3FOsx+R7m+/drf4shmnUgB
	 +2vaFXh3S45/iWfDaLtnN5HnebQfvdl/uIa15/P/+X3FurcJKrMkqI5NYAbmiDD+WD
	 7gGRj95nyBnff1rDv05HjyXpzfZWquz832k3rMWvQ2Lzl/yPMz0r1kJoePNdQAwjSj
	 iBwN+gIMo03Fg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
Date: Mon, 18 Mar 2024 21:48:27 -0500
Message-ID: <171081652656.198276.14383798661229086457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Mar 2024 11:26:09 +0200, Dmitry Baryshkov wrote:
> Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> Robotics RB1 platform.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling
      commit: c39c5aed65d428f2a1c2364851c8b44702e9d7db

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

