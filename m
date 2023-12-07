Return-Path: <linux-arm-msm+bounces-3750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374E808D95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1321C209AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A6D41C93;
	Thu,  7 Dec 2023 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mV4ucfrW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3F412D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 08:37:30 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so11884575e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701967048; x=1702571848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QHPdC8oASRump8lliefjp+VWx5EqaK9zM/MQaDjAajM=;
        b=mV4ucfrW9wptvGNc+9fzSZUE6HXLdfTBCbfpXfmQLXViLTqd//tU+OKjE54qOvrJ6f
         RDDBDcvOWU/ZAzOmRjgLmSEG8w8C7wcL9L3UvlHVvaa4yfYmPNlOPJG7YT80w1T1JqGr
         HJl2dwVGJOBDZfCzsZ7Ym2UAC/UgGYtWdBcfvqJYnFMJ90XRjtfAy0lqo39A/Yh8HZqM
         yNQDWSLQUH05R8/R3sS9Xurk7fhe8nvi+tJyOK7II/80EdE3gxltco5f/RHz8f2JHZti
         lSSjkvW+657U7l8/pwhBKJPKnF/lCN3xBB17+diF4kZXNwGZAV9qYjvR+Ri6rhsJuSvE
         fycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701967048; x=1702571848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHPdC8oASRump8lliefjp+VWx5EqaK9zM/MQaDjAajM=;
        b=P4QxDu7qQgGUsji9WmPVIgCBbcBINxGIGQer2CcwX+xgkg8UMkgvsL7xqEjPdI69Il
         gMzlbdBkAAYwn4sA2XGVJqQY7Hb9YbErXJLmhP8u5tLSt86wdobS40x07Yux5o8PEwVj
         PjGOtOKM4LJ2SbMagoLLhq1SbFn1wXEU4T6Cfxlv5wcnkSxa+fsGJ6mrzPZvLVHRC10d
         SYQkkyNpbNXNZoK4bfUVpUe+WfTnEebTP0xJ3d/b1/jwlSwg+W9vdy/JvtHisWtQ4I7Z
         N1w/Wk+tJ6+RQ8mezAdWKNu2uUxX6WkruxDRqMOp5pFz65hM4D2iwQrxp5Nu331Ss2WO
         X7Ng==
X-Gm-Message-State: AOJu0YwUKhThPokfw160AXBkdQRtDy8lLOt78M2AtQ4TWsZmYQNhIlAu
	wlF5LLJn4kqG4BtJC1BmqQONTw==
X-Google-Smtp-Source: AGHT+IECup8lerGo7s57uB+PYd5IipnuMCyZOc5WNaL7TCPdJGJcwc1h0hxkWIrWeL4zEkuayTbOoQ==
X-Received: by 2002:a05:600c:3144:b0:40b:4812:22e2 with SMTP id h4-20020a05600c314400b0040b481222e2mr1703251wmo.11.1701967048113;
        Thu, 07 Dec 2023 08:37:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c35c500b004080f0376a0sm175424wmq.42.2023.12.07.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 08:37:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: qcom: sm8650: add support for DisplayPort
 Controller
Date: Thu, 07 Dec 2023 17:37:16 +0100
Message-Id: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALz0cWUC/x3MPQqAMAxA4atIZgNtxR+8ijjUmmoGtTQqQvHuF
 sdveC+BUGQS6IsEkW4WPvYMXRbgVrsvhDxng1Gm0ka1eB6BHcrWNbXCK8gZyW44B7ST9k5PXrm
 2gZyHSJ6ffz2M7/sBJqqDj2oAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DEk4ut9+Eb2hTaXLTn1gbajtsrPpbY3ybidbDLfSO9Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcfTF8nxT5gy3VCqOv83+EH5YSHq5f3Ed4xnl1LWe
 ZxBTOLeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXH0xQAKCRB33NvayMhJ0ZPiD/
 9QHLYS27pZ9P60USW8oJeQkpKWQjoQgC+eO7xx3SzfI+MhRT9RJvkGfp1hWx1FGPoQ/YP3ybHuKFzZ
 du3eCISSqUDhdcHiGyTKQp3TU+5EfGCyHk6CJBgJwZdrNDFjalZwNqFxg5lxTBdSFjS++Y0+Oc2E5v
 N+dQzxs84pmHQXQxc/ZmgvtqWYFBINQ9ncOpNt1CFIo7fYT29OtzPL70Fmz71HWndOkri7dp7N2FBg
 PX6MKINs1IYdKejUuPRllLcPD/x6d8wBqsfIM0oSjOQ2HLKGsvuGRQsbThbjl0fjt0kqMwZ5hWSHbf
 kw9hPoO4OMp/Ne7JipYvLEAlk72leZI7AjYv6xHNkrnBV1Sj5nWiYW5Iq9k2yv0a0c0Nmibc2NVJ0h
 hSfHurZfTIhqFE5gAYNYmE/9efCZBVas0cUZgGi+y8V2uq57DAjymJQECJsCJ6lzbwlQ0y99935u7p
 Rgd4fRXvPAlgrWZDd2keO0/t5MbM5iegD2NAxHMqflhJTKLKUVNDWRxmALC9cswBSVjl+se9i2dn0Y
 ZfwA6JlGmLxWsyc31WJovzYUfiseZKo2Ly82uZVPQJf6M/5QOxVlNIHPE3yEn3a//ekJi2Rcvq7bnK
 V2Nc9jAGz6JOKrn3/sBCYJyWjDbVzMhUvmkSYdW4lgW3sxcUYeugMAJP1llw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This adds support for the DisplayPort Controller found in the SM8650
SoC, but it requires a specific compatible because the registers offsets
has changed since SM8550.

This also updates the SM8650 MDSS bindings to allow a displayport subnode,
and adds the necessary changes in the SM8650 DTSI to declare the DisplayPort
Controller.

Dependencies:
- DT: https://lore.kernel.org/all/20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: display: msm: dp-controller: document SM8650 compatible
      drm/msm/dp: Add DisplayPort controller for SM8650
      arm64: dts: qcom: sm8650: Add DisplayPort device nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |   6 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 120 ++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c                |   6 ++
 4 files changed, 131 insertions(+), 2 deletions(-)
---
base-commit: 9ea914fd2cc702e8be88c0666d4df3e58ffe8131
change-id: 20231207-topic-sm8650-upstream-dp-ab1fc1bf0c76

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


