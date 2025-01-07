Return-Path: <linux-arm-msm+bounces-44202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC831A04AA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C1DA166D0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 20:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4818A1F63FC;
	Tue,  7 Jan 2025 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GeAuhMUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D51518C01E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280490; cv=none; b=gq+mavqj4tuNngxj6WNN/px20FAWTGbzS5EIQoDxkykmAmZ9VxOBZA1SVbKds1jJAVW15WIh7Bfyo41uy+bVJkKIOgApYkwLJC9SLdd6tRt5Pkf1BttBOq6GSUEKkfJXv4IZocpavxiAdBskEitL8Y2OTLNbiv9cC8JOdHor6BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280490; c=relaxed/simple;
	bh=sW+YtVvseWX81mmY8eksl64Kcr9nFrBv78jNK5VPeYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgOFPxUvGuI7aOms9ff4saIDR3mzkRQBAGRHy81bGajP3oBx4rlKp//VcH2H2guALkRC6F4wxiU1K9I+494L1M+piwLwZmx5o5Izeph1SCxUhdhBAkLghU8/G5vIby1rfjdxJlCjoaMI37jQQm7H/o+WYZ8vIU4rNAsXjzmDDcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GeAuhMUq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166f1e589cso18265405ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 12:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280488; x=1736885288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+ktxhUGYGa3yNjnjHMajfbM7+ExHdrh9QS4E9J5Jm8=;
        b=GeAuhMUqp9QAHOLEXkgeY1A97cT0nYDWpLt6np4RFmO6WAcRdxG9V/RrrjXNL2ofR0
         0DmZMESjRSTSsrT6u+EdMg+cWjfDTtmTw8iT72JpTk1Lbu8jCza45Gygtcdt4ubVc8Oe
         xhtOKom0W4UEan/4pUblTPX6aQpshiCr6tPFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280488; x=1736885288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+ktxhUGYGa3yNjnjHMajfbM7+ExHdrh9QS4E9J5Jm8=;
        b=vBgVqgQ68QV89jjJjaV6xjGhOW0cLk8uvcnzOBsDqMSG0VCZ46cU4l7qdY48JEpxlJ
         Acvl6FCEDWmnBjPyAm634sLykNtV+PzcDilXTLkd7AGQSdtmFG7++BfVQ1H4QYnPowoN
         IA3u5mBvRMLKuHmWH1f9xA8N1hSYSN6ZHT73tSDQmWuwAB0H6DkTew5/yPMLr67ZUvCW
         //eGPy5J9QUwsMZ8kt3k66J6DtkdqR6+G/1NB7atvz2uZrbp/fHXgVG4C4Xv7uLQ3q1e
         pSapfEkCvbn5iPcGQhuyAuD3CzcJ/1NA65fs98gT14rJ/RT6ktkIGpz6iDtmolPHuZmI
         XnVw==
X-Forwarded-Encrypted: i=1; AJvYcCUGOu3UtZOOj9jJ2F1NDbnvqXQvr9p+FXLmIiGykfk0OhldEbURsJupE7/KDmoLvftfRikRVMpHwEL6Rs5W@vger.kernel.org
X-Gm-Message-State: AOJu0YzvvOwbr2EE95InQBofXFtRnBLmgyDNjwIW7HbY4JMSQ12VWRYa
	rUZ2s6PdNRfwO9psXj1NtEiyQMtYXgVWbLTJlsOM7KcD8eFqw8aPloCcTmLqZw==
X-Gm-Gg: ASbGnctMhR8hokQNHdcQ0dhgY1LePMIhEmocKxBrfLb+OmedzLtoLEuiqrclxXMJZkb
	2PdZ2owQYyJ0MMD7Q532HvhvxeP4o0IoEgTUNdM1wNgfSpgpe0zJmLz6Mnjs6+l+Fx4spL4dmkT
	NGbsMcMSUl/B4vFZ3HKZXAQlSw+yu1QJtz7p8066KWEYIKJvz2zTqNdDJvwZwGAMNb5qdEVm7S6
	gE4eU5j677d3ZL+BvT0Oi1KdpMW1CjDvn7Qv4WckToHWCNk1kNTPaVTGZeekTCQe9x1TZaIFWLE
X-Google-Smtp-Source: AGHT+IFVBn3Ij7LbCn0txABKNdFr2EWfmGyAelW8kD1WcnsSLP1ApJp3uRCtKztZB6YW77FsGgN49g==
X-Received: by 2002:a17:902:f685:b0:216:5002:7341 with SMTP id d9443c01a7336-21a83fde2bcmr3869285ad.44.1736280487549;
        Tue, 07 Jan 2025 12:08:07 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:06 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Tue,  7 Jan 2025 12:05:57 -0800
Message-ID: <20250107200715.422172-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Recently I realized that a device with some Qualcomm Kryo 4xx cores
reported in `lscpu` that it was _not_ vulnerable to Spectre BHB. This
seemed unlikely to me.

I wrote up a patch series to attempt (with a lot of guesswork) to add
Qualcomm cores to the tables governing how the Spectre BHB mitigation
worked.

In response to that patch, Will suggested that I flip the mitigation
on its head and assume things are vulnerable until we find that
they're not [1]. This patch series _attempts_ to accomplish that.

In case it's not obvious, v2 of this patch series was pretty different
than v1 because it flips the logic on its head. Some of the patches
carried over, though.

v3 is yet more different, avoiding the guesses (and thus dropping
some patches) and also incorporating feedback from Julius in response
to v2.

v4 addresses minor feedback plus re-adds Qualcomm cores since I
managed to find a contact at Qualcomm to provide confirmation.

As a last caveat, I'll note that I am certainly no expert on
Spectre. Mostly I ended up here running `lscpu` on a device and
noticing that it thought that it wasn't affected by Spectre v2 when I
thought it was.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org
v3: https://lore.kernel.org/r/20241219205426.2275508-1-dianders@chromium.org

[1] https://lore.kernel.org/r/20241211213410.GB17486@willie-the-truck

Changes in v4:
- Re-added QCOM_KRYO_4XX_GOLD k24 patch after Qualcomm confirmed.
- Add MIDR_BRAHMA_B53 as safe.
- Get rid of `spectre_bhb_firmware_mitigated_list`.
- Re-added KRYO 2XX/3XX/4XX silver patch after Qualcomm confirmed.

Changes in v3:
- Removed QCOM_KRYO_4XX_GOLD k24 patch.
- Don't guess the mitigation; just report unknown cores as vulnerable.
- Restructure the code since is_spectre_bhb_affected() defaults to true
- Removed KRYO 2XX/3XX/4XX silver patch.
- arm64: cputype: Add MIDR_CORTEX_A76AE
- arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists

Changes in v2:
- Slight change to wording and notes of KRYO_4XX_GOLD patch
- arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
- arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list

Douglas Anderson (5):
  arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
    BHB
  arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe
    list
  arm64: cputype: Add MIDR_CORTEX_A76AE
  arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected()
    lists

 arch/arm64/include/asm/cputype.h |   2 +
 arch/arm64/include/asm/spectre.h |   1 -
 arch/arm64/kernel/proton-pack.c  | 218 +++++++++++++++++--------------
 3 files changed, 120 insertions(+), 101 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


