Return-Path: <linux-arm-msm+bounces-46677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97AA24E60
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 14:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F29117A2B98
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 13:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268F41EEA44;
	Sun,  2 Feb 2025 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7/mf+1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96BA1EE7CD;
	Sun,  2 Feb 2025 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738504150; cv=none; b=BeKGcTRPWr/SUlFsft+te0bnrrEDl6FNlzgc8H1dkJVbHjrnP7ldI/+93HbxfX9HkmIKH9to5xjfzXvP8S4g8FkbhRXzeAEg+MNSyMsb+TbiUfteYoVnXJhgIyN4py5NKynvfvgrELe9mBBTnM9DFXu5wS1zkPtcggy/s4RkDR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738504150; c=relaxed/simple;
	bh=IqScxnkMWyQPJL7nymqREhLZVhH8LNcwCfnVNb9PBlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oX1L1MaEkGFtiFjVqeVJ71GHEmFH3J/J3OZCAZMrdeKwm7Japjkvc9/7nYco3jMiuPpqYH0phuZVujD7IUBRV9l+0WyRpKNV60U1aTptFWy30XSt0GDUrE5bA6SRfVQwDuUmBKtG3Hjj8cjRoLEd5zzG+5ilHNkxDDpV95/gTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7/mf+1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC9EC4CED1;
	Sun,  2 Feb 2025 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504149;
	bh=IqScxnkMWyQPJL7nymqREhLZVhH8LNcwCfnVNb9PBlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7/mf+1lBvue4DBHqZlBiI3XxVuukrdJUW0kIVZwlzsBBR16R4u+TB1c4x51xa6Yr
	 EPY4O6pQeSb/GrqloyL0HY/MPYlS+Ujr5OIqAhcmnoqiVJ5pXKIzMeJn7eEczdOTE2
	 rnfbq+HDeaPkqmq6h1cncggrk+P9T+jWdUAAbz584aEl6HB3Kl806XSXTDH6ka9FoY
	 zK7i2s0Tso+RF5KGsTZXXE3d/oIxuijujYFZNNUh5LGGT1kTRxr371juYg2bbqyz2F
	 g9+VmiEJeY+xP7JCbk/t2UuhznTBXb8WaJm5AHIITgxd3cE8v34DqUxqRE6Sjf/6IV
	 hHJamK8fSVATg==
Date: Sun, 2 Feb 2025 14:49:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
Message-ID: <20250202-fabulous-donkey-of-respect-5763bf@krzk-bin>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>

On Sun, Feb 02, 2025 at 02:16:02PM +0200, Dmitry Baryshkov wrote:
> Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> has been merged to linux-firmware and should be available in the next
> release.
> 
> Bluetooth: hci0: setting up wcn399x
> Bluetooth: hci0: QCA Product ID   :0x0000000f
> Bluetooth: hci0: QCA SOC Version  :0x40070120
> Bluetooth: hci0: QCA ROM Version  :0x00000102
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x01200102
> Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> Bluetooth: hci0: QCA setup on UART is completed
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 82 ++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


