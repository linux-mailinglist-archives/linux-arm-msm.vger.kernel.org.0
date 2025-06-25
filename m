Return-Path: <linux-arm-msm+bounces-62371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E22DDAE7CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B273AD20A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804262D5C81;
	Wed, 25 Jun 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ENCC/NYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA02D6625
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843131; cv=none; b=Xwee3OV+SSK3CN4arVEacY/oS/vK7Mj+0a/UFrRehyjodqNY2AHxfGgVGjqsgAcmFFsq3/JCLiX3v1DG5vMKS+4jHSkxkXQooNtZLbLQKaZUmnmpkR/VmsaMSGAUM7bAX0kUTFmrN9l1yU2CMt+/joC8xR2VK14QWXr7HfTC2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843131; c=relaxed/simple;
	bh=bKa5pgN2i6WIOfNTB+lQHR7lOH2QI72NCfvc981xeY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sciNNaTVZHOC3oTAf0GC9jXfDFaAMTddPVQLHVJl/1Q4ZdR33ovmN2awY9APk6Mr1gUrra6LCwmBYWRdQvDlPprw92PTvROltAXBfkqlVtOsIgzwcKN4Lvkl9qSbPfnoLFWaianeKRi0FzXEsn7eGPniiYRv0GsABKgR5X+d3Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ENCC/NYt; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so10038802a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843128; x=1751447928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iERbP3N/EQif4yPHwjfNiSXoDkXWDN2BNOK+TFkqrQ4=;
        b=ENCC/NYtim7wD2BmaoJW7AZQp/bPvWWfcx7WMjv1lJbuytSXqzMff+vwj03zbceXXF
         1q0Q4dNhyhrcnr5DcBi0YI7s70orWarLOER+9B1xhjCMRnhNdHQXU69YsYEnhWsSKZDW
         PgVOcmLQ6ZzBMBb/UmBGCSSE5Gi8uhNBItPr0ES35JsOZu34eOcDwDP/+ZCfoCnfH0lZ
         KE2BSLgOvEQn+NB/UIEV0uselseOyjndI6KYbPO2o6xfj47rN9TvzyBiHbvrK1lH06HB
         +JYR1DtuMh8ImV6apY+ljBqvxdi0jWXA4SLwxC2eciw9tQyZ1PO8IPOWC4gsjUzi9R3y
         2ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843128; x=1751447928;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iERbP3N/EQif4yPHwjfNiSXoDkXWDN2BNOK+TFkqrQ4=;
        b=ND8Z6PIDLI0f11GMyq2n0dslXCgxmPErWoVXiefHw/yOYobrBqhkgvfV+6xzUQTb3E
         Uq9b2BVJjZlZf3MVxfN+BahEBLLD5HRI7Y/MIjSczh+yKZ9pNCfERPKxZ3JAYZApUu/W
         UFKVujKDMFMAAXoOQRaDDgOpfpJx/P4IKz4S34FDFmC9tK0XSwzqolEWlvFXdzlwwXF4
         TJNfAPZy4dyQWmhlO5oUxB0zM+KoHVhCcb2yLq4Vtya95ymLUsOQ8KhaJITBIfY2ekFQ
         hfzR2gGVUqt8+QEfHH76ovFzlD05JGCJ0hCMQn2DaVuo7/tihvzAJJLwjF7CEGHx2I4r
         1zPA==
X-Forwarded-Encrypted: i=1; AJvYcCWkSXO1Kz87DDPldw8gystCXPhzB2YJdJbrZtoCejIgdGSxvUzgrVyF+O6mW8E6BXJN+jDggvQfTw1GyXJg@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBrMsBAecElqGuZA3Vh5OiNRzqFjioSkPe4e3Yjzaa1nEEeBo
	jknWhD4IkjgtoaFdPLy+Z6ifT09BIRnyiyaSdn99iaYEsbznt5LLHDjMUkjW78ITX3s=
X-Gm-Gg: ASbGnct5X+o/tTmS5ZWcvLfjav9uUksoIxybsp/z/4ZIDM2ahUWoq8d6jOV3xD8FXTy
	mZaZZPoYmQ6xAUru2UARNNlzngTz+WJ88E/kXajMB7AK4mlE8R39Y99iRwvOe4Nhq67WZvvo1r5
	M1jXH8sOr31RW8YPktIzXZS/OQdpD+Ow8XcAybTZyKYJIr6XtBhPbhcUy1fiHshE4nKJUsfgTrh
	qjCZDrvfaG/OiQfSmFCS+cp35zGdiMxI0bPHjbCbofbvsko57VcJm8izs2AyRwZs1cu46fqRyXN
	+BYbg+D6YrpC4oEi2HBVbGzrZ22oQflDHZsdRWdHainuRJaG2MzOBghSXRIUVUzoQLIT4dkid4x
	m8txwov6UBGlQMw2aSUeWxud86rngDtI/ZJAizG6mWj4=
X-Google-Smtp-Source: AGHT+IEcXpltZaxXDWL2kp/EpCGmt9a4hNb8S7GrsZ3BBF+s258ulShYsTeMQ8O+FZoVYQ84ZMXxkQ==
X-Received: by 2002:a17:907:97d1:b0:ae0:c539:b866 with SMTP id a640c23a62f3a-ae0c539bdadmr146489166b.41.1750843127551;
        Wed, 25 Jun 2025 02:18:47 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:46 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add support for PMXR2230 PMIC
Date: Wed, 25 Jun 2025 11:18:36 +0200
Message-Id: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOy+W2gC/x3MQQqAIBBA0avErBNsQpOuEi3MppqFFgohiHdPW
 r7F/wUSRaYEc1cg0suJ79Aw9B24y4aTBO/NgBKV1ChF8pMelXh8joijFERKWaOtcbhBq55IB+f
 /uKy1fnoYKWhhAAAA
X-Change-ID: 20250620-sm7635-pmxr2230-ee55a86a8c2b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=766;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bKa5pgN2i6WIOfNTB+lQHR7lOH2QI72NCfvc981xeY0=;
 b=1UGpG1Wu5aMcFmb5bkxLYnd4bTEBVtWgll8OHBt4p//M0fVtrRD3Xak5VngDQ8WcNiI+B8Dwf
 +P4rnE9K3uMDiGKHa1GAAZddeDc/gL8/JV0P+R9g1qbMvj4xoUFLrgl
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
and the devicetree description for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
      dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
      arm64: dts: qcom: Add PMXR2230 PMIC

 .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
 3 files changed, 65 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


