Return-Path: <linux-arm-msm+bounces-20495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA38CF78B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF81F1F21701
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505F01A2C35;
	Mon, 27 May 2024 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heV9/zgH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC7523D;
	Mon, 27 May 2024 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778853; cv=none; b=YKIhvxEkMq/xiWvGIDnPpBKzj54j9JNVtqdaGYQ1ghpAwnt8Q/CWtypkY9mDhQA82GRUPFP/TpgbbxewNzntXtP4GtTWp18XxQz9FFMsktrg8qI9BfogCLQlQ0nYYDcpSU0IJ6ECKbo765w6ftabanM+Vmt4Ztbyx0KMyHFkS1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778853; c=relaxed/simple;
	bh=nTdiDdx+FgzZ4SHRfcYFhZCSQwoxjChem3PiNU7hVlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHSa23CHBP6XP0F7VR8DBpVd/4ON8Nn/iQpC/xJ4MzHELbGxn4JQGmrsJDwsMjgvE87SFU3lzNiRUAuO9/G24i4R1AS0SLsQ76YVYNm8sVYLRKP286PFYjGi5NjB23XXpu9IFUJxTAFBhPjBI2H7dw5ZPMN3RhRisxiSteE5XS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heV9/zgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC365C32782;
	Mon, 27 May 2024 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778852;
	bh=nTdiDdx+FgzZ4SHRfcYFhZCSQwoxjChem3PiNU7hVlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=heV9/zgHyfcTfOrNE3zjx39vchJLalIGEGBMmYGnr5oxupmSAr6i9DoBuzXZY2tUz
	 Nxh2mEAIRdNziaolcPj9MoXr9siPa4JUbPvUXbk67BLbNnMZkNjyhoSLZrFbfBt/Td
	 l+1mgyKyZUpwpx6xGlC44Br1YWSOUM7AfX/ZvnsH/V1zxYXxm1K/fOvXihmrUuyr1R
	 ULutAnpqjAnBff6hU7stqd4ob3icJ1PkT5FKm3GEVogDU+0gw8BQwDs9uOPnkZZqvt
	 7+2k0we4TqxXrAwiZDuCszoubFp5SwOPpYmlZx1/lIvg0AFaOUWcDSn2GWzoOWYxwx
	 dFPVCHaVONXVA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Drop ipa-virt interconnect
Date: Sun, 26 May 2024 22:00:21 -0500
Message-ID: <171677884191.490947.15264104753111863715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525-sc8180x-drop-ipa-icc-v1-1-84ac4cf08fe3@quicinc.com>
References: <20240525-sc8180x-drop-ipa-icc-v1-1-84ac4cf08fe3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 May 2024 11:07:05 -0700, Bjorn Andersson wrote:
> The IPA BCM is already exposed by clk-rpmh, remove the interconnect
> node for the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: Drop ipa-virt interconnect
      commit: 6314184be3910c956def78c6899f58c70100372b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

