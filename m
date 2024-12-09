Return-Path: <linux-arm-msm+bounces-41134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495399E9D55
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6435128373B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BD41607AA;
	Mon,  9 Dec 2024 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FCvoPW1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3187F1C5CAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766333; cv=none; b=hrU70Assy4etUotEgevZN0Sh1PtNQHbSIFNxhyRfYXj/1B4ExW/dXbcfKwf5bqe96YQx94ZgASacbDz6Vcl2ZeQVtylvDiBKaH7FpWI4xXM3v/OJqIa7lDL7S+aoZzk90Cg8ZnpAF3Q1iobSw3CQCeT3xyKqwyFB14c3TnQp3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766333; c=relaxed/simple;
	bh=/DhZ74IafBvOEaRNTiwePNlJ2TNuZ4F4qMfGRFUHrhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1dF/qsSTS2BCtLJdAGtxfWNDVjeYhD7TDCcsEqx+qCfvBqdBXXM2C8U9QQcRbXB8YrbMLXvHHazA07j6O4EckoylyCyp7+beHtCbFSQi7GB5HlgHqUP/e8xR3mApU+Yudo/g2E7r4sqGm8L8xmN3KhY+3a1jaHPUPYh1ml9ZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FCvoPW1b; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725dbdf380aso1476923b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766331; x=1734371131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGAjyEPuT0Sy+GKYtRpRtSgrFjpUx/s3n7hQod37S3k=;
        b=FCvoPW1bomEFPshuNDc2Aq2j/HMteADvyVAlpRa22ikY7+ReHAKY+AV+1tq/fynNgj
         57UswU99sOrYbcpKQyyybCjcUalIR4ni32WwDbDQfPkypD4O2bM9yZ4ch/ytx/0oLtMP
         Bwm+FL+7bC8vBJVwbrLQb2Wt8+yfE44Obzryg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766331; x=1734371131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGAjyEPuT0Sy+GKYtRpRtSgrFjpUx/s3n7hQod37S3k=;
        b=jJWNHeIb5ZExLTr6guRB2lym9n2NuYa8S/axRQzhPCP4F6CZRqSuUpQNZo3En1wbDq
         4eVdsX4bF8ALUyRJlIbtSnfxqgR5seEtR6Bkx3uowX8ai0FUbPPm6hPAu2jtJ6mSMLos
         i/sWvGlzu+d99CimwaMOF7Hy8LZhYQE9MdVwZsAuTL9qFwOUJ2cKkyXQxO6Y4J33NvP6
         Osp1M5VCpmpHO2a2DErWlGZ2x3nEKuuzmTyucd2NH9tHxnOGe6y0W78l8u57DRyg7CZu
         9/tE9i30jIir7Nb0vPvz7NRnQvqVnaq5L5pNeqZQpASzCDlJ3252s+RScMjwIQR6WHnT
         Eueg==
X-Forwarded-Encrypted: i=1; AJvYcCWgakibEObvei0pwidbevk+1oT/GJ9QFgz2Rhh+kcLJ/Rp9c3IMl0Nh5qORsdg8cJHPdHdBhv7MNITH/zf3@vger.kernel.org
X-Gm-Message-State: AOJu0YwGr8bhwYANEUyOeYXs3vmLkTEh8r4XlTod2yL9sjPJGjzToCe2
	PmD1Hwp8o+B01ZO2qMWA/osInzFQRcJw5yVUJsajkNL3TlBlF9MXueCJ7jUQZg==
X-Gm-Gg: ASbGncs5PaVDvPP46kOz+SfBbPIhHtnXMpUmtzmZZbrZj9a1MBowyydki8R7DH9Xnxu
	8/nHWJHzr0EXu92h1+stIgA8doawYfq/3Pdj4nSrJGypra3riD/Xgb4rJeQ9iA3XNl1cZOpa8RT
	yDXnOB9eRQ/10BHgiILai5kG/nWW3kOtipvL6DhAQYtWKbGCIWMNmJzZzICUUiaqf4uFdTOnZ/r
	lKDXIHbGYHeCU3myGVdDhZGGxX2W6pTkT0gGv/nI5ebes/is5mXYR/Zfmoi9sdacQg4oGpDbw==
X-Google-Smtp-Source: AGHT+IGIm2OSph5NAKJa8gdDHdlDAkZKg2Ze25JJ3panR0ayICXZnis7gphzZlRUR4Rf5fjAX/kMgw==
X-Received: by 2002:a05:6a20:3942:b0:1e1:aa24:2e58 with SMTP id adf61e73a8af0-1e1b1a79c30mr2366050637.7.1733766331535;
        Mon, 09 Dec 2024 09:45:31 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:31 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
Date: Mon,  9 Dec 2024 09:43:13 -0800
Message-ID: <20241209094310.3.I18e0288742871393228249a768e5d56ea65d93dc@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a definition for the Qualcomm Kryo 300-series Gold cores.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no idea if this is actually right and no way to test it, but it
fits the pattern of the other definitions. Someone from Qualcomm ought
to confirm this.

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
2.47.0.338.g60cca15819-goog


