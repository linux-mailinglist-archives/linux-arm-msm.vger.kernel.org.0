Return-Path: <linux-arm-msm+bounces-63915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A4AFB0F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 12:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF52818938E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 10:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE00293C58;
	Mon,  7 Jul 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xifFmMFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BF28CF45
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883503; cv=none; b=rv9AIuqyZPT01OnjQ2iRGJvfW3FFClo8UaDgvHh0hDfd9emqBLmME11Zy4bAq3nfn7lNV4m5AOqsNVk9t4eKkBAiaqcukdt3vAqyZSQ2F6fWwxAyzf5mElfio5ub3nt07Q2Epi/3YjM/EVZZDK314PlbVQmEMRVRE0XnIbHXz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883503; c=relaxed/simple;
	bh=WJvLISuNX9SrkFFHrb70kxmDTwn1pDB/xgPN8Mqr0+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u4oZcRleCFe/OME7TVD1jZ/nmqUx1qfTp6Z6XAaIU3NjQodWcBZxkxX+22MhZw5/nrqdCxtB+HONiidCdmhVvgtjZUDlqnHeLFuqbtFjztJgDsEtQC2Jzb/G9VK6h+K2NxL3/dg2NCFhZgcPkW7cJquuQcPAuhfmFdo/b6JJIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xifFmMFY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0d7b32322so442220766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 03:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751883501; x=1752488301; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bGVqtQ2koVGagAhcdjPHNXO3hocrQjyTn8SnwAtxlo=;
        b=xifFmMFY8FbsteONnjM7YqaTU5HZsz7PgfdkxiYrV7+UExgN/mkTs0M5apKcA8r0Mr
         yobkib3krqyHtaB8VKIFblg2ewwWtjlHAYUXqr83xEkq+iKlcsEtl1vngJ4S1DNpN0q9
         9T0jQYklXms+nlM1PKqYFHrFCtALIC3bn0SHAiuAIMD3Hd7rjOepowur7qUt1c1Jl57p
         alxPLC7bNyar66pfC4dmdhomLp2JCuG2VBKdlik02s4gySe9Edv0XmXk9vwSM3dmnnh9
         qFZM5UBkOdgKpKkliBIR1xSdECEPohE5jlPVoIFDyr/26nWUzu93ApMb7GbyHkJGPvPu
         DX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883501; x=1752488301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bGVqtQ2koVGagAhcdjPHNXO3hocrQjyTn8SnwAtxlo=;
        b=QP5HmCsSWj81+JlrRFBpYzmJLTRxgZRVxItK/BuZE0t0H3Jj5Sajzzo1HEF2Nwk6n7
         1PnaskmR54eXGUWyZVPODajzgXwq+Vd6ltRg0aKN+7AJYsVq2tNKB1STlW7f47R3Qi3y
         30aAShV5nwrk3ARUKhmyxMSgakYQpRUffncRAirFycOfwW74C2/wWgn2Dbvic3dYd85A
         40F89RwW+U+XTY62eXQqybZFBULAWhrAD4Mj0m6hANkT2+Y3cCPftuCZBWShLbdQfY1F
         vHfT6Wk/UICqugaqL9ovCe7o7tN8e0lE+MeV1++6rTwmU01+/kNBIwg7N0byrKCqIGxT
         2SDg==
X-Forwarded-Encrypted: i=1; AJvYcCU7CM7NPCPGo4QAaaRV2xd0WePlFkkBSGOklL5uD1+Z3PnOZx2cahD5eCoka1A1DKVPE1j1ytBvPkSACQCy@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjJF1Pyv339NS9NDpC8sWXotuzRKJlR/1HrUIiTD4idjObyIp
	pEc4qmDDtqiMtNhp3Bdayv4DSa2vAni9QdQUF3wJauHUaPfkA0Jaw3LSxwyQpd3tltQ=
X-Gm-Gg: ASbGncsaVcCTd2mBJlBub+UYxgsbDwuzA5mpf0rGQ719AuV3sjHhHyDAAs1ZGmaMuUg
	4Igo1aeSNvzlnFBUv1o2jpdh9ZoJx+4+WG5hNLP3YrVb2CXjZncpEBDKs7j+R9QiNedgxpUNm7o
	8QNbvVADVg0i4MDCz3jdeMg0HatEKImMH4EcpR7FjL9i0+MOgPrhjfvMmOd9dNypVbah2CJnm08
	9PpNo83KGxCi2tWp3n2Mw6rc8jbEwJh9Q763hqCmBY/cEUlEAShUStcw6haS4+yIKQEvR+YUK/S
	I+leRf1fUUveWcH9+RfSUAbikg8zQhzEoSrToMPZoYskfa+ZFH5g+PGxq5Qzt6nK1VdzaIBWemg
	VwmtTu6155HLRwPsRUyDIT2rLWExTNgHf
X-Google-Smtp-Source: AGHT+IGmi2+AGzMy4YVxywbj63AxXZsKBp/UdN0n3w3kbYRL52C/ABqpGjaRqzOavMUNcyAAWeilCQ==
X-Received: by 2002:a17:907:86a0:b0:ae0:6a5a:4cd4 with SMTP id a640c23a62f3a-ae3fe457953mr1136586666b.12.1751883500499;
        Mon, 07 Jul 2025 03:18:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm671711766b.180.2025.07.07.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:18:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Add Milos RPMHPD power domains
Date: Mon, 07 Jul 2025 12:18:09 +0200
Message-Id: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGea2gC/13MQQrCMBCF4auUWRtJJyRFV95DumgzUzOLNiGRo
 pTe3Vhw4/J/8L4NCmfhAtdmg8yrFIlLDTw14MOwPFgJ1QbUaLVDrcrcOWNVTnNIpMiPlrx2zjN
 C/aTMk7wO797XDlKeMb8Pfm2/60+yf9LaKq0uSMaPBok6vk2D5BTiwmcfZ+j3ff8AkSx5Uq4AA
 AA=
X-Change-ID: 20250620-sm7635-rpmhpd-dcb5dc066ce2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751883500; l=865;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WJvLISuNX9SrkFFHrb70kxmDTwn1pDB/xgPN8Mqr0+w=;
 b=6QRyDuZmo/9ShGExVuji4u5RHu2Uq7ibmNyAVct7bykLWvF01kuh3Ce1RW4zAduFIhck7eXoR
 /c6I7AqtoR+ArQyhwHNnhhLq2cTT++xy/oxYe+Hb/Dse4syVlNgzEcG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the rpmhpd power domains in the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com

---
Luca Weiss (2):
      dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add Milos power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


