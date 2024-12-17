Return-Path: <linux-arm-msm+bounces-42573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234C9F5140
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A3F1891D26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD00156F20;
	Tue, 17 Dec 2024 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbtGxK+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5250142E77;
	Tue, 17 Dec 2024 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734453539; cv=none; b=hXwT4Luv3xf0PAAtqF6b30U2dhxIiVEjh3jeNvbuve4NCK2A9tuhjI+DHfD4jq2+6QAp34jbr5bpjDXPJtbN8MiMvpECesvBtzDHdLc3uwUoPX9ld/r6ILS4XFP7FBR4lY4u96UqU7bmCV8EP5k3xgcHFM54KRzydQPVNTrgJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734453539; c=relaxed/simple;
	bh=69+55AMwxYgC7yebAzKAof5dQbloZSQVUEf583Fd7BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pF+k+SauQ1fO3DOU49mxRDLVeAKhjZs3clzzfsYXGYQwny82cxvtG6y0yE2M2L+gmzNGjZ8ar7Ov0Yocbqv5L7JCVeyhIVQI/o4NUbYcwhDXGLMO9lFaKSUAR35xte0LPuqBHZI885pYCcBrSxNgN5u8nE1cdUt8x2tEYEw9+yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbtGxK+L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A006C4CED3;
	Tue, 17 Dec 2024 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453539;
	bh=69+55AMwxYgC7yebAzKAof5dQbloZSQVUEf583Fd7BI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbtGxK+Ls3Vi6642CXh6vu08U03HjZDjb9claMlC+XGubm5qhwAel3Us/H4zBnMkO
	 m4ZdIyMimlHAEGIh/Hk7KQoLitJC9z1ttR43kj0uZE5BTy3Zayw1GY0SxStRdCk6a9
	 kgE0PYmT7z5KbWsVzpYiY4/orjyMixSaQARir97TiTSs0MqHr5Lq3xrOYKJTdQMtmP
	 PF5bpDh8ReAcxzzH95KhTi/E28clTcXQQPeLAJ1ShvRnwd/cScvD4aSNR/J+ImZ8Eg
	 m2Ber9m7kOok/USkXNGGjDPYCAQf7rhPpBEkobqQfEMpvQl5AZS5x9vkC2iqcUDo/7
	 nxpvW6wJvlnfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
Date: Tue, 17 Dec 2024 10:38:51 -0600
Message-ID: <173445353301.470882.1221462093815662513.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172402.20724-1-johan+linaro@kernel.org>
References: <20241206172402.20724-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Dec 2024 18:24:02 +0100, Johan Hovold wrote:
> This reverts commit 1a48dd7b9ac809d1bd0fd2fef509abba83433846.
> 
> A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> ports can break SuperSpeed device hotplugging. The host controller is
> enumerated, but the device is not:
> 
> 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 3
> 	xhci-hcd xhci-hcd.5.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x000080a000000810
> 	xhci-hcd xhci-hcd.5.auto: irq 247, io mem 0x0a800000
> 	xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
> 	xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 4
> 	xhci-hcd xhci-hcd.5.auto: Host supports USB 3.1 Enhanced SuperSpeed
> 	hub 3-0:1.0: USB hub found
> 	hub 3-0:1.0: 1 port detected
> 	hub 4-0:1.0: USB hub found
> 	hub 4-0:1.0: 1 port detected
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
      commit: 1fb5cf0d165afc3be76ec754d1b1013515c3896a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

