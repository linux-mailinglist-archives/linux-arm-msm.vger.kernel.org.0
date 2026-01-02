Return-Path: <linux-arm-msm+bounces-87250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C809CEE9B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 899A23001BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F10D3112B7;
	Fri,  2 Jan 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJAN68iK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294231064B;
	Fri,  2 Jan 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358837; cv=none; b=qgqPa/zwtONoymEHWFhzIn6Njy2PmjYQk+cAt0RGFYKyd+b7jD1lOF5MYKYcFkfPs3Vw2C43WIvYgo6kL1XSaZPCauH8QMZW8la8pCluZCBiHYMIAYeQurRO1MqBdbkQ3MNOb2Eqfwpl4Y7k8peuHsc7AWymV5C2vncV4mQUDk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358837; c=relaxed/simple;
	bh=SYL+wdant3jj78NTvQkvuiWVMTELRzXJMI2QSY1jnJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcW+VT/snH5ZOIBffFHqofW7+0Q49sSpHgqQz2q11KnrTQ84S8TKX/oIK6skE1Ss6mgGNVbRLUTQ21qOsIpF4spYRelrwD9LwKyKInADZlA2n5W32zSywCTWPpEpXeiUb4DzopG0lLdw0RMOS1bVGAA5kHMNxmo7uCt73t4UiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJAN68iK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527EFC116B1;
	Fri,  2 Jan 2026 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767358836;
	bh=SYL+wdant3jj78NTvQkvuiWVMTELRzXJMI2QSY1jnJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SJAN68iKcQLvOtIrCHUvFZG7OujeYMAU12vTH3Hw4o26YstmMs/iFnjOtyDWyTNTE
	 eom0I4Pt1En+uEZQXY56B6ugLii4llQYBiHvuVTYWK65ZVAqN3c6O4IfmcS7MrTbSd
	 xsUyApwlCaiwrffACUcnoge2rAAPHiCY8HgDSpBcwQcwID0FkDND2XFCNOdkrrpcqN
	 nso6hGr2pCcgWZl6VY72bRt9hRq93HTCQsazrd7ftUXPt7A2Pvl5x5A3xd+/tsXcjB
	 /7ae17llu080035Eo8leBBkm6+tNDcbSqSwghZuNcafV6RHRZXZgdYSpT24wm9HOYr
	 u0yQC+wjeONmw==
Message-ID: <c8a7fc0d-a402-40b8-b313-6b89d1f5a306@kernel.org>
Date: Fri, 2 Jan 2026 13:00:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <3i9J-ztSj5n83TPS7yQ3ngZYVpv2MnqVgpnkfywumw-hk2fPN3mty8T-vI2c-1Oh8V_ArprPioyoPxso6k2W0Q==@protonmail.internalid>
 <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2026 12:00, Konrad Dybcio wrote:
> Now I don't like that this driver is going
> 
> val |= BIT(i);
> writel(val, foo);
> // val is "altered" but not really
> val |= readl(foo);
> 
> I didn't notice we were just doing a readback for the sake of a readback
> in the last revision. MDM9607 should most definitely have it too..
> Perhaps I should have just read the comment

Yeah this just looks dodgy and inconsistent in this code.

And anyway, why OR those bits in...

---
bod

