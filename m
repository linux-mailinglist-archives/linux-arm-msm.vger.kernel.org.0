Return-Path: <linux-arm-msm+bounces-18687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 003278B3F65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9A328559B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2A9B641;
	Fri, 26 Apr 2024 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4170o7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79F2C1A2;
	Fri, 26 Apr 2024 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156458; cv=none; b=A8FWi4ySvZ5btKYT8YAW3ugMGWgEIJtHM98ClG035NezmKrAATFWvozNaG0w6K7adDgSMDBQ6Lk/knSg793qwRdPFYYyUtRk7RCiOUtB+sE0HPwkobTsKmi1W79l9ez4hxAum/E0r5WQfzi20fcDegGCg/57l1IPesGn/vjf7Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156458; c=relaxed/simple;
	bh=dn81m0ceU+c+OAlkdaijqiJDrv8m/ANepXrsTu59LF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ub2RR+ScQClZN1cuthVV1KC8++wuipELvD7oJXvvNewScr+u+fAujNWzyolqJAjmIF3JuwxALnPAxi3SDNcj7diM4rojQkpvTo7gcFZg3ePUy0MNQ+0tTbmvgEHi/olHbEbb21q4AT/7TuoKTNTg66EzHw+LADlllbCAyXvjECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4170o7F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-349c4505058so1732645f8f.3;
        Fri, 26 Apr 2024 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714156455; x=1714761255; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P09Iq/jwd23QWkzqXg9BPn7EEyPalkFp7437NwIg8go=;
        b=V4170o7FMYMTtCreoteai1RsZtZemocEyigdqwEqvInI+EhYsJDXdSV3eo95b0tmiv
         jGo6ZMzJAozZuvtATlUciI49MImi5OyUnd75reENdJl2r1jlm1kKyGSNm6uV3zuqB98i
         bsWkZmzGQgK1o4YXuuX7/wdYmArUcVwWZbGiRgRouY9xKeUaczUmjTZ80s9KJFVO4S89
         dmzzTUOjRXLj7XR1PPaCii8jula6eW4QkWjLGpleaCrobGVYJaToXJhjUvEsJ/A1ydvR
         z4TQGGOKWKi7ezI1pf1j2tPYJKzeAoJIXtoxFymmTZo6KL2YdyLZc73opI9EPfdOcU65
         +xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156455; x=1714761255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P09Iq/jwd23QWkzqXg9BPn7EEyPalkFp7437NwIg8go=;
        b=njhkYceCUV1fuiF3V7eDACJPtCEQfNfiEDNGJ7/bYoXhrYTyM7dRnzzUGcMUFaG69u
         iAzY3kQ9DjtTakST7jO9Y7Ul/9QSN5KLZRNXinHSOEJc8Z5sab4xBV4B6/4BxJxeXse5
         VGf0CHcdGrgw4KP1zS7Bffxw0fBD6rMI9rfMzW4naF5oS8sygO68ucFYlULrYkW0A1dx
         wr9X2Plgy4xvKCKQlQx+0i8VtOTMg4bGzEjWBmokEnfiwZCb1R7mv6h1SRs/qbYMelgc
         n1OiNnrtrMlOyN36gAxa2DY/gPmqCP/lctopVQULF5Jf+hYD/YM1fSwkeoNKjGByyny2
         XpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsYDU8oSGk9SCBRNkoFFQRzIS90FBA+z1fjjctUIfeRtEh9l9rsA4bcyt0os7XTFZIdsBujIJstgxO20Kioxd0OoGtrHlAarmweA==
X-Gm-Message-State: AOJu0YySQHsKF+/vZFIRmjkBWm74e2HkDjUQSW8GG65K3ovf9iA/t0sT
	cgQm52vzlYYUGk7G6QaKY3llySBiK6ccW8cSNov4lKf7mQlKAUb/
X-Google-Smtp-Source: AGHT+IGX3JhLNRKnWt01+VQDc0xjJCnlKSzw21UO8z8Kzu558btX4mldi54I42yjMUL0aWCKZCdCPA==
X-Received: by 2002:adf:f6c3:0:b0:34a:80ed:9930 with SMTP id y3-20020adff6c3000000b0034a80ed9930mr2252661wrp.8.1714156454938;
        Fri, 26 Apr 2024 11:34:14 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:34:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/6] drm/msm: Support a750 "software fuse" for
 raytracing
Date: Fri, 26 Apr 2024 19:33:58 +0100
Message-Id: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbzK2YC/03Myw6CMBCF4Vcxs3ZImbZgXPkexsVQBmgi1AyNl
 xDe3caVyy85599gFY2ywvmwgcozrjEtBXQ8QJh4GQVjXwxkyBlHDXLrDSp/snKIy4i9SMueGl/
 bDsrroTLE9694vRUPmmbMkwr/d8raWe+qmqw9NYQ1hhd3XcrZXMaZ470KaYZ9/wJDOSoqoAAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156453; l=3558;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=dn81m0ceU+c+OAlkdaijqiJDrv8m/ANepXrsTu59LF0=;
 b=mQ0uwzTPXg5loGfDBlB1nqxctEkVYlbopQuw7ZpwK+lHQapbYEydQ5quv7tIDY4FVWycGYApC
 ZGODigjp24TB8SxYaT9IR+yDOQYm6eSIgJYjY/qp8d6HVrZfGxJZdAU
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

On a750, Qualcomm decided to gate support for certain features behind a
"software fuse." This consists of a register in the cx_mem zone, which
is normally only writeable by the TrustZone firmware.  On bootup it is
0, and we must call an SCM method to initialize it. Then we communicate
its value to userspace. This implements all of this, copying the SCM
call from the downstream kernel and kgsl.

So far the only optional feature we use is ray tracing (i.e. the
"ray_intersection" instruction) in a pending Mesa MR [1], so that's what
we expose to userspace. There's one extra patch to write some missing
registers, which depends on the register XML bump but is otherwise
unrelated, I just included it to make things easier on myself.

Note, 'drm/msm/a7xx: Initialize a750 "software fuse"' has a compile-time
dependency on 'firmware: qcom_scm: Add gpu_init_regs call' and it
depends on 'arm64: dts: qcom: sm8650: Fix GPU cx_mem size' to avoid a
boot-time hang. The commit the latter fixes, db33633b05c0 ("arm64: dts:
qcom: sm8650: add GPU nodes"), hasn't landed upstream yet, so we can
avoid regressions by merging it first. I think the rest of the series
can go through drm/msm for 6.10 after we land the first commit in the
same tree as db33633b05c0 to make sure linux-next is never broken,
although we'll need Bjorn's ack to land 'firmware: qcom_scm: Add
gpu_init_regs call' through drm/msm.

v2: - Refactor a7xx_init_cx_mem() into a750-specific and a740/a730 paths.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447

Connor Abbott (6):
  arm64: dts: qcom: sm8650: Fix GPU cx_mem size
  firmware: qcom_scm: Add gpu_init_regs call
  drm/msm: Update a6xx registers
  drm/msm/a7xx: Initialize a750 "software fuse"
  drm/msm: Add MSM_PARAM_RAYTRACING uapi
  drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 drivers/firmware/qcom/qcom_scm.c              | 14 +++
 drivers/firmware/qcom/qcom_scm.h              |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 97 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++-
 include/linux/firmware/qcom/qcom_scm.h        | 23 +++++
 include/uapi/drm/msm_drm.h                    |  1 +
 9 files changed, 168 insertions(+), 5 deletions(-)

--
2.31.1

---
Connor Abbott (6):
      arm64: dts: qcom: sm8650: Fix GPU cx_mem size
      firmware: qcom_scm: Add gpu_init_regs call
      drm/msm: Update a6xx registers
      drm/msm/a7xx: Initialize a750 "software fuse"
      drm/msm: Add MSM_PARAM_RAYTRACING uapi
      drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 drivers/firmware/qcom/qcom_scm.c              | 14 ++++
 drivers/firmware/qcom/qcom_scm.h              |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 96 ++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++++-
 include/linux/firmware/qcom/qcom_scm.h        | 23 +++++++
 include/uapi/drm/msm_drm.h                    |  1 +
 9 files changed, 167 insertions(+), 5 deletions(-)
---
base-commit: 7e6b8924568d1aa476b77323df8d2bdd31bd7257
change-id: 20240426-a750-raytracing-dee7a526513b

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


