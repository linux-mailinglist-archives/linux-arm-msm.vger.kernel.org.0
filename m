Return-Path: <linux-arm-msm+bounces-63127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01FAEE89D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 22:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BA9D3B4ED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 20:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FD028F51A;
	Mon, 30 Jun 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv6rFaXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106CB25B2E1;
	Mon, 30 Jun 2025 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316923; cv=none; b=Lh61NgqhiHEqyL7imqwfMlJYwxTPbet4g40uE3eMOzcKlDAMugVKj2hZeK+5a1qYVzf7G7utzFGL9EBnDItpPpm4K4CRZdWPvw/pZuQCcH/G4Zc7s4vL6tS0iZG+zr/R26dcICN2+5LYFztL7+DSX62LIWCSjJcj4KtYSP6dohY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316923; c=relaxed/simple;
	bh=k28/CznDEDaQPjTv8HMvxM3bjTFwWpeT3x3K7rXuoBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLCeUPI446JA2/2BQKKVgx2uGBaMaY8y7NsWX3zrHNSgSbfyHBsGIVe0eyLbMf/Akom0Gf42BkiaZvdhxryMWSSKSFhu7HpVzFg6BSMpxMgCG1tFymAThBitnXWKI+PNdrI+g1K1dG5+uYwhRuSrWdEN5cvC5QNRcd2V5oAvYH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv6rFaXj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3837663f8f.1;
        Mon, 30 Jun 2025 13:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751316917; x=1751921717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeCw+CxoRzVqOv9Y36LbHXdCA0RxYoqSYFikYOrnlkE=;
        b=bv6rFaXjDluh1/Q4SO1KcQlIRMg8Khe8K8N/J/DJrXCaFqWODstYak0WfubE05pmKs
         8lmtcbeAoLMc+NuikT/Vti75W/S2dSfwEeFcZTwnYj/McVG/kvJwU5dO/UMTAAJoaV5M
         k+BYESxWILRtKoVA4AQlwN3moAMf5cR4v5Nkwh59fiWu6NIwJ6mfCuNmoIDN9nAQtNu9
         hfidPI6G59cUjYAW3H+11h01+B0lAUPTCRFvVfm8quYsSu1/SODPjJv7PUofjOQcbQpw
         OBCABMri662GHP3HIm/4HTAVSGflEIBz7MB7bmjh7/VA8Kn1y129xoNNY59qet6o/txT
         MDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751316917; x=1751921717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeCw+CxoRzVqOv9Y36LbHXdCA0RxYoqSYFikYOrnlkE=;
        b=dAVN9yh4YaZN818A1s9x7+Rsb8XKIcuq0wmsaVlHfMkpVUk2001lT8L07ebTASmd6g
         OHx2ive1iQoCEN5OCm8Q0ObWrLZrs6wslqDW+pOSN2zq8UjO/4bQKot4XpFv0X2Y3DX8
         WG+a6AWEisQVKOnw1Yuu2fDsuaKsDeylJMYyPieJVybUFkt1Id8fnTgBuMX8MR8clr2m
         ukdRAJ01qgy9W7s+6EbgvqwdYd4x6/DuXoxW3LVqqgZkc1veRh/qrw+s3wLByl5Zbfvb
         9yDpAGXOlTM+/R5fDzR/wq5p1yXPxUz0bb06D739eLvPfZS0VsLny0gvjrxIwrft07uS
         UV1g==
X-Forwarded-Encrypted: i=1; AJvYcCU3gw+78BInSXchtxdUCxxr3VFPS3NSaYi64yEQv5KlWMdTMb1O6N1bv+JliS8DMKrp9F0nLp5AxeAW2DlC3w==@vger.kernel.org, AJvYcCV036zmRpOuf755chKSdcMEdzh92wEKnX+MTHmWZ7nSFSbSB/FLYP3kwNER/bx3Cwop5h/POyJLAqxP@vger.kernel.org, AJvYcCWInGKq5hHn9tFADlvxOJ6OUZVv8/0AUXdeZqrcZ3RpUP8AItfLFe9FvAZK76eK7V6MP0wI4emkTaQ1qpro@vger.kernel.org
X-Gm-Message-State: AOJu0YwgeeXlhiQn33/Q2vQ5z7fdPiUBb8um6Hbz1nScFPH+qw4ozVOj
	xSw2cr35lC3NvDl1xaZaR2/L7lPbl5y3PZ2K2+Mo0j8fMRSc3Tg+KWE=
X-Gm-Gg: ASbGncvWU+fUAe+hfU/IqaOjMtGk/3F3FT9F2jBRG22aQuy1reexewMtUmBBT6w3mtf
	I6I8uIZjIj0A3ShEY8+0vX5T/Qaa2GU3h0IXrnxupMegIUhpLJ2uRUyeHByIkzeJcyDGmWIYJZx
	4pQ5KvAtt8WVVwuQECrmk+vaOAergw7IAE1ff2YbkC24HcTT6E6ERyM3gJL3ApCBXXd2bCY1Tbd
	kmWcchlte7NYwMcjOOjx2QEASPaoedHVdZYDOztu3ck/94m57rtEs2MmiYUchaOJmqpwwO3zlhI
	JzPBVadicPoKi+VgytFOa7uU2w9giAXb7NVNZm/5CaAeO03VOraU7y6lrqkSpB6F8t2ob+RMUUL
	iuUuOWQ==
X-Google-Smtp-Source: AGHT+IGDfrX6YBnK+Q0G7I70ainKR7tRYqOW5rM9X6Ed6SYQpkl/zt+hDTTOSL3H8H84VHtTMEcv0Q==
X-Received: by 2002:a5d:4d50:0:b0:3a4:f70e:bc25 with SMTP id ffacd0b85a97d-3af1066e0f8mr817737f8f.27.1751316917012;
        Mon, 30 Jun 2025 13:55:17 -0700 (PDT)
Received: from alex-9345.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm11322814f8f.5.2025.06.30.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:55:16 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/2] X1E HBR3 fixes
Date: Mon, 30 Jun 2025 22:54:09 +0200
Message-ID: <20250630205514.14022-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears during initial series to enable HBR3 earlier this year [1]
few devices were left out, add them.

[1] https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (2):
  arm64: dts: qcom: x1-crd: Enable HBR3 on external DPs
  arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable HBR3 on
    external DPs

 arch/arm64/boot/dts/qcom/x1-crd.dtsi                        | 3 +++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 2 ++
 2 files changed, 5 insertions(+)

-- 
2.48.1


