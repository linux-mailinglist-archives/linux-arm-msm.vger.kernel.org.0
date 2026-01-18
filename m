Return-Path: <linux-arm-msm+bounces-89545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8ED399B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 21:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 067B2300796C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 20:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B4C3002AB;
	Sun, 18 Jan 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="GhMQOs7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4E52F533E
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768767826; cv=none; b=bzpPvik3LvUbJfmLN5SYzFFLdyBkTJFAOXEniykCT2BeJRwWkryixwPXC6uANfx5Gy0Co3zNCj3BuBuYP/lgVtvJszzKAobsjRFEXDvMSxA/LhF/2V3tRiLsmbEEIbuMr6R+ilXpZdEBcGcKxzRrcOQV2QIM2MFwLuA9lCkUbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768767826; c=relaxed/simple;
	bh=1KmlhgpnhMhlTqqRX7V6IQGrXJek28BbOi1DT9+1fXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgkjlUeitI4Ac58U5FD/wyIbfojPC2f04strPKQN6n96Q8WnltZ9Qfvf0RQRSKn1DZoJkGXHZwN9J4ZIhf7t5KGhxNhWA3Gra4Z8A7GfZL9DD0hbw1M0mwRmPyUVXPkeapvLzLpv72m1R9BcVMI+OckxVfMbd2M9y2k9cYlfDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=GhMQOs7S; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <d14e84d5-5c64-43d9-a3d1-6e5361322551@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768767821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmNLrCGOrA1csfsCDmuvQF5SpM6jdS7qdpTp3KM6ngA=;
	b=GhMQOs7StyS5ZHla0fMcITb5pMdno5t3S+txLY2YVle7I3JCgIt7ATeFXMVTFwxKv1oW8f
	7xy5intqFr8t1FkceR5Wt4yaKFPCnvsCIJHJ5kQm5hyimdK3WYscr8FJkyB70Nrmb8gpj+
	6yc5NeeqCBAD6LVudha1/+QdJHpZYHojOmgaOn8UgU3UobCYliw3UMv8LIR04KKq6KnQsx
	lr+CEBVbbSLNNJvHWk+UQBnHuK6x1OjMWKEWX+FAWIt+nUTqy7Su2ghZR08buoU7O54JhT
	FXGOohtA9eE6X4cvj2iExoyEPvEJ77vsg3ssKvYW+hHdXuF2d1sr/2WYzfpLXQ==
Date: Sun, 18 Jan 2026 17:23:34 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add 1443 MHz OPP to iris video
 codec
To: Alejandro Quintanar <alejandro@quihel.net>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260116190225.25320-1-alejandro@quihel.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260116190225.25320-1-alejandro@quihel.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

hi,

On 1/16/26 4:02 PM, Alejandro Quintanar wrote:
> Add the missing 1443 MHz operating point to the iris video codec OPP
> table. The qcom-iris driver requests this frequency but fails with:
>
>    qcom-iris aa00000.video-codec: dev_pm_opp_set_rate: failed to find OPP for freq 1443000000 (-34)
>    qcom-iris aa00000.video-codec: power on failed
>    qcom-iris aa00000.video-codec: core init failed
>
> The iris driver uses the sm8550 compatible fallback and expects higher
> frequencies for turbo modes. Without this OPP, hardware video encoding
> and decoding fails on x1e80100-based devices.

That sounds strange. I never needed to add an OPP to iris, let alone 
such a massively higher one. I can decode two 4K AV1 streams 
simultaneously on x1e80100-dell-latitude-7455 and it works fine (adding 
a 3rd one just grinds them all to a halt, no power errors).

Looking at the code, the clock is calculated as a sum of *minimum* 
frequencies required for all running sessions (with a fallback to 
ULONG_MAX if that's not available.. hmm) so maybe something is off 
somewhere..

~val


