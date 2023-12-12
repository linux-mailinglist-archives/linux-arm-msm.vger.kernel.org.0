Return-Path: <linux-arm-msm+bounces-4430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E980F18E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 16:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111E028171E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 15:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F72F76DD1;
	Tue, 12 Dec 2023 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gQihuANv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89336AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 07:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702396494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QcwGwIBGwy0nrsg+JvhlsAjgWrO4lyub+YaeXL8a/M8=;
	b=gQihuANv80cve7q5ZJxLDRr0inddopojcHa65yIivjBuj/HQvtMeSd4yLnGcYJUHqbTyXG
	+JtYIkrC+53pG8z/KCE6/O2+DM3BwAxPBPDckvQU+XsyIMvSXvmSTxy7AGp+/2OijskuMt
	yTfMujv0gptL67WxSJc9oYGlU394nMw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-8CdNXHuaN8m1q5g2OQKR1g-1; Tue, 12 Dec 2023 10:54:53 -0500
X-MC-Unique: 8CdNXHuaN8m1q5g2OQKR1g-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425a756c319so57276071cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 07:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702396492; x=1703001292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcwGwIBGwy0nrsg+JvhlsAjgWrO4lyub+YaeXL8a/M8=;
        b=cDAIhcLW8SH0NjV+oA5cSnb0X19ESK2upIgsv7w/JgIvcrUA/COsrdFG17+65vcjfj
         ildE7TuzcMxSttqS441AvVgixNBOeLKWHdSGny/dqWAAjERetTMifFrlZ/zNDf7dozW/
         BqvDTRtCiKvmjNxcMEOBuubUrW8w5J1x2NgTLbOV7HXKUV7ukimYLDQ7DFoeO7rF6glo
         EqVBRn+0vbPWAcgWL5aFl0/B4LCv29QtDUpnALeuXtJp/HYH9JQG4MKKBAn4BTA9Djk4
         8CGmnm6zgghXk7Zt46hwfZ3xIzdJkhwWm2Hxd2NTeRBer4CSOH73zBzWzic8tFBCmc5Z
         ECXA==
X-Gm-Message-State: AOJu0YzxSpH6ZH+xLs4MWtW/WGAf6bk9TVLz/XbHWJwqSqrZp51vNBz/
	cpf6GoPvZo0VICP4M3zMWbuOmehi4zIXzeQI/vzQ/QQA2ZJxhxeFxXO5nSX2EWiYZeNUh8mRaXD
	Dn2XeA9otHaqbs5+N8xQ5gzEx7l16vnlSag==
X-Received: by 2002:a05:622a:1b8e:b0:425:4043:7621 with SMTP id bp14-20020a05622a1b8e00b0042540437621mr9219964qtb.73.1702396492481;
        Tue, 12 Dec 2023 07:54:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlgCs+8vzMWF2YABEna2/x53mLtpw+foBe2AuUDEw7Su7i5zS6a3vwgeepPYI5GMIwH/6eqg==
X-Received: by 2002:a05:622a:1b8e:b0:425:4043:7621 with SMTP id bp14-20020a05622a1b8e00b0042540437621mr9219952qtb.73.1702396492128;
        Tue, 12 Dec 2023 07:54:52 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id m18-20020ac86892000000b00419801b1094sm4141016qtq.13.2023.12.12.07.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 07:54:51 -0800 (PST)
Date: Tue, 12 Dec 2023 09:54:48 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: qcom: pmic_pdcharger_ulog: Search current
 directory for headers
Message-ID: <k77ayy4xwlnghjefvw3yl4aenwyq272pezjaazx65bvdle37et@5fnbae4fxnjz>
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
 <20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com>
 <320864f5-fdd2-4345-a0dd-b97bcf17f473@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <320864f5-fdd2-4345-a0dd-b97bcf17f473@linaro.org>

On Tue, Dec 12, 2023 at 04:23:20PM +0100, Neil Armstrong wrote:
> Hi Andrew,
> 
> On 06/12/2023 00:05, Andrew Halaney wrote:
> > As specified in samples/trace_events/Makefile:
> > 
> >      If you include a trace header outside of include/trace/events
> >      then the file that does the #define CREATE_TRACE_POINTS must
> >      have that tracer file in its main search path. This is because
> >      define_trace.h will include it, and must be able to find it from
> >      the include/trace directory.
> > 
> > Without this the following compilation error is seen:
> > 
> >        CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
> >      In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
> >                       from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
> >      ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
> >         95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> >            |                                          ^
> >      compilation terminated.
> 
> I never experienced such error, and no CI even reported it, can you explain how you got this ?

To be honest, I am unsure why I'm experiencing this (and until I saw
another thread about it today I thought maybe I had screwed something
up!).

I just took it as an opportunity to try and read up on the tracing
infrastructure and sent this series. Definitely no expertise with the
in's and out's of tracing :)

I'm able to reproduce this on next-20231211:

    ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make mrproper
    <snip>
    ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make defconfig
    <snip>
    *** Default configuration is based on 'defconfig'
    #
    # configuration written to .config
    #
    130 ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make drivers/soc/qcom/pmic_pdcharger_ulog.o
      HOSTCC  scripts/dtc/dtc.o
    <snip>
      CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
    In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
		     from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
    ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
       95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
    <snip>
    2 ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] %

I even tried it in a fedora container with the above build commands and
the following podman invocation (plus some package installs) and saw the error:

    podman run -it -v ~/git/linux-next:/linux-next:z quay.io/fedora/fedora:latest /bin/bash

So I'm unsure if it's a fedora package version thing (which I'm running on my host)
or something else... Once I saw it was sort of spelled out in the
examples I referenced here I just decided it was something needed
fixing, regardless of why I'm hitting it while others seem ok.

> 
> Thanks,
> Neil
> 
> > 
> > Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> >   drivers/soc/qcom/Makefile | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > index 110108e23669..05b3d54e8dc9 100644
> > --- a/drivers/soc/qcom/Makefile
> > +++ b/drivers/soc/qcom/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
> >   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
> >   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
> >   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
> > +CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
> >   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
> >   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> >   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
> > 
> 


