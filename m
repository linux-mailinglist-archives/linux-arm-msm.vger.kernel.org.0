Return-Path: <linux-arm-msm+bounces-64821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80DB0406D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7837D188AD86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D45924EF8C;
	Mon, 14 Jul 2025 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9qyJRQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56B2417C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500490; cv=none; b=Dz2qFtjEChWfsz+p3vQRzGZHYWpYTquSQbS4IhEgx5vWbOlqmVT0rEAEGmskQKZIKXx/eYZ+r2dQGgikikcTi2g1yZRloZykHl630wVPOovL9XhIU4VyVmDPuws3YqWXQpI/Jl9TRlBOD4ki9uLTdR8n1THfG2qLa711Jcrqf/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500490; c=relaxed/simple;
	bh=QrFuBtEmfTb9T1/VwFDneSUHYJmuXmSonGzr1MzFk04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fs7i7mnIpuLrdt2ERmmA2VsZF2ogssBvspfcRGXJygwKlX14+5GJSR9UYcaef/Gq9gWwSEeCwNc4czober+ePNmTRjD6K9X0naNt4D0dTrpmRdAwcuYeJ6nLREK8a+XBqRJVdhqPVEJ8GVUiI4A7zhrxUN/6sPlsQNBHPvJbtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9qyJRQG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso620353f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752500486; x=1753105286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BN2Div9utqCX7OD/BWPE8tEFBYIvXFlhGo7r/aDfms=;
        b=s9qyJRQG8w0rvhcS2PQecOHU3RHSh/QUCkAe8XTA5WQIZ3rUWSHSK7lFibOOiksxKq
         WnxswysKZ1+zOGjEULb+Zr6VbS0NmUoFLXL9mAyEDPamsbf/L07wUMmKLajlJwGdcTrJ
         eRMjj8aKotRQzTaDaUoSyTKvaJLfEqAxbPcvKI6KM0er3ApyLrX8AVr7IyHSN/hbWRDN
         vN0nxhkO5ncQ5xAUON+DKCslQTMeyv2qxUEXUv/m6ysTNlFWaA+1uXe4XRTRc/nZF5lQ
         XjCxgk+B5rr5wclHLGEPOZEOIKhlaxVud6r+oPl1HmfKgm86tVN2GBTteVYV/0Nsi3YC
         k1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500486; x=1753105286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BN2Div9utqCX7OD/BWPE8tEFBYIvXFlhGo7r/aDfms=;
        b=TNU9EtPjXqUrWt7DyuLPxnfZv45SCsWyv989kZRnLhofNr0M8eONHgauMqnhnOVaxK
         yBaTGLs9uztUAxMmk8GuJ65nx1SuRJG4j4AVGGt9er4d5Y9Oel3beG+VCj8OzY6g/YFN
         hAYQc9dkV0BE16m2dS+Z7WC07l/nlrXIQF3mlnga6Kmx+Gt9TMxc2yls0FU+U5V7PmV7
         yV12aXpz2LLi1dqY+zj5JPwdEfj+9fL5ZX9WgYJTC/kc1qt+mLdkh+UKKpM4fdn7mIVV
         pxjJ40KEjeuETwh2H2ilZXI3anKGqEh33pF2TH1nw8thmcaWJkkAg/v0usTtfDchc0Jy
         /ahQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWB5g6BV8keJGjIfpp2cLbjflR/Vtq4aCHvDidsN1AakMRpTZvWeWDetUIxVo2odK+pS16+e5cl0d9Mk1R@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/63vEhK9X0Wnc6V7C2fG/XoH8N9Dk5HOjkTiaY/x/NpKbVcB
	043HhWKunDzDJCs7FWKarPKEyHdh+FLlCjMPN9cGzm9qTuRP2fj8zjGC2yxS13xyBt4=
X-Gm-Gg: ASbGncu4PPGnq3Yy1AsQyP3m+duskuNZmE0rzAdCXrziNTt6IY30sUopI81oojjDcaq
	eo/Y90QO5F/epAa/ct5f0AJveJHxyFB1dOXjrmfc8530qYco4+C4pkDGWR1dcZpX2AeSAO1ZKXM
	oOdX016hB8dZANWTmpb+0WiqM/6nl+Zsy6DhcoX7eg9+k6VAWfZ3cokF78sQSsqqbPF7eJvekrP
	FcrPq7rS1eQBXEOlJIbqG+5YexgDyHTCYTvjySggO7Zs+WEO5FYmadubkxWmJSL7SElbAK0bW/4
	J/ZdMOPi/TYapw9V6wijkb4gR3KdrwZHBU+306Qq4VtcfPUALKQwdIu5VfSoAaBxPZwhqbc2C39
	aYW8Ocdfip2SRyAbqht/Pon5oWvNIkdGuihuSRA1670MD7CY=
X-Google-Smtp-Source: AGHT+IHi6FpkL8rmzHh1xptezyreJqijCJ7lzgJx6eZ6Ff/qN0qP9xOBTx7omzOtgUDzlNfcxgLv8Q==
X-Received: by 2002:a05:600c:c0c1:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-4557f0b5374mr32110815e9.1.1752500486375;
        Mon, 14 Jul 2025 06:41:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b176f87sm31371375e9.35.2025.07.14.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:41:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] media: iris: Add support for SM8750 (VPU v3.5)
Date: Mon, 14 Jul 2025 15:41:15 +0200
Message-Id: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwIdWgC/zWO2w6CMBBEf4X02ZK2lGuM8T8MDwgLbqBUu6gI4
 d9FiI9nkjkzMyNwCMQyb2YOXkho+xXkwWPlregb4FitzJRQoYil5mSSOBQcHRLXWlexkrpMRcD
 Wxt1BjeNmu+Q7O3g8V+mwh8wAUbFJM++4O4WSgZZh4isp0ijiirdu+tA02Npv7dTZN7V47rAvn
 PWta06/pWtBwEtrDA6Z18M48P9Bli/LFzSGA1HWAAAA
X-Change-ID: 20250714-sm8750-iris-444d7214c903
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QrFuBtEmfTb9T1/VwFDneSUHYJmuXmSonGzr1MzFk04=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBodQj+KMlTIcMSVi82IRdLMhO6eozjm0JaDO3lV
 VhRRRKbS5qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHUI/gAKCRDBN2bmhouD
 17g7EACTHk7hdFBal6BHIB77GDRFhNHA1uBrJMTf9WPgg1zJaTsZp5r7NgE+yoTsrT9wbg41hYc
 EpkarBH019MCR6zZalGc1cjcenH4E+d9qP0ZupKPahzcaJlEQQYJ9+hsIukc5nJATrPTE2SvZ0n
 mxbG3+v+YyxYbLe/fR7YR4DWlSwLSXiPPgvqPyDs2CevU+48rF0zCylPFY1wLDYoBfwPcCmA26i
 cFtszmg28ySFL8UYiwoeenlmzVUG4uQPdwc3RfBfFo0MrooZ3kfu48PZ4X/PW4QV7UB+2vR5XKC
 UuBRkHX8v5AA1OUOlSPfXtywPHzowzwtXQ48JhGsGzBose2JQQBV9jXfrXQPq7spw5wQSS5isr7
 jafdcBrGme/VCo6RFb0xNnWCIgw8xQGOMY97iJ8R7iGTFiP1MgRHvrJ+gWP1zcbRWpUbvXCtY15
 O6syIP2S1bnPg4G/Y5jAWS4+MVR11imbYgJt3ELM1K6X98Tvm5yz6BNTTs7B8lFeRq/M6p4eFA0
 9V679/FAwwp8yY8/afejFH5UWJKcq9ppAwnbKBTeLA8fmr3b68QDQnWLAlASiIcaxwgQ0iwYC90
 XemWqJBmKwdwsPcmoepkYLbLT4sinT7HkU8qx3WYiDPFBNuwxIAqyXXkOfluJp4BOnOTlpRPtCJ
 L0woCj6bEq9XSSg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for SM8750 Iris codec with major differences against
previous generation SM8650.

DTS will follow up separately (depends on other DTS patches so cannot be
merged as is).

v4l2-compliance report:

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.16.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for iris_driver device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      media: dt-bindings: qcom,sm8550-iris: Add SM8750 video codec
      media: iris: Split power on per variants
      media: iris: Add support for SM8750 (VPU v3.5)

 .../bindings/media/qcom,sm8750-iris.yaml           | 186 ++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 207 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  12 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
 9 files changed, 508 insertions(+), 5 deletions(-)
---
base-commit: 709a73d51f11d75ee2aee4f690e4ecd8bc8e9bf3
change-id: 20250714-sm8750-iris-444d7214c903
prerequisite-message-id: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
prerequisite-patch-id: 1658ac2fc03eb4b33a236c2dfc2a053249068354

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


