Return-Path: <linux-arm-msm+bounces-23502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A838911AF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 544E12842E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1BA13C802;
	Fri, 21 Jun 2024 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tf5NqtGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B0712F365;
	Fri, 21 Jun 2024 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950294; cv=none; b=WZT6VRfYEGX6+i/zrfB9DN7UyOCICR1yascgFYrsT9ZGvkxJmzhceREIuOs2zI8L8Wj0XP01fLPePwfVFsqp9/eoribA8dcy7ziPGa6aKZO8TOFLWwDOs2K1Ddo40f474dLAl/vmG7Z0w2OCrhsrZY56xFmX0phBeYsgUCpyYLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950294; c=relaxed/simple;
	bh=e0vsw5nwjPnUAuyS8sN1Vi1xOfmaXbEYZAX8tllR9sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SvUOYCKQSzo3XDjyvKW5vUkHbivXQnUiECItY5wCrsjE0bwnsSxpPClCYl08lC8OByiI5bX97qkZzfnKbz7PhnBLEsy4s5L11YW2nM0/Jdd4e9fohJjyVzQ4mhcmo7ljAP31YOOWiZA9B1MMOavZjK6z4lCeX15vvZrbe5P2HxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tf5NqtGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD318C2BBFC;
	Fri, 21 Jun 2024 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950293;
	bh=e0vsw5nwjPnUAuyS8sN1Vi1xOfmaXbEYZAX8tllR9sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tf5NqtGumxv2sPWJxBqxTbXUMiFE0tg5++7xp7kL/Mx0TbLGzXR5t46NRUXenwBDT
	 97pCR4mOgCQIBxcsvY33eI9NXe29h2b0NUU/KXPraECd1WaHcTGNTC1j9PVGPI85PE
	 lkbSWwzsieKpa8nPkFE3pp0iI6Jjd9P7PQmDQnYOLB2Exlqw45+fYGdX9GRVCTExwv
	 L01iPYMlsVl1fIdsy7+Q35+U1epU84BJBPyR0eRNeZm/L0BqF0WpDMzCa9NwdCVqy0
	 FM1S+A8bStyn3qfAIutzcMg5erCSHCQoZ5aHzsneOMkcbAFdReLrZ8KmsHVFLZ61t1
	 mntTpmNmuAi2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v9 0/4] arm64: dts: qcom: add WiFi modules for several platforms
Date: Fri, 21 Jun 2024 01:11:15 -0500
Message-ID: <171895028808.12506.14730340902963805368.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240605122729.24283-1-brgl@bgdev.pl>
References: <20240605122729.24283-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 14:27:25 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Hi!
> 
> Here are the DTS changes for several Qualcomm boards from the
> power-sequencing series. To keep the cover-letter short, I won't repeat
> all the details, they can be found in the cover-letter for v8. Please
> consider picking them up into the Qualcomm tree. They have all been
> thorougly tested with the pwrseq series.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm8550-qrd: add the Wifi node
      commit: 4908128724491de1feadee87aba9955eccaf5269
[2/4] arm64: dts: qcom: sm8650-qrd: add the Wifi node
      commit: a05737bf76316677ae1d7af93df6218dcf1ae494
[3/4] arm64: dts: qcom: sm8650-hdk: add the Wifi node
      commit: 4d76a2314810b78b0469c96bcb265af1af7e13a5
[4/4] arm64: dts: qcom: qrb5165-rb5: add the Wifi node
      commit: bd37ce2eeb84cd42ec8edebaa3cb8cffade2dc0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

