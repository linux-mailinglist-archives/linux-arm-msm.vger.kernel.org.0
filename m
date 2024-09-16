Return-Path: <linux-arm-msm+bounces-31872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F355597A99E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 01:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B532E2863B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 23:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B606414C5B3;
	Mon, 16 Sep 2024 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYIDiKpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64D381C2;
	Mon, 16 Sep 2024 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726529502; cv=none; b=VVp35pz3PJ91qRX2+rZlU2UaYDY+ttQ6mmARKrIaBCTH9fNQMbyjM/LHtgFDPoQgzPldguxLiZdFoenwb+QlCVCssJHUhOex+/AZANzEuhD+8v5UFTyyRBa3MleXrjbM/1a0xpCA+epAPDpn7y0na78E9ilERwZlGWcHV3ZZgEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726529502; c=relaxed/simple;
	bh=PfrVg8wkn1O+jJEoQFvKSiJ2KYALwlhbi5sq6BHRJ4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVR0GuffjvM4YdO1eZLSKwiuzpu8b8kojEETojc3sM6D5eMNklI40gKy3SVnPeYqDMMebNStQZ2NZ4zTqmS2kp+S9G0+SlfIX3jMB2B126pVaDgktbpbx6QvF2/kt6r4WGXVtxBS6bMqUASVTh14As8oTwcvSr8oMNooYDL6BpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYIDiKpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2637C4CEC5;
	Mon, 16 Sep 2024 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726529502;
	bh=PfrVg8wkn1O+jJEoQFvKSiJ2KYALwlhbi5sq6BHRJ4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iYIDiKpfXfa4bwSKsoC0OWstXFjPvZL+TQyBxsS87X3tZDC/RIUZ/yc7jKUUrHyew
	 szkJYldtmaP/bR0iMc+GBgqusHut8vXekKNfhV1JRZVPotDACqgfBiKnOwvnw2Yv7k
	 qvTRKJ5rF6jpmQiMyzRdmQ0Xfxse0BM8FGAE9a9o5HLDAI+SZwe9SV1k3ZV7u4zpSv
	 +9hIuEYmpWnD6V4jv67GFYGx8DeTObwv2doO+rV861hnR58h5QL56i0/jwjbl+Omd8
	 Jo0jaas5mhTDJr0dbjZQjzYyOR+PBORiHj1M0GufJZSeauqDc4XO3y9RdDeaiElEqp
	 9Di8zkzCsSdPg==
Message-ID: <0069dc15-250e-4cac-a641-ab7d7ae5b497@kernel.org>
Date: Tue, 17 Sep 2024 01:31:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: fix PCIe5 PHY clocks
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240916082307.29393-1-johan+linaro@kernel.org>
 <20240916082307.29393-4-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240916082307.29393-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 10:23 AM, Johan Hovold wrote:
> Add the missing clkref enable and pipediv2 clocks to the PCIe5 PHY.
> 
> Fixes: 62ab23e15508 ("arm64: dts: qcom: x1e80100: add PCIe5 nodes")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

