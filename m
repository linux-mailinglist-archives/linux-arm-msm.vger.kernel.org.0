Return-Path: <linux-arm-msm+bounces-72945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B763DB514B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65DAC171C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBA92DCF55;
	Wed, 10 Sep 2025 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIfZ8ai6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD627876A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502227; cv=none; b=o5OMyO5bOBjpfd+PUe22Ih6qsPFe94sXdb8zCO4g4xEXvoASyGblLsBopZwH8699dSS/P64CwOTG+WZG/mFjAIUJXlIWPUql6zoi4UdkAoKXa1IGKSyFwQFtPUF/sEC+G3TNq1McMRXQaYR6kthhMQDRpkVhY1cKUF3e+OpG7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502227; c=relaxed/simple;
	bh=MfAeM0+0+NqP6YlpR00RfgrfzwhHRE8FnwOIXHbqs0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBzo3zsvfHDMtZxVCQ5SbeWi7Smb43Vw/xvcd8UJ9TluYq4C2NXOAB1cmtEqSxP94zFI0EjPJXuvES8bZsvTZg1Z7+GiOU3cKA70RUtfTgp96Udx/rllZVI+NaCEfg4lUGozWHu42Mi6jN4UPVT9/APHBuI2qoqfteQ8dfpreR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIfZ8ai6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so55369605e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757502224; x=1758107024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r08hJahlcSXpf9x/oPCPGF0O7nA9xLQykiFQq47vLr4=;
        b=tIfZ8ai6lkOeQzEbCfQL3MSu8S2WbIvPue2SElYnmYTWVC0aNILMgmjEMZ+vY6ccHX
         LTRzpE/Jf8N8McAJfITqeJgy7dS8bkGMccufEhuM3GPAbBD/Qe6yAMFYoZjih/xMAfFt
         u7C/ksonyUcGI3iVLXW85vEwxWpmxriUsAM8xDtmoN5RnCzdhF+SBILkRX5zMHbqOmxP
         jWFF7XG7Jt+/QoQlQ/dJXNUgTsEbaTsoRS3k1UXWTGwu067tAJkfzVufUGDCL3H+dsN4
         awETZ7iIFrPOO55bl+jbVoelqQKdvSBH6T+ckseVlUlpNYA1VVDjpZd3i/SqNmjs4lN+
         YejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757502224; x=1758107024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r08hJahlcSXpf9x/oPCPGF0O7nA9xLQykiFQq47vLr4=;
        b=plqSfQ/zhaN4l2qOPNJx2NajxDN28yQ6YYBrkN8C83H9Cl0hYOhTsjDPbLgljdXEvi
         vKJntfdqt3+GjkR1MgMrtp5PK1AL/I/2nOxHWn/nfxjN3kT8qWwzmfwz6TDWGdkRC6HK
         6nhIvsW8HlfX+Q4//uBaMs6RrcoYKwMh1QNnPFqgyM9u5NdWL+XQYRsu2QRwQgwottVC
         StLc+tCA0k6iyzUE51nkGJ4Qzh2auFhqki8WDkh32G9UEcw0M14s4Njy7OUiJs6SBaLr
         irf2+3b7j/ORkcOFO4buRoXb7jgMIVl+G6qcVb7+0C6icAeRIWuVWMBCXxpPP/2xYTxm
         DXjg==
X-Forwarded-Encrypted: i=1; AJvYcCWEWmjnfhOhQL6Td/tpmx9xc7QYH1MFNiMMZMMH/JLF2NqJo8QRcmwQyPmBACNMslxaMhifKoBUFPOIMCwS@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTezHR/8HDxWnK7ULuBajclnUuBKLuEn+ZZ42Q74xI9Hj/hfw
	rYRz/elRRJqEJVHIsfbXdtIiyem+PxMO8kV6FeuMybU5O9DJrgSy+CRvG31s+SCY6HpqeN/INFC
	bpmA2yAE=
X-Gm-Gg: ASbGncvnAbfkfeyEvTmpR/xK+F5N/O4s9WuM+I53Bf8uQDzZ4X9s06jerQ+BodJxh4r
	ExdXoMGygvdFXtZwENC3ph3bmlgyFpgzTKsBpdeL/Ch1fps3EVmUOEyTZSXsIySF5CuMPjrid+Y
	3c7Ku3dMqUq6cpWPpOdX8EKkKkg4ww5Funv7Q09wo19beTgvVmaxFD7bxhVOcauLM/qiJzNR3a1
	qeLqKQ12z5YU7je9MTenaTJKMHhUjH11Z9WmNmFb5jRyloZdSDXLI3lztVyYNcEgFGQx9w4+8y8
	qN0Bh73Cf1tpoo4gMim6zB+3sEOFYU6gPLY2M2REEJERh84yV8XQE5lS17BerFv5zdbZ1hMYDw6
	Xux1JbqJ8821sm3t+PvuUG4x9YMlXFNSal6ERpoQhamS31OCEgF3NIcsA1/XsNvKyna1/ftcQrV
	TDzqECKDVdinX2dAer8IA=
X-Google-Smtp-Source: AGHT+IGSSsTUb8kO2rPV79368muMuGos8vtiUCTfNP+AFDQ9kg7kknopl6w9E+whw5uTL/w+rEfQ7A==
X-Received: by 2002:a05:600c:8b34:b0:45d:e110:e673 with SMTP id 5b1f17b1804b1-45de110e71emr135337115e9.4.1757502224302;
        Wed, 10 Sep 2025 04:03:44 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df16070bdsm28197275e9.3.2025.09.10.04.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:03:43 -0700 (PDT)
Message-ID: <1d9287ac-1c6d-4f83-b95c-b69bbeb63147@linaro.org>
Date: Wed, 10 Sep 2025 12:03:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add missing header bitfield.h
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hans@jjverkuil.nl, kernel test robot <lkp@intel.com>
References: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 20:46, Loic Poulain wrote:
> Add the <linux/bitfield.h> header to prevent erros:
>>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
>        36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
>           |                                                 ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
>        38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
>           |                                                 ^
>     2 errors generated.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-340.c | 1 +
>   drivers/media/platform/qcom/camss/camss-vfe-340.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 7a8fbae3009b..22a30510fb79 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/completion.h>
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index 55f24eb06758..30d7630b3e8b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

