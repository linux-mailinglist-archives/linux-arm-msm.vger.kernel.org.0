Return-Path: <linux-arm-msm+bounces-78255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C85BFA288
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97DAB4F038B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEC62EC0BF;
	Wed, 22 Oct 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVHy7XnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD00B2EC0A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113228; cv=none; b=hTfeJ7mLQ0D+dQak1S94v61dH6qC7Y4FbdovrgSFBxFoTMt/qPULejghl6rcJwMP+KE5MKcI3+fzdvcRKRsojQVaOZIEZA++VfIjus3JlwaI/hUu08k2qWfRRYTQlAYZeStxroeC/p7jzFl5l3YkRRY69T84tXwZJyQtRO4MDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113228; c=relaxed/simple;
	bh=Wc+9aLfvtHVyed7cQcVOx9+S7rwdlkRIeIM/CGWU29w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TQ20BzPtlbm5vrNGeBMv7LNeRyz3k7GGjUIQ+kBXdvkjpdBd2YFelV/zCNHRETw4oTILHx/SLRk1bzs0QHETQsMu1m/X8P9N4WEG1PCYzktTEP9Anua2AnnI7wbJX9BWhxzrEkoJV9w41qErRAG28+0Of4CWg8inNYIkkiiKsNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVHy7XnF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471191ac79dso54652645e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113225; x=1761718025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1ezpd/u211WU4FX5YLh5Rh1v3SfD1aW9qKd6XPe2Q0=;
        b=GVHy7XnFwsYSba2MZonJ2Gzn2iJmRqeCVD6shwWqCChLkOHrd5JhKmfW/KYk0jJq4P
         7Ioq6OWKgBK4gLUz7WXDGNGWOqff/fIDCJ3tE+xxiDlXPKh98QQLaWkDCcmdkN6hgIZm
         +uWRUJQ8ifksF4VADHJ9t7lfG4ZsvOIevmtBKcLo1factVhPUfXrDt8NbRh33/kSGQ4E
         WpNkkI8eDFTIRtVLHyx22Njb7QExaM0GRI5DHaEyDU3QrRGbDR4N4o/le+B04g2l1VJW
         Gr3TjddUx3nKnaL1vgtaTahxaYAVxJ1LH3ue7zOjLxgsAYGmMwUovVjJPktBdxk1K/F9
         gtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113225; x=1761718025;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1ezpd/u211WU4FX5YLh5Rh1v3SfD1aW9qKd6XPe2Q0=;
        b=XdIwvazdxzibjs1HYCpATyazqHs9s1E5Rdva8R0xPYR/iYmhDQRVumEwrpTG2fW5oo
         PB2GboCdLAXGN+Xca1Gae2WL8H6wcG4PBGtjd97XZiEfLMGzk6CCMvi0Jdii0Szlt2Y8
         wYRsJsJzRO+6sVx7RtTjuyNhDAbULOrPpxKS5nNvItJ9JmKV5jwx6WR1TI3Wqo3fWkAK
         5Kel34tGT6gHhcWgukTWGKpEdS113euXTJvf8NPjNNhkHO+FkNQA54+JZ4RO/Nxn38N3
         lC3+kzy5SxU6/0XC2bLcpn2MlsdAk8NEGaeVUZ/x4yt3Ep757RmMybmUQauTz5juVYnP
         MOeg==
X-Forwarded-Encrypted: i=1; AJvYcCUv/Q2g3V8z8KbtxLC6CLoD54T6m+q1r8BPW8C5ytDy4ezdrNsh6EiUT+wHufmTUErYskeOhyRz5Qufn52n@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ2JxAIMrdm5R9C1/XqoukhzsiXQ6AGXwP1qSX1GND1oNfzSnu
	IpyQxUP5BzmI6koVlOH0nGGqpjp5wftyMClwtQo9Xb7Y61wKdu7HTIOgShxUKpuWJ0Y=
X-Gm-Gg: ASbGncvdXX/5mJMyCp67Vtytl/msj+9zwn2PQUwdltVAf0pYiXH/46VZUvlTtjfe8JY
	XGb7pdXQqmXNiOb0J9stAxqnOYIyE/ltPaOzqi0kUiBBwhuLRj4eprdUi241BnRDayZ6vQxusFx
	PH9nQt1NclxgGpLw49mmFTd14/+boPL9q0xuKrJnoAEThzwXwzQidKYbTsmpY1pdQwNYX0GEP3f
	A+PSKqGKqKr/7rqeMpFD+angP2GZ37r9vTWDARIa0TtL4pmM+SugXg9V/+i2bZU5+EvVM6gjAcn
	/L2SP5OhJO5HS0VLudF6M5UGjmTgwdqvFmkgKR14uJ1amACVkhcc5QChQPHbqr/2dlLFx6U3Op1
	06rrKtG+rKQNgLXh7ait+SbPwEj7N/M25pKbOyXQT5hfm0IYEtBwjq6WZ7P0sKOfPupyGEsLZX5
	awgW3jEGCBCBpBtlsy
X-Google-Smtp-Source: AGHT+IHQlLLVtQZomqH0HG6Yx6ZDZd/udLMqmbW845DvtekPfRZWQRMJ3upIHekLHFXYi8rRCsrr5A==
X-Received: by 2002:a05:600c:3b8d:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-471179174cfmr140105965e9.27.1761113224875;
        Tue, 21 Oct 2025 23:07:04 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/3] qrb2210-rb1: HDMI/I2S audio playback support
Date: Wed, 22 Oct 2025 07:06:40 +0100
Message-Id: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHF0+GgC/3WPwWrDMBBEf8XoXBVpJdmNT/2PEsJKu4oFtRVLj
 mkJ/vc6CZReenwDM7y5icolcRV9cxOF11RTnnYwL40IA05nlol2FqDAaaU6Wbw+DTSmE14pZan
 Rm0AHE8OBxV66FI7p6zH4cXxy4fm67y7PUHisLEMex7T0TWTrjINAWrXIVnuHZKJSbRuAnSXvg
 SJ1Svz16Ztfm7l4AK3kHEaAg5J1ooCFJKGzYB0im9ivIO4qQ6pLLt+Pq3t0d/nv1QpSyTfQvsV
 OObbh/TNNWPJrLmdx3LbtBwpqbK44AQAA
X-Change-ID: 20251007-rb1_hdmi_audio-1ab3cd93fc9e
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2

This series adds a feature to playback/output audio via HDMI
on the Qualcomm RB1 board. Since RB1 and RB2 are very similar
to each and other and most likely use the same mainboard therefore
this series is pretty much a rework of the similar patchset for RB2.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- corrected compatible for sound node for rb1;
- sound node model name contains "Speaker" instead of "Speakers" now
  to indicate that output is single channel (mono);
- resorted pins by gpio indexes (as asked by Konrad), back to the initial
  version;
- dropped output-high from lpass pins description;
- dropped patch ("dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add QCM2290 compatible")
  applied by Linus;
- Link to v2: https://lore.kernel.org/r/20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org

Changes in v2:
- added tags;
- patch that adds sndcard compatble is moved into separate series
and also one new patch is added there;
here: https://lore.kernel.org/linux-sound/20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org/
- resorted cpu,codec,platform subnodes of HDMI DAI link
(as asked by Konrad);
- apr => APR in "arm64: dts: qcom: qcm2290: add apr and its services"
(as suggested by Dmitry);
- resorted pins in LPASS TLMM node (as asked by Konrad);

Previous version:
https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/

---
Alexey Klimov (3):
      arm64: dts: qcom: qcm2290: add APR and its services
      arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
      arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio playback support

 arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 110 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |  55 ++++++++++++++++
 2 files changed, 165 insertions(+)
---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20251007-rb1_hdmi_audio-1ab3cd93fc9e
prerequisite-change-id: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f:v2
prerequisite-patch-id: 56bfb709f3b52ca03a04df1090f3413764985be8
prerequisite-patch-id: 986319766f2f9e41cc702af7f6ebbb764f5117da

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


