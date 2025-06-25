Return-Path: <linux-arm-msm+bounces-62346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CBDAE7C18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2BC5A57FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C565929B8F0;
	Wed, 25 Jun 2025 09:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CandxWgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4450C29B8C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842817; cv=none; b=ru2jTBHHpSr1KFIQrV3VZ9oUrjX3yiK3LYMYI29hB7PzFlOY5MxgiNcBV7dy70/ZSvCPG5lsRuXb9qmgwDUZQ+nE8cduE3gRdxY5fX7PAd6W9RmZ3I6cwvLOMwnSOlZiyizCofpmPFYFgSJeazw0ARee+2+vIx+ztT0RO8rVdFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842817; c=relaxed/simple;
	bh=4sR5fPpma/GrOJli/eLiVTPPr/9TVkwqVfopkbkw2Yg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CW+v+Svt2lpGDXc5GkLHUXXiGEgWujFY+6i6pKO8u+aSibWuNbRGsWsumAeq2cZTCn3XDrxSUuQHJrz3onv5tNDTs5K+bbtsuHpdVZQ150gyW4uEREp9YzQjS48nOFVCEtXrtUoonjEPY/WfW/9U0zdC3cnzS72clFFVmUo2vRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CandxWgS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-addda47ebeaso280712566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842814; x=1751447614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ks2KgKPEFickNI0g8cLhP0+7PkHVzo+kxkQrWM9s9Jg=;
        b=CandxWgSEa4zslHSRGyTO6dsjXvFLFADwNBqczzvZvsMIgh29Buk46VcZDX8xeg0Ve
         SNE3FQcpEUor9G3ujm8oSMA/zk0ior8Gxc7scTMWmFh0J2TUp3rKu2vOzkVehQEwuOef
         9k/V43W9L/DbiPEMV4PRyKjJKXspK0OGtAiAWaXJ7PpZWga9vUVSi8mQN/hWAhyOMQuH
         QFBmHRXNiJ6LotIPeHhnp2BNHTbmX3WIAGYxsCTT3AAYIzrY+SPez1BcwDATg13wQN7o
         dnrlZvgpYqzOEyx3Oj3MbdHTkKDdC5+OcGOFSjDnN0bKO7sDqq6zuRJsRgn3nQ3S59xU
         Favw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842814; x=1751447614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ks2KgKPEFickNI0g8cLhP0+7PkHVzo+kxkQrWM9s9Jg=;
        b=BELekeIlTW/jt34c59ACX17HQvdJ0gDkHAumM+IfKAErlFXk1u6i7LKAgHan0Fyjv+
         wnSKvfFBB//XgyiU6dopPVKGZJY+U4n2Lec6CWxzrJs9QawgkK1bgO6GuBbvlEeG6FZE
         9+YGBIT/pMnEeaqjo89Lkz1y8uPlRDzVYRXlgw+CojZM8STP/nyN6BLM+S/nCAp6zzcF
         BPcVneYf4aShTK1oh1myKa9ky+KWD7p42yCj+OFfHaa9zqDBqQVybzv/t/WC497Nhtxa
         fXW4UKOBBORSVax6pA+tQ0aRFhotaTh023g+j68KrzI2mvhXiXeo7j7PKuF6wDnIYZTX
         c98A==
X-Forwarded-Encrypted: i=1; AJvYcCXEUs59ja4a+GIiO7w8oFP9T/Mlv3wKVSgud7zNUhIVzHc5No5fEnij4443gL1J5/EfH+IELNDTadnqkL5I@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWay1lT0tPget0HmWnIOH5JovBcQGm95JHbRuidbtd+4FrzhS
	HygCyTmG8enPT6MxOE9WivBsdEkkm+9rpyVDL6pDkayNhxGAnkdUQr9F+UNu29QQFVQ=
X-Gm-Gg: ASbGncsqSGl3mArwOEQY2DK2cTtPLt4TfRBlGhqQTlqh4fR8uJ+Hs471NaHgY2GGgHq
	mQBcdDu1kAgg3yhGjDwVHCYqozmX1GqY0reqjJSpboz3qMDkfwjLRT0dI2mFCJSrrJSAKNobrjD
	Xe7h7l0mJw679Ds4DVaGMzNehliabHL+H//BJZSWevq1CLhRDUYaBhyGkLvBXcSibZkkY3XIB7I
	6gnuZ+vIcwJJyqlyCZ/68yd7cQGEpQ4OlmeY4FtwjIMRTHDNKf0JZLj2eqF0S6ntUzfnWLXlWyG
	/rpcMrAym21XLyZjYhkyFrz4Wbb6Qzr6TF7tbJo1pttWxvFZP2Sby5wzySdv6DOky5L1pCJL4BH
	JU4o3RMF4Fsi7yaEj870NMQ2CcwupwFeFAji41wQppa0=
X-Google-Smtp-Source: AGHT+IG3W5RmwW0KXa53tzqdC7aGtVxDcyIrcDLyCjEyycANLI9U+Z+hJ/jXQi64INJPHjABBmW7Xw==
X-Received: by 2002:a17:907:7289:b0:ae0:35fb:5c83 with SMTP id a640c23a62f3a-ae0be9dc2c3mr227506966b.28.1750842813609;
        Wed, 25 Jun 2025 02:13:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm1002786366b.128.2025.06.25.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add SM7635 RPMHPD power domains
Date: Wed, 25 Jun 2025 11:13:22 +0200
Message-Id: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK9W2gC/x3MQQqAIBBA0avIrBPM0KCrRItyppyFJgoRiHdPW
 r7F/xUKZaYCi6iQ6eHCd+wYBwHO7/EiydgNWmmjrFayhNlORuYUfEKJ7jDolLWONPQmZTr5/X/
 r1toHeTYSf18AAAA=
X-Change-ID: 20250620-sm7635-rpmhpd-dcb5dc066ce2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842812; l=624;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4sR5fPpma/GrOJli/eLiVTPPr/9TVkwqVfopkbkw2Yg=;
 b=8C1xOSR+fZgfOr54HLuwAQbc2nKk/SYaba1UqxJmSlY8b+huwWPWF6bTrhmee79uk+3mUFy71
 0mNZhETK1znDIZB43YvACA7IC+galriMioJlCwd9mFhd0P0OjvZYVvO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the rpmhpd power domains in the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: power: qcom,rpmpd: document the SM7635 RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add SM7635 power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


