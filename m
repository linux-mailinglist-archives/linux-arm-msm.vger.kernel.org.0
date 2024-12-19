Return-Path: <linux-arm-msm+bounces-42855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C919F86C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C5518974FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7FA1EE7A7;
	Thu, 19 Dec 2024 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kvxQaiN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872851DC9B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642707; cv=none; b=jqk1ThVAt1YreaUK2ylp2JOLMfJMebO8oNnvWZHQKh01oHetyB/927FsqbS5FlCtz3a0EZxhZMJDDMnxDa+7pI+/zfDwzdJmZSecoe/fDe+G4D/C+ZnnO2nafMLAcPUduKqKBLUdeQ9pymkrU1yHfAAOgL5VHNrPLuCViAPw6vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642707; c=relaxed/simple;
	bh=Q9yaIBO8kyBxOHtI0nnlecVbPK0hFrUVcbKsVKNNWgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o87lpl52/VnbVE8HZgvbZtI7U5TdryWrGetn/ZvSemVpTJjZ336U0MMFGAUxk582STgU/e+sFZh+9Bv86He8YPh6P+mqujRYNGwKxBK64JK+NlKLFqpv75UZ4UBl969dSgmt9wDo0EpkrG/RvIO5T83hHgNkoKms9cp8bGYHi6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kvxQaiN2; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so883714a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734642705; x=1735247505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFdap/sOPpq0KBRuIbSWSowsNeRO1eLNOr+oanM3LgM=;
        b=kvxQaiN2nK5ekB0UqndkM3UiOnD/r+uK8ASCWqKMLW2arBB+RCybpzvTZtIXxoxHME
         Y6EUeQrFCnEmwj7Fx38KgSMF2JSnOgQrNqptVHfZgyKiSAdjzz8+w11Kq1LkFQxvxxKG
         OXnSfUJ/58xbyE+k5Bj8noTz8OqUtBQcSLxPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642705; x=1735247505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFdap/sOPpq0KBRuIbSWSowsNeRO1eLNOr+oanM3LgM=;
        b=VLth1KtIweWIfs2Vm7I5EHMOyOLUip6Rb1XiI6a/WnfyehuDJE5V/84qplX7zHXhil
         xx4bzerZOSFfDW+Y8Y2HVlkrj7PNvVZoHesjrUaxcZJgmu7FSO6entjb8BUwW/Dd3/LW
         8hKj7v+GluPhOJf4EzF28BvcIVxlQMXtRukzK7nmKtocG5ZUTJA8tZGl+bmrmwQo5sQT
         FA7e6VhnCbH3mwnOs4znbGy5K7tJdDyCpWpsIRVTMgaDbwJ+B+CjbBQ/BKti2Al2vths
         K8eVH9HdhFSEOBHBmLfAQIUXywhpty5vwFnORnTvkWqBWb2nfIydSWupDmCjvkMcyIOQ
         t61Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQY5JgXpFAn+lGgv2eJ0on0MTCmIZPGOFEU5g7Uxme5t5Xga7XKe2NpdMuiZCocsaV/8CL2PaDxAg/G5RR@vger.kernel.org
X-Gm-Message-State: AOJu0YxnMqSTOE8PJL5x10oKsIDLJf69Hj31lM8/smi3DzAPSk3tgNj5
	zbi84Npo7VyFdtJw6CS2YFnEzFve+l0ImNoBdzoGO7fDjwC7OjXdq0oQZ4P1ZA==
X-Gm-Gg: ASbGnctCq4SspUwUeNoyHn0+xP5tGaLkiTHisrI7xPic/kGkktR291AdA1Wbi73OsvV
	ulzWUKX/QIForDrJdSSOAaMsLjlCrFcs7hU0MMlXKQ7I+uOZeQjsvtoa1b4C7GAj5cgMk8Yes9/
	PbJIS/lMGeDdbHP/BBEHxceKwnzVi5J5j775jqpfzQKEh/Ir13DKE4x75a2kvWWtuNcFgJ2hG+a
	cNq5SJKmpUw0WblP6XkJMYgyeyXm+7e2IfNV43ZA8nNYlNCB8zKdSZ8NoQRQ3VMOfBj/HZaSA7t
X-Google-Smtp-Source: AGHT+IGGlFCtPFGDg3TdCtB0hxPFvr8OnZ5HyqWHMKdJ0cGGUX0g5v4rfCRR8thJne3bzlkoFYIN3w==
X-Received: by 2002:a17:90b:2652:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f452f01cd4mr699326a91.33.1734642704943;
        Thu, 19 Dec 2024 13:11:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm1880887a91.13.2024.12.19.13.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:11:44 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Thu, 19 Dec 2024 13:11:09 -0800
Message-ID: <20241219131107.v3.1.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a definition for the Qualcomm Kryo 300-series Gold cores.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 488f8e751349..c8058f91a5bd 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -119,6 +119,7 @@
 #define QCOM_CPU_PART_KRYO		0x200
 #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
 #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
+#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
 #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
 #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
 #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
@@ -195,6 +196,7 @@
 #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
 #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
 #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
+#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
-- 
2.47.1.613.gc27f4b7a9f-goog


