Return-Path: <linux-arm-msm+bounces-39300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2229DA6F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0122281E4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619791F8F07;
	Wed, 27 Nov 2024 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cAh5qznC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692741F8EFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732707866; cv=none; b=nP5nx+peOXkSl3cGmxeu8Ktt73sIyhMjOJxiFms9NyDhaLo70d4RL9qgpN25yXtm55iuiu+idkFNdzrRjKd1/M0ZxrItH68HJe89BZC0tlXHdcHU9url081EFCeO5Kv5kuDsQYB62udIyVVk4mdcu0QXWzNKHHM5qBKeXXkPeE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732707866; c=relaxed/simple;
	bh=2VPQxqGpZdUtQx4TRhhujGuEqKZMayd+A2WpW8+Ee0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eJY/qQjZP6pkONjeubjocaMPrntA5U33KP2Za7NM0/0ZZZDV+dtNv7/PaWwhrmalrkQvTmyy8AV+s1qX2sVLW2CASGvWlrWtDMkv1hQ8BRNuFHCcQz57S1nz2oHI6pciuIrvsvpGFaBsvjbSJN6fPRPVcI/e/EDiLaD+TJmd9S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cAh5qznC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so21368375e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 03:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732707862; x=1733312662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssVRFD+PQC+RdD7e4tYg1q2mgwVSh7ZBEBCwdBJedlo=;
        b=cAh5qznCpYi5rkGYU01NRP4OsrSeGQG10kn7Ix40u+K+yacd5yrt4etQiVRjGfhPGI
         AKPUUWllWSWVcgb7XeCkDhac8yJL242FdFZrvSVbcN0fREEN3yVu6N9LSXz18N5iBnhR
         UM9Udrsd+Q/sz/FJMsaxMUzCv58MFM2gdN00KM7W3SK54eUjg7eVcodumgHGfRas0M1p
         +WAZy1KDEByxinyp3vQhKfij1DsJAtCA+sO0SoBuGqsiPArNLtT8y75ySfSgeAB8tpLL
         aHa+mJjgmXpzHnWx2pq/ADIF1Z9cRLmn2qqb4PVjoXZ7geUcNE7S/oLK1VuLLVvKI2Kw
         9T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707862; x=1733312662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssVRFD+PQC+RdD7e4tYg1q2mgwVSh7ZBEBCwdBJedlo=;
        b=ZYSnGAC7sKTE07Uz616MEMzY9Sj+brqgGgviKpEb3BP3E0xAWO3xDtzoPxzwPE3/S3
         G2QtlqtVr3Cm8fas1N1S6FoQIy2tdQU28gcFzMcXcqD3Gg7ZOF6iqyukkQgj/ulQA4zb
         IN/pQr6AJJI7QWU053zqpGS24tbr1MbZ0+x8ThBpCifjxbrlqiEEe/jRH1S/8CGTTyEh
         AsVeU1fDUU0hPCQdVHMWJXPrw53fmxR2xSlE5fJHhIXEfijxtrHkeMplT9O+pw8Qm7Ps
         xHYwp8vLq+VGdi4snfRFQPPZzEM3SlzS71UO+ZRsRZ0cWTLjErpfl4hzilrfsdcDGPlc
         rPMA==
X-Forwarded-Encrypted: i=1; AJvYcCUqpv24EAmZ+SxGaqj3lY4M0Mf2jai9IxgiY/I2escp5q6YOmN+ho4UazI4ViUacyvYjPGKpbHWfL+fd/gQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzkgnCrFm0k0AJhdnENvi/O7B7iEreIEWQBHKtS9Z2ohWbhPTfF
	Xdl/6AKPesTDn40IhCGZHix7HJ1w4iSm+hTu+FvSk68RTtM7JdQMbMwFMc9ZzmydBhM7F0GjUkS
	f7ac=
X-Gm-Gg: ASbGncuHsV9R4kpjbKChscvQLY9KN2XR+WK6fo0KiPb03phiEz82b176CouwvpDK5U2
	H5c1huRm2UO3j5Yj3gnmCCKQRl+UktO8ZzqdkflbJ3II4RuuEX/hqqLxbi4wsIbTzY79p4R9W94
	lsDraptYuenrUuv6GzzPP7vMJc7VisZCJf+NQ0sAmrlhcF81QI0/r6Ar2DBJDIS+Sehd+olRosc
	N34sUbyfzVJAn/y5lGvTBmwv0HE3E6VCf9STZ+/ANUBZJe5gxdEAdJbjII=
X-Google-Smtp-Source: AGHT+IEVB2tAFigkGn9py0UiJWdZfd2xJnbKxns79Kb+wQADC/lRt1segRMEgYEHMg1IZNtkdx0vhw==
X-Received: by 2002:a05:600c:4e8b:b0:42c:de34:34be with SMTP id 5b1f17b1804b1-434a9db8393mr27460255e9.3.1732707862561;
        Wed, 27 Nov 2024 03:44:22 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3531sm16463586f8f.80.2024.11.27.03.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:44:22 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
Date: Wed, 27 Nov 2024 11:44:19 +0000
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v2-0-c010fd45f7ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMGR2cC/52NQQ6CMBBFr0K6dgxTsFpX3sOwKKWUSaQlU4Iaw
 t0tHMHl+y/5bxXJMbkk7sUq2C2UKIYM8lQIO5jgHVCXWchS1ojyCqPryECajafgQdaACPIC3FY
 wvMHGcTJz1rxbZyqrta5upUSRHyd2PX2O2rPJPFCaI3+P+IL7+l9nQShBa4uql0q1tXq8KBiO5
 8heNNu2/QDsBS9L5wAAAA==
X-Change-ID: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

v2:
- Removes useless dev_info() leftover from debugging - Bryan
  Link: https://lore.kernel.org/r/ce9ac473-2f73-4c7a-97b1-08be39f3adb4@linaro.org
- Trivial newline change @ np = of_changeset_create_node(ocs, dev->of_node, node_name); - Bryan
- Fixes a missing goto identified by smatch - Smatch/Bryan
- Adds Krzysztof's RB to deprecated - Krzysztof
- Link to v1: https://lore.kernel.org/r/20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org

v1:
Various venus patches have been held up due to the misuse of DT to provide
a configuration input to venus as to which mode a given transcoder should
be in.

Link: https://lore.kernel.org/linux-arm-msm/436145fd-d65f-44ec-b950-c434775187ca@kernel.org
Link: https://lore.kernel.org/linux-media/ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org/

This series provides support for static configuration of venus from the resource
structure via:

1. Adding two strings to the resource structure.
   One string for the decoder one for the encoder.
2. The string for each SoC has been matched to the existing in the
   DT which currently specifies the mode as decoder or encoder.
3. New logic in the driver parses the DTB looking for the node name
   specified for the decoder and encoder .
4. If the DTB contains the node name, then no new node is added as
   we assume to be working with an "old" DTB.
5. If the DTB does not contain the specified decoder/encoder string
   then a new in-memory node is added which contains a compat string
   consistent with upstream compat strings used to currently select
   between the decoder and encoder respectively.
6. In this way new venus driver entries may be added which respect
   the requirement to move mode selection out of DTB and into driver.
7. Simple instances of decoder/encoder nodes in the yaml schema have been
   marked as deprecated.
8. Since the proposed scheme here always defers to what the DTB says that
   means it would be possible to remove decoder/encoder entries for the
   deprecated schema should we choose to do so at a later date but,
   that step is not taken in this series.
9. Some of the upstream encoder/decoder nodes for example sdm630/sdm660
   also contain clock and power-domain information and have not been
   updated with the static configuration data or had the schema amended to
   deprecate values. Because these nodes impart hardware specific
   information and are already upstream this series proposes to leave
   those as-is.

However if this scheme is adopted it should allow for addition of venus for
both qcs615[1] and sc8280xp[2].

Other SoCs such as sm8550, sm8650 and beyond are expected to be supported
by Iris.

The sm8350 and sm8280xp in the second series would then be able to excise
the offending compat = "video-encoder" | "video-decoder" in the schema and
DT.

I considered making this series an all singing all dancing method to select
between encoder and decoder for all SoCs but, the objective here is not to
add functionality but to provide support for configuration in-driver
consistent with current usage and to do so with a minimal code
intervention.

So far I've tested on RB3 by removing:

video-core0 {
	compatible = "venus-decoder";
};

video-core1 {
	compatible = "venus-encoder";
};

This works - the code adds the nodes into memory and the video
encoder/decoder logic in the plaform code runs.

Similarly if the nodes are left in-place then no new nodes are added by the
code in this series and still both encoder and decoder probe.

Thus proving the code works and will provide support for new platforms
while also leaving open the option of dropping nodes from upstream.

I've left the dropping step out for now, it can be implemented later.

[1] https://lore.kernel.org/linux-arm-msm/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com
[2] https://lore.kernel.org/linux-media/20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org/

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      media: venus: Add support for static video encoder/decoder declarations
      media: venus: Populate video encoder/decoder nodename entries
      media: dt-bindings: qcom-venus: Deprecate video-decoder and video-encoder where applicable

 .../bindings/media/qcom,msm8916-venus.yaml         | 12 +---
 .../bindings/media/qcom,sc7180-venus.yaml          | 12 +---
 .../bindings/media/qcom,sc7280-venus.yaml          | 12 +---
 .../bindings/media/qcom,sdm845-venus-v2.yaml       | 12 +---
 .../bindings/media/qcom,sm8250-venus.yaml          | 12 +---
 drivers/media/platform/qcom/venus/core.c           | 66 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h           |  2 +
 7 files changed, 78 insertions(+), 50 deletions(-)
---
base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
change-id: 20241127-media-staging-24-11-25-rb3-hw-compat-string-ea3c99938021

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


