Return-Path: <linux-arm-msm+bounces-43409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E869FCCF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF2E0162F29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58761DF24F;
	Thu, 26 Dec 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVLC37Kr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7731DEFFD;
	Thu, 26 Dec 2024 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237667; cv=none; b=sVZJnXGcTmVg0eE9r9xUSb8avsPq0gQXxBpEWK4TBwwHFDa6f/FA96oosj3Ip6SknVX6RXOtMbguhhiAYoqOWZyDf0cXioPDvZ/KBewO6vSABYxAJL9ACIZgDH1haiaTG7l/E3nvwWpNoQJthdoc9CpyoebXhI4AoAgGWAiX2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237667; c=relaxed/simple;
	bh=4Tw+LPut5NTYnqpTZEIRJk3n1Iw56mmUESqIu91xH0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5W8UaN9ZwcLuMr5NHuXT5vLsuQpKZOuusfY5ojMHBsUhyXC6Gg9vpQMg5m42PokPeYgO6NhiNnoJRrtQRDFEuKYuwUwqMCAeTJtL8ZBzR6BFVBqlvKh6awFfZn4anz1p+12WO8AU7saSF8GQr/O9VBAVjWo8cEco1csPUpaU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVLC37Kr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E632DC4CED7;
	Thu, 26 Dec 2024 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237667;
	bh=4Tw+LPut5NTYnqpTZEIRJk3n1Iw56mmUESqIu91xH0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FVLC37KrbNoFawfHyzJq0VxWRfUMTJ5viEQdpmtZifgVch69Zw/5vg4lGBkyZbDhQ
	 KdDbh2w4zcUFVvlbUd7ZH9ReeU2QJcwcz35J/TcodWOGi5XSGOW0Rk6BU7I0nb8fMs
	 lf2RVwN20FJEuvycr2X1IXT0MNyi4NCi0kdMMkBygVwb+jpFqO/defW/AGZGN9DAg2
	 QOZR0M4tKQK9w9jPpvl9Yn6Lef1A1GiiJVHw7rjy2imQXkwMRYSnJfwv/TusLLci6x
	 zymklSmm2prcyY+syUE3Qam4PCfVAhWbHWVEd2EarfpH2w7vK1IN9dMXB8a84ikLSs
	 IliTiJdcLUP2A==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	abel.vesa@linaro.org,
	srinivas.kandagatla@linaro.org,
	quic_jjohnson@quicinc.com,
	maz@kernel.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: (subset) [PATCH V1 0/3] X1E001DE Devkit remaining features
Date: Thu, 26 Dec 2024 12:27:02 -0600
Message-ID: <173523761372.1412574.13536646291027557936.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241025123551.3528206-1-quic_sibis@quicinc.com>
References: <20241025123551.3528206-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Oct 2024 18:05:48 +0530, Sibi Sankar wrote:
> This series adds 3.5mm jack, sd-card and external display support to the
> X1E001DE Devkit.
> 
> PS: The ext display patch 3 needs pin-conf and updates from comments on
>     the list. Just included it in the series so that people can get
>     display up. Type c to DP was tested on all ports with [1] as the
>     base branch.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: x1e001de-devkit: Enable SD card support
      commit: c074fc2220eb1f9f3a4dd3d5322cacb553d3ce7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

