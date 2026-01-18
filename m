Return-Path: <linux-arm-msm+bounces-89551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02AD39B02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 23:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86CF300305C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jan 2026 22:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D7B2C0284;
	Sun, 18 Jan 2026 22:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="gMkcxH4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8A30E0FD
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768776613; cv=none; b=WLTrtYTGNJs8PJcSOUOcEf7KC1NFGMJWF0mCTTggTfb6+L5/XkhOscR0aiTydsss8FauuO/7TFxrXoJadTlvu61LULT0utCNh/2LT5Fay2K3BGXuqIw3boSEBWT+g5wNMh6cS5eQ215RxFc0yJq2BAnhZoNyTVM8NQN5iPH9JrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768776613; c=relaxed/simple;
	bh=mdkU2txRlOISOj3cQ9qGfEo2dOKPq2Kc7uYJDcjVMF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p16F7F8aF/+wnvMk+RSo6YZrc+G46wswD+jf7sYX9DDjNYUwCiZ+9366fbY6L8Zwt9IOdDgHzpw9xIuk1mUGRE7WjxUdfpMCGmfg5k0iWqC4bIikLE1gs8W35JY33LdVaWx4Qxxaff5Wcw76VkjtQ5v5Ta4r403gdKpKHs5d0zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=gMkcxH4P; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <93940257-95fe-4019-bd38-0891f7c7b322@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768776608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6o62uwJC+K4KiYpv+J2nYdJ6yW7+xnhY+lKe00nqbzA=;
	b=gMkcxH4PQdtWmdkNRXvQpm5MeJckonC0IeHmfhRD/52IHRgtkRVzcxdoa24tVCAJz1Q0FN
	aCMz3YLD5kcNnqKJyhVLXF513er5tRvky4j0JWQiRFcg1fxN4/tMwsHXjCw2vuFa/zuENg
	4ITnBumFYr0o7Z0lVH79jav6SIPJQSjNMlGp7n8YxPEtEBX7aDlYknuI2W4P88wm2CsPq8
	6qVTJj4duOh4YP/p4qEDwhGEDeCKdTgZ/jXL5mEw3T2TceP496ZQcx+e/ASWp8WOklPiUD
	WKgBD5nfA9A8qlCfQC+0W7s1n8Ca6fH/V710SQWnzGyucQbJ+ciRu7FHqN4iyg==
Date: Sun, 18 Jan 2026 19:49:47 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] drm/msm: UBWC-related fixes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/17/26 3:35 AM, Dmitry Baryshkov wrote:

> Fix several bugs, possibly causing image corruption when using UBWC with
> the drm/msm driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (4):
>        drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
>        drm/msm/dpu: offset HBB values written to DPU by -13
>        drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
>        drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

Thanks, seems to fix the 
https://gitlab.freedesktop.org/drm/msm/-/issues/79 issue for me:

- disabled the workaround (`debug { disable-direct-scanout }` in Niri's 
config) i.e. enabled direct scanout
- opened System Shock Remake in full screen on the external 3840x2560@60 
monitor
- everything looks fine, the right half of the screen does not show any 
alpha artifacts


Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455


~val


