Return-Path: <linux-arm-msm+bounces-23515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D9B911B28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1C6282582
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CD416DED6;
	Fri, 21 Jun 2024 06:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUNkEaGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90CC16DECA;
	Fri, 21 Jun 2024 06:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950306; cv=none; b=uEYqhy3eSvvjNb2sMenhodn+6fYVPhe1Xeehu6GN+mvJW1AMrAsC6dalFP5OrFzgqAvd5IUdevzudrEleXx7AyJVWbQitzf8DkvefxqQnLJqvppVNiFrIFrHUcfWf3qz3FBO1Ym3ptuAdVvEdVlzqlXwHFPRFJOMMv75NgU7h8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950306; c=relaxed/simple;
	bh=TrPlD8EPTxxzfTHqr4aPupok0Two1WCg253dFO+fg+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCKLlg81L/iJkdtPYlAc1/YKqg3NS5aNeHMF0DydnevftdRV6nZ0mtM7zggULpY+vNwMDU0XG5jecPbKtVymZRqBNw2BaWyfWSzjg1z0414dh/tYoqAGAM3B1oCcjmxO4a3ZaadGRks0GmzmcwI0sKW7ISWNNx0ktA6nPvTypQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUNkEaGI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3E4C4AF09;
	Fri, 21 Jun 2024 06:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950306;
	bh=TrPlD8EPTxxzfTHqr4aPupok0Two1WCg253dFO+fg+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cUNkEaGIZHvcbp59hYWC7NVUNcpg7NLZ5wYETCou4n6F0p21z2elKnLHtFJ5woIwM
	 5IPx9p6D0T8bLF52Izm36zqukiQ+2f7Z+lBhgkygd0L75avxVYl3cLal6NWUASG5Fe
	 xKYZoSNO0C++9xsOeMtYmAVGObpDkxMYybWKNtStNiaKNM4UbsETAoFT39jNrgIzI9
	 a/Iyj8sRWzk0QZPEkOZzDDnUQ+2881BIXXeWgOnYnNdmR+B+3DRKm3NirYTAYHG/so
	 Hw5vn9c6cBOil7TL3AscucNL5ouppz1R4CNBstRiPr7XcczdTVglsu6I2JOz0fQ1vV
	 4dNcmQ2eEQC2g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qdu1000: Add secure qfprom node
Date: Fri, 21 Jun 2024 01:11:28 -0500
Message-ID: <171895028800.12506.3929742745184236619.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
References: <20240618092711.15037-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Jun 2024 14:57:11 +0530, Komal Bajaj wrote:
> Add secure qfprom node and also add properties for multi channel
> DDR. This is required for LLCC driver to pick the correct LLCC
> configuration.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qdu1000: Add secure qfprom node
      commit: 367fb3f0aaa6eac9101dc683dd27c268b4cc702e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

