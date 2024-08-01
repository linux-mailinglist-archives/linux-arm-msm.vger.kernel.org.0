Return-Path: <linux-arm-msm+bounces-27650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ECF9441B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8C15B23904
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8EF145B1E;
	Thu,  1 Aug 2024 03:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYL/5EfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA1145A18;
	Thu,  1 Aug 2024 03:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482400; cv=none; b=M6YsEDtASsPX0hh5orpeBkw2ia7eZACNi5SrPFpdXxK51bUWw/feKcJBLqZPvlKsYG/a95qG8l8dP+FdVP6QlceuoEVmXHyFIk4gQNk0z0O5lTYovU7649NA5AvpNNbmnx/5/K+6DsljPxvQ/bkTD7ycb+APmXaWrjJmprRJKDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482400; c=relaxed/simple;
	bh=iSl0QKKw7pMP+VcoYhgRu1y6qOW+jX9zX4plqWU2MrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzY/SdJ+saOZFNeHF9F3Z0FzU0oH/5lSL4BbE8pEmkCOU0+cROx/baOBTXXQYtXNIdrQHj/D8hyxcl5yBts/FjB/su6T5/PncX+mzuIJQa45HfgoxMuAvDZjfSIknA4qJW4pwYEvgMjND9pC+VfkbdNhRMscjS01+xGJ5OEHAjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYL/5EfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E954C4AF0F;
	Thu,  1 Aug 2024 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482400;
	bh=iSl0QKKw7pMP+VcoYhgRu1y6qOW+jX9zX4plqWU2MrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HYL/5EfDFogWU0M/XdPkCwnyP6JapJmoooqqjLvotJAxjNRWGxKGIRt1f/GmmfaQB
	 6bSCmi8F7lRC07K29xWx1w9Nue4r2DAcjV2uOpHOo9yv6hOcSxmCwofC8o3isxwDeF
	 oQTp42gVA/YKEri0Ra0IRu44lPlYee9xS7y+LBxf3TAVOhN6i8zT8wPQPHMUZ0MDPi
	 1/CBpIb/MrLUXK6m+70bgp5lTPFSMH7SoVRA1JEwIc0rmMMQBFMMTHJw+c6ihWiJCr
	 cPMX8pbV998lraghr5O5Zajabdk3yzaipXm+jVrojZTPHTSoqMdVvPesXFSZ6sLS3D
	 kYuMyC+VmUt+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] arm64: dts: qcom: x1e80100: QCP/Vivobook/Yoga PCIe fixes
Date: Wed, 31 Jul 2024 22:19:43 -0500
Message-ID: <172248238584.319692.1972804229523008569.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095459.27437-1-johan+linaro@kernel.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jul 2024 11:54:47 +0200, Johan Hovold wrote:
> Here's a follow-up series addressing some issues in the QCP, Vivobook
> and Yoga devicetrees that had been carried over from the x1e80100 CRD
> dts.
> 
> Note that I don't have access to the schematics for these machine so
> this is based on the qualified assumption that the PHY supplies are the
> same as on the reference design (and similarly for the PCIe4 pins).
> 
> [...]

Applied, thanks!

[01/12] arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
        commit: f03dd49f884f428ba71efe23383ff842f4f15e0e
[02/12] arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
        commit: 0aab6eaac72ac140dfc5e0a38bf3178497762e43
[03/12] arm64: dts: qcom: x1e80100-qcp: disable PCIe6a perst pull down
        commit: 12661b333374c892f9053261b4bceb346a709ea4
[04/12] arm64: dts: qcom: x1e80100-qcp: fix missing PCIe4 gpios
        commit: 2ac90e4d2b6d6823ca10642ef39595ff1181c3fa
[05/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix PCIe4 PHY supply
        commit: e89fe0596c62363082cabbaa5ccb38989e714e68
[06/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix up PCIe6a pinctrl node
        commit: c67b3dfd8d69164f70ab3aaff889fca1e536c909
[07/12] arm64: dts: qcom: x1e80100-vivobook-s15: disable PCIe6a perst pull down
        commit: d7ff5d1868d1cfd1c06a601a7cfa2dbb6dba4be9
[08/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix missing PCIe4 gpios
        commit: e7f3f3cbbfef84729ad6c10eb589957e7b28b95a
[09/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix PCIe4 PHY supply
        commit: b90567c262fc3a3e703f3091499dec799a6147ab
[10/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix up PCIe6a pinctrl node
        commit: a655dacf2a35a35eadd95f0ba8fe9cf70359eeb9
[11/12] arm64: dts: qcom: x1e80100-yoga-slim7x: disable PCIe6a perst pull down
        commit: 750b8a3b5a4476cf000f3db1fe46293c97fcd979
[12/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix missing PCIe4 gpios
        commit: 86c71c0e893d58447e4a9e5c0d1c2c0f89c1b9e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

