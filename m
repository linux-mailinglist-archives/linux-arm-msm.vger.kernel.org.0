Return-Path: <linux-arm-msm+bounces-50158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D60A4DB8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D6947A4928
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C911FECDB;
	Tue,  4 Mar 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlhqEZon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C681FCFD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085873; cv=none; b=r/wDtrkf6uvtQR8OhnY71X+UCMDVPQvAyB8Xbh4q1Um51Fk90CQ7s2wvyge6pQBxltCbzBUSQebbZtybIgRYUgBUdawnphe33ksHpm/tpc6BTrjIPBOe2aOpyC7jNBCEpZU+TkMbAykkiiEP8JKbbuBN8JCOfSBObwEeSCAfI10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085873; c=relaxed/simple;
	bh=n2UkKVPrXqYPJwFRJJ5cSjNwsrOJN1CW2qj0tohsSrw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UilxCxw3pvP5Q0bqNEq5EqsgnB+7allz4uosZZc7Mjo7i2u/Hkp5/SNgKyPlJPtYqtr1Z0IpmkdbeoYt1stDc0TzT3f9a/gy+vnGRKvt65+83f8bs44Kwy7uHtvY09YgdbpDXaUz0+DEjnvl1QhgBCRAfR+PgaVfai0Y8VrF7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlhqEZon; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso791783266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085870; x=1741690670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDU4rmBFIHbrSxk1aZkGu1FGzrjcXWe5kWg/s6z9WeE=;
        b=ZlhqEZonxpc9u+Y7JA7Zz1Z3mWFgciPJsGf6mustvAIKdwwc+baJwD+JZCa5HaAiPQ
         CLKsCWE9KHf8JgHVZ9CsAu6IbVVvDh1iB8PoVsZlXBo1dNzbjuL/2VM7QzWqXpSTTOvs
         wPFCf05GmfrKOnKRGpWA21C3Qi0uda5TRY1kid7cd/akh5iCI+vndkXW/FDdJuraK/2W
         /U6imfLO1DPF4iz5n4NsA8gNdP7YoJKY13HIvwe4Nnf+Xb/XMVWx7Jvj2pxQHwlnr1Sd
         jRfpEELSQpstFpTVi+TzWQsflkliLw9cJKvGZWWtyo5FIHGkhHyJyLM8gjAfstlsngZb
         nSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085870; x=1741690670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDU4rmBFIHbrSxk1aZkGu1FGzrjcXWe5kWg/s6z9WeE=;
        b=ISqxeB2WmowyNWJO7k62hkJCXftpe74Vq6Ypjw3/QS4SRxu9uDwOb7pLIhALP9rjva
         20pnbYbDaT7n78lMEK8xJaZh4BwMl0sepqDNRss2WmGY+icypfEjpCzZlWgE4iEmkdkJ
         SnvNKEeWSTgCAx72EzJpyzjRcX5jMo98XRm7nk7cq/DpsmPzhaIa6g3Qcr9NcVywPv5c
         IAu9mUdhNpBffM5hy0HA6TAJpwB+P1010Yq27yEOQ8Wx/bMNRtnTpE0hI+DEue203FCy
         FlI4AQfjwyRI9guXLg7m8y8ZTfwLhd4P2HaDmhFkTGkvFHOa0N4l7AJMcCt6lkS968DV
         NCJg==
X-Forwarded-Encrypted: i=1; AJvYcCWG/nez2BSy0ZWm1x64+BE/uvdQg69KpznVDgYKO6Sd/5x+2G6Ffuq9YUxiAVfNPjocTEz7dZertl25Mv0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzZR/TV/hLNCiuy4TyZCTWtqdeNc0picIivkXoREUgzIgFVor6W
	M3o8V/0EDG5YOpODpOoFQvoqH6G+GZpvstVt4n5SyzrtFaHuaxk/O0maINTEOwQ=
X-Gm-Gg: ASbGncvniUSuXBmnFx0L3royH4Hsuh8pTw9FFi2Z2y4ULRTf+hxso1khPbvpSJEFQkV
	J/zcFVH8cU82unPmcFgLcBksOtHw+xAtJ0Ysl5LzgnUe68yRZ61aYM6/qyMNnY+GTPE8SLeiuEZ
	wx01C+k455aRH1eNtiDD+lqgx7Ewt/gZ5fQOlzCJbxXY8R2dSU+EJL59HP4YzgC6q3aol7+fo6O
	KyD2ottg0vX07FP/CooftKYY9sy5J1LgdowsZDZzqWxxyiqFGzvGRo3+3k8M2GvhFaNXaxHYaca
	lrzX3Sb9vUW2H1gtlq61HWas0obLW8P8Zwn4MhZNxcXj1/lxPbuaP0iVoBF6TQWkPsVObg==
X-Google-Smtp-Source: AGHT+IEb0GcLCgpBn4DBHJjLz9lM9L+RwrbPgXxAPm7l8NYpXStBAnU1h8ujrhg4rzG0gewdQBsjcQ==
X-Received: by 2002:a17:906:6a25:b0:abf:5eeb:6af0 with SMTP id a640c23a62f3a-abf5eeb989emr1170917366b.18.1741085870210;
        Tue, 04 Mar 2025 02:57:50 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:49 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Date: Tue,  4 Mar 2025 10:57:17 +0000
Message-Id: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm Audioreach setup, some of the audio artifacts are seen in
both recording and playback. These patches fix issues by
1. Adjusting the fragment size that dsp can service.
2. schedule available playback buffers in time for dsp to not hit under runs 
3. remove some of the manual calculations done to get hardware pointer.

With these patches, am able to see Audio quality improvements.

Any testing would be appreciated.

thanks,
Srini

Changes since v2:
	- dropped patch which is causing regression with pluseaudio.
	- setup period sizes only for capture path
	- fix underruns/overruns in dsp pipelines.
	- add fixes tag
	- add patch to fix buffer alignment

Changes since v1:
	- added new patches to fix the fragment size, pointer
	  calculations
	- updated to schedule only available buffers.

Srinivas Kandagatla (6):
  ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
  ASoC: q6apm: add q6apm_get_hw_pointer helper
  ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
  ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
  ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
  ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns

 sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
 sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
 sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
 3 files changed, 53 insertions(+), 31 deletions(-)

-- 
2.39.5


