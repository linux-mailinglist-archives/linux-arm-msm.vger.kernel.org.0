Return-Path: <linux-arm-msm+bounces-40498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 432789E54AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E579A1882050
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2312144D3;
	Thu,  5 Dec 2024 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gSaokD6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD142144CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399798; cv=none; b=ZXnUjsuEamKPNlZp/TRV77nboLJU8dON+P0X0PPwoueLWYsetUTmfX8zpRmbhtrwyHM7KeoHGq419fehoOSvTICgGZ0SYHfOnrxstRrYEgd+SS/E3o5XOoDjpUtpDBpvVxIxM0TDTWzhLDJPO0htIWxIZ3cEGQ7gosAUB/q9Ww8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399798; c=relaxed/simple;
	bh=jsU/m7SEIIFDJmhyxSYaMTRswrSMMAnmayMJmhdd64M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNnf4+fAbYGcMtDW4DM4CXHiDs9OoqRIRu7fc+xVrMVrfgY2QctKNseewLBEJKO/j3KdSnmaLcIaWIt9k8+GawdjUIa4pQTF9gDRYLVc/jT0TieoG+SioL2hOTWvGsxSeG3YKXUSZNRrZOSqikzLj37L6p/AwH471WPW9wQquKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gSaokD6p; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa530a94c0eso162855066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733399795; x=1734004595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=;
        b=gSaokD6plYvYPl0qYwYlXhoCs6MaskOz3po8/8lSMP0x37ixBX8teAApM4ujyuNtLr
         bmglAfIJ6ScmL03PxbSECkeog94hJKn+1z15y4Ejopom2bSdC+POUBubxF4jCcVVECkk
         zxD9DroYCHiAonPqmc0xj6AzevTjy6TEoSDtrppBmB7fjpssgiJeBwhqmb5eWPVYeb98
         V8sq9m72/LWtIIJ6BDnEgqr7fpBipOFxG9inrGdG0Bt5skiTxGkJUtmsUsqZfDjC2A8o
         VVaQVqVXkMPfM6tHGdEyArKXm4xikoL727azGr7mfe3Ni8Y0Ih2sJpPbDlJnaaDaIjyr
         2lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733399795; x=1734004595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=;
        b=lZmR+9zwSEXvIOSMTUMEck5XqL6YNdtAdofNqx9AImCvKaDRDZYn81fcaD+X8Qyb+S
         y8npMg7PHLIR3nqeZccOF73CNfp9UGUXqgTbXhMaLz+83j/4thLnLX7TPSGgaLuj4VaD
         nhSiC4pTZfCicNoP8HAuRDiLgGogkyjSx56GCaHaXoMEwoV6LyCjjy6XpI1mmYsAYEal
         /EQgTn/Ts2rvU4SRoIqzWy5X3aTjrw1HUO4DJ75hxu/T6Jq3q0isiVeaP17a9E66fNds
         EIKmjVHOJTRO0MNksJHL8ZIBLOK4jPDWJiC2+H5FUOoc5BA9ELl+bjtIXhrHz8ZigZ60
         aSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrSK1QESCi2aTtspDdByHPgx1+bHteoiSUfJGzTPzj3U7sMxR2q2TRuqckv2nmU+euTIgH6eT6C44EHi1h@vger.kernel.org
X-Gm-Message-State: AOJu0YwceUJsxjjGFmSRDcFAmrI5yiBrt2KSDJzhnyIVCtuk30yMHDZw
	NfRRqpUCKGs4/b/FlQcVpKPgid+BzGNzci2lApAUrU/DOx/n8myc7ftbZgWybZo=
X-Gm-Gg: ASbGncv3dYdrI8KzN7M1qDbYYDDd/9uMmMd6ahzV+U6xXtvOq38HDZ6QyiZeVfAl/4s
	Dy+08uQgBbsSwa6fAoMA4/YNNM15wyIpVgW3otHKL4xxdY2EdXpyijmBMcvysJPH4hDVgbPMv+V
	Xlxk6JfER5ZTxe4zTi9GTs6VWjpxwUsSd7+Sg3oK3BW+rCjC68Vt4zUipUMEuddwW9rkOHEA8k5
	9cGs2sWNdlvSLSQNrIVFNS4LnLSH9UDYkk+olLxlQt8+uDbqmszOC7IKUL/0Ig=
X-Google-Smtp-Source: AGHT+IEWGiuqCz5p22sJv4oUuBbuzMg9J4wgAEUTDCD4f1ma8OOcOH3epiuHrkUATGhdMfNL7flyUQ==
X-Received: by 2002:a17:906:23e1:b0:aa6:312c:5abe with SMTP id a640c23a62f3a-aa6312c5c99mr28100666b.58.1733399795552;
        Thu, 05 Dec 2024 03:56:35 -0800 (PST)
Received: from [192.168.0.62] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa626088e8fsm81659766b.139.2024.12.05.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 03:56:35 -0800 (PST)
Message-ID: <2cb5940b-3779-4450-a213-fa766df7f406@linaro.org>
Date: Thu, 5 Dec 2024 11:56:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
 <oko5qqysmxhicqzkwhkz54wvsmt64ba3cd37zkcy55ee77owbk@5z3zetfr2ejx>
 <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 10:59, Vikram Sharma wrote:
> Hi Krzysztof,
> 
> Thanks for your "Reviewed-by"
> 
> +        camss@acb3000 {
> 
> If there is going to be resend, then node name: isp
> 
> Sure, we will change node-name from camss to isp or camera (As its a 
> part of generic names recommendation as per the shared link.)
> If there is a resend. or we will address this as a followup.
> 
> So
> 
> - camss@acb3000 {
> + camera@acb3000 {
> 
> Best Regards,
> Vikram

Please no top-posting.
https://subspace.kernel.org/etiquette.html

Shouldn't that be isp@0xaddress ?

If you are making this change, please remember to do it in both the 
example and the dts.

---
bod

