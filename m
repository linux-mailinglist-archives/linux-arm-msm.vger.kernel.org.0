Return-Path: <linux-arm-msm+bounces-46653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B5A24A44
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B1F77A30DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428A01C3BFC;
	Sat,  1 Feb 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBUX0caU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588751C3BE3
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426861; cv=none; b=OsFjdOySfKk4oqeXKWKHD1ApnSD0EMp6aoy63rqjrAu65QDuKvQnt8Se6sbYC/tW2VdjTVPzAVO861CMZjWyLcsOJDbISARXMOGvb/3byQchy+YMpNdiuySrAdcu/BwLcG2BJeJvQax9IjGa5SpSCZU8n3NqY+yylsaehcmzpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426861; c=relaxed/simple;
	bh=dLZ8qBz4GQGw/lB7QcQZEOIBYgf0eH+A1saMne8F+Lg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RY5EmXmVA4Q0/qSUptMEDzZClVEvHB9P4gXOG2IRSflqjd58gItLIXiZnTecQAP0QPRVh9edFsfpxoBADs7Hq3smr74A/8VRc9Zy11mn4o6Qa2djsH4szFIiVtLvD/jE6RKwpb+P49qjZxI0i7wkaX0j2RYsnhNFAwO0c+L+OkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oBUX0caU; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so2973722e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426857; x=1739031657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=;
        b=oBUX0caUNmJSDWxetmAwZg4LhgwNjDUhlFLwuOSILocndto2ri1HC9+hteXBUTekAe
         Wofqohw1O8qGS2f2sydHV/KOO3I78wPg1SLa5sGeYaCR6HhUc2WoL30zDvPRfnxNgZ1c
         ih4D3HIDbBuopIltfp5jRzQWK2Axhl6JWmh4gmiYxh8rriltQNnqvAPlBeHclrhAEPPd
         5Km/CbRd8UWoz1gVx1kB9Zgo04L7U/c2SuLuxTQQTxegHzb51ixS+N+SoWSArYWd/guw
         8hDSns25da7Yp/ZsY/pCkQzOE+2Pk/bprdOVcUyNgz1KZNNUHsjDq698DNQBlayVS+Ax
         b8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426857; x=1739031657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=;
        b=aEJDUT8/pdNlJl+Enr7EsaLGmp07EopoXY1dpRfUx0hypzPC3wbS08MvL/dWq9QbUx
         8QoMgVAjr7wSA6jG5JMM5wRlDuoT20mTuC5VY9KXACRlkJeCAujNoz96F7gXAe4DuddH
         tOx0j1T6A8Jjcw1T5hXVmF7yYpzroplvRY3B99EY5Vv7Fa4gI5TIDEgElIYfWhscCqIg
         tsXK9MRL1UpujnhkDeA84bacogOxuuvHAmdVUFw73wvmZPvo6VqnkQ8H2MDcplTPY6F3
         iUr2f5AXv7VPdidR9dGeFtEFzm7IaIA3kV6zP/ztpUSOQ9mK5hiDSpnbr0/O1u+/FcxM
         KdMA==
X-Forwarded-Encrypted: i=1; AJvYcCUwaywTudYvF9sIfeJNbzgpYWYAoDZQOAcvN2wwmH0MNNcAvMqRVJu7tcz8auRizIz7H1UPgD3idAOtfUbx@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdHIQkk1VTLDRLGzriQmeGD2XowrrHUpPVZk/lxwr0SCx9NT+
	CPex+0xs0Cnsv2r7WNl8Ey2GKc/FAePR9HJgOLuJE3xTi3M2YEDqfjRXYtlDwuOh8h8F3MufqEN
	B16myE/hS
X-Gm-Gg: ASbGnctPsSYTByPZxDxzSZeKYLX1jne0Pn4Q+l2+ZCH7DzBpOYpgqR9Hyw27VOZ+4Z0
	0kWlAD4oJpnu8f0s5b8m//VAc3lZkj8z+Ij66ZViXTkqFU2vaeUs6RWKWLFS9pSs8gm6I200JAt
	I9bYJ+Uee5+sGubMKakFRvvxV9I/upnlDMyUHJJmUAumCwbU9Iyttfdr1m6i1Ios84wxZn0ApbB
	eoI5aQ5gSbilbIrHvpbSpCL2zR+6y/z+n5SEQwVZv5b52LPSGg5NnWmhG4MytIgzTBb9/zWPXLr
	97Ea7VzrZvHa37dLvUhoAnu0RT6QJSE=
X-Google-Smtp-Source: AGHT+IGzLjvNy5md5KJMNowDOz5fBZmGTDNe2Ls3qAbLpqBRkp4azUKYm8Ap4tW15m6c0DiiSs6j3g==
X-Received: by 2002:ac2:4d05:0:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-543e4c3a0d9mr4750727e87.48.1738426855892;
        Sat, 01 Feb 2025 08:20:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0fb8sm775308e87.7.2025.02.01.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:20:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-firmware@kernel.org,
	ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: ath11k: add device-specific firmware for QCM6490 boards
Date: Sat,  1 Feb 2025 18:20:52 +0200
Message-Id: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
NAK this.

Compatibility links are added to follow the names in the existing DTs for the
QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
those is fine, I can drop those link.

The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:

  Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware rb3gen2-wpss

for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:

  ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ath11k: add device-specific firmware for QCM6490 boards

 WHENCE                                |   7 +++++++
 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
 2 files changed, 7 insertions(+)
 create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn

