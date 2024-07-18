Return-Path: <linux-arm-msm+bounces-26560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AD934D60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B88CCB22EC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 12:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07759135A79;
	Thu, 18 Jul 2024 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSpR1CVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC113AA26
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721306759; cv=none; b=JKkEsXcwHs3T0Qedq+VLhSULr1IyY+KX14eOBFOnAREDGvDEtMEKvyNg4I+75Neybbxnk9Gha9fYegGGu1zJhfVm7uLmly9f7AJobjCPsm8ZWdwHEhoTiqsWRC3m7tpbkyABlNOJSe18Q0YQeT2X7yGJvD0oSOHstu0rlDHipwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721306759; c=relaxed/simple;
	bh=9EkC4Y5reZOqGEwXo/XAYzvN7EsXW/1Qn73Ue5CWPCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOupPRJNtuObtbi8Bn7BlAxyfVaBQA1JDwJ6tW7k0hDGQryWDudr9HYZlW4jyeWrTSD6oVHMwPkyhPEzXVVljssrlKAT8zyV2y63DslOT0Cdk7JK6o+2c26OXpQH26Mi5KaNZb/GbOabRDSOfiw+iHXRvsfBFllx5I0zD7xmG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSpR1CVz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36798ea618bso446988f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721306757; x=1721911557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MdmnyZnfUhA2Ic4iucAkOeo7YUGK4QOuvHImS1K8o8=;
        b=bSpR1CVz1xIfgkxZ0HcGTS3E1hhjTGwYXBXNxNUhBwjhd/toU1eEdQefSh5gwIMdNI
         PDopZYzVTUbHwMnSY9otyr0NAZ1Mi+XHyQK2gGHg4dQqglKEEJb/14fHYswmsfHFOCAt
         U8Wah+mO3m6ndvasihdqWf/Ioeyw7QLnkUpJjpqMGye4ONEaLRnyoUkwptzvqQ+lzwzN
         N/5oYgfOCyp7p3+qStyvMTLNYTqzK2JPQAOxbMM5nqAE0jl4nMWAqJZRuXa203SXcnpp
         YK7+AR7//2bsR+yjypakrKfZOYaKOUzgCk4guOYOMiMlfEMt92NhNpUjo1nQz8Emwb7c
         AKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306757; x=1721911557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MdmnyZnfUhA2Ic4iucAkOeo7YUGK4QOuvHImS1K8o8=;
        b=vgneCm7jsn2M8H7wooqS+3gNOFX1aj3GEius6lLDUrXPRsJhYRDcXRk96LnrzEfdPK
         c0GuNt3igv5gLzs5AlOE076OC8B9XehPdbO3XQJEruVvZO2+eZ/Duf/398JNAgcGF2sv
         aPfji4ohZ2lj867ESM8Et/sCIlIusjcU+IA4hVnjStWkxmrSmQ71/lf/tq68S5NOgR4t
         QBipdqgB2nHT+Vkp3dnYsBgrFiRtn+fZYEqav7UhscmHAx53BH/jvonFWypI6DoAwAFw
         dTHODoO4KM0JxEvLlGK7OVh1EY/pkrtMkFGKs2BcJynpi4L241Hf4vHpBEkBp1/oLMJn
         pbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaE2N7PWElK4ddorPZeOleBr7wl7gPkY6LQA+X6LlVeKM8ApHiR5XlQeI+QH4DBXkqsmeQeUbZyjt3h886MyeXmP+EQosrwYGvby+lIg==
X-Gm-Message-State: AOJu0Yzuv+cxuNtM45MtTVhNYl2CpkPD42Kr0+ixHZhlMCXGbH+aJToV
	GrehP9WvGV2N4fZ/TB5XPa0evf2OQNK4RMVeuxrHj2bwzqHCak4iU0FWO91hiwA=
X-Google-Smtp-Source: AGHT+IGpdpSlqF0FcyNm8OlJ/OzhdT5JYlmAnK+2NFyNfELonQ9MBQznw2VdGOJxj+w1ctbPhUh5tg==
X-Received: by 2002:adf:e6c4:0:b0:35f:208e:6172 with SMTP id ffacd0b85a97d-3683164d06amr3417658f8f.27.1721306756745;
        Thu, 18 Jul 2024 05:45:56 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3685834365asm1432209f8f.64.2024.07.18.05.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 05:45:56 -0700 (PDT)
Date: Thu, 18 Jul 2024 15:45:54 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add Broadcast_AND region in
 LLCC block
Message-ID: <ZpkOgpGCKp/w13la@linaro.org>
References: <20240718-x1e80100-dts-llcc-add-broadcastand_region-v1-1-20b6edf4557e@linaro.org>
 <39df7ff4-7f22-4715-a0f7-eb2475bd7b55@linaro.org>
 <Zpj8cWfcqYj8rUOP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zpj8cWfcqYj8rUOP@hovoldconsulting.com>

On 24-07-18 13:28:49, Johan Hovold wrote:
> On Thu, Jul 18, 2024 at 01:20:37PM +0200, Konrad Dybcio wrote:
> > On 18.07.2024 12:20 PM, Abel Vesa wrote:
> > > Add missing Broadcast_AND region to the LLCC block for x1e80100,
> > > as the LLCC version on this platform is 4.1 and it provides the region.
> > > 
> > > This also fixes the following error caused by the missing region:
> > > 
> > > [    3.797768] qcom-llcc 25000000.system-cache-controller: error -EINVAL: invalid resource (null)
> 
> Please say something about this error only showing up in linux-next,
> which has 055afc34fd21 ("soc: qcom: llcc: Add regmap for Broadcast_AND region"
> region")).

Hm, now that I think of it, maybe I should drop the fixes tag
altogether, as it fits more into the "new support" category strictly
because of that commit you mentioned.

> 
> > > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > 
> > Please fix the commit title
> 
> And that.

Yep. Will do.

> 
> Johan

