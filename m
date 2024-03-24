Return-Path: <linux-arm-msm+bounces-14943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7CC887E63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 19:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24653B20C62
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 18:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77569D51D;
	Sun, 24 Mar 2024 18:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfI71te/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24BAD2E5
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711306240; cv=none; b=bUSxK3L0LTRTkYrA6c3rfOoPcRNGSgOZcfT/kQL4dsoO8nDWWOuFdsGatlWcq/Xn4fHwPXz+kgm+WAeOvT5zr6BpAxB/aZrsdL2SXHt46cAKrPM8MJbF2POtfVS3MPAeMhVvbO3sTyicOIS4cFPvhgOG8ngjVwsmHupDnPnUHNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711306240; c=relaxed/simple;
	bh=O0xVY+gl/fPHcB6WhFKWsogdWZR6lFHePZT39lrEaZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A2rKLbeHgYFlB3cfxe3yP3vdYfYBdF6rDJQFIlsT2m+nj7CqxI8eNWSSOxs/Wtqe34u5jAfW669/m9Nxuqqy+lQ2UTuaTIjpuPd4qDZed5M94++dld94QWPbEselRsiHnHvqm30lHlnVtUvaE588bS11pV8aO8C1lF674Y5YWeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfI71te/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4734ae95b3so272427366b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 11:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711306237; x=1711911037; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh7WIPngChgpb6/wT2qnSquscN8CZ3uMdGD+jaJxYv8=;
        b=LfI71te/lri8tXBfg3FoFdN2qhR2tcloWhWukiXBsS6Odqk2kdmaluKFNsbr/CKBez
         LqeNqxdAB/2TJLKJvcLZUKOr5Uu0HTz6bl2IWb/IDjeHa71HR7Evd1TPGdC4G0Au3VOR
         gQd22VXXlrRA24oQx2nneysc7RgWtHZe/XJzXaWA268j9bMbHyWeuV+e2Rn+GcAOh20W
         QhHIkCj8vsB43eGofApyaDcLngK+ug8z2H2hxBnTvoqySBSyEBvmnK1hkKCmOOCoJk48
         NJGHcje7if2LddZm1D6ex8tk6YAayyWG7+qKAhCEvUrIIL8XY2g8iq7XBE8aFhU6gVWJ
         mV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711306237; x=1711911037;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jh7WIPngChgpb6/wT2qnSquscN8CZ3uMdGD+jaJxYv8=;
        b=V7BPOp3Wl5SEONS2rELoDlfyeg759uHKM6KQXiiHCEPuGN/rrZUUvn0lff65nKuM9N
         1K5uiU+9dPXlY1kKob+vDTaYciX9QnpFP1GvRdVyZbSbL0sQ6ScXPSqLZ7m18vmKvDc0
         XDajOxMBivPvCgFhscQhJj4p7nrKkrzA/kSiUQLwNmler0FvYihQnP54TyHe7X0Qg4Y8
         FMoFDBXYbqSi10NBbuzoYwhIPeEQQ7DlGEjw5AfCW4DIpPucl8Y7cd0bAPz6BGjjrjC7
         L6ZRkycGkVR1IMf07NY1U+5vvtVom8/GX5YGnFieA27CkJvbu2PU9EA262kfFPHEQtts
         OaOA==
X-Forwarded-Encrypted: i=1; AJvYcCVFz2ohiWZ2aSJUmqgpaFVoE8UToXslzQUBmxNOcPScEqMtTDvXj/X9CRwj26UiLpGP5OQdQGwyq7D8FB9JzH4D2om7V42ZNZyh6UnryA==
X-Gm-Message-State: AOJu0YzsPoW2qTXqzrFiMxDM2o5/6ZymVQCnrl0zaheMRWwgmWPuZIzp
	/SyasSmuJmaWURGSFs4QNjmHhnBJbHEp5ik5EdP1L9AjHjFXAc19p1Ne8uQhzmA=
X-Google-Smtp-Source: AGHT+IE7YzZVq4H0/yCqXg4Z63bK4KbtfqOS7Jf4EbizVXqQY6dIiXsth6aZPv2MfP3+lLsWDN16ZQ==
X-Received: by 2002:a17:906:1796:b0:a47:3b6a:a29b with SMTP id t22-20020a170906179600b00a473b6aa29bmr3095023eje.13.1711306236616;
        Sun, 24 Mar 2024 11:50:36 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id kn5-20020a170906aa4500b00a46524d06afsm2188136ejb.8.2024.03.24.11.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 11:50:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RESEND v5 0/2] phy: qcom: edp: Allow eDP/DP configuring via
 set_mode op
Date: Sun, 24 Mar 2024 20:50:16 +0200
Message-Id: <20240324-x1e80100-phy-edp-compatible-refactor-v5-0-a0db5f3150bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=O0xVY+gl/fPHcB6WhFKWsogdWZR6lFHePZT39lrEaZQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmAHXupd+aX9jJ71rkl3EKxdf9VYRDpb/da92OQ
 qn8lHUFCE2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgB17gAKCRAbX0TJAJUV
 VrvREACwrHiaD6PwIQtmnkqeVgB4JTXBJY1d3DFw4JlKGgOPs1vt4XIrCdM6vXnftUL4GSfCLwc
 muGOAhE7nPqs2eI7WGJvCUT0tu/4zmPTMm4BFJumTjPIRPLd83wRv38r/YdInH0RLvdwQpHezMB
 7xPkkn0yoj5BBa05aGQH96uSDpvfpk1dcI4kQ0TkUSKzm/SvqdNN/uVEq4utV9aOWTxQCZX3dE7
 j3T0GrGAI0CvsW6NC6nWYHfXa/6jgmo5Ex7EWNnqLM3umPS0mYweBQCz69lcWFzUhw/wFIWN3eL
 c+NBUX5hb0Tstet0/pXnRm2Rad9qAhJwE0sNRgnxf+AfrGDoiIJys0t2DKFiLmW/miG2imbv6nb
 pBRTZk2i4fYlmhj8TghwGDM1D9XYi3OwkmWtwqsRu8e1fbn1zAOgBYPZb9ah5sAve3njTpFOPTs
 skefZtRU5xXqPelVXOi05FjngLy8PsdG1Ef33nVAAjhSWiSiBNGTeL1olN2AD60iAlmektibpwo
 UZu1w09t6jF6t4BE6zyiwpz/fRA2aBeqQ6tLHTPIbNq9LWEoXw5PrCOEa2Jcnxjdvs4AvvrqkI1
 +yqljOqtyH6L60/WHeqCyTSgy9HwvHkRuNafIAdlC4y3yw3J0b8VQz9GHDZQltUxF82J6+bYUk0
 QxfmgqD8Yw/exMg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Until now, all platform that supported both eDP and DP had different
compatibles for each mode. Using different compatibles for basically
the same IP block but for a different configuration is bad way all
around. There is a new compute platform from Qualcomm that supports
both eDP and DP with the same PHY. So instead of following the old
method, we should allow the submode to be configured via set_mode from
the controller driver.

The controller part will follow after we conclude the PHY part first.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Dropped the unnecessary ternary operator.
- Link to v4: https://lore.kernel.org/r/20240216-x1e80100-phy-edp-compatible-refactor-v4-0-c07fd1a52186@linaro.org

Changes in v4:
- Added todo comment about setting the value of cfg8 based on swing
  pre-emph availability, like Konrad suggested
- Fixed the condition in qcom_edp_phy_power_on, reported by Dmitry
- Link to v3: https://lore.kernel.org/r/20240129-x1e80100-phy-edp-compatible-refactor-v3-0-e71f3359c535@linaro.org

Changes in v3:
- Dropped needs_swing_pre_emph_cfg as we store the table instead
- Picking the table based on is_edp instead of overriding.
- Link to v2: https://lore.kernel.org/r/20231222-x1e80100-phy-edp-compatible-refactor-v2-0-ab5786c2359f@linaro.org

Changes in v2:
- Dropped the dedicated xlate function and added set_mode op instead
- Dropped the eDP PHY type and mode addition
- Added the DP PHY submodes (eDP and DP)
- Removed the device match data storing from the container struct
- Link to v1: https://lore.kernel.org/r/20231219-x1e80100-phy-edp-compatible-refactor-v1-0-f9e77752953d@linaro.org

Initial attepmpt was here:
https://lore.kernel.org/all/20231122-phy-qualcomm-edp-x1e80100-v3-3-576fc4e9559d@linaro.org/
Compared to that version, this one uses the phy-cells method and drops
the X1E80100 support. The X1E80100 support will be a separate patchset.

---
Abel Vesa (2):
      phy: Add Embedded DisplayPort and DisplayPort submodes
      phy: qcom: edp: Add set_mode op for configuring eDP/DP submode

 drivers/phy/qualcomm/phy-qcom-edp.c | 76 +++++++++++++++++++++++++++----------
 include/linux/phy/phy-dp.h          |  3 ++
 2 files changed, 59 insertions(+), 20 deletions(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20231219-x1e80100-phy-edp-compatible-refactor-8733eca7ccda

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


