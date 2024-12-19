Return-Path: <linux-arm-msm+bounces-42849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A129F865D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F4477A3EAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA1E1B041E;
	Thu, 19 Dec 2024 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fogQa1j1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1AA111A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641687; cv=none; b=uz6REMNx/f/RgyNkIM3hy1qanKhF3eP8wwmMr1lKOO20xIGY+a3DFH6AM6dVaDCrJM9jk5gqBcsM2TNjnvcGyZ/VDRkT91WtiOE55MVYqj+MBe+itxXgPZmDgOQHScJOxUQz3bKnWn8PH1uK/F1YDPjeloGFa2UYOI4SyYOIE8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641687; c=relaxed/simple;
	bh=r6UmP61ELs5pfR8B4wODxwMC23bs/PFtz7wL9uq+PK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GvQmqt+5GcXIu9TeIGkcd98mWB7474HeOdJDKW0rJJjd2v9/At0NluzaWwa4iebE6U9kOTyjhHhw0H9BMumyF7yQchQcBnHg7R7SFJaRxCKBAr1XyK/eQwln/OPY76VFlOFbRnpPL54WCllevzs0i3AA4bKQQM5IhAADHLkCBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fogQa1j1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so754097a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734641685; x=1735246485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5v7hfAH4N73EaPycyY4X+uvT6DTJlai0fstZvBNoD8=;
        b=fogQa1j1N0fQdQ5Y/cKrtmy5SPY77U38awTh8/8jN/iMSNr7E5JjXG+Q7GRGVo0QGz
         uTf4Ep4OQA9y36Ply1EkGwa1rnVKzh36hm4xXsXT/w1fjtAwGMLNUtvH3ftbcuPgVZY6
         p6CxaOoHP4udp0q+IED5sDiy9Lg/GkSVecAD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641685; x=1735246485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5v7hfAH4N73EaPycyY4X+uvT6DTJlai0fstZvBNoD8=;
        b=v9Z55YxqE1z0nvnvMsCtIMljBRIhwuZtgiKuk1Ybgwj+J3LPive/Aww7SYnfhMPe2m
         PI7ajOye/SMFhB8cZvs7NZZk1QfKHhOlTYG5+PoG2NbLtPnHxjPK3/hMtrjroLsSaJI+
         4QAh2C53doOQtfZyPxtjxTHNcF77AyHIaxzc9Ud+kuI7kSobATe250H405lenbKY7mLd
         pO9BQWwyL1w7ew+eOQupTaW5DtHwkBZ8FyOH/3TXWqRjEcixNTKlc42LolAsCR8F+ryv
         1g0jphpIdhrCQgDdVmyJdOqV/14pp+LMwvp47QlPjzH2SwPXx27eIhpZEeSia+G29fWk
         DKjA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Wfs6FOANwLFP1UNIAopS2KItNA4pekdCcQy4R7tygFW3ZS4bKZysDLiSudhi6o0u0VWDZUlk6Zkqhqm2@vger.kernel.org
X-Gm-Message-State: AOJu0YzVNnraOPfmLr9SIeDyX+BHuUZlKT8aaKl8t6SuXaDgXpy+/eSm
	qXNLvwPHxcGbdOW5VMDrleHsEoCNfnUlF917HbozToQD+jtm0biVk+vx2oktHg==
X-Gm-Gg: ASbGncuUJ6kHkxIXQHcHU6k2H6eqW6auZFiWyfH/izeiIMr59mtE1sLKrCdGHoEX150
	xyW/x2PxrIiBLYkXbh7O+ZJo5/mLFNQxQP0blkE3LCNoK+r0cH/0Zohao76nKiIlb6U0EzLOLmG
	ovtj0IZ16JYNxljnIqxpB4pBkkcAACUpEyP6uurex/HW03ojKbTbF7KDffGDzI9TrDSRNbjwlBi
	EbBO1JmaMmqPepAiWb2RRB02ybR4hVhqiHvhrXDskl1j3zvhiIcCY+CnuI6oKSdNUbnXGrwNUtV
X-Google-Smtp-Source: AGHT+IHWXfuT+FExiN0Vomei1Ie+ypbmcTCfllGKeexLjwl+IkwfMzKXfy9eURCKtst9HmrQ6/5D5g==
X-Received: by 2002:a17:90b:51cb:b0:2ee:b83f:f876 with SMTP id 98e67ed59e1d1-2f452ec6d8bmr512995a91.23.1734641684949;
        Thu, 19 Dec 2024 12:54:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4126905a91.27.2024.12.19.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:54:44 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	James Morse <james.morse@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: errata: Rework Spectre BHB mitigations to not assume "safe"
Date: Thu, 19 Dec 2024 12:53:20 -0800
Message-ID: <20241219205426.2275508-1-dianders@chromium.org>
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

As a last caveat, I'll note that I am certainly no expert on
Spectre. Mostly I ended up here running `lscpu` on a device and
noticing that it thought that it wasn't affected by Spectre v2 when I
thought it was.

Link to prev versions:
v1: https://lore.kernel.org/r/20241209174430.2904353-1-dianders@chromium.org/
v2: https://lore.kernel.org/r/20241214005248.198803-1-dianders@chromium.org

[1] https://lore.kernel.org/r/20241211213410.GB17486@willie-the-truck

Changes in v3:
- Don't guess the mitigation; just report unknown cores as vulnerable.
- Restructure the code since is_spectre_bhb_affected() defaults to true
- arm64: cputype: Add MIDR_CORTEX_A76AE
- arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists

Changes in v2:
- arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB

Douglas Anderson (3):
  arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
    BHB
  arm64: cputype: Add MIDR_CORTEX_A76AE
  arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected()
    lists

 arch/arm64/include/asm/cputype.h |   2 +
 arch/arm64/include/asm/spectre.h |   1 -
 arch/arm64/kernel/proton-pack.c  | 157 ++++++++++++++++++-------------
 3 files changed, 92 insertions(+), 68 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog


