Return-Path: <linux-arm-msm+bounces-39196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB2F9D96E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 13:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BA49281D82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D434194AE2;
	Tue, 26 Nov 2024 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OH7OIXRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF583A17
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732622458; cv=none; b=ejN8OO2P5cvi3blqHyIPzc7YYir/1MgX0uxcZM1UHKDoH6YLEvI+NeoxW0+kb8969oBqqrT2KHL44SdhWIuxHMK4x7joU+RIy4TTIXLCWgI7vI1WLpVZpHLP+eur0UeiwAW74bF/wv5dxplpY+VLngLRq+bZyJDa62FrwGWxFCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732622458; c=relaxed/simple;
	bh=lYt8ji/7HRrTezdJUKOK4QsdGHUDmlSydnqAYtnr99k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKp99xjORg9xEH+WQm6cngr0QWVsDCgCqsvcfqBV/TApr5GiwsmISFQ63aVLZ4TQO5vnPddb8dzueXunv/qjpegLtZ2OqQtH4AJ/etZl6hJpuGezVZKFAsjQYp7zAgPGAO+6P1D85i5RkBByau9b3dL7PSVQOnd7sD9wjAMBujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OH7OIXRY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so2649183e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 04:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732622455; x=1733227255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVU/7mIlDreqROnILiawav3yYllZ43agpoM/xnhlh0Y=;
        b=OH7OIXRYQUApxXNcDvmbeyFtz1WJxY/wc1BsPuh1mk03CvTO9z2lWUDuUVVNkAKbzP
         PcdunDoe1JYIGztbm6UmKICjV5N4h54NNOEYT6kv9cjivnKlAGr97/EBBvATxkEC0GBZ
         bIl94w4HhXEmjtvLi8qXN47Is0UxBj/sLbi4MvDLavrKdI+kuxsv7iJnDusOl3HO1JXy
         RouVBT9grErPcb8hDzBtzUWF0rLZ9jayKbLSLvvwd6089audwM088C8AYnYSxGMXy9Bd
         glTITlbyGDAeHst8uyy1MowF3UBEmrQEYw04KjZtLDoKlX/r6tVLseZ2RLtXJUNgurvB
         Gvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732622455; x=1733227255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVU/7mIlDreqROnILiawav3yYllZ43agpoM/xnhlh0Y=;
        b=sZIm+MCzPJe6PKq2zpdLoMamXPJPLe8cJ4DE9w6t9mofzxQyGoYpI283QEgzRakmE8
         Tj0/zNiSWbeyygyrHIpUGh6Zy6+CL6conC5HvHK/4R6Q2mdkACIZx45587q1IET4e2Wr
         /Hb4A/ug4PU6PyldxyR2Db7GkKF5d97lYdGWAjzB65KTKQMiGnplUMY/pzwG27zHF0hT
         ETrjqRljWIYFVFmX4pF8RDNG6zmCk0uSDdXp9WBvg3/YgtD6JJS1PKCKn6hwHvSYGjvo
         +1I5BcIj0hyFrjqvdP9KRE3Ly1mSUZ2FFhByDnYkTm+HLcm3XjId430roOKkRqyCUYXY
         w1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVKkX1Y+lwICnnRGhx+l4dB4xfIULISIyidzRrktKoD107aDx2bAksUxhhjzDIn+8TPpAuWQVDSv/2ZeA4k@vger.kernel.org
X-Gm-Message-State: AOJu0YzbRDbZld6k1TMgprGTx08QdtkI6lFTdeGSZ2WAd60Svzf1KRVb
	MAMM4BIny9oD9TKNTq6KRgiwgk8pBZmHVdQp8UZ2XgOnWygoxdJTguJT/npQtso=
X-Gm-Gg: ASbGnctWiWaeeOBAWcYeErxcmiNnsm7cZoIB/e6phuPkY+sglFtjHifK7PdIbvWjhdv
	k7/3Ef6+5xCPbtTo4LtkO0wCWprw5e3UiOJg371gXEuuGaw+kInCVlQ0gzORIiz5BSbWEntAKpQ
	cjZ5shGPX1QMmDKFKFMg3ySMvH99v0Al2foaN+odltVH34AGSRW5HRS1Ecqyn/U7N8VzxOj7XSg
	EFKWBSVXaTxlCBqqbkJQj0DYkDyKkPcRdLwwJ6BJkc/vTrFRjuXchegk2cyi+HuL5f6QmGBkEgy
	vbbRPUXdVhM7bWc+QewYiOI+Tgx5cA==
X-Google-Smtp-Source: AGHT+IECZIZk1p4EZVOfNrqLGy9qwFUBi1vFr8PxZyhHFM20mT2YJs/z9TvdN1DIdprO8LD4jSIaGw==
X-Received: by 2002:a05:6512:39c3:b0:53d:d957:9f92 with SMTP id 2adb3069b0e04-53dd9579fd5mr7379156e87.9.1732622454735;
        Tue, 26 Nov 2024 04:00:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451228sm1993130e87.74.2024.11.26.04.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:00:53 -0800 (PST)
Date: Tue, 26 Nov 2024 14:00:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com
Subject: Re: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Message-ID: <vhxkahek77a6u3bd63xdyrykod4jhq3rehwdemf7rxuev7tfgx@ctgnco3go7yv>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <kdyhkb3tt2lgfuopz7twxjwpfur6vuezaqlc7s7aozkz6ek2as@m2nvqcb5ww4u>
 <7df4fded-8c20-4562-9a18-2a122733dfae@quicinc.com>
 <d11866a7-0d43-4da6-8bee-d72b3e0649aa@kernel.org>
 <26353cfa-5c74-4b80-933d-f719b0d4f738@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26353cfa-5c74-4b80-933d-f719b0d4f738@quicinc.com>

On Tue, Nov 26, 2024 at 05:58:50PM +0800, Renjiang Han wrote:
> 
> On 11/26/2024 5:34 PM, Krzysztof Kozlowski wrote:
> > On 26/11/2024 09:57, Renjiang Han wrote:
> > > > > +description:
> > > > > +  The Venus IP is a video encode and decode accelerator present
> > > > > +  on Qualcomm platforms
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: qcom,venus-common.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: qcom,qcs615-venus
> > > > Please extend sc7180-venus.yaml instead. No need to duplicate
> > > > unnecessary things.
> > > Thanks for your review. But I'm sorry I can't get it. The devicetree for
> > > 
> > > qcs615-venus is in qcs615.dtsi. I'm not sure how to use sc7180-venus.yaml
> > > 
> > > instead.
> > DTSI is not relevant here to the bindings. I don't understand the
> > problem, so not sure what you are asking here about.
> The opp-table parameters are different in devicetree. Can we also use the
> same yaml file?

Is the contents of the OPP table a part of the bindings?

> > Best regards,
> > Krzysztof
> 
> -- 
> Best Regards,
> Renjiang
> 

-- 
With best wishes
Dmitry

