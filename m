Return-Path: <linux-arm-msm+bounces-62341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1146AE7BFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579661BC7E3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA8F29B761;
	Wed, 25 Jun 2025 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KncfVZip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76D29B232
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842795; cv=none; b=KZNl4I1UCtAiU49u5CiFnfd4w8MHExsUSU5Bw0W5M8FAJ6itoerrpp3Jb4KCIwbSMx5SsfSJB6Ex7wZEdxv4HSooyjXpPbasyMfKQ41A4P4wO0b4uy5XPFVuskRdARDKx1oIqwq/5reiAP9caBUOv6Qp94FRqx/QHLbR6ezhm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842795; c=relaxed/simple;
	bh=rCMJF5cY6TSLNwLvNZ8Vo7vwwOm7NqQ5k6GlrWG6fQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=inKzUe6Ntfqt1/2/89H/sd5hWbAOB+vt9+qZwECExYyheA5zgx94WQXHM09LGlwuTXVmorwBgFW6/GFiGN+L7R0AfUSUmNjMzG6hlHbD+x4B37oVEVYfV2DzDw/aV1h6yc8HZmsECaFVXC1omcp1gdSFVbI6u8IKdWr8hnfVtxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KncfVZip; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0b6532345so136057266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842793; x=1751447593; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7JDb40b+XMsoFH3hVYMNJlvkxxFd1SJzzC2buHHkiRA=;
        b=KncfVZipjxwz/ktQpE9/TY5Hr3f0hn1wRaDsM+yFDiiiBdxc3dwpxtZQeBFh4EU/N/
         LQWwf2YHD7zxh6haBXf8sw20o7KIfNc06mXYgfWxJRUL+qTp8OOnA338lTk9aRfSgSqh
         e0vPfOCDBLYosDaBsWXXvVMkh9L9V/K7r4FGI2GazIOlgIvYzgnNqde90xD4QRjiAP/T
         qcWkTBSTv/mdNuftFMJdnMZ9vljTdtaxZV0dgXS8tX8Tv4KIxc5y12t447pjs8Rl3ipJ
         Az2nSuVaQptB/CNB4NfWJMkvlf1xZLvZt3PoWWCAy0DqgWk0fWfdJsVByW+LcUucECLO
         LKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842793; x=1751447593;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JDb40b+XMsoFH3hVYMNJlvkxxFd1SJzzC2buHHkiRA=;
        b=HQnYdBWwPGZQ7dw3GWiU/ETEYuFQQacjkVj8p7onXszk9/0RVDUpZ73TZm40dkb/An
         W/vdeUz4WGPC1p/bMhT8mfcWnniqHYRFWqpNrsSiMnLg37Trjd9ltc9WMjTcSr8iH+y1
         fjOfN5h+gM0C/c6LCPDpxxtjr9iQ0EBwyZnEJeVFTtk7BJdWdapGDPE+mtVPDBgRYbsq
         pPEAlpetGuGWGEWsmjxZ4YU5qsCvWNDVFu3Y4Dygo2rucqJmVVM2DcnwLfyC1Vr3lOTD
         /1Kl8v06ArJPciqJwI1BZtPb76RZCRRIGCOXV1CEM/CQGTlRr5n3w/h2sNF9wnoHYbuI
         Nacg==
X-Forwarded-Encrypted: i=1; AJvYcCXizZ1lzm07kTDlgv/TrmpIAbIGNF7t7CAFJStqkk9+lECNok+QlqZvReGgjxD8iqocVyFD2oeRit74IY/k@vger.kernel.org
X-Gm-Message-State: AOJu0YwNWTdkFQTX/IYMYzCNrNbHob9GHEpoSjIHIBtAvKKxIsv4XntJ
	rspDTk6r1Sgr+r+CliMePLo54G1L/udbAVcs/HcdI5L3D997KD84cztdS5H9h3y/fpc=
X-Gm-Gg: ASbGnctrlr9c/Im7w7dx6M8Ur/50iTc3ZSRhSMVcd99jR8XMqLvM8lrgO1Lv/Qr8HY/
	86z36ewldmS2zpwwSKoC+A/qclFzAtuHpdm5flKcZkKDqXW+U++A/FPNPe+YUqMdGMLnYWFTLJ4
	/w50eHI3W0OMW5Hii83ygbvoDYexsw2xwtqGj6MiIKZY/G0L/PDAy8/OkUOfMzcphCaPj+Zd8X+
	FtvnaY0h/rzp4AlP3OFpmKM6qiQw83TKyjz0rZQlYJ6LDXHJt8+ucAtgHifRbQUN+R9UwcZw2EV
	c9jgGhnrDh66eNaFSsHCdF23VVzsfgP8h8AVoRbhxbKbu8pCE+Nus7ETaRzyuPx/ogkTMHk5esu
	toS1nmSd/pTmg/oC+jmwLAkHI7nfq0++p
X-Google-Smtp-Source: AGHT+IHytBgJSzxPG2M0B0pHjNve8tu+c9ENTWBqtwZam8LKZyOcUSplxme61y1UP3dKjhu+DHVnjw==
X-Received: by 2002:a17:907:7f2a:b0:ae0:a351:6208 with SMTP id a640c23a62f3a-ae0a715cf32mr592579266b.1.1750842792529;
        Wed, 25 Jun 2025 02:13:12 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add RPMh and TCSR clock support for SM7635
Date: Wed, 25 Jun 2025 11:12:46 +0200
Message-Id: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI69W2gC/x3MSQqAMAxA0atI1gZiS52uIi5KjRocaUAE8e4Wl
 2/x/wPKUVihzR6IfInKsScUeQZh9vvEKEMyGDKOSkOoW1Vah2E9wqK4iQak0brGD7Ul9pDCM/I
 o9z/t+vf9ACXX+NhkAAAA
X-Change-ID: 20250620-sm7635-clocks-misc-0f359ad830ea
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=897;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rCMJF5cY6TSLNwLvNZ8Vo7vwwOm7NqQ5k6GlrWG6fQ8=;
 b=i5VJrCDxMfUXV0muX3ixGkMAukjuxYAe5nADAwWzlBfOfZjXRZvdIU+v2u71LqJCEcH5xer6Z
 1vGynEloSFrBpWyZHl9TpByd4VQxjmhqFem6M/nZkbrVKFHnMU71Pdq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support in the RPMh and TCSR clock drivers for the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: clock: qcom: Document the SM7635 RPMH Clock Controller
      clk: qcom: rpmh: Add support for RPMH clocks on SM7635
      dt-bindings: clock: qcom: document the SM7635 TCSR Clock Controller
      clk: qcom: tcsrcc-sm8650: Add support for SM7635 SoC

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  1 +
 drivers/clk/qcom/clk-rpmh.c                        | 26 ++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8650.c                   |  8 +++++++
 4 files changed, 36 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-clocks-misc-0f359ad830ea

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


