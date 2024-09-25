Return-Path: <linux-arm-msm+bounces-32489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D82C98608D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 16:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2211C266DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0C01AC8AC;
	Wed, 25 Sep 2024 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPUlUVSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08781AC89E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727269779; cv=none; b=EU4KBIuG/T/V2jyR9c2XhaYbsrZ5jPBiHlz8+CdKcjd5K94E+hKqM8gz1nTDCu/2qkDLQNRE2HGWDsiGlXmc1CcgFP421UZ0WPkFHO1aPEzwgb2SklBKeCr70pCyjyeYGpdkfaXnXV82eZM8TgORH+vxOR44CODXdWPYugsOcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727269779; c=relaxed/simple;
	bh=400VLpJnX0L0xiQATbyMSk/SgyweDznJoN7IlOnXi9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew6MGfSqDn8FHMsWYen+6e2debRIoNzwb3YFWjSGvgLRuJt7HPkzKNvRZSitm7jtxUPl4SAjSm5MEwqdiLbgmsd1TkdscJSEn1HTgTjwAOLhW+EBDvbJxsoAN4HxXVUeOz5Fwde/xHUQ6cjExc9cem0ssKdnuVrM7oaSz3MJ+X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPUlUVSM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-536748c7e9aso1366180e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727269776; x=1727874576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+CnqVG7Ol3vAZLpol6YfXDCc1Ev7Iif7KCFWReCBmE=;
        b=cPUlUVSMn9b5POjZWuIw0gxnB7AvsCKKyyjFAjtvM5qEqtQQFDBo/CY6Ni7rKvVTym
         asqYZLPu6rc18pHbFp5DHHAOrVEIRiF0JDliXxLrH2Z8iKofJFnmTyk2103ywCQHR0Ev
         aVTwAlFHAgwguyMSN6+MnfzSeRRYgNW/QO7s/DOnBwueBEBPqQuJ0G/m45RwiUImEQqM
         cIVnxhnYFiGpk5Du4S1MEvKmzfXyxb91UT0KK2SN51gTAyjFUPUBSHIBJY2Xfk29gkk5
         9SUXhR8bYm4GTY6oH0kxSXm70mz+zx1n0ttso2+LEM/OM4swNAsRJTPzir4c/nHGG2w5
         j/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727269776; x=1727874576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+CnqVG7Ol3vAZLpol6YfXDCc1Ev7Iif7KCFWReCBmE=;
        b=F6B3zXYqYRT5zYQUtsFMtpmf85LSW8ln2N3AdOiikCewWa6AaFJ8aPwUvB6rJ8+f2w
         EQwevEgBCxbyMSWwrR9ToInmc/7bsEdfffNU+Jaz3vW7eVWhx5uf3GLvw+MQxG8l6lsG
         2lJpqk+7MXKm3uip+sNcsexgR0UR4Mx04wreKTrkWCHzwF1ukFgngAYboKLlWQpPH33H
         Myq68F7Hk3y+hg9ZdtAhJif1tRctTmVkF7NkoTaU5+ZLFFkDwA269p6rUT89PXZWrfTN
         BLlwmAahhcYRK2O2xKzUj617P0RyvV6o18NaclBbSiuxYZTsdc7xd+ehJIN18EL7333T
         cuQw==
X-Forwarded-Encrypted: i=1; AJvYcCWPSISpmGgqMCQuRbAF0yTKGGY3iNVQjNy7NePgyJ80lIV+ebsFvsqD2FaPKjT7Uq/CRPHUB6i4G3SQG/Tp@vger.kernel.org
X-Gm-Message-State: AOJu0YzDAmWMZ8mA5OkmNmc0impVA/PxYLmC1R/p7IKOgJuyIr6DoRR0
	jAD8wZyTxGU4np6pMh1j/Cp+oBoDYHtbFCUdKsrqFRYNY4Rv2QnTYElGIVp5z20=
X-Google-Smtp-Source: AGHT+IGinEuA7fG0XrYD7Gh+x6rhKbNFQASd37I1jxJgo4yxPpmtKwWyhB3+miirGI+5mAPiWag2Kg==
X-Received: by 2002:a05:6512:b01:b0:530:ae22:a6f0 with SMTP id 2adb3069b0e04-53873455f14mr1764608e87.5.1727269775663;
        Wed, 25 Sep 2024 06:09:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e12d0sm528981e87.12.2024.09.25.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:09:34 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:09:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document QCS8300
 bwmon compatibles
Message-ID: <heemxrecy7hushqeebml3kavxby5jevlcisbpeggymb5a3n4ho@6gzucpr67h5e>
References: <20240925-qcs8300_bwmon_binding-v1-1-a7bfd94b2854@quicinc.com>
 <7ld327om75xpz53fb7itxp2i7gjqvhavywzuhmf52myynawwvo@rmb7yimjxxmy>
 <56b3ca36-e7b8-480f-99b8-c624acba8d65@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56b3ca36-e7b8-480f-99b8-c624acba8d65@quicinc.com>

On Wed, Sep 25, 2024 at 04:40:20PM GMT, Jingyi Wang wrote:
> 
> 
> On 9/25/2024 4:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 03:45:06PM GMT, Jingyi Wang wrote:
> >> Document QCS8300 BWMONs, which has two BWMONv4 instances for the CPU->LLCC
> >> path and one BWMONv5 instance for LLCC->DDR path.
> >>
> >> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> index 189f5900ee50..251410aabf38 100644
> >> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> >> @@ -26,6 +26,7 @@ properties:
> >>        - items:
> >>            - enum:
> >>                - qcom,qcm2290-cpu-bwmon
> >> +              - qcom,qcs8300-cpu-bwmon
> > 
> > In most other cases qcs8300 is being declared with the compat fallback
> > to sa8775p compat string. Is there any reason why bwmon is different?
> > 
> All the *cpu-bwmon are fallback to "qcom,sdm845-bwmon", so we add "qcom,qcs8300-cpu-bwmon"
> compatible and fallback to that.

Ack, thanks for the explanation.

> >>                - qcom,sa8775p-cpu-bwmon
> >>                - qcom,sc7180-cpu-bwmon
> >>                - qcom,sc7280-cpu-bwmon
> >> @@ -40,6 +41,7 @@ properties:
> >>            - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
> >>        - items:
> >>            - enum:
> >> +              - qcom,qcs8300-llcc-bwmon
> >>                - qcom,sa8775p-llcc-bwmon
> >>                - qcom,sc7180-llcc-bwmon
> >>                - qcom,sc8280xp-llcc-bwmon
> >>
> >> ---
> >> base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
> >> change-id: 20240925-qcs8300_bwmon_binding-641d8e4bf376
> >>
> >> Best regards,
> >> -- 
> >> Jingyi Wang <quic_jingyw@quicinc.com>
> >>
> > 
> Thanks,
> Jingyi
> 

-- 
With best wishes
Dmitry

