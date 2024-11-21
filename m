Return-Path: <linux-arm-msm+bounces-38703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D472A9D52C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 19:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B658B21B72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6115D1BD9EC;
	Thu, 21 Nov 2024 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWrJndSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFB81B0F0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732214926; cv=none; b=gkPxf2W+JoHLw08ns7r7YbVrXQoB/JeajeCcp4bPDawvunof5nR0Py67HD3myC98g4ltUhtGrRTea+mA7yPnGDKDE/D5T32Vxexa1AUMfPWKQ/xoAvaJxTfeksbDpmA4rt4g0kjEbnH2i/4+fQvAo+MuFavVz/TIHehO8X2z3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732214926; c=relaxed/simple;
	bh=twaM33SaQzki/mmDs2cZN8TuvvcI8JhAgJC6bESQIXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouI4/G3yIPCk2la3cg21zwb1AqX5hRv0fmfzTglSEnSwLJ3bpuSRHua0E9vORTuqe/Vn2WbC351j+gDMQNh1LkSKe8+fDpYox33wLzbAKKKRy2+Zi5So4nLPer+rWLHXpbUEaeRyjBCSPnB5yf2kDUZiODjCS/qjCyD1MUDDQLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWrJndSj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539eb97f26aso1409839e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 10:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732214922; x=1732819722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N/jkkR8nMbERvoxQEZT3BdxCqkHgcqUYdGB2wwBhahU=;
        b=mWrJndSj6chWJ7J+akrcHlGg3IctTUZh7fNv3B8eYSlMN3amTvYGyGJC6ZPzX6qp5W
         L6Q8pTC5SDj2j5ckw3QiqpnZP6IA3B9gJv+1rL+PR5mf3ZN3IcIC7DUSfOQRiVBH/ucC
         0t2/L8R13nk2nA9Aq4mJ4Up2VBuhZL7WJD3sUAd3FZwSQpxBqU3jOtuixHKI6kXMzObj
         dDJ/5Bwy3/9e/NGZQuQGE6iw0iwuz+H0xln+A7EcsnhuDq9mNb3h9P3TsjSBzN1zsrRX
         CotTWskpY2lk+Vo/t7YyxVFwtapPsLQFAd3DWOwjgnHGHdbv4ZLQyf1xfWnrTw3Kr8CL
         q/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732214922; x=1732819722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/jkkR8nMbERvoxQEZT3BdxCqkHgcqUYdGB2wwBhahU=;
        b=vROvwgg1Xl0IU2JdE/r/mZQlJ5CndExIioKwXph0ljpdile/xe7jzaucrW6WqRXg/S
         opO3WgYBdHbYeSJAAuFxfW/werr14zPqXg8pQhumvceLK5du162pe8WOzrnM9ilfly/e
         XZnQ7lOQs7tKKgqOdXgsHoQcwQ4Bfzqsasdm3ZSqpf0sBsS/9MJ/gRuAHVaBPzOM146G
         1tD1wozHtemBzxi4rGYR1iPFqmm/Gd1g/oe06JfQhUBTjdTyjrB5K9aIJ6e9uXkLqtQ6
         FwAIEolEMRT4ACrAPIE342BQRZhtj68nBsznWtX0pb63EGC8SpULGI7vzKSpGB4NozAv
         j8QA==
X-Forwarded-Encrypted: i=1; AJvYcCWDp+JNDMsPA3LYtq9UKmY5xt+Ct34PVO0OkC83nO1fz7C651psSuhK1oq025CbN9q3rAsMMgMGFMv/hrWp@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXcuVPaHbFXYdD+ZzDyomSdsjreQda11caN/zRNMioKHTU8I2
	clgrzgaYQQ0A9r5Ir530gcmwfWKe6RcSPLHhHvgPqcU8OwZqCEFf/XTAoiTRnxs=
X-Gm-Gg: ASbGncu7i9sTTeIC35uO6HJANeVgCSz1Vbn5AGnZeMAZh726hqGAloqqbi0QD4QXA8Z
	sLOARd5vmWSY4Ik2EmogHwEdK1+nniNTtqST8uGK70aD2x478t9wz6UCTTKfl9nZfs4IAHqEiud
	maTV3w4DJUH20glplZJpPLRejXSs+4S8UQKpL4qaBWrGohYdwAXh/zCrue05CPY9GM6R2cmA0Fy
	2olK0d3qZvwWoGeGQv8E1KL1kIKjh1JROabYXHcEAm+spUWEcd3T9n5x6dXzjB95U/N//N1gcGN
	I/Sz+5VhMTx7mdgd7zobK/JqjBcMgw==
X-Google-Smtp-Source: AGHT+IF1mBAeJ4BI45Mi1UjCjlUsGJoAnHv/OqqK+iLPphGw3fRqlEgh+3glph/5g5che2HoDtNuuQ==
X-Received: by 2002:a05:6512:3d22:b0:53d:ab10:c273 with SMTP id 2adb3069b0e04-53dc136aa3bmr4136200e87.40.1732214922608;
        Thu, 21 Nov 2024 10:48:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2489d33sm44989e87.194.2024.11.21.10.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 10:48:42 -0800 (PST)
Date: Thu, 21 Nov 2024 20:48:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xin Liu <quic_liuxin@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, quic_jiegan@quicinc.com, 
	quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
Message-ID: <iwofebhajxvjliqwn32gnubrvkjyycidkfrlu4w24tw62v4kor@ksxzcmmymhgg>
References: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
 <20241119102315.3167607-4-quic_liuxin@quicinc.com>
 <5d670f55-1ebe-4034-a6a5-e68417c6e486@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d670f55-1ebe-4034-a6a5-e68417c6e486@kernel.org>

On Wed, Nov 20, 2024 at 05:59:21PM +0100, Krzysztof Kozlowski wrote:
> On 19/11/2024 11:23, Xin Liu wrote:
> > Add watchdog clock on the Qualcomm QCS8300 Ride platform.
> > 
> > Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > index 7eed19a694c3..3024338bcfbc 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > @@ -265,3 +265,7 @@ &ufs_mem_phy {
> >  	vdda-pll-supply = <&vreg_l5a>;
> >  	status = "okay";
> >  };
> > +
> > +&watchdog {
> > +    clocks = <&sleep_clk>;
> > +};
> > \ No newline at end of file
> 
> Look, your patches have errors...

But it's not an error, it is a part of the patch format, telling that
there was no \n on the last line. We might prefer having files with tail
\n, but I'd not call it an error.

Nevertheless, I agree, it should be fixed.

-- 
With best wishes
Dmitry

