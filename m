Return-Path: <linux-arm-msm+bounces-33397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3405C992F43
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D701F248AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018761DB522;
	Mon,  7 Oct 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8Mr8POY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E01DB377;
	Mon,  7 Oct 2024 14:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311188; cv=none; b=hFK71YWnabbWR5x1x7LZ2QsNsPPynOdfaEls/dKB35zfM1kje8idaDbn63lfdQTZ3cYgQYdIdzxeTsiAI5wxken+9+L510Qf0M/SC8gPiEnOVOhIPI0sHAT8qwXkks10DyINtDxVcYD8KF8KuJaIbcTfBuQmdAqCJrYHLIRNoHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311188; c=relaxed/simple;
	bh=WMe/wekRo2YCjEB+Jtat8Vf5Y2YPk4ruFNqa3YNyghE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iRO1sZjH23HkPRwGySm8GMnedKVrLPfBqp8xJ/iQnFp3aA3D194pIkB8hbrA30zV1YdCoFCwZ/31XQJ8jEw+kXNwQAgK38TTS15VmND/ymSP0lxeZsXv0kH/R9s/yZk//AsV8muJOlV51W6XzkboefsJ4MCAjnMGr6Rpd08UX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8Mr8POY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA693C4CED0;
	Mon,  7 Oct 2024 14:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311188;
	bh=WMe/wekRo2YCjEB+Jtat8Vf5Y2YPk4ruFNqa3YNyghE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8Mr8POYlS7KwbcXfrEd1uaQtPiTssPxNjNPAPzjxmx/L9cSpYnSSESv5zJDxsgef
	 c+nfdIBr4D2dhnI1erZqsAxOOX05y/Oal9soVbSr3++fO045gjKaocQap7NJOybdIF
	 GZ6ql7fjclRdAX0D4B6o/ZPVX53wvJHY90KVal5uMtRj6JGhKlEQxzjMYthu8HTAX1
	 4ly/ui7ftlO0efpE4dWifywSmvsod6MX4Xuldq1Iq32/nqFf05xacJ16T8//XkcTx6
	 9U5A/NY75wDMCWD8LFU/9Y3N9yCuzD1tH4xsRWkrOYC16i3Uq0E+4cnOh6lXCutXe6
	 v4it2N0ZWkdpA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor for UFS/RAM
Date: Mon,  7 Oct 2024 09:26:01 -0500
Message-ID: <172831116179.468342.218023456132949403.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
References: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Oct 2024 15:01:08 +0200, Luca Weiss wrote:
> Configure the ADC and thermal zone for the thermistor next to the
> UFS+RAM chip which is connected to GPIO_12 of PM7250B. It is used to
> measure the temperature of that area of the PCB.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor for UFS/RAM
      commit: 73f9c18c341cdab3b5dfcad143787bdc2a003c2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

