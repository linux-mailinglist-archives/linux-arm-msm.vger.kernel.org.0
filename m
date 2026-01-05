Return-Path: <linux-arm-msm+bounces-87500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D49CF423F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 099BD3059A7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B5E33B6D7;
	Mon,  5 Jan 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsI+XpYf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293013191A4;
	Mon,  5 Jan 2026 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622132; cv=none; b=FoM7WHPhjS+kJUCT3vuIX8F3PWaaP8UhQyqSATT4aGhXM/ja8rocdI+qxr4dFN6gs6C0AEGANeEPL+rsBzLP4Ynrxa2XA/j84C12wYxgTDrnPwdJEFUnG7ivFYRi/OFqD+YPwODO+NVzek3ZvuLGolf9/+ey5LEeE8RBlZJX/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622132; c=relaxed/simple;
	bh=1O/aG6si25n07NEyPBB2fhXVl21vU5ZRRKE1DTok7Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tv0S6uD8Pn1p6LGkk6FaMF77keLK7iSOThkOWjXknlGXQN6vpStxWscVxT6q9vVb8+Rg6tV8uPMguFBgqcfV8XMz7InzV+vAdUgiGZHT1UyBb5iPi1VtSoolPURe63bq+3HqFJ9D+UgxL1KZGbQSpSD7K2h4aLO/Xbb9LtQ20Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsI+XpYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F8DC16AAE;
	Mon,  5 Jan 2026 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622131;
	bh=1O/aG6si25n07NEyPBB2fhXVl21vU5ZRRKE1DTok7Ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fsI+XpYfAGDAQ1DlAcRnsEVGGlB2NsUyn0/X1PhTAdq1De4QzMRar753cSlEY/R9N
	 FW2C9RmP6Pl9xFl0BgpRmOPwfaD2nIWk0i5PXAKnjWRFg8yAIbdsbkwazt6bfnzvYp
	 uL8NYuwBUqp2CbdjWwoLyVBhDHY8XtGEp/Qza/x74BwMPxZyHTsXBC7Cc5ENnfrUEw
	 y8VfiWizK6Ru1KjEygOR6mW3yl91dP+Reqce3PrdX6Zb3Thxzh5v9e3bFkBXYfDETV
	 Ktwr50NqbuHn6PIqIIyKnGzK636HqdVgQElBSX+DiIJmfqi4o2upNDt5pSZhf1FJDp
	 WzprSGis1hHfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add backlight support for eDP panel
Date: Mon,  5 Jan 2026 08:07:47 -0600
Message-ID: <176762206415.2923194.6008474037452537458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
References: <20251112-hamoa_dvt_backlight-v3-1-f35b44af7fc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Nov 2025 12:21:23 +0800, Yongxing Mou wrote:
> The backlight on the Hamoa IoT EVK is controlled through a PWM signal.
> Aligned with other x1e80100-based platforms: the PWM signal is controlled
> by PMK8550, and the backlight enable signal is handled by PMC8380.
> 
> Describe the backlight device and connect it to the eDP panel to allow
> for brightness control.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Add backlight support for eDP panel
      commit: 512716f69610d81db958b781132370731c69e874

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

