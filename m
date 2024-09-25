Return-Path: <linux-arm-msm+bounces-32447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2D985528
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59CD1F23FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE306156F54;
	Wed, 25 Sep 2024 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQJGgLRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1E158870
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251811; cv=none; b=Az1TBR9+o6GII2FGlVXY1WfwCv0QgtDP0KjWsKoaCQLNZdPnBPaH6aUiVm1hAh/UTnkaevwM/buE2c/McqID3fHlIFILaTr6XPMlgxUOdNvY2lMqFFaxhXk7aCQLVp3qDOF8/TMbS8OewNKn6Ebf8a6XBg0R8sCFIAJ5P+U6eDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251811; c=relaxed/simple;
	bh=sZB9n34CcLPl0nWGOJgnnEBbCgjDELU7h6pclwNEQL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcDtZuaI5KvH0dZjyVpWBWlAyBFAezYMKu7PcGp2cjrU8S56y6m1lL2V7c5l1qi9fkXB6BP2kjs3M7sB6eLpBlgQiJACxhoQjr8yLMmqHs0IQJVEbxL/bFPnRbflB8DMO+8xSQtuXuI9U8clU+z+whvDGPrTHqqYW9BKlYDxBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQJGgLRW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365c060f47so7550483e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251808; x=1727856608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SfkhxXida/JtPWb46vC3Gc6jJkDn6NGPvPLqIzfsxSo=;
        b=fQJGgLRW4OoeWs1wt21MRFoIzMm+Ka4FkmGwPMsaU3It8rS9NELj/RIej2YUEsaBAP
         zyQDfd8k1mBsAYzoonCVbhZidRYOPW1C1Md0axEb7EGu5BEzue/RVxvsLPPhqZDuw768
         SN0awIXGaOWQw6HekxYxa9rb8rUBY1MSqonike1DS//VDKuV9JNwmMBtXOsZb44RVl6C
         12x00ECkki2wmwp1PZ5siyk77FoBCAikGF64u9JFc31KtAfaO3ukGaDJSrmYlFKguFW9
         buJJ9iPmbLa9JTQS0mN8MMedDXK/AMx+zp1aPrWkgVKQstXTgiLTqdKM7IoBmCIe5enW
         nVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251808; x=1727856608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfkhxXida/JtPWb46vC3Gc6jJkDn6NGPvPLqIzfsxSo=;
        b=YRJ5fMHu4q14Rr5WluICL1ZdEBOfmXgti7yXQUIAKGnpIvBz5vnMEEjtmCpK9FPtF+
         4OenhBJheCZTK81Hey5Aje/37iwPQCAga9Cj17hc/grtvDSFu/MmD2a+n9mH8iLGtCIp
         sztrzEfexWxJ0ut5SkJ6eptNID2nm04tLvoDql4KFFeK/p5EPNI1McW1GxJ56syQ0+jv
         W1etCBWsrSRMYwhWjPDlPCHN9GXJa8ANj059uxkY7bUWq4toSt/gyUSWSJNrLYbZ2Zez
         Vvunb3BZ83ZJzXx951usSFcfleV65dON6Rgoi1nf7v2sKPPG2hd4ePbMMkhutOHcFLyn
         +TIw==
X-Forwarded-Encrypted: i=1; AJvYcCVpOXjkGIAFTDhnOZ+SCKJhfiEZqj0rCJMNUyencK5R4wBOg4+lMYwo1niePlzI7kv6K7kMWGISubNipFbC@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhbXyX0JLFRPJWkC+qYjvui+8I1iJ6E/7mXMpT9GWPO0Hv2Y4
	tPOP4ITU3aC5Gbo9j7UAhr7tyC5IvoLQdTeX6zINl85K2c57WBPohONPlfB7mhvks8XG9qKrjpm
	6vm7j1g==
X-Google-Smtp-Source: AGHT+IEkIryks9bO0m+SnMav0JRLez4R3+X6hqtElvaJDmvGZVyqLI3EEhEEL/QFVZHuL0IwsrfB6A==
X-Received: by 2002:a05:6512:1043:b0:533:46cc:a736 with SMTP id 2adb3069b0e04-5387755b712mr1033267e87.37.1727251807861;
        Wed, 25 Sep 2024 01:10:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85ee58fsm451808e87.70.2024.09.25.01.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:10:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:10:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document QCS8300
 bwmon compatibles
Message-ID: <7ld327om75xpz53fb7itxp2i7gjqvhavywzuhmf52myynawwvo@rmb7yimjxxmy>
References: <20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com>

On Wed, Sep 25, 2024 at 03:45:06PM GMT, Jingyi Wang wrote:
> Document QCS8300 BWMONs, which has two BWMONv4 instances for the CPU->LLCC
> path and one BWMONv5 instance for LLCC->DDR path.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index 189f5900ee50..251410aabf38 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,qcm2290-cpu-bwmon
> +              - qcom,qcs8300-cpu-bwmon

In most other cases qcs8300 is being declared with the compat fallback
to sa8775p compat string. Is there any reason why bwmon is different?

>                - qcom,sa8775p-cpu-bwmon
>                - qcom,sc7180-cpu-bwmon
>                - qcom,sc7280-cpu-bwmon
> @@ -40,6 +41,7 @@ properties:
>            - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
>        - items:
>            - enum:
> +              - qcom,qcs8300-llcc-bwmon
>                - qcom,sa8775p-llcc-bwmon
>                - qcom,sc7180-llcc-bwmon
>                - qcom,sc8280xp-llcc-bwmon
> 
> ---
> base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
> change-id: 20240925-qcs8300_bwmon_binding-641d8e4bf376
> 
> Best regards,
> -- 
> Jingyi Wang <quic_jingyw@quicinc.com>
> 

-- 
With best wishes
Dmitry

