Return-Path: <linux-arm-msm+bounces-3494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A10268062AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 00:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B201B20DF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 23:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FE9405E2;
	Tue,  5 Dec 2023 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gr/ak7Rf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF33109
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 15:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701817517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9g0AqQltjx9HVi2PVmhYskrOtwbSdqnOJIb+sPsbDU=;
	b=Gr/ak7RfTzJXIw0ZA+ZvHAcw42TQe3kEaR3jft156DdaFQCRLEz2WHc7tNEAby92jmYzgh
	zp6rdPLy7QrBOgPMYLJIzsjNi3Q7LS3yI3rmTiV7/rh2AXNTClOXFJYzdOqA73UgvlOfq9
	yMEWl34USXC1XmaA4lY1ZyJZUKzBlUM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-Zx1pwjlXN0a1akbniN_-tw-1; Tue, 05 Dec 2023 18:05:13 -0500
X-MC-Unique: Zx1pwjlXN0a1akbniN_-tw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-423f4f5f586so2436141cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 15:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701817513; x=1702422313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9g0AqQltjx9HVi2PVmhYskrOtwbSdqnOJIb+sPsbDU=;
        b=axqoE6NsDCaUIB0pRRXFi0O9QsX6IAtikBHan24C/9aI8sk37x9lfDLp8NS0lFmKrC
         thmbIA9DdqBCSTV0xcx6EGtJ99VASEY8gyXG049gAdY3eKJ45RipLJP1lcp3xPyOD9eQ
         xSIa8WfXHBzq+mFcxYiBs7+DH9GeSw5ks8JSSF8UzR5ILXXMyzknY//8MSlrjmPRIid3
         jPOUZ5O5bin6j27JA8efMCXB636jAWujXeqXQrs/XFUOPuFECYsprZ7b/kTeI2+X8GCQ
         mahsrwoTbZZq/9P5j/MYJu0lyCzAiDkqiRpGv+iX/BboSnQ55wt22T+gMw9tzIfWM4SS
         kwqQ==
X-Gm-Message-State: AOJu0YzYwcW8vejj+n6RofMxu8pad9HTeOHblPXEFyM02CrBu72/dtxB
	Sy1o0s4mEuV/mJMi8Ophl/Ul2t8RSHYe+HetX7kil1suNa3LISg3sl3OhC5wjoeirFydclOq4gz
	gsFmpz2Rx8yI7EoyLSaadquouwA==
X-Received: by 2002:ac8:7d8c:0:b0:425:4043:5f1b with SMTP id c12-20020ac87d8c000000b0042540435f1bmr2507690qtd.89.1701817513291;
        Tue, 05 Dec 2023 15:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjtHacZ3EDCaJIyW6TtCHW6exbpgEh/YaVRvf97hFBjQsptkQMAzP6q1I3JbKbcJd7uc8Aqg==
X-Received: by 2002:ac8:7d8c:0:b0:425:4043:5f1b with SMTP id c12-20020ac87d8c000000b0042540435f1bmr2507679qtd.89.1701817513069;
        Tue, 05 Dec 2023 15:05:13 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id df15-20020a05622a0ecf00b00423da75b0f4sm5504430qtb.71.2023.12.05.15.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 15:05:11 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Tue, 05 Dec 2023 17:05:09 -0600
Subject: [PATCH 1/3] soc: qcom: pmic_pdcharger_ulog: Search current
 directory for headers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-pmicpdcharger-ulog-fixups-v1-1-71c95162cb84@redhat.com>
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
In-Reply-To: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.12.3

As specified in samples/trace_events/Makefile:

    If you include a trace header outside of include/trace/events
    then the file that does the #define CREATE_TRACE_POINTS must
    have that tracer file in its main search path. This is because
    define_trace.h will include it, and must be able to find it from
    the include/trace directory.

Without this the following compilation error is seen:

      CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
    In file included from drivers/soc/qcom/pmic_pdcharger_ulog.h:36,
                     from drivers/soc/qcom/pmic_pdcharger_ulog.c:15:
    ./include/trace/define_trace.h:95:42: fatal error: ./pmic_pdcharger_ulog.h: No such file or directory
       95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
          |                                          ^
    compilation terminated.

Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/soc/qcom/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 110108e23669..05b3d54e8dc9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
+CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o

-- 
2.43.0


