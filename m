Return-Path: <linux-arm-msm+bounces-22754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5EB909443
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 00:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178E52838A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3B818754F;
	Fri, 14 Jun 2024 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVyIpaC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B76187548;
	Fri, 14 Jun 2024 22:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718405341; cv=none; b=TxA2MbbdrXU/c0003CYsw9L6BchF5LlFDaz9VaiGv24Icp7Fx1c7dXuFhoJEUkev7O689xiAmfeope7tjqTHUcK6nzgrYCveBsI3rEg4wm4P3t6UJdEkSo35PkDj1Pt9lj7FR/gPVyE8RrxcgLxS7rfgKTkV0zVKVGH/vgBYoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718405341; c=relaxed/simple;
	bh=w1njwB9/Qau5mUTazesoHTA6cx3pRt57wTrcbewgHKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6doxE1euLAKbFr7EeOqBJ0+ZiJN8DmbpqElLQuxOeU0MHde7M1LHI826M2ev6xOj7/Co/TQ/w6caZj3ULU3ineJRpj+3Re4tdWogg1lXFD/rYiEFp4eD35t7FzTSltuL/Io7eOX04E2mUbsiPWwtvXRMqR9XpfJUiYq4SVRs3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVyIpaC3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867F2C4AF1D;
	Fri, 14 Jun 2024 22:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718405340;
	bh=w1njwB9/Qau5mUTazesoHTA6cx3pRt57wTrcbewgHKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVyIpaC3C7LJXjKAgNwQQgefT5hu2sBdWPaKpYXqDjIi/IzXuQWPx3wXFxI8TFocE
	 lM5GHzg/7LFOxzscFD5Nsul7j4mFPMdzg7KqgzgmB7aQx3/1LEkecrnpE+B5CBn9ys
	 poIwNWGXsETs2f+i57KlKuxJ+3/srQ+JMjlsldyx6+DkOke5ZXqjOn0X0LP0c3uKdQ
	 YfGxKUcq7XKy4dMfvlRsi9AYVmM7JIRj0YdbxefAj4jc1io8Dx+KvSZ9+AD4k+d5MP
	 qHihqk0Alpgw3Hh4Igg8VM5e7r8EEWHv0yuMNxNdkMHgjk+Z1NcYB8zic/5QGF55iQ
	 FAdn7FbID1EsQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] A702 support
Date: Fri, 14 Jun 2024 17:48:50 -0500
Message-ID: <171840533352.102487.15387361923289327590.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
References: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 13:35:59 +0200, Konrad Dybcio wrote:
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: qcm2290: Add GPU nodes
      commit: 4faeef52c8e69f4fa43bd572049b502175fc55c3
[5/5] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
      commit: 1ae60a51d175f5d43e2020a1c3f11346796ae6de

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

