Return-Path: <linux-arm-msm+bounces-44269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868BA05066
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42ED01606A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C8A18C900;
	Wed,  8 Jan 2025 02:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlKhenTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B518B495;
	Wed,  8 Jan 2025 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302400; cv=none; b=PeYztZl5D9QfismsyzBk80RJp6AL6DVkclFjY2d23pSPS5zCFgl1RqK0fb5aJqR+SWT7jUfba4NGc9pKJf5BEC6Gx+1priUjIIJAmRFlyc0N0roA+1siYp1qRTwbUWW3MBs/wBI5PWMfw2g6GzO4ohRgNJn10ZJA6TNumKTleTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302400; c=relaxed/simple;
	bh=AUXQur/PkhTVSrLAWgnmKIqiKIiH/8tO1rzVaRVXW2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bo/UK16syUSI+SZgeduaPA/jLsLe5Loc1wy8jfXwq98jZ0a5CUgi4zMHp163Z2B2q/M1o39xOzqSRgXds66Ha0DSxOrbO2d9GypxeAmeuoWdEkbeY2zgGj6UZ1/4eppO8FyjR4+ZBiJ+gjoBomlT6WQjNYjqj9XFPBKK6z6zAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlKhenTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0FFC4CED6;
	Wed,  8 Jan 2025 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736302400;
	bh=AUXQur/PkhTVSrLAWgnmKIqiKIiH/8tO1rzVaRVXW2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SlKhenTPI+ZUDw/BZZk+YHX4+xLmQr1iM0wNVOD5/Q8N3MqsaH1cx2uxEzr1RMqqJ
	 7pXBZYswHZ4qranF/dLwART7W3b9wD3q2sl0954L9I/uU6gUOMcSCRJ0pzAXkYFzeX
	 F3zoMFptn81fzDJp9V50C3kfhVSeHQSueanYFNI9GAqK535/TUbW357ukkcnq7svgN
	 ZDnxEq/5C97FXP5JLcYGxsuN40kG5xvzZsmcPXk1LpyhZgKh7KPmCAL2tUj2qw/4aG
	 818se1Q5D1KSSq7RvRF/ldA4atoPKZkykJPtPkcx1hGYBPnSnC9NacKyMplElDmdJE
	 jEsyIPFKrQpLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: Enable fingerprint reader
Date: Tue,  7 Jan 2025 20:13:11 -0600
Message-ID: <173630239532.95965.6083543657771237832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>
References: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Jan 2025 15:35:07 +0200, Abel Vesa wrote:
> On Lenovo ThinkPad T14s, the fingerprint reader placed in the power
> button is connected via the usb_2 controller. The controller has only
> a USB 2.0 PHY which is then connected via a NXP PTN3222 eUSB2 repeater,
> which in turn is connected to the Goodix fingerprint reader.
> 
> So enable all the usb_2 controller and PHY nodes, set dual-role mode to
> host and describe the eUSB2 repeater in order to get the fingerprint
> reader discovered.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e78100-t14s: Enable fingerprint reader
      commit: 5b451930fdeea4e4987d3cc1c4a44da85d0b8b9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

