Return-Path: <linux-arm-msm+bounces-78936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C53C0E542
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FD5428265
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D630BBA2;
	Mon, 27 Oct 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju3dZ9fF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C330BB90;
	Mon, 27 Oct 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573994; cv=none; b=M9ZZao0REdr/T9IjxJHB0moPi/FkcYTaT8JHXdeMGO9wAaYjd8WgV+2UX5IH4AZc/jbKDTC96k0Ud6TEP8FML6Zqdyb64CfCDcYWgpWgqT9URHmU0GoPWVW60mUL0uToIS94HKwFdidRMVOObPb2+WsvE0xCCeMddTDlL0QJgts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573994; c=relaxed/simple;
	bh=KE65LerYKr2JeCRL/5Ih7GAP4le9csM54gDXViHiLOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=amZiWqu+vq8Pj1lgz0vWJS9pUdZvFyj01smlmH+xDbZuD66GfP4rEQJDRdW8+7hIfgJlrWAD/XfTRLO4tOWq4lY6nsPNVYpJRlPy6+c3eYTNzb/s1wIvRpSpgTDNvFlPQXyBCx1HWnj6X6G6bHmhDKgBIXUwwWBLGtmP/p4hB2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju3dZ9fF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1421C4CEF1;
	Mon, 27 Oct 2025 14:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573994;
	bh=KE65LerYKr2JeCRL/5Ih7GAP4le9csM54gDXViHiLOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ju3dZ9fFJQHGHc3wMMvklS+mneGBits0XgpdpGk13+iO9QQJumbi9WDm7UFhnL0Bn
	 Bu2TeeVBfzHCquUUInV/iMMVX6/FpHGul9zPSpwSmFQx/sDWfttBnlaGX9mclRjMeA
	 fK7M5oRcbhFi7TF60naFpuOR34YTzu1dhLFmlxuyFxe02Z9p127G85nYyznvh2CRiD
	 /WgJUyFdqSvEL9Li5Vj8h88XaFp+sE7K7egZi2t9gK5ZhWR2XMS+mnNH744q/SDPtS
	 xJTX/bMXgZZlOcQt5aS9ck5dcnzcBiWkXUzoFGcWKtGeqPnmXxBLk76BbtoSQWOjfx
	 KW0E8158UN55Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Shazad Hussain <quic_shazhuss@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add missing quirk for HS only USB controller
Date: Mon, 27 Oct 2025 09:09:09 -0500
Message-ID: <176157405473.8818.7905612918394382433.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Oct 2025 16:20:17 +0530, Krishna Kurapati wrote:
> The PIPE clock is provided by the USB3 PHY, which is predictably not
> connected to the HS-only controller. Add "qcom,select-utmi-as-pipe-clk"
> quirk to  HS only USB controller to disable pipe clock requirement.
> 
> This series has only been compile tested.
> 
> Krishna Kurapati (2):
>   arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB
>     controller
>   arm64: dts: qcom: lemans: Add missing quirk for HS only USB controller
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB controller
      commit: 6b3e8a5d6c88609d9ce93789524f818cca0aa485
[2/2] arm64: dts: qcom: lemans: Add missing quirk for HS only USB controller
      commit: 0903296efd0b4e17c8d556ce8c33347147301870

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

