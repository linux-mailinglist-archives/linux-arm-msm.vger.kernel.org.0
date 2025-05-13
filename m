Return-Path: <linux-arm-msm+bounces-57705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08191AB56F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 16:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9409716815F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 14:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4331917C2;
	Tue, 13 May 2025 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDNoFGOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67973165EFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146246; cv=none; b=mFIIVO9OcMqzeU8JQ7VPHN5A6LsK7Co5Evmpk+oSgLxZ0B3eGdewPjMvzxl5cXVhJbkdy89l69bLj4B+qRID9M3Apu3eVJKU4k4Rtdzx7JHyzzYC6qh+2WI2Ul/GaHmFVBoUYVrndLl3fljUeR47D8cCr1zzRAa0TPJkvMZ8YjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146246; c=relaxed/simple;
	bh=kkZ+oXEH0zmpzv/CvYLZanVOw7+2wHcXfJATZ/nFZhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slalM1tcrGS+6FZwb8B8BB/Igvd9Gf18aqTgZNF+Z+nkKOZ50mXHs/AGuP00s1i4Qe2GXhxhCfNWTHldnudpGj+Q0mTY+cVz3o8PaGyC1vo64uNWsFawct3dVe4qwnYP+fKVBACcIdPXWJ2fqpnLjLWp73Pehk6E6b7pXKjJJko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDNoFGOO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54fbe1f679cso648792e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146241; x=1747751041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcxUlFICh2iCrxEXjmIj+SSgeewj3woQFngi6oh0Gxo=;
        b=BDNoFGOOA8X8waTRlhaqXjCF+w6Jvr5klf3BUQYSSuxddn2usLKpbgYxXtoyvaT7G7
         xGbIwI/N7Erf8gBtdXisyr6kDxAi/9jlWEt1rBE8dfFCrsyBrjELYFkFI08HgzraGC2T
         F5nQ1SR0CpkDyOwZgot1iHjWBPjNoN2B5aj9eqvR69wU5qtWBFjdsqwBl5zEPtOrBz8w
         Gpv9pbjJefpv941NcasuxgW+Z8+0Hjv1YdHeFM9g+y6mKO2DnSgx81Ua7ATg+IONZzXs
         hU5BU+W9qlGL754zEHtrYFN3WhMQA9ae1m+uEdBGAIi/350Ua//fFmOHdcCh5gbEyGQE
         X9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146241; x=1747751041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcxUlFICh2iCrxEXjmIj+SSgeewj3woQFngi6oh0Gxo=;
        b=b2/EvCbYmJ/7b/ho/H7QXUNAgWrzWlYq22DF2RURR7ziJ6trihxN42835lC4MKbAp/
         1sehcZSrKKfUCQXlqs+vI26T6VV7nPlQdEJRqvxWtCmJrlNcWO1796GC4s82vCOQbRnM
         eR5Sn3kPnEiSJ08cDzDj/ILDhTHszFjA2ki0I+CESzzTtb17uaum7X9TANVGYB/tKZlA
         DvVR6rDC8C46Ebi6e0L+J5OCbR6Q9coeCwHhe5apz0jXNtULOKTcVL+kZ7Mzue3/z4Tf
         1WVdyANKKgEt5TPBjACl2fq2NVjiwJ3OT13tjWtBFT45c02tl/RtLPpRWi7anHVr0/t+
         lm2A==
X-Forwarded-Encrypted: i=1; AJvYcCV3dYgjtF+cA38/gHZwBzI/nzr1LtLywTxPTBbnkKB0byNIEWsx+xusdExQJespfbxl89ARNjrGwWoS/Ypg@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/GpqiQzsVp2pWrJzWclfQGqsnvQvFKt/Jv7Y0QLIAVUfRKrQ
	jij/oA2XgU1O1jDm+MrVIgUQsEhHkWwbxYaWye2C8JWqraW5fvYz2x9H9RbL5kA=
X-Gm-Gg: ASbGncvwy/Ga1aKCrUx9XdZSY6y1JdBUW4RfL5bGKzJP8CQD8QeonZEQ3a4iNh+TaqM
	5QdpJljI6XltHd88evPpI3j8BDsADNaI/3vhK6B4n9qRYJ1Ji1khjTQMZ73zD6hdqv6Qb/X+ArK
	VVqscXHc2joudqIvGM7w8NoEyEeGc9xG68aXVH7b5BWWWgWwvT3mQmPL38bWRYl1HIvZtLgxikK
	85zfETMgdMZSasq5qZA0qN2QG98XIbGePcIo9vGi60/tFkcVhz7f428PNQqSp6zqV8fc/qBtYQk
	K4lUJ213EF+zEgh6p0Ypm2SC3D0woMCtQSz37YNV34i2mlNsOxiAhHh6dm0V+sP7I72VDooQ/XL
	kyoasd8LjTh3xIWhh0EQ/ew08ZUkdi0Ps0RgDSZHi
X-Google-Smtp-Source: AGHT+IGDkLbyBVwrjWn6O4fXzjpRjNtjQ3XGBm6TwmK8QRCeTLAXdZq4thsNYlkiC1iRIseQ5Xr1qA==
X-Received: by 2002:a05:6512:6c6:b0:54f:c51b:d828 with SMTP id 2adb3069b0e04-54fc67b75b1mr2048607e87.4.1747146241416;
        Tue, 13 May 2025 07:24:01 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:01 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
Date: Tue, 13 May 2025 17:23:44 +0300
Message-ID: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.

For simplicity of continuing my reviews of CAMSS paches add myself as
a reviewer, as well it will simplify the work of syncing and avoiding
patch conflicts between work oin CAMSS done by others and myself.

Vladimir Zapolskiy (9):
  media: qcom: camss: cleanup media device allocated resource on error path
  media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
  media: qcom: camss: remove .link_entities
  media: qcom: camss: register camss media device before subdevices
  media: qcom: camss: unconditionally set async notifier of subdevices
  media: qcom: camss: simplify camss_subdev_notifier_complete() function
  media: qcom: camss: change internals of endpoint parsing to fwnode handling
  media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
  MAINTAINERS: add myself as a CAMSS patch reviewer

 MAINTAINERS                                   |   1 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
 drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
 drivers/media/platform/qcom/camss/camss.h     |   1 -
 5 files changed, 71 insertions(+), 119 deletions(-)

-- 
2.45.2


