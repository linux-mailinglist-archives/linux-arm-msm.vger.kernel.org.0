Return-Path: <linux-arm-msm+bounces-34903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEC9A38A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997962866D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAD018E74E;
	Fri, 18 Oct 2024 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZM/cWlC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E418FC65
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240475; cv=none; b=djKfn2o61EK50USP+qv6iwTlW0d78o8nCxyrfYbNhinbJo5kb2pGr/c0rDvRoNkpJGOsUO/5IgQCaBtmMHx5Oo9iv6lnwQF05Q0pwOYL7GnkKsplo/w1HP/se0LAz+/2rx71a1r2Ll0ZgWLHJBL4PWumQETeFYpainW0MIW6yjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240475; c=relaxed/simple;
	bh=0srgTgPU6O9DCPzxjmpwh7gb3TW5F7IfkOw+rxbUXwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPKtMHx1QT/GeIhOqDQ+hwkGI2n3DA0yOQq/b9Ta4oebGsu8TmGfmvfoAMBBdqoybuxBM9mZsestALxqqa8cIaIS34PLuQvefn6cmJLjuX0FU6pMqHt3HVqT96ckNiXZv8f4bRS2gIO1zpfjT/gY8xno56vRXppRGLKwHOV7apY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZM/cWlC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so20077371fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 01:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729240472; x=1729845272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/E40pYu5N6UUzSC0ykjphENAzLlvZgAB3ZhtJJTml4=;
        b=JZM/cWlCcAUH9pSCDzA0xH7JaMu/ReqEq7VT57BZ35XgrFz8fesaWfzprIvX/7c2vh
         Z3H1UTp/8PPnJ/VE/c3qGaMSe77Ge8LRENGFwzGrtjtwSAQEg1FD0iJjfuyjhJW99/zA
         1BjvhKuwtwsfWmADaIrphkMCuOI+jw5rcNL0RkZx9uHCVTC9jouLA9tr2UEBsAj2L1Mp
         tmmFWw32pl80Xa928eQ5CNE282NlY1hsQP5wYC+LBW2oEXpLNzkB5nFH5YoQ+iZZcSNz
         CWU+Rb7PIdzoGE2mcgfNzklj5gVhFUPebKZ7OExQHpj9gpc4+5WgDwBcg5L6DMZdTesl
         haEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240472; x=1729845272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/E40pYu5N6UUzSC0ykjphENAzLlvZgAB3ZhtJJTml4=;
        b=MoSt5PhKXI7gHuhEHr2hScgqYSGrdC5KLfcKpLy22maTPikAmK4G9MMTNlag1Yxyag
         Np4ru/Wcp+e6X5ry0staHLObNX0EFo2RVg7Np3gHQ3WAcDl7y/w4QvenwAaIF2fZnw03
         tsLV1s+Yicysu+DNWEq28TLYIW5RGBXxUAGcrmgjj1oPdRO8NvJmSz9KaF5OlvPT3OjY
         lDRtKTxaLvBfiw1K0Je/wIqaJ7pg6WlI6YIfEfMazAkn8DuFTK3p9DIL79GyZrAtSAWc
         E1f4RtkB3q/tDUicS+pwzolkdX6sTm1WO4NccgJUJFs24/q1paOxv7IWdtwFspaSTKpA
         fejg==
X-Forwarded-Encrypted: i=1; AJvYcCWb6SErF2zoHOiYSRlJ6X4w2LynYDDoHE02cl+60lDj/ryOeCCVItfEWFDP61EXca9jBwtT1D2xGO90xEBV@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGV2fFRsZk0ztA9Uc/poJoSQpa0jRad/USXp5rVESdCrxOlAx
	tD/a9BirfWQtO6z+Z+b2qZEXznHC26e1s9Dw0uNNCASpq0UFLmaWlRxyeWYNILo=
X-Google-Smtp-Source: AGHT+IEf+JsGSXNlJJL9bn/WcW3dIRijvATttGbycYUvhiOsrdM/RAWzfsgY8sOtZaLsmrksi0/6hQ==
X-Received: by 2002:a2e:e1a:0:b0:2fb:58d1:d9a3 with SMTP id 38308e7fff4ca-2fb82eaadc2mr4804001fa.18.1729240471694;
        Fri, 18 Oct 2024 01:34:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809f99besm1649401fa.83.2024.10.18.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:34:30 -0700 (PDT)
Date: Fri, 18 Oct 2024 11:34:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: clk: qcom,sm8450-gpucc: add SAR2130P
 compatibles
Message-ID: <xlpj3oyk7cyteyfsbfz5uccf7qe3icjcgkpyxmrwmlsibadydi@jyrhah5j3nq4>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-5-f75e740f0a8d@linaro.org>
 <lue5xeab77eqnghpnxrhsezymf3e26ii7kccqlcm4fig57f4ug@sauhknjyrqbn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lue5xeab77eqnghpnxrhsezymf3e26ii7kccqlcm4fig57f4ug@sauhknjyrqbn>

On Fri, Oct 18, 2024 at 09:10:07AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 07:56:55PM +0300, Dmitry Baryshkov wrote:
> > From: Konrad Dybcio <konradybcio@kernel.org>
> > 
> > Expand qcom,sm8450-gpucc bindings to include SAR2130P.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Mismatched SoB and from.

Interesting enough, Git history contains correct From, which is then
being manipulated by the .mailmap. SoB isn't. How should I proceed?

-- 
With best wishes
Dmitry

