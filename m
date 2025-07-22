Return-Path: <linux-arm-msm+bounces-66091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3CB0DAF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAACB1C81037
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D4E2EA143;
	Tue, 22 Jul 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWaFhGhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724A28AB11;
	Tue, 22 Jul 2025 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191453; cv=none; b=IMWaVD5Ncy4nRd7R7JKJf67p9u1uHo3LEIyvEiOcXyiOESUpiLHDyZjUsKMb/KV6TZehB4H+9LOInocVRXHSUfBQRE2Hhl7awGM02nxH9JeDQp0T2WbeOUSbcCy2aOdpI9LvF5TRr/6Okk7mkKM3cK9kc98jVHebLsBMnX7/LPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191453; c=relaxed/simple;
	bh=znd0BpuwRyqMnjpW3g9CjauNbjE2GqxOTGIzyRzKmUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rvzN9veFEo26dThL7u/t05yfpqPBkLsuS5fRoD0uL9oHiu6bMTVat3qEHwkwf6wErGzsBAyUsBYIRiKD01YvaPy/anoFQXlMjfROLrFLims0lwL03ZO0ZAaDR4QM147hMAp2MO3TxcirhDIXNWuDlgrXK8ZvEZLuWP6NJMwz2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWaFhGhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697D6C4CEEB;
	Tue, 22 Jul 2025 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191453;
	bh=znd0BpuwRyqMnjpW3g9CjauNbjE2GqxOTGIzyRzKmUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lWaFhGhmI344Ewhq2Jysi1G024uYpZARoP07K2ynbC7BwiVk3ia475yWj+Vv0+EX/
	 +g5+aQXTVzBhXzRPOL5tEn2ewlWk5vI7PK78NylHKX7J2hjo3rZNsTfHGEbfmb3CmP
	 H6guKKhJ2/sVfISkX7cQGu2Z/fhgCaeDREGizRR1sBtbEFPucQkO2Ek0pS1PI8j4V4
	 8QUmgi4w/hR+JLU9YkRrHh/43yejbUL8JUDAU2XjGqVS2Wx/RtwDJTi3Oq0BnTncdD
	 z5EFH8x9k0wBhrcwuyM8vQbEpGns63x5kMn+pW9g1AvkGV7Vwn/hWTeTO7WfgbHt5U
	 VECtYxvJrCdGw==
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
Subject: Re: [PATCH v3 0/4] Changes for the eUSB2 PHY on Milos
Message-Id: <175319144804.114152.2528801468931632951.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 19:07:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 15 Jul 2025 09:29:33 +0200, Luca Weiss wrote:
> Document the eUSB2 PHY on Milos and add some driver changes for it.
> 
> 

Applied, thanks!

[1/4] dt-bindings: usb: qcom,snps-dwc3: Add Milos compatible
      commit: 9e891b0d21bc889898e726783f20bd81f5fd4056
[2/4] dt-bindings: phy: qcom,snps-eusb2: document the Milos Synopsys eUSB2 PHY
      commit: bb39f49a433312ba7558b7cc44cfd9131b46bce1
[3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write from init sequence
      commit: 7f5f703210109366c1e1b685086c9b0a4897ea54
[4/4] phy: qcom: phy-qcom-snps-eusb2: Update init sequence per HPG 1.0.2
      commit: 828c3e9dce25a9551e52fd076136f4d9936c0498

Best regards,
-- 
~Vinod



