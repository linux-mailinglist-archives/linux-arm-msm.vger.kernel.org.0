Return-Path: <linux-arm-msm+bounces-31030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2896E6C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 02:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C84D1C214FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 00:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D7CD531;
	Fri,  6 Sep 2024 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IgfSPF9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66AC8CE
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 00:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725582339; cv=none; b=bewatBoLMb3pWm33loHS0zFldhluZX7BaBkl6KN241JCaYvITU52N2/5US823QxWUcgHbMlM7SnIC3t5LGsUJZMAVdgUCZR8jErpR7NZPv7cXYwv8hhAXYCvN/Rievqteie2e5eEwUW6kJ+nPjLrgDtwX8/aNSrfkJSqp+glbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725582339; c=relaxed/simple;
	bh=DnoU5m6tPFhGKffI5RUSLnEi3V+rpQJ/v5KK4fQJEoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-type; b=QmZmSaW3LxtGFdbf5qxWz5A5zYa17ehFD9HiyoWtT4/dec3Cy4CNkaHL2YKSA6hAA7OPphEbh61XboEQx/zTZXILYY1G0F3T0ARyem/LM8Nz5JnVoQZllDu+X6JFFxP4Y4WTNHxXODj6fh1CzfDMrStfS4aOW8udcwWPm0jD/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IgfSPF9H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725582336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=prgA+zV+zc0VBOH/hj65VBSwzfC4zfATQNsgodIZJoM=;
	b=IgfSPF9Hm7Y9hzJjZTOwW8PfMtKekhjKaUE/03rnS12fFfOmF05stnNlIcU+W9nBfzotxI
	20+V/BT570g8sJKX3IZL7IWA0o6MjCrp+iQDVh1B64Jv4pZtWYarWt+LIkbhPeVqYuQa5a
	mRBIhdUk69nu4vwQvGemrQ1jadcRn1Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-jjYR8VznNxOE2BP_sj2GHw-1; Thu, 05 Sep 2024 20:25:35 -0400
X-MC-Unique: jjYR8VznNxOE2BP_sj2GHw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7a968ad3765so248916585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 17:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725582335; x=1726187135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prgA+zV+zc0VBOH/hj65VBSwzfC4zfATQNsgodIZJoM=;
        b=t0pJlJpPRw3khl6ThjqvPLxE8Kud5SByDaUEzPJpgJH+DOe3jPSzr8/LL+obW0T9p+
         o9wap9eheikMyxzuZ+/PO6x3SZnA5dwmIxMnTFeFEpvMxByxKWpmDrzbP1pf4eH6i7+B
         Gu/quOBFEzTeLIsGGKSarKSClDhWLwG/QiOfklmKGX7/wzukmAoqdAA7x1ZIHUHh5Wy/
         tY9vr0z1JALLuf9BbCbnXYDL1Hrw5RWBt8vfVDcL3qn7jyX3y3NzdVz17EjC4xTf6dIS
         tIqUZKoyKqYc8J4qkvitCjDe6iYteuCUN8cR9GgV82WKRHjsyToRDLv7avGK+916G0HG
         4PWA==
X-Forwarded-Encrypted: i=1; AJvYcCW5WxfjJbq1sNG6QqOc+jM0abGxXXVH3GwQbb34SvCyfJ/IQ6G2dFY9a2GExu6Ypwym+WX+T/DdlA9J1W1q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp2mAUG25jyzeD80FgISu8qY2Khg8KLxLPfclrTE/c+t2Bg3md
	qBIj+TIiBNEQmMDDWoa3IMmQhWyKPD8e183WPizNMHdn09Q+Z/+HXmJ7VDkdiD/JFpZpAwgJ96q
	URF+JJMlXy71dhsyxV+a2lQd97gPRcv4w7xRN/iDCj1znC+ZAAO/W6FqFHNYxatw=
X-Received: by 2002:a05:620a:2955:b0:795:2307:97ef with SMTP id af79cd13be357-7a997328596mr99139585a.6.1725582334958;
        Thu, 05 Sep 2024 17:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXjTU1DKgO9eg7wmv7EJbP7h41p0rEDFhDntd0hLbHaHx9IJKQbqSrMBmwKPodVNONK7KN0w==
X-Received: by 2002:a05:620a:2955:b0:795:2307:97ef with SMTP id af79cd13be357-7a997328596mr99138585a.6.1725582334689;
        Thu, 05 Sep 2024 17:25:34 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98f026309sm120779185a.128.2024.09.05.17.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 17:25:34 -0700 (PDT)
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
Subject: [PATCH v3 0/2] crypto: qcom-rng: fix support for ACPI-based systems
Date: Thu,  5 Sep 2024 20:25:19 -0400
Message-ID: <20240906002521.1163311-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The qcom-rng driver supports both ACPI and device tree based systems.
ACPI support was broken when the hw_random interface support was added.
This small series gets that working again.

This fix was boot tested on a Qualcomm Amberwing server (ACPI based) and
on a Qualcomm SA8775p Automotive Development Board (DT based). I also
verified that qcom-rng shows up in /proc/crypto on both systems.

Changes since v2:
- Simplify ACPI fix based on what's done with other drivers (Brian)

Changes since v1:
- Use qcom_prng_ee_match_data instead of qcom_prng_match_data for the
  true skip_init to match previous behavior (Ernesto)
- Reordered patches so fix is first (Dmitry)

Brian Masney (2):
  crypto: qcom-rng: fix support for ACPI-based systems
  crypto: qcom-rng: rename *_of_data to *_match_data

 drivers/crypto/qcom-rng.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.46.0


