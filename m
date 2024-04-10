Return-Path: <linux-arm-msm+bounces-17101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE70289FF40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 19:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 690AC2830C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAA4172BBA;
	Wed, 10 Apr 2024 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ts4QcG5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FCA168DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771852; cv=none; b=jFwCILSDuPQGVS30oXWCl//vK+jxDJZjFLTjuTC/nTFZU97QZoCX/1K1To7KUBoLSyPmPVG+6kvdkwdxxLCv5YaRZIRpzg/Swc4m8Hi5JXeoQa47qEc+VvC8kQyCwU52GMPSUmmqpSBOYOCs8IUFT1SweeuIXYkOUF1MvZ0VjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771852; c=relaxed/simple;
	bh=d4BtwqKAX8nsbOtJH/r0S6Y+oLvQxv6c8zbD+FFfF9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0UdXdK07iV65YBwoTL/zcCSDdU1XfNwz0ePTxRNsA8x3/BL270UUusNtTcjD52bZmv9HKfIp6UFSp2tcGfVOKYgvlFv78u7CxS3gkWJ0Jb9mXlNPBxN6MPQpTrbNTkNjJg2KVytLO0Q9re4eoNjGzTbvACw3X2YCyUyynOypHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ts4QcG5E; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso29260641fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771849; x=1713376649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Keh+sIQeRPab3t60QMgWltAOm3qWZpzbMlaDmGjP9v4=;
        b=Ts4QcG5Ek3ER0MTyAo1wJy40MuGMsvGwuZq6WE3HN99XfVRX1GjSJtsY/TIGUCLwJz
         OYtMcLfOH+34rgcDeGYrwvjv12508+iiUDYp3Xg4lvhIJaMs5+a/czg3zUC1Ku9XKCHX
         zyds5LemfvDTgzdcFTv/9McXk2M8eFWi1Im5Np4SLqKwpBvcXXagQNPpKXs/WHB24iHQ
         ljK1GdzjhCJkFx2Gc+ghjbFJr09hQu7elVFztGrujOPzYTaGab8uGhTn/vGM0KmFgLR1
         jHQPTPTj5jG2UGRTT7oOPXiKpBI76uZHNIClBxXNYD3Xr/OOWNH2JbsONjEEE/yy7mtM
         UYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771849; x=1713376649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Keh+sIQeRPab3t60QMgWltAOm3qWZpzbMlaDmGjP9v4=;
        b=POC+K7jCW0mDgG/pjin8xYmv93xONZEO2Tcdpjc8Er5J9PZQfKCGQCWBYfX6Ebb+N8
         AQf2RlXJ+nde2L+kXNvhlYJzxkdZezwhBkYxR2B/5HFZueVBeDpkQfe0zHIFw+xkAht4
         ledC1MTyioVGuwfuPw3ne5fUzbMOMwU92wWfcJh/cYI2Dohy9kO44vNjR5MAB9yAVpIz
         4KXQDSsPbMz95496zIVcQc2v0amm3lMI415hPOrTjHIH/L8RpDmRHQ5Q+OCmxV+LS7hE
         AyVOwSXjwQnh9MTPdh1juzm1pGycEIYu7mRmB6aNZkwgyYwTNZGO26wi+uRk3KE2hF13
         Gbng==
X-Gm-Message-State: AOJu0Yw44oNun/6oKbvgNUqZ56pbZxVVLea2n4ZOojDrWDSyIrOI9OtF
	/Lq2XFPO0Zrr7AaZ702v2CsQv15zUFS0wOOImZlMJV5mtkp7Mz/Hosf6L3C2zmo=
X-Google-Smtp-Source: AGHT+IE5JGH4lSYVlSEHhQH6EV1huMoARnine21xFIyBlZYyXopqr5UbT3v5//1+D8M8VOOpQl4S9Q==
X-Received: by 2002:ac2:48a2:0:b0:516:d250:86bd with SMTP id u2-20020ac248a2000000b00516d25086bdmr1962949lfg.44.1712771848929;
        Wed, 10 Apr 2024 10:57:28 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t20-20020a056512209400b00516be9fa424sm1883743lfr.254.2024.04.10.10.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:57:28 -0700 (PDT)
Message-ID: <fa826aed-579a-4432-a1eb-053a3b7f40c9@linaro.org>
Date: Wed, 10 Apr 2024 19:57:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-ufs: update SM8650 tables for Gear 4 & 5
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240410-topic-sm8650-upstream-ufs-g5-v1-1-5527c44b37e6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410-topic-sm8650-upstream-ufs-g5-v1-1-5527c44b37e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 17:39, Neil Armstrong wrote:
> Update the SM8650 UFS PHY init tables to support Gear 4 and Gear 5
> using the overlays setup (only supported Gear 5 before), and sync
> back with the latest Qualcomm recommended values.
> 
> The new recommended values allow a solid 50% bump in sequential
> read/write benchmarks on the SM8650 QRD & HDK reference boards.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

I'm gonna trust you on copypasting these numbers properly as I
have no sources.. but that 50% speedup does look very nice!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

