Return-Path: <linux-arm-msm+bounces-22831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96590AA3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E17C72848B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C163195962;
	Mon, 17 Jun 2024 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkQbIRKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9C1953BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617440; cv=none; b=LkgDD9fN74MSrIUY2R73kN9+vx/Bb8jCez5kuzUux8fCLxBNgImnzSaxrlVKS0vyRDHJiNZHl228cI/+0rEE17dtKXwch4Iub9XrgTk/lZFlXFMwKZ7ulXAQn9mNkcHfTV38I710WWs/myr5DPr1fHQmiA62mUcDiJJTC/lnAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617440; c=relaxed/simple;
	bh=AVM91SFjOeJ4EGJwdJF//dJ0wQhrEY8K0R6MrRTgXNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAiaMXw4VlX5vWFbqPhJEMlR/QTcwLC4Fx7gb2rjjPS3AwoQ+RT6nirV17kROcMaR1/J0FdAHaKvPktroe1TE2xvPPxKm6sC9yKmlfiZ9Ezyod1GWuPud1P4tQXKHEBctug26ePWu9X7Q8wzyN5OXuoIreFCqz3gUjB5HCY/gJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dkQbIRKV; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe3bac675so37848421fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718617436; x=1719222236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qyV5BhT+hOakoBNP7VkHyuuQ8+FmrIcBOKbyWvL0zk=;
        b=dkQbIRKVtICmLyeBDhbRP8iA3bdg9Tgc03Tb1bKmyCDYPq2xAIAB9P2dEkSLKGN1zW
         5SxI4GENtopPvhgTcRmrLt0lJISGWA5Hk5vvXTOA7OZu14a9YXmxTHTZ9BUj0p3pXFbP
         EglPFCncl43MbFgBucnx+X0QwBpfUPpUMzMocKHWWGRc+cGNWIyiyNFkugTZP1B0nh/8
         N2TazHZsb8DVpc1DBuhHEkpipWFzsB5/jRehPD1fjE0buX5OjES/OAT7LevYPCBEZESj
         shYIbyZnApClONUM0busq3YygLQinAqT4PrvcwZqniubkHSCtWdf0KihRtAAyizl9pRP
         P7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617436; x=1719222236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qyV5BhT+hOakoBNP7VkHyuuQ8+FmrIcBOKbyWvL0zk=;
        b=Dlre0O2/xFeSD46vj1/l44CRItx6cCU7aTvPBvohwgWuKxogiTgbtuQVIfqwA2n/K6
         FJjzzadQt6umRbzx6Rk5dGjaSGC+1On0SFL2XUcIOta7XZpcSxIjv+X1SJIwhF9T243q
         f8VSMIOwWhZSizjmsmKWormyIDt1JsAMrV9klY2orEl9sWHREmx4FKROVUK0Wx8b7yPz
         RJ/awmbz5FgesPM/T0Ul8IdAlGZucXAdCQnenOW3mkVOjuLtZ0LLN2TJDBrfyMTGXF75
         MSgRYawO4jLQ9uLmgWQPSS+qTfM+YLuCk1j8i/V3tk+97KPSuAG1lMk+H9/9vNk+OKNN
         RUGA==
X-Forwarded-Encrypted: i=1; AJvYcCXLnmo01eJ+ZHSECSxj0I53wFfMBgtdUTybVOh0+5TXiYnxQHpeIeIi24yTyrppz4+Dx+0Scpm5T0M3gP8iCIJ7JiIqA7Tbz4XEeGDaHg==
X-Gm-Message-State: AOJu0YwP7ANL/QEbm+iOznhhmrevL0MBQ7EqpHKFcOsqZ6k4/J6nLywo
	K4gKYvkVtZf51rpiEe592hBOplizNVBw+0+E04d6htNJadm1GMNSVyJatC8khqA=
X-Google-Smtp-Source: AGHT+IEumQAyN+NZWW67TMH9LyQluGdcRlBDdjBbMCwrlGr6EisNhuKiAvNKwlD27RooS6SV7iqrbA==
X-Received: by 2002:a2e:b794:0:b0:2ec:254d:4fdd with SMTP id 38308e7fff4ca-2ec254d5052mr13784491fa.15.1718617436480;
        Mon, 17 Jun 2024 02:43:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c16f00sm12903251fa.61.2024.06.17.02.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:43:56 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: krzysztof.kozlowski@linaro.org, djakov@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [RFC PATCH 0/2] arm64: qcom: Add BWMON support for SA8775p
Message-ID: <yb3ni6o22zdm2lqodj7utdb2dlg3jkbwzutxhmljxle3syoe5y@op2prslmri4y>
References: <20240617092940.1724962-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617092940.1724962-1-quic_tengfan@quicinc.com>

On Mon, Jun 17, 2024 at 05:29:38PM GMT, Tengfei Fan wrote:
> Add CPU and LLCC BWMON nodes and their corresponding OPP tables for
> SA8775p SoC.

This series is marked as RFC, Request For Comments. What kind of
comments are expected for the series?

> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> 
> This patch series depends on patch series:
> "[PATCH 2/4] soc: qcom: icc-bwmon: Allow for interrupts to be shared across instances"
> https://lore.kernel.org/lkml/20240604011157.2358019-3-quic_sibis@quicinc.com/
> 
> Tengfei Fan (2):
>   dt-bindings: interconnect: qcom-bwmon: Document SA8775p bwmon
>     compatibles
>   arm64: dts: qcom: sa8775p: Add CPU and LLCC BWMON
> 
>  .../interconnect/qcom,msm8998-bwmon.yaml      |   2 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 115 ++++++++++++++++++
>  2 files changed, 117 insertions(+)
> 
> 
> base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

