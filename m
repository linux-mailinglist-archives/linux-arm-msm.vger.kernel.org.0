Return-Path: <linux-arm-msm+bounces-58032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43649AB7E6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DB1F1BA4850
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 07:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9216F29710E;
	Thu, 15 May 2025 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMoyN5rX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682FC1F584E;
	Thu, 15 May 2025 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292398; cv=none; b=pa6J2Ylw13puZY3gvMzdZm3yKpNGKxXcPNO2Sbg6/oHV3xlYkzWGJfNIiTEU6/AAJ7CejaX+De4dpCUjhIemHlfL/8eBEpljZWGOwx3+b1cw+x39Gbev6Ko5py2MlNFK3r1JOToQA6bo9lFTnwKnuvPOh1C1as3GI4u7zwxEnBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292398; c=relaxed/simple;
	bh=9Z2IqZ5m8YOW1MqoOMZwaeiUIhfh9EJVeS/GBQAC8ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X0edSGWXcE9lTCldoeECCq4rrukmE4u0Tb2JuOfdPM7Gzoqy8p9hELMmHdWfTKtXDhJyvqMIrbDJCqt2R1bFj74PmhMiBcDNEMpCj5G/JCOU2RBaA39yE/pC2SEEtPeV7mqSEMtWB1dZC8Y5bOir58Addsnj6ZkPc9+mPXoPDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMoyN5rX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A756C4CEE7;
	Thu, 15 May 2025 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747292398;
	bh=9Z2IqZ5m8YOW1MqoOMZwaeiUIhfh9EJVeS/GBQAC8ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AMoyN5rX623UrFf2iaP1U4+U2TrDwOA6j++UMkvu3kPlAhQLM2E9N7daDjEwonLZG
	 mhCxo99dwbCQxfwwi7QC4CfNMDY5Ke8IhjoZLJO2aAhoOBxRsG+w6hG/z3ni9yl3Nf
	 g3P0IwbVz3i5P+YKU3weOWXWC/dTvYf/44fwXaAlBuIWRCsqX7juWbgB5jlVNbNWOt
	 LJ4MFP7TRgzBDacfxYkTHQeziIbO4Rz+U6F2dCWLIFNLJm7n3GNUKmzth1z9FGlv5u
	 A0KGIoGoEQmwceD6iyKMfBwxI2SQdgjsbdhBiD/CTz8Y2MpbZrtUKi2BgMVgMGr2oB
	 JrbzNsXfvt+2Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com>
References: <20250512-ipq5018-syscon-v1-0-eb1ad2414c3c@outlook.com>
 <20250512-ipq5018-syscon-v1-1-eb1ad2414c3c@outlook.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Add
 compatible for ipq5018
Message-Id: <174729239616.728974.7482157548269441059.b4-ty@kernel.org>
Date: Thu, 15 May 2025 07:59:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Mon, 12 May 2025 18:36:46 +0400, George Moussalem wrote:
> Document the qcom,tcsr-ipq5018 compatible.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018
      commit: a49b7d3746fe6e0b3eaf1da065be111fe2299c5b

--
Lee Jones [李琼斯]


