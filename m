Return-Path: <linux-arm-msm+bounces-87249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73138CEE9F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49D7D301E186
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9AA30F52C;
	Fri,  2 Jan 2026 12:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvsHpsgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46C42D97A5;
	Fri,  2 Jan 2026 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358763; cv=none; b=F1e+IGfifVfNzJ309WBYIXVNMI5mAEx2gAaeQgrLI1yv0HvevugN6a3oR1WICBfirzBXnVDIu/V06nXiAEvOcYdC/KPSSdJp6RKTBue3QuOhcDQL8szTk/aD1GfJkYfiztAf/EhKLoHarBzOlhCjxXnfXs52BSAw9Vgx6EE9hqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358763; c=relaxed/simple;
	bh=0HNMklHTvHB9imCtlxW24xEYJEJNLmxGMBEQacuxhWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7IYW/opUHW004RXWakRsErNfDzK4tjr4BbtolpRGY55IF4lvvtIihhCy2N9ubYlXdf28jzLz6w3Hy5nAy36R9FYoeJ/UrqewOR2D9JFwOoza6sHTvnPoMWzv3Q+VzjOexAa/XBWjW44J6lPjgWJfGGUuCG0R69cPlYrhu0ph2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvsHpsgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F7CC116B1;
	Fri,  2 Jan 2026 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767358762;
	bh=0HNMklHTvHB9imCtlxW24xEYJEJNLmxGMBEQacuxhWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CvsHpsgThBLXO14vVOMA0/dvEKx3MeypV4piHM+TwPJCPVXf1YajRun1aklIcZowA
	 LfaNbwQTB7RWoKApl4evst8lquRhPUppNLygJg76R2n9Sr8ubqxhDh3eofBlSNiDxv
	 DXMw6aBUgpyJWXpNAOHwmQ76HqLbX1amsQ6V8Jy6Zv2bcSD0Dp7dr13Xbn/2WzHpWO
	 5mWrJGcZZRRocVTpOhjtqGTbjauYjK/9TySVNW5c+naF/uHiIhJXfH3j6q3sWWLtqy
	 MnrmOT6uWA4do46RTwLSvTQ3B2E6E0mIeQ+UEaAPNrVruBv2pI/4EjLp0ynphnWR6F
	 6nj1o4tFzvWQQ==
Message-ID: <1dcc9380-c2c2-4263-93ad-71edce86b0da@kernel.org>
Date: Fri, 2 Jan 2026 12:59:17 +0000
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
>> Is there an io-fabric in the world which exceeds 1 microsecond to perform a write transaction ?
> Writes on arm64 aren't usually observable from the remote endpoint when
> you would expect them to, they can be buffered unless there's an explicit
> readback right afterwards (which creates a dependency that the processor
> will fulfill)

I don't mean write-combining cache, I mean posted versus non-posted 
writes which is a feature of the front-side-bus :)

---
bod

