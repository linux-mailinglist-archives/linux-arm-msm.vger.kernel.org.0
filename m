Return-Path: <linux-arm-msm+bounces-5100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B88160C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E232B22A93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD4947A79;
	Sun, 17 Dec 2023 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPL7TrJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0AC481C9;
	Sun, 17 Dec 2023 17:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9ADC433CB;
	Sun, 17 Dec 2023 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833702;
	bh=E25t4T82H+2BxY8BH7t7ZAwGfG0RC1QwIrN0rTrvtyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aPL7TrJGYrUf+08KCyAZma/j6s5YDmjUCoh65jyb8O4ry5+Kgr9Pn8u4LclLwctUZ
	 tfNRCTyVxUDsZKZZ+7GXrp3prE2R8ypkKELXx0/pKuQdIN9Wc1VlNPs1ptipy3HQrm
	 I59OlH6laXdQOCcS6rNJKKDnzwOHWpit2SEYjPaTHrN0MSaLXTrWXYo3Zhs51c7V4I
	 0qfgyKOzjFpDwXXh4aCS2nRe4FtVsKJLU4ghAqwgJdHiZPJwrY4jg/+iGOjJHjcocU
	 KHh/kkLF9liCo4stq9nJI+yDQYeiqmwcjKh+M0isO0ydPS6uGRA/pRk4Ia95m0ciHU
	 FrIW0TPGGY0cQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qrb5165-rb5: add the Bluetooth node
Date: Sun, 17 Dec 2023 11:20:58 -0600
Message-ID: <170283349418.66089.14144739499927605522.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207090706.19134-1-brgl@bgdev.pl>
References: <20231207090706.19134-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 Dec 2023 10:07:06 +0100, Bartosz Golaszewski wrote:
> Add the Bluetooth node for RB5 as well as its dependencies in the form
> of the uart6 -> serial1 alias and the pin function for the Bluetooth
> enable GPIO.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qrb5165-rb5: add the Bluetooth node
      commit: 71a73864e144aadaa582fe8296ef73fcf3ea7377

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

