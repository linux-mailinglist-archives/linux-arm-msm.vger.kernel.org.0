Return-Path: <linux-arm-msm+bounces-42856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD69F86C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D6D5165C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1461F190A;
	Thu, 19 Dec 2024 21:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G8neMJF1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65AE1EE7D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642709; cv=none; b=K0ACjFFGgdG0kUubUa4T4UXYrxsGLCJkd79u7UY77BvhYoeF7aM2MbV6K+1SRWpt4APbP0t65RQzbL+aMU6o2+F8Xfz1dk/4uYiHrWx/ziVVg6VXVIw1SCKgXsKJzpSH7v+aRSM6VOyIlGDwTuPheAZO9E7MWLGukeuXjZ2TOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642709; c=relaxed/simple;
	bh=6zW654+ODmNYryMP6P51qNY+ZOjYRbe8urSo0sBWK08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxP6JkPFTkvauwKz3JnGASovSdQsDAUhhs4EPovfCSK6QFfU9XnbbDDM6KyRbmrUp00Zo+8YNTElPjOjzABppX0NKmok3TkgpFQhzkpjOAaHd6f70fXryJYlWtEs0+2TcuEnZvAVF+yOl6szhR4zZSydG52KGtgzLJS51bQektM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G8neMJF1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso884687a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734642707; x=1735247507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdqbLeOnG/CNjI8uFDgPDBupu1L0ikHkLJQEPoxLge8=;
        b=G8neMJF16p7tFDwJN2Fq4rKQ0ufX/L+aCNDnxqObaWl4R6RWies1GwZoRP+NU/VnjM
         E+houduuzA70aL/Zrg8FkVm+t8G2fEFNP51FczkDN98MamDXScSmkLwmKNSC/GF84m37
         d2pJHxTvc3AF+qOW1s2OpmHcJ+iQlZ+3hzfm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642707; x=1735247507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdqbLeOnG/CNjI8uFDgPDBupu1L0ikHkLJQEPoxLge8=;
        b=coBUFTPLgM8jU1U9wgmqrXvJoJqsnvv+i+X9y71dj/Apu2oKTeShVSdbY0jQiAHLw4
         J/0WzNafrq++W1SvPuG1ZFJwSd5C3vYVKZ6SEoNuos4ZQ1Z/G7hUUZhNyBiHn7oPzg2k
         fO8qqPbrXkl9CxdkijS5KWO7t0pYdY8QuCm0kGWshGufEleG/GgzN3RC3n2O5FeS+sGU
         Gr5h2ePepXGotXS/MeWP9D50QeU2Dulg/wdObup5Vgqj2YbqoBre5YVJwJ7r10FqgD86
         u8T1zYYej5YGAYvLp88bM+2NG45UvoaMhWCEmVI79jiPb2kzz0zj2KawGG2gMMqelx6n
         Bt+g==
X-Forwarded-Encrypted: i=1; AJvYcCUef3VEhpvacP0w60V1fhE8DoduCKC4DooYm3Pk6GbFMNECLYc/H3lf5krMR5amLjPPN7pMSZRNznhHjhwV@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcI5++w8r+g9zhSHA+pGteA5j9+4g31U3fovNhdZ/TxXd5AFI
	t+wDLEajhdcTH2vKX1LA+Z4pw2q5fso0/QftND4bFFjvPjHU8qtn/K2+zyvS6A==
X-Gm-Gg: ASbGncuqayc+5XD36hGiqdXAPbRH32/80V5lmqf3+3da1ab6bkDQbUjN0/S3i6Am8WK
	aN20mWhUw9gWxpYKjdTPNkS8KBWrtdS+U5L7RGpstbORvCb64wgwaxWNa0w9tK1EQfgseYCEsCl
	6pXdY4Gtxhw60YHjCDdk1MenOZcUTqR1LS4SlyWiS8Oxm7S2L2o7DHGKIghlqrWaXO7EBKWYMy4
	L6MlxmdAJ4uj5t6/p1B2XVShIhPpuhcJbJ4fxwPmW3NB+1cmTf5FUcbfgArFr4vwfsUw8wi1fLE
X-Google-Smtp-Source: AGHT+IG/mLE8f3nNqAfPDbUjzRxUJWzlsRtGsp6JD85mHJm8QntMhMFrw0g+6zwm/W9Dds8OjaF2Tg==
X-Received: by 2002:a17:90a:d88c:b0:2ee:b6c5:1de7 with SMTP id 98e67ed59e1d1-2f452deb516mr716393a91.2.1734642707254;
        Thu, 19 Dec 2024 13:11:47 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm1880887a91.13.2024.12.19.13.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:11:46 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
Date: Thu, 19 Dec 2024 13:11:10 -0800
Message-ID: <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
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

As tested on one example of a Qualcomm Kryo 5XX CPU [1] and one
example of a Qualcomm Kryo 6XX CPU [2], we don't need any extra MIDR
definitions for the cores in those processors. Add comments to make it
clear that these IDs weren't forgotten and just aren't needed.

[1] https://lore.kernel.org/r/l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq/
[2] https://lore.kernel.org/r/tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa/


Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New

 arch/arm64/include/asm/cputype.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index c8058f91a5bd..8782d4721f81 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -200,6 +200,16 @@
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
+
+/*
+ * NOTES:
+ * - Qualcomm Kryo 5XX Prime / Gold ID themselves as MIDR_CORTEX_A77
+ * - Qualcomm Kryo 5XX Silver IDs itself as MIDR_QCOM_KRYO_4XX_SILVER
+ * - Qualcomm Kryo 6XX Prime IDs itself as MIDR_CORTEX_X1
+ * - Qualcomm Kryo 6XX Gold IDs itself as ARM_CPU_PART_CORTEX_A78
+ * - Qualcomm Kryo 6XX Silver IDs itself as MIDR_CORTEX_A55
+ */
+
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
-- 
2.47.1.613.gc27f4b7a9f-goog


