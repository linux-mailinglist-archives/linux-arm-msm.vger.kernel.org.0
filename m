Return-Path: <linux-arm-msm+bounces-43996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A841AA026CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0572F1883F9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB84C1DE3AA;
	Mon,  6 Jan 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="if0cO+NE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195081DD0DC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170811; cv=none; b=ZylhvPBXNJOeI6c5/5c8w1ZT2vf1zQwgDhlh3fESVgWU378A3wyaQf720Fi9KeHXSsN8Jf9GAKpXXUrbgBi9SJ62yvbK9vc0c6n8iJtkkR1Gvi4CFQhOO85pxuCUYZXrkJWBmLCCYfWTq7X+ngkNtCwkeAnwThQJxB8gx/BCqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170811; c=relaxed/simple;
	bh=kOuzObGIDeq9i5QzIKVxGhblYTf6GWH0D11rX0i/rMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cnS6dMPF8hUFjGX0mwnfxsJwBSLmSblYv0/XyRKxMYKY7Cmq3D0vZwMEAbV1JEeupjxcwRDq4B+2dnYqXDvSYpr9VoVpY6Tctg3ZN+6fMRsLYonEw4q2yRKW4egRsPlyg8OEs+iyvo4yXranHtaEvw8kkUgP8H4vX//QsnOvIRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=if0cO+NE; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e9317a2aso1278959885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736170809; x=1736775609; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOsVt77FKfFVM+zZoR5LNowHV3GW4yGVDOGWw6HAjkc=;
        b=if0cO+NEch0C0LzymC+gWHYydH3TdtkmZs9U/0QoUVM0HTRshO9a1Mv6DLkp3ksc8I
         3stc6OGjeyKXsZZge2E1cLjk3po8Vs3ExoJCTr1uT4VsTUWv8HcyjyRuXH2lFbarCXOS
         hOETCuvsDOR5bfOVSMMPkl8x5gb0QSVBZDLtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170809; x=1736775609;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOsVt77FKfFVM+zZoR5LNowHV3GW4yGVDOGWw6HAjkc=;
        b=NZCCYyLzCLiKM5ofG04EDFQ5sEdTmNpvcx2Iz6icXF+y07/PUqGrSpkyw0d1ouNLY1
         AKijPeccJhtUQ2UJmddN9cDR0qlzuEeTfAMtcac0fbxQA0nQrPHwgiAr4V0z73b8yGBQ
         Rz/WaTxaN9hsRh4izHt5LBZdiI/+m7SzAi+J2agZVn5PGkjfL8htcyCQqM2jn5KpXjBX
         evxfCYnxXr/2NJjBOoI/SjhWGIXfnndjlAQT41kXdV5giSByM8mNNhDeFLYqIrr+nT2I
         GzIdWwtib78bBDi4Z2rAqgEgUJxxooTBX0O/BDjrx3aKNkNPfVFAoZdpNH6zpjIt7t0v
         tF3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn6wvK5RBIUFt+s6NSiMxhKNZ/win0+wLSQH6E6iwLzHD79j6eswJjEVks1bqoZBIrgr+t2AokkuOUAju4@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlTop5QMjXCioKEGoKxPap+UDrsk1X5C2umhn3EZwDN5Xnka+
	aW2DritU2nA0ZKqv7DdxSJcF9KdEmRObY/F44bGhhZOQcG7f7do4uPK4CWEs8Q==
X-Gm-Gg: ASbGnctf9XatxZx6j6xTuw2tjcR0MXOKCIa/JHOxevUIyLUOJIb52VSUpmBXvupMWCW
	lX9mO4bXXezyB2l/WpeeFawr4XDDxng0JCLDavQIiAhosbZNjcZeHQcKzdt5Snv/uihQS76yGbB
	FKDsk+is9vCVhXgSnidWXqgiVFMNyEl3XVSA1RcC/PnKMRLgC+SEgw7BLSJTB63O4k/o7arHsqp
	KBHvFrs+rfz2Bo0NduJZBSMNTWkpr9DHYkN8HySzOYRKsHPXmaE711lSyRCcBbiYQqYXdyg8PKS
	SyADshS2zI3w1b6FQWp7TECE6yZOyzvoiR5D
X-Google-Smtp-Source: AGHT+IHOKCJJs+GqomypNhXhviH5aBDG72Kpz2bchSE68kzYSNUTI0dva2fBVPjEv8K+wFfaAgMNPg==
X-Received: by 2002:a05:620a:178a:b0:7b7:142d:53a8 with SMTP id af79cd13be357-7b9bacb0a15mr7350182185a.19.1736170809034;
        Mon, 06 Jan 2025 05:40:09 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac478d35sm1501861085a.90.2025.01.06.05.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:40:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/6] media: Fix coccinelle warning/errors
Date: Mon, 06 Jan 2025 13:40:06 +0000
Message-Id: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbde2cC/23MQQ6DIBCF4asY1qWBAUW66j2aLhRBZ6E00JI2x
 rsXXdnG5YP5/plEG9BGcilmEmzCiH7KQ54KYoZm6i3FLm8CDCSTvKQO39R4Y5BC54R1AE3lFMn
 3j2Dz59a63fMeMD59+GzpxNfXo0rilFGpVONaEArq9mqG4Ed8jWcferKGEuyx3mPIGDjXttIgm
 DYHWOww/GCRsTCyrkpXNrJlf3hZli9yfeqvHwEAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

These is the last set of patches to fix all the relevant patchwork
warnings (TM).

To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Changes in v4:
- Remove all merged patches
- Improve commit messages.
- media: Remove timeperframe from inst
- Ignore 0 fps (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org

Changes in v3: Thanks Bryan, Dan, Markus, Sakary and Hans
- Improve commit messages.
- Use div64_u64 when possible
- Link to v2: https://lore.kernel.org/r/20240419-fix-cocci-v2-0-2119e692309c@chromium.org

Changes in v2:
- Remove all the min() retval, and send a patch for cocci:  https://lore.kernel.org/lkml/20240415-minimax-v1-1-5feb20d66a79@chromium.org/T/#u
- platform_get_irq() cannot return 0, fix that (Thanks Dan).
- Fix stb0800 patch. chip_id can be 0 (Thanks Dan).
- Use runtime (IS_ENABLED), code looks nicer. (Thanks Dan).
- Do not replace do_div for venus (Thanks Dan).
- Do not replace do_div for tda10048 (Thanks Dan).
- Link to v1: https://lore.kernel.org/r/20240415-fix-cocci-v1-0-477afb23728b@chromium.org

---
Ricardo Ribalda (6):
      media: dvb-frontends: tda10048: Make the range of z explicit.
      media: venus: vdec: Ignore parm smaller than 1fps
      media: venus: venc: Ignore parm smaller than 1fps
      media: venus: Remove timeperframe from inst
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit

 drivers/media/dvb-frontends/tda10048.c   |  4 +++-
 drivers/media/platform/qcom/venus/core.h |  2 --
 drivers/media/platform/qcom/venus/vdec.c | 24 +++++++++++-------------
 drivers/media/platform/qcom/venus/venc.c | 25 +++++++++++--------------
 4 files changed, 25 insertions(+), 30 deletions(-)
---
base-commit: ab2fd4a0ca26f3b4a7764f51ed3326ab89ab3213
change-id: 20240415-fix-cocci-2df3ef22a6f7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


