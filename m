Return-Path: <linux-arm-msm+bounces-3495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DF8062AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 00:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8392820DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 23:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7833FE53;
	Tue,  5 Dec 2023 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHzUkluf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90AED1B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 15:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701817518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KP09DeLuYz+Og6dlZ9z2Kp7En1LOdjS8AGaZ+gDsxfo=;
	b=BHzUklufT9IgonPTwvPnuIUSY+DCd2KsQS7XnPWIE6/Kxyg96mCfkLmKsyoosqViwnSom9
	FB0uLzWi+qAYXpOgm3C6opXngfdOma0YF9G2AivhFMLNbzFr6X+fcJlfuZoKz16J3IOASA
	RbUn1u4rn2cmTVx8KfMgw1ri+91m9Jk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-eT3_0_KXOMeZDYhNW61h8A-1; Tue, 05 Dec 2023 18:05:17 -0500
X-MC-Unique: eT3_0_KXOMeZDYhNW61h8A-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-423f4f5f586so2436841cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 15:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701817516; x=1702422316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KP09DeLuYz+Og6dlZ9z2Kp7En1LOdjS8AGaZ+gDsxfo=;
        b=Yr37GsucHoqY0GaN4xtsKv+8D2mrb2m+p70rjOAErZw61r2hzY6d00ReOHrPtT5KUT
         SxC/zNmu+5WBPHX91gPIEh3ezagqvJj8+pTgrBmX8KUbtFW5cdJUbVNztoHdGdOIurSz
         gcnP5aJ1naKb8NiKcFfuONrCcV53F4BZzwVB+pGsYPaXsqZ58/V8Nl4c/z4uuMd4HHG1
         RiJyeUaXvurqCtZRtBgTpTAJcWL3ckNjSKATZbyFVOF2Jl3ZuUlNkGSk0P3I1XLSSpxW
         6s7pfkpZatJj2LkO8gYI6gxOFZix+qxot0Vnsn2IOiainDgoHLPA4eTxrRrxq7gxfdvi
         ilYg==
X-Gm-Message-State: AOJu0YwzVr2ePtuWiUkwHKICi3cza3sEqDURAAlRv323RKLazHEyReZq
	2lTuTk5wzjkbdzlXLFYs6Gct+6qOXTAQTKLkB/lI3f2FW3SSUqLQvcZjgL5S9eC6zN3/fCa3mh3
	wBhg8nWQRyMX8wSkn+bprqKEYkFsjnmxjGQ==
X-Received: by 2002:a05:622a:152:b0:425:4043:5f33 with SMTP id v18-20020a05622a015200b0042540435f33mr2451720qtw.113.1701817516312;
        Tue, 05 Dec 2023 15:05:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoR/p1qLBUmIC26RDY0jJlDmdE0eOUVOk9yZxWq7JR6p+2pg3EgP1rRlHHZVJRhc5vwUPNdQ==
X-Received: by 2002:a05:622a:152:b0:425:4043:5f33 with SMTP id v18-20020a05622a015200b0042540435f33mr2451705qtw.113.1701817516092;
        Tue, 05 Dec 2023 15:05:16 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id df15-20020a05622a0ecf00b00423da75b0f4sm5504430qtb.71.2023.12.05.15.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 15:05:14 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Tue, 05 Dec 2023 17:05:11 -0600
Subject: [PATCH 3/3] soc: qcom: pmic_pdcharger_ulog: Fix hypothetical ulog
 request message endianess
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-pmicpdcharger-ulog-fixups-v1-3-71c95162cb84@redhat.com>
References: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
In-Reply-To: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.12.3

Sparse reports the following:

    % ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make C=2 W=1 drivers/soc/qcom/pmic_pdcharger_ulog.o
    ...
      CC      drivers/soc/qcom/pmic_pdcharger_ulog.o
      CHECK   drivers/soc/qcom/pmic_pdcharger_ulog.c
    drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34: warning: incorrect type in initializer (different base types)
    drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34:    expected restricted __le32 [usertype] owner
    drivers/soc/qcom/pmic_pdcharger_ulog.c:57:34:    got int
    drivers/soc/qcom/pmic_pdcharger_ulog.c:58:33: warning: incorrect type in initializer (different base types)
    drivers/soc/qcom/pmic_pdcharger_ulog.c:58:33:    expected restricted __le32 [usertype] type
    drivers/soc/qcom/pmic_pdcharger_ulog.c:58:33:    got int
    drivers/soc/qcom/pmic_pdcharger_ulog.c:59:35: warning: incorrect type in initializer (different base types)
    drivers/soc/qcom/pmic_pdcharger_ulog.c:59:35:    expected restricted __le32 [usertype] opcode
    drivers/soc/qcom/pmic_pdcharger_ulog.c:59:35:    got int

Let's deal with endianness conversion in the rare case this ever runs
on a big-endian machine (and to quiet down sparse for this file).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312060355.M0eJtq4X-lkp@intel.com/
Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.c b/drivers/soc/qcom/pmic_pdcharger_ulog.c
index f1aaacf05005..238cd38589dc 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.c
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.c
@@ -54,9 +54,9 @@ static int pmic_pdcharger_ulog_request(struct pmic_pdcharger_ulog *pg)
 {
 	struct get_ulog_req_msg req_msg = {
 		.hdr = {
-			.owner = MSG_OWNER_CHG_ULOG,
-			.type = MSG_TYPE_REQ_RESP,
-			.opcode = GET_CHG_ULOG_REQ
+			.owner = cpu_to_le32(MSG_OWNER_CHG_ULOG),
+			.type = cpu_to_le32(MSG_TYPE_REQ_RESP),
+			.opcode = cpu_to_le32(GET_CHG_ULOG_REQ)
 		},
 		.log_size = MAX_ULOG_SIZE
 	};

-- 
2.43.0


