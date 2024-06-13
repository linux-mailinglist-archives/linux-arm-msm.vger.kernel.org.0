Return-Path: <linux-arm-msm+bounces-22598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF490785C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EF51F23052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CABF130E40;
	Thu, 13 Jun 2024 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vvw7fxJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3195130AFF
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 16:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296442; cv=none; b=N8YVw9Owr/B7ZJ0L2dpX55kZxFtIKd7SrQ5khCXZnlXaBV0pwcygrA/veXb9OSD8XB4iPT1zwYiwjGxzFmk9KEJ4DcCakUDN0bWgJMRdSHPbJ9rjgM2xRVDDSCxROi03rFbDlRGfg8NSlA4SVLVOW8rxyQHxfXDndPdzImRGFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296442; c=relaxed/simple;
	bh=9Oy2rhgmMbROnThGOyXo7UyCu8RbyWradi7uQ/YWriE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mOxj7BK9sgCU9EJ5f8GEdTc1B+Cotnjp2/r0k663LfhqgCzXRMmk3Y82WIVGDkO9XthNl3mDsAwbN8uje0gqFnox5T3QO6uCIn/VQc2hjp2QaYmlj4u0EZmJLsxixD8kz6z5+a0G4ELM/11Y5RtKO+zf0BSZFli2IiSocjFjmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vvw7fxJT; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaea28868dso17055011fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718296439; x=1718901239; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHgrY4xIc9CPVKKUbUHFPFlrW7UpxJwbiRlbNkc9MGM=;
        b=Vvw7fxJTyKLNWc06vMoV0eWV2yh1+U7IdO/+dkyZBnpi4hF1Nqb/nqehJwZBGbtWBx
         S8EYcXMps7CHcQpktHj4+12Kk+SmZTg0mWlWl/HAtmaThJW9mEgYweumdTW6c6FJmAry
         83ljjJEs7aljkTMPxYHwk04Fexzagbv1o+Q07Qlwo8M5CWM4QZOjhyr+SDcXhT3MH91p
         Ki66b45AzyPM3DJ5nKK/vkyne7wJnG+EsbPrTnKlfA8lRA08wu5ZPDDTZwUPOXZFUwrg
         bd1wpdAq5YYyTU7b0PqrKM160ek7w7u76RoM/HdPgmCzVG57mLYFLH8Kw7+Tp8C9SuUq
         FQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718296439; x=1718901239;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHgrY4xIc9CPVKKUbUHFPFlrW7UpxJwbiRlbNkc9MGM=;
        b=ujgMklXaRin99ZLpKBPRBDE7uP3cpt/oLC7XLjAJMqXJ2k+yVnoLM2QOhS4vWzBz/B
         EeGOiJrGTfDAZ7VgEV/qJwuWrjwE9JpO6XyE/BmGbBMDjMFsZ5Zz+9abQCjkfkEWYUJp
         DtWJj0giJVTdwsv12N50xj02xB4T8y8rJZWYSZ0BAdW8UGmP5gV7dGKk7a9ivD8x77Hu
         WiE8vZUGX4CkwFmY59KR+CyVgut6+nHUyYNoc0txlnbQBI5BngdNIqvf1gEaUvV4GUIX
         OahIAOXxxq1Mrmk8TnpGl3+LY715QEPQRq2lDY38FD1jl6GgkAYbmdKQZtm+WBiLVfXO
         gWEg==
X-Gm-Message-State: AOJu0YwPg6x9LQAjIIT9fOoF+4cIkeVsa1tKMM2B/nITZyQoegl3BdSD
	wO7hirl5F+EkerBllvCK7qSjQPkMlCUHApcPyfPnoSrtA7w2FqQ4FoEmTWFps3Y=
X-Google-Smtp-Source: AGHT+IHQjwGnyIBB6w17aMs8YaOjxovU+qzoNkHKK0oqzTbPn4+mi5cAWSa9lQLAGg4Hgz05mK53Qw==
X-Received: by 2002:a2e:9943:0:b0:2eb:eb82:4112 with SMTP id 38308e7fff4ca-2ec0e4826dbmr2994861fa.17.1718296438829;
        Thu, 13 Jun 2024 09:33:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c9ae70sm3005621fa.133.2024.06.13.09.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 09:33:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 19:33:57 +0300
Subject: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHQfa2YC/x3MwQqDMAwA0F+RnBdoOxX0V8YObZNqDq3SwBCk/
 77i8V3eDcpVWGEdbqj8E5WjdNjXAHH3ZWMU6gZn3Ghm+8asGU+vip4oBTdh8IT5IEnCFeM420R
 LNC4E6MdZOcn1/J9va3+GH6EdbwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9Oy2rhgmMbROnThGOyXo7UyCu8RbyWradi7uQ/YWriE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmax91DGbuj22LlXzjIrZ3rzJ7TcRR5ZnaZlaZv
 xDd47ibag+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsfdQAKCRCLPIo+Aiko
 1ZRyCACHj5FwfHDMFnICBk6c9bsSibSfFyyQ7foUfaKd0HdH7hkKubcXTIzpfHkQyAnGxQfjHc/
 aqZ1VduL+GHVFdJBw/CZ8pL8YipTrpHrMGaI+vwxGutamsp21f9+8vZv27yn6BgIXzQtDckQd3+
 fWMKZfI0oNHZAKvea59SaFEqG10Q/9x7+yPwkMOLaLgeWU7i8LZVPLHXZ5BsGHt3sq/r5sFFeZf
 1v1NfNOppwJchUxn+3cWWw+lK/S5VNtwBKGC45xchIr/gIfvtKiqFsAw36C41urnMETEhTVGhD1
 aXUxik06RCS2hjyYgJdOTQSRVkM5GgimG0wIZm1P5MTnxcJq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
formats") made get_format take modifiers into account. This makes
kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 3dfbabdf905e..6e7fd1ccd1e3 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
 device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@torture-bo,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 23a5f6f9097f..46ca69ce2ffe 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
 device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_lease@lease-uevent,Fail
 tools_test@tools_test,Fail

---
base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


