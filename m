Return-Path: <linux-arm-msm+bounces-30550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C28E96A9FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 23:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 061681F24E9A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 21:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA291EC011;
	Tue,  3 Sep 2024 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBJfOFHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97501EC002
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725398568; cv=none; b=bvEkJs7oQDAJtKLvs576kBlI7vRxDtbalJGv1dWcVZIv6n/HXBLnEn3AT5898Qe9/w5brk9Ir7fzhDHcj6h9gvzvfvtccL99nVvvz82Sw/kmMmaeoL731vIplNegh+oxTsS0MFR7P/yFg0VZIKR8PoKlKSeUF/dCDWH8BGP5t+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725398568; c=relaxed/simple;
	bh=xLNiOMxaw2LZZ/ggNobSqCSlzqvrzF9ZY7MDKfT8EGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=NjuoqFmbOrYomIX0779Ywp3rRQ8jri2CjUipmFXOvtca9SYPYalnC4YiDLahAz8CMwzpnu84nf03D1lTIKRMEWxRIMYkRg5tmwlxjhIDidqHiyA70MitM6RGywhruP6Q/qTDAJ2SD4P/UqkwyrXdXjMBkhCQrZU/660RIriBp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBJfOFHw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725398565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P02lsMX4DngF767Z3UWIfE08mOI+plZIsLND6/2CQRk=;
	b=IBJfOFHw7HKt7CHe/+c4jLyQkogmBa9WSRBXGkAiN/cl2WuTEv+n9PiRIVWBpN/OWaB0SO
	MghqFAEvIDqphJnObPfMSqjbXcmSfBmmGajRbk3Tg3ECV+SmFwXPyW/nNgmJPbS1SSKiWj
	TsJ10YEGc3xC1sh85gwIxhLo1WVZTAc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-htWmYptAOWu5i8I789l95g-1; Tue, 03 Sep 2024 17:22:44 -0400
X-MC-Unique: htWmYptAOWu5i8I789l95g-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a80adc8735so18674985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 14:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725398564; x=1726003364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P02lsMX4DngF767Z3UWIfE08mOI+plZIsLND6/2CQRk=;
        b=JpxjvtMtVLV5GZMbffhPcyArct0tWZvG9zAtvo+XrrYukYFbXZrSiRQH6UJ0jPrM1h
         CiTdjGWv2ffE+UyMyFbWj3QU5lkHdia7lNaM+0HowE8TgklzT8AQ3a8wH2fSuEJtPVa8
         FcHtZA42Wf/A/28t0/nvgI+1GN/oRZjln8/pA2PgNLteKgAAeAHP9gQ8W6Zu6nIl3Nma
         EIwrYOi7aK/owp4ytqXfuKRlyuCln4/Hh4djraR/GbVGSuju13yja3hDOY+K3S6KqbfT
         VWpLBF8QSOAKGR3cUPiH3abqJQxguGCuMGV2qlUi54c2J7b2SWbzSx5eKF0A3cLnZ3OZ
         CO+w==
X-Forwarded-Encrypted: i=1; AJvYcCUeij+DwhrQT2tO4SOYO4r/1Nvg472D9zXBrp0SbUdXxTby0FP7NIlUFZivT+Xmt5iZUuQmj2gG+In1F6Bv@vger.kernel.org
X-Gm-Message-State: AOJu0YwhObM5RI+0bv3JQaiiVPuGhI1pUJapjd3tr2ZPHSHjgufjPtxm
	eR/kXt8fEV28OPtiWcexBXrGDXj2TOjiBn5RPaBZuyMVI11VosEQWpe4E2qPgD8GPZUN2H7gsj8
	rmAqHkBX6wwnB4g5UBElDGc4E4mmB6igBqeP+LlfGvwNYlTeEi5yNrKaAmUZq0HQ=
X-Received: by 2002:a05:620a:470f:b0:7a6:6d37:9f19 with SMTP id af79cd13be357-7a811f51a29mr2648121385a.15.1725398564280;
        Tue, 03 Sep 2024 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExSoBiJ4VDU7q6qrqmBNoLmWNnqwcKBZ7V+aCR+x+Y89wh/+jQl2xhNDuBYCHNMXig/9lHhA==
X-Received: by 2002:a05:620a:470f:b0:7a6:6d37:9f19 with SMTP id af79cd13be357-7a811f51a29mr2648118485a.15.1725398563905;
        Tue, 03 Sep 2024 14:22:43 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bfb8c9sm564737185a.25.2024.09.03.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 14:22:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	quic_omprsing@quicinc.com,
	neil.armstrong@linaro.org,
	quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ernesto.mnd.fernandez@gmail.com,
	quic_jhugo@quicinc.com
Subject: [PATCH v2 0/2] crypto: qcom-rng: fix support for ACPI-based systems
Date: Tue,  3 Sep 2024 17:22:18 -0400
Message-ID: <20240903212230.707376-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The qcom-rng driver supports both ACPI and device tree based systems.
ACPI support was broken when the hw_random interface support was added.
This small series gets that working again.

This fix was boot tested on a Qualcomm Amberwing server.

Changes since v1:
- Use qcom_prng_ee_match_data instead of qcom_prng_match_data for the
  true skip_init to match previous behavior (Ernesto)
- Reordered patches so fix is first (Dmitry)

Brian Masney (2):
  crypto: qcom-rng: fix support for ACPI-based systems
  crypto: qcom-rng: rename *_of_data to *_match_data

 drivers/crypto/qcom-rng.c | 50 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

-- 
2.46.0


