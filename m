Return-Path: <linux-arm-msm+bounces-22005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E88FF9F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 04:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AE622866AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 02:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E7611718;
	Fri,  7 Jun 2024 02:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDF2G6C0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05D2F37;
	Fri,  7 Jun 2024 02:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717727643; cv=none; b=uPk8l9GFkT+ZKVz0BQp2PcqHmfCaExRn7nl4wCTDveShKLnzfKomA2MIeTCwFXm1vXvY0cvWG4fjQN8XSKL2bJNrCuzIMxZVa66lX+N95loa2D7/AzRDTIZPue/N0UK0ID7FM7ekf07WjLsAmH8Ca6AAeMBT+nRc29HyElcPWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717727643; c=relaxed/simple;
	bh=3VzyxyZsXiVuvuGn6byFbqD+Me/wzCxTPg4d2hqipyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfsm8E9KfuX6YIXWwuG9F3yYfKp2NMEZb4V6qZk0lUKtlzhOrNvxmLYQQO+ffUxvG4unB0OUFPqB1c6EeIEn1+AXwkUHaNoJ4/qjzlaKCarWXLmMDwsouWTbNfIwRqgaNxi6rNeAs4iTuxjNQHvXvrxfBHwCZMeVPjhNLjg+hXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDF2G6C0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDB2C2BD10;
	Fri,  7 Jun 2024 02:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717727642;
	bh=3VzyxyZsXiVuvuGn6byFbqD+Me/wzCxTPg4d2hqipyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDF2G6C0553fCJuC6wd8CfK4CuZ8XXXF9lVyek9BFTM8aZcr1gHbpR3xOVwG9lcc5
	 /1BjKnLgSPzenb98yzkdjgiDWZQI9v+lkNiLR87gytSETph0SL2D053422My5h7x0x
	 jmbaQUMWevtBC1Lyk+XvrWMBAFdD+Lzp8is+IuAXUhza6kEhw802yWBOFD9N2f2zeA
	 nbqfVEjA5WKTFvILfH1lzKxDqF4auY0MhtV6s1PgBPNa2tJuDsq2XwPpUExZDrENwN
	 cy1yOTvdbqLzzJTTJZ3Rmbf5Y5FofiBteK1Pd+sDenqOYlygIdgBqz+uUk/+cb9Vec
	 EUkg47Ezyt8oQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Describe 3 USB Type-C connectors currently used
Date: Thu,  6 Jun 2024 21:33:56 -0500
Message-ID: <171772763758.789432.18260329320659221701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606-x1e80100-dts-pmic-glink-v2-0-972c902e3e6b@linaro.org>
References: <20240606-x1e80100-dts-pmic-glink-v2-0-972c902e3e6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 13:41:51 +0300, Abel Vesa wrote:
> Both QCP and CRD boards using X Elite (x1e80100) make use of 3 USB
> Type-C ports (USB1 SS0, SS1, and SS2). Describe the graph for the USB
> part of each one of them for now. The DP port will come at a later stage
> since there are some muxes/retimers involved, depending on the type of
> board.
> 
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100: Add remote endpoints between PHYs and DPs
      commit: aa48a8a5d642b5806a7bdae52457c87fee3118f8
[2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink node with all 3 connectors
      commit: 24b7616a1cd3eeefa91417afc1467981c4cbaf61
[3/3] arm64: dts: qcom: x1e80100-qcp: Add pmic-glink node with all 3 connectors
      commit: 830a24be7dc1711c4e5be82cb319b575af7760f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

