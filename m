Return-Path: <linux-arm-msm+bounces-9940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86B84B453
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 13:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28208283203
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 12:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14729131E20;
	Tue,  6 Feb 2024 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JftHh27A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234EC131736
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707220635; cv=none; b=FXfIGCk5r/3X1/PQ2O9YAF/CdGhWLDqyHaz5DdKtOQhwM+TNjK5Eo/6mIQzmEaa1wFQHLqukqdJDGo732qbnV/k+9TtBsEd/Y4BOjcBKKhFNqFwdIuCc3HsxrqMVYOtJW+6s7TIpyoD21xdt5/9XDZygbPuKGqSkYQa7N0KS3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707220635; c=relaxed/simple;
	bh=Hg3/iVoN8Xt9xwsF8tbO3GWU7Apwxbu1gLJjYlDOPqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSQzJvbPR9Sjlp6uqMqnNV3vSe7gCFxSlyb83SftuSMSy8xSJwsHyvDqf2SueRrEv3VMOPLjQKAHkJzhDCkClXIfLJHy4gdlGthF+siThun+NctiC1mZ9fNzC9B9hUzb9sXrH7z+L3iEQsA83zPZUb1MaCitoaY98dcwztsfvdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JftHh27A; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so368005276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707220631; x=1707825431; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Le8ZKrDU25Vw3DueHEr1ODzcpo1eKUbedQGPH8uNW6A=;
        b=JftHh27A3krJQpNKRVYlORZvT4fWWS0espBOQiPurvuwJUxVX24rPZcEbAbt0WCJ6b
         2MYVUmqCOBy2UHVxnjl8+xJK4PHjLS1E76X5dA9U29Ark2rrKbsOOTQ0myvl1zInlH6H
         cHBmqGhNpU7H61I7gozId7VJat9ml85iLg3YzsJ60cmDKvh6vkLrbjRy+1JY1IVoKywh
         oe0kGBLq5VBRAAd6blz6dr6pzxRc4CTkD1XSMMJPAcyfWWaGqOPNqDzH0ISJLXAbQHZQ
         oJOiy5wTYS+O4fq/p/iCaENZDDTO0Lnybl+8OWtwU+OIkSfeLfTZL3QEbMUZjTiYNDlH
         gAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220631; x=1707825431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le8ZKrDU25Vw3DueHEr1ODzcpo1eKUbedQGPH8uNW6A=;
        b=lV53nMX3AtFkVUv4unKLI+mz80lgRNcf9VHXVnzBSPqpEGQq7+ByzrxHYyQ2mPJN9o
         PNolxdJ/AFUH+HIvm3zxPpzkreKfjD0RBC9IKgXukznIkyVKJVo25xLdQnRyECsNkUQU
         sfMqld4vuv3On6aWzRzQogLvbOSxmBfMLfab+JvytXJQ2p23/X3t57E/ZlHklWs9aKwt
         nnIjdYGAgUH0hVYeB/c9KSY34Nmo0RVgloIRM4pyEPCvHw5/6yAwVVRSop0X4VZyMMqm
         gOxMiuWUHjR5FVOUT2D+OuWYNVQw+Dw9gc6BUkUB8WXKAzgNOTZaOuhXDX2bu2q/IzXR
         Jxbw==
X-Gm-Message-State: AOJu0YxFD7FGuKSzKjLJZBiLMzB77QvmfEPnrtwFP8BMy4UORqfUvdxx
	sNtYbXVPZz8ZqyF7V+70notbla/jnytI5K7ts+0oZyjO+OnMNdvmlrnqXlSRpW2pOAO+3UFx6BF
	CaFU9QRXFQRrcPbAHW5UwRUeJP87wmMj4Ka0Grg==
X-Google-Smtp-Source: AGHT+IEs6lByJ9Q70GkeZXRjw6KUG6Nrlc41vCLLrFuvc0movqmOOqhJh7iPJ7w/9F6g9Y0yMYTiHQE0bi2Y9vOudTM=
X-Received: by 2002:a05:6902:2001:b0:dc6:c670:c957 with SMTP id
 dh1-20020a056902200100b00dc6c670c957mr920837ybb.32.1707220629612; Tue, 06 Feb
 2024 03:57:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127232436.2632187-1-quic_gaurkash@quicinc.com>
 <20240127232436.2632187-3-quic_gaurkash@quicinc.com> <b06b3b13-3d61-4bf6-bc06-80ca1a189a4f@linaro.org>
In-Reply-To: <b06b3b13-3d61-4bf6-bc06-80ca1a189a4f@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 6 Feb 2024 12:56:58 +0100
Message-ID: <CACMJSevs4m9gzMrXgvzTGguQt0XUQ-bXf7Cw6WXuM=v-CrQR2g@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] qcom_scm: scm call for deriving a software secret
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Gaurav Kashyap <quic_gaurkash@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, andersson@kernel.org, ebiggers@google.com, 
	neil.armstrong@linaro.org, srinivas.kandagatla@linaro.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, robh+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, kernel@quicinc.com, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_omprsing@quicinc.com, quic_nguyenb@quicinc.com, ulf.hansson@linaro.org, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, mani@kernel.org, 
	davem@davemloft.net, herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 17:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 28.01.2024 00:14, Gaurav Kashyap wrote:
> > Inline storage encryption may require deriving a software
> > secret from storage keys added to the kernel.
> >
> > For non-wrapped keys, this can be directly done in the kernel as
> > keys are in the clear.
> >
> > However, hardware wrapped keys can only be unwrapped by the wrapping
> > entity. In case of Qualcomm's wrapped key solution, this is done by
> > the Hardware Key Manager (HWKM) from Trustzone.
> > Hence, adding a new SCM call which in the end provides a hook
> > to the software secret crypto profile API provided by the block
> > layer.
> >
> > Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 65 ++++++++++++++++++++++++++
> >  drivers/firmware/qcom/qcom_scm.h       |  1 +
> >  include/linux/firmware/qcom/qcom_scm.h |  2 +
> >  3 files changed, 68 insertions(+)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 7e17fd662bda..4882f8a36453 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -1220,6 +1220,71 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
> >
> > +/**
> > + * qcom_scm_derive_sw_secret() - Derive software secret from wrapped key
> > + * @wkey: the hardware wrapped key inaccessible to software
> > + * @wkey_size: size of the wrapped key
> > + * @sw_secret: the secret to be derived which is exactly the secret size
> > + * @sw_secret_size: size of the sw_secret
> > + *
> > + * Derive a software secret from a hardware wrapped key for software crypto
> > + * operations.
> > + * For wrapped keys, the key needs to be unwrapped, in order to derive a
> > + * software secret, which can be done in the hardware from a secure execution
> > + * environment.
> > + *
> > + * For more information on sw secret, please refer to "Hardware-wrapped keys"
> > + * section of Documentation/block/inline-encryption.rst.
> > + *
> > + * Return: 0 on success; -errno on failure.
> > + */
> > +int qcom_scm_derive_sw_secret(const u8 *wkey, size_t wkey_size,
> > +                           u8 *sw_secret, size_t sw_secret_size)
> > +{
> > +     struct qcom_scm_desc desc = {
> > +             .svc = QCOM_SCM_SVC_ES,
> > +             .cmd =  QCOM_SCM_ES_DERIVE_SW_SECRET,
> > +             .arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW,
> > +                                      QCOM_SCM_VAL, QCOM_SCM_RW,
> > +                                      QCOM_SCM_VAL),
> > +             .args[1] = wkey_size,
> > +             .args[3] = sw_secret_size,
> > +             .owner = ARM_SMCCC_OWNER_SIP,
> > +     };
> > +
> > +     void *secret_buf;
> > +     void *wkey_buf;
> > +     int ret;
> > +
> > +     wkey_buf = qcom_tzmem_alloc(__scm->mempool, wkey_size, GFP_KERNEL);
> > +     if (!wkey_buf)
> > +             return -ENOMEM;
> > +
> > +     secret_buf = qcom_tzmem_alloc(__scm->mempool, sw_secret_size, GFP_KERNEL);
> > +     if (!secret_buf) {
> > +             ret = -ENOMEM;
> > +             goto err_free_wrapped;
> > +     }
> > +
> > +     memcpy(wkey_buf, wkey, wkey_size);
> > +     desc.args[0] = qcom_tzmem_to_phys(wkey_buf);
> > +     desc.args[2] = qcom_tzmem_to_phys(secret_buf);
> > +
> > +     ret = qcom_scm_call(__scm->dev, &desc, NULL);
> > +     if (!ret)
> > +             memcpy(sw_secret, secret_buf, sw_secret_size);
> > +
> > +     memzero_explicit(secret_buf, sw_secret_size);
> > +     qcom_tzmem_free(secret_buf);
> > +
> > +err_free_wrapped:
> > +     memzero_explicit(wkey_buf, wkey_size);
> > +     qcom_tzmem_free(wkey_buf);
> __free(qcom_tzmem) attribute instead?
>

I second this. Please look at other implementations.

Bart

> Konrad
>

