Return-Path: <linux-arm-msm+bounces-57868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996EAB6FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A17D16809C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9D41C862D;
	Wed, 14 May 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grnyxb9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2EB1552FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236480; cv=none; b=CwBIg1deMhGE5ot1+5LndKAGi51yQ52RB1QhdIwZPgkxE64MHzUJeTkzdM4sgbVG2GF5TsRvBvzS3PREs34olAusC/i0BdqDF5YMHZ2CtmSANiG/ClRa4uV9BAGoH+s1S8MmyQRGNDnmym2F9k7WyzWE4JpmmN7DDYOpnsSkxsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236480; c=relaxed/simple;
	bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDV3zh4atW+O5LwXRD/sqV9pMciP6SNQieDSFclVogjrNTB4IKEV3q5e+pcEH707aJmqfLIWn9eOE0XLEVEbDVWpnIevwzZtwJ/eHsDmGgEoM6YljFN8zuwRGW3i9tL+fs9Oht4n0jS15Y013ZQoZu4jDmQNcS6eMrOvI4AfG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grnyxb9+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad2490d7838so107458166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747236477; x=1747841277; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
        b=grnyxb9+BJjxqXifb26sykPJ3CcuBcpwvMtlEXyZVzEeelNLmTsZqCtlXlQigL1xxr
         XuaKeEELmraKZKYJqXg3oBsnByBVl/wTzfQkjiBGeQnvBZqxxUYubSZBlZb9Il7yTc1a
         MBBC7WeNG+7Mm2XeiwHqqRYksEb9fD5kb7ClAB0RmeC1plp+ZJqh1oYYd58euHg4dbl0
         OVb9U8eETKStDE3Mj17vLu0z39eDd2vZ+x+9efdl9PWcScmNzRVVoffipDhas1DQ0veA
         v9FJCpSdjIPVUtlSBEvZ2AHhOgpl90T/4XtEVTxNjKSBW0x+4o8oPme/n1wK4QSDBCHQ
         H1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236477; x=1747841277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
        b=lfOY0mj0Lw5HTJQhdbK87FLGHd8B8UnrT42SQ1+RBb6rfxxLUt7ZvBPEqk0v2w0isY
         oikQLs8ekgYrrc/cJORGknvqkLiearuhZ92JvHhGMzmzzNXkzbdKr6C+FkuGx14Ig9vb
         BX4Ksudl3nPawKM2iuuzr7wGNvRsX3h4tfoGmQEBb++dtdKXZouIELsMV1uPw4V7/SBi
         RQo9OizEBv9JeFIFK46XvZfiTENENew0YS8fZAXCZxXgeYW98yxJyletk60TTzBty/Ny
         wYJrpbRKWxS993rsXr7u4riwge9/cV2fW/W/nWLRXr3exabSy7KYvBO6f+2bYgy57Q/l
         N4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUmqmwbBo0NVBVJklm2ppy/RrC/ATWVcQjbRPr7RK/Rk36enQJCV5+L08GfVYP3I3O0xcQr99eIATN9gjx+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeb2IS0891wJ7RxXbD7vikyHQgq/B08YIggOZ0xh0+oVRyNwun
	gXJlwLrHRhIKgvUcz2EUimZGrmX3NQEjVJwVOct5+++56l+4y/ktv4I45W3siN+cM9G9EQqCRiw
	bauJu6IQRrwpxcC1XAVoOU4FlOLF1NwFaY7wfgw==
X-Gm-Gg: ASbGnctTOHpIioFGnfiahVAUEPEaclw2lFgYDdmM6KWVrDSz2nTZe+YCYSshFo/5/B4
	un71Z5Vvx2T/+pgR/8rdau/oTmXUXCvhjdQKQI8+8x3h8GM5CgZzj10Frxqa18RHa7voe9c2Kc/
	G+4qTba6YIPzO2omzY7Y1iUQk54vNno3w=
X-Google-Smtp-Source: AGHT+IFI6WGyYTssVEodUuBbRbHdt/cK0IPusMpr/1+pqSkJpRWIkQArQUnuyloTmvBZCSiRQ0Ya6krvZBl9FePgExs=
X-Received: by 2002:a17:906:4f86:b0:ad5:935:81db with SMTP id
 a640c23a62f3a-ad5093584e3mr109467866b.10.1747236476735; Wed, 14 May 2025
 08:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
 <aCRkRTMFi65zBODh@sumit-X1>
In-Reply-To: <aCRkRTMFi65zBODh@sumit-X1>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 14 May 2025 17:27:44 +0200
X-Gm-Features: AX0GCFubE386IXxNi4n8B2NKhYEqMdnxy1eH-BueT9owSlm2f-luFbE7L4_yv50
Message-ID: <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] firmware: qcom: scm: add support for object invocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 11:37, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> Hi Amir,
>
> I am still unable to get the QCOMTEE driver to work on db845c. As I can
> see machine: "qcom,sdm845" is not supported for tzmem based on SHM
> brigde here: drivers/firmware/qcom/qcom_tzmem.c +81. I am still seeing
> following logs from userspace:
>
> # /mnt/unittest -d
> [test_print_diagnostics_info][31] test_get_client_env_object.
> [test_supplicant_release][65] test_supplicant_worker killed.
>
> I think you should first check here for SHM bridge support. If available
> then only add a QTEE platform device.
>

On platforms not supporting SHM Bridge, the module should fall back to
non-SHM mode. Isn't it the case?

Bart

