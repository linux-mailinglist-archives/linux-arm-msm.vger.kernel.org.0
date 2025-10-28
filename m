Return-Path: <linux-arm-msm+bounces-79094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F63C12FA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F1D3B9E7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 05:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC7C29CB52;
	Tue, 28 Oct 2025 05:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMuHqPz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3E1A0BD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761629578; cv=none; b=uQ9lm0mc1IZXqkCS4XhPK8rNrKeHdy6LVm5+J0EadIsZ38V81pjsVZsmzs00nrmMsWODj3SYdNOuj2/OhWl1osMov57Lv4k/0rt6OYv4u+saCLWLNzeSslraX8+f8MQ1Q6eHxgXYbOIedO9oOHqIq9nN0SvaHbt+ATWaAtnmKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761629578; c=relaxed/simple;
	bh=e6JmMMCtHtaaPFxfG7T73rKv++Cw8zq2s3Ldv1lkxiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qm6rThOSYJnDtp4FShSK+VKqEQQqSuOYBtKFUORTp3XEFrjoHZMy5lsK/TIFozGp+/JUxqfOFpqBTkJDlRv6k5KnyOyhdtHXdw7CxbjroJ8H5YbJ9Ez3gwcHedqQW/Dkl9lF4GI+4nakwCXRWeUXOG6826wYsR/mQro1HPNjX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMuHqPz6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33e0008d3b3so5590019a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 22:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761629576; x=1762234376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFRcv76ANZA3gzIrveFcs6ALPGGM1pUqXGSda8XF/1Q=;
        b=aMuHqPz6CWcjG0vd6+6xlV9jZj7ho8RS9LxTJF3PTcK4Lki4T5XIIBO8R6CEVjzAlz
         PIvxpdbHDuC2fDZ0XYduoWFPlZVt2GKZWOI18HN+/mLUGnPzloYpcJ/B/10lEWHv8V2U
         i/YSHrSVu7t0VeNw8vITlOeNcH9KBiS167Kmn8iLiYfCRGaPzwBM+PHLpJRzQ/VzJ40g
         pa/zAaojAOfb4ItYhnXUkn4AMsJdstIJFQJ6ManWbjTQ1mMiUXJjF280+QS+XC8f/tqL
         JMy/w7aLW3N2/SU9pceNT3z+WUDBuwF3++CKEstuhmbks6Ms5xO75nX4WMuA6hQ4pGxR
         DJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629576; x=1762234376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFRcv76ANZA3gzIrveFcs6ALPGGM1pUqXGSda8XF/1Q=;
        b=S73zOxzEZ84TvioEG/hHrVX+ulp3mU9PM0AXrXoW0Mf8n1w8F/3OBRe/mIIJh+tH+G
         DB3bOfIaQFf6ad+NscuUSaPGLRbRQ0YC9A2e91wOlvntKSl2wfJ6g3Teq0AIAh6ysa7l
         /P2cmQpXflFDJjPzDp0M/sFcJB2kY+0NQ6kCnFZMcx4Y07xcXpLc9PjBJ53UxkYy+xSe
         AkCKvkkNR9Z4HkBWceZ6GoZRzmimyDYMWjASfOeXQdpfVJXhWaScrwi5w9Wssse8BEfm
         WQ+Fh83Z9jFiAAbUriVvLixdRpUOJS9g+DK8yeUVELloZO0eAcCgOLkTCND4D3XmE9c/
         ZH8A==
X-Forwarded-Encrypted: i=1; AJvYcCUssS1JWPdjCtvJ5uUMH2pTjqnNw6pZw0dnFEkjOi11qbXqNP3ct/1vIPi5gx9g6YTrsGNGwWfpoXkVF35M@vger.kernel.org
X-Gm-Message-State: AOJu0YzZd3PkmkssIhILeTvpfInigPKgVo0KNKxLpXGnlCucm5CPxS7s
	vsrbn4+ONha+H2V9wk/QUMfr+0GuRWRVfI/Sh2RDpedRZwMZWuJTpT32
X-Gm-Gg: ASbGncvkl13d3WCf8Y7GvpUpsT6J43QyjT37fsB0cgoFEnaFNRvcK/TzZAzLuDXrZTB
	kn04N77XZ+DtvYtE5YYWEi60TAvUhAp7SpChrn4wM9wumluWmTI78sl71slRWLKHeR6wcKd//bZ
	Gf0aFu41HTzjW7C4Zz003F875BdlODE2PNHnpqSPPMNoxp91vkgqHUCNsnNCGCJdhz+Rh7YMk3Q
	TujkexmFtYV40hMJS8vCQ728MSgClvFfLDG5fjDGXxv4Hf0obl8ca5tBOnbC+CpJU8Ac0Peq4bR
	Ymc+cwxlrBTv8Ye6hgFTtxGqSWQ0WbpueZRhSiz/UrGu0AWf2m6HN1C0Y5F8fzbn1sQPzgQZBrU
	zlFYzlJB+5QaK3G8I1PVANAftUp9q7upCSk3B2QxDnpofh1f5pxbjIWB14EAN58gCd5jtTMnOfJ
	8/viIi1WzoJisLtDntTY7nNZ0wjMqxuM9el0l/
X-Google-Smtp-Source: AGHT+IFG71VLpRXivUpjZ9QwxZssTUJUowz4hMMBFJiOjnkSAnrre/m7rTDb71KnYjEdyq1Byr4CKQ==
X-Received: by 2002:a17:90b:1350:b0:33f:ebeb:d7ef with SMTP id 98e67ed59e1d1-34027c19552mr2900601a91.35.1761629576469;
        Mon, 27 Oct 2025 22:32:56 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70645fsm10649477a91.3.2025.10.27.22.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 22:32:56 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v4 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC support 
Date: Tue, 28 Oct 2025 11:02:46 +0530
Message-Id: <20251028053248.723560-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds device tree binding and board support for the
Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
QCS615 SoC.

The first patch introduces the DT binding entry for the Talos EVK
SMARC board, and the second patch adds the corresponding DTS
files for the platform.

Note:
USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
is not connected the switching cannot be handled from SW.
Hence from SW Host-only mode is supported on Linux boot up.

Changes in v4:
 - Updated product name to full form per Krzysztof’s feedback in
   dt-binding comment.
 - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
 - Add DP connector node and MDSS DisplayPort controller.
 - Added USB note in the cover letter for maintainers' awareness.

Changes in v3:
 - Addressed comments from Dmitry regarding USB1 `dr_mode` and 
   added a DTS comment.
 - No functional change in bindings file.

Changes in v2:
 - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
 - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
 - Fixed subject and commit message to use imperative mood.

Thanks,
Sudarshan

Sudarshan Shetty (2):
  dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
  arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 442 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts        | 134 ++++++
 4 files changed, 578 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

-- 
2.34.1


