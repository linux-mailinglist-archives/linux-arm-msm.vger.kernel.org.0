Return-Path: <linux-arm-msm+bounces-42745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D039F7610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7BC816D64E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829352163B8;
	Thu, 19 Dec 2024 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yc9dV3k3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96051E0DDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594575; cv=none; b=NvaA+hOa/mVIP9s8oGE2DdqbLvvYV3VctPM/83WyzZ0BBtUUocjQAwBTnDr7zZJbGSIgRPQ1Cg+NRrCiv9cXGj3cGztEL4bebwJLFowyZtVz7qHC6vEEASsbL0ZNPY9Wb6WYkCKpXFPtm2Ok4JEFRsYs/YzqA/KO/zMZLqWUGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594575; c=relaxed/simple;
	bh=zN5HnqTuUFbHWN2xmfhJlV9TJeBXDkMJL6nQoOxSw4A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NpNdhVy0/BsNwIDguFD9R6XGccdhaP4e2mWZCE3nf3IfkVaNA9pne8skpV+F1aFQE5IMwT5pN94hPTJFnf7mfcGc1nlSXdRMyZcPSL6pqzS1O9jjnXibbklYYNCvlSq9XPDeMiQTa71vSRcRfE4QAwPacsPKCB9fx7HqLhWQSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yc9dV3k3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21649a7bcdcso3697195ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594573; x=1735199373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/Mxxt7JQ84hYIkD870zHq5o1qoiTTZ87YF88ScgcDE=;
        b=yc9dV3k3T7/FPxec4LMxesdFkNMqUftA7wcBiJtXcFL51MyGiJ7MRwace0kviE8RUI
         mlJtW6TWhCp3YZJ/JTHbyoe8k/wKajaC15yz1kMy69ZW7i/T3zExEZqwzBzZFFAur4fA
         mt4ax/0vlM5KcmnVigGnhIXy/iofj9uArMXisfqdurF8k9eJhJzTL8nnNujMGqQk+IuQ
         CqMxlSIuwen+Nxw4Wu3xrgRtxTTx5GXweo5MgjWKhXN0PAq7LnImH40aZQ4oUmEoGhde
         GCBi7ZeTSMaZDSg0TNmigeG4L9du39Na0ungTiJc9XMekBhLYpPNbU8wynM4yjlLediF
         kBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594573; x=1735199373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/Mxxt7JQ84hYIkD870zHq5o1qoiTTZ87YF88ScgcDE=;
        b=rL1xNdC2eiv+/pjaHvPhZl7qoypI9asBV3o4xmQ0tccffyhW39HzzUZXGp4/gtg6FD
         1BrlEhlEiauXoygXhucoJ3IHmlpG8a9Gw9qEIuJvaLA6Mr50b0cN7Hkn/i1pJO5ELRP9
         gQouzd6W/o5z+VQJYu9R8y+ekfZmzQUnlvjDv1VevYpbgM2K2MAey1Fud3jxPBu64ywH
         r7mRlnTmPWYuPCSL/FFd1wXjGuDTzKgYQ/YoZDLvPC1yoTULvdJuBGJ5rFihK9Np/Qbr
         rKBvAfV/qbDkxtETuyjbw3qmn6biif21eor/NDOYHOQj24QF2Hf0E9w2yGJocEt+wBov
         rIGg==
X-Gm-Message-State: AOJu0YyKN3BA0WGCKZMuhQtv609Pl09ogiBbrmc9TIa0PtzPZ/3T71YM
	AHyYKT6qiJZ39K32IBOE8QNqj0EdmeHaMCpFYOWSTlNlFhsjbk5iyNhl9DPfr71tM9p0vnNKP7T
	TmdDkYQ==
X-Gm-Gg: ASbGncvOdLTvbiSGBVS7AYChb6cH5O8eCQmeD58hFD0iBjC0YZ+9H1HnaVY3n30eake
	HavpH/oJ+A4wsnBjaw8u77oaTQ/CPa2J2KSkq2JXGnO5yyPx9rcAXkbBP89bp6jSWj6hR3AZZz4
	ig+71pMwbxqt8mth5wSXLek4HDsSJNfBjP4FjRmxn03yz/suJolh8bhayIu5/Shd5XT7he9VyFR
	BNG6z4chm3I/bTpsCtpEIJSvSfVY8ln+1C4BRfOkB+8MDwxZc2X1A==
X-Google-Smtp-Source: AGHT+IEh8MiBuiAY+wfmZGe08P3F4Y76Bzu8LbffXNv+nNHhutAo7IXQzLoeGJyZkYO8Cv/crpJlpA==
X-Received: by 2002:a17:902:f549:b0:216:2259:a4bd with SMTP id d9443c01a7336-218d726bd64mr84564155ad.52.1734594572962;
        Wed, 18 Dec 2024 23:49:32 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:49:32 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 00/15] (no cover subject)
Date: Thu, 19 Dec 2024 15:49:18 +0800
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7PY2cC/x3NQQ6CMBBG4auQWfsndCpEvYphUZhBGlPEjhATw
 t1tXH6b93YyzVGNbtVOWbdo8TUX+FNFwxTmhyJKMXHNZ8fuCkuXtqmxtXAeUxKIDs+QBUnM8F6
 DYF3skzUkeAb30g/MY+O8oxJdso7x+x/eu+P4AUg3yg6AAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=4394;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=zN5HnqTuUFbHWN2xmfhJlV9TJeBXDkMJL6nQoOxSw4A=;
 b=ow/wPrSYS0qN3Mb0AB6k1A3Gr8FCtLxfXa9/nNNTJRV7O0G9MFIp9FwyVun43XY23cyRuP5kH
 4xgdrFzNsEOAycx9wyYhTTOQq+M+zz2BkBFU/R566Iq8PIh722sWL6b
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
drm/msm/dpu: Support quad pipe with dual-DSI

2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
And 4 DSC are preferred for power optimal in this case. This patch set
extend number of pipes to 4 and revise related mixer blending logic
to support quad pipe.  All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

This patch set depends on virtual plane patch set v7:
https://lore.kernel.org/all/20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org/

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org/

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (15):
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  77 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  74 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 403 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 219 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 13 files changed, 511 insertions(+), 348 deletions(-)
---
base-commit: a9b9ea7b45d661fff0f3fd2937703a536f528cd2
change-id: 20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-2bdbc22f5131

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


