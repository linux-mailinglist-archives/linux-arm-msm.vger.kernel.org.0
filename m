Return-Path: <linux-arm-msm+bounces-53209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF6A7B97F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 11:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C38F1897ED6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C211ACEC7;
	Fri,  4 Apr 2025 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nitsxd1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91B1A4E70
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757287; cv=none; b=rWwWBLmlxcNyzdpdmE1nOrjp2lo+KteVTm+xnaBG1EQ3zR+H0UtB4YOUKwqMKn0tMXdWi/HyQ0AyI3nw35hfLfpRqOryvaHlGWHap4xsZYDQmHXPghQLmemskcxsScWY7zvnVdp4FFsBgEW8nMo8688yXM5mKJXZ2HsenkKIsQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757287; c=relaxed/simple;
	bh=oMFXT7wDxJmhYbK2LVrzIZ9SDu54LMiMUroCgY/pOvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrlSVxLYna3oeIDgY2tNVOcOmrKf6P6MV1AEuVUONDl3pvoGdS1EwgM3kz+aEn4n8QqadBe9viGbFBZ+WaoHDjYqvQb7CoPcZ2ed0zDorpZxmWckqkKNDNFTl3QKuDBBzmsVLAWr05kwPahVt0bDLAgMqN38cYgIiPz2cmZqDto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nitsxd1G; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 58E2D3F84D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757273;
	bh=p2qZoCK71oV2fwf4XZQYjbzwqdq/m06Zg0K4kksLDZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=nitsxd1Gbcn1p8n+vDIuFV+68YGdE/0sVVv+2yBAX0Mim5RbhotQ0LcUk2N/eUCeQ
	 RvkMuNrITZl3uwLGR6X/xku7XsRZ/Vopqa2gkucyi0KK9f+ZPr47gj2eCsHefXq0Je
	 oeZobhjphmDzVi4XEhJTOY+dsqqx8B6PkJ/WFSiP0jlFEXAurPySj84TZY9R2fboPs
	 7LEg8jj/r2w8R0L4WoxptLoTpD9baSKiRHcueGoU1vtYUAez8HbzwOw3vbnYjLApN0
	 HTuEcQzzhDaAURI9HTsoBpFIWhLeN0cXCTMEZrwBXUfRxSrVMxEpZ22r3DmE/Muk51
	 SKHhavbMuxxkg==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so10449065e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 02:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757270; x=1744362070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2qZoCK71oV2fwf4XZQYjbzwqdq/m06Zg0K4kksLDZg=;
        b=i28kGGH9wef5dZC9IA5WQGEF1HoK7UhrYBmmNV++9ChRAS7gU3Js+POZQKR2cV0XDR
         k/9d/RLomH/0mjaIrYOXvfnv/UfeyR5j79fQfz4qjWvofO2w3DaszjWpGui+dCsk+eq5
         6FtjxMRXxq5penQQlYD2ZAEcDZzKG1Gpzsg9Ym27rYpYeW+mV4RPh2pDW4qa3vEFxMo4
         h0a2vYhDzEK95WWaE76vquyWHR/jaJ+lWwQ+rKQAr/A971gawfT8O+cizD5wOtrN8lEP
         FlPwtDeiQuWvQFRaRhvXNRGPylji3vFLiM+nutvGuehMP9Fuo5riDtz0ueT2qYBysZYS
         WTdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1hIuz9zE6uZE6jbObLcgG6t0jSQ3KUHFpLmUDzkISTynLjGA+I+YmkA1l/eBmiO9xHUMPSUDsrud1SbUj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzad4sv6wByjJtXYK4qBJD9JrWpIP5N9Kisy6GYBB+77mc9eyTL
	oujC0+Q/UkVdcxN0ouSPCEYEHPtv5uXvcOkJQa0cyt7BSEWuKVh38Q8Iby5ztRha2VDqcYkTq6i
	ncW3wCc+YfYYy2TTiiBanDOTNUozpR6JL8jOgwcwf84t9DoLmyQcKHHyuVtyN1m/rXbkrmAF8kc
	qKukk=
X-Gm-Gg: ASbGncuEwNwl+ptQdG2Gh0WbVXq5h2dR37bqyIX83jFJnaOTKZEefJ1pJqEKDzlvKuX
	MScoHeICb389qYtjZVrxB+8o8kL67vijnJdC6ZPaNj25KaDEHYRKkVWz7l7rjDKUGIpn+R9RqKp
	ckUjknPQKbN/9wKZPz4RR8HKpMVUOf/7CCHaPsylOl3zBzRC/tNXrqRUwjslUtBeOHN6VczbAZR
	+Fjr2dB7rHNWiPTyydv+Djj0RAaTI47eaEse6ZrCbJMKczFVOVdmTgt1YYUTo0CQ43ZHZpfKMDs
	noIqP6gxi9+Frh5xvsCPyhcCc7dODitcbldQKgKYCXmTNxjyhI842ApTStGb
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr15971925e9.2.1743757270371;
        Fri, 04 Apr 2025 02:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzljYwBBG2flhsp4g06fLXYGNWjZnWdtzlqJrb2YqtEnZEwXUq1n7mizwccKsgCu4tf7h/sA==
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr15971565e9.2.1743757270049;
        Fri, 04 Apr 2025 02:01:10 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794efesm44078085e9.28.2025.04.04.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:09 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] HP EliteBook Ultra G1q support
Date: Fri,  4 Apr 2025 11:01:05 +0200
Message-ID: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HP EliteBook Ultra G1q 14" AI laptop.

Based on HWINFO64 and APCI tables, it seems to be the same HW as the
HP OmniBook X 14.

This is the first time I'm fiddling with device trees so this is likely not
correct :-|

[1] https://www.hp.com/us-en/shop/pdp/hp-elitebook-ultra-14-inch-g1q-notebook-ai-pc
[2] https://github.com/aarch64-laptops/build/pull/135

Juerg Haefliger (3):
  arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create and include a dtsi
  arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook
    Ultra G1q
  dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  |   36 +
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
 .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 6 files changed, 1597 insertions(+), 1553 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtsi

-- 
2.43.0


