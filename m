Return-Path: <linux-arm-msm+bounces-20698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C34FE8D12E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 613D7B23196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC0713F433;
	Tue, 28 May 2024 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTbnHNdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087B13F42B;
	Tue, 28 May 2024 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867192; cv=none; b=mvQF48VKeOqyLCZEFK6azg/YOzEQBqBHDZ4Rl5MVnIHUd0xcQNU/PqrO7zehTK724pWrtd308O8daAa9hRMXyjZcVQzYit+y0WIEJo4UzaEaOc61enlYY4AUxte6/61DRlqs5BfRYznIEOky9Hi10V/axhtlwdJFkNQ9hV5Bnd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867192; c=relaxed/simple;
	bh=HDrhTw5TMIdEKnC7j95ZoOCfhnOMbNPZ+ISNMJxGrSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MV3aHrb7SHZ38d1HBTTuCKdcLiXnf0p3TAqfspYYsLpYKTDx04T0ViiQ2+idkxqVtOcbsqqO/bcS5QG9kpkNXUNyNZECHO82+1jeLKppJuszUetbjU40czIAj0IcIgibQ8Nyr8rOGJcCohxE6L6imrZGPYbpXnQyDwlbGPF4OZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTbnHNdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E3AC4AF0A;
	Tue, 28 May 2024 03:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867192;
	bh=HDrhTw5TMIdEKnC7j95ZoOCfhnOMbNPZ+ISNMJxGrSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTbnHNdOseJUOu8C0JgUBgQwUibs3Izh4Scp+XvsSyaEf8b6IAxkNT6OiaqglwbRT
	 DAwpsNNsgmYAywgVU1n0s5jDLBRaMKqFDl2EIcm0L5RRnBnsLMzzhmiivACYkDPZcZ
	 yYShfBqS2xHiGo7k8Ea61BFPlKoIPXmqKu+10win9h4Gelm8xQ1joBzev87YU2zaLV
	 3rsHXBSDJF2HYfvPq/0Efk34yGxnWXyWA7It+b2TtSIuksT9wr0WKRGXGK9YnlmFSM
	 MpJhjDMZqoLqL8EldUcT8QnF6UO4QDDz6FFOVH4sg44d7tBuxRApncaccIuU1uu8Ve
	 2gb+rE61n019g==
From: Bjorn Andersson <andersson@kernel.org>
To: ulf.hansson@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	bhupesh.sharma@linaro.org,
	Naina Mehta <quic_nainmeht@quicinc.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] Add SDHCI support for SDX75 SoC
Date: Mon, 27 May 2024 22:32:31 -0500
Message-ID: <171686715144.523693.14422441596356085933.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
References: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 17:33:34 +0530, Naina Mehta wrote:
> Add SDHC instance for supporting SD card on SDX75 SoC.
> 
> Changes in v2:
>  - Renamed the regulators as per the current format for fixed-regulator.
>  - Collected reviewed-by tag.
>  - Link to v1: https://lore.kernel.org/linux-arm-msm/20240515120958.32032-1-quic_nainmeht@quicinc.com/
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sdx75: Add SDHCI node
      commit: 37f5169f5c83c5de469d666aea7b9eca4c30e6b9
[3/3] arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card
      commit: a1b05c448e74a092c59a84b16e9d4a673c764f1f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

