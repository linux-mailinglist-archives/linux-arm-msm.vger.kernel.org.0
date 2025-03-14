Return-Path: <linux-arm-msm+bounces-51515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32354A621D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 00:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0501C19C60ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54FF1F427D;
	Fri, 14 Mar 2025 23:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggi3jSm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9FA32
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995361; cv=none; b=Wbl4ya44G2VWtD688YVKXK0pD4FIFvSnHgMk6IZSvc6PAB7WHCWYNuMY9N03ZN3iQw8hik4wNxvxK+3NnBOEHtIzg7UF/k7RTZwgHqLsNaEgPCS/003uTlmmjElrcgRFKM2DojqZaCIHHcofxK4gvgIj98QTsg8bbDBTUoQhuFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995361; c=relaxed/simple;
	bh=C/l3fwk/2T0plTPVIQKDbZjyKbA76umLFn/1EqjQG84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RPy2DXoBuzQ3kd2mKeMAYu7MFReRc6puGj4V56jSqmK6Oprmcr6IuEDYJ46j9hj1WVraYNsBCfOWVWN2WufzHcaw7uofvWrDnGjKs/jOGb7D9nl45gOq8nA8++86wEollRfNpp/EOiHYMLWqcmC8FuZMKZuVtsV4EmzYD/VrxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggi3jSm6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac298c8fa50so496469566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995357; x=1742600157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fU4Tve6fIfWn/FXi4hgJFogbldzonVfrEBFp+mMLKs4=;
        b=ggi3jSm6ppn5g0A+t1gUKsScjhIVINT6wolsAWtIXmb9N55RKP6vxCuaG3muOt6uMy
         8S8Xu8mnd2pc+dvU8uXyUutS6/IdIRG9A9ANv38GjL3mS1Rx1i87J2GFY5zZk3xHjPhD
         bm1Fa/qW/+p3WRXE032ZMf1ajALPXGchoFYU+pgXJQ38K4yxBEUoal/enITLJLIgyMrO
         ztm29bu7WALiPkZ/UibnT4MSc1OQ06M4rpDv+d34JyDvVz6tJBiua28STdhKWEvzU3zd
         +qhJY7dSDrGbQ3bhbLBxQ7NqMZ40Ly42ckWKkafdHQaGoEjWAoAL3dI5Q0Galb55TXqr
         Kx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995357; x=1742600157;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU4Tve6fIfWn/FXi4hgJFogbldzonVfrEBFp+mMLKs4=;
        b=g5VhfEWBPepaL5T9mT9ooQ5ZPUjVCWJmuvVNvAne53b6tnpqKPtsqUK1Tmwm2yBJw4
         ewM7gErBzrqN6n2TJSc3m9Ar6tpS1BBUPKRTjZmI2kVJIzLFrunARE5536tNvk1A7Pq2
         LwdLOf7YYmnPLPNmt1cQelSgqlfPvpEsg1lMP9v4w4/0CiTtKx5hEjV1Th5e84yu/WGv
         aQnmTsREKENNCI7Rh/k4IkxcdWYhAjDprIj8ro3nQyn1iQZtsi4h2/swvbrkI4SY5+wh
         WloRUzCxfyG817hhp6KIIraeSLgOm2VyG4aHUiTMCR+EWjnx00RA5irwi8XRFGXo5wwr
         6Tzw==
X-Forwarded-Encrypted: i=1; AJvYcCVyWVlDyASBAmdYEyprPQPSsnJhUj+zY1qTNOpBkDpWip36wo2XG3xdONpP5/HLIA9ZLYDm+YxG+bFTNv3e@vger.kernel.org
X-Gm-Message-State: AOJu0YyZQF/MVYz0wfRPANMjJ2yTkUD4kWsRw1V+gLUJPRSq3bt4JdXv
	UMNoJ4GqdXf23NlHBlWPMjsZ/Z1+mb0wOCEerzrWYBVilR8RRnDcba90me9hVwPmZ/vTPrepbr9
	MJF1EWQ==
X-Gm-Gg: ASbGncsssm/mr6XulD36TJOJEav8CHjhGQrFp4LSIOTcFkEZfuHI3y2zi/esdyxMoff
	lm7PumwjBbCzJsQABlEXY4recv1mkk9Pl/LnvSv2lwxho10jFyoFJ1pCAU7TXqbNX6NgPEDQXWZ
	GhIETmxYG0Nz9umSn68nGC2+W8O+p6rvb8gXCCum3hdPQKYJugeB4708yxDQoy0vMbwQ7rblVBi
	z73fAWCUg4l7dngs9Miyt1j49xKpdEvEBKud4oFfGQ8ieM5PKURu7ajjgu5ufzyMH1nhknWL+HQ
	jlzMx/i4E55CktEd7tmviQk1n0+Ngi8FoOShHqOOKIhJyZ0ZJWzajDIIb2nQ17xaTcpDtgR0Nyi
	3U/IGGxNrD+Vh0YQy5g7EPLgpVbDs7ZcVIRXy1ZSn2Tihqh8N9IHHCQuYgOi4R7v/Rgwa
X-Google-Smtp-Source: AGHT+IFz2539BrqrnDsiyhonqAHwWCIzmZcKWydj6iT5Z90xZtFLC3SyFassxSw3CH+m/pkZCYk6hA==
X-Received: by 2002:a17:907:c0d:b0:abf:5aa6:eb9f with SMTP id a640c23a62f3a-ac3304ec11emr409550766b.55.1741995357162;
        Fri, 14 Mar 2025 16:35:57 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:35:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/7] media: qcom: camss: Add X1 Elite support
Date: Fri, 14 Mar 2025 23:35:53 +0000
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFm91GcC/x2NSQrDMAwAvxJ0rsBLnC5fKT24ttrqYKdIJhhC/
 l7T48Aws4OSMCncph2ENlZe6wB3miB9Yn0Tch4MzrhgvPX4nLFQ5ohpLdwaiWKl3tAFNB6H0C1
 djDUGUyyqmIU3EswuuTkvy9leA4z4V+jF/T++P47jB1IYuXmIAAAA
X-Change-ID: 20250313-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-d2c24d667195
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

v2:
- Applies RB as indicated - Vlad
- Latest declared year 2025 in added files - Vlad
- CSID680:
-   Moved CSID_CSI2_RX_IRQ_CLEAR - Vlad
-   Defined GENMASK for various missed bitfields - Vlad
-   CSID_CSI2_RX_CAPTURE_CTRL used as name - Vlad
-   u32 val, variable declartion order, 4 + n - Vlad
- VFE680:
-   I left the DEBUG register defintion as these
    are used in a debugfs series and I'm generally
    in favour of maximising information disemination in patches
    including comments, defines, register lists and bitfields.
-   Defined ENABLE bit - Vlad
- CSIPHY3ph @ 4nm:
-   Retained SKEW_CAL I think we should import SKEW_CAL but
    do as downstream has done and provide the ability to select
    the skew, probably from a DTS flag.
-   Removed duplicate writes. I tested, and its fine to do so.
- Supply rails
-   Currently defining just the one set of supply rails.

Previous: https://lore.kernel.org/all/20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org
Depends: https://lore.kernel.org/all/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org

v1:
This series adds X Elite support to CAMSS.

This drop includes support for

4 x CSIPHY in DPHY mode 2 phase 5 GB 4 lane
3 x CSI Decoder CSID
2 x CSID Lite
2 x Image Front End - IFE
2 x IFE Lite

Dependencies:

link: https://lore.kernel.org/all/20250113043133.1387162-1-quic_depengs@quicinc.com/
link: https://lore.kernel.org/all/20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (7):
      media: qcom: camss: Add an id property to struct resources
      media: qcom: camss: Use the CSIPHY id property to find clock names
      media: qcom: camss: Add CSID 680 support
      media: qcom: camss: Add VFE680 support
      media: qcom: camss: Add support for 3ph CSIPHY write settle delay
      media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph 5Gbps DPHY v2.1.2 init sequence
      media: qcom: camss: Add x1e80100 specific support

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c | 422 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 131 ++++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  28 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-680.c  | 244 ++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 350 ++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 11 files changed, 1166 insertions(+), 17 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250313-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-d2c24d667195

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


