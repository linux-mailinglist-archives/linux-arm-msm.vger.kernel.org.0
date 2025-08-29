Return-Path: <linux-arm-msm+bounces-71255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A015B3C127
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 18:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9E527B750F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372993101C5;
	Fri, 29 Aug 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3++3ncM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20B225416
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 16:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486240; cv=none; b=MiOgAGAEt3sw0jvyeRs0B24iFY4YfWLqMQVaqnZ197eL6AjUShdGOP24eRZ134+BPmNUmaSObXUop/r8Cpd6NZG1PBCpUl8qt9WZ6hCLu75Fp1C429Xsuc5hjDFf0vnkTELz5fHe3yRwEqfPmkaLzQRAS0tiHJOYWnXkOCzosSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486240; c=relaxed/simple;
	bh=E827slSMyEXIP3Og8ZPNsIaUKvkZDhLHtnvmu1k8kgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4JzixPIqcq8/givXtoFarRbZYQb4d6Rc9A2prfl2wXCT6vnlWA3inUq6l6U7H1ooLmyih/4qyiz+cnuVKkya3rhqRigVIIPiBDHikax2Ba4CqxaKjwEvhri2WG2zAZ9BeK8n1RDCpU9MsRrKw0Kl8XDBmGvbSll+BD7LPshZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3++3ncM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ceb830dd58so933059f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 09:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756486237; x=1757091037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsFZBQJQAIvZJfF34HPCQsJUYySIMV0W2zYPfupSo7A=;
        b=F3++3ncMHoJlCSabWK7plIIoUraGUMWIOlXzpnCo4we+5EHzEyLyC89JCx8lsK/wBk
         ISOYPzZWDgjNdPI1BVnfjACkmnLS4iOByboPpmUoB86gjG2ppf+GxsUCXud42NF1/Tjh
         IM6IsX8FYXQiDldzbEbSbVv1DYNWN0J5+oGf/ckxwAKTH/A+H16y3GM24/Ii05VLSUuf
         V84YtT8Hix1EXJcOEAEtBfqlhr0Pnn/LPIwjCiHqqfPk8gfYfQZRH2LFrXA8SBMmX1dC
         Wub+7Ja1oe+B44zDpmOL6LabVWEqJE0KJ1R2bDKH12RxQvsHaVzbTj6GWejCWI2uJD07
         J5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756486237; x=1757091037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsFZBQJQAIvZJfF34HPCQsJUYySIMV0W2zYPfupSo7A=;
        b=ta2e2UvB0f3ySdn8fHinpZPUQ0Fp5FWepjPEk8q0o/Xjdx95pWQFehp5L4F6lUASgV
         vL7lyqHoRL80Wrzreh8mtgcsdrRj0PAUbQCvaHt9bd8dBEYWB1Z5FyCpKSk6dr2NF7yn
         6qJwez0TBs5pAn2eeiVyssb4wLQHhc4otmsJtgnzmFK/R7DO+M5gwittEj4ecRoTVp/v
         V344+fc+m7/kwRj1gZFE7eaTuH7QOSV8SiyTWUF+tdhyJcbhwz42dCwo8/wsfdy8j+g1
         6cItArdHF22ZB5zFAN2ylHGIrw5oVW0PNB7W5MTFQO06vAvbw6yscZ8JFPdZxI30HRky
         /Rzg==
X-Gm-Message-State: AOJu0Yzvus/ihIgUNXCXNVUQ/R5Tc3sMI833jfhHxTbOB4j3co+mfUAl
	AYKiHi2Gyfv1PUgsZAb4Ce/BiwubK5bVcrZYqr1kbbbAnWNVBbH5TgimEgs5rA==
X-Gm-Gg: ASbGncvsLARJgjqtI059T2M9px1xXeCuWHWBwnaHDeKXNNOZWRTGdDCKBxvB940nvCY
	KycH5OBFgOy2YtbZ4ESunWmPHracqxYlf3aZP+qheVU84oQeWKCM+2ncalI55sn2vVmmakYqBfv
	IwD32Vawl+eBxzlQk3j3nTZNyy76lgzsfDIMCUORG34dCDPum0GQZBEIk/43+Jd17urxbYl00Eh
	3KQ04kYLHwMe0qc+tZUPENyaWX0PE20hZbUY9lOi2Kzt3Z6IAa1Y3BcW9aRJlSdmoOpRcsDddmw
	fvMRWHtCz4Fi00NXGMTAo5m5kscIC3JrnHdUjxV7zDUe1ih5v81M9P576A3oIkHFPv4CCHfjRYX
	FmMATH1FpR9JKUdO5HzIYjWqIE5I/YdWBNv24oKvsCDDW0fE=
X-Google-Smtp-Source: AGHT+IE4g/jMyzZ/INHXqzhTRgjeEwar8NJUP8jHUvddyUYpJLpweqpKrfi05z3PLfGEWRwl1WRm0g==
X-Received: by 2002:a05:6000:400b:b0:3c4:edc0:28ae with SMTP id ffacd0b85a97d-3cbb15c9db7mr10644186f8f.28.1756486236614;
        Fri, 29 Aug 2025 09:50:36 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7271cd01sm116188015e9.23.2025.08.29.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:50:36 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Petr Vorel <petr.vorel@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
Date: Fri, 29 Aug 2025 18:50:31 +0200
Message-ID: <20250829165031.110850-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_USB_EHCI_MSM was removed long time ago in v4.14-rc6
8b3f863033f9f ("usb: host: remove ehci-msm.c").

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm/configs/qcom_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ec52ccece0ca7..3de9d6c242dcb 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -187,7 +187,6 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_OTG=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MSM=y
 CONFIG_USB_ACM=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_CHIPIDEA=y
-- 
2.51.0


