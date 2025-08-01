Return-Path: <linux-arm-msm+bounces-67357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F88CB182D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A96D5A0316
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEDE25BEF2;
	Fri,  1 Aug 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zWurBwwy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E44315A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056282; cv=none; b=hUrtMGmObAn6Cu1MGShCDzPWwnshBPTQMBXchhSfp7bkDlwgSH6UrQT/I6BvASkeetGltkwEupsABBR4qck/SizVRvDLwLw/x/vobLPmEYq+iq6sIn0NjJ0MuZ2u2v4Ei+B/RLIWYZ8+GCrwAzDYELi92ziZgzzIQNbJLNYmnH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056282; c=relaxed/simple;
	bh=5wYZLPrjAgyvLrT/2EjpWd4qfw44TDTvqfBJ6GFqBfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdAAWl5rF/9Wr+ioHTwq/+GGQ9MKVD1yCSKrkgJiep5IWwIc2tDmpN3f9WtgkeB2sKdhU6U7AW1KERFpP0D4tcGLrrpWq7sIHvdkVcq5x+cA66WYjdIX6t0Fq5ZsoD5o3PRNW0F/nXmAcoFNO1ts3RRkI7bamaaKDbS7SoOV8iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zWurBwwy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae36e88a5daso325190866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754056279; x=1754661079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRA5IQz3Kxl9BVoXiCV4QgbhBt0GVpIwT3gqGgrohiw=;
        b=zWurBwwyHdm/bTlpo1VmxJzCrBh7LSx/NvV0v6blxKBDcGVT57G9RBkwJcJuPI973i
         6VJwR4OYYZsKaduPHanBvxsYVOSheW9+LHvoXDQ1J6VC+vdCdMmmIMSslxLLuPnkcfF1
         MFuPMiTxC7+x1JsByKSWD/4fqqF7bzWgMEsFJ8L187ih0iV5vHxwJCKjpF6MnB9GjhlC
         wkwl7QP3h71loVYUdKFP/aweGH1YFEm3pa3PV/lN9pZsf5lDIkMglFDAks/10MgIpXm0
         inDdKKLML2sUMXVgy8pyzLAlzXnm4RPttDeI1oiF9vPZierR9SwEsX742sNoEhJsksUN
         Zsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056279; x=1754661079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRA5IQz3Kxl9BVoXiCV4QgbhBt0GVpIwT3gqGgrohiw=;
        b=iuOTbYrT+P0wp3Zv6Z/uoM6qpaAWvfEYMO1vXmo828IrmVOAbnnCyEfGNzd5JiM9B0
         hhBelK1KuliItedGabcZnJeyDv0ZAHAHdHjsS5/KIW9RK7WUQCLzVy3EPS9Uv5GM/+BP
         oWw1Ksn8HgXJof4jBC2tSN2y8VzT2sfD3Wy9iCX9ABliX3Rz1FtjKdMakBrGam53z8c5
         TSyy7B2AQTNa1WeH46epRruJNZ/Bg5faaS2pbKnvSPiqf1dz7dP+Kc3KSUDvKfIxp1xV
         Zz/3hqp9Eln1Ij2iLHwWaY2ZtwixsQ74o+IZmoKlmCu8B3g5UjsMYfJvSDoaNT+Mj5Uw
         Dotg==
X-Forwarded-Encrypted: i=1; AJvYcCVBWE3NpaL0GZbhBoK2ZdS0s1njyUJXG2fLFEF6w7vClfZ6F3iVJySey3m1o50ggVQ70docqo8Ay1TUvv4X@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvo27Fh5uUE6kNTZJVztzcEETPNM3xPWjmOI8VsvB5dL4TPSqW
	EtMML5M6Wn0ydIxI7F2gGu96gH7tMqGUAI/C2M3sjO9fXzlsfyp59eH+82vypt9u3HU=
X-Gm-Gg: ASbGnctdIb8nsqf3XHKu8pk5LuCzt+Il3AuB3qBbbc2rgA2WkVrvjDjUt0GHnFupWM1
	RngihYUOjKlIG0VybOiaF8SRi9RUcuPu7I5IEyAX1NNp6MizMagr/WzDjQsmqgrBaZKmjMV/A35
	40tVLhely4VJ/UUwDa2dCL6j5SXBYlSHDIbrGNQnSJy5sqYCYZEyPqh9CHt+ng93oJtHh2K1uW+
	BqDbJLcYJAzBDEuKni8bHHHlfR5DY3IGpf+D8CwOZHrHQxz89zwfgBYAw+u4ibg53RI2UsP4egM
	ngz70dGDuQyGjzS6kGazcYRtPoBqauIymqSg3RXsiaC87rlE1WRZC9KfnUk+LtlCQai6x3i9UHk
	QdNTbNk0wH4m+tK9RjN023SR5dVww34mxN6XJY+s8d+R4Xa/RKRGv8M9gU3okEDH5j3aN
X-Google-Smtp-Source: AGHT+IG/NhFjdelh+0q5nIHa+0bLUeoecZlUq2UNEZ57VCYPAqMbnzkMpVQaT95gwgE6ewaOotJlxQ==
X-Received: by 2002:a17:907:72c9:b0:af6:a10a:d795 with SMTP id a640c23a62f3a-af93194b7fbmr371594866b.55.1754056277620;
        Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af92a2ec9cbsm180542266b.79.2025.08.01.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:51:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 Aug 2025 15:51:06 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB
 audio offload support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
In-Reply-To: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754056275; l=1288;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5wYZLPrjAgyvLrT/2EjpWd4qfw44TDTvqfBJ6GFqBfA=;
 b=4nUFJKVqMX7jxia0FxvzjfDDiNCpGQYmclq2OpXFGK5swDfbtHsiVXXgOtMJnLv44VVMRM0le
 jpdj5BSF0vqBVjYI8Gug3yIHfIORYs0v6d0+zrkb7cvhu/rgITzSPJP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable USB audio offloading which allows to play audio via a USB-C
headset with lower power consumption and enabling some other features.

This can be used like the following:

  $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
  $ aplay --device=plughw:0,0 test.wav

Compared to regular playback to the USB sound card no xhci-hcd
interrupts appear during playback, instead the ADSP will be handling the
USB transfers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..d30912f952db271aa4fbc2570ca04b771ffef3ca 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1176,6 +1176,22 @@ platform {
 			sound-dai = <&q6routing>;
 		};
 	};
+
+	usb-dai-link {
+		link-name = "USB Playback";
+
+		codec {
+			sound-dai = <&q6usbdai USB_RX>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai USB_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
 };
 
 &spi13 {

-- 
2.50.1


