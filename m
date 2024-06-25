Return-Path: <linux-arm-msm+bounces-24154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F29170B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CA228BE9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEFA17D346;
	Tue, 25 Jun 2024 18:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npE87Gbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415591487C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 18:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719341689; cv=none; b=GDnFSEphSQNY9mVffKow9XYSYowwBX+U2SX7ndlU2kjug6VJa80EYxeN1sq0FXfF2gjONX36XCavb6Bs8AjI4mBNIcl7PbHUptfxwjrm5aJ/mwyBJC4GU/o28MIUwijyxBVeBF1POfhYOL52dKOXsYvqprFi3Hx8LB4nmOdw6RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719341689; c=relaxed/simple;
	bh=E3eCmwo7E5Ovt0YtNYVpLKfzxgHw/0XSzCnMXdpVojw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sw5hCzYxc8oOQmTEgLeBL+MrkR/FNnWYUh3qfH5YPnyqLZFcYE2pGnXs1PgIXsdlP12Rsg9vjxJRrTmD3ZhCYcfZCSlF3tfsR+/XfwUMGRbwkDVec2WO4MI6WiJR/BdKoLbddyktwiy9NwGMecouJ1vLQBmy61UuBhLj69HDzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npE87Gbn; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so834199a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719341686; x=1719946486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlWLevDm2zqjucsLvNz+sklzdCOVo1h/iRiYHGn0hRY=;
        b=npE87Gbn5daODtrf7Qe/Ok4FE0pOFHZ99n+My5Zeu3ree7nfCeCLG13h41lz504Q8R
         jGq47RDTfld79hA/preEpEkgBjG0fktx/L6THCPS5O12L6vHj1XTKCM71Wm0NC+F3+zA
         w9/ApSUk8CJuVU9fmVEtX9LDxZ9MVI/q3MY0sJQkIU/exi7pr0zWKmRIV1p2ZKtud+pW
         CRe60L5aqRkIZ46hDlNFX2HotS5rwR+0169IzbHjT4gvPYe2C5a8lFNLzEOCKfNNAcjt
         DbzhmN30Q5+Zx+G3puBVqG35anVXhHjVmTRY7u7uZv/lpOcniTs9HEA/RIm+3wvNeA+1
         cCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719341686; x=1719946486;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlWLevDm2zqjucsLvNz+sklzdCOVo1h/iRiYHGn0hRY=;
        b=tNoR0o4e4VJsJPv3ZXpROX6ve1pD6MNT4E6dxZmo5ylY4XNO0DCQHE0166FEsm1ztu
         yMPoSmQiZ7ZncPVD34k3vs5baP/svqcZ/KqSphUtt+SX05mmeUhPg0OIUzHOSM5IEZIi
         PzP35ojlwPz7A6dI7AmU4jI341dvAr5+dx2dLMHSRF55yiHvPgWIGL7RWIwKqwGQaGXo
         8xcrQqjWLYNQYvNxW0OaIfA3ssce7xhwbfh1GnYk01Kk5VpKXPMOfBvMJa0EQUd8KbDA
         A3TNWjDjdfJY7EeOslnhY69f4LhhZ1txkcbUZC/sWyiiKCzWY1YgiMCc6G7pf1C4jh9q
         pyng==
X-Forwarded-Encrypted: i=1; AJvYcCWYb397XC9ZMhjhYzggERM/mVzUUeG6RBP9NVCWh1ubDbxubUGDMKfRJWuAQYK3daII/C9OWstDJfVws3wff4EdRtUBvvKpipnPcB5h/g==
X-Gm-Message-State: AOJu0Yym3TrinAK/2HpmEeejE5vFuoxiNa9x79iashi7ObBANCxclqvb
	+cO2JlXQDso3JjHX15FOVRbJCnaKcuNXGIJEHQznEitd+bSXxU3Xt0WzO2S8ncc=
X-Google-Smtp-Source: AGHT+IGHmSo6n9cThj/nFhMH1FZ54jR9wobPuBoU/YgLk/mLOCyPuoU7nb07meAeeYoB7DOJTGYZOg==
X-Received: by 2002:aa7:cfd5:0:b0:57c:bc03:caa2 with SMTP id 4fb4d7f45d1cf-57d44a678c3mr7057357a12.20.1719341685289;
        Tue, 25 Jun 2024 11:54:45 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30583e93sm6206332a12.96.2024.06.25.11.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:54:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] Clean up barriers
Date: Tue, 25 Jun 2024 20:54:40 +0200
Message-Id: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHESe2YC/0WMQQrCMBAAv1L27EoSk9p68h8ikjbbdkGTsilFK
 P27QQSZ0xxmNsgkTBku1QZCK2dOsYg5VNBPPo6EHIqDUcaq2jj0QSimR+eldJLRtMPJ1WdrrG6
 gVLPQwO/v8XYvPkh64TIJ+f/HqQaXNHP/u+GqsdD5LijXa92G65Ojl3RMMsK+fwD6Ib6YpgAAA
 A==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719341683; l=1005;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=E3eCmwo7E5Ovt0YtNYVpLKfzxgHw/0XSzCnMXdpVojw=;
 b=nm2/y18vGTibvoO/K8B4+1PtTQxWCP6SmmrdpvAvjFUoXQ3/QY26QfV6MYAYv8xg9+AR7p/1n
 A1mKNCOQQM6Ay3n3EwxDYCE1OJhNOxdc38QGrDX+QxWgyUl1F9hH+nx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Changes in v3:
- Drop the wrapper functions
- Drop the readback in GMU code
- Split the commit in two

Link to v2: https://lore.kernel.org/linux-arm-msm/20240509-topic-adreno-v2-1-b82a9f99b345@linaro.org/

Changes in v2:
- Introduce gpu_write_flush() and use it
- Don't accidentally break a630 by trying to write to non-existent GBIF

Link to v1: https://lore.kernel.org/linux-arm-msm/20240508-topic-adreno-v1-1-1babd05c119d@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      drm/msm/adreno: De-spaghettify the use of memory barriers
      Revert "drm/msm/a6xx: Poll for GBIF unhalt status in hw_init"

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++--------
 2 files changed, 7 insertions(+), 11 deletions(-)
---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240625-adreno_barriers-29f356742418

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


