Return-Path: <linux-arm-msm+bounces-71699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 689FBB41146
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 009C9488182
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4629915855E;
	Wed,  3 Sep 2025 00:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNMsud83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663D64A8F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858984; cv=none; b=mm/NHLJnTwEY0xZCWGXtexkdgkD7dzqTMGJTxcTKKqorcnQOhK7Sd+YQqJQM2SaXiBx15/X/FWa76En1fJNNk7s/+M+FlNbOh34S9NyQveh3c8YX9ZgEzZk2YyA5Wp6Cma6R1tRxmyBGc7yPk0mwPSp0n0fe/tc5OymH0USAbCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858984; c=relaxed/simple;
	bh=ag5z0JwA4Mm6hwAO2A7hUywDH1CF5WQZAJQqSEYLasc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fFRhmaZOiZs5U1M3O478E1euFBBVCrio08iE4bTrENbzaMjBcR/VMelTta0eWaHhtOxLzXkRNtAIKKf+LM8588VuD5hoGmn5svzvqH4iU8NilGI/ZTQFvvEcVtk0nWUOPHOZsLpUjer4LVwUzxCBkolFoyXSfVGAVP2lhbZCalY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNMsud83; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5607b6de4b8so239516e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858979; x=1757463779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZxnz4DLEMmHaYFaP9a9fqBtiXxLMoSIaCyGJsHJpnI=;
        b=QNMsud83Wztcn0Y8z0lkIG/1frph7VPGcBPfL+vALXBUNV1zN2Kkb+fRMtHk/72rQs
         3Gv1h9ijGGTVBG2KdkPnC6puC/l6/LYR+RAZmpmMlW8cR8hDDLBmwu/BwfWHZpWNEjY3
         gMxuT5+XT89ZI2wn73vugGTFFV3z/ruiFTFJrc17C7/fBMo/IJAYrdhMDx7q++1wplt4
         bik4Ow/aAMj+KrAAEojDnzokOh5RttLa2mFTQFSYY36Aw2PCOLULx1sv0BOBPhuOKOLD
         fsVctwACmd3K9saBPHWWHuYHiSbHE75hZe80+GuOcFLhGQ64lWZRnaHBXO+xHWFS+3BU
         NSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858979; x=1757463779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZxnz4DLEMmHaYFaP9a9fqBtiXxLMoSIaCyGJsHJpnI=;
        b=mXINiNgWBGGrGhzUMsVHoviySmC9kr4s0SeWKQFjQqeAYMJobe13qoFNHsrlevtOPA
         cezmTm3NOO+SmBLFDYNrNzDqb3la6CbcDdIgRrfvrz5ljsOZ8k8rfJO6BhayFiTVJAqO
         7qcwu97l4dx5ylbEbDMqr5+lGAuIh5qRQkW9A1UWKOF/36BFom/r4bUEbqpYjI+9Z61P
         FgASZBDD5RXunAi63zpYQRuE0gd79KhcGaQSyXW7A09QCJdhUIRJiCEO5yAvASMao+Fw
         EtMQvLjXhnEGltkebAb0tmVGgFNvI/9HRy16yXuNQmvPx7aYQNpXEg4oiHSM4aIO84SH
         A08g==
X-Forwarded-Encrypted: i=1; AJvYcCWh6ZcgV6NUA0xH+MfFbag4FdZbTGugD2NuLldrsCYtfc8bNbhDR/9DYxRIAIleGz9HmFbIT1Uf7UBxyQON@vger.kernel.org
X-Gm-Message-State: AOJu0YxMFxm8ZH2UlbE9oflY25kTziJyn6paXVu+xtHv0B8a8dURYAlE
	L2sCMqBQx+OrzaXWhFGtMGmynRrAoF5PupGV+SYzSHtqNOKMz5IveH7vLLMnd+9dcMA=
X-Gm-Gg: ASbGnctAzwtr8ih2Nr2gPAE7AxOhTcjjeSWwsBPJV282xcm06M25xsvJTNs69j/wIWs
	q0mbI3WntV2I8ai7Jrs1CjWI4biT4fRgm22IwfALU37FDmxTD1OH9PTosVby6RSe9Yb15KuDegB
	mUGT46YuAvsTCF85CjyVjuiPZB7ZO8Cmeg/kp0kp2FRmNEW024ZtqDgSJtIzzezeGML4pDNgOp4
	Tj6f0pL0SyVXnIuT/MrBmxpiLuhPmS8dcLrfKQBlJE+mANILbGwXRC3bxhOsIcnNWkd1pu4APFu
	IwNwM1f5946Q1oVCM+mXQycb1gM551P2EmaccR19LvRswSjLe0YNbXRRFbaZsFM7NGiDfOIXmWN
	bxWnErx0Nt6CKP+f8hY4YEVh42OLbtTqw9RPX8eblKW5d2jAmUydJeC2tAKP3c37df2z3f33vmo
	4wnIW8pw==
X-Google-Smtp-Source: AGHT+IG0WSztm4RifA7y8HjRqrRrlP53lUl+tPDSsHtQ2WGcEwXU8N8FrNhtzr4uEKdwCAwFLw0j/Q==
X-Received: by 2002:a05:6512:3e1a:b0:55e:a69:f4a3 with SMTP id 2adb3069b0e04-55f6b19a1a4mr2104612e87.6.1756858979286;
        Tue, 02 Sep 2025 17:22:59 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:22:57 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/5] media: qcom: camss: a number of cleanups and fixes
Date: Wed,  3 Sep 2025 03:22:50 +0300
Message-ID: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset noticeably simplifies common registration routines of CAMSS
ISP device driver.

Link to v1:
- https://lore.kernel.org/all/20250513142353.2572563-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added a gained Reviewed-by tag to patch 1/4 (Bryan),
* reworded commit message of patch 2/4 (Bryan),
* explained better a removal of port node availability check (Bryan, Neil),
* cosmetic and non-function clean-ups of lesser significance,
* removed already applied changes and rebased the rest on top of v6.17-rc2.

There is no any functional changes between v1 and v2 of the series.

Vladimir Zapolskiy (5):
  media: qcom: camss: remove .link_entities callback
  media: qcom: camss: unconditionally set async notifier of subdevices
  media: qcom: camss: remove a check for unavailable CAMSS endpoint
  media: qcom: camss: change internals of endpoint parsing to fwnode handling
  media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function

 drivers/media/platform/qcom/camss/camss.c | 99 +++++++----------------
 drivers/media/platform/qcom/camss/camss.h |  1 -
 2 files changed, 29 insertions(+), 71 deletions(-)

-- 
2.49.0


