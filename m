Return-Path: <linux-arm-msm+bounces-19009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758378B8490
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 06:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0390B22122
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 04:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312562941C;
	Wed,  1 May 2024 04:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SoZqnvTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B429405
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 04:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714536196; cv=none; b=kQA3Ne6JHWkPB4EVHkqeXna+zoOXZ+Iv7VDxxyYpewk8C/IRb7BkuAgbjTg8dzffmvfV2N9eO+AzLMqw7MtJNovAmNl0vJY3iLYAUL4gH1ak8POHuzCFbSrsS+RHeK2JdVyr6qKjmIIMqFWiKwdz37N+ZI3oi1CXluZ4uBT3KaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714536196; c=relaxed/simple;
	bh=0+M3w/Rwyk4DELz4Y5UB8syWUFAjVBlsGq8zhTnbPhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAHfqd9zWwZybieZAoInTl1rzclzicPmGHiWV3vmn1vQ2GrnKw59AKTOsTOM3Ks/ZT4euuE2y7lFdKpMWGU7oRLfg3bxOKdGXtKAg+EIrKObGKjqTNNGKx47/C7XXqb8ds8ZNz58NsXm7AeshxvsbUhUkvz33AzlYh/vfstDkSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoZqnvTU; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-de46da8ced2so7356550276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 21:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714536193; x=1715140993; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9DhpvDZ5jjadT8noMpFkM2fayukKhN/HBsuXQwKC1aE=;
        b=SoZqnvTUIiYNfv7DcSmd5Ks5kDM/M4mpMFJx5eZnb9LO+Xv/6a/lTUYRjMICg5pzgZ
         UhNAQI4SOAB7BMTCW6mRa7bBWZlozoUOZRm5tA7DiUeU1xycoNshtzW+V2BIa4Fta210
         pcmMJiHP2mE6EtOgoDPafB97aqoc3JfejIlNYOZW2j5I1LZCP5pTTyTRc0SbfoWMQBkm
         igpwtzZJjc7T312rV4oDxzeRVSdP+44jl74OyosEm4vSFo3+3sTFyodStkPORN6J9bRi
         78CeObMJH2E72jnhnO/cxklQaEAzmXAlSbNTmRXh4VZoGRqzrrUmqQb6g0liyldivUeb
         EQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714536193; x=1715140993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DhpvDZ5jjadT8noMpFkM2fayukKhN/HBsuXQwKC1aE=;
        b=k2SQ7nQivjI6iM/5/QT4I5ItQlpGlbJgh+EEM2wp5B/ri673KurP4DHEqDR7PRCcQw
         WIVkkxNXDyaTsuK5I17yxc9t/BDsZbJRWCGp9aGZIQs3u34WBjTnQzB+uCciFcdmW76f
         zjME+ejl0HHP6ml7da9SEUKRIwStjbz9A81nMUmrpSMmUSfPluHKzpc8JU1Hn3A/Jp+w
         lsO6nXOIIkGdIsDKxkHxBA6l6zfvIR03oIcWXDNNsH4VoKv403bZ2P4Z/qQ+f8ViYGtk
         poRKL7dNcpBO/fSQPRwUURBkpbr7N+S2vzeY9Ce0Q1zWiWsqOERdKZqpbfdv/yQ77Gg1
         HobQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNWJCjR49ob+Q9UgcXpNdvxtzvzEhXKi7PtrXCXj0XvzF1yZ78IXjOD4PyfsclXF4V0kyH9gIaGYr8XLU41Ku7x4txQ4r5PJFfOAuFjQ==
X-Gm-Message-State: AOJu0YxT5Hu5LHHW22SCpSxV+OhTRTO6kpi+5vg4URjH4MyT6agsoko/
	AsV2EHnadFGBTEcqxpp+p2RcrUN0qtycfj2WMXPhrbnTNKKKiBqrcA0CKPGuLW03lpu0AnVKgL8
	WJcalO0CwohVF/F4EiH/UZWdNSB7n2D8CSyWJKNPmS3Y+5hla
X-Google-Smtp-Source: AGHT+IEGmYS844ras2vuIxsxIBNOQ1+l1V9qZ5I70U0Evly0QhJPSvITaLgH0CkbsmoeSFaLZQ0T85hDGtcJVIBKVCU=
X-Received: by 2002:a25:bcc5:0:b0:de6:1245:c3d5 with SMTP id
 l5-20020a25bcc5000000b00de61245c3d5mr1472680ybm.60.1714536193411; Tue, 30 Apr
 2024 21:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-pmic-glink-sleep-while-atomic-v1-1-88fb493e8545@quicinc.com>
In-Reply-To: <20240430-pmic-glink-sleep-while-atomic-v1-1-88fb493e8545@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 May 2024 07:03:02 +0300
Message-ID: <CAA8EJpqRp2-V4-zTX=52yoC8oJN4kgXb0cQJw-c08rQnfpycmw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Make client-lock non-sleeping
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Mukesh Ojha <quic_mojha@quicinc.com>, 
	Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2024 at 06:33, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The recently introduced commit '635ce0db8956 ("soc: qcom: pmic_glink:
> don't traverse clients list without a lock")' ensured that the clients
> list is not modified while traversed.
>
> But the callback is made from the GLINK IRQ handler and as such this
> mutual exclusion can not be provided by a (sleepable) mutex.
>
> Replace the mutex with a spinlock.
>
> Fixes: 635ce0db8956 ("soc: qcom: pmic_glink: don't traverse clients list without a lock")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

