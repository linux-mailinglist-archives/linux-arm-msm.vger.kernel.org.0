Return-Path: <linux-arm-msm+bounces-42854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FCB9F86C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71EC189621D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1DF1C1F37;
	Thu, 19 Dec 2024 21:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FyiwBbvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51A1B3940
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642704; cv=none; b=G0WCE6Caw51gb10wYJR3i57rGJrFFJH/RAY1wvx1RD3CN7lKTLVBAzSz1JDoPfAPiBj3Bl4YAFMDzVAY7ZbjQsPrJ/QEdeoqz+ps9OTcv+wRw+SskkZuc/enEgclGjXnp8S7/91IEYZnX8G1wfY0rIOMGwOS0t7geDsMxP1ciiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642704; c=relaxed/simple;
	bh=6lGcmf/XIYlYL9hHbM04QFiC0dujl2Ux44jn4NXrzkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUxLkxAXhZJBOTKuOUE+wuvlO0qBkoVIkHg+xfuoHKvZ9i2nulYiNaUMxviQVVicBOY+imbPqnlrArDaDiy/RWz+66YpI//vN8h40hjBk4kebo6thFkST8Y8DOrf2kh6QlIW4ztCblWr9pMwl5tueKcLK6r+41Jrn74Egat2j5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FyiwBbvZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso1090646a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734642702; x=1735247502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/sSS+VDQ56vpYCpkE7vAlH0OJ/9adGK5Yjw02tWP75g=;
        b=FyiwBbvZoZ1YBMe4oTlnLO90FJ+iR6noBaNYRGv/iJ0fUPVzyCDECz38Yb402IhVn1
         4QoyjmJM8GBQ+jbqUnnn/xRIKShexy4iQvKAXBTbnZJXXl29wdoCZan6kLmcYdeTeM2q
         CcU6oc5OjRUZiMbHO3ufP8msk+4jv0U5pbAF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642702; x=1735247502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sSS+VDQ56vpYCpkE7vAlH0OJ/9adGK5Yjw02tWP75g=;
        b=G6vTZZrxqESnO8iPV4wUTB4pdSxH8y7U5nidlRcX58zh29U2lo9pzrdMsaXif0EOgj
         VnoQiMVLHMS3wU7n1FljZV4wFTF0kjMYh+NC/1U+PPXB+8E62G/N9Wcdnv1gBm4gQfow
         nyGzJzl8+wQumX/3z3xzHw/CbO0UpwVdtND84sMM+II04Ah/j39AreNiqPLmm8CqxDLU
         YIjDfAPo76GAUz1xF/TfyOgLaYl1ecav9gmawi3jH4CCa2TJtJn5QG0YMEUvH5SGdIK5
         44Vsjy7qGLvgPZjmvGJaRFrf/0nv+GROmGbOc8f9rJFrjFKVSshgA+bE3wX2HyduNynw
         jk0w==
X-Forwarded-Encrypted: i=1; AJvYcCU68Hk/TpeRN3CrGPaDvEhozepAyuzu996IJC7978tEEQZD0cOgv5mFeiMwZiNA7SDCHBSRkXcEvVetkHwn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dk4X/Ch1UOWmbTm9DXtkXjecrUsH8tLvSwWam8H6LO4DLnLJ
	X3ziTPot/yPoq1P6DYS36zNM10uVHlHXH6P+t6xS5vPdf34nEeP8Y4IrYQl4ng==
X-Gm-Gg: ASbGncvyNtorxwX45YM5ZUtMpZttR5jyLos+R6cPv6niL61bQlrwv9aDXASMN9FfsP2
	MWffFk0ljVWH35a6wzO9aL2dwI+P/WSJX1ack05I0j/lwa9mYkdN+HVSpvw2Y1NCS7z7Wsn9fox
	FXpWZo3WyzyQqSEW0fb0lEE/+M+gOsNNcv7u5BG5yZAXpsx40JwDM4vZHAtVfqSnFcIPtBRNp0Y
	P/OZoy7OUetvxmMJVG+lvmDsylxfljTsyREZW44TxqfreqECMMl4kCPHeFZL7cjLa/zND8qjYJq
X-Google-Smtp-Source: AGHT+IGkhzCQPV8lorDMXfmjA7b3/juLtvk/PIrlhRwbN39eCpa4HiixAvg8reFLAOw8QF/aoxeEow==
X-Received: by 2002:a17:90b:2cc7:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2f452debcdamr740134a91.5.1734642702669;
        Thu, 19 Dec 2024 13:11:42 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c8461sm1880887a91.13.2024.12.19.13.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:11:41 -0800 (PST)
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
Subject: [PATCH v3 0/2] arm64: cputype: Add info about some Qualcomm Kryo cores
Date: Thu, 19 Dec 2024 13:11:08 -0800
Message-ID: <20241219211131.2389091-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series breaks off of my series that reworked Spectre BHB
mitigations. Originally I needed Qualcomm Kryo IDs because I was
adding "guesses" about their Spectre BHB mitigations. Now that the
Spectre BHB series no longer has guesses I don't need them there, but
these two patches still seem worth it to land on their own.

I've still called this series "v3" because the first patch was part of
the v1 and v2 of the previous series.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org

Changes in v3:
- arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores

Douglas Anderson (2):
  arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
  arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores

 arch/arm64/include/asm/cputype.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.47.1.613.gc27f4b7a9f-goog


