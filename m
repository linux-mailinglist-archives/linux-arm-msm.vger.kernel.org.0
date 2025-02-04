Return-Path: <linux-arm-msm+bounces-46852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F7A26D17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 09:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986323A66CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6862066D3;
	Tue,  4 Feb 2025 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="reSEqKtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDC19C54A;
	Tue,  4 Feb 2025 08:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738656999; cv=none; b=uFyUKDWSJnnq1+IzG/lqlzFXCt+bGVqiQnYezcY8Nnp3PlfVEg+4Egx8vgRrzVWCJHJs0vNNkEytvzVlfSQ6muQ7hMuiRWLCsRwI6OHK+K7/pw//LL7pddlZqqgZWwPvoRUlRaWQBWuggUqGhw9GfmcKW3qJGK419gJAGL7EB08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738656999; c=relaxed/simple;
	bh=Pi4BJRcpD6+2mbP23U6gIcc0347RKELu0h5A8ao4hSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3S/4WZjnZ4AltiJjB4N6Efrv9Tw/cCgrAo3UHZ340qv7cdiJFREecVq0cd06X45oTDXoHpXboxJwigM7dquAd2ErpqsQYkamz1x1mR5z00ZppNWdYrYrZNJC0K4ustwLldkueDW8GOvHGucRUT7LNYkU7qVIH69yzV+2qVGohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=reSEqKtr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41182C4CEDF;
	Tue,  4 Feb 2025 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738656999;
	bh=Pi4BJRcpD6+2mbP23U6gIcc0347RKELu0h5A8ao4hSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=reSEqKtrACbPg2BAoaF7yJA1Lasml46N46AEwM75iLEB8PMKTQb5WjtnHvQenZrD8
	 4rMJU+mHr8NgfXV51wpr+Nh32K+SsqNouy5IekiW4QCLMR8JevavNbppTZpA5d+t0r
	 SXYHK5vKHtQSP56T89LLxWTJdIwVsRDf5sheZ/7ctkMaEvW7BUOgbVSBXdx4GKBoUQ
	 tlIsjEDQAYWbkQvgLJPe2uHJCiE1EpQKPkA/Md9mXFO9MYqse3ORbhAeEFow9HOVtF
	 TRAuhvPWMqrNqrVFOgIKwscczyd0KM5YAqs2hgy7DK7YnJ7wrn1ZGnJijcvrvBljEr
	 hts5dCnJDxKTw==
Date: Tue, 4 Feb 2025 09:16:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset
 number constraints
Message-ID: <20250204-terrestrial-condor-of-sorcery-bede4a@krzk-bin>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
 <20250203-topic-x1p4_dts-v2-2-72cd4cdc767b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-topic-x1p4_dts-v2-2-72cd4cdc767b@oss.qualcomm.com>

On Mon, Feb 03, 2025 at 03:43:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> (Almost?) all QMP PHYs come with both a "full reset" ("phy") and a
> "retain certain registers" one ("phy_nocsr").
> 
> Drop the maxItems=1 constraint for resets and reset_names as we go
> ahead and straighten out the DT usage. After that's done (which
> will involve modifying some clock drivers etc.), we may set
> *min*Items to 2, bar some possible exceptions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


