Return-Path: <linux-arm-msm+bounces-87487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB42CF41E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0974F3009219
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401B133A712;
	Mon,  5 Jan 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9Tp6Kii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4A33A6F0;
	Mon,  5 Jan 2026 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622110; cv=none; b=lMOnRlg/ps8KoTZCCZXTMp+J1KSzaIU7rSSF/zxdF/uZO+RjNHD8kCiXElTyHR0ZKjgpFDplIr1bu1d+DdnAHrYBNPdxkUg/DpS6+IaIySONhpsGpEqli+1MuYnxaWnIy+p8Mr8ebMsj31+gEMUViipvqayepiPAzbv44DkfLDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622110; c=relaxed/simple;
	bh=aJh9t1bM6vf+VmVosxIK7IbHvrg9FWsW2VSp0svG2Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0hsqRJl8BbTd9sq3g3rZ4vHAqKxZD4mDiPjUCpVzBBDi5vgzxhqh/h/HKlo+VZmlTMwmB/KXhIgYO6gMXYJ9aYJnOylBPKQs7OaUaq4Iv0wiL8qmxI/e6wKYf8dFO2taWLg3rk0NTHcYNhPWOKMli+eVn9YJqjw3VKWAz+T8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9Tp6Kii; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1B0C2BCB3;
	Mon,  5 Jan 2026 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622109;
	bh=aJh9t1bM6vf+VmVosxIK7IbHvrg9FWsW2VSp0svG2Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9Tp6KiixL4SZK+/Ueu0twwIlMKdhEjIMUbYiGdl045pCtHJYEUjgqWpxBbipuWwL
	 f7bNEV6wPVV9BSVXv6DtSxDgdn7Ne7rChs33QhcUcjgCiKAUb17/r5BVTuPEEBGpBg
	 dO+mw9fE55d/Y0OwY7ARRN2PuwjWnZ83ycAcGwVU5zYVfjybmWoazgJYEuD+i38hRf
	 B8g6pkqKYjNI4RNVSUHvIibQrTRcV5I/+fqLfNpBV6/hppH5zVURH+fpWk1luH+orV
	 2hNUEXfRuBvd+MZG+iDpHajFEE8oKoZvdF0QLTUt0mci3IafaHUIgeQGOPr25bWxA2
	 DQa7MY3WD7PMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-vivobook-s15: add more missing features
Date: Mon,  5 Jan 2026 08:07:34 -0600
Message-ID: <176762206363.2923194.7383607598616456313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 20 Dec 2025 12:38:56 +0100, Maud Spierings wrote:
> There are still many missing features on this machine, add the ps8830
> retimers for display over usb-c, the simple bridge/HDMI port and set up
> to use IRIS.
> 
> Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.
> 
> lots of these patches are very strongly based on the work of other
> maintainers of these snapdragon machines, like the HDMI part on that of
> Neil Armstrong, many thanks to those who laid the baseline for me to
> follow.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      commit: c0d377798d6f6d3efddee5ef7d96b608a071f833
[2/3] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      commit: 34d76723c41018ef52480ca3849b3ed3afbd8b22
[3/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS
      commit: b7415c490d8d75b8dc7500b9c02cf8e5852110e6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

