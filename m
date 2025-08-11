Return-Path: <linux-arm-msm+bounces-68347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B834DB20753
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 109BC7B7201
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9144B2BEC21;
	Mon, 11 Aug 2025 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MpeiegV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28C2BE7AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910822; cv=none; b=p2Vg3lfAmiV7SwL4878xrtofOHfv6Htbj0dTEaS7PWY0TvrIBEvol5qc0E9hYDP8/7F3hBCunPKn39t7Ahi5NQ+n56CwtuV7f8S2I/N6wrTRzKENUbWT1rrdnOBN80lnvt4JMfbljFPW6UNE6968zDX84PEIX2FePrp4F0RLCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910822; c=relaxed/simple;
	bh=IteUFERyC3LLjXnKcbASB0b5pTZCcipeXnGOb9hHHf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kxTcLNZfVmoImMgNo+bz6JtxO2C/NQobVjm7pHk2THIduTjabEjwFcDYJLnp2QEQJ0gelqXbdB9zPxWvs+Oil0GeTo6VjguXiJjakHlXoNXzbaKsBRUZ5Xg2gfmiecufugcGu8Y/3Tnncbhoz/oIm0fKwkL8lzEFrOAD62xv3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MpeiegV4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so8176944a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754910819; x=1755515619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rI8qy4HURu1XEpiDm68Dqm4qhGh4Hz+ANesFdAjnAZ8=;
        b=MpeiegV4mabzOg7/9Svr9gGxq0YgL/3CBthUQ315+FmyD/EU07Ttg6hFqHVaXQ87G0
         yVgZzYCmdlMtgITJ3cf+qJdlPp4MwEbhLBN4V50/gZEV8w6R106oaldCF5cxHgEPQI/U
         hozS9NnJ2l7XME3Md4pawb3q+GCGilMpwSSW4FcXHev8AGpG+2tsIw0FeQ9iuxZdLwBv
         Z6Bh41c+Rfdj8ncppLMkqOwzAYpUuci656KoeXQ5Yq2nr3B/A+7g5Aci4rQXGimCQTDo
         k8Vx/P3q78XtnOy8COZhxTogB7uvZThUzmKo+/M2hbqRIhjVZh9p0jtkSfd513LOVqTw
         N1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910819; x=1755515619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rI8qy4HURu1XEpiDm68Dqm4qhGh4Hz+ANesFdAjnAZ8=;
        b=WJS1UClo+sHRK+LS4bO48QT4fJ/akz/0aC7kc9ygob8rg3Pibp+Di249s/uZN0k2wi
         ElVWGVBAoGZgKTMjXmF0ngA6CnF2TaE588TmJys0FpVqDbgp/ptBxP2Gq5IEsb8pcp6j
         EUWpCCX2jdKRKI9pRpq6nSje1iW3BHH5UsIGzYJMFC1P37i4hujmwjfuh8qqmDMCYX8Z
         qlBXCQsv+lESDqHrOIsQtnAR8pt2n9oQvNytNN1YzykbMfOeSEDNr0A7DL6zWw9FxWIj
         Izd26e9j+2Iq/mVkfpJGKQyCe+TyqBLY5gKEYr7xBprMLWFt40YPUbex95Ub+V6LNIFE
         Zmcg==
X-Forwarded-Encrypted: i=1; AJvYcCVdnzTbicy4leYIvMKL+uS47SoJeAgrNOc540B3ATSmvZZRYEBcE1wHuk70J1hSjethWkPj0ZE+HvCoGaed@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRYe6Aekj2MtKidVzt2FVeW02YRya0QC9AyPXGxsUz5wtIBcz
	gRFVhBKN0Bb1UIl7WtL/HtUo8zzHDzE+94fZWwdUDVel8EU0ll2666B8qAtw3GnBCUo=
X-Gm-Gg: ASbGncuBdSFVU2QmkhAjXoUqUV/yaaeEYtMnXKStYt1j72mQfnKRn2Cf6GCJNTlY0aJ
	8h6fbVafuEZK+qQxvbzA4znOF+/pZ31LT0E9x3HER03nCQQjOObsDYp9q7uGjClI05hQRloel8W
	9eRxtyNvm0hY1B9e80Tm/wIL7PHwKB9VGCZYYCx2aleC8gmuvK0knmJwjcFqt0kchMMNvcGxhX/
	kxmt3hW3UJuD8m/9otcRM4vLf/KwOwCHxm8PAEXgsabySTemFDwFWrb2wt2zh/PaFRnENE9qSJv
	afyK4qSiyr61D2naQLlLjP/EOdJeDP6etf6PBt+DZUy/YCzJlDWOF3wyEhFjxSxVB4fyUqUTm5I
	xEO9+yNR/1xsYrIatoD/IoSzJIUyzbEw7Mk5O/ZmahYtGf2XeatYbuXTAk7txRtLBs4KeIb5UIS
	Inafk=
X-Google-Smtp-Source: AGHT+IHMzaTMnoUFzm5ThvX3ZvXKmvvaip5im3KIpPyg4ny2jDuQ5DuInzjyOZyPMHnj8nvtXlES+w==
X-Received: by 2002:a05:6402:440b:b0:618:1606:92ba with SMTP id 4fb4d7f45d1cf-6181606c255mr6469667a12.28.1754910818923;
        Mon, 11 Aug 2025 04:13:38 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61821e562c0sm2467278a12.30.2025.08.11.04.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:13:38 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/3] Add support for Awinic AW86927 haptic driver
Date: Mon, 11 Aug 2025 13:12:00 +0200
Message-Id: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADQmWgC/3XOTW6DMBAF4KtEXteVPR4MdNV7RFkM43HxohCZi
 iaKuHtNVKnkp8s38veeL2qSnGRSb7uLyjKnKY1DCfCyU9zT8CE6hZIVGKhMY1DTd+NbqHUbQmA
 HkUlYldfHLDGdrk37Q8l9mr7GfL4Wz3a9PnbMVhvtgaywrWMkfI+U8rEfB3nl8XOt/TX+1oALD
 flgInRwZ9btGbZ71Z+Fda/2sXzCG+z4mXVbu9l1xSIiU4d1ofTM4j8Wi+XKGAdtQ87KvV2W5Qc
 dB4wTigEAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754910818; l=1519;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=IteUFERyC3LLjXnKcbASB0b5pTZCcipeXnGOb9hHHf0=;
 b=h/pHLl/o0HQGmPU+OV1yzwhLQnkVAznMNOs2rizQYz3UOp/uhETtHaMDmKk+EujayGBN2/tL4
 N7gIheldA0rB1UWVVil7coMepCSC9l03hZmOQEhAMFuxS5yb0Lof7ue
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add devicetree bindings and a driver for the AW86927 haptic driver, and
add it to the devicetree for the Fairphone 5 smartphone.

This driver does not enable all capabilities of the AW86927, features
such as f0 detection, rtp mode, and cont mode are not included.

Note: This is my first driver I have ever worked on so if there is
anything I can do to improve it please let me know!

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v2:
- Changed title and fixed license of devicetree binding
- Fixed typo where the 'm' in 'ms' was excluded
- Changed error handling return values in driver probe function
- Link to v1: https://lore.kernel.org/r/20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: input: Add bindings for Awinic AW86927
      Input: aw86927 - add driver for Awinic AW86927
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support

 .../devicetree/bindings/input/awinic,aw86927.yaml  |  48 ++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  18 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw86927.c                       | 841 +++++++++++++++++++++
 5 files changed, 918 insertions(+), 1 deletion(-)
---
base-commit: 3624e9a34b36d64a7037946eda28ae9599363a3b
change-id: 20250804-aw86927-9dddc32fcaec

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


