Return-Path: <linux-arm-msm+bounces-25941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8EE92E408
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5731F2849F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA65C152533;
	Thu, 11 Jul 2024 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfXB027K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F95157492;
	Thu, 11 Jul 2024 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692151; cv=none; b=r6pDeJR9CV0xCtSQYFYmVFDsoYJKCCu7+ZH1JV4oLQ0VlCkrsI29sxjW1klHQjKNuz9SJ4v1Hl/6Wyz8T1Cd+1zKD/RLLID6zJNLnuB9xTayIWR3F2LRPZhfCcDArFAsH9UiSuS72sSLNBr7VFX+2YDVMZhp9EBAYRGIO9vr3KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692151; c=relaxed/simple;
	bh=kmgWtyOZTKJM+sAzcAkBvL0QpNbdfAmZ7s3njzEU70M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8tnD9/pqvtn2YQlHPWivUGJn8hp8VKPKBm86Kjz7/k83FvFGI9JqcTmJRMH21YVbblKe8oMUL0EbpNtFA+nkxlVOsY9jdZlDmn5MJSSEoaTXUCe+F8BJBVgab9kLQKE7FFp05sTnvmjDrdQErjxVZnn66SuB05bppat+s9xlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfXB027K; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58bac81f419so820503a12.0;
        Thu, 11 Jul 2024 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720692149; x=1721296949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7LlhYWp7nTMZ7K5CSP3BcZJAn5u5YMEvoL0KoMR+4c=;
        b=NfXB027Kz7BwV7gH5O20EQcayiXelJ8NOdw6gh2RAj10vGp1+0AJxTYf575BhzMZmz
         IoOUm++IBQHHGrco9ptq2fOnZVbm2zixByQwbToYZvf+JLSIBbbBqiqumXbeH+KGGsIT
         wskYhw3TZ7LrprmI/qE09zvufwRkMdkVEVfJ87voRc76K6xVoEhnCpNYtal1wdZzQkHB
         7EKo9gqtMLMh2tOBXy+cCvWfW4tpRdIjVe3r8EyDF4662N1KMgltcB5hhoExatLiWrm1
         mrVZV0KvfKwimH/Ur0U21AfD/KTvfSKOjHTOusJyw9aKFklkAUxWOAPIxkCPCreKxcjZ
         82kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720692149; x=1721296949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7LlhYWp7nTMZ7K5CSP3BcZJAn5u5YMEvoL0KoMR+4c=;
        b=GOBYMbKxcACLCVKZxJ+a2tC1T2z5uDfXYuQJO03qYKCv0lGNN6mquBk3+sixp0oV9M
         0cvIHeTmZv/E0jV6NEeEIKxOl3L352eYOp8q9xR4+hSWtacvQdX83KNtI/OJ1nnD0Zqi
         9MyXFfJ5MlavKss0vZWtbq01GZKt7ML26vSGzSPwaPJnbfJP6rDbMDrgKm8wBHQKez+R
         UlXzPOOgdiEjl3vLS1BEaCoC3A5jdDOu24Sa9yHqZ8gmQsnyBFU0Sh/yVGaarBHfWaCC
         O3CETVfUC/xC8qftXYlTOtR6+KpE36vQUBEotuTeMvGWt41IYnfTG4lUWey5BRC5bdvN
         smGg==
X-Forwarded-Encrypted: i=1; AJvYcCXclwg10vgGxB3qr0QX0JKm7gW8aCjw8OrMGj2R8a3ljYU0Y50i7GrNgIhdGCtTFlCtmEOpc52MgtFPWi+1jf+GBYv9OTaadXjceQIafkEG3EJ8z/BCWrx0yz7N/OZ5Pxxc7CXx8n33cVRGFA==
X-Gm-Message-State: AOJu0Yyf0IDYPl3pV0ZPeGrJ9sTr9gRSEf92HFXMiBoyBh7ua2386aHf
	VdGTmQSRfhr7s0W2Rqr68/0DHDOh6Ckv761A5cH2wLUV3q7A8of+
X-Google-Smtp-Source: AGHT+IGYQg8AZUImmAxC1jDm80glcTQzVnRnDnAM3C088/0+jlZf/fyKMvJlBHWFkzqB9e2hoZAe8Q==
X-Received: by 2002:a17:906:378b:b0:a77:dd1c:6270 with SMTP id a640c23a62f3a-a780b688911mr513379166b.5.1720692148336;
        Thu, 11 Jul 2024 03:02:28 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:02:27 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] fixes for Adreno A5Xx preemption
Date: Thu, 11 Jul 2024 10:00:17 +0000
Message-ID: <20240711100038.268803-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several issues with preemption on Adreno A5XX GPUs which
render system unusable if more than one priority level is used. Those
issues include persistent GPU faults and hangs, full UI lockups with
idling GPU.

---
Vladimir Lypak (4):
  drm/msm/a5xx: disable preemption in submits by default
  drm/msm/a5xx: properly clear preemption records on resume
  drm/msm/a5xx: fix races in preemption evaluation stage
  drm/msm/a5xx: workaround early ring-buffer emptiness check

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++---
 3 files changed, 47 insertions(+), 13 deletions(-)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
-- 
2.45.2


