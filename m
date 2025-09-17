Return-Path: <linux-arm-msm+bounces-73822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1374B7DBEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA0B532742E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 00:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAB120CCDC;
	Wed, 17 Sep 2025 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSP1MQmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D11F582A;
	Wed, 17 Sep 2025 00:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758069908; cv=none; b=k0GDio+ieMLyrEzxKSWuBLUAYwV+gRTeVBF6wb05wwagviFgINm+4PhIgeU+1IJAOO/jvYkTP/dw9gM3UG96ORNmhlxXSbpU0DtEj4Mb+kjILt33fFuIAos8/DoCVg5QEfSzXJKdm9ysm5ySU4y5/glBAHG9h5zKurFBsP1EgJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758069908; c=relaxed/simple;
	bh=9M1iY8dtCe4n5Xem0vLP5ateMYUQ627q9jhwtxz3Xgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihHzJUhBViMmW3Wil4OngamnMGkZEq2hJkXYo35sauqO4AlcPRIUKF3lLTtp3C30jygCbKPkSu52rpRc7HB+QEiiTNyG6FgdTszYrq7QZUMuwiOqpltwY/NN0F1Das+lZRd5cAUgde0LwA18PGDLXFlfTikRRxf6IGXxxUKLAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSP1MQmm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0554DC4CEEB;
	Wed, 17 Sep 2025 00:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758069907;
	bh=9M1iY8dtCe4n5Xem0vLP5ateMYUQ627q9jhwtxz3Xgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSP1MQmmFK9cV7uV9DaNzwQ7ffond0usA4ektN33Arnw/Er5W3KwsP19++Eq4kZZe
	 U++qF+c8IR311cTDt1xdsuz6w9C4WmDQlm+bhv/dLdwgsroRAq9M++BRMjRdv4v/gI
	 SFtEOfXf5YX/qglUM1KxWXCiGblO8SR9Ju7YtNxNqVZNhWNruKAPIJBdVroltYjbWy
	 j7sWQaL9gcdfbo9sQDOdRFc1D7xBAvbJh9UP2WOT5mlFpQSaZ8qX3fUj7Qp5uqi3T3
	 lO15cX490xNRi49tBSnEkPU9/XEBOJLJPDbYyXB3V63pmXJqWCYX2NNU9j2ZPZQ0Ct
	 CCBsevJcc97hg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antonio Rische <nt8r@protonmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-enchilada: Add notification LED
Date: Tue, 16 Sep 2025 19:45:02 -0500
Message-ID: <175806990243.4070293.14424350143372714217.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904-enchilada-led-v1-1-dcf936ea7795@ixit.cz>
References: <20250904-enchilada-led-v1-1-dcf936ea7795@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Sep 2025 15:54:54 +0200, David Heidelberg wrote:
> Add the notification LED for the device.
> The R/G/B channels are controlled by the PMI8998 LPG.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-enchilada: Add notification LED
      commit: 8b9b2af6de97e2d2cfcfb5d92178c198f01e1559

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

