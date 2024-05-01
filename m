Return-Path: <linux-arm-msm+bounces-19036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC58B8537
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 07:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8B51C214F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 05:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D433FB1E;
	Wed,  1 May 2024 05:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVPTXIvB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F023F9C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714539863; cv=none; b=O9WZwe20N4cjrRPQUp3XxIM2LyBvEiB+1kasXnUcl4icBNMVqbWmL1dr3R/+u5KUgEeJsotgKp/QsG6QPtDNfVvjcU/X3bhNRfWhqOejdUiMFIGxmN0zj2+yYzvB8PRENi/LpA6jNSPIXTXkMKYsYLMYYSnziv87fq6zFwq2AWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714539863; c=relaxed/simple;
	bh=k5np5PMuG48RZS6TyVi4WdkSCF1WTV9UVRB0QjxF0VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d63nSj0z6jq7yPqcQyV2aKv1+X/Ph7+eh/X3GooUwCu92Uw/r5iHUqwzfJceg2MVAnZBiOFi6vZ5bessWTDmHvT7DhM0vHnXbKP8jM4Kyjk7ypFICcbNrkvFCGSs+G2zZ2kkBabNHwc8oHCHMvyP3aNOhdOwpMREu2tygyXrgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVPTXIvB; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de54cb87998so7059471276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 22:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714539861; x=1715144661; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yrt55+g0BPYJwwh9ZrZLrkqJD55n55fYZs0ENWzSia8=;
        b=GVPTXIvBkDW0G++CKB7uIR9Zmk57dJr8bveVv6eFwJJRNz6WM1k6rqy6ysn9WZ2qiU
         TNvCVub+uHzy5H2pMqeNz9r7+7BeNHBXDoPpMuAN7G+D6L7yLDZYncx5oeNCyxFcJ6mE
         QXPthxPvDij7pSoKoU/9lSlnDV3EJwdvE+sGfJymlLCN+KazCpo2MWs+L8g/6eXinWf9
         8Fisjv0N3dO2YTvkm5sJfCTvw7GJgYnmuaqW+SMON1ADs/iXXM1KYvxM/++qiJLlRAsY
         DdbIYJVS62XwOpyNrcWs1JlK9FbYXRlPmjreSxubdF5GegdLokdFk5119TM5aLPRx4a8
         nTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714539861; x=1715144661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yrt55+g0BPYJwwh9ZrZLrkqJD55n55fYZs0ENWzSia8=;
        b=HxE4QP8CRFhiDRzdH9Gu3bpVLtyh1JpMq0JpUZUp97/aVSUukDJ/rBHJFIF6JU396a
         kOU/RMETPeBE8kYzxyuuRZTqQ7rXnqvubYfef5KtK2L+AtleWzw3ex/ieuBsSp/WedBD
         WSVxXSCnN6IPfC3p7C8lzn/rJjMYbNha1J4ZEyFuoj9gyi13eXFXvQH9AGgLLze2jeLC
         dxWYyd7HvitSkqQsdDDZIB/NHt+W1SUqBl+fEyJSetoJ7vDbTRo7yreWOjjnnbIio3pj
         tU2OM9g/q/MYRtk1uKB2s3OQpm5qjh+n7InYQILg1kF+0oAv9RI76nCnYN4GoFPLjMS9
         Ptew==
X-Forwarded-Encrypted: i=1; AJvYcCXiaUWDOZNT0ZFrkJoPQGCskyPpiwCq5GnQLU+XgCXDMCdEUo1wD79FDWhJIz0QQRhogLzVDqkA0CPw7UfeRE48qKiXC/u6FbEZUDlRpQ==
X-Gm-Message-State: AOJu0Yycun9F1gNwYxk/Iir+sropCIQ1SS4UUE0/awgp51TIzKp9aQmf
	aJ21/jv7O9eLAO5rSDu8mmWFIsz49pt5IM8q7N4DaTAUls0fVKqG4f7k+VSzOZLNe02FIBUc9tf
	sl8NNfLfpGMf7zCYHrL2wKn054khjSlNhFMS+BxWAXoOUMw+6
X-Google-Smtp-Source: AGHT+IHIVA/ewwNklhTxHX73KWysFOFMQSk+RKOtoaSq2drJFoh2rEEpOwpPR4F02fyGfQRooH84ngMWhzxLI97Pkhc=
X-Received: by 2002:a25:ab06:0:b0:de0:f811:be41 with SMTP id
 u6-20020a25ab06000000b00de0f811be41mr1578538ybi.14.1714539861125; Tue, 30 Apr
 2024 22:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-mark_ethernet_devices_dma_coherent-v2-1-24fbbdc90122@quicinc.com>
 <cbc05a31-3186-00ba-f762-2937c2540401@quicinc.com>
In-Reply-To: <cbc05a31-3186-00ba-f762-2937c2540401@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 May 2024 08:04:10 +0300
Message-ID: <CAA8EJpoAwgLHtDHZe+CD8ZaZX8rTTQy0=MhiF232PqMc+5Zi1A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
To: Trilok Soni <quic_tsoni@quicinc.com>
Cc: Sagar Cheluvegowda <quic_scheluve@quicinc.com>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2024 at 07:58, Trilok Soni <quic_tsoni@quicinc.com> wrote:
>
> On 4/30/2024 8:45 PM, Sagar Cheluvegowda wrote:
> > Ethernet devices are cache coherent, mark it as such in the dtsi.
> > Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> > Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> >
> > Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> > ---
> > Changes in v2:
> > Remove internal change-id from commit message
> > - Link to v1: https://lore.kernel.org/r/20240425-mark_ethernet_devices_dma_coherent-v1-1-ad0755044e26@quicinc.com
>
> I haven't seen this style of keeping the changelog at this place. It should

This is fine, b4 tool inserts it this way. The changelog will be
ignored by the git-am tools.

>
> > ---
>
> ^^^ start here
>
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> --
> ---Trilok Soni
>
>


-- 
With best wishes
Dmitry

