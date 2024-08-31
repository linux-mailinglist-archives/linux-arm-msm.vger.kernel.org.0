Return-Path: <linux-arm-msm+bounces-30329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17468966F01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 414D21C21D4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0869439FC6;
	Sat, 31 Aug 2024 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuyrIlgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB162F2E;
	Sat, 31 Aug 2024 03:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074330; cv=none; b=Rdi0cH7XXuu/OMOE0fcJHpOZgHkucioBNKCkABhuESMWv7TfGcLowltwzwogTrhULfWI85mPptZAKsm8lZPMzr0kDEezOaf1MoKH4vCzyzAFf6yiRN/OldS5G6rH+usHgfYO7ROoT2AdROIhp41maR5Xueywm4QozvajrCBOSXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074330; c=relaxed/simple;
	bh=Cwm+QO/WFv4FMG8BSLkjWj16CK+JJ7GY/Ra92T5IeJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahkvzVAUJUUAa2LMZti1kCHdjO5pNioAVsaOBhmNFCIPH7Hz7zPwGJoxxTOoZCZIFD6evLAWNwCtDAog9+woT2cGG1OthjFuBWAC9npXx5WlBuZvI7dDq2VIq3L84/uYN4bPHw8DgtcuXMWrN53FhAyAvTZQL2utsWQ9DWk2jZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuyrIlgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B3CC4CEC0;
	Sat, 31 Aug 2024 03:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074330;
	bh=Cwm+QO/WFv4FMG8BSLkjWj16CK+JJ7GY/Ra92T5IeJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uuyrIlgiNYrfCvw8Sbl05DmZYECtXq3advZxJndlaHHY9dLm9XLSNNy+XTjKvJnOd
	 9kZFzFlAx2YFAplP92TuABbNavR5MBokjzTFNMH6fraqhtsWhgjVtPg9AO9QOBoPJg
	 8J4Tv6b8EY6dLIHlMKoySp1KSfAdUdq8rGoEChmQecvaJEu2lxBgGnnpkHJpVx6q8R
	 iGZDQwVtDDovvK1kTRgMWUfQ88gQfB007FL4DxTEmgv9fpMAOwcEt1HMcC30csNVT5
	 nsMq1HodD8nf7R/sa30Cer0Ftnu2/sBBOZB09XF+VlQdFFWa/B8aGF0goznEqKvY0A
	 PT16yW5HS720Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add orientation-switch to all USB+DP QMP PHYs
Date: Fri, 30 Aug 2024 22:18:35 -0500
Message-ID: <172507431831.12792.7318800529215252411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829-x1e80100-combo-qmpphys-add-orientation-switch-v1-1-5c61ea1794da@linaro.org>
References: <20240829-x1e80100-combo-qmpphys-add-orientation-switch-v1-1-5c61ea1794da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 Aug 2024 14:44:47 +0300, Abel Vesa wrote:
> All three USB SS combo QMP PHYs need to power off, deinit, then init and
> power on again on every plug in event. This is done by forwarding the
> orientation from the retimer/mux to the PHY. All is needed is the
> orientation-switch property in each such PHY devicetree node. So add
> them.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add orientation-switch to all USB+DP QMP PHYs
      commit: 17c5909f53e01c151c91f66949a9c4f191756bae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

