Return-Path: <linux-arm-msm+bounces-62363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D702AE7C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A132817B967
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387212BF002;
	Wed, 25 Jun 2025 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AxIxFfLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4229E117
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842940; cv=none; b=Adfi9QODNVb0by82wGLQ+TLS+GK5YnvbkfrXf43TBkNj2accQCjMbFP51h3FcHb1265XzfD28gjgcioatqjtbLoCpd7sGIpbhVTZdHA11f7+enujdzoaidh9mixvH+Y0CE+WwT486pWTafRqkQjph97EKgBqg8j4ZJ8kBA6QvT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842940; c=relaxed/simple;
	bh=aptb8l/VFgrDIa1taJf+qbnb7dxQMxO15lxBXFXp/JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCyEhME2A7KVcJyowr4XWnxs0CInsTjpPmGBAqxhPLK14iL8CWpRpXDFvOz7SLC30ptfWYpBlIjMwOLtG0IcuoPz6kve+ul15pjX7LbBUkk0QphmGi963C5fTorLZORMAzCFBLdkt6wDNwN7FBLFKlJ2KIGy78hs+1utlU7OGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AxIxFfLh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so13542025a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842934; x=1751447734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwIs8jHWHcWsZJaUPIAgXJgATIpQ2CP4tFBNJHO+0qA=;
        b=AxIxFfLhqaBVNcEsMovwdSjZyPBvfK4mC2R29uvsNkBiai3RXq2fXr92V3nhljB2d0
         fxHjzSxj3yyUEI5yoE+NiTRMQOeGuvFDfgkHxCvGz7u/XwMh8f/9MQMvw8yaTS+pgIWJ
         bHlggVjfkYe5U9L1y63d4mVImWOTAFU1QRKX3h7UGWEM92DBUG1Wz9eG1SNX7WsH2+zn
         hxJ++EApVvp4ci7jEaHad0cskF3b0SeOHSZ/7TU+de6j1wyJc7h09GN0iJqkk4ZpASKl
         K+he53uxZxrWs0OSb3AGKgik6N/NeqZOXxEOs/fu6t8+DHmXGlY/B7fLtRBgj09zsxl0
         ZjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842934; x=1751447734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwIs8jHWHcWsZJaUPIAgXJgATIpQ2CP4tFBNJHO+0qA=;
        b=KnfkAAeKKFMtqhF/BuLXjry20KcHh0m+zMWrf2N7FFEIskF1JqV0uKskJ4YhkWyPwJ
         GUfKgNd8QtOr6EVeYF1vTEZA+Ez1WPo7tiJfwHlikj6Qn4TswxXlkaL0+qtMv/H66ovr
         HdATPLPL1IMnug0U5xVR9kWF5eaJ5IzgNoix7nv4df/Yzb7gPHl3ADxXJcNqBd7r5Ykk
         MvRLhR+4dgSX0c7WUOthD+yneXsLZduHZfgywXQ+Q72cotrxXV5WWeVN1mQEDjKIIPmn
         Vy6CWA9QWBFZCrUXvq3M/nVQILFSlSfr5ZSWNKXQaf1pnuWerMJaVEKW1xTk/4iM4GR3
         fspg==
X-Forwarded-Encrypted: i=1; AJvYcCXZensh5o7hQvWD5FZ+5zI9oiz3vWWuInK8WLlcOL4di5V8xmTq+qpMrvjaVABLjKF7VdF84w7ea2YnVIcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0idO1aWzyTXe/aBvNacCAXsVdzujxHi9tO6uG9T2eqZ1TckP
	Dt7H9hbm6d/cxLyAZ99T5xelEdoA1EQKz+mRDvTJOXP1ZbZ/MOjUVXMpT5sff7RtJEU=
X-Gm-Gg: ASbGnctnIjJ0MQRqfghISzwOE8h990tfIP1IL37bHjtpV5Yr2WWbnCjk8BWiua36dix
	92KPOua07xy7fFx6bE/Do/DY/Fll5Ub72UPj8wBb/g+gm9uanex4DdFUN7mRcffbajX19XD28FB
	dx4GRSU8Wh/yGTxnWCuaXJogXCDc/Y8h/+0TgX/lErPXVQtmTTqTZ5YiM5p6u8LI+oky53oEEAV
	ijjb/nCisXlWJ2qzCIagYTH0GgckQ6e4bTdm6NuYZviM8iT7iDVVtOOOCrdoc2FWY4+q74imfS9
	wH+mPN4U+eF9Gfym/KuD9jIEOzb+RhntuCr6TjEdBo0zUVK9WBBVBtlbp5kygpJivPj8G1I1WnN
	6O9C0GA9mr6Zu+jy59jh2HyGKBwk2INLs
X-Google-Smtp-Source: AGHT+IGdOTsde/4tV04iLagGS0l3+RiQ3PMit+y3rciCndku3bSKKpPUaXUjkwk7D8PSr50rM3IKfA==
X-Received: by 2002:a17:906:6a26:b0:ade:7bd:e0ec with SMTP id a640c23a62f3a-ae0bea4419fmr221717566b.56.1750842934235;
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for remoteprocs on SM7635
Date: Wed, 25 Jun 2025 11:15:23 +0200
Message-Id: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACu+W2gC/x3MSQqAMAxA0auUrC3UWutwFXHhEDULW0lEBPHuF
 pdv8f8Dgkwo0KoHGC8SiiEhzxRM2xBW1DQngzW2NN4aLXvli1Iz7vHEg+MkOnfNPHhnajfWkMK
 DcaH7n3b9+37qBYMiZAAAAA==
X-Change-ID: 20250620-sm7635-remoteprocs-149da64084b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=811;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aptb8l/VFgrDIa1taJf+qbnb7dxQMxO15lxBXFXp/JQ=;
 b=a9gifMn5WegpIaJv+574eOya7An88NzqdXtU9kaGYzj5mbG3qtUnqUI/wRQkhkdYLwt0qNIFR
 qh7YOyHiIY6CGQXFQOfDeiD5G0/t7SwH2GleWVuywJ6vXhuPdVp5FGY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: remoteproc: qcom,sm8350-pas: document SM7635 MPSS & WPSS
      dt-bindings: remoteproc: qcom,sm8550-pas: document SM7635 ADSP & CDSP
      remoteproc: qcom: pas: Add SM7635 remoteproc support

 .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 19 +++++++++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 24 ++++++++++++++
 3 files changed, 80 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-remoteprocs-149da64084b8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


