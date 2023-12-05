Return-Path: <linux-arm-msm+bounces-3493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C88062AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 00:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D822E1F2157D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 23:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F668405CD;
	Tue,  5 Dec 2023 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LdQmvOZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000411BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 15:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701817513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KjWIyI6YjcRFSiBIKVaUrOztwgBb5qiQH2MALmZ63dY=;
	b=LdQmvOZvqCbQ/Jk2GeRTUq5/+A8fqObAygdL+qED7DMIyCGJULNj6rVVv48BJmwgJiVaYP
	Upe3NNrElW3qkaJlR/55wy5XxDlRHxnhyV7bTyBvi4ju4lDFO2L5/pIjt49Ho/E+NWYZag
	VhRS3SVV2WIJfvCxlghCa5xa2RWBieI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-ub9WKPTaOOWJQeFNhGHqBg-1; Tue, 05 Dec 2023 18:05:11 -0500
X-MC-Unique: ub9WKPTaOOWJQeFNhGHqBg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-423d293392bso1995571cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 15:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701817511; x=1702422311;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjWIyI6YjcRFSiBIKVaUrOztwgBb5qiQH2MALmZ63dY=;
        b=JGa/9uFbydl+ZpoRTffxQTFFVy+Z3eXNqctcO59AbRJMkKxL1n1HU0AFWjMjXl3zwB
         R87jN38HSFMj6qJMyJ0DinaXxRmP+N32T5lsNc7Ye9LCNP2+7ryMELIWZTW0AlwWtdry
         gvwyRHNMUsMhVBcmL8eu00kMgGfRKVSHCL2bKOnDu0KQXKJ2/NYhQ4Mo27CUXNwFRXLy
         J9Q8cOGUYzzN9VPP2yhybH9RBT0mCXzNx6tYca0zycfeVSQIo2dg+c1LNP5SKkVECtP1
         G9ozFakfYxFXlzdmh2ww7e4Vp6SBEgxLs0wuqKUWgodBx+Fb03OiCjG/xO02adQdd6ie
         NfXg==
X-Gm-Message-State: AOJu0Yx1qwksC9sEuj4mb0bxS6MAuT5UcFNw9Hj8hlEH3Ra66zaz9PSR
	WGL0YJqwuYC8ejdBFMpTAoFssG4BI0h8hrtPNErOBvL3QWhKWKzED6j/phv0ySwc0KC1znI8D3h
	xS3T3YBgTlNxI+rmGOGUZbksk5w==
X-Received: by 2002:a05:622a:1a09:b0:425:4043:18a9 with SMTP id f9-20020a05622a1a0900b00425404318a9mr2407855qtb.92.1701817511403;
        Tue, 05 Dec 2023 15:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKEPs8ln58pkSxo7JdGiLTDZJzbF0Cn3n/cOeY6nbEFjytcYsjLySU6gzAJL3g6Di3uG7EtQ==
X-Received: by 2002:a05:622a:1a09:b0:425:4043:18a9 with SMTP id f9-20020a05622a1a0900b00425404318a9mr2407836qtb.92.1701817511184;
        Tue, 05 Dec 2023 15:05:11 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id df15-20020a05622a0ecf00b00423da75b0f4sm5504430qtb.71.2023.12.05.15.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 15:05:10 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 0/3] soc: qcom: pmic_pdcharger_ulog: Fix compilation
Date: Tue, 05 Dec 2023 17:05:08 -0600
Message-Id: <20231205-pmicpdcharger-ulog-fixups-v1-0-71c95162cb84@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSsb2UC/x2MSQqAMAwAvyI5G6g1HvQr4sEl1oBLSVEE8e8Gj
 8Mw80BiFU7QZA8oX5Lk2A2KPINx6ffAKJMxeOfLwrsK4yZjnMxpYMVzPQLOcp8xYU2Dm8nVTER
 gfVQ287/b7n0/Qopw/GsAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Halaney <ahalaney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.12.3

I ran into a compilation error on -next today, and while at it I ran
into a few other little things I wanted to squash.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
Andrew Halaney (3):
      soc: qcom: pmic_pdcharger_ulog: Search current directory for headers
      soc: qcom: pmic_pdcharger_ulog: Move TRACE_SYSTEM out of #if protection
      soc: qcom: pmic_pdcharger_ulog: Fix hypothetical ulog request message endianess

 drivers/soc/qcom/Makefile              | 1 +
 drivers/soc/qcom/pmic_pdcharger_ulog.c | 6 +++---
 drivers/soc/qcom/pmic_pdcharger_ulog.h | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)
---
base-commit: 0f5f12ac05f36f117e793656c3f560625e927f1b
change-id: 20231205-pmicpdcharger-ulog-fixups-94b0f409e444

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>


