Return-Path: <linux-arm-msm+bounces-29880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33E963794
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 03:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 109221F21635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 01:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C4E1798F;
	Thu, 29 Aug 2024 01:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0iG3v1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EEED29E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724894493; cv=none; b=b5ICIFwAOKQn1N7r0PLjFkYoERwlsYhONLsffIIpEIQGsMW0WqV2nFJIwspWnLKzjQ061z0SBjb66ItICGMW+x5TF16YOr5Q/iVz/e97hJ7GE/AiHzdMgoffJx3JkHkrWmUid0JiBlWY+OLsDYZnupG9GpMK5+kOt4UoNxabliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724894493; c=relaxed/simple;
	bh=skcMYmkBzaPdB5Cqc+jAvVZYCWgXNtH/S9Wna3ROl98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=LqAto7VaOteSneM+QxZkDPtfO9i6iHRZaGJPqGsHp8d2T35d3PTeUrqQSzYKGEBxIqD3i9WejWkYuqiIKRo9xSV7xnXai4gVF25A7Bnk7XpGra8OYMKp6SZdtz+2PfTQcBAWSva/wDxz7sTuBJrAkwZf42jp9R4+0HdbuY9QSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0iG3v1c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724894489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xA96S5hJVD7jAK1AQwcph0AMSK8pgIwZSqUYdNlyckI=;
	b=U0iG3v1cBtAV05qvQP6ZTMAEOENE8IAXf7MfRe2L3F0pO8RSYjrNhFJMnbCcWbEGiYuUX4
	xgQsPNGoFojKgcMljTfXUybMIEOjkwCC72HDNHACgnUTiu5DvOg/U4XenR/zKS3ZT9J+3s
	otzWGZL75/BTFuTRj4NpuJnuufcN7OE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-LgQme6QQNLyadGm8lndXvQ-1; Wed, 28 Aug 2024 21:21:28 -0400
X-MC-Unique: LgQme6QQNLyadGm8lndXvQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6bf7ad66ab7so26186846d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 18:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724894487; x=1725499287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xA96S5hJVD7jAK1AQwcph0AMSK8pgIwZSqUYdNlyckI=;
        b=Jok4ZvTp3ojnrnciQJWUhM4MkrvzQMxREbrHE/qdEhbypXATyZWvFCEheZWI64IYR2
         TGFn35gFuuqXqQhhjwJOB+lAMVy+aE8gHjjCxgRx1CUmjGDddMO4Ht3IIAWx1Ie1zdEf
         AV6T5t8mK4Kh7ugrTzEW6b3SPje8llzrZs3Go4OZyJM4ooemWzykmJP1XRChlSmFh6ax
         AG8NxO4qkDtFxH/1gwPAOCN45c8OHV1Oi5oEODwqOrmkUZ/cn+d++DWqF7B8o9lYgNAb
         DeKjkcHiU++Aa8jFMfacodQJx2CfPoq2WSx0HOyt3HjPhEzFksk55Va624gmQIFI7BQz
         PfWA==
X-Forwarded-Encrypted: i=1; AJvYcCWa3Z2+ckeH0S46hK4CWyaKSK9edsuqzDT6/ImzOXJk+y/OA5iygIl2HuT0mo3mn1ZZSUWOcDnyNbskcMzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi/5rom5OSRL7MDrk/m0nW5KTPnQ+SnJj69e8lf51vtI+JwqMJ
	QBx0jV387RC9NodH1gH/YNd5iMUKtEKbvgh8iz2g47S+KuFnsslAp/xOpQ9JMCjNVpYBWbYrvGX
	t6Haxydht6feXUiPR0u18TikPq64e3d3F4irithlxxQU28QTmHWcAoeOSnk1titw=
X-Received: by 2002:a05:6214:2387:b0:6b7:923c:e0b7 with SMTP id 6a1803df08f44-6c33f3a4170mr20180326d6.21.1724894487570;
        Wed, 28 Aug 2024 18:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3ImsCNh+Reo0irARwQCo+4xKteQ5h6er6E2txS3nQ6+qHXf5Bul+76XAT8VTntFotrWpmRg==
X-Received: by 2002:a05:6214:2387:b0:6b7:923c:e0b7 with SMTP id 6a1803df08f44-6c33f3a4170mr20180076d6.21.1724894487205;
        Wed, 28 Aug 2024 18:21:27 -0700 (PDT)
Received: from x1.redhat.com (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c96825sm1013236d6.75.2024.08.28.18.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:21:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	quic_omprsing@quicinc.com,
	neil.armstrong@linaro.org,
	quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] crypto: qcom-rng: fix support for ACPI-based systems
Date: Wed, 28 Aug 2024 21:20:03 -0400
Message-ID: <20240829012005.382715-1-bmasney@redhat.com>
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

Brian Masney (2):
  crypto: qcom-rng: rename *_of_data to *_match_data
  crypto: qcom-rng: fix support for ACPI-based systems

 drivers/crypto/qcom-rng.c | 50 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

-- 
2.46.0


