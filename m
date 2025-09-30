Return-Path: <linux-arm-msm+bounces-75596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39942BAD2ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 16:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEA70322189
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 14:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D83225761;
	Tue, 30 Sep 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uo99jEBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24E1D9A5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242756; cv=none; b=dKvkXeFRYk7mWCRZfRMfunnNPNCxK8yT1X2h6QcyuRxUt5rXed8+RuUzU27KOd9fdaXpKiRwIdWBOS85OG8VYoQt47OKJiIXOJDviesYILyOCZvozgiL56XB/7bMaYUbTkWD2t6G0ycJLU3OSLjnBU5WlsLsZ7bP0EQIMfKYgTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242756; c=relaxed/simple;
	bh=trtFIVQ7skIm+AJ2uSYPYV1+QuWRN+OapOx2C9yTkv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JhVkLMJ82KLLOPuE3zR+RvNgECiUnuUNX7RApwfApAZH4n9RF0QlJShYx7bpY5c0KsKgeYj9ZdvizRGuR30s+bieCIdmEbSBzIpzCdmQfHJij9sfoKnM9YojICMXkyrVrVbDplkrHSeAZ2kVTAtx8m1ftVNzNPU0G2u+7no1jFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uo99jEBb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3be330b1f5so631006366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242753; x=1759847553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XGzvIYD2K0dKmTD5NLqz2HHH1fk0VmQ6ZCiFWN/CWQ=;
        b=uo99jEBb//E6n4KlO+0QKBYQJb6XRQl1vJxtpInYFxpMOYsa3pKkSd0e8ODPCrFxUK
         u4LIUE3V1hdZ1PZwH2cL0ArZnkF7BeSj7SJ6ewamd7HMsFI1fw2po+VACQJVKNYSz/lE
         LBPv7pWLdJ1/SCv+6MhCuPbXWNjoKsd6M4YUtTOnjR1xcNMABIb8c2eozGP7a06XuA7R
         S8R/vC7/rWCmEYBnpDwhTyT2e+b/VmpowgGVLWnsSghpmREeTPnva89w/bGAkuPXI1P6
         MjYHbb6T7ita6H7ydohm5Bhn0yJLbF0hAfoySuAjtzeNFNHI+x2pvuZ2kYxZsfI/AcN1
         10gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242753; x=1759847553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XGzvIYD2K0dKmTD5NLqz2HHH1fk0VmQ6ZCiFWN/CWQ=;
        b=LQrRf3WoV3oqn/GwGNVfD8P/DgsJEpoAjKXIxIpzxYSuvonDpBchhmK0ZlLcAlxl/1
         5d4waGwQnzoUjTIitM+3CvbgzRwpeRu8t91YOuv8jB4V0SgJN7ODUV+s8j9Hih7JO31J
         1KTP9s4oHoPOg4LLf1jvlhJ6yJJZMP+Gp+Nr8MpLBbzklofEplaEfPmXaaxwHPafsoLg
         cJtQYZ4ttkna7CRFNYYCF+RzxA7QlD2kP95JVJ9WPPaQOXTaNySZVhsnIPkqho37eOLn
         /GJrqzBKpWwXkdk7213WrMBHXdnxXYSJzkqZKRrF6NM2omwMcQK9tO8zC+YBfA4INSRp
         k7fg==
X-Forwarded-Encrypted: i=1; AJvYcCUR91+gpbGnExcd9twbp2KUoaFEfyPT5Ye64al5gc7FgwSC95N52y1Tv1bRQ2dPNVldTeHx4GyaGZQ+osoL@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKM/hoHK16p29UBDLRXs4mDQ+UtAmxBi6d3gcEF1H8mmhiDxq
	0tjnBO13oiUmMCVM2FYdBkRJ0Ly82PI89HtkFHLeRssAUIlRsnTgmVEJF3JbZ2DNfTA=
X-Gm-Gg: ASbGncumbUR1oZhzvR4rp7sIdDtpltGctGJcvGqRJ05Qr583kvYbxQlksFXMxvwNwtd
	SrzmC49krl7cmP2T4CYlurGDtEuXv8MgsYW908Ji1N5H2tTFY+/u0cYzaDO0LUHpO2oGWr130eX
	wpQ7V8wdEnrB6WGSci7vxAgugYfH8BfHTp8GqARt+Lb05iNO9IdladVSKhRJdCI8O32bJxdo3rv
	9IOdezq4h3SghSa4NvJo1jR0LZgl4CzNgDou+QBgAxONwBTCodPHKoIACLhdG52VP9F18jwQ8k7
	Wdxp5/o8AE9O4v537NzcFfTi/FSFp9DU8F3c/mr1oTkvnKGbHBSjF+Ma9iFZPPcOKxUbLQsBmXn
	O4XteHeXeSPBsFWmw25+ov9vOo+BXK2fBXLsuQXseiIaUhrylAZPJR/GNyMBGk4YajkRlL71il2
	rXoi8m/AfoR6TRYcI4uDXzLvL2cuV0
X-Google-Smtp-Source: AGHT+IG8lOLegfuz9sdLqi92zTTH2vZJK6klR6+7kLs717bzPyf9qtgelOMxZ0NsFbtzUNaLIfkVwQ==
X-Received: by 2002:a17:907:d14:b0:b46:8bad:6960 with SMTP id a640c23a62f3a-b468bad6d6dmr66677666b.31.1759242753382;
        Tue, 30 Sep 2025 07:32:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/6] Further bringup of SHIFTphone 8
Date: Tue, 30 Sep 2025 16:32:18 +0200
Message-Id: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLp22gC/x2MSQqAMAwAv1JythBX1K+IB5dUc6klbUUo/t3ia
 ZjDTAJPwuRhVAmEbvZ82SxloWA7F3uQ5j07VFi1ONSorxBItIkSzsxV2B7RaTNQ1+DWIPYEuXV
 Chp//O83v+wGrc7SkZwAAAA==
X-Change-ID: 20250930-otter-further-bringup-f9e640c4008e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=943;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=trtFIVQ7skIm+AJ2uSYPYV1+QuWRN+OapOx2C9yTkv8=;
 b=qsGVrAkXP50Vge9B0Ma8EEFSVt6ayyjWaeKJa9SCVhcPnmY/baNqhqIzUOMWmIbK4rz7P3d/T
 7qL/hYgE3JQBqzQ5/ScU7vwrY2Q6i2+N8g4TaFEEZH7Zg0usT7M/IJ+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add some cleanups and fixes to shift-otter, and enable flash LED, RGB
LED and Venus.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Alexander Martinz (4):
      arm64: dts: qcom: qcm6490-shift-otter: Fix sorting and indentation
      arm64: dts: qcom: qcm6490-shift-otter: Remove thermal zone polling delays
      arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
      arm64: dts: qcom: qcm6490-shift-otter: Enable venus node

Casey Connolly (1):
      arm64: dts: qcom: qcm6490-shift-otter: Enable flash LED

Luca Weiss (1):
      arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED

 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 75 ++++++++++++++++++++----
 1 file changed, 63 insertions(+), 12 deletions(-)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20250930-otter-further-bringup-f9e640c4008e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


