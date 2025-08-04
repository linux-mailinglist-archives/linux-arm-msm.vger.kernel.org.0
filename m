Return-Path: <linux-arm-msm+bounces-67693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D1BB1A374
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 15:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CBEE1620C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B4826A1D9;
	Mon,  4 Aug 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w21qM/kx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7D25B687
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314672; cv=none; b=j3Pf2Wq9EDNytUyVy2D93qS8oo/1cXZM8H4Vpx+pcVA67z/6hUqBkPdkX+pX1EJ1ga52dLYiBieIlXxltmfARMOKipdz9X+wOxfWKvU1fXMEcLaAsYjKIoFxxFeXfF63v7jBqW08m4hxsc29VkgEy4T2sdwG/mnYL1F3IPGOknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314672; c=relaxed/simple;
	bh=vrwiEyORcyn3oHOzyCeguRdjua8FUy7WoSxk76gYEwo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qcvt3pzkjLTRy6GnUV8xRj6nb4WAQp9KYb452lHe0MsGk1c/OqcVgJnNjZlYFy32bOyLmDn1TcgtzZBiVYYjgwEPnd4RClZPewY8EXWpgC7KjZz4RG5X9NlC0tw/SZ9Bz8vwoN5ycr9aZ4rokBy+OLga1KFHisIBVu5b1/TdVfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w21qM/kx; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af933e84619so51534666b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754314669; x=1754919469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OihBMezHdrJNvgV0vjwQLI0HnEp8oMRYBjdPgXA8QE=;
        b=w21qM/kxLADedhKwHCghL7eaaH8f+Fp8AoPEhjuXIx0hkvjj7vi4eevsXnYeNOE4J3
         24Qq8XSACAdb8Qfvc4MR/7Ryx61QfuS68m46wq/82gn0QFeyCVjsJMJ+fRqSw+Uh5mGw
         /3KwDYzt4DNWeIBZld/kQf+FEpxlYRxyVQuROffLthRT65CbM0pdY19ufYcdgxAe6sMn
         SabHrkAJM/jSCEmogfBok4FFO4GHeigBcIirsFq6W/0YbdAh+8FHwdbSU9eRw0f7z/yc
         BI4WOvU67duFF2N0frtlmOBE0cpSa4b8+Yi6eGV+omHDActTsgmWtGlCwrz1YL6s0jX6
         85WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314669; x=1754919469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OihBMezHdrJNvgV0vjwQLI0HnEp8oMRYBjdPgXA8QE=;
        b=t+sVvZNjJqWyTgjMywoFEINU+FnktnFxuhSfiKhvAozH98QXBBSs2yn1AqEyzNud67
         BoSDdnriZXqm5JhKuNP6j17ki7a4AC60qbtNtuXcC4TjY6UwTedyOWUBBI/OH2l3TXDF
         Xm8GR5P33ZJxUPwN2acjK8aSjTvwaVMFIKiGDIzrvnCv3zdy6u29xDF1Dhc94SvsnQju
         Okit1Vj/RUkMXa+q/6lbDL/LP4zXjCG5+nTe//97XSl5/97ZztrZ8eHLUgDo0ZsTOJ5E
         GGpb7d4Y6hjRf3STmLriS3gJpx9qN/TeAkCvKhoXzAcwxUIFnQQBODmqjWErxy4zzCCI
         ZVkg==
X-Forwarded-Encrypted: i=1; AJvYcCWiPniKkcvgy5EJDGnKm/ovZBwuuGzGSRfALhrKMGAsxRKYsfFm8NnwUTchk9eRkePkluDgJDX6bzwaM7cf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi20vGRajj4ix4nnnX8eELZ37D6Vivyg3u6fwFTURq9HpGrZpF
	LjQ9oRqGHWpAk1BmkMRfDUBTBx0gA6P67jqU7SxxbPG/G8Cbza34iCq3YV2Jb4zfEyw=
X-Gm-Gg: ASbGncvk4bMIP9RFM/ptyIhLNGEYbKZvR3fUo7nQIb6FHgdGisPD3c+eRrueF9Dh4qh
	x3q8f9lINH+IwLpXtuksIvBebpyEwOvEk8Q/S9+2M4ZaqUs9Q/heJ4WBBbN+yCTaM19gq2D8W6J
	SrfZEuf56tUYwF6YIi9/UZPi/sbU/MSdHqNl6fezElj3ACjK6L0SbepskhxZboHE+we16nUSEue
	R5cGF1qV0zlYXZoevwhb4P2DlMwxdGZ2VNF/lf733jc7XeeCtx5uwk18dpU5lbb5AXd8HrwJjfm
	ScTOHAqd3WMkHP2CAnS7Yyoz8anhOF0HHXM1Rst4HlNdgHfh7d3u9kW/11MCKULHn5XJg3ICCRV
	f7VAGcc12LRtdaWqzNziAeaim4lCvEaT9PPl67Wk=
X-Google-Smtp-Source: AGHT+IGvRVbVJmAQV1rA6e0H7yX2fjSu/xi/UCSRq4SvpZ6VGtT2gQRNbThGDCNP2ShmKlzEC0hEuQ==
X-Received: by 2002:a17:907:9691:b0:adb:2ce8:686a with SMTP id a640c23a62f3a-af94021d74bmr422517766b.12.1754314668868;
        Mon, 04 Aug 2025 06:37:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078cbasm741533166b.5.2025.08.04.06.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:37:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/3] media: iris: Add support for SM8750 (VPU v3.5)
Date: Mon, 04 Aug 2025 15:37:37 +0200
Message-Id: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKG3kGgC/22PQW6DMBBFr4Jm3UFjYyCgKMo9qiwc4iQjAm49L
 k2IuHsJqFIXXf4vzXvznyAusBOokycEN7Cw7+eg3xJorra/OOTTnEGTzqlUBqXblDkhBxY0xpx
 KrUxTUQbzxUdwZ74vtPfDmoP7/JqhcS2hcyJ2gdbJdmWSVplR+SbViqqiQI1tGB8yRn9OWz/e/
 Le0vL9xb4NPfbjsXqajFYeN7zqOddK7e8TfB+ElvrJEHx7LqkEt5n8HDAoJM6JCV5nNj035xwO
 HaZp+ADvLjWggAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5365;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vrwiEyORcyn3oHOzyCeguRdjua8FUy7WoSxk76gYEwo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBokLelCdaICmfFXjiLLrVg3PxccL9JVt55NF0rh
 o5mYSI0zqGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJC3pQAKCRDBN2bmhouD
 1/SkD/0R6NeQrxFQrY8S2QT5cfNo6E+AbucxEHMLALSF6FfFICw0N3OtZHAdXAWq9NLrKfC8IxB
 RsVeQtAlK/XD5BQnj07MvWJQedeYdx1ZY061vuqrbiQME6GeGF3reyKB51jPbe56HAnZJ4ql/G5
 8DPhhqeu7PnidyOCsHevbvjiWVNsDaEiNzlwHVufrqHi1bMUB12GJ7owKeWVyTYmTUnMqJyIXFl
 g+Jt5ppofVzclygorQdztGApU714gYrAfhAuxFseWYwJlTnjWqolGcLmxVt406GXLfnEKv9WSmf
 Q9bdkXdmHqoAHBZidCZRIuQz2G8BKGUqf8l4psKlo0W+44qQlLgwCRqrMl74Y9vABLxFdWqINpr
 RfQOVDEHGpLgPq3YjttFWxf92yCYrtNa0tx6Ck7JFokL7IgmDCRobGJo+A01/ahootvVtEKdOzJ
 duhdcKiYc6NUmDtOIAMQC9sUBU6XsquJlIu25gI8HViAnp3o4oeU/X9yd76XD2ny7frQx2AfwmK
 Lcz1qupxNdbz9Q1UU5VnNd9XgsWW9UYRPbRa/mAIg9qRR+i+RLaBYzcjddUey8o5ugeIuSba13U
 yTnw4EkQiO3OfP/6QiCngfmR+fHk7gCM5zQNoA2LnjHDJqgvyOxC0zokASMZgJLDtwFwpWK96H5
 WkIei8mCWv4+kyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Unify power-off sequence with SM8650 and re-use existing callbacks.
- Drop incorrect WRAPPER_CORE_POWER_CONTROL and unused
  controller_resets.
- Rename FW to qcom/vpu/vpu35_p4.mbn.
- DT binding: correct typo + Rb tag.
- Link to v1: https://lore.kernel.org/r/20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org

Firmware:
=========
Mot yet released, AFAIK. Will be hopefully released later by Qualcomm.

DTS for reference was posted here:
https://lore.kernel.org/all/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org/

Description:
============
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

 .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 ++++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 150 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  12 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
 9 files changed, 451 insertions(+), 5 deletions(-)
---
base-commit: 709a73d51f11d75ee2aee4f690e4ecd8bc8e9bf3
change-id: 20250714-sm8750-iris-444d7214c903
prerequisite-message-id: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
prerequisite-patch-id: 1658ac2fc03eb4b33a236c2dfc2a053249068354

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


