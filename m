Return-Path: <linux-arm-msm+bounces-20516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F28CF7D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 993C51F21822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2E113C673;
	Mon, 27 May 2024 03:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ra3VvLhk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7B13C661;
	Mon, 27 May 2024 03:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778878; cv=none; b=SN2NTWZ1qam4MOCboQ3YzL2i5M9Bd/zNsUoB7JibgvKogb6pAHZvou/uhr1Keo4GLTzGpBR45l7H9sylpVogSq2mEZO54dS25epMgGNyULw6WLQdp4OEI9AiXDaUyMx1oLV6DTk9H4lq4+w/oLGVHay20hfpt0IDcDNi/m/fcvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778878; c=relaxed/simple;
	bh=v+XgE6b0Idw6pGPdeA3ATsdusVzhKwyqmeK4YPHgrp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MUNAyimojHQoeXXS6ueCrkHfYwYP/EFU1xJo6G15qClvhwM8HLlEJWz5zet/lMNcD8vxG4YedudCUr6qYxtIdeAtynEvrK6wHgGQ7cksvzlH3WAPAZvoWil+GEwm3fWcNXHETp0C6g0xrtVdujt43fBx3x2zJNNOI6pla+FcW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ra3VvLhk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133F6C2BD10;
	Mon, 27 May 2024 03:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778878;
	bh=v+XgE6b0Idw6pGPdeA3ATsdusVzhKwyqmeK4YPHgrp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ra3VvLhkF7bbhMQm91vdwuFz0wsrm89ss5JWwFTahu3k3ppNTFh3yPX0De9VfGPyA
	 NdUQe1J+nJvVuvkFt7AFTug4lo50ob38JT758mlLlYydCikuVjWpCm8/1ZGD4NSA2o
	 d4Ml8fbjXt7pOAb8l5ZkNDOqZxBCm30/4UFT+FvRfAjLIzgxc1udzE/pK36vMFwf/R
	 H67ahrWftv/ypkRd/WOQZoYBm6iJ8TjxyF/jZFJiS8f+vsMULIdfzkaQ6lgzs+oXZk
	 fUY6HN7o8+XpJq/cTOQJjO0JcAVEIeY4Uf7bxNo9EPf9uaNHNp4syaAxQrQX9e+E54
	 gB7WKNWtpNOzQ==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	konrad.dybcio@linaro.org,
	swboyd@chromium.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rajpat@codeaurora.org,
	mka@chromium.org,
	rojay@codeaurora.org,
	luca.weiss@fairphone.com,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: quic_msavaliy@quicinc.com,
	quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove CTS/RTS configuration
Date: Sun, 26 May 2024 22:00:42 -0500
Message-ID: <171677884201.490947.17051239066319760659.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424075853.11445-1-quic_vdadhani@quicinc.com>
References: <20240424075853.11445-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Apr 2024 13:28:53 +0530, Viken Dadhaniya wrote:
> For IDP variant, GPIO 20/21 is used by camera use case and camera
> driver is not able acquire these GPIOs as it is acquired by UART5
> driver as RTS/CTS pin.
> 
> UART5 is designed for debug UART for all the board variants of the
> sc7280 chipset and RTS/CTS configuration is not required for debug
> uart usecase.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Remove CTS/RTS configuration
      commit: 2b96407b8f10f1d71b58cb35704eb91b8ea78db1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

