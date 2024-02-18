Return-Path: <linux-arm-msm+bounces-11587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C6985970E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 14:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50631C20A38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Feb 2024 13:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DD46BB5F;
	Sun, 18 Feb 2024 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5AFYKt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7777B149E0A
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708261620; cv=none; b=c9Imwnb+SLcqGjgL4qS9heW6/EX+LgV+47svA1IO2Y2RvhsTXHwH0oSJO1jbjgNPmSz/+OsanD/Y0fUFd56pZ0nNAnjZGfjG/vZZCmWqTmdR8BAd3QmQVkoAPugTnZiaa3v57LwclewCm1pT99bfgbKjkN+yFJk2BJXd/wdTzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708261620; c=relaxed/simple;
	bh=j7efkgnv9Iz7iAuL4g0Pk1lRK1miSATAg1PG0Ezcnmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVzwPAOhk7wV0zMqLL2uidf9kJwub0VYEhkZKYdiLuALRh/duS41NctXooYbMyUTik8EyNvREb/GG3J9TDVoHCcy/00dCo/LpnNgutoxXVYEAKkMNz8Ux+fv7g3XbV5d2pEKeFoxpex8OYNOE2Sd+VHpO0w0yHsjTK6d4/fFQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5AFYKt5; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-607e707a7f1so31949197b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Feb 2024 05:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708261616; x=1708866416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YBVRcSBBuxFaTxHHxCFDbpb9aYFi0NsXjnHpoTC9kRk=;
        b=H5AFYKt5Rb03xW4y0DAqXtpN14YaPvd4Ix5nlihdM2yd79NtfQ8/X+LKes2wLzYdAr
         8rPnzMO2D35lYe9pKR5CHE6F94IruBLETCGBWWMTMfEAp6x88Gt9PhR2stbY/pjh0vyO
         4M7K6+8ty1l/+NC5iCzEaXk2frqBFBMRhCL6nTc913VFLx20aPnqZT6KQGkPZjwloe29
         m3a9rhLNw/D0FT8UhgFxh8cmIZ0tmSIJ+Izy6YGwRR+P5zInNZInNOyUGBVQAXGS1OsP
         ai8OQrunoSOHw/mpKifvbX7IVURFGBizqee/Bv04Udjo8DRjKRmq2E/bdJPRItXwL/LT
         SJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708261616; x=1708866416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBVRcSBBuxFaTxHHxCFDbpb9aYFi0NsXjnHpoTC9kRk=;
        b=AIARYUfSU9bXqGCHAkHcEbGMMSOB4tdolEiKtJOdngvG4jx8qrCiV3bN+G5rBHpLcx
         ocXGhMqb3lDLmvIgE3lJeIUkoSOEXpCmgwLc4f080ofS/Gzdu4yHW8SFQgrgdZiu6Pe7
         9x65YI6AAt34ormEdFTkrVDq1gYGom7Zqf/ophgueqNlbnnRAKA2FbH+aJq5MPFPEsSe
         FlcZl4InziKHT4aXApOhaORTrRYpTuZmLE3w7/glG9FxkjgYmB9PSBq+4FYP3XoQ4LjF
         +mmUlaVDW3M/lNzgsbd3BCEOBPK1f437R1ug7RsOCfy9EpKxB6IEoFNS43FkMGgl0PC7
         /YTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOf8l5JAFJZx+O+SMtOFNw8qDSdP3EEIFnZusfKHTX7WOh+sr2SIBOjhMlFrfc0x1wFNGcgaJhQKRRHIoBV+AK7ouEZzhP/QMVInLlBg==
X-Gm-Message-State: AOJu0YxCGKqc5avz+PjSTW0MPYCncO2FZvdjBllx5GQP50szw1Spcasy
	5AE30+QAu+uSWB0tYSxsgMddlDmQGd2Fr7hlAwEazWc4+pcBcCk/i4wXTFFhxtZq8EA0xQmRCY8
	yM8tt4rFMnvjac+eOLcZ7IwDGKow4205yhlHnYw==
X-Google-Smtp-Source: AGHT+IFwAgLxBZXblOBulsbnsc4LQ+Pe2xER0SSlfwoxqWLXlBGUgn+4tkOT1j2KFCAC8mjhS4ohhc82TcyeI7dNm+U=
X-Received: by 2002:a0d:e2d6:0:b0:607:8c84:d474 with SMTP id
 l205-20020a0de2d6000000b006078c84d474mr9844866ywe.31.1708261616529; Sun, 18
 Feb 2024 05:06:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
 <20240216-x1e80100-display-v3-2-28b1c33ac8c0@linaro.org> <170810832158.3497594.1997532394027797497.robh@kernel.org>
 <ZdCbAjnga8HCMdYf@linaro.org>
In-Reply-To: <ZdCbAjnga8HCMdYf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 15:06:45 +0200
Message-ID: <CAA8EJpqCKWih1OeMsynMHkS6CAoDTsgRXcv5YAPZNvLT3MfA8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: Document MDSS on X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Airlie <airlied@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 13:39, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-16 12:32:02, Rob Herring wrote:
> >
> > On Fri, 16 Feb 2024 19:01:06 +0200, Abel Vesa wrote:
> > > Document the MDSS hardware found on the Qualcomm X1E80100 platform.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 253 +++++++++++++++++++++
> > >  1 file changed, 253 insertions(+)
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,x1e80100-dispcc.h: No such file or directory
> >    24 |         #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> >
>
> These bindings headers are already in -next.

However they are not a part of the drm/msm branch. We can probably
merge the rest of the patches from the series (once patch 1, DPU
bindings, gets reviewed) and merge this one in the next cycle. Does
that sound suitable?

-- 
With best wishes
Dmitry

