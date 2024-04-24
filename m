Return-Path: <linux-arm-msm+bounces-18509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B398B1754
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 01:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7DB21F24961
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 23:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65AF16F26B;
	Wed, 24 Apr 2024 23:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gAc/Ji1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC784156993
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 23:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714002133; cv=none; b=bkojcTibto9GbgnalZVmeKNOHOJZMtLVzVkVJjR2+GnvLwmQDi7RjSD3zecJbivFle4glUiLlf+xazbkr8qc2j6Sj+U1U777HNQnUUIGWmGbjqa5eLulZEy9S5C6/W033yUir3PVQMk+tZU1uqIEZ9WnS4rfPRBDNIqM8De126I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714002133; c=relaxed/simple;
	bh=PI+JeQg21yVOePuaS0Iw7b/7W79QBq8ROcxLJNdsIlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I38fEbBJW2hFa6ejCYENmelHzOMqLe9iBK1Bj19m27BJKQEjuvJy7jyhfrWEvokDovOzCMIXWHZ28neRCJNXWT0nqtnrH7x47/J/mJBewPp4swYzyj5qVjvpjFqSE9uwXtcC6s7/m6p972VyrU6CPny1i86rwh/HqALl2IWN/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gAc/Ji1T; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de5809cd7b0so510473276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 16:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714002130; x=1714606930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3di6KRuk2RHSbdtvrUmozSSvs5i2WcfXE6+Fo0L3m8=;
        b=gAc/Ji1TR7JadObuMUESXqzZx/R9pYFyDyHNTd3em+uf9PVzR/EhWXaR+C6yX3+ev5
         gSuJZIItZu0pVHWHtY+5Jylrye3ORAuWPBv7Djlv/ph3ATrmlbDrxeL5drmtg7o+WsKT
         4zkcd/oeWIQqmLx+bDlrwdpQF2f7of78zwPnB/VwMa5eiGs0YJEIJ8rrhc+/9SS0dbFc
         rMHL2hhzI+9JjqmHid4TLreic+X9VG8Dfv6hMUxcPXeg7rCRHIf51f3mS8WRJxrdzgqF
         e+RO64ncTpeK8SjJ8O8zKcvChhV/PvYOHZJsfiD6x9Gd48sd/Nw7OfoUqU7TGUYPTUXb
         M5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714002130; x=1714606930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3di6KRuk2RHSbdtvrUmozSSvs5i2WcfXE6+Fo0L3m8=;
        b=PuHtgB1czpsmOM4HTINFFuNqjK7RugxGJ4m0zbVCIZT8lRkauNNIfex4CuMbCUQTfc
         8sRW6RcmOc5i9Xty5JiwqwzjvKD/9bjse1K29ZLTnhlW+9PUzQ3PBOF80LHLZ5DoM7OC
         a4mS9jJOjnYOZvonp88t/RZHgBIS1peIHJV7JAxIiHl39DN4SGpEtHIo8ok0Ot53YA94
         2pyo3xrwaH0AWe+YPuKYRcBnBgsC6uYSRg43NTDwUMsnpe+ubfDKYL/HB+wOKjirYSJP
         AK/gh7q2G0ku3mIyo5PegsYo3GjPhdNPn9VXl8J2z+20atn3XBo1Brtp+ZFYc7HEyWLD
         Mmiw==
X-Forwarded-Encrypted: i=1; AJvYcCXu9mrY9q0xo7UkHpvtZDnW0Nn0DmGiEDUUcQf+inSLnw7ijEwWtzL+YD+pN8EbnyAwQ5XCiHoWwVnHYTE3mRCJtR3XXWDk0u6rgTXSwQ==
X-Gm-Message-State: AOJu0Yx0hvqCMaCYP/GKM/KSBRwdetd0uJOLl1mVcujKA65ICjuRHeMy
	O/JmErE1nOY/qt23dRylRjWPCVP1ZRPjKLnjkY+hhwU/Yrm86nsVuKB9mGq7Qnc/7Yift+7nspI
	VDNPBRJ5wTA6lUclc8xHopMcr8ySr+cVQg0uhSQ==
X-Google-Smtp-Source: AGHT+IFNoEoWuTCW+J4r60ygLSWMpFSH9Zo3V9Aq2hPRxkt1QB/fN+kZPsxejKNUHrSBHusjPdMi8tBWqcJwR5uPFYI=
X-Received: by 2002:a05:6902:526:b0:dc6:ff12:13d7 with SMTP id
 y6-20020a056902052600b00dc6ff1213d7mr3280481ybs.60.1714002129912; Wed, 24 Apr
 2024 16:42:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424101503.635364-1-quic_tengfan@quicinc.com> <20240424101503.635364-3-quic_tengfan@quicinc.com>
In-Reply-To: <20240424101503.635364-3-quic_tengfan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Apr 2024 02:41:59 +0300
Message-ID: <CAA8EJpqGub3LuFPbwcA-MTYN2kY=94YXe=T3-mewYzxgcF-ZMQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm4450: Add cpufreq support
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, manivannan.sadhasivam@linaro.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 13:16, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>
> Add a description of a SM4450 cpufreq-epss controller and references to
> it from CPU nodes.
>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

With the next patch being squashed in:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

