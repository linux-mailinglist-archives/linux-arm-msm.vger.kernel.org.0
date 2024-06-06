Return-Path: <linux-arm-msm+bounces-21849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B78FDD63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 818C02862F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F75E6A33B;
	Thu,  6 Jun 2024 03:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guk5TvKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0C61FF9;
	Thu,  6 Jun 2024 03:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644049; cv=none; b=dkh8hXueuApTatN8jqPWWVdmPq4JiQTPVCITiL4dp0g9FhTqVyvr1JkeynnmqE+BZB53Nx+5Seu5WBwO8olSc70RRkDHloBjcP72kWrMq3B9ZvDXOCUOAkIZJDf0+uDfzNq/g/nxcW7yzS+6k2B4i1uisHGnHyC8zuEV6ZtqLxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644049; c=relaxed/simple;
	bh=TAJB3TF2ebTfCNa/VFhsssPmNygw0SKhrgpwiBbll64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YX2ZF+gtsF9IJ3bCxZD7DGzKHOfBCG9fDm+cIEa+FTmeXyF86u+vUzqqWxjwBvyga93JoV7MtNcbrAP3NeifRf0VywbwkmHpngHtVPw7lQdI0Vve6iOR2xNHT9dEYfBcQS45jSIAFpJXbOp2E6xPRnijKRuz/FeNIWPYgGLMN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guk5TvKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2BEC3277B;
	Thu,  6 Jun 2024 03:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644049;
	bh=TAJB3TF2ebTfCNa/VFhsssPmNygw0SKhrgpwiBbll64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guk5TvKvArQ+VG/kn+S0QBLR1IJ4NM0lQhLKsxp+01Q5NNIPPcvN52g+JpU99cRAw
	 jGq5Y5mhwmXitFp3pP2jmWIs1kaavtTsTlY6FsFSsLFv26qmhwDBzD+OoByp8w4yZu
	 A3McSgNWskWyfZFBaB0X8dDAJgzCfSK4m2G9Qc0FiAeE5w8X257ZV96z1rjA5J192R
	 nxktUQjhdfmwYtHvJ59gEKvcZZSdt+eFOBzNRt7UQjyg/a3eidSzPnuFr/RmCyVxqV
	 eD05SuZEYFTq68HmytMN8BcdRqM1NmnxrqXsWUf1IQsoe4Y60q0eKiYqo63FQjUbSo
	 8EjzqF/+CL0yQ==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 0/2] Disable SS instances in park mode for SC7180/ SC7280
Date: Wed,  5 Jun 2024 22:20:35 -0500
Message-ID: <171764403331.730206.5657955466372530002.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Jun 2024 11:36:57 +0530, Krishna Kurapati wrote:
> When working in host mode, in certain conditions, when the USB
> host controller is stressed, there is a HC died warning that comes up.
> Fix this up by disabling SS instances in park mode for SC7280 and SC7180.
> 
> It is recommended to set this quirk for all Gen-1 SoCs. Will identify the
> other SoCs and push a separate series for the same.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc7180: Disable SuperSpeed instances in park mode
      commit: 5b8baed4b88132c12010ce6ca1b56f00d122e376
[2/2] arm64: dts: qcom: sc7280: Disable SuperSpeed instances in park mode
      commit: 3d930f1750ce30a6c36dbc71f8ff7e20322b94d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

