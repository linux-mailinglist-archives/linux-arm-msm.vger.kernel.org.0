Return-Path: <linux-arm-msm+bounces-16705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F56589B49A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 01:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0830A1F213E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 23:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0115D45957;
	Sun,  7 Apr 2024 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndMjAsrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB14595A
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 23:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712532065; cv=none; b=izy5+qht0jRpBjgzQLk6tNqt+yXaS8hrSyaOIzoji9/dcW0oBFXNOit2Ytx8T2RRmViu6gqnxsUUeUjRkpcF4MxozxsrmcbZ922RwKDRVN1RsbN9JMc5WwJLL4KoIBJ6bE0Zan+2XzxxE3/Ue2j5uFfAuS2X+PuCyebkHbBk3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712532065; c=relaxed/simple;
	bh=IEUdhSdUgjvlpwgyNZ4LYZ53ohrtuhWv0xuI6yAt/Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8RsZFGvMr9IdfbYOScA3j+XGSN1xNX/rU8Iqh3phehmddLd2aS0KDVNG2H0V7jcqXrD7dHGHV9uC/UCf670A9neHeCu5kpiAmOoNxLVhFj6FMPqeW4BOJBuFDNJ7Oma9b8PwNQMsOl0nR745YeLQUs+zBP9ZsHLKT7OVbXv8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndMjAsrE; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso3942906276.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 16:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712532062; x=1713136862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=INbXO/IywSZ01YiAkrTP9R1xVbsCJ5iFlnEqYj1Y5vk=;
        b=ndMjAsrECXWAmZgbtG0r3ozpfc3A1FRAD9JE9VS6fME8jdMIvtuqW12bk95eHUaJMk
         WUXQdR8p8kC+wc6Q5uG+OeGZgFuVuo6wiB2vGRFCvIG70f++hydJa9Sgv2lOQ4j8A/af
         /sRQ5WXTJ4aSHzFYf5410skrgQuSdDN8q4T6diKgUgVxRyWnmbBXNr4wbnW0fSco2THD
         SuAoLSFTFtvFCo7Lh+g4xfDcPMGLJ9mlPLE/YnjoR+4S8idNxprk8M3sMK6S+c9fdlAt
         gZy0RwAwfs8MvR/Vx/HpQ6b6G1f9Dc0reCRjc+zAyDfRrPU0V4nnIB5eiIHsOq/v+mMe
         5gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712532062; x=1713136862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INbXO/IywSZ01YiAkrTP9R1xVbsCJ5iFlnEqYj1Y5vk=;
        b=HJeegz1n1wde/2e+LKzQmNsRkfJr+gDv3iVKV92/RstAmJ/DtCYc22nGDjQqSe1t4P
         Cb0cXvD9TzUqjfMja4UV2/+2yvzG7px0IVgXuPwI7QZdTQwQTpBrqK1MfHQOu64DW1ec
         /hM0LZkYGc/gFPQngLQi2u6bxzOgNoT5PKJ10/og2n1yDGbqQn+5mrl4KtwqZ0emq00X
         Bxa/CaBDtLus38rEHLAQxp4vRmAG+694G5EUaely3FRM362L2T0fPmuOH41+7JzO3zUH
         3yyuZ+UmYvMiD76hMZd2ejUFMucMWvbrsjQJgzkyiVriSPFJkweWaCLcSbNaWFb+ybj3
         7amQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJtgl3YTpl6R2fEa63r8pYpBs69sE64sFUy6F9aVwmc3oBicfwmAFcekD2I6i4Jm2Zzgwd9/f5ZavYjPvmzx20w/4hqa/S7FNpbwXrtg==
X-Gm-Message-State: AOJu0YwmJ0T8O0MVVFbTIJ8VfaAmiKg8eFCcZtad4+bJjbp5YoADYPTY
	VdDLvDZAj1IjSnRqyYagkpezL6fNkxRabu8iUMqBHWVvZiOlDnyjHNGaxehtWxYWsEiJw94ysl2
	UZVpys6gojrsqlWJx1qJ2PbeTGf8IGlOIHjdYLJUWnXGwUmoC
X-Google-Smtp-Source: AGHT+IHKeKGfyVbi9maVV/SY7AiWTEn72HZU+S1B2Tfmdk/Ax3bzposxH0M2cu2UKmCqztxkV5xh8Kf5NPufiZbcJYk=
X-Received: by 2002:a25:8042:0:b0:dc7:4067:9f85 with SMTP id
 a2-20020a258042000000b00dc740679f85mr5732736ybn.58.1712532062573; Sun, 07 Apr
 2024 16:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org> <k5lgwpkfjjt257aq4tlux7lcke7v2euiegqi5mvevygizlvwo7@jg7f3e5rymmk>
In-Reply-To: <k5lgwpkfjjt257aq4tlux7lcke7v2euiegqi5mvevygizlvwo7@jg7f3e5rymmk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 02:20:51 +0300
Message-ID: <CAA8EJppBwmR+whFCPKtFt9XY2HnKHNu7Ua0w_y3V2COtxo=ULA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 02:14, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Mar 11, 2024 at 05:34:03PM +0200, Dmitry Baryshkov wrote:
> > diff --git a/drivers/soc/qcom/qcom_pdm.c b/drivers/soc/qcom/qcom_pdm.c
> [..]
> > +int qcom_pdm_add_domains(const struct qcom_pdm_domain_data * const *data, size_t num_data)
> > +{
> > +     int ret;
> > +     int i;
> > +
> > +     mutex_lock(&qcom_pdm_mutex);
> > +
> > +     if (qcom_pdm_server_added) {
> > +             ret = qmi_del_server(&qcom_pdm_handle, SERVREG_QMI_SERVICE,
> > +                                  SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
>
> Sorry for the late reply.
>
> I met with the owners of the firmware side of this and we concluded that
> this will unfortunately not work.
>
> The typical case is that when the firmware comes up, it queries the
> information from the pd-mapper about itself, so this would obviously
> work just fine.
>
> Further more, if another core causes the server to be deleted and then
> re-added the firmware will wait for pd-mapper to come up. So this will
> work as well - as reported by Chris.
>
> There is however a not too uncommon case where the firmware on one
> remoteproc will inquiry about information of another remoteproc. One
> example is modem coming up, inquiring about where to find audio
> services. This inquiry will be performed once at firmware boot and
> decisions will be made based on the responses, no retries or updates.
>
> As such, starting pd-mapper with an incomplete "database" is
> unfortunately not supported.

Ack. Thanks for the info.

Xilin Wu has also reported a rare race condition seemingly between
pmic-glink and the pd-mapper.

I think I will rework the code to bring up the full database based on
the machine compatible.

>
> Regards,
> Bjorn





--
With best wishes
Dmitry

