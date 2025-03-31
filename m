Return-Path: <linux-arm-msm+bounces-52857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A3A7601C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDF61168347
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 07:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA831ADC7E;
	Mon, 31 Mar 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGOHlNuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C814A35;
	Mon, 31 Mar 2025 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406472; cv=none; b=pDESc1KdUPxhIveY7Y++4gWFjW9b9lqGEsETEoUjzyiOM/5DPXstRTZ3YENPSB0hlZDHETuAv3j55dReygkZ51o3GVJY8orJn/e9l1X94cYqPf3uxPR9VTxeQP7od/WQ4h2FOc2ZsNGV0xoPKaJHE3Ohs9/y+bkN85t5uh0Kelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406472; c=relaxed/simple;
	bh=Xp6rgIULGMK6ODHcRCYxrh/7fOLdQFf6tsWDjILa068=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qS9c+RTBnLouViwRdVNZJOP0v0BGokiG8v2wO8p3jBRnLwos+as4hJCDHCwIdf4Gu5Oy+SKCrVfwcJ/KPJCAXId0YmMzpmXn7T3Q1sF3nXSy8gDio4gM/8DeIiXZ4SNEpUg5bsY0A2gYYwoUVeO8MnzIxC3TkzmpoDgTxkLgxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGOHlNuP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so25472285e9.0;
        Mon, 31 Mar 2025 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743406470; x=1744011270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUxp3S2dqfaEV5aPQPhb7Pjd2GvGLFIPTzA3dPHuiWE=;
        b=nGOHlNuP9MrGJf58i/a86VztAIHEZNiXqemaK5oycySLNdM2oq7e1zNLsB4QA+VV2W
         tO1zMoygE2LNsD/FKTeDxV9aEsuM34QJT2Ko38KpS43YgakvlAAiTzehwMWgt7Negmmf
         yJ814dgwqw1b1/WeYALtaVisprhu5LxS0crcKwb+8DYoulY+/nRSeWoDsdmMhz8H8U1i
         9p6h99Ck5T/JTJ7qvD40mkfGxHXS0olt5X1HDEP8OTs6614tjqGOd/JCcaHEw78UGthH
         zCB/+LG0+UJH45S5a00wfAwdrDd13cDhdU9Jx/6RN3ySieVVZYTw581ALETfb6EXfUWk
         BSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406470; x=1744011270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUxp3S2dqfaEV5aPQPhb7Pjd2GvGLFIPTzA3dPHuiWE=;
        b=QMIXwfJ1HakvAqHhPIG53sjLan022L15s+D258Yu7o65pcVNaF+X2Uo9nSDz2S2C5W
         r3kdFPa8HayGMsG3bswsCU7HM6YsV9XvnDE5UNvam0yeK0oZS+dgbUg4vxLTrFV1qeUl
         Y1sfiCl+sVzoEecgE6yWs3zs0ty5jxXmQxrY1hoUNozWX0mtZctg4JPuL2EnBvLOirUy
         vtpFXxUt7HDopnORUHooVnqGy8bBylPc6cPJNv43X+vBBUbyS4tflvKY5JNcXLyWXc/E
         DXjo9ka8o4ZDksFSJwA/+PmxuwL9jej8oe35qlCKH1TrVuCSlKEtfZdaT2J++RW16xkm
         gU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxlbYl0zCiNCWxZVKb2NdnNvlp7OzD9Ssw9aqTdAvLQuA0VaprW8AdgX3KjsBJKBc0y4CdGBj58ne/@vger.kernel.org, AJvYcCVf2L6GGHkNb159mspe6Ih+K1VfO2xxacerTeHqFqvI1D6rsXo4QwZaIjIZ5+iKADskyiSaDKHEhTg36R7T5w==@vger.kernel.org, AJvYcCVfLVijSLAEp+iG1flhHunu9VMXCDX6JLx+knyMD4JetN3G/vR2ETrtx+VMzVQHnQIciTsy8zDzLFq6LVuE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvj/tLhipagc5OUc9lcQjfTRL0hYfv7j8kxckWkgh5je9/dP7G
	8PRrBntAxtjOQ8oiZkZnB5vsFN1j2AmHw2siShU1zF5btY9v1V4=
X-Gm-Gg: ASbGncs33Ywt/OI5fQtbQyGzrxWNYo++O7GFGOMVX0t3Kn9Xn4L8ERNzci75hDHctgf
	nXXKRo08eq2X8SRa98xVX2xBPNtNZMIbhFwozW1995CY6Ktu3AgR4auMd5XKwDrh4whT7TDXDM/
	vMqsc586gGi5gQy5whwEftrmMYfptu9ahv8fsnhFqltvDt2G0dYcA8TcIne3ZZRniqi2R2dBd1N
	Y1eDEN7bpf7/xyMFBfCU+7lexB3wDyvMKsyJfrDIs+qewby+mfHUOo/Tp0rdt7ODeG4sFQq72kT
	nCjCGQWcvw6GmNOESabiEyoj+VIRhkKJ7qVkYBGrkHn30gTUZ8cIuFTs9F4fA21hbf+jG4FPaYh
	gH2KtxBtKFQJm
X-Google-Smtp-Source: AGHT+IE2fbHYxPjaH6uwrsY8Z0TXyjZuqPt9P3oR1B6GfKL25s/cfOBFZpUhBtQu27JOhS+7h/7qUg==
X-Received: by 2002:a05:600c:3d8e:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43db6228293mr76135775e9.10.1743406469160;
        Mon, 31 Mar 2025 00:34:29 -0700 (PDT)
Received: from alex-x1e.. (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba4b4fsm115704195e9.1.2025.03.31.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:34:28 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 0/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
Date: Mon, 31 Mar 2025 08:33:46 +0100
Message-ID: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bluetooth to mentioned device.

Changes to V1:
* Fixed commit message
* Picked Dmitry's R-by
* Link to v1: https://lore.kernel.org/all/20250330212729.3062485-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (1):
  arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

-- 
2.45.2


