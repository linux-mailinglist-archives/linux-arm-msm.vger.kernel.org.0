Return-Path: <linux-arm-msm+bounces-21388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB98D739B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 05:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C573D282B48
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 03:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078BE2D058;
	Sun,  2 Jun 2024 03:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPpk3eGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6182C684;
	Sun,  2 Jun 2024 03:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717300437; cv=none; b=Dk6NAPohOSOLFEZ3Ygx233W1eFyuzlWiHUI3n/X4pkdS5DxOduz3+OyKJx5BMvJS7VBon9JC1xWbhxNG2ZMCWq5tJpp4xklI93xaOxy+TWQkUcZ9eHXCYkfZKu+FcXtDEBDubQ6/dtcp1xvB5Z4Rm3r6kcUmpQGlQ4rS0mnk2Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717300437; c=relaxed/simple;
	bh=0FO7HQk1B3IW1VhjRWBeL2++zaYULQjVh2dhKPf5UsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luQjHRfRQiRiVYSqzt6HUW7Uzok+KRyLhbtz0JbQHnZxuuVGQdqyWxDg86GVdrPXmayOduVQyHStuCptanwa+wDJNMWjgVgX7J8Jr3FxiwIA1oJhKtaMpIL/jZBEJbkksJmtDRZKreoRhc+oGhJYiji5drhHgy2YrHJdVMu9/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPpk3eGB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F04C4AF0B;
	Sun,  2 Jun 2024 03:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717300437;
	bh=0FO7HQk1B3IW1VhjRWBeL2++zaYULQjVh2dhKPf5UsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPpk3eGBUsWw17aOb+oGiU9U14pYUGfjvQG2vHMblb8CmP6bOR41NJ11KI6tJCwBn
	 Wl4BpAtsJjpDMeREFF7fDEsV/rsaxqWF63yZnDmmAo5af9AShv5i8o6PES67vDCBMi
	 xv1HM3UAKqnvzcA2urvaNMLhGmi9oZ9dm5swAJROFlAJgMyISNZah/EQOleOnTN2v2
	 9yA5cygGVHOD6JKHQ+u7lFfAOpaz5TYJGoAW4+LHCB0q60S5yDQyv7gO94pSpJRD2p
	 O++PQwvReGvCgPQT7J/1dFHt5eUHCq2iujWlDUM2WbdCHSsW0kZ+qs4oBtwiVCBkVq
	 P0UrXjFqF/roA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 0/3] Add TCPM support for PM7250B and Fairphone 4
Date: Sat,  1 Jun 2024 22:53:43 -0500
Message-ID: <171730042576.665897.6341252590136883474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
References: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 29 Mar 2024 13:26:18 +0100, Luca Weiss wrote:
> This series adds support for Type-C Port Management on the Fairphone 4
> which enables USB role switching and orientation switching.
> 
> This enables a user for example to plug in a USB stick or a USB keyboard
> to the Type-C port.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: ~postmarketos/upstreaming@lists.sr.ht
> Cc: phone-devel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS booster
      commit: 37ff5d0d75fece536cc493d0979e09f33edb75c4
[2/3] arm64: dts: qcom: pm7250b: Add a TCPM description
      commit: 6b5b15a1d785d5fb484d3a662b01776066d33137
[3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB role switching
      commit: 6814d454c26b552f0009c803ffc0ce3434eaed7e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

