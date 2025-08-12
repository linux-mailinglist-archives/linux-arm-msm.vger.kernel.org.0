Return-Path: <linux-arm-msm+bounces-68831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2761B22E08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 18:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA07D3A36EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7182FA0E9;
	Tue, 12 Aug 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFWWAhPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DC2FA0E8;
	Tue, 12 Aug 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016820; cv=none; b=lQwXVFTC7m+bur+pspOW6NdjkI3cuzS2Nwo5Xmjp3gV2SY3A7U9BD992BlWrDkVDgxtmxOqREFdH5AWv8ZBgHq/SSncpmcfW8EJWd1sWqZtJmxrIp1yPM6z23tpG/AZLY9Z0ABJLVb6+zzPh84odXsNwprnMQzAcQ2hBtdBzi+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016820; c=relaxed/simple;
	bh=k8qMfbp9FpXJlzkhvTknfoxCnJOkfXP1yU8UVJVUij8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e58ziv3qoFZdS1o0CBXH6udUiKpNnEz4VU2pjTja4XSbQX8usD6SBOvmk9ZU93SuNooR9LO9nwxV2Bd5CBWRZev7v3JFxvK/kIn27o71tbSQOzRN+475B84TzSIYAqnOCMMkxWXkZLDgPaQV8IhYYWyuA9n6yKHWRZ/VdAYXPlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFWWAhPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D868C4CEF0;
	Tue, 12 Aug 2025 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016820;
	bh=k8qMfbp9FpXJlzkhvTknfoxCnJOkfXP1yU8UVJVUij8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sFWWAhPWeN7cFpFmZ/sKZpfkrXDhnr2fBrcMLyx//4IP5so9isZRVBpIzvZ4nzMKG
	 +nN0YKEsk8YXCML09ef+8niir4juD0dQ+0oNN3L9WvMpTZqNSmebJhKJwmGz/5kFA2
	 vKcAv9J+s7UuxTezpcHrvtjBjDdvisvv6eM35r3MKHM4G7CO/7NuLpONgYJ9NNzsF5
	 tBUWM9yKec/dDeKdQvjR9mGgXLjUsW6w+z4ltvhfAnVo/hYHlw+9jVgZgtm+f9XPxe
	 xeAnr5I9foYHGP+1PRe6L/WMnOWQ4q0Y4dnNvk5Ck2fkRBmHOFy46RPo2MZ7VL3vUU
	 GUFchW7Dh+imQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@linaro.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250812093957.32235-1-mitltlatltl@gmail.com>
References: <20250812093957.32235-1-mitltlatltl@gmail.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: fix override
 properties
Message-Id: <175501681673.633066.704631034138052201.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:10:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 12 Aug 2025 17:39:56 +0800, Pengyu Luo wrote:
> property "qcom,tune-usb2-preem" is for EUSB2_TUNE_USB2_PREEM
> property "qcom,tune-usb2-amplitude" is for EUSB2_TUNE_IUSB2
> 
> The downstream correspondence is as follows:
> EUSB2_TUNE_USB2_PREEM: Tx pre-emphasis tuning
> EUSB2_TUNE_IUSB2: HS trasmit amplitude
> EUSB2_TUNE_SQUELCH_U: Squelch detection threshold
> EUSB2_TUNE_HSDISC: HS disconnect threshold
> EUSB2_TUNE_EUSB_SLEW: slew rate
> 
> [...]

Applied, thanks!

[1/1] phy: qualcomm: phy-qcom-eusb2-repeater: fix override properties
      commit: 942e47ab228c7dd27c2ae043c17e7aab2028082c

Best regards,
-- 
~Vinod



