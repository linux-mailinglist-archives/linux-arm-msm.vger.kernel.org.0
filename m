Return-Path: <linux-arm-msm+bounces-61469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A0ADB55D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00200188C9ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085AA2417EE;
	Mon, 16 Jun 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T1bBJ5YI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753A1F8BCB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087761; cv=none; b=jI+8F+pRccIhyxoG595n9h11BpLWSHG20cgkboZhYDW3JDF26zC9we/29rn//RupOKbmm+pHiE/KYXqI+EoixVAtOgvta7rfsCuZ1Jri1aITFgpbM5mJFwzW1o9Ptmpt/oRtBrusaLlJOZfk9YIUFEtrlfOLUBekiseg9AohvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087761; c=relaxed/simple;
	bh=9mIEujvpvhTohHMZiy5M0YoUiMGbG6gmK8Vd0nLEiI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tpKK9FmTzz8DDic3ZSJLVmbhFiA+V+/J2dw43/ubWHIODkGwf7JTZRxDk6g8protZv+63N6mP8IOs8Yu7Z2BntYAIfKTLoHSk1DQMmWiz8V8n6zyq9crF7QPG60Jt6SZtDoohVhXgTL+TNzPhTAqoMLzKkHVmLlXYhNYtOPoxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T1bBJ5YI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b165c80cso3414142e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750087758; x=1750692558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GrYQ5RYm/ndWHeW4zKWZCLsfb835d3RGk3FNTjrEr7c=;
        b=T1bBJ5YImNROcy4fvQB2HLFNW2DWcsc+UdFfZrG+8qHaaCATHXqvhG8Y6l0Bnj5atU
         AKWcPIg+nzaOnxXeRjh48waIgUjvsrGz58xBf31sOQXHJaZzQys4QwuzkReSCStUDAMg
         8RI1ZEcZvZaltkTj/0Rs2FoI4JqN1BO+vrmKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087758; x=1750692558;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrYQ5RYm/ndWHeW4zKWZCLsfb835d3RGk3FNTjrEr7c=;
        b=E6WwejxmOYN7RZBGTFfI4Ho4QR+tiPwBQw6B+S5JfR7r5+zupchMeH02fl6ChEgef4
         KL7n4KtHRymuqwfoNur7pTZjhYs+h+4PZCWk3Hbxf9PD97E9ZEiQfHGyKbyP7aNfza8F
         izt3LrDl7JVoNrUOW6AOjEs5vyb+FsS76j+giCzmL9DKjWShwezYf+9Q6oLTWMuLdj/a
         wnHGfmzaowjCtsj3DZyXYxPEiLP+JKDwcPFB8NcEzpogD2KVXH3EF80tyP0tnEWFOcow
         GyhCXlUjrIBjF5Rri+4mTKqQw4FxG0zXZ3g2LfrRkUITG33OiLadyJVerRb1ru7f1oCb
         fxvA==
X-Forwarded-Encrypted: i=1; AJvYcCVHrOnIvwoypUCiGzegR/hCShx2PwNWtz6Yqb6n5Iwy11lGcTiWXd7lRwiSReJOrBcdp4I7QzjtdUrFFk1H@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6293QttvG8IJqso2RvtRRjRK1uR76myiVTl9uQbqDTncElpA
	th4WzpNPH6zZR019uFIK6xUw75WU4+YcjmoMPASaOcUv//qiXB+qt04WKxQMZPlGXA==
X-Gm-Gg: ASbGncuh3XabVq4Npax+7x22X/Wr1KbGsFsfUjkg4ivp0XkjQtpP9qg1Be/3AM6UTnS
	ge0Mdn2q2xFFHwtq8oq+YctPNqXTSeO197A1AlPQTnlSqnBX08tPG5nWGZ7o7IXYIEACE9eWkX1
	uGleo2ZbyOeSY++B6TnB2rknkRb9CI1xStgeqxP9pyhwMkieI3XnaMavmV09ifr5VPJP2MPtPNn
	RELHiSeaPKoSFP6ZeqaIr9TiFtQ6ETitLjKjDgZiNLG75SVzfdVSIGwBQSlkj8/HY4IPYWi153B
	MKTHEsxYMwZ4ZINtQnH0mMaVtG1j+tMeHzIzpcYFc1iXcxdEXVmlt6q/ytKLxLPMcnTQ5s+UHIL
	LEwdt/27ZB9V9ZICgLVt6pa5xlNZxgZHeVOqbT63Dmw==
X-Google-Smtp-Source: AGHT+IG8dwx90CB8xqMFS+LG9CbZSlFFxF8OJOXueRX1llJPl7IR0aw+2En90Yu09u+vcnLxI5GGLg==
X-Received: by 2002:a05:6512:3a92:b0:553:2edd:a7e0 with SMTP id 2adb3069b0e04-553b6e9c0e9mr2419431e87.16.1750087758451;
        Mon, 16 Jun 2025 08:29:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff5dsm1568020e87.31.2025.06.16.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:29:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 0/5] media: Fix coccinelle warning/errors
Date: Mon, 16 Jun 2025 15:29:13 +0000
Message-Id: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEk4UGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3ZLU4hLd5BRDgxQLQwsTQ0sDJaDSgqLUtMwKsDHRsbW1AP7ZUo9
 WAAAA
X-Change-ID: 20250616-test-cd10d8184190
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

These is the last set of patches to fix all the relevant patchwork
warnings (TM).

Changes in v7:
- Fix error in clamp logic (Thanks Vikash)
- Link to v6: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

Changes in v6:
- Improve comments for tda10048, thanks Kosta.
- Link to v5: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (5):
      media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
      media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
      media: venus: Remove timeperframe from inst
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit

 drivers/media/platform/qcom/venus/core.h |  4 ++--
 drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
 drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
 3 files changed, 24 insertions(+), 27 deletions(-)
---
base-commit: 4d2c3d70799f5eb210003613766bbd113bbebc1a
change-id: 20250616-test-cd10d8184190

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


