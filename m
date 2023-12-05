Return-Path: <linux-arm-msm+bounces-3496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A82008062BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 00:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 531761F211B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 23:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788EC405D8;
	Tue,  5 Dec 2023 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WVMlxF7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B35120
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 15:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701817816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zI2EQGzuy4/i38sKyTTPT4IeppHHa6FP6X9uU+Zh4lQ=;
	b=WVMlxF7GfcUGrnIugATVYJNl9u/bL7ewEK4eMa6YXkJqhSFgStrMFBMsCPY+NlWG0mXRbv
	iaFBA2i3pqqwNHejISzx8hh2fIwmY7ou5ytSsn1tdG9R52/3eEohGBK37IEoWABh4pvuRl
	kwbWl8WwmQLhbfWeq/sRqB27Vx6UA+s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-KPE9UeTtNDeojrkU6GQAzw-1; Tue, 05 Dec 2023 18:10:15 -0500
X-MC-Unique: KPE9UeTtNDeojrkU6GQAzw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4254d3c7d5dso1998531cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 15:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701817514; x=1702422314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zI2EQGzuy4/i38sKyTTPT4IeppHHa6FP6X9uU+Zh4lQ=;
        b=VARckVHEZCqsTNGqYnv4C8YHmDuAswAFbbsnK9h6YjVV9UKH7p2PbwBknEoTuBlx0K
         sBgm1WOgHWTw5Lapcju21wbP8mDZffmp0wwHWAwR0HIgoCsY4Tg2qYb9Emf+25Q9NDaj
         ts1nDxiKnBRBdOKaV7VG+zg2GxvnhX71hjTVaC9h4ntM/Loqwo52gcdCFZc+gdm6wcd9
         oQ+s9r+/GJRA9BHPXadY2itv10KSrrgkNOvOf1nCkWgel6R3kEYrQZbi74MvfbMY3K3G
         mjnfYUF1aKDvJ+fwNR8MnhHt+CYENMKdJri+R0GbFXxuFrOj6hz/ajBKMG1Lg4ix6xos
         WJVQ==
X-Gm-Message-State: AOJu0YyoJeFLO3v9yTQN6Yfx4tcMRechgYQqwpc0wOwecro+Q8S7wGOU
	PqvKJAI3Iyph1BGgsLcSMOzml22BfUICen3YCHMdHmszm6tbgDhK+VmKCxPN0RKjaVyLhOnTnNB
	nKiMLqllItSAdp7ZInXfg1zVAVA==
X-Received: by 2002:a05:622a:86:b0:425:4043:29f0 with SMTP id o6-20020a05622a008600b00425404329f0mr2448051qtw.107.1701817514113;
        Tue, 05 Dec 2023 15:05:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUSJuhRYxsGAPkig1kIfC+X2795y9odDvO7Hg/W6OVnwyPHPYbjuRFxQWNgF7b5jamRX1D4w==
X-Received: by 2002:a05:622a:86:b0:425:4043:29f0 with SMTP id o6-20020a05622a008600b00425404329f0mr2448032qtw.107.1701817513875;
        Tue, 05 Dec 2023 15:05:13 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id df15-20020a05622a0ecf00b00423da75b0f4sm5504430qtb.71.2023.12.05.15.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 15:05:13 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Tue, 05 Dec 2023 17:05:10 -0600
Subject: [PATCH 2/3] soc: qcom: pmic_pdcharger_ulog: Move TRACE_SYSTEM out
 of #if protection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-pmicpdcharger-ulog-fixups-v1-2-71c95162cb84@redhat.com>
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
In-Reply-To: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>
X-Mailer: b4 0.12.3

As specified in samples/trace_events/trace-events-sample.h:

    * Notice that TRACE_SYSTEM should be defined outside of #if
    * protection, just like TRACE_INCLUDE_FILE.

Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.h b/drivers/soc/qcom/pmic_pdcharger_ulog.h
index 9d5d9af4fbe4..152e3a6b5480 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.h
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.h
@@ -3,14 +3,14 @@
  * Copyright (c) 2023, Linaro Ltd
  */
 
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM pmic_pdcharger_ulog
+
 #if !defined(_TRACE_PMIC_PDCHARGER_ULOG_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_PMIC_PDCHARGER_ULOG_H
 
 #include <linux/tracepoint.h>
 
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM pmic_pdcharger_ulog
-
 TRACE_EVENT(pmic_pdcharger_ulog_msg,
 	TP_PROTO(char *msg),
 	TP_ARGS(msg),

-- 
2.43.0


