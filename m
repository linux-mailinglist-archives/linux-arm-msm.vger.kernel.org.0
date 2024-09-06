Return-Path: <linux-arm-msm+bounces-31043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5996E818
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 05:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59C49B228EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 03:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C6918B04;
	Fri,  6 Sep 2024 03:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7LN+1Lu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D21EB35
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725592718; cv=none; b=rv15lxEt3in967be2OoHy1rsVy5FKkr0nQ0WrMaKv0ospf2xrHpiECrgSxiJOI2Nh86NG+o0CkRIC4mmuuz2PNzrg0VCMnCTpgc/EA9/Y4tvOZYHvWnHjYVXarve/2gw2PQR9wGWjC1tMI3Ya9QQof8VmcqbTWRBnaTODGLgs7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725592718; c=relaxed/simple;
	bh=Ifixl/lUYJadk0T5vvio2ek8q8koCwCnm7N/KSfhcWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3cpsNJ1OApOO8NHm43lAy24qrKsqYMUwcz8G+fmjuDhuqYBly1rwd+roaOYbhVB/LEqrw7KJjSM6nFa/86R6pDAq7Q/lC6k/hCR0ddM0yYK0uN96jvduJGwKwii1EIA0L5M30uHrOeucDh0SVgz9C8ioWM808wto8Vv0CqtkP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7LN+1Lu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5356bb55224so1815312e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725592715; x=1726197515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pDvRjyy1T5DsSdRtv+m8fD20ZSlRWWhrpdZb23KAVTk=;
        b=P7LN+1LuWxSCizcaLFZBvaqG4CIGEkJ1Z6AyiIHH4h8Nv2ToHYkgKlAp5LSEcggN/h
         2rglfzlb+fpFiBUkWaDBmvRcV5N5CRj2pjkK6J/zQM3NjqzvDIYSJCkB1VWbH7m9OqkI
         Bwxsxq9sC0sFvNmcg36ROQaB0fMPbVS9mHWL/La7vQ1ABIbysBppagYhuLULAHwp9Ez5
         L8sSvgqkfpSGa27AGeTC+mVWK96G1O4uF80cK8O3cOWxYgzo/nRgc7fuqg36ethJvj1S
         LrHNefRWwDKU6VtQXy6VKDgm9XTeCoGkg5CSUNM57e2l3Xx6JxP4+XtkvgrKqz4dWyDB
         1a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725592715; x=1726197515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDvRjyy1T5DsSdRtv+m8fD20ZSlRWWhrpdZb23KAVTk=;
        b=CO0/hfK9KlZhHEUQZ56gPJ5Bd1MYPciwHo54+7AUm/OhhLp+02LD6xvMiL42tg0ZSB
         bm4pEOaoxAp0i2zaagw9epak5G4LDcqUBbc+jTeTwVCm2iIrYymUjI481FPs92QU5tWN
         cKzAcA2yCrOO5anFAnmX1X0eMYHJsJHgRGwKbIZC8ufdm5jkwekEv7y+RwPlXQ6dcsc9
         M0cgbseG+qJiYzSwLLdgp3UeXeHgBQTZbDc7HumFtDHoTs6TboVY0433x/NUJJ+Pqd9K
         5YxF517opvQx7T9xMudC80jONnDq5DJySX57m2id0DGQSL0XiGZjXMceq+qc3H7d0UMk
         BNrg==
X-Forwarded-Encrypted: i=1; AJvYcCVgMLbYUR9r7XT8cbb0awL/WguuL9XlUpus61lsQvmKC6qTf0nRDKUyN7LN+jiNDxYP4IoOKPioW9keBuuE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pJCyfo4sFnKTRLJI8cDRiI2hyR9DPGhs0eHax3gkBZtXWayT
	itK1Qm+F+Y99F8uvnYyCu+xtoWv9sxd48IkzNJnPQedU4FWKnOmfYXBLihPad8g=
X-Google-Smtp-Source: AGHT+IGzhFXkem2JdXn1T6zzrKRCxyCynxhuA83gNnU2hU8RzpvNhtruuel61+ka1mwQI60PiIL/5g==
X-Received: by 2002:a05:6512:3503:b0:530:daeb:c1d4 with SMTP id 2adb3069b0e04-536587a55d3mr510319e87.12.1725592714492;
        Thu, 05 Sep 2024 20:18:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356a354961sm479217e87.8.2024.09.05.20.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 20:18:34 -0700 (PDT)
Date: Fri, 6 Sep 2024 06:18:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 17/19] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
Message-ID: <wzjv6xvthoz3z4fimxfc6gzm6ptepkuwlzjm6xy3klmtpr3bvf@k7yxdc7hryju>
References: <20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com>
 <20240904-qcs8300_initial_dtsi-v1-17-d0ea9afdc007@quicinc.com>
 <851566fe-4802-41c7-bb35-d6d1e9cf9bdf@kernel.org>
 <d5b13f14-ce66-496c-8182-aad840e0d5cb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b13f14-ce66-496c-8182-aad840e0d5cb@quicinc.com>

On Thu, Sep 05, 2024 at 12:54:35PM GMT, Jingyi Wang wrote:
> 
> 
> On 9/4/2024 5:39 PM, Krzysztof Kozlowski wrote:
> > On 04/09/2024 10:33, Jingyi Wang wrote:
> >> Enable clock controller, interrconnect and pinctrl for QCS8300.
> > 
> > NXP QCS8300? What is QCS8300? Which products use it? That's a defconfig
> > for entire kernel, not your Qualcomm one.
> > 
> Will describe it in more detail.
> >> It needs to be built-in for UART to provide a console.
> >>
> >> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> >> ---
> >>  arch/arm64/configs/defconfig | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> >> index 81ca46e3ab4b..a9ba6b25a0ed 100644
> >> --- a/arch/arm64/configs/defconfig
> >> +++ b/arch/arm64/configs/defconfig
> >> @@ -606,6 +606,7 @@ CONFIG_PINCTRL_MSM8996=y
> >>  CONFIG_PINCTRL_MSM8998=y
> >>  CONFIG_PINCTRL_QCM2290=y
> >>  CONFIG_PINCTRL_QCS404=y
> >> +CONFIG_PINCTRL_QCS8300=y
> >>  CONFIG_PINCTRL_QDF2XXX=y
> >>  CONFIG_PINCTRL_QDU1000=y
> >>  CONFIG_PINCTRL_SA8775P=y
> >> @@ -1317,6 +1318,7 @@ CONFIG_MSM_MMCC_8998=m
> >>  CONFIG_QCM_GCC_2290=y
> >>  CONFIG_QCM_DISPCC_2290=m
> >>  CONFIG_QCS_GCC_404=y
> >> +CONFIG_QCS_GCC_8300=y
> >>  CONFIG_QDU_GCC_1000=y
> >>  CONFIG_SC_CAMCC_8280XP=m
> >>  CONFIG_SC_DISPCC_7280=m
> >> @@ -1618,6 +1620,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
> >>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> >>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> >>  CONFIG_INTERCONNECT_QCOM_QCS404=m
> >> +CONFIG_INTERCONNECT_QCOM_QCS8300=y
> > 
> > Why this cannot be a module?
> > 
> > 
> I think the commit-msg "It needs to be built-in for UART to provide a console." can
> explain that, could you please help to share your insights on that?

Unless loading these modules from initramfs doesn't work, please use =m.
The drivers that are enabled here are going to be enabled for everybody
using arm64 defconfig, taking up memory on their platforms, etc.

-- 
With best wishes
Dmitry

