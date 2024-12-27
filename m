Return-Path: <linux-arm-msm+bounces-43459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 769599FD01E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2157D1883653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B7C14AD19;
	Fri, 27 Dec 2024 04:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgQcr7pT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B614A4FB;
	Fri, 27 Dec 2024 04:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272938; cv=none; b=mtz3MxumAYLWW7WNobPIVLa4DqdX2Y9w7XudeZZAi5u2KyCID86wMiK+MATXKMR/7AnuSsiGQBjrlesRVy3wHk7cSU9dzRiYYF4Uif6NajSorGV6ofFIJgDcipuIW965sTi8N1kC8vNiy7qPlvIadPgCe6RzsGrs4+y1taKl8sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272938; c=relaxed/simple;
	bh=H+m3kqJntqvVDQnGSKrysUklyuUJye6AmWCdSi7Gg6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JsgsTY2QkIGjCTJiDEwPBJv0+e3yjDOlfocCykrqFNjYItPx/cSt1xQcNKGEaRV7k/qy9ctSsJftLOXa50FRW8cos9ISbFfV7x983qdWR5ziOLxQVB4EJRvfZM5rYP5mBGioNjFuGclDTQJUkhIjNx8b4YrF807SRM7M63g5JnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgQcr7pT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DDCC4AF10;
	Fri, 27 Dec 2024 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272938;
	bh=H+m3kqJntqvVDQnGSKrysUklyuUJye6AmWCdSi7Gg6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JgQcr7pThnq5QKZhMdgAGyQulWIpzTJnzo8QiTEvj6HdopHJCY/XzLDecH0spmCSQ
	 iX33wg+nJtWmCrv3AILDBNbvq0/748ahLhFC/wuNVtb050+1DYHaQqaR400vIxvtj7
	 Y3WJIbLQEonw4QOY2+pZdUCbHLrc/pXro6RbWu7Clhb1Xy+jUAr7nV52q4DqEBXk4s
	 suUlrLwZGMYiiVdEuOi8Bci0SofFTIlymGQkEypIm4oMK37eTK2fmHd+Okqdj6o1XU
	 6OW435bcxmY76uGJdWauakpICdGf9seU/2ucyWnuRHLDBq7Sq9oTXOq9Edba0Jy2hq
	 hmA/G+QLwbh1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com,
	20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com,
	20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] soc: qcom: llcc: Add LLCC support for the QCS8300 platform
Date: Thu, 26 Dec 2024 22:15:26 -0600
Message-ID: <173527291940.1467503.17007096107055888394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
References: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 31 Oct 2024 15:14:35 +0800, Jingyi Wang wrote:
> The QCS8300 platform has LLCC(Last Level Cache Controller) as the system
> cache controller. Add binding, configuration and device tree node to
> support this. There is an errata to get the number of the banks of the
> LLCC on QCS8300 platform, hardcode it as a workaround.
> 
> This series depends on below patch series:
> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
> https://lore.kernel.org/all/20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org/ - Reviewed
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: qcs8300: Add LLCC support for QCS8300
      commit: f17a2293d0ed99ed4f5c6886ee6dd847da99a728

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

