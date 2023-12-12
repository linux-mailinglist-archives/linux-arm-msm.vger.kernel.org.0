Return-Path: <linux-arm-msm+bounces-4479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA580FA33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 23:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25BAC281616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 22:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADD1660F0;
	Tue, 12 Dec 2023 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ku9fYHnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9906CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 14:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702419711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IvIEyGhLX3zR8XVMbk2xgzCAlPgW6m04dxsYOaRvxs=;
	b=Ku9fYHnf1emIWJkfLpB1tL92COTMb0gNoqONv4MY69E+WWaLX4qGxWK4w5wzAPWmxE4cy7
	rzABceC3dlL+FG/lhlvmWq9VcLuxtyDPJ5+T8m2bKJCgPCGn64bVa1V2CzHPcmeeQxrsUi
	mfNchSf9dIdO+9hhbfRxRI4sjgILg44=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-EDoWgzczNaKDWGjGxZjI9g-1; Tue, 12 Dec 2023 17:21:50 -0500
X-MC-Unique: EDoWgzczNaKDWGjGxZjI9g-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4257662f905so80179891cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 14:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702419710; x=1703024510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IvIEyGhLX3zR8XVMbk2xgzCAlPgW6m04dxsYOaRvxs=;
        b=oEPCxLUwRIvXN8B1Ve/f5rBLh+wDOXELCLhL/Kx7Xe+JKNLQ0awaE+NwwdaZsuI3QY
         IoCE7QcQBv0Zx2z3yzkqabfiTRjQAHKBpnOzrcF2FrisQpbuJYDsjCUh/4xteM0qN+HP
         KM0YBQ293Z1uzZ/Z5MAtLjChoBSeIBiaUaOswHSLWf45YCz4VeT6QX1Wdjl5c2XVMiK8
         eng6Xj9qpPKjR9IK2ltjgjBtNYTPR8hrMwi9qEBEQpDBHRoC1Z4yCMUkiKOD8zSCbX+D
         soij4m2baiOYkhlF14CmJfEvwEoVWm9JgwBF1p/tuwVPlC/OOOM6x0otp9xxdm4WR2Ox
         LsXQ==
X-Gm-Message-State: AOJu0Yy00mwLHZXOMEsBhqZnOfVZjfDNH/PPnxMNhWeabCvzd9vCVCiB
	uuTxv06hmSVUC+dt1qRSrTrbaj+ile7cJHMumDA1Bwo2bnit3Me/ijMjGlY5f83I2tEfWqG5TKu
	rv7W9X+4AOwBQFfAh0YMdDcI6EA==
X-Received: by 2002:a05:622a:1895:b0:425:a982:b5f5 with SMTP id v21-20020a05622a189500b00425a982b5f5mr10706482qtc.94.1702419710158;
        Tue, 12 Dec 2023 14:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECTJZMp8xy1O7K0wkag8Kqd2mbp3y/3RMkuyq4/BznjN3N6oXuue/c4cN/d7/GbsmXnoppzQ==
X-Received: by 2002:a05:622a:1895:b0:425:a982:b5f5 with SMTP id v21-20020a05622a189500b00425a982b5f5mr10706468qtc.94.1702419709818;
        Tue, 12 Dec 2023 14:21:49 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id t11-20020ac86a0b000000b00423b8a53641sm4400791qtr.29.2023.12.12.14.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:21:49 -0800 (PST)
Date: Tue, 12 Dec 2023 16:21:47 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: qcom: pmic_pdcharger_ulog: Search current
 directory for headers
Message-ID: <qwp3lspu2k4awtn36jebslxqqstmtkoey2a2wnh5pstxbqhko5@i3ktuplsnkir>
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
 <20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com>
 <320864f5-fdd2-4345-a0dd-b97bcf17f473@linaro.org>
 <k77ayy4xwlnghjefvw3yl4aenwyq272pezjaazx65bvdle37et@5fnbae4fxnjz>
 <zwzpbhcb4ggs3kdf72jvjlpe5cpa26vbjs6qw4nyedhcgwcrza@67in3h243yyx>
 <139f9af0-ca6a-4a58-ae18-79ef6fac47e3@linaro.org>
 <cea465e6-ff24-4552-b4f6-a0594ea9ea6c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cea465e6-ff24-4552-b4f6-a0594ea9ea6c@linaro.org>

On Tue, Dec 12, 2023 at 08:21:41PM +0100, Neil Armstrong wrote:
> On 12/12/2023 17:52, Neil Armstrong wrote:
> > On 12/12/2023 17:15, Andrew Halaney wrote:
> > > On Tue, Dec 12, 2023 at 09:54:48AM -0600, Andrew Halaney wrote:
> > > > On Tue, Dec 12, 2023 at 04:23:20PM +0100, Neil Armstrong wrote:
> > > > > Hi Andrew,
> > > > > 
> > > > > On 06/12/2023 00:05, Andrew Halaney wrote:
> > > > > > As specified in samples/trace_events/Makefile:
> > > > > > 
> > > > > >       If you include a trace header outside of include/trace/events
> > > > > >       then the file that does the #define CREATE_TRACE_POINTS must
> > > > > >       have that tracer file in its main search path. This is because
> > > > > >       define_trace.h will include it, and must be able to find it from
> > > > > >       the include/trace directory.
> > > > > > 
> > > > > > Without this the following compilation error is seen:
> > > > > > 
> > > > > >         CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
> > > > > >       In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
> > > > > >                        from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
> > > > > >       ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
> > > > > >          95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> > > > > >             |                                          ^
> > > > > >       compilation terminated.
> > > > > 
> > > > > I never experienced such error, and no CI even reported it, can you explain how you got this ?
> > > > 
> > > > To be honest, I am unsure why I'm experiencing this (and until I saw
> > > > another thread about it today I thought maybe I had screwed something
> > > > up!).
> > > > 
> > > > I just took it as an opportunity to try and read up on the tracing
> > > > infrastructure and sent this series. Definitely no expertise with the
> > > > in's and out's of tracing :)
> > > > 
> > > > I'm able to reproduce this on next-20231211:
> > > > 
> > > >      ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make mrproper
> > > >      <snip>
> > > >      ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make defconfig
> > > >      <snip>
> > > >      *** Default configuration is based on 'defconfig'
> > > >      #
> > > >      # configuration written to .config
> > > >      #
> > > 
> > > Realized I missed a step, actually enabling tracing and the driver at
> > > play here... but the result is the same.
> > > 
> > > Attached is a config where I hit this.
> > > 
> > > >      130 ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make drivers/soc/qcom/pmic_pdcharger_ulog.o
> > > >        HOSTCC  scripts/dtc/dtc.o
> > > >      <snip>
> > > >        CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
> > > >      In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
> > > >              from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
> > > >      ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
> > > >         95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> > > >      <snip>
> > > >      2 ahalaney@fedora ~/git/linux-next (git)-[b4/b4-stmmac-handle-mdio-enodev] %
> > > > 
> > > > I even tried it in a fedora container with the above build commands and
> > > > the following podman invocation (plus some package installs) and saw the error:
> > > > 
> > > >      podman run -it -v ~/git/linux-next:/linux-next:z quay.io/fedora/fedora:latest /bin/bash
> > > > 
> > > > So I'm unsure if it's a fedora package version thing (which I'm running on my host)
> > > > or something else... Once I saw it was sort of spelled out in the
> > > > examples I referenced here I just decided it was something needed
> > > > fixing, regardless of why I'm hitting it while others seem ok.
> > 
> > Interesting, I don't get the problem with the same tag, same .config but with gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu
> > 
> > I'll try with gcc 13.
> 
> Ok tried with ARM's arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu (https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads),
> and no error, and I even tried with https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.2.0/ and same no error...

Hmm. I'm unsure what's up. I tried with a debian container and a fresh
clone and still saw it :/

If you want, something like (swap docker for podman if that's your
thing): podman run -it debian:latest /bin/bash
should let you reproduce after cloning etc.

> 
> Neil
> 
> > 
> > Neil
> > 
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Neil
> > > > > 
> > > > > > 
> > > > > > Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> > > > > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > > > > ---
> > > > > >    drivers/soc/qcom/Makefile | 1 +
> > > > > >    1 file changed, 1 insertion(+)
> > > > > > 
> > > > > > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > > > > > index 110108e23669..05b3d54e8dc9 100644
> > > > > > --- a/drivers/soc/qcom/Makefile
> > > > > > +++ b/drivers/soc/qcom/Makefile
> > > > > > @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_PDR_HELPERS)    += pdr_interface.o
> > > > > >    obj-$(CONFIG_QCOM_PMIC_GLINK)    += pmic_glink.o
> > > > > >    obj-$(CONFIG_QCOM_PMIC_GLINK)    += pmic_glink_altmode.o
> > > > > >    obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)    += pmic_pdcharger_ulog.o
> > > > > > +CFLAGS_pmic_pdcharger_ulog.o    :=  -I$(src)
> > > > > >    obj-$(CONFIG_QCOM_QMI_HELPERS)    += qmi_helpers.o
> > > > > >    qmi_helpers-y    += qmi_encdec.o qmi_interface.o
> > > > > >    obj-$(CONFIG_QCOM_RAMP_CTRL)    += ramp_controller.o
> > > > > > 
> > > > > 
> > 
> 


