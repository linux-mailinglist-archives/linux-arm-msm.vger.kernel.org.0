Return-Path: <linux-arm-msm+bounces-18278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A610B8AE138
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 11:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62167283CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 09:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F75914A;
	Tue, 23 Apr 2024 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYrLh8zr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFCA51016
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713865423; cv=none; b=iFTbCF4vNDO2oi/35C/k0CDuof4kgQtm4rpQMsK7b4cMvpTfaIOnmJJBLDCob3iWOWNrGGvnVw/3XFSWnb1mco9hnTmtHa9Ttq12EwgQwXb0vAnkMfMKNXH5gung4OAhvfBwSeJrvJurr9XfDOBl9q/50Cl2RkX2jBXrzXemii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713865423; c=relaxed/simple;
	bh=62j+EaDZGmKSJ/ZmXQ14vFQq/dVXxeP9NQw5VKbV/eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxK5VDtVhi5+bX8Bqge4ONOiRQeycBWVEDnHrIukJWLpbihSS3snW3FZDemlSjnbjWApk52n2xXSd/G22iWFEbqhw8M2Ryhkeq+YE8EUOYXiTwiPEsE8vSSjF5A7eCwweIMmoUTQNdlYOo1jC0xV3haS1PyxkclLb2cl45ljIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYrLh8zr; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de466c64161so5711043276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713865421; x=1714470221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v09KomcfFbdOPV04BK4fGQ6GAZ/FF29atY+7I1qWRJo=;
        b=hYrLh8zrq6DnxeW0p7KH+JsXfTez4MeGS0ZZgCw/atsiMPegYM2bfBNvNlcB7zfHcV
         DGzgVkIJfa7ctNQRVXUeCA74ZNGJgb7IpQNKRNeBmL7iZEuZMRCOhhX9ZU/cQNHKQn76
         ZzAOBLDzoqzv0B3KvALt7zOVh0fOufirW/ckE89SsZSGsYo1C1KWOG1bvzzwyTkZhsJ1
         q1mJdoDhLfS69e6JNxDQbaTNXhrYoFA83qdMVGw8MKfIQqvTdxsf298e3dz5387wNwe6
         11ThjGduPABceo5TF0TC39/RJREIfXKs7q3PdpSOn+oCiVDOzfOuGptuWzBuO4U9tohi
         5tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713865421; x=1714470221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v09KomcfFbdOPV04BK4fGQ6GAZ/FF29atY+7I1qWRJo=;
        b=LoPLQrQ4Ty59TIhj26neXV2iov0inKAkWPV1x4LUt01qE4T7Cx1nXD0rxwSjhNS4S1
         pxQo/DmW5KmhIfYjTlHhQqj5laD3aUUEcAW0UotVf9NA61ffW8fUGcDVBAhxBzQoXfUF
         0v86vTIn7/2SwwNyd+DfcDHQ5uJzeA6QTML4kKp4B+sY3osTJX9YgyDHXAwuekxmjMP/
         Ag4yedeA3rvVmwW5BZplEs2psmOQGMbJI3GH3IsR+83Jh8gLide6La3Lf1+d7ENp3Tpo
         4CJ/xKOhSdYUDUaqw+64qfgn7rmZG2RoRe6xG5EQnZn5BQomx+zHh4JVEh4Z6CoQe9Ds
         c7AA==
X-Forwarded-Encrypted: i=1; AJvYcCXK1DHG4CoffxmgyYzlM2csCMtoI3wmy6eudeJMO79XxRCQnEMyaG3/WS/iDzAlEsv5/DeFyc9fdsIprkuUZp5Yc/Tm6gjeqTGucsChww==
X-Gm-Message-State: AOJu0YwSGTz/AV2AM566KDviade+eq8cg+DWCs1KBYB5tyxBFtv0IhTK
	OYyOkGjglFHtx75enq3sNBWN/d0BSPKM343q8TGayZvuUmgTcnGKstDBjzjJXqzSB8MWPNt3wQG
	V92KQhsVrKXEA91lQr4AKRZqyxh7L0TNpPaqq7g==
X-Google-Smtp-Source: AGHT+IHcV+ts/lHqB7dBh6qkAx21StGrO6iFsxNS9cYsY/so6/OMwXDw4787zyUYKXoOLI69V34IUJv4GE4trWJ+Sr0=
X-Received: by 2002:a25:ef10:0:b0:dcb:e462:6e10 with SMTP id
 g16-20020a25ef10000000b00dcbe4626e10mr12299827ybd.58.1713865421072; Tue, 23
 Apr 2024 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
 <20240422-qcom-pd-mapper-v6-3-f96957d01207@linaro.org> <CAKXuJqjguM8ndALdtB7KSBz54j+4_LzPsiJxKVHoLivNCr_aEg@mail.gmail.com>
In-Reply-To: <CAKXuJqjguM8ndALdtB7KSBz54j+4_LzPsiJxKVHoLivNCr_aEg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Apr 2024 12:43:31 +0300
Message-ID: <CAA8EJpphrTOfVy82oM_X88jcGSjSCsW33m0NndC=mtFE8w++Ng@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] soc: qcom: pdr: extract PDR message marshalling data
To: Steev Klimaszewski <steev@kali.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 at 01:21, Steev Klimaszewski <steev@kali.org> wrote:
>
> Hi Dmitry,
>
> On Mon, Apr 22, 2024 at 5:11=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The in-kernel PD mapper is going to use same message structures as the
> > QCOM_PDR_HELPERS module. Extract message marshalling data to separate
> > module that can be used by both PDR helpers and by PD mapper.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/soc/qcom/Kconfig        |   4 +
> >  drivers/soc/qcom/Makefile       |   1 +
> >  drivers/soc/qcom/pdr_internal.h | 306 ++------------------------------=
------
> >  drivers/soc/qcom/qcom_pdr_msg.c | 315 ++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 330 insertions(+), 296 deletions(-)
>
> <snip>
>
> > diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pd=
r_msg.c
> > new file mode 100644
> > index 000000000000..a8867e8b1319
> > --- /dev/null
> > +++ b/drivers/soc/qcom/qcom_pdr_msg.c

[skipped]

> >
> > --
> > 2.39.2
> >
> This is missing MODULE_LICENSE
>
> ERROR: modpost: missing MODULE_LICENSE() in drivers/soc/qcom/qcom_pdr_msg=
.o

Argh. Fine, fine. I'll switch to a modular kernel config.

--=20
With best wishes
Dmitry

