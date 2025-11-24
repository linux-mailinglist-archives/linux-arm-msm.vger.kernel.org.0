Return-Path: <linux-arm-msm+bounces-83105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D84C81948
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6B94348E9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553E131618F;
	Mon, 24 Nov 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="moihKQi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A380314D28
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001802; cv=none; b=X+K7uEtR+Dn3GL3JPbHMFKvLBNzHxqC9pZxO2RtsFOR1tzDscOe6MKJymt5l2jTiS6qjxFmddX5j5cZrZ1Woy9PyBwbc/xxuc6721KNXVHiraK3zGcnInZzbbRjgRJ9MaRp+d+KLaxDDDIk/tNuZpy/lRggRZ16Ex2DIanH3mkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001802; c=relaxed/simple;
	bh=6o9Xk8YbBV+yQureABx1GwT4sevwwW5O5AfMT3sLf5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9aEac/Me9TBmZA0lRUV8ymT+FbaiWC7TUlC+GZxpF+G7CfvBaUuPOfVSdlNsEXVzu2mgkDMQGeY2IeP07GA8vHwr9uLki2/Lj9ACGIb4PUdlIlkJPL4BfrkBRiXL/V4/jCtXJhKgKu5iNpDUtQ/6UtCLH5gsNywJu3dPBY+bGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=moihKQi3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5957befc880so593016e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764001798; x=1764606598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8SFzpOuhO5EV5iKn74UZD68ssvHanb60bdCcaWpzCo=;
        b=moihKQi368dAhAnrfE2d2pABuJRsmHiyRmqXWicMlfMtPJg+9g5UAD0kwpFIa4yEOU
         GzloKOJcfqVi7p/9Ei9p+KVYYceIPxD55J42fpiQUAUmHIkHJfKjDBHySohRg6+y2yk0
         tCaFS+uU6SbvarxU8FMN7Da7lxolDWWxT0RGPGF069bwu+pqHYuAOu0kfcoI79wNGNYr
         DAnDFJhSnX19HdGtD1c7tqphLezkbHm1loH/i3dISQP3jLw6Sm2rP8j686g8EB6TwIlp
         OXa4UuLkO1OpgZfXTHEzPKI9E/DTPxtQ5UBt96+1AtREu3/HtryqcyCpNOBAlh0RPJHT
         RppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764001798; x=1764606598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8SFzpOuhO5EV5iKn74UZD68ssvHanb60bdCcaWpzCo=;
        b=f1/5mJ6Sme+0NZiqeRxnKWYmrjEYTAw7c9E0yTmJWlYjMxzW2vYd28JZA2Odw7jXLi
         fSjyWIXLvMKoQINQd0fIJLo+nm1KsBVCGM16FiOsRpF0a/fMmgfSLl4kPRdTFQj8WEjR
         hgVzrFfIhnucSD/x9V+NVNytVpbekLcYGgNRRz4t/bPi/fmcAKXERrfCCBV5rrzkFkVF
         tCKaFinEFLlBKitZSH2yxKI7ATrsYmI0T0N3YarTrmyNavfDv//Nb9CBLm4wI8VzT7Fn
         uG3ihNCK0w6OxA7G56lcCf9ipNKUxKnsdhvbX2yJ2+nv26K/AblTkqddVIzzCAHK+gxZ
         4eXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNXpr3KXKOT1/Ll7B/UP7gLvYauL53V3zpojyAksfSLUybrJtPVOQuN7WwAqBVZ66YiuCUODNxKUpoWq2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2F/8xsE1JGufgrkIErWe8xkeOxyYQIhQfdbA37mZguG8x2wax
	scyAimQN6qi7bVM5x7HE6CO/47T7eGLi/EyqNQ258eAYTjslPa0xaVPkqBLu7m24ipM=
X-Gm-Gg: ASbGncu6lETAdO91zHde1gPuIXQaCFKITooGG+mNSCbvUSzB3wz/3af1ERcW/YnvRbi
	maBhPPra9ihDa4JQf7yYX0Q0UdhqFRhO5izlkctzrgM7hy+X33UY1wvyjs0YJVbs+t/yMiSMv6F
	OSdpcTbC4j5ay7xHyw9lSvT0TCj/eZYKc55HHkAN70XDkC0QBWsuPN/GDdxspJj1nbVs4qbfTT4
	MN8MvVbjPx/anpuJeOoJBCO+4pMEH2SHw4MzyDeKyo4xtk7BJItc3P3UEcghkin5+YK24umJMqP
	+6Mi5QqG0F6eqBg3+1T/nPB0pnUOuBqVtkICIJeRUV5shx19Dyb/Xcnv3GPfqkHytBg6obL3Kni
	yKpAx1dbeiqqKFoFeMy4IJE5eX1MLWF4JTpVxlseFSNVRmk3A0ve0mnffVsf5egnBy7kjoT+iIw
	/yN/9yBWizPNjGhInz3TDRBxeMdgy+SknaA2g0QKZ1hFyDHz3+dGpV5w==
X-Google-Smtp-Source: AGHT+IGZmldA/dcXthKfsFSI/Byy+Zk4BBl9hUAYfTjD9FcbnSy7TF6y62wi1hHTVinHRFed17AYiA==
X-Received: by 2002:a05:651c:31cd:b0:37b:926c:26f7 with SMTP id 38308e7fff4ca-37cdc1a7ba9mr17520421fa.2.1764001798220;
        Mon, 24 Nov 2025 08:29:58 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b63acbsm28357671fa.21.2025.11.24.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:29:57 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: cpufeature: Unrestrict ID_AA64MMFR1_EL1 bit assignments
Date: Mon, 24 Nov 2025 18:29:55 +0200
Message-ID: <20251124162955.3616314-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears that 4 out of 8 Qualcomm SM8450 SoC cores do not generate
an SError interrupt due to an External abort on a speculative read,
and it is reported as a failed sanity check on boot:

    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU4: 0x00000010212122
    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU5: 0x0000001021212
    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU6: 0x00000010212122
    CPU features: SANITY CHECK: Unexpected variation in SYS_ID_AA64MMFR1_EL1. Boot CPU: 0x00000011212122, CPU7: 0x00000010212122

Due to the failed sanity check the kernel is marked as tainted in runtime:

    Tainted: [S]=CPU_OUT_OF_SPEC

Unrestrict the ID_AA64MMFR1_EL1 SpecSEI bits, since apparently it's
a supported option at least on this heterogeneous SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5ed401ff79e3..df562b0f42af 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -472,7 +472,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr1[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_ETS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_TWED_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_XNX_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64MMFR1_EL1_SpecSEI_SHIFT, 4, 0),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_HIGHER_SAFE, ID_AA64MMFR1_EL1_SpecSEI_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_PAN_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_LO_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_EL1_HPDS_SHIFT, 4, 0),
-- 
2.49.0


