Return-Path: <linux-arm-msm+bounces-11653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5A85A13B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 11:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9932628146A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC4428DBC;
	Mon, 19 Feb 2024 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kv+YzTdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB524B5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708339435; cv=none; b=dHAUFSopUhdrgshXmXgQQGOcSYtSxeDAtWfYjTvblkpWv2GkiuIVCDsSCEo/nO8BKSSeF8irBufVecY5/CTS2+BPwUkZbrKkdOqJLOmsJOL0QLEW0aK/RnVNpl88wfafhzJbR1Ksdf2KwBoQtnaJrHewefixPoMP/g1R6tglhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708339435; c=relaxed/simple;
	bh=E/dwQafQkDpm4FRK/96LENuO8UQsTfK+eFCnX/3ekxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ykmf+hhZO7xOVryzdHrJ6q5YWTh29AZlEOMu1s5DiFYt0IG4ZLnomlN7X8Hfewfr/XK8bwNrdA+CTpyNhdDWa+vtGkFVdbP9YsFOFwDIT5DIsGGoVuIEQbNVMCxlDbkvJUbtrKq/YWp47q2/HuvF8+vhbMfCs1wAdKwQqhPo0T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kv+YzTdo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512bde3d197so212237e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708339431; x=1708944231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Kggm66I2y/vi1EeOvhEU59nPGFhYTXx3hwaaB0gBno=;
        b=kv+YzTdojMpBdmppkkrNFIUa1t1xJhsmVopcnxk8q/3bp02jLERbDN5FtvT1OEWfIs
         CGnVc09LuelRutKZ0jJqWmfbHREzRusFywGv4lwzbQyn9PISfaMS0Il6t1PESqeImBiA
         YopD+es6cFhnX/X4+HyeVNUISXr3mJhgCrhc8ZNx0ODVTL2I+wZQZlebRwJkK6Ux0kTl
         H9/jekS3urt+qrPYYjQo2CWtJQCqtl/X3QC2xXBhiStQVrzvzc8URjka58gXtsNghb7/
         KZmIpAuZLZHZAcXiJe4l0C1O0xp/xJ4ACkLC7y88K1dx2OjairGhAQVDB0zaxaDpAEIP
         OvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708339431; x=1708944231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kggm66I2y/vi1EeOvhEU59nPGFhYTXx3hwaaB0gBno=;
        b=FkafcJq66piBwkRRSWMfnEXJrxkgIAjmRVuviktJnKl27xWyGF8Nu0NG7iGvKkxpDJ
         HyYpbrvjyFiau78536b/k4xBNs0p8OBbBLIA70c5lYrnBUyDwHEj8SVuDtvTjI2j73Mw
         3rzWoIIWQWnksx2zSpo+64iWhSwh0F68GpEXQajn9TqfevX0gR13JZcHu6jUqEBbh8A9
         sAsn0UsuSgqlOqihSiQBGkeyeOoSb6VREKHPGXMi5KfsbegFywSZRN8ZRa44SA5qpe6d
         sjsQEPLhA2bBHwp73YE4AMbvh55R3mdy0uBjdwyxh/F1dqXLGHKgHa537Sc524JHNPGd
         osHw==
X-Gm-Message-State: AOJu0Yx8wa5UQrTKlSJU0XlZ2CEwNxEo/FGQDLOrpDCvmMycUj02BMkK
	NGYaNQ7wWq6KwN81ZjDitQfm081NAmeta0N6J6TNBJmrTwjfuMI97S7zOx1GmYE=
X-Google-Smtp-Source: AGHT+IElz4TjU8D2lkNBcsMPEFJNte9kkFpP/echmyo2LLc0c99lFChPflTVKFN/lBqt9pVsTI42jw==
X-Received: by 2002:a19:8c5d:0:b0:511:1790:e3dd with SMTP id i29-20020a198c5d000000b005111790e3ddmr7555086lfj.54.1708339431427;
        Mon, 19 Feb 2024 02:43:51 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id e11-20020a19690b000000b00512bdc911f5sm74051lfc.271.2024.02.19.02.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 02:43:50 -0800 (PST)
Message-ID: <9c66c731-50a5-4dca-a3cf-e8042136c715@linaro.org>
Date: Mon, 19 Feb 2024 11:43:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC
 machine
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240218195007.89960-1-danila@jiaxyga.com>
 <20240218195007.89960-2-danila@jiaxyga.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240218195007.89960-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2024 20:50, Danila Tikhonov wrote:
> SM7150 has 5 power levels which correspond to 5 speed-bin values: 0,
> 128, 146, 167, 172. Speed-bin value is calulated as FMAX/4.8MHz round up
> to zero decimal places.
> 
> Also a618 on SM7150 uses a615 zapfw. Add a squashed version (.mbn).
> 
> Add this as machine = "qcom,sm7150", because speed-bin values are
> different from atoll (sc7180/sm7125).
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---

Sorry for the mess on the previous thread!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

