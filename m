Return-Path: <linux-arm-msm+bounces-36592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4429B81F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 18:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 630CD1F22E07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 17:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C81C579D;
	Thu, 31 Oct 2024 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TE3YMvI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF961C2443
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397485; cv=none; b=H/iQJbXMDcAmSx3mJcT2gF/NPg6VU2y2NCy6ckxXdmLU7xipfm//6T5NCJso3D9e7CC8Lnga7GT49TReYs5a1a+0nhZ9z6TTGCKoVlpJLUVDq7nJPUZWk6KFBcfdgLBDUhF5JJkDzHYoRGK2c6BoIbxyFu6SCeY08yIdThkRlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397485; c=relaxed/simple;
	bh=s98ZX28OsVpUZzWaaWrFm/+3vCU+Pr78M3qXyvNi430=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVupOeSnnef/nDJcdBBkg9LPdiPBpqhv3uKoLwtI7aJLN7sTfafmSNAlJIRtottzdFjzDoGiS5N9Zqy5+8ax997c501nv0ZRSm47KQ/cyV8KbvETvLqy+i0YfzTQzy16wLl6inNMvzPSjlqEAkIi29V9UKLNDi1Fu1ZJvbB5PdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TE3YMvI3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f1292a9bso1536545e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730397481; x=1731002281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P83QC4divwjdwrOkzc0beaK7x66pdeMqgQ1qbe4pGZQ=;
        b=TE3YMvI3gX8v3czSKkqhq73RscaYYFOYVzLdo4u52ig90xybOIIpbe5iR1r5IMPxdr
         0qMZaYYfEaEbr88BieHkHhE1TBpfSZ1mJtr4bwI6Tfk9x9bzfu/3GRanxP+wSSZeHAqc
         8zTnpenvflZw391sG/a3Yp7wHaDJs0xbWcnxo0kJAByYxCvZsZVF7O6BwsuV9xan8VJW
         DHqdjRep895ikJ+hbw53gWmZRtii3CwsSSuWV9tklMhJN0rLiCUTaGusecGgMUtXvyF9
         o345UfGapyOlYSOAGu4P7gQtZ/mAxFl2vbnw4mKEBIDsLdX1K2gXKWyNw4iUtrGk0Wrp
         H3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730397481; x=1731002281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P83QC4divwjdwrOkzc0beaK7x66pdeMqgQ1qbe4pGZQ=;
        b=NA1Z+n7aaq9hJ1L1yi5Zwav8FEdHe/3xMYiFrQEr2aenTTwakqr4C6lh7QWz+U8XUs
         fb3rZgP4mChx/z+Ezxr8TMNRRn+OtOi0PPWs7yI/qC0VWmmHqOcDIpnGdipuAaCQyCb5
         XSWPsw5Q7YreCm0XWs5SD3uQx2FByeHXXNSAnre+UTniMYjjXGP6QrwWyU1WjrOsLSU4
         jxkr1H/xgneKvSul0YORpJHb3fC5m43SZ+jq8Fuvp/TmiW1d74cSgKas93gWV/ofu+qP
         bZnfSlgbQaUwfcuD0blnhX3u5z2E4hGDRpx2CEDw2oeYe/gksKAg7bcHa0irYjPTPiTr
         3OeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzabGWJNUwkCfyZo5RsW2KYWcYVjC2Onxx6rx2IRYUAy3vPvaYChte5pEdsePdslr16bMH1I4YVacEqNTe@vger.kernel.org
X-Gm-Message-State: AOJu0YztDtMe7XUMJxr1OTDfZ0UN17RYb1Wlq2/VOcBOqc3/JT301nSZ
	40Ya82jiIQvcsGAEzDEnLPJi/R+0nu/VLA3w0UNZgi9rnez+aSt4JpVzrDjr3vA=
X-Google-Smtp-Source: AGHT+IGSV5srlEIwYq4ukshM4Ah7sMYFPuqhx1GlJEoXoE2aV6eQnDSC8Wx080gm6OXkRcNzRUro1A==
X-Received: by 2002:a05:6512:687:b0:536:581c:9d9f with SMTP id 2adb3069b0e04-53b348d6ademr10336086e87.24.1730397481275;
        Thu, 31 Oct 2024 10:58:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c9f3sm282595e87.116.2024.10.31.10.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:58:00 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:57:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: jic23@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, daniel.lezcano@linaro.org, sboyd@kernel.org, 
	quic_subbaram@quicinc.com, quic_collinsd@quicinc.com, quic_amelende@quicinc.com, 
	quic_kamalw@quicinc.com, amitk@kernel.org, lee@kernel.org, rafael@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, lars@metafoo.de, quic_skakitap@quicinc.com, 
	neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH V4 2/4] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen3 ADC
Message-ID: <ag3wqsjdec7ujcba2jpvhzgcbbc5vnyjyes5ljyyf5b4edw7j3@rj23a25wvoyd>
References: <20241030185854.4015348-1-quic_jprakash@quicinc.com>
 <20241030185854.4015348-3-quic_jprakash@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030185854.4015348-3-quic_jprakash@quicinc.com>

On Thu, Oct 31, 2024 at 12:28:52AM +0530, Jishnu Prakash wrote:
> For the PMIC5-Gen3 type PMICs, ADC peripheral is present in HW for the
> following PMICs: PMK8550, PM8550, PM8550B and PM8550VX PMICs.
> 
> It is similar to PMIC5-Gen2, with SW communication to ADCs on all PMICs
> going through PBS(Programmable Boot Sequence) firmware through a single
> register interface. This interface is implemented on an SDAM (Shared
> Direct Access Memory) peripheral on the master PMIC PMK8550 rather
> than a dedicated ADC peripheral.
> 
> Add documentation for PMIC5 Gen3 ADC and macro definitions for ADC
> channels and virtual channels (combination of ADC channel number and
> PMIC SID number) per PMIC, to be used by clients of this device.
> 
> Co-developed-by: Anjelique Melendez <quic_amelende@quicinc.com>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> ---
> Changes since v3:
> - Added ADC5 Gen3 documentation changes in existing qcom,spmi-vadc.yaml file
>   instead of adding separate file and updated top-level constraints in documentation
>   file based on discussion with reviewers.

I think it has been better, when it was a separate file. Krzysztof asked
for rationale, not for merging it back. Two different things.

> - Dropped default SID definitions.
> - Addressed other reviewer comments.
> 
> Changes since v2:
> - Moved ADC5 Gen3 documentation into a separate new file.
> 
> Changes since v1:
> - Updated properties separately for all compatibles to clarify usage
>   of new properties and updates in usage of old properties for ADC5 Gen3.
> - Avoided updating 'adc7' name to 'adc5 gen2' and just left a comment
>   mentioning this convention.
> - Used predefined channel IDs in individual PMIC channel definitions
>   instead of numeric IDs.
> - Addressed other comments from reviewers.
> 

-- 
With best wishes
Dmitry

