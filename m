Return-Path: <linux-arm-msm+bounces-63796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F6AF9F6E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 11:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D683A8214
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 09:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8CF2063F0;
	Sat,  5 Jul 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtGvnq0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4567E107;
	Sat,  5 Jul 2025 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709089; cv=none; b=actPaQ6BTjNkJmP7+s77crnemFX2GLJlecVgEL/3d9DfHwgzIyjPgZFMf3Ao/lb1iknPOx8gle+17A0TDmExlPcAcOVPE8C9rd8eAT8pMmc0LeqceInVwayA7KJfVIoi+QO/FBGgBowrMjsiemCMmBn4ykHr3iX/kZy3zvy9WR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709089; c=relaxed/simple;
	bh=3bynmHtozjFAKsrJYZmSEGrQWHqK+GJEPB3QJy++yc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xvumb7u9B9jduGB/MvUfEfz7ncEVRDntpxDiim1LxMPmawmo1RYZ4BvB2a8mdR/sjohnkhPNlNDA6mpC7KPmOAcgZbM2pFnXhFHe8jLp3nwQaItyFYXdqyQqzLqoFYvfxo7UvtYL6bbeDk3e1e2PNaywk0GjLK8dweaQSOPKVtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtGvnq0i; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ab112dea41so807400f8f.1;
        Sat, 05 Jul 2025 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751709086; x=1752313886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwilIVNfuxa3IIndCAzsGcrIR2J+YGRrDjOtdSWoirg=;
        b=KtGvnq0irZH2hY5XwqWGQkKQVxHqU/sn5nFxjiMwRwtV5K9FLLAC5Nel6chp+2WqqL
         b8sD47jrSTQ4eSuv1QlIcWny1KJZ23xbKguKTWtlQUzyIY3WQsqwRNjT1k2lTvrLZGxS
         0RKSAh7lmE6Y/5nJ21JmBs3ZDw6jYrLvTgcac52Fw7eSfudb4uqgvhdImqxzn1RGvITU
         lIdKFd/fksLa0pmaP70zDJ8AzT+1edh983hypywcSIYJ7l+tw3rINJjp3499pOcrP45M
         Sh/lqpMTOGZ7u8BZZaJtpG3dD+xtWyZ0YunOrsBaNMsaCAjyCLT9+I1sNn8PwnWet0MQ
         4Ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709086; x=1752313886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwilIVNfuxa3IIndCAzsGcrIR2J+YGRrDjOtdSWoirg=;
        b=lXebEz80wwmTbsIN/npIqzgTZvPD4Lm+Ie8rLqKTLD/S7BBqItYtkjp4892p2y68yE
         GwNAXzMrv6CHvl3MG6tgPhq1FlIAY96XYv0Z2QT99GbP4jUbBHQNc9yu/Ly/qrzGNdxY
         5AruEr26XSYUR8GI4X5na5hLnfXy74e+rTm60HcPFV5p88LoDkpT3bk/h5IRZsQw7zAM
         sCav/Po9Xu61qdsWeA4OEex3u353oxLcRe4nS/Vj2j8wyl9wIbtsRAoeAQbkSV3qiEZT
         uBPC03wWg2mSGQG3WxzYn5adhq3wew1wFyAkxDDsSx3nFWcb1SltltxCgP58PiagEpZW
         tUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUDl9La3QC4Jcr1lHrheWPFStDLdWHax9Ln+ROAWm7F9l7k2pSU3FjU6/dp/afHW3DtMfWUqUC5FxyZTfBU@vger.kernel.org, AJvYcCXTIbtfZKVLrx6yFT/2n4R7FI111PnB2CeTcvyJS9fup9+ZaMkw11wzY2M4qDvgHXmnyy/yoLLs9RLJP/0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxACd9NJphwkBbhrfBpGL1z00gwb3/22LqsHfD52HNWwfDCH1xa
	50LVRPfnFwJgdsIb0243YINUeYSeu3Ax31j/k8DMkRzfKebjhQhH4wg2
X-Gm-Gg: ASbGnct6fjXzIvZWt/OcgZ8axmBQyx3aNFl9nNDsNxn3Bj+n+V4jgfka2L49vtVf+5m
	cIdtUGFwucW+WtytIOtoe0b06I2spWJukFVSZ9eAIQbpXv1GqxAzRfcu4piOvKcjGo23PQ7wd/+
	tlF6KkylAsAyZvH2WmDT+Yf4u23qjPFW6xbKJ4KTYlFPYVQxKC199hpwXPVDqmvPzCOzyU0J6wV
	fkjRtxU875kgFZgqfvInK4bGo4d285rgR5tZ0C0z2D8s8aOg5zzYh2AvHOTpR4RlYh6CZzFbhfw
	T8gO905Lzd2/ScTIEujOoFpVtaX/w4YzdI3z+t9zw3gFB96niWcaoe5AmLnC4JTt+PTXBMgm796
	4
X-Google-Smtp-Source: AGHT+IGcaIsL2pfhpJrl9NqtL7ggGiN1AraC3c74I7g09DJNfdA2gFRuPNOw/igevGsR7d/Uv8HwOw==
X-Received: by 2002:a05:6000:430a:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3b49aa8d85bmr1170854f8f.57.1751709085924;
        Sat, 05 Jul 2025 02:51:25 -0700 (PDT)
Received: from [192.168.0.2] ([212.50.121.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8dbsm50246005e9.5.2025.07.05.02.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 02:51:25 -0700 (PDT)
Message-ID: <4afe6178-7ff7-4a08-ac24-babff55ad5f0@gmail.com>
Date: Sat, 5 Jul 2025 12:51:29 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 49/80] net: wwan: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075438.3220967-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20250704075438.3220967-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 10:54, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>          git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                  pm-runtime-6.17-rc1
> 
>   drivers/net/wwan/qcom_bam_dmux.c           | 2 --
>   drivers/net/wwan/t7xx/t7xx_hif_cldma.c     | 3 ---
>   drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 2 --
>   drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 2 --
>   4 files changed, 9 deletions(-)

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

