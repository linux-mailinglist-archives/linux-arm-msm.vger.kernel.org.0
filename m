Return-Path: <linux-arm-msm+bounces-51141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 844AEA5DC31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505011886870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 12:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28775241109;
	Wed, 12 Mar 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tcbA6y9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A6314F117
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781116; cv=none; b=snQCCDAWHP1vqxNZhKFRBt4gNPTKAFDijvqBtcSRctfaMR0n/KrGNoSpy3DVdt4zkKsWdNq/12UHedgAjNbPMJxOdGzND+ozrNbJedYPnntbLf+eoNutvB4DHMVNbzk8zmUb5t30Dgf4FQ+oPvCBxy1zb909bIH0ZMNs9Lz0Vic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781116; c=relaxed/simple;
	bh=s18H99Qg8l+CBnR31Xn4OrMryEza5CUNK6AGHXXA8F8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AYqSrpzOf3vBkiTu/UrEUcv8iWopZs9Zs8uQohIlt6OpK6muTOIqxRwe3S3ZyfoQUGnhHSDEwCnBBnD+UY4xH8BSjeEr8A35u2jPnORooMbMDRSs9fzi41LewF2siXjMF00Q1UX7tlCtyd5qNM6TnWZj5+B0bIp4TMwoqLrfzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tcbA6y9K; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso32487695e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741781112; x=1742385912; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/qhahxkC87okdK8vzcBKv94aryasTsuguXF0TtMtHg=;
        b=tcbA6y9Ko0x5I1zla4WCuRnqVdAGHiWV56EmoqmAiTYOT3WuCwBoQ4VGtLPjuJVqGq
         0M0hUP4mow2RH2Uow/JT1qZUAQmsBHtMSw22Xuy5VMkriZx0YOBIFcxLarEODNswe+Cz
         Y5/ZhPNWNMU+GNIrHBvt/GZ3Ei0cMLdwM3TKcrXpa7Mfyt4sb5uAxUAJslZGyr4AYWBs
         5X8WojC0jVY73FZQokvzAUtgAmhADCZzl1LVzhZFahFn32SSRAj7/praH2Pf8apNrrnr
         kPdI5fBcRi5CVPWiz6b57AVlKygKD0quuj98FNaqvrArrOBtHiewcmDC95Tp7hCDxnEJ
         dPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781112; x=1742385912;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/qhahxkC87okdK8vzcBKv94aryasTsuguXF0TtMtHg=;
        b=U0D3Ik5dBA2SPVRhCAARsggS56VksafaNSckBpySFmc/O6M79ouf1TNo4LBpqal08O
         HscxxOTnk0/TG7cXy0VhlqfcQsndcAvvhiMIt7BmBqTsRUFWsd4GwmNlgdCrJkF6mO1h
         hBO0yTbHMAoYt7uLwTou1KXN1nW+Ic+YMrXvKFvxDDJ2PXzxVGlRhFkhzv6mPbdJoMY7
         iYTo12qjZAmC9gq04MaC5/oWx9UA9NjddADbJRSvBx7+Xm46B/CGPnfW8B0hmSA+/XqN
         Fr3+BK5KIzz3haCzgCYmxbGI4GvYQ2wbdD7I3xmi19PrPmMKs5yek2EIjdZ1pQBMuY56
         H9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVjLXSdosxAx5/X0sepEoe46dVYu3AtYfnBHnvVk/HW8d3uBWOaNN5whUBFK415h6qoOR+5F+xxW3B93DEn@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYIeF7iBDpt+sqnRiSVUCMoaw/dr+IFB/Ip5ZT5dO4ck71K0M
	AwA3MO1gw3XRz+vT7wnd3Ytyd+QvT6EJoM3XRnc4gwBncqmfaaeWa3kpon2kNvg=
X-Gm-Gg: ASbGncsGu7Sv55ALmKNEKxT4Fwk4dI/Baz5ZV3LTL50rUczZQ1u1eOap0z3M9CR2Z3+
	9WMoDPfhmV1zqmJB4gr975RtN4EIwEMT/8YMGXV2nNpmh7ou8mM8RMdjh6LN51olghWrljLP9L4
	1E1cLRYmZYZb2GHr2XqzftL/iCzwB9nO7/B9utJQm5DPdw1opojSNwklvJ4oXtcQX1MQtsPRBqf
	MmBMhOxSjXrGcgzd1VUPu/oq2hrLS1pK+bcFV+Pq26RrwNadPCuAI0kLEDj2HdmvnvLg5P8lU9+
	zK9r2Y3whyrVSgfxhu9tF3kt0H1uC1qFhrTS4/a/w1EDcuSsp8p8dEIcass/Z+0n8HVTsROzsgJ
	qM/dS9dtQWdTWC9rHaw==
X-Google-Smtp-Source: AGHT+IGC4xxP+Z3Fdvh6MXVOV92VRfrBtvnApHrB/c9+vstSSu3u4t5eJnb+88jYtJPAaZNUMHPC5w==
X-Received: by 2002:a05:6000:1542:b0:391:a43:8bb6 with SMTP id ffacd0b85a97d-39132d8cba3mr18453006f8f.33.1741781112389;
        Wed, 12 Mar 2025 05:05:12 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm20810608f8f.2.2025.03.12.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:05:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
Date: Wed, 12 Mar 2025 13:05:07 +0100
Message-Id: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN40WcC/22NQQ6CMBBFr0Jm7Zh2kEpceQ/DAsoAE6VtWkM0h
 LtbWLt8L/nvr5A4Cie4FStEXiSJdxnoVICdWjcySp8ZSFGpSdU4hArDLBbHl7gn9gFJm+5qVH3
 pmCHvQuRBPkfz0WSeJL19/B4Xi97tXqsUkflTWzQqZGOM7svaVGTvQysxTN7x2foZmm3bfnUqg
 Xy2AAAA
X-Change-ID: 20231208-fp5-pmic-glink-dp-216b76084bee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

This series adds all the necessary bits to enable DisplayPort-out over
USB-C on Fairphone 5.

There's currently a dt validation error with this, not quite sure how to
resolve this:

  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#

See also this mail plus replies:
* https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move adding "*-switch;" properties already in earlier patches
- Move wiring up SS USB & DP to SoC instead of being done in device
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com

---
Luca Weiss (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
 2 files changed, 104 insertions(+), 8 deletions(-)
---
base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
change-id: 20231208-fp5-pmic-glink-dp-216b76084bee

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


