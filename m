Return-Path: <linux-arm-msm+bounces-20496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FBD8CF78E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663E62810AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD7F944D;
	Mon, 27 May 2024 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNHilmW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF098C0B;
	Mon, 27 May 2024 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778854; cv=none; b=GP5EjnYwRwkN4aiPxK4ho/dt20pdrOUoA01BwkEBrQWTVv0wkl3/TiwzZaZtoet2xC5RxNO2Ovk4MIJvDDg1btnbEd4bE3NEWyWcxNiE2+ufdA/AprGpTOS0ubqyzrv9xTqsFPRxNvmN+CGoSR9OP4uqgJIZ1CBJTihOpkbufu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778854; c=relaxed/simple;
	bh=QTSVmo6Syf9+5eS1PeZZ554Bsw3evIoDI/bi2+0MS5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZwMf2v0L9k9AL6hBN2Kf0MW5nweSZtoXbLKOypWUyqmGTDhoGq1Su9p39tEJFgXVVHqltiDpYiSeP1KIKXe1UzDyVPIU1Ufj1Kg/Bse+aIoXkNGXjoDDGLr7PcgUW89jEi2tyrkWlcgkTsiOgMNt88aiVdY3vfBOePKAvIF9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNHilmW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEBEC4AF0D;
	Mon, 27 May 2024 03:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778853;
	bh=QTSVmo6Syf9+5eS1PeZZ554Bsw3evIoDI/bi2+0MS5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PNHilmW956ifkcfG9NjAbKuM/qF2uZShntatpIhIHniD23yZ6BB6whITKLR52ossw
	 G0YeHRPZtNRC2+imRYc/BfhHfAQxIt0M14TCJra3FSsKO5cugByYY73NKviclM9bmx
	 U9/bYcB5S8SW78j8MFt8b0ttT3nUjcYr/pLtW+JTVFNwuaMzl96hGhikR732406wc0
	 rnvQDuoWnTc6BGhgccJxxQMg+SKiZxpk8me9hdRc/Wyw+/Z67D8A/JMR+/wQRrrwb1
	 7lqCOaphTk92voQcsqSWGKYAkdruU+kB3x+4L+Up0dJSomDpX+8A5F1UeP9BHIYX2N
	 nv1mVJntsxp1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Fix aoss_qmp node
Date: Sun, 26 May 2024 22:00:22 -0500
Message-ID: <171677884192.490947.12114835277742643080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525-sc8180x-aop-validation-fix-v1-1-66cfa3c9ccf6@quicinc.com>
References: <20240525-sc8180x-aop-validation-fix-v1-1-66cfa3c9ccf6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 May 2024 10:54:07 -0700, Bjorn Andersson wrote:
> The #power-domains property is no longer accepted according to the AOSS
> QMP binding, drop it from the node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: Fix aoss_qmp node
      commit: 8ed45f79142caeefa42e98eb243df35746123c09

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

