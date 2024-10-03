Return-Path: <linux-arm-msm+bounces-33015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F698EEEC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 14:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45E71F224C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 12:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7596A170A15;
	Thu,  3 Oct 2024 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ulCG8y8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1716F827
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727957824; cv=none; b=cukF8/9DLfIR4Pt/t/SIQ/peYx8eBPFDgJDzvRL5rmq1UjGs34oruAlrwv5Nql3wcIwDTL2QYvammwHjYJCnyrvu+56OkQOe3x2P7wC+Pg+7tD/32jFDYZilhyDBo4UXqpZyR/gDcGqoSnieR62Wm3lv8JI901zxokhU3Lng1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727957824; c=relaxed/simple;
	bh=iLbPcRxEtJPSm6WwR2AAylqnDtPZyX67kcnHRVeCsKY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+uz3cqBZn4scH+vD5FZaFK37GgV9oRnxH4uEakrDtRToa8Lu/W4X/LOwjrDAFcpLDFJVoph3wxb26C7VaywjO/gr0vT9LzV8WidpD9DCGgy43qGFF/R2vCdwlxD91U6OqhsGlclOtoVsBUu4xgcBXIO8ZBocY5KEtlBb2nrpHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ulCG8y8X; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53991d05416so1059221e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727957821; x=1728562621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Xgns6e/Xls+vsY2WTmiAsJm7L6m3HTe+EinHLVG6k=;
        b=ulCG8y8Xa3WCvSAYki9RNQzdkXy8KC6sOBlTCqvWlj7DMMFOTYB6F+N382mshv839f
         EbcwD0uJ+xv2Thk5epjWDB1lneC5F3sWrOgWtvIF4RNHSFS3WackoBXvP42lq5GJCPCZ
         T6vJuif8RGonKc5NgCfiUPOun1TZ+h/G8x6u4DYJqumA9OlgZerQPjc709ZuSbDBfpoH
         cwMTUBjLgMvdSwCCRpZIF1B07jZ8mbxpgusrLu46ZbQWI1svbuR+xJf2+RPbsVFDCeBW
         iOqRRDAE0djhkayMwdBLWXzlSCCCbApfexNSqspNriKYWIgvz8pfgv2yEoQ2zv/5lOEa
         aUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957821; x=1728562621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a8Xgns6e/Xls+vsY2WTmiAsJm7L6m3HTe+EinHLVG6k=;
        b=ZrKeoZoJPb+bviMQDfX8LpTVTaO/MWQLiFNd8eSORzmj0lGOaNfvnVhSdRwZitetJk
         LTbtFAMWaiWs9zIOzGCjDnd60Y1nJv9h5gPreRmTqzWIuVObeAipjn/oeeUtIKhHleL7
         M5016wlTRHbyWSSlpQfqwE9XauAYwj7IztVY7JlKBuUW7fwUszEusSuR78noW3Fa3k0K
         Q2+wJJZuqYaK7g9kE3Dv3iU8m+eTlWbRr4Ql9FvwblSNGUCgDyG1b1XFcPyOXnQ+24cM
         OKElANn2u7UZjdLgJ+YQH3p8P7ZhdUoYqyo0Hd8zLTIQSAgJkA3k6GsgjR+yurEZTC0f
         3wJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXlqAz/5dzdsTSJ8Rt89YML2x+8CiHXOZBqAG7D7oMdc5ptYzFy/lfJRIYsn34i8kosZIYGkQ2+EK75xMx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx991EVrltOm0+PfO5W5Ubz0pyAIjHV0Fk/2DcoWuBii8xwTInb
	EerqooqpQs5ppqUDdttURdQtrNBKUmaRputSpMnjNoJclBC4z1Fnpr8h/ks08C/Dg+bTGff4Nho
	LKxYH98MtIPdhTk1+gWXKNBiCmBwSrYPjuDpW7Q==
X-Google-Smtp-Source: AGHT+IGkjVe3caGTw4UVZG+ryK//kErnPZ0WtjgJ016tHQGm93OqhkNIBMYr3Ma/23+G1gAIHvpBrXifkD6Mq7kj0xU=
X-Received: by 2002:a05:6512:ad2:b0:538:9e36:7b6a with SMTP id
 2adb3069b0e04-539a0678238mr5608105e87.32.1727957820581; Thu, 03 Oct 2024
 05:17:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Oct 2024 05:16:59 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CAMRc=Mc9jMe=hSXmcRLLX61abUjetCRZVeOK3G31vdx5JQNNMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930103041.49229-1-brgl@bgdev.pl> <20240930103041.49229-4-brgl@bgdev.pl>
 <Zv565olMDDGHyYVt@hovoldconsulting.com> <CAMRc=Mc9jMe=hSXmcRLLX61abUjetCRZVeOK3G31vdx5JQNNMQ@mail.gmail.com>
Date: Thu, 3 Oct 2024 05:16:59 -0700
Message-ID: <CAMRc=Mde8rGT+81ViTX0Qj2sDrD59dkLHeUZd1xkWO_H=QvC0Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc8280xp-x13s: model the PMU of
 the on-board wcn6855
To: Johan Hovold <johan@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Oct 2024 13:38:35 +0200, Bartosz Golaszewski <brgl@bgdev.pl> said=
:
> On Thu, Oct 3, 2024 at 1:07=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>>
>> Without this patch I'm seeing an indefinite probe deferral with
>> 6.12-rc1:
>>
>>         platform 1c00000.pcie:pcie@0:wifi@0: deferred probe pending: pci=
-pwrctl-pwrseq: Failed to get the power sequencer
>>
>> Can you please look into that and make sure that the existing DT
>> continues to work without such warnings.
>>
>
> Ah, dammit, I missed the fact that X13s already has this node defined
> so PCI pwrctl will consume it and try to get the power sequencer
> handle. I'm wondering how to tackle it though... It will most likely
> require some kind of a driver quirk where we check if we have the PMU
> node and if not, then don't try to set up power sequencing. Any other
> ideas?
>

This is untested but would it make sense?

diff --git a/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
b/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
index a23a4312574b..071ee77c763d 100644
--- a/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
+++ b/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Linaro Ltd.
  */

+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -87,7 +88,31 @@ static struct platform_driver pci_pwrctl_pwrseq_driver =
=3D {
 	},
 	.probe =3D pci_pwrctl_pwrseq_probe,
 };
-module_platform_driver(pci_pwrctl_pwrseq_driver);
+
+static int __init pci_pwrctl_pwrseq_init(void)
+{
+	/*
+	 * Old device trees for the Lenovo X13s have the "pci17cb,1103" node
+	 * defined but don't use power sequencing yet. If we register this
+	 * driver, it will match against this node and lead to emitting of
+	 * a warning in the kernel log when we cannot get the power sequencing
+	 * handle. Let's skip registering the platform driver if we're on X13s
+	 * but don't have the PMU node.
+	 */
+	if (of_machine_is_compatible("lenovo,thinkpad-x13s")) {
+		struct device_node *dn __free(device_node) =3D
+			of_find_compatible_node(NULL, NULL, "qcom,wcn6855-pmu");
+		if (!dn)
+			return 0;
+	}
+
+	return platform_driver_register(&pci_pwrctl_pwrseq_driver);
+}
+
+static void __exit pci_pwrctl_pwrseq_exit(void)
+{
+	platform_driver_unregister(&pci_pwrctl_pwrseq_driver);
+}

 MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
 MODULE_DESCRIPTION("Generic PCI Power Control module for power
sequenced devices");

X13s is the only platform that would use one of the compatibles supported b=
y
this driver before power sequencing so it should be a one-off quirk.

Bart

