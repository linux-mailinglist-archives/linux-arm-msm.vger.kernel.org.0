Return-Path: <linux-arm-msm+bounces-87318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A2CF0291
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EA613002D01
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BD122B8AB;
	Sat,  3 Jan 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHuDYT/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD62253EE;
	Sat,  3 Jan 2026 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456186; cv=none; b=uovcmxI8LxehGBAx9CfgBz96xKYpwH8HJV6naaIOSzcxUjN8DYHoHKydp28RtLDTAPzuJmSiSf1yUxdc8kQFTkRo1dRgWfsO1eqkhGrufzveKZca2TfcMx9WlXo5pJ+2bSg4cW7MV7v9pu3ax2joraJJ0jnOkq31gSR4mwJZ3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456186; c=relaxed/simple;
	bh=G42tVWgUebLZ9cE9bmCRLU0HIryTQc9lbgbxVw0Ea4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r7eDkadLP+RLjKqwUkVVEDQ5OqM6AHNle9VMaEPMVdHYegtZjhT69gu0FkpEKemCqqVSPPmqHPAdP4Us0V64Xm5/fO2Sivhe7g5HZzhfAVqR9tD4QSSq0YHzi9uQvzgiv0wrxj4xSjdzhMDGMsv47yySGPWXqn90cvx8/ffQ9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHuDYT/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5913C116C6;
	Sat,  3 Jan 2026 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456186;
	bh=G42tVWgUebLZ9cE9bmCRLU0HIryTQc9lbgbxVw0Ea4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pHuDYT/TfRknlB2JLrfneIU1r1NvvnyJA2YC5UD5bJbe7y8TLBXguEvJfLUQeCVIQ
	 DA6+byrc92VdbpAWPVZgDFBf8eqbGFsqWr+jcUs5gQHy1+bMD9A5F69vv0Fv0sJdfB
	 tGL3QVI8eUQ60pkZNMfrfTXRF5+hKNqXzOSYhDZ62oHx51vd3s0OFZ3KUBYKwo0yVc
	 t+qMHwvqEQR04eC79X6aijK370Ljx0PPrKZHIgwT7wJC4T7TkIyAz89LlLkLejXeNn
	 EIz5oFX43AY1riYCD6CRDhSF0hOr6MJT0DHiBdWK+KJlSDyoNJ4YIWkjZreLQgvOY6
	 dA7yuVQJkyXdg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: enable HDMI out
Date: Sat,  3 Jan 2026 10:02:56 -0600
Message-ID: <176745617452.2631416.9462586772942497525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
References: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 Jan 2026 10:00:22 +0100, Jens Glathe wrote:
> This patch set enables the HDMI port on the Lenovo ThinkBook 16 G7 QOY.
> The definitions have been derived from the T14s device tree, with some
> necessary changes. The HDMI bridge seems to utilize the enable pin.
> The required GPIO was derived from the AeoB dump of the Windows GPU
> driver, and then actually guessed with comparision to pinctrl-x1e80100.c.
> 
> Since the qmpphy involved is usb_1_ss2_qmpphy, and that usb_1_ss2 block
> is also used to operate the fingerprint reader, there's some possible
> interference. The explicit port configuration on usb_1_ss2_dwc3 minimizes
> this, however it works more reliable with the pipe_clk patch [1] that
> is discussed. Booting with HDMI cable cold-plugged results in the
> fingerprint reader not enumerating. Hot-plug and suspend doesn't kill it,
> though.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force usb2-only mode on usb_1_ss2_dwc3
      commit: 3802966a9c489708228b98b7265d8db87d8f6db3
[2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add hdmi bridge with enable pin
      commit: 67ce203eee94946768397a6fa16c43ee5292f31a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

