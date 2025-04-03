Return-Path: <linux-arm-msm+bounces-53121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D5A7A772
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 18:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FDC87A6CF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10546250BF7;
	Thu,  3 Apr 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XGu6wB0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB624EF7B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696152; cv=none; b=CYTRycUSLxFte5WXv0vJDsFwQRCrqL8R6MjCzJ2GJ9TEspjDeAMldPMDTRvv9MR5BahaTO++x8srclAwnKuljLaDhcde8WxCA4E/POHYnP0d7FQAOpPlqjM0u5zcP27rDsBNrcXWoFWSReABaiyEYREyoZjHpcBVG6/qQmcklp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696152; c=relaxed/simple;
	bh=uyI8ktFjPz1/JmqLofQ8MKJWY0TulmaY0Zo/Dqh1Aq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S4JklO3b/RLPqbzt0UoDId2recadoyKyiy8KZE+f7F8HQoOb4rQqhhEEw6GQEK1hdOesx6RJULYbn3Vf/unyYV57l3QI5+0fpnh6tBT9xy70rAD/aVIU6l8D3dGFNvtWePjIzBTcG26TgKYhUxSpj2KXp9veTqXxF3ZP4W+idG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XGu6wB0J; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7019205e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743696149; x=1744300949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wfqt6oJDOs0L+WJBkP8gI6GSekXwD/yId3tPbvhFbuo=;
        b=XGu6wB0JwSGTpmUX9eogAhbxK3bzflU3QkRtnPUTuEQfE2k3X/7wv1LMwWao2oWhBT
         +2Wx5VZkzCPXq8/skXiPR5qVw9MfYwOpMx7umBy1E3F1jPGIzwieccq5njcYJYRCl5Cc
         EN+Ba4Yh5MhoupBWG+VyXsPsN1rXxTMk7VChFFefd37a6GGK+7nHxY3kQmxbEP2iY7fx
         mk4QtOhpk7TuIAaHMeyVXqGE5h4COdiMhNthNwjWMNiPtveJgt1Jnvjbv0mk4fZbcOWD
         Z6NgFmcYQzxnXsF+ud65xuuGfmCQKi+v3M1ZroO0hPaqbLARgJ1t+P+llsjgOTnHS1il
         G17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696149; x=1744300949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfqt6oJDOs0L+WJBkP8gI6GSekXwD/yId3tPbvhFbuo=;
        b=lTvBIg67Yr/fNz+vlS3L4pqbtiwVnirodU1a3d2mGBcmmAIV3ZIB+Cl6z9ImeDSAOd
         6aYbsKsgmZfgjyH5AeqLm9rGPsEitnci4J5GS2gJ0vLs9Tr6v6+lKNc2PPZyI/1iscD0
         sgyv7o7T7018yK5BpE8zZQ19oO9SB6Z+crcasdZ76JzdnSy3xiJiDtt2qtTKFoKYhngb
         Knf7mi+FXIgjLy86DaJ2/L3aggirchvkrOb8ZMiyO9WGrPvWudqlJTAOkR34tLtJbKyS
         0Tg2EximTblOCXIeeYXKW3Qe+I0fKXbe62hnedDgG/cG7bkzDQwSOjLi5o7pWrjgH6OI
         ReMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUILBGr0FCDvwNwyPEezhX73rfsJFheneSx3OxihjT43vuYWpO62HmF7E6p/bq5PBeBb+G+k36XflDCEWBM@vger.kernel.org
X-Gm-Message-State: AOJu0YyIyH73kOGnMUIRdsQdBHk1UxMEE7vnhkuBTTeyuJVSolEvU9Ku
	PBoXrqGGipLZpwOfE3n1piyG6csqM/+LuhgUwFsrSWsVefVAqggXQMMJ/TLUBJA=
X-Gm-Gg: ASbGncvz/6MQkvrP0b4Hqf6iJ4ChzJisqF620uYPwyUrMeBVpNjSy4F67p1B05emUEV
	XfHVI61CX5LRcV/ozDaoaAB9yvfp5l3zvvVl/lpnoO9Xd1RPBuPwZSGEvh33gq+YRJRs2RlU018
	EndEHXuhoaCU4LF+Hdvh3Ho3ikSIUIS08itoPyvNsXA05+sKdRYX87aqtqd9T/XklINQl31TioZ
	su1erbH2rJC3GpM4wpylqALDTH53VZGkac0GPzwk2gyO7XQebBriRmYPcdDvP+hg6K6uv71iiz0
	5bZmwrht3+3bSpm6z3NEoXBuE0OFeSlpnV04bVn0lKv3koLZZr5Y/Plr1k/vxoc9ReBemg==
X-Google-Smtp-Source: AGHT+IHuJ8392mvT5dwt8RhgEzBV5mNQw5Q0xJDXpgV/2MvZapYbCbI1AOfByBKlVYlw3/Bt0soryw==
X-Received: by 2002:a05:600c:4e10:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-43ebf6645demr44201835e9.14.1743696149385;
        Thu, 03 Apr 2025 09:02:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbc64sm21811285e9.21.2025.04.03.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:02:27 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Date: Thu,  3 Apr 2025 17:02:07 +0100
Message-Id: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This two patches fixes below two issues with the VI setup.

1. Only one channel gets enabled on VI feedback patch instead of two
channels
2. recording rate is hardcoded to 8K instead dyamically setting it up.

Both of these issues are fixed in these patches.

Changes since v3:
	- rearranged the code, and removed some empty lines.
Changes since v2:
	- updated commit logs to reflect the issue.

Changes since v1:
	- add missing break statement.

Srinivas Kandagatla (2):
  ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
  ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 117 +++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 33 deletions(-)

-- 
2.39.5


