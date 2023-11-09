Return-Path: <linux-arm-msm+bounces-274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D1D7E6991
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FAA4280F6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D8B1A5AB;
	Thu,  9 Nov 2023 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eR4U1ZiR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA2B199DD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:30:26 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873EC2D70
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 03:30:25 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5098e423ba2so823391e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699529424; x=1700134224; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJoIDcfn+3mdNzUBBidZSIASenQqfUSASLt21agqt48=;
        b=eR4U1ZiRviRhGMFpi+ARmzYfEbsnxDtucEGzmi2owNqPTgQhS/Tg2X2Se1nEJRnnCX
         ChzKRjXvguDDqrNMOL+Mxsz0PqALdkOL1ecA8xPXbB/94dqz0JOJDPskluTfrzbQSwLq
         QtlWGO104lOUwh2J1qMYvH42R2cc9NBk2Nv5fLV+08l5g32/nvSqLc1G1o1jjRAL0RFI
         oumy70BQpp+hnRqkBN7YpaqZFQqLcEts4eRKFOEZ7uHCUxowAj7T9/FHvSSq+dGtb9hx
         OPqe8xQlipZ7qXNNwsTB/eoJROfrQ3pdogeV85ZFlZkYjylrLTa9eUvcH9TCtN/cPq8o
         HL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529424; x=1700134224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJoIDcfn+3mdNzUBBidZSIASenQqfUSASLt21agqt48=;
        b=Z9nQl+W/OV5JbbnbTVj80YRcAIeJ+/j4qSXkr9dutZwOoN33JuUyUEhqp0q7RtE4+j
         7JcplkYedlGkSQGVajGD6dJOiSydZXiy9q2kyEksINuHaEUVvWH9b7hKAFsrWxRqkK2i
         vg+AF7+zhGzhpBdFbo36biygxXwQ/TpKVUHliKUALF69+XruQAH/HcHvS2/L6qQGmdI3
         Pi3J09jDjCYuOTg9CWEbxYI3Yus8CkT0a+7bp9pvJyvQUo9Uq9KJ6bOkjTk5yM/Z3O6t
         pNwOdSVOfqYEbLpFzS+1vBZlCAU5ix49QwN0sobpwzpl6oEP8KfVxCTDJDsfuyqtFdBX
         KFrA==
X-Gm-Message-State: AOJu0Yw7MvrhwkhGQz13rOj4QXXwoGmq6LwQR+jo50Qd6SolrIco2+L1
	++cVypWfcUbAcNpfA7xnV/b3dQ==
X-Google-Smtp-Source: AGHT+IEcdHFW7ZQYbhUiW+ZpOhod9pDDItDwwyR60fpNpcWAPP0PntypZbEFufZXWbBXh2V3H5ykaw==
X-Received: by 2002:a19:2d41:0:b0:500:9214:b308 with SMTP id t1-20020a192d41000000b005009214b308mr998897lft.65.1699529423642;
        Thu, 09 Nov 2023 03:30:23 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id a11-20020adfed0b000000b0032d9337e7d1sm7185790wro.11.2023.11.09.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:30:23 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 0/6] media: qcom: camss: Add sc8280xp support
Date: Thu, 09 Nov 2023 11:30:20 +0000
Message-Id: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMzCTGUC/23OUQuCMBDA8a8Se26xu83Unvoe0cM2Nx2Uky2GI
 X73phBI+fg/uN/dRKIJzkRyOUwkmOSi830OcTwQ3cm+NdQ1uQky5AAMqBJUy2eMNOoKKzYOlBl
 QNRiFoCzJe0Mw1o2rebvn7lx8+fBeTyRYpl8Nd7QElNG6rs9WKK0qK64P18vgTz60ZOESbgm+R
 2AmVCmtaLDgEtkfwbdEsUfwTAjFNS/RWvbzxTzPH6tW21s5AQAA
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-26615

V4:
- Drops all _src clocks and _SRC indexes in series.
  True enough the CAMCC driver has all of the appropriate SET_PARENT flags
  so there's no need to represent _src clocks. - Konrad

- I've opted not to split C-PHY and D-PHY init sequences up unless/until
  we have a C-PHY init sequence upstream. - bod/Konrad

- b4 trailes --update -> + Konrad's Acks

Link to v3: https://lore.kernel.org/r/20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org
Link to tree: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v4

A working bootable tree including this series
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-linux-6.5.y

V3:
- Strip pointer to dependencies from yaml patch
  I was hoping the robot would understand the links but it doesn't -
  Krzysztof

Link to v2: https://lore.kernel.org/r/20231103-b4-camss-sc8280xp-v2-0-b7af4d253a20@linaro.org

b4 base:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v3

V2:
- Rebase to capture is_lite flag from named power-domain series
- Amends commit log of final patch to give more detail on rename - Konrad
- Opted not to change switch() statements with returns. - bod/Konrad

Requires CAMCC for sc8280xp which applies to qcom/clk-for-6.7:
https://lore.kernel.org/linux-arm-msm/20231026105345.3376-1-bryan.odonoghue@linaro.org/
b4 shazam 20231026105345.3376-1-bryan.odonoghue@linaro.org

Requires the named power-domain patches which apply to media-tree/*:
https://lore.kernel.org/linux-arm-msm/20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org/
b4 shazam e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org

Link to v1:
https://lore.kernel.org/r/20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org

b4 base:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v2

V1:
sc8280xp is the SoC found in the Lenovo X13s. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces.

A number of precursor patches make this series smaller overall than
previous series.

sc8280xp provides

- 4 x VFE, 4 RDI per VFE
- 4 x VFE Lite, 4 RDI per VFE
- 4 x CSID
- 4 x CSID Lite
- 4 x CSI PHY

I've taken the yaml from a dtsi series and included it here since 1) I sent
the yaml to the wrong person and 2) it already has RB from Krzysztof.

Requires CAMCC for sc8280xp which applies to qcom/clk-for-6.7:
https://lore.kernel.org/linux-arm-msm/20231026105345.3376-1-bryan.odonoghue@linaro.org/
b4 shazam 20231026105345.3376-1-bryan.odonoghue@linaro.org

Requires the named power-domain patches which apply to media-tree/* :
https://lore.kernel.org/linux-arm-msm/20231101-b4-camss-named-power-domains-v3-5-bbdf5f22462a@linaro.org/
b4 shazam 20231101-b4-camss-named-power-domains-v3-5-bbdf5f22462a@linaro.org

To use the camera on x13s with say Google Hangouts or Microsoft Teams you
will need to

1. Run Firefox
2. Update about:config to enable pipewire
3. Use this WIP version of libcamera
   https://gitlab.freedesktop.org/camera/libcamera-softisp

A working bootable tree can be found here:
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-linux-6.5.y

b4 base:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (6):
      media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
      media: qcom: camss: Add CAMSS_SC8280XP enum
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 two-phase MIPI CSI-2 DPHY init
      media: qcom: camss: Add sc8280xp resource details
      media: qcom: camss: Add sc8280xp support
      media: qcom: camss: vfe-17x: Rename camss-vfe-170 to camss-vfe-17x

 .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 108 ++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 .../camss/{camss-vfe-170.c => camss-vfe-17x.c}     |   0
 drivers/media/platform/qcom/camss/camss-vfe.c      |  25 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 307 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 948 insertions(+), 9 deletions(-)
---
base-commit: 89e965e1a58f58cd359472b14c0cc25587bcf264
change-id: 20231101-b4-camss-sc8280xp-0e1b91eb21bf

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


