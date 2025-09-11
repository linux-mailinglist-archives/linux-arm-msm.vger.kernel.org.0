Return-Path: <linux-arm-msm+bounces-73189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83097B53ED1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 00:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A829B1C24844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 22:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A528D257AF0;
	Thu, 11 Sep 2025 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM/nVgfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3B2DC788
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757630889; cv=none; b=XxxksZMYzLA++glw+VNdlo+rCUIyB+ir7W7KEUfjYwXX/f9pj1TTdjY30tc6xtNOM6ZC2gNewzHX8nHGwDX74jRu/Qyt3G71JCLtwomr0ujVW3AQOIEKAH3dDeiepkPC8BW0cao1z3kvKopH/FwgpuF7f5Xy/mM1OhludXA/0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757630889; c=relaxed/simple;
	bh=ocs4EQ76GlEPr3yAQv3FQf9LAX2b/AlcV9MuFmVhPAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jzloj/Y8il0UAgK1B9H1c9mhMvJHd6ls21uP9BKsygpCEXFQJAHYC6M2f4VUun3wXytK1AJwmvOxhmpkPpF+t60N4SedIuXvgw1g5qojd1rxRCCIjgSJqZHT6QONSfapCUVQBsLQ6P6VB2J3w54qsexN+yCdmG38JRHt31WOPdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM/nVgfp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-772488c78bcso1191596b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 15:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757630887; x=1758235687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqo+6lIPjlAvcSz8C9O1Kyz/i4EBXtrAu/454vmVrN4=;
        b=FM/nVgfpi1cPpX5+ysEHTqwnXMqQ9DCzUqJPnUJMy4QExYOEmkZ8rHVl8oco2kIwVq
         VukabTqCQa5DFdXZSmkynqKUA4eufOiaTuqZEKHQsY/L4tNcxSzVxu0eRrboH49LEVoU
         GXSrvXYTJLRUgOEzt6tJHE0cnOgsgGs+S0uu+yYWclpT0nA+PfaBNiFfxscc0NvqWdyS
         VtaNmlWfO7GwPgH7uLfg2ITVPd0O0b1OLIm3FKMKvc08xajbOaFzbdZiuo96HD7I/6ez
         M/NOPl2deWsHV0L9mdQGQHSq4tA6MIwm+ly853qnx/UUaBqos56Akh6tuoukaNA8XXL3
         DOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757630887; x=1758235687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqo+6lIPjlAvcSz8C9O1Kyz/i4EBXtrAu/454vmVrN4=;
        b=YfIuG1hfWcTGlmqyj7m7XKDmgszoRvlJrH5KVF3l8uoOQLbP0keY+yl6Matl74Cioo
         2LDFtUcT9oChyhpTxMRWKVpfhwbWodO/dqnFlk+QlW/TNeML9eHQ7+HIrehaIYfwfrqB
         TExyyecfvsdh8vzGryD+Dj3tWXmjUwJ7Vd1Iu6ArUaGJ0E3dCi8QCDZH7AqDSwQrl7Po
         UmWMnME+e3lfgZpqLfRmzqnaHFGWPhJYwWK6EsD+wpA2LIugN17OMFs7DZztUyM8pNp/
         RuKUgA6cQA1sIwdIbGFeQrAS0voxKBjmBGyomUnohFhi/wTSNRbLijyuSY5YvK58YQR8
         IcUA==
X-Gm-Message-State: AOJu0YzIlbhh7hWutH97etpELSUOHn5ve9Sl4WIIF53fzRxuUkY5noeX
	ZVDJr1mZBIhDL0C4xnWipHlY0WklVayrOWWAJKWojml0vWqEPJIbEhBN
X-Gm-Gg: ASbGncvGzb6zUzT4nCMsauGnVqB4nEd4iYfv9yE2Krwo23aeCOGFWQlANVczLIjE7mG
	qpvsZ19zG/8xYe0eUAkDHwodq1Kd1wFqDlwS5iO06vBs0tozWqXyyqQOTXToD80PhHjAQpBpaEo
	bMIwDNjD6ubx6BnLHEK96SEE4MT3xA5LyqEnk8395yPfIfDf/9hD9yXY6H0+c9wB5a8D43mZX9D
	h43S2Nyivu1zpmyhZNaiQ9omM4IUayXl5xFxu/QD7jdGbl+3JzHJP0wvdiMsmQ0sOol4hKKMDqo
	V441tDdubg7zw4djtw65fCrIJfca706YP+4/JrVKhYbEGxFHMiZih05BKTt7URD0XdFOk6BSZ2+
	MIyrjfMiygm/v/433YRJqPliEavAfRw==
X-Google-Smtp-Source: AGHT+IFq4DY2b6JZJ/5QAwwp9tb1KFmxBGf2XsSuFAK8OESIdaEFbenOGfnC37evdjtflJER65m0vw==
X-Received: by 2002:a05:6a20:3d82:b0:251:43f5:cac9 with SMTP id adf61e73a8af0-2602a49da79mr1029229637.7.1757630887395;
        Thu, 11 Sep 2025 15:48:07 -0700 (PDT)
Received: from archlinux ([152.245.61.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a4a24esm3172314b3a.40.2025.09.11.15.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 15:48:06 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [RESEND PATCH v8 0/1] arm64: dts: qcom: add initial support for Samsung Galaxy S22
Date: Thu, 11 Sep 2025 22:47:28 +0000
Message-ID: <20250911224734.51415-1-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v8:
- Rebase on 'arm64: dts: qcom: sm8450: Flatten usb controller node'
- Use real name for sign-offs
- Remove device tree binding patch as it's already in the tree, merged by
 Bjorn

Changes in v7:
- Document the reserved GPIO pins, remove pin 50 as it does not
 need to be reserved
- Clarify the phone isn't limited to USB 2.0 but rather USB 3.0
 isn't implemented yet
- Add a newline before every 'status' node

Changes in v6:
- Remove debug features (bootargs, etc) that slipped in the v5 DTS
- Format and organize nodes correctly based on existing DTS, 
 move "status = "okay";" to the bottom always
- Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
 from existing SoC .dtsi
- Disable buttons, ufs and other features for later revision

Changes in v5:
- Properly format the thread

Changes in v4:
- Try to properly format the thread

Changes in v3:
- Removed unnecessary initrd start and end addresses
- Make sure r0q is in right order on Makefile
- Properly format memory addresses
- Set r0q to the correct, alphabetical order in documents

Changes in v2:
- Attempt to format the patchset thread correctly

Eric Gonçalves (1):
  arm64: dts: qcom: add initial support for Samsung Galaxy S22

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

-- 
2.50.1


