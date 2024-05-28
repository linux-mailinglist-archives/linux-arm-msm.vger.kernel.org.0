Return-Path: <linux-arm-msm+bounces-20682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899DC8D12B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F343B2269D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C807D51021;
	Tue, 28 May 2024 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufP/UF9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979DC502AD;
	Tue, 28 May 2024 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867169; cv=none; b=nRljCS8+8YntT17xzD79k9WmLgEj//CM+97NP6+y3GK1GnLMMfbt38PztyykwdrZ5v9nIbFT9Tu4+Jazq6IizmjD8MtK8hgsjDLVYIee1zYgfa0XHW5oGRJcbgTJNor2QDINeWsM3SuMlybYaWzBvbsKINvNRLqS1kJGHZHzjuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867169; c=relaxed/simple;
	bh=0ezaruK3xPpC4p+F8oVonEjMD1UdY+fIShnlX2e6eVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/1KbvAItphkL28Gjl3Ln7U3WA+6pWC/Dk0fjZvqPjLMOBUyRL62YT5KVOavJWqc8tYJWzzjlG5Z8PhzEi164OTvbE2DL+QVvWK2bsXIUW2WXJdxdxuxVX/QJ5v9MhmBByaae/6ofhLCNM5xetqDWOPVKxykLru2kjslBv/ZrYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufP/UF9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FD9C4AF09;
	Tue, 28 May 2024 03:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867169;
	bh=0ezaruK3xPpC4p+F8oVonEjMD1UdY+fIShnlX2e6eVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ufP/UF9kAFv/o7YwreD4NaacDib3sLzoduDFW1xcWDov2eOKYAAiSWgb8oXeFDnEI
	 4tz3JijSoOs84qvCu7aom3twUzDtTIA80xr9znbT5IyRS/PaxlWy1LvDRmQWLqtGt8
	 hw1Vkk9l5GvnEwKt4yM9IWZNSAiBWMB0BS+VWoTgKJZ8cOG0mwTB8MNHuw2yZ2n0B6
	 0SdGnTfAtNu0T16SwmxQCYEzFTIovHMSkvLGPJINYzlRrvWCByDwdstnMAlAN11PzT
	 j/8KXx1asY8Slfe85LDinTCqy4izlVjFDCynvxqHKNAalzwJkw4tprW2iYUEYS23Gt
	 rX9r//EU9tWRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/9] arm64: dts: qcom: fix description of the Type-C signals
Date: Mon, 27 May 2024 22:32:15 -0500
Message-ID: <171686715155.523693.12605210076880973632.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
References: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 May 2024 01:04:06 +0300, Dmitry Baryshkov wrote:
> Rename the HS link between usb-c-connector and the DWC3 USB controller.
> Add missing graph connection between the QMP PHY and DWC3 USB
> controller.
> 
> 

Applied, thanks!

[2/9] arm64: dts: qcom: sc8180x: correct dispcc clocks
      commit: 17944fd55b8d03457ffaf4fd37ed7bef679bc4a4
[3/9] arm64: dts: qcom: sm8250: describe HS signals properly
      commit: db67e95835d0d79a1c1dd53a016c951706e0af10
[4/9] arm64: dts: qcom: sm8250: add a link between DWC3 and QMP PHY
      commit: 88347987574b435b23fced20982dc15115ff81b8
[5/9] arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings
      commit: 35e3a9c1afce0aa72a4f71f43cae9784f01825fc
[6/9] arm64: dts: qcom: sc8180x: describe USB signals properly
      commit: 757688ad094cb520378e6665215a1b79aa46a8ff
[7/9] arm64: dts: qcom: sc8280xp: describe USB signals properly
      commit: 93830ef7bbcdfd440fd6d93adfb59f20560950a5
[8/9] arm64: dts: qcom: x1e80100: describe USB signals properly
      commit: b73ed308f9f69499fde654d63ed6c1fd44870793
[9/9] arm64: dts: qcom: sm8150-hdk: rename Type-C HS endpoints
      commit: 42214cbd945871b48d1ca1a6bd17f02e1a5f823e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

