Return-Path: <linux-arm-msm+bounces-3806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 040D1809991
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82AF61F21200
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09221876;
	Fri,  8 Dec 2023 02:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWaLJ1je"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC28F15CB;
	Fri,  8 Dec 2023 02:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6A4C433C7;
	Fri,  8 Dec 2023 02:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004000;
	bh=Pp3+6l4mBzoCUSYvQZ0ii0PbuLNVjGmd2GgZNiGsdUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWaLJ1je6yb1zZLV+16Ws78DspYsmLPOcGmUX5pEW5sIMU7rIim7nDEPUT5EdxZxY
	 G/1bDiL0MVWUc7EjHriBvCRyPbnVz7g2ZbQlaurHtmypXgX++eCxMxKXGzWMoBCtPP
	 uZ0bthQ/MuLVQvisl8eAFJWCrrJzl7QS7vymnk7Cvw12TtCYvX9RK1UWKhD1+WpZnD
	 638wyefQ1ee52eN1pIm4hlXLG7kf2rrqKNM8u8Ei4VCo+/i1qd0EQzvEnUr1x6y5BW
	 BuXEyTkap+TQDdm2EeoKw5hlTYgOnybGvMAG043C0zGiqxAjx8vj9keIizASVZdK9J
	 3nufbiGkXsY0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	dmitry.baryshkov@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/1] Switch on USB as a wakeup source on sm8250
Date: Thu,  7 Dec 2023 18:57:25 -0800
Message-ID: <170200426917.2871025.13154424795224581973.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109004311.2449566-1-bryan.odonoghue@linaro.org>
References: <20231109004311.2449566-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Nov 2023 00:43:10 +0000, Bryan O'Donoghue wrote:
> Add in wakeup-source to both USB controllers on sm8250.
> 
> I tested that the rb5 gets into and stays in s2idle, subsequently resuming
> when a key is pressed on an attached USB keyboard for both Type-A USB 3
> ports and via the TCPM controlled Type-C port.
> 
> Bryan O'Donoghue (1):
>   arm64: dts: qcom: sm8250: Add wakeup-source to usb_1 and usb_2
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: Add wakeup-source to usb_1 and usb_2
      commit: 48307d83c998db18db6890dccb569146eb12d313

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

