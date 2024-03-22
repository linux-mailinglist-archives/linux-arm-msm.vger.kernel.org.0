Return-Path: <linux-arm-msm+bounces-14835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47639886CBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 042A928251C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDA54502B;
	Fri, 22 Mar 2024 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJjebqaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6680B4653A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711113759; cv=none; b=lRKTfaxsh+YgQKD+ztMJ0uYUNhEWPo7Bumu7Rj419geTHIQ0gzZ0HIDBMEG7EWCvzI3vAhtUVFmVtmd+6YAiPAczg+LpAkTcvkuBu7OPJV/gNRWJu7oqtNts037YdDijbVEtNDxKsQOByKVzIKyGTA8o3hK5zh4f+NvjsMvyV1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711113759; c=relaxed/simple;
	bh=edVU3jeCTQ3gGUgwZ920jvPlnNbROZnf5Iox4JZ+SFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YxYZREjj13hrWS6RV+VsU8s7dVDbgwTbzEs18Vlil+GWboivi2bszwY7CfVeRckCuDMAGlDCzs5/upuSgMBxE+Bbk6khJhh+8TLDZuKPxMJ9JLDzQCpFQgxKey7fkjOZmQxIjs0doWfdkI7aMDRqWxM3D+JwJaYAc+GMqcep2z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJjebqaR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso3690625e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711113756; x=1711718556; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zarOYxCOo5GM/MnqDwI9RHuDvosKvb8moWuxJ17HxLw=;
        b=uJjebqaR4zM7r0mHZHN/Gwu3fPeMHv7wDy0NUQ01UAlkCfJAC5JfPHdWALmH1OUMbH
         5tcKAHNTCbewLrw9y3C70JOd9/jTSmv76skP63A8U8I/9gIhzvlD7RJbkAkzdZ/ihIOh
         CpcAyiPxCs28h2E68nC0OjgBzSThzCzV5ZSaifCGUo5v2g5bz/9OMrdVGKFxAmmkkclJ
         BUZ8hTqWOMWxX2CRsaz1KyJdPOJO1BniTcTcrL7y0zAIeSXQzfRzpksuhIITDxCtosQy
         lGktQBUa/8IoakHWljWSK4L+gA43egjp5p6J1R5mlhX/D8fobWQLs6wSAbVWVxkRcJcI
         kbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711113756; x=1711718556;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zarOYxCOo5GM/MnqDwI9RHuDvosKvb8moWuxJ17HxLw=;
        b=Smd+Ab7Ilqc92haf3iHSLDq89p/MUV42qEfv5sN3rhI4oOM3g7rmXbuI7U8Sfwt/mY
         BZrAJV3gHXauxOuM3Wut8E+JVEw4cg3ZoNZCM0ZPkV48UxODzLuYc4j10C2FOEBQcOro
         MwS91fmPs3P5zggqLVTHM91q5J4B/KWZX89NXk7NALxuSBdePrNdrSuqV3fw4QrDOtG0
         UDRcVkHkhlrqUYj0CxtYC98iPierEMDdhFU0DbtC9AZpXCSvJQklLUE9NpU4Nw8x9vgv
         UeVdplueuIAFMJD78804virUMCoLGUTesdqHLMvcM4p+8GZCDlj6fdLAbfv+dnDPd/xk
         /Hqg==
X-Gm-Message-State: AOJu0YxdZZHX+M6hNZYmp6J7ggCkn0a1XAApIrFmq0gYMdfBWIQ4mwid
	Bd7G+j3QnG5gG3Fvh8Ksdkyr7CFziT894M+A+JvMFDVw2G3jPjAzBnDUxq3tqPQ=
X-Google-Smtp-Source: AGHT+IFOFbvWvo7GMTukyJv89a/PooUGqfLkHCaYymF5MM/BdYjldHx0hPdF4ae4qIO3iRk/f3uQpA==
X-Received: by 2002:a19:9116:0:b0:512:d5e4:1aa4 with SMTP id t22-20020a199116000000b00512d5e41aa4mr2133765lfd.60.1711113753386;
        Fri, 22 Mar 2024 06:22:33 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id m22-20020a170906721600b00a461e206c00sm1014176ejk.20.2024.03.22.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 06:22:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/2] drm/msm/dp: Rework the eDP/DP modes and add support
 for X1E80100
Date: Fri, 22 Mar 2024 15:22:21 +0200
Message-Id: <20240322-x1e80100-display-refactor-connector-v3-0-af14c29af665@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2G/WUC/43NTQqDMBAF4KtI1k3JjD/VrnqP0kWcjBqQRJIii
 nj3Rlftrrt5w+N7m4gcLEdxzzYReLbRepdCfskEDdr1LK1JWaDCHBAauQDXCpSSxsZp1KsM3Gl
 6+yDJO8fnxUBVVRY1ac5FkqbUscu58nylPNiYaus5OsPxPfxCIcJf/gxSyboixcCtKZkeo3U6+
 KsPvTgGZvxG8T8UE9qaApqb6Yh1+4Pu+/4BWL5LkiwBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=edVU3jeCTQ3gGUgwZ920jvPlnNbROZnf5Iox4JZ+SFg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl/YYOECUpQjcuKiiQsDAY//fbkHQz0j5YwGNFT
 YkbKSr8N/6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZf2GDgAKCRAbX0TJAJUV
 VgFvD/9JHvp+vLlvhfZV9N12OsXJkgnbx/YBQ/QCk+Gnx2JKan+BKphy4bxGFAxjrP5wf7YOygz
 h0amEA1YCAbUi9h6lJYnVYieS7YXm1ZBI66s1gZYP3x5vXIbEzdZjc6ayXZwXgDz37OuDtif7F4
 rxZYEHAxIwTqyv6AMr3k5gc32Raw0msPXhxpbIVNIBX9XtE0dyGFW8iu7bA6CPlPwz+nJAcNN1N
 RD6a62szt1gWxjHtWHdM7KadZ23TDHCZwZ0cKneOSrdjTsx+qo+ZqDlez+FZY8fD8JkHrSIGhnN
 HAnqZDC3OVhkj+Of2CiOfaIof9ShJACVm2WFW6miOFiTZmf/Mb3x5Lk6fkUWN5Fm/UhP3fmrkTS
 YdAY9OTqXqY8UgzVFfFvFh30t+Tw7DKyMVvU88OYvuxFCNzGoWyU/G0K78ujaDKrBNqpKWLxewX
 gBcHk/Q/Q2wEvl1tvmiS5X2RWwGzhn1aQi9/mNYdLyU3nzARtk6cJMBPo2B7oZltyyUJFFlpH9G
 IGk+tTcrobTt6zrr6dNpBTlo0GB36578MB14XFuvXHar6Um2YmDvx07vht1HbGFR1FeQ6yhWZWl
 m46W1tBRcLELNn9XtUUjs95M4TGNnu1uQFsW9HiGSdEBzriuu94O7tj7JNaxELNUm9LdM/kWAw0
 TIF6CO6P5Bixzvw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Since this new platform supports both DP and eDP, it's the perfect time
to drop the dual compatible (eDP and DP) and figure out a different way
to specify the mode. After some off-list discussion, one suggested way
was to add a 'is-edp' property to the controller node, but that approach
has been dropped due to bindings concerns. So now we lookup the panel
node in DT and based on it's presence we can safely say if it is eDP or not.

The PHY counterpart patchset is here:
https://lore.kernel.org/all/20240220-x1e80100-phy-edp-compatible-refactor-v5-0-e8658adf5461@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Dropped the bindings patch as this new solution doesn't involve
  bindings update.
- Dropped R-b tags as this has been entirely reworked
- Reworked to lookup the panel node in DT and set the is_edp and
  connector type based on panel node presence
- Link to v2: https://lore.kernel.org/r/20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org

Changes in v2:
- Added Dmitry's R-b tag to both driver patches
- Dropped the if statement around assigning the is_edp in
  dp_display_probe, and fixed said assignment by using the connector
  type from match data instead.
- Moved the qcom,x1e80100-dp compatible where it belongs
- Re-worded the bindings commit message to follow Bjorn's suggestion
- Dropped the RFC tag as the approach doesn't seem to be questioned
  anymore 
- Link to v1: https://lore.kernel.org/r/20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org

---
Abel Vesa (2):
      drm/msm/dp: Add support for determining the eDP/DP mode from DT
      drm/msm/dp: Add support for the X1E80100

 drivers/gpu/drm/msm/dp/dp_display.c | 52 ++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)
---
base-commit: e7528c088874326d3060a46f572252be43755a86
change-id: 20231219-x1e80100-display-refactor-connector-e1c66548cae3

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


