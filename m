Return-Path: <linux-arm-msm+bounces-3826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DA8099C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BDAE1C20CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3433E3D7A;
	Fri,  8 Dec 2023 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnmZlhJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C05681;
	Fri,  8 Dec 2023 02:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B748BC433C8;
	Fri,  8 Dec 2023 02:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004021;
	bh=ZjBph3S+MouDonqSk4JFIDw5YNr4/TApy2qSl27sTdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnmZlhJmhjrjXxFGbj59agG52p/57d76SbviKFXgM2QKUwooRXyGzCMSvnQmHckDX
	 oelAWkOXXqpFb+/+YkUTn7/3XhpRybr9SIbZodIif+0C2LOsxtIINpxGgh5E6Fze8A
	 tKSd8CYiUE0TUOSr3TQF0/wpbW7Pxa90dUe2SFIuHdaPn2qiFQ8Wep8ubuPIuZs7GQ
	 X5pwead9A18y/onSNAfwqTzzcp8smT3ZX2f+9BJjg2yYLTkVUnXRcdZu9bH1N/DCkK
	 BGR3QGPifCSvT7ItXMiu7YQuZN5sWrEM0GuOJqZ6kiqwcU4n3yAXn9NYccTqcalpP3
	 zFZUNWI4Ped8g==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/3] pm8916: Add BMS and charger
Date: Thu,  7 Dec 2023 18:57:45 -0800
Message-ID: <170200426930.2871025.3838394626757670176.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
References: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Nov 2023 19:03:02 +0500, Nikita Travkin wrote:
> This series enables VM-BMS and LBC blocks in the pm8916 pmic.
> 
> The VM-BMS is a simple voltage monitoring block that allows the software
> to estimate the battery capacity left.
> 
> The LBC is a linear battery charger for lipo batteries.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: pm8916: Add BMS and charger
      commit: 26b87a3dc3337315c9834aa94e01da7030ec2e6c
[3/3] arm64: dts: qcom: msm8916-longcheer-l8150: Add battery and charger
      commit: 12fbe58560d6f974339cc30e44c0c5452db331da

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

