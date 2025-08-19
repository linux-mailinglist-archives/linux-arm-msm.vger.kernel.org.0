Return-Path: <linux-arm-msm+bounces-69734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF82B2BFE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3A95E79B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7542C322DD0;
	Tue, 19 Aug 2025 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGUxFZCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6F319859
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601704; cv=none; b=JjqFWkLuHeAoCeHhJbC7NbNr80aRem++BaNPwtYHWJXXrCv0fyKMFsAwDndtxmRxUitJIfap7B8r3LXxaykdqkk4fzEtPZLBp3djzwPauqUk1XkqxKFWzozkZXNBToYhXN5wcKRnAM9Y/3qH9BrBdHKHsjMUPCgHeZGQXmPLHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601704; c=relaxed/simple;
	bh=8kLogn+zROvMNiYZTIrHFCqLRK5ZGsChFJjCJtBpXXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DG2MP8mfLyYd8imXofrU3JRLmYZxnC6UP7kK0gH2H/XIIexXDmNtu0i1HwL4igyplQ/YK/xxNX/WQc3MOYtRmxH1b6pcunVs642PJIghvnMX3Px3klMRLpGKAhO1O0HGrxH3G6d8TDttsV4z/rsM3JSUcEY3GR7HVdmI6Rcf4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AGUxFZCL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7aea37cso641568166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601701; x=1756206501; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpYVbUYUqcDwuuSlMJD7l7rhKZ+sIG5CmBcL7Jvhb3w=;
        b=AGUxFZCLvSJcmZ3Ru/CX8HeOwXl96Dl+v+Lfvq0Te5Yz1rQRQ7QKPPmbaHzDnb4c5p
         IxGD9WpP0F3fZUuoud8cpKcexrYOydgsKJVE1rqGEbfJocDMB/4R98S7gKETMaxq2nJB
         f366eiYRTYay+Vz1uP3oV0K8+Q+QZIhqbZRXVGiovdC0bGnmKjjea1ZAccCVTzt8WvRr
         drZgaQR0cMrZRrnXaU1w5nq3SmxLAOMDa9SGc0gpfmID+pt9kBPv1Wwhit7lJeyeTbtp
         ZaVYUWA1ikZC/PYcwov9nMSMWb7dfe670Q+B/2ClRpCwcceKTJdOfKyuob7XRNU7F5+U
         8ksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601701; x=1756206501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpYVbUYUqcDwuuSlMJD7l7rhKZ+sIG5CmBcL7Jvhb3w=;
        b=mR7YctyjhhDcRRbAxm3Bkztlk9y1wzzrN4xev5M0Mbw/mLpuUVERqxYfc9+Zx4yY0A
         8IebR4on3iSJKKo6HmDB1cGICvaEA72y8y6PT0Q3Lc497HqaE2B4OJcZ4QWSwcOqbXJi
         D6yoP4tq2NQM11hFTEUgSJ/dOHF7S9Z7MeAi7PELt4WTPuV3D0g9shMnsXOcDqZUDEg0
         upVSIwrUFakzko7bautPmk35b02gxLK4u9ryqbH3YGDLpPgTEqxjHc8bv8LBszv6inl/
         js6WWihqhUb4MlqxcSsPGkCzqAXBzKPN6CcrKK1C8VxQqXmzqwXiaM7dBwHKzhYd45IT
         V3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV/J3Xr08o5IVkggXoCgmPkMP+IPuy4UoX3KdyINyIe41sVl/pkVhZAYrq9azOdNbgWACSe3f5CRa7m6IxK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wlbYmqAtWbYr62hduX4hyVMVbTriqAAJri7n47SFGg1nNHGD
	nE4Nx86GcFrwG1IxP54c9vHT/P8DhOaPKkrwswTqNTscc4mT60M5L2ETM7bl1wc6C2Q=
X-Gm-Gg: ASbGnctnt+hnhI9Gch+Kz3nu6XEURnrS7t688xnIKazdOJIAkuIJHnXo7PigYWxdp21
	MtjtfI0p4FCWH305+gFQjlPy4fGUzVEVXfZ2CdIuicXZoBqtcGL5lD1gljL1VTWy0Ax4nepH20H
	tGRaS1cMtyxdDtXuS+P1IENOAXziFI9Eo0O45Vpqrfh5X4M3TfGCIBX+x4gMIexAxOYTDeHtQtH
	7k2ABSoqCo3t5WIQLiqPNEa1toRd5eLsUqpqxwT6nn2Z5fBhLCNG+tOEgvl4OtGYW7t8njkyB8Q
	6ia1W/4bkvK6yF4qYsjf5+UY9L0+iePpRcUpZN+RLbQ4X6gplAivzuJXatt/EZ3lTYiHJPrzF2K
	yFOhhea08kJj3B+CAOzdHb46PRhUT+SqHNajFGnXmaJ0ULGRR
X-Google-Smtp-Source: AGHT+IHuAC+MgtHl12YlBZLIPfcn6x8+4lFFpvTHdB+kHzp1vEXmZlY+oQp1EWwCza75NIX5i6Z6gQ==
X-Received: by 2002:a17:907:2d94:b0:af6:2f1d:a73f with SMTP id a640c23a62f3a-afddd243cf6mr200366066b.53.1755601700814;
        Tue, 19 Aug 2025 04:08:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/3] remoteproc: qcom_q6v5: Misc fixes to prepare for
 reusing the "lite" ADSP FW
Date: Tue, 19 Aug 2025 13:08:01 +0200
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABFbpGgC/x3LQQqAIBBA0avErBtQybSuEi3CpppFWiNEEN09a
 fn4/AcyCVOGvnpA6OLMKRbouoKwTXEl5LkYjDJWed2gHJICniHteLaXxYVvyth5b6bZOq06B+U
 9hP5Q1mF83w8c8LnAZwAAAA==
X-Change-ID: 20250814-rproc-qcom-q6v5-fixes-9882ad571097
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

On X1E, the boot firmware already loads a "lite" ADSP firmware that
provides essential functionality such as charging, battery status and USB-C
detection. Only the audio functionality is missing. Since the full ADSP
firmware is device-specific and needs to be manually copied by the user, it
would be useful if we could provide the basic functionality even without
having the full firmware present.

I have a working prototype for this that I will post soon. To keep that
series smaller, this series contains some misc fixes for minor issues
I noticed while working on this feature. The issues are present even
without my additional patches, so the fixes can be picked up independently.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (3):
      remoteproc: qcom_q6v5: Avoid disabling handover IRQ twice
      remoteproc: qcom_q6v5: Avoid handling handover twice
      remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on X1E

 drivers/remoteproc/qcom_q6v5.c     | 8 +++++---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-rproc-qcom-q6v5-fixes-9882ad571097

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


