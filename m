Return-Path: <linux-arm-msm+bounces-41131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375C9E9D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648D2166AAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9A433D1;
	Mon,  9 Dec 2024 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kZw4Wtol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D771ACED6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766328; cv=none; b=Ig8jszJZSRWSESIsgwExGFhKILdgSQRBsOIr1qqbV3E5SvBqIPzBNnOBVUbGaIy9rOPFKU+HZ9VVyI8isvtD62cFqI1V9BS3uAat+kMNMIdnY8Zmfy3QyllFCDKm53xr3IEUXWwd+FILjrCXtvdCZk7+BUMtjQ03MS7l2L4x8Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766328; c=relaxed/simple;
	bh=EFAjM7mDBisulQfKuxbXf4OGWVGV/SLLmMrXbHhA+MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZgGiR1oBYV9rSm014iUrWvewYiGWdfWaKj+oaB/6VQirNqI4fEyV1+hnDxStE39CPEHUhtcctM9JMqITYfM5JNFNowO0ZPI8R81V2JyMEfOt8XO3o2dssZlKHIoQ0qwzc+FspGuSbYsnlsLHnyG/qjzDErF8oDnN1XI7fL71ZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kZw4Wtol; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so1097171b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766325; x=1734371125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t8tuWm57sLbbvF9Is8tIuafHTVg4xWgJ7ckN7IcKD8=;
        b=kZw4WtolMyeon15XUATL+v02c7cxzJJvW8lTWyD+9IIqTdRl806308e2jCbqo7id71
         PNwPSAwiWOyfIrZY/sS4CWWSCp9jsUny7sSE3VsyNQOmy4MOTp2zsuuviusbf7SZSVLi
         x32Uk992Rv7m5J3W+26ohHSEsQn2f7CxNi6D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766325; x=1734371125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7t8tuWm57sLbbvF9Is8tIuafHTVg4xWgJ7ckN7IcKD8=;
        b=XkkMKezDCEkkPQdtd+ZcDHf54d+KQ9UtzxpoaHUpKBDLQNC+lFYSitF49KLpNvZowF
         +uxuczVTaxew6p2ejm6mUQaBEuo0MhW9oBQ/AvGK4LsOHtUD7PJb1Rfs5+kD2myGrbeE
         pqu3uhj5VyKWjH5c9horNcEhu81W7w4IeyRQW4B+li8xYsAHTK5nKxP8FzoIYU9C0uQB
         ngZ7WP/CQXJiF0BDrpThm7Pt8CXgbZaMI/smE/SoQlaZZ8y4gDvoPzbzk+OpSF0v6+1c
         CMJ/3IlrJKVULiJ5Q2V9jklliuYqRFqAYceuffRhtUpUCS6oWa/7S2iAvj3rUyk2KMlh
         2+JA==
X-Forwarded-Encrypted: i=1; AJvYcCVWP5usHC+oKt4MyH8cQkTVrJtP1+jZx/WpYBHQ0rMI/5WkHlYzW5DhnzpepvqRvrnsDDrwlzJPVlCn2zlB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Af+5CK0kZSBLWqPUats2R0D2Up/7aEO0Ei9g57Z7V8jezmNl
	mhWxpnJYF/bJ16i6P5GBrnwELVAZGH2dJ8YWl+HK2/mo9KqhA/EN3MQYCB34ow==
X-Gm-Gg: ASbGncsFxT2Ws0as8dXGBVCp+en3+86PzWfrFZeleHu+WXaUozQWQo2uuT/QJT5cfnu
	cO0rPve15N6b9ZWyeWXRn71tLXsjcBkW9+wuO7mgAu3x/j0I1bMPepjUufzbsksy/7qRJh4722x
	I6pd8JeJHBkRunrx1cSqbjgVWQs5DO98MCDrkGIMTRIe0xA/KKemWQf++oXjqTYBYTPiT/ApO+J
	P1k8HF1RCl0ljmfBxPtjQGniE9XPurUzOJnqqNB9JpSDwQdQjVvnbpDgSQoR9TQxInMrbTcIg==
X-Google-Smtp-Source: AGHT+IG6QqGCciHu5uQwZvPGklBSE2Qs6v3qJYcrRCySA8PDMw81hd4m8jVC00rw+U2ObdTU7EE9Fg==
X-Received: by 2002:a05:6a21:6d98:b0:1e1:ae4a:1d48 with SMTP id adf61e73a8af0-1e1ae4a217dmr3942870637.40.1733766325252;
        Mon, 09 Dec 2024 09:45:25 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:24 -0800 (PST)
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
Subject: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre mitigation lists
Date: Mon,  9 Dec 2024 09:43:10 -0800
Message-ID: <20241209174430.2904353-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Since Qualcomm CPUs are all derivatives of ARM cores they all have
unique MIDR values. This means that the tables listing necessary
Spectre mitigations need special entries for them. However, those
entries are not present and that means that some Spectre mitigations
are lacking for Qualcomm CPUs.

I've made an attempt at **GUESSING** what the right patches should be
to enable mitigations for Qualcomm CPUs. This is mostly me searching
the web to figure out what ARM cores various Qualcomm cores are based
off of.

These patches get more and more sketchy as the series progresses and I
have noted that the later patces DON'T EVEN COMPILE. I have included
them to make it obvious that I think these cores are affected even if
I don't have all the right information to mitigate them. Hopefully
Qualcomm can come and fix this mess for me.

I'll note that I am certainly no expert on Spectre. Mostly I ended up
here running `lscpu` on a device and noticing that it thought that it
wasn't affected by Spectre v2 when I thought it was.


Douglas Anderson (6):
  arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Add QCOM_KRYO_2XX_GOLD to the
    spectre_bhb_firmware_mitigated_list
  arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
  arm64: errata: Add QCOM_KRYO_3XX_GOLD to the
    spectre_bhb_firmware_mitigated_list
  arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the
    spectre_bhb_k32_list

 arch/arm64/include/asm/cputype.h | 2 ++
 arch/arm64/kernel/proton-pack.c  | 6 ++++++
 2 files changed, 8 insertions(+)

-- 
2.47.0.338.g60cca15819-goog


