Return-Path: <linux-arm-msm+bounces-70513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A44B32D4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA4C81B6126D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 03:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551E525A357;
	Sun, 24 Aug 2025 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8tyQGB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE525A32C;
	Sun, 24 Aug 2025 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004183; cv=none; b=fV/HS0an55R2PtelP1Eb7pLAk8QAf1Bvx2X54eqm5sei3pk57znbcVPG4qPPFu3uNUnnVi7nYos6wFW9ym/cFB5Cg30jTKqleuw6OaQI5aQPCTeaqR6E/YuuZSH/4A8SMAhtyzpyzSCEVVt89Pr5k9B6UWICggK4cvoMd+MbT7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004183; c=relaxed/simple;
	bh=gCW//UORKQP3ZPeAsauS1/B5+ELT/634MkYaQ5QHQMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=egSn9DTA4YwvkKSrqbuDReYL666aC9Sx3KUnKuBgAh5M6d6eomBDyAFaQP+Wmq3JSbBDqramFb8/8ikxhiofwkgJoimGUJqrbwXHa7AgGPjJtrOe3KfMFaBCa77JeOKjkSYEhaW4tas+2Jfd8xHBhS1BGvukiW34Ei9ST4BQthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8tyQGB8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59311C116B1;
	Sun, 24 Aug 2025 02:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004183;
	bh=gCW//UORKQP3ZPeAsauS1/B5+ELT/634MkYaQ5QHQMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I8tyQGB84CnAUXWLuTRiAue8W94DEzhjdER3H6OKz1eUscl5r/DH6ETcHqI36zRso
	 Ysu9tWhrDKn3ypIhDpf0wgBAZUPga43EMhzqU5vFcozJRtqWs2vCSCSGXEAhg0cNM/
	 wUY9EiIeu8SQAT07FOhZKy3pf37+dcQANTWANecxaBAKd5KJWHgyJR19DR1hsdnNcQ
	 mTBORJ8CHzoTMzQnhyZMVl198m69a5SD1vu+YgHHDkKgoCEhqliXUdgu3emZFXTe/w
	 jaNb4VeLNgSz7b/opnC7+NwVeCmoyOSP0pA40jsq/7tSbi3l8VPejm3GIniH/zuoCO
	 NVWYUUSuAMk5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shashank Maurya <quic_ssmaurya@quicinc.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable Display Port
Date: Sat, 23 Aug 2025 21:55:56 -0500
Message-ID: <175600415285.952266.17913122886887019402.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821-enable-iq9-dp-v3-1-8c3a719e3b9a@oss.qualcomm.com>
References: <20250821-enable-iq9-dp-v3-1-8c3a719e3b9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Aug 2025 23:24:28 +0530, Prahlad Valluru wrote:
> Lemans EVK board has two mini-DP connectors, connected to EDP0
> and EDP1 phys. Other EDP phys are available on expansion
> connectors for the mezzanine boards.
> Enable EDP0 and EDP1 along with their corresponding PHYs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Enable Display Port
      commit: 69f0611c8937e343d4ef9b8349d9dd39aceb1636

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

