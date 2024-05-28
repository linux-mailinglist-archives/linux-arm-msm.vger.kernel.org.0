Return-Path: <linux-arm-msm+bounces-20680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340208D12AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C941F21503
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70641482F6;
	Tue, 28 May 2024 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7yYN7gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ADC482C1;
	Tue, 28 May 2024 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867167; cv=none; b=T+mJHhYIY7t/vLj/IcAPLRNwlcJ46JpQMeHjK6cJsp/e1NE4RXmCNjDeuB4d8oNdfO3NrxRqgXdrQ93ToxO9KI0/ZA9TXD50eS54geNTanN0+low9TSwb1B59o0JqOe09G5ZrSvAzZcxgmZ9Jg8hB+THwHJvK4fRhK6BW0SBzpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867167; c=relaxed/simple;
	bh=xOmVmRKKWbm+kYhafSRREvPWy6k2hxg+3BrZ9Zisq64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTn7ZEiTmcwyWeAHCp3/FO418j0CttHmrSnZ0VnjoNBzsnmkmzPNlUEnCwUooqppOVGsUJORzr/FSoM9Iww2FAWdGVvyZ5uDF6+DGxVfUAyoHu/urROJpWnmosTnniMMeYA5znCS22bXicgfMBKbHa23Pic3Z2FGY2/sxCzzUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7yYN7gh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B022C3277B;
	Tue, 28 May 2024 03:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867167;
	bh=xOmVmRKKWbm+kYhafSRREvPWy6k2hxg+3BrZ9Zisq64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e7yYN7gh8jQ8bI7u6g2F/60sjH0uRBGwbzOb6dLKRTGvl4mmmAA0h7+0eV84ns+zb
	 e2DjAXd5gNEPUNLOXqN24ku+l85f0IgVvsPb5KjN590VAYD96MoJF/00+AaGW1jXIu
	 /0coRzXHSKMbnJ1j3zN/Crmpf5ntZXT4V+cVwJiDo6KOmQ3kOUp4oCYMZmvxGv5neY
	 T910RmdNHTvSRT03AUpi4T7waVJ8cClXeP7cQQeolexCQMCUQwcPg+coaMAvrLdEOU
	 iUmBJposV1PnYs7rJdn/Vr6cetfthFF7eOCUFRGvsh+T+D7wAfyZL8pc8QGBZDlR+c
	 C3wpRj/Wld50g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add WiFi calibration variant
Date: Mon, 27 May 2024 22:32:13 -0500
Message-ID: <171686715142.523693.13430659692362716029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527-yoga-wifi-calib-v1-1-af9dc33880e8@linaro.org>
References: <20240527-yoga-wifi-calib-v1-1-af9dc33880e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 May 2024 07:01:11 +0300, Dmitry Baryshkov wrote:
> Add calibration variant that is used by the board data for the laptop:
> 
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga-c630: add WiFi calibration variant
      commit: ceb39b051b779339749ef0ce30b8d79165e733aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

