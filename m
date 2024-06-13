Return-Path: <linux-arm-msm+bounces-22567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9309069BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C8D1C203B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3C114198A;
	Thu, 13 Jun 2024 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gKih+lwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48131411DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273602; cv=none; b=rUQwCGIvgZT5KkdIqUJGSN5dsbpmjVYjGpsWJdXv8eC2YPcgid07bd2Wb8TaIX5V+Iz59bR6jin+M0S1ErO8QDU+2WExN8ltZQqlAaI5WsbPviv/LR1VKuYR4MEin1e36BWzk6eOHmpfbdTRMJJZdlO7ddo8UL4rH/xwh9Ru6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273602; c=relaxed/simple;
	bh=Jig0VbrF7vcRqgAzrjYh7+MqNViArZUDt8CaUtGL04U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLJ1fEm23xZYNFnNnUw9fk7v0fVjejB4MbNNBJ/RXVGoCn3qBCZB2Wj38m6Av4mDMRwAO/sk+F7ReCr+/nfIoJaQTpdMeR28lfmSnmcRqYODIj97ZqWpP0TFTdK9GUev9Q51A6T3WDApcVH7ELOsFP5ZVKOe3T8uOaxCPyOjZao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gKih+lwo; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso7291821fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718273598; x=1718878398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UhTMrFvQBB8mfMQ4c+fd/Ifc6ucfhQNCFOCAgSgYQ0=;
        b=gKih+lwoYe9CzToEpk6oH9NrrUIyfwappEyPRKqMBA/OKcv9PKzVKTqm1/W0knRbc8
         LXZITLVa+HnJ25bW6hBqculEPpwfSEaF0ig/UDIlwpLqEkrqPJnhlRKwMmbv47dA9JbR
         On/5HFPo5lh+DIFdwmZA+GacbDcpmw4Ldx4AnpZoVeAAt+v3Ty3aMqPHeGkYDoJ/ADqj
         7asCTFBVGLiYQnC+ilLg/qKortdgde3LoyPkM0fKQ+z87wFAAHQuU3sGE+mmCyQTV7YF
         qgrrvnmlWIOvwxFAp/nzUd1OoDKXXUYOB+/XuKnMyvXLZM8YCbTAO4ribRiGH051sUK2
         sjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273598; x=1718878398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UhTMrFvQBB8mfMQ4c+fd/Ifc6ucfhQNCFOCAgSgYQ0=;
        b=i8bzK0RDuW0Xumi3lvPeLbquM5DZgvvevAScPogsHFOvfA0ur3g9ZYROk8er38/kzl
         jiHdcs5131ejhHnZZDiesKcze9VJn3yqRNh+9qDnyZqBAHaNyo045e+l6eOsfIfXbCyf
         esB7YNQYVjbEqYs3WWZqS7WvmqSTbZ05F4zJq8EKQCZHwoOHHJvc5MAZ+JifT53Eyg7A
         gLIORr+NUbiaLP6Fznw+NmVnB5G2xH01FOiBrzauHNksJZEdFJVLDkOsWbtob0rxOXIU
         BIsdCo6O697tfnte6BO0Hhevl/JzZjx+MhjhaMGXJYHCXHFXyP9Fg/oHWyfMmv8jYJk+
         OjqA==
X-Forwarded-Encrypted: i=1; AJvYcCUH523NlfxdFMKQ7DJZqlvpmo9/IPWOCR+LSjCCR0Q13Gn6FUyz1gJUzaFvz0U8MHTf3UIscb4V81gWYl8gItYgL33cGNMNWEl2LDBMtQ==
X-Gm-Message-State: AOJu0Yx/8ZLzgCbnhwKKep1gZeU5EtqCbRBKH7YmLDWvhQdU0KhSJZ2h
	wmFr6Kawqe4gBx/ewmrsgwWLGSfsygMskKiDV8/GOA70ZJbxK0vomcOxhX7XLY8=
X-Google-Smtp-Source: AGHT+IEqZFp6DfPOGQtW9vNfCAckczSMPw7RWxGa/vCjp53axsK6Fln9qoOgp1dvliTR80CJljmHPQ==
X-Received: by 2002:a2e:88d2:0:b0:2e2:2791:9842 with SMTP id 38308e7fff4ca-2ebfc9aa3dbmr23103601fa.44.1718273598106;
        Thu, 13 Jun 2024 03:13:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c9ac5bsm1561941fa.134.2024.06.13.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:13:17 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:13:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_rmccann@quicinc.com, konrad.dybcio@linaro.org, neil.armstrong@linaro.org, 
	jonathan@marek.ca, swboyd@chromium.org, quic_khsieh@quicinc.com, 
	quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: display/msm: Add SM7150 DPU
Message-ID: <4xqa6u3jh6z7zdfaamxl3jpucfymznxmd3ezhihgfky62iifkc@bdslrxujahxc>
References: <20240612184336.11794-1-danila@jiaxyga.com>
 <20240612184336.11794-4-danila@jiaxyga.com>
 <0e7bd7f2-b445-4a59-b456-8d03af121a8e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7bd7f2-b445-4a59-b456-8d03af121a8e@kernel.org>

On Thu, Jun 13, 2024 at 11:23:50AM +0200, Krzysztof Kozlowski wrote:
> On 12/06/2024 20:43, Danila Tikhonov wrote:
> > Document the DPU hardware found on the Qualcomm SM7150 platform.
> 
> In general, this should be before MDSS, because it defines fully the
> compatibles already used in the MDSS schema. For multi-binding devices
> it always starts with children and ends with parent/top schema.
> 
> > 
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > ---
> >  .../bindings/display/msm/qcom,sm7150-dpu.yaml | 143 ++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> > new file mode 100644
> > index 0000000000000..1a44cad131a72
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> > @@ -0,0 +1,143 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-dpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM7150 Display DPU
> 
> What is DPU? Such acronyms should be explained in description or
> expanded here, if there is space.

Other bindings here use 'DPU', so probably we need to fix all of them at
the same time.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> > +
> > +maintainers:
> > +  - Danila Tikhonov <danila@jiaxyga.com>
> > +
> > +$ref: /schemas/display/msm/dpu-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm7150-dpu
> > +
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

