Return-Path: <linux-arm-msm+bounces-25193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94892669C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 19:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5331C22E18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 17:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A60804;
	Wed,  3 Jul 2024 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3ofSfZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37F17B50E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720026060; cv=none; b=o92Wavy2aG1hfAKzXtRMSH8j/WsIVDj9JstF/QWfqeR0gfx277lVkZV85BguMGdBwrtxXU+CiJRRdsocdbET9k43tLTURYul7G6VLgUeAzswNbdSlvdcivpnx+RtXxxMLV6P3GsX4nC0PWIMVT3cxL3MKBtOBbbCIchhIU0XT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720026060; c=relaxed/simple;
	bh=y0zHZnBhe/X8wnZs8QZ5TYJP4+86aDrCxJdiCkTLEhM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UrwQ7t3AR/q/VjQUzWEDtR8d4P9U7tdd9xbvirwdcatOVD2OAchAuwlvwgy5C/15TQCDT6OqeF+ma/Vna+MwPMVstIKMJlTtAQynUxYMxBvIBJl6tg8VTWF+r4pd79PlHiHjMPndc9m8vOFtiP9nUw8IDlNjsIX8QHWnBPSnlsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f3ofSfZi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367940c57ddso509709f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 10:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720026057; x=1720630857; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQxm4MXhdO/Ccx6raqWeDezg+JMq5tqzpnV146by4Ww=;
        b=f3ofSfZikq6pFg8fGimzGCQH92DN9BIVxTZd1MK/LFLYcoX51yXtW7TEw5GmeETKwn
         X4Hv7QXK9O0IObRPfl4w2GroCMJecNQh1ZigXuCNHQr0hjqWstq+Q/Sfn+JqZup5La+J
         qN0a7AiFrZrhPwfkPUe/l+EWzP+LZ7kjHtVWGM6nGLDOpz++UjuPV/Y7gZLXdqDBTyTB
         e5DyZmlgbodY1WOVDKYBErvk2UwGFI5e7GdSmUjBsihlF+2ph5NAUr9kvNnrfKT7kMYH
         wKNbh9S6QIj6Y4xXFv9x05lsvWlA8frBL9ynxJTIcogWQpmc8XAvtEupMXQTts/noRJF
         /Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720026057; x=1720630857;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQxm4MXhdO/Ccx6raqWeDezg+JMq5tqzpnV146by4Ww=;
        b=T9vlNFNWWGifD8d8eM9KmnWFobmNn+TMj0qvsKq3CMDyM+xwaavJgLBlapums4pJdU
         2ttVHVTs66JooUQ16MCIdeZQ76IKYAgMDbB98QEpd88s+qvokTr330qUi4P3ngDpE7uT
         pCTmfyhIH5AdVA9s/yt4ouPptark7lTW0SRsdqe0YMMeJgSRQ07Wv9696/HPIUKz9ecj
         zu+uumdG6ml2CfCwjrJwjtNNi21qKBKvgtsMp1ga2/X+oBQKSRxuhVucm4tUxV0gqDOj
         uBGUc6hMYPmbVtj7qaKJJcHaXJf2C9xud058ZnDWcvVVTnmalCtQA6My538s6CNi6+/9
         J3TQ==
X-Gm-Message-State: AOJu0YxoNvQ7sggB1homb48xHlyzbRZdn4YgK0vTYOm37t2+YuTmv3Cv
	37gnIBvJOlL6w8s+2Bx3CqkmRC78oxpQUnJIdVeOuvLL3wSJ2WnesoP9h8T9zhk=
X-Google-Smtp-Source: AGHT+IEcR7djVr+qUOG3e6ZRpwKNaMhbNJ3iKosELfqtJMxGjBWnAVgO4GF2QY8V8nDx2EAwja1GOg==
X-Received: by 2002:adf:f1c4:0:b0:367:938c:29cf with SMTP id ffacd0b85a97d-367938c2b1dmr1530049f8f.71.1720026057345;
        Wed, 03 Jul 2024 10:00:57 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba2dsm16403776f8f.73.2024.07.03.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:00:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100: add Lenovo Yoga Slim 7x
 support.
Date: Wed, 03 Jul 2024 18:00:52 +0100
Message-Id: <20240703-yoga-slim7x-v1-0-7aa4fd5fdece@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSDhWYC/x2N0QqDMAwAf0XyvEC1OmG/MvaQdlEDWzsSGR3iv
 6/6eBzHbWCswga3ZgPlr5jkVKG9NBAXSjOjPCtD57rejc7jL8+E9pL3WNAPfI0hDNx6gloEMsa
 glOJyNFNWTFzWQ32UJynn6P7Y9z+V5cMgeAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=y0zHZnBhe/X8wnZs8QZ5TYJP4+86aDrCxJdiCkTLEhM=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmhYPHX8qJRtVDCDa3Dh9334JNqUTBLxzT97hpm
 0G6RS3OSLiJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZoWDxwAKCRB6of1ZxzRV
 N9obB/4jry+Wq6/O4Vtu3hPK7WPV9/89K9Aa6eI0rotij6XXqL80+43XbCTHG07Oljqwi5qGBxm
 KKotnjFQRPYxOKq8mcFHf0Qu7l6KbUP+o3F+p/i440YDHDnNWA153N9vXXPoGsH086BnHmqDnQH
 YlsbRiQ/OpFWw4MOPiiKT6y+LsMHul6UV1wkWwRupPUoMkfuYLQDi2up40+NbxSWGFwb58LaDUd
 B9iNWVegWJv2BUCeBS0Ds0naQ/6+Nv3PLBYuQqr5njBRkwzNmSnZ++Q/V4OHGDXaq0H1uWxMvFq
 JfsSk27QXqo37bvoeBWES1GyVr4XCt7ATZCCh5V+gBwwEYxh
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

This patchset adds support to Lenovo Yoga Slim 7x based on x1e80100 SoC.

Tested features:
-> Keyboard,
-> touch screen
-> Display,
-> Speakers.
-> all 3 usb ports.
-> WLAN
-> GPU
-> NVMe

TODO:
-> touchpad.
-> 4 x dmics
-> Battery level (Does not work)

Note, All the firmwares are copied from windows for testing.
 

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (2):
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
      arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 910 +++++++++++++++++++++
 3 files changed, 912 insertions(+)
---
base-commit: 5f18d86e750408030e3980e566ff87f0319d7f34
change-id: 20240703-yoga-slim7x-35e6cbb5e13a

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


