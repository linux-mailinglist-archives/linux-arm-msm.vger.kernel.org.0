Return-Path: <linux-arm-msm+bounces-47815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EDA33056
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 21:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7F963A0832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D90200BA2;
	Wed, 12 Feb 2025 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGfUqPIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4641FF60D
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390512; cv=none; b=tkXLbIYKMdyvVRLg+FzkIt5wqQCFjkB4TF78qm3XD+/znBlUk+MwFlMOkKxuO241b1x6IFr8lsZBwTxSZooeoELwlet7xeBuH7qtErog4geMUXgghrM5/j+5f+vMqV7AdrxPQg+uTLNiSDJVG4fDPzEjbeIqr4K7L8wsLh+hol8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390512; c=relaxed/simple;
	bh=ZVcEJO7Uv5wpU5tV1MnJcYqReg/8tOXkFVGMPRFbqiY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NmGXHmLmXN9UOKG5mYqS17KR8tmfTUWkIIIO67Y/miDRyfspN4VQ5yBr1MYzA+V5KwWSItyPOyNM5O28FLjq8FVpLgm0DtZsvpEEBinBvkvJ9x2phspLw/95C5vU4pOXL+y7cmtxu0z0o9NpGQHiJmQ3GMMngNSVhooN2Hidy3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGfUqPIK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de459eae42so7323a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390508; x=1739995308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+slArvciEKrrbWeiR+2AOpVb8wZSxh9//svIa/sklZI=;
        b=UGfUqPIK3pZRdZImHs/zcN8Dz7X8Eg7WqUSeO6Tv+9jjR3HgI3RrXveygLSD4A8s88
         ksDAgTcm+8Ug2odMI+RJtmKboDpqQrinORWFPsZE0gLLB6HQeYYonZ3vxDBkeEYLAkDI
         1UeGTtvQCdSR3IThlElUW99tXGVPb0L5v3/100sx05DHkmv4XkScbYQthKkRMk+BYV7B
         wtm0EcJOAjBpOD8MmrpQyzYUcZtA0Kdh6/nUmGvw2EvspUy0urAuSyHaS75wsjdynpcL
         D6AdbDVCfAsowbrZpaXqKG7TJ35b1qmbvCiRQPnMuMhNZvG6RuYK7M2ps/bdc+MiMdnC
         1mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390508; x=1739995308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+slArvciEKrrbWeiR+2AOpVb8wZSxh9//svIa/sklZI=;
        b=r5ZR/TY5qRQ5TMV5yYcKixT615c++uztLoFp/lMeUBWkGMeAivLhHbTFFdPO09EMZY
         7IxyU/r3GMM3HwVLWG6E6+cd3HmA1SIe79CLieTnwgI8PTWSG6F2gUfBTtcgWuKS/mn1
         xHsvhW5FhNs1Y7WmbD7W0br66lMvJqDU5t+5SwZnomRPgfhwcE7ZJIA0jv+h+wiqdppW
         X+14cZLHv2waqTXvhdxnD2D0zAVsMRJOBiRJlPzJEaw6Cu3DXZ+uU5HB9whBduECFSOj
         ECGUs1r7jE3A1MYUs5xHf0WijSsFzLkPoN/HTQZe8h+z4tIS+AOb0Rh28AvQvtdPhyw4
         hAww==
X-Gm-Message-State: AOJu0YyI07qfYCTdHXO919Ch47IKgEHMOckFBXlXoD7jwg62hjIquRpA
	fMIY5qX/wLq/kMyChS2JgOsQ/uPp94tRunipLC6j8FpduySWJHglpU6nFX+HQ0UWJ0ggHb9Ku0a
	n
X-Gm-Gg: ASbGncvwmDDZIMjd7cbZRZRccrUVmEEC0aX/3d8MwdyxWo52aTIb1aqtYv9ddoH5Jk4
	P0XLn4d75RUXgPhKIXtkfBwAtgVFk0mb9be40C0El5ifx/TP9MwdCdHLE9ZGkY9ibTFtpZkeQ3B
	0u2gB1zlIyTJNTJMYy/cwlkFPXrkWZE9fSgMrryujeBIjXyYonSIKhzoyau1vgJsOIYwMK+TsGy
	jfVu3UmDAajhd/reKZX83OGneWpTz6mNPXNByGMTgpBKCJGidTOP7p0jQYwghYQHbes2LAZdk3K
	9aZlfICEl0kq7n7j773mZbDz1n8Qr2c=
X-Google-Smtp-Source: AGHT+IEvaK9RPP1CAa0irVYvJ+1eexH6xB1jgfwN8E1yBqsYAA7ZjywZReEgSbjPmnurHsZozzjmAA==
X-Received: by 2002:a05:6402:278a:b0:5dc:1ff6:c973 with SMTP id 4fb4d7f45d1cf-5deae0512bfmr1686638a12.10.1739390508449;
        Wed, 12 Feb 2025 12:01:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deca41378fsm144527a12.74.2025.02.12.12.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:01:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] clk: qcom: few old cleanups
Date: Wed, 12 Feb 2025 21:01:34 +0100
Message-Id: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7+rGcC/x2MQQqAIBAAvxJ7bqHMSPpKdDDdaqmsFCIQ/550m
 znMRAjkmQL0RQRPDwc+XZamLMCs2i2EbLODqERbiVrgJNHsG97mPDKQdkhaKTt1tjZaQu4uTzO
 //3MYU/oAQGHEq2MAAAA=
X-Change-ID: 20250212-b4-clk-qcom-clean-ea88db7d1ca4
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZVcEJO7Uv5wpU5tV1MnJcYqReg/8tOXkFVGMPRFbqiY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnrP4ha55FsfM6qCWgFOtdX2P+hAOEoLysxAdvc
 Lz/3/buoBOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6z+IQAKCRDBN2bmhouD
 1z41EACAim1OudpUvk5X3Xol75msgm2ZeyndHNs0JiiWixVqLiLpwEcA54tBijDButy/m6SY61t
 7VagoGhdJxfZHvv3zfBkCsLOoe64R8Cu/NmbjTPX2FRwvpXs79UveAeCNNA6Vh0dVJcA/VzFkW9
 iEUYpppKNRJ6UNY2QhAVz3WWQ50dgty26OE5VmEBb3WwhOGrY9qkLpiaOQENfrZ8nyEllVYTyM/
 HgQOtpnxok98sqR9NOGdVu6TYfDN91sgu26wDxvdt9j5rmdldK5VZeFsKWyWQTMmpL3AweeSUVq
 OQS/wwwgQEQfbAEhH5AfYppySEHtlgxTJK/vAY66Dgcw7K4L3+RkpGg9jAXq2bmi/S72iSD56Lx
 VEiHHxLbud8rTXILBSldEj7i7Cr8buRy8l2ZM+yk7TRc0iCfRae/3DU95kIOLiwALyV2lZpRA0z
 xdKVGi/0HSIpM3cELMl5euCbZlMr+H9uMupym/fYmO1+5WRCXvjN3x8lEmVDRVGjm/d8MLogU9u
 g9KX1i+fPp3U7rwjSsQubUgxiTu7K5QmQnDXEYpGVhv4JoxAeOA+9dXYjqvLoAFcj/iDAfOS42o
 Lya3IOQWoX6CICXQGXJX54xlSoewp4eFCaoXxIfTglWqH6ucm5HnY3Rh1gDBV2NO/WStS8QDm0K
 LTb6HcoF1cFwBCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Change in v3:
1. Patch #3: Drop change to dispcc-sm4450.c

Previous changelogs:
https://lore.kernel.org/all/20241209111315.60776-1-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/all/20241203105707.34996-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
      clk: qcom: Drop unused header includes
      clk: qcom: Add missing header includes

 drivers/clk/qcom/camcc-sa8775p.c      |  1 -
 drivers/clk/qcom/camcc-sc7180.c       |  2 +-
 drivers/clk/qcom/camcc-sc7280.c       |  2 +-
 drivers/clk/qcom/camcc-sdm845.c       |  1 +
 drivers/clk/qcom/camcc-sm4450.c       |  1 -
 drivers/clk/qcom/camcc-sm6350.c       |  1 +
 drivers/clk/qcom/camcc-sm7150.c       |  1 -
 drivers/clk/qcom/camcc-sm8150.c       |  2 +-
 drivers/clk/qcom/camcc-sm8250.c       |  2 +-
 drivers/clk/qcom/clk-alpha-pll.c      | 52 ++++++++++++++++++++++++-----------
 drivers/clk/qcom/dispcc-qcm2290.c     |  3 +-
 drivers/clk/qcom/dispcc-sc7180.c      |  1 +
 drivers/clk/qcom/dispcc-sc7280.c      |  1 +
 drivers/clk/qcom/dispcc-sc8280xp.c    |  3 +-
 drivers/clk/qcom/dispcc-sdm845.c      |  2 +-
 drivers/clk/qcom/dispcc-sm4450.c      |  1 -
 drivers/clk/qcom/dispcc-sm6115.c      |  3 +-
 drivers/clk/qcom/dispcc-sm6125.c      |  1 +
 drivers/clk/qcom/dispcc-sm6350.c      |  1 +
 drivers/clk/qcom/dispcc-sm6375.c      |  1 +
 drivers/clk/qcom/dispcc-sm7150.c      |  1 -
 drivers/clk/qcom/dispcc-sm8250.c      |  2 +-
 drivers/clk/qcom/dispcc-sm8450.c      |  3 +-
 drivers/clk/qcom/dispcc-sm8550.c      |  3 +-
 drivers/clk/qcom/dispcc0-sa8775p.c    |  1 -
 drivers/clk/qcom/dispcc1-sa8775p.c    |  1 -
 drivers/clk/qcom/gcc-msm8960.c        |  1 -
 drivers/clk/qcom/gcc-msm8974.c        |  1 -
 drivers/clk/qcom/gpucc-msm8998.c      |  3 +-
 drivers/clk/qcom/gpucc-sar2130p.c     |  1 +
 drivers/clk/qcom/gpucc-sc7180.c       |  1 +
 drivers/clk/qcom/gpucc-sc7280.c       |  1 +
 drivers/clk/qcom/gpucc-sc8280xp.c     |  1 +
 drivers/clk/qcom/gpucc-sdm660.c       |  5 ++--
 drivers/clk/qcom/gpucc-sdm845.c       |  1 +
 drivers/clk/qcom/gpucc-sm4450.c       |  1 -
 drivers/clk/qcom/gpucc-sm6350.c       |  1 +
 drivers/clk/qcom/gpucc-sm8150.c       |  1 +
 drivers/clk/qcom/gpucc-sm8250.c       |  1 +
 drivers/clk/qcom/gpucc-sm8350.c       |  2 +-
 drivers/clk/qcom/kpss-xcc.c           |  1 -
 drivers/clk/qcom/krait-cc.c           |  1 -
 drivers/clk/qcom/lpasscc-sdm845.c     |  1 -
 drivers/clk/qcom/lpasscorecc-sc7180.c |  1 -
 drivers/clk/qcom/lpasscorecc-sc7280.c |  1 -
 drivers/clk/qcom/mmcc-apq8084.c       |  2 +-
 drivers/clk/qcom/mmcc-msm8960.c       |  4 +--
 drivers/clk/qcom/mmcc-msm8974.c       |  2 +-
 drivers/clk/qcom/mmcc-msm8994.c       |  3 +-
 drivers/clk/qcom/mmcc-msm8996.c       |  4 +--
 drivers/clk/qcom/mmcc-msm8998.c       |  3 +-
 drivers/clk/qcom/mmcc-sdm660.c        |  6 +---
 52 files changed, 75 insertions(+), 68 deletions(-)
---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20250212-b4-clk-qcom-clean-ea88db7d1ca4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


