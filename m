Return-Path: <linux-arm-msm+bounces-19736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E518C33EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C6C01F21AB1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D468B2C189;
	Sat, 11 May 2024 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZQg8ESO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B11BF50
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464357; cv=none; b=hM8j0PumvkwKWd4qkI0u/Pmnwh2QrlUmxtJOpoOQQP4EfPQ1mS/75Hqp+cTjsHfrifX5hw41m3JVTIDP52bPYUEbihbeFzICwB+J3XYIW+AI5Yn7v4qAEzkp2DLlAoQP5QYPVUBeHR5AEepoeSo70eLnlaBxHbMoPr/lDROrfAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464357; c=relaxed/simple;
	bh=pf2wv3ydNosYB79zDqNVaK/3uio46So1rqMJdd2CbYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFUTOyd+utokqqK/C2bfxSZb3sZ4DM2+jPAINCoJczIFt3A6Zn+cjf8Av41rX0VxDtCE5DBaTMYWrsT4M4cTPtpR+Zb9CxvVjxLJF+3GVjM8os9anlo7lcir4IU/4RwlA1WBr9xRpx0tVioSxLV+MDHS4/B5hHKExTteOI/Uj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZQg8ESO; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de61424f478so3080475276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464354; x=1716069154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3wjcDK8yOGJQ1DL5gQpu62cFA/q24UQrr/Gt9NCzNO4=;
        b=QZQg8ESOWSVHHYo4whpb7togbVaxNZW44I8prsjZkSHzoboiF0wKNZHaZCxKF8yNaA
         gPJ8baF3RvhPuDhLr2IEyPS2mg77sYVTSI5PnAd3hUhyJUsmWMeYMhivhh2c8d+bjetz
         F8MSGhvhxSesHVi9SOnmJvhEHptQQSyRH6lUjoujMRS7it6cCU+qiqX1QaEMSB9gNM1m
         90EiLyOTRvGIkQSEtsKRg/mzARoh0DkAdYiTpK8zkpaYA5Q8knXB1yhSp5b0/FbjNDuW
         HFp2gp1wEkpnSDCNlRFGpN1/JWYBjBsnyLKx8D7njMnMzOEGjx48f3GV1Nq/bx9xRvVX
         TugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464354; x=1716069154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wjcDK8yOGJQ1DL5gQpu62cFA/q24UQrr/Gt9NCzNO4=;
        b=IzYltvoWTUJvMUDng4hSGRC86wZnJyWvHKz0gg12Z0s8JrATFtbM/+I3/kyszACa7k
         YQ2dGIO8fEDNr4vV3xwfxbbWtsox/TraPe+lWr6F8eoGV75vmW1qmuIdP3r49UsvrK/b
         DoeAW4s/nijXwoDtK/ynBd5paeuFeDwnKT/TUxyIfGebuHlv8LSZezzirAvuWP53YXKB
         jtkKd4m+1q10P/V5Q0hyO4JCKgrejgfEvHgspGKjXSRCsEpMD69u3GcY/SgJ+HHCHGFd
         gg9DzQHoJmDvvHSVg7dgWOl2lwwk+HfblFzRNsX9Dcq4TMA3z//CrswOev1QhEEm3DEj
         H7RA==
X-Forwarded-Encrypted: i=1; AJvYcCVotC+nkHIrSMcBuPiUb8mXEgyN6SQe3IB/IlVJAVRc80hqAojlO9yJjM2MAEsWrJi8w7h+DUlJzLCqVlJ70DT4nUKNc+eP+h3oQSnD4w==
X-Gm-Message-State: AOJu0YxFfrp4gPXUhCcvvwDNpCR5EOhvJ9Xgo5Dgn9/rDXHtvYCtWJgS
	KzreJiPvRvKfMhvmjZJlsnzecSxwEQdwqSb0u/tWjF3X39F0lPUirlqsi01IR/L6MdpTpweAoVA
	WXiMOm0dZPaJceYRXiwlU8Ar+L3B5gv59GEN3yg==
X-Google-Smtp-Source: AGHT+IGb9x1QQvEQJcSjuug3d3oh9EExYyyZS6CzAQ25nIfZV+w1kS2+mukgZH63N+DVDr7JXiU7C6btr0dNzo9vHeo=
X-Received: by 2002:a05:6902:28b:b0:de0:f74b:25f3 with SMTP id
 3f1490d57ef6-dee4f3961dcmr5392619276.60.1715464354013; Sat, 11 May 2024
 14:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
 <20240424-qcom-pd-mapper-v7-1-05f7fc646e0f@linaro.org> <d71c677f-eff7-2bc4-4328-38e4d83e1115@quicinc.com>
In-Reply-To: <d71c677f-eff7-2bc4-4328-38e4d83e1115@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:52:23 +0300
Message-ID: <CAA8EJpoNQy682GDfWZpKz2McE=ho0YQXperE2Mi1Wk=OFkJb3g@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] soc: qcom: pdr: protect locator_addr with the main mutex
To: Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Apr 2024 at 22:30, Chris Lew <quic_clew@quicinc.com> wrote:
>
>
> On 4/24/2024 2:27 AM, Dmitry Baryshkov wrote:
> > If the service locator server is restarted fast enough, the PDR can
> > rewrite locator_addr fields concurrently. Protect them by placing
> > modification of those fields under the main pdr->lock.
> >
> > Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/soc/qcom/pdr_interface.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> > index a1b6a4081dea..19cfe4b41235 100644
> > --- a/drivers/soc/qcom/pdr_interface.c
> > +++ b/drivers/soc/qcom/pdr_interface.c
> > @@ -76,12 +76,12 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
> >                                             locator_hdl);
> >       struct pdr_service *pds;
> >
> > +     mutex_lock(&pdr->lock);
> >       /* Create a local client port for QMI communication */
> >       pdr->locator_addr.sq_family = AF_QIPCRTR;
> >       pdr->locator_addr.sq_node = svc->node;
> >       pdr->locator_addr.sq_port = svc->port;
> >
> > -     mutex_lock(&pdr->lock);
> >       pdr->locator_init_complete = true;
> >       mutex_unlock(&pdr->lock);
> >
> > @@ -104,10 +104,10 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
> >
> >       mutex_lock(&pdr->lock);
> >       pdr->locator_init_complete = false;
> > -     mutex_unlock(&pdr->lock);
> >
> >       pdr->locator_addr.sq_node = 0;
> >       pdr->locator_addr.sq_port = 0;
> > +     mutex_unlock(&pdr->lock);
> >   }
> >
> >   static const struct qmi_ops pdr_locator_ops = {
> >
>
> These two functions are provided as qmi_ops handlers in pdr_locator_ops.
> Aren't they serialized in the qmi handle's workqueue since it as an
> ordered_workqueue? Even in a fast pdr scenario I don't think we would
> see a race condition between these two functions.
>
> The other access these two functions do race against is in the
> pdr_notifier_work. I think you would need to protect locator_addr in
> pdr_get_domain_list since the qmi_send_request there uses
> 'pdr->locator_addr'.

Thanks, I missed it initially. I think I'd keep the rest of the
changes and expand the lock to cover pdr_get_domain_list().

>
> Thanks!
> Chris



-- 
With best wishes
Dmitry

