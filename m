Return-Path: <linux-arm-msm+bounces-62052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEBAE3E12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4631895080
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7C623ED68;
	Mon, 23 Jun 2025 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGSwnSbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D491C8FB5;
	Mon, 23 Jun 2025 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678636; cv=none; b=Hq1rBUQaknykiDcliwS/6Q/ZD4t+xpJwSxZ8WjSZXGeBIPSRiwtdTEIVgWF2j+hRZwU6srB3UwM8HUCvXZTzTwQGZ4hbQbY0Y544iBJPQ1Rwq7M330OCxzlxwTK1opfYE9rfaaqVbDgMxZGG+GUMuG2sveIqcvZWHJA0R0wM2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678636; c=relaxed/simple;
	bh=xJ21nilBot/4fY6rxK807VjXlpNflwQgbZb766PVkJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMpdKfI+GoSaZ7ZhwMh7Fqghon6OwSLUBGRzVge6cuFTCjpckc6sV3A2fkgQ1MQmBe/Uv6fg5Y9KvvUC7AM9R0TkhViZN6oCfl+wZB4T0zsVIqOeqeYHZcamkyc9vQF+LwtpShww6FEDTba10QBC0JexgwQyWyR9pD2fkAfT8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGSwnSbx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so3791218f8f.0;
        Mon, 23 Jun 2025 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678633; x=1751283433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1JKQUGKtHDlQHcmf9kJpu3IEXIyyhBw8aQN8H1Yz00=;
        b=AGSwnSbxn3dIig7x/f9nTFWSDc0cSY7ZhYi6YOUtUfUoGfMDr93+zaLtXyr+1KpwBP
         PhUa/KocEKOko9UHB+61NoXE3Zq8zc9JCOaf4TINRHE1WQ7lwdVr3DizJ0hIhXBny/Be
         ncQP3bjTMFpxPGt/fP58WN6fS62vxu+6joKjNrwOXZnNxur/9OQ9JzKPTQm+Se2NCWcT
         6UNVzQCyOCzed0v97MVIqy6UlHmCqiuASMD9GMGS/R5QKkN423d9ys58kUcsp48xrKvj
         +9xQ2ndEjG5TnAf5LY4Tm+7y939I5NJMWXXlIew9RxG2BPa/xFJ9+c2WO6to69RfXaXl
         QuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678633; x=1751283433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1JKQUGKtHDlQHcmf9kJpu3IEXIyyhBw8aQN8H1Yz00=;
        b=uN2UdJnbTgPYVIMCnhjesfFL/ia5TdVxspwYXAC/c3Q7Gbbg7gr7nJK6TbbwiJEGrH
         FTU1aSLkmLDXBnewoUN9WpNA1ktBKWT/RpsXCOpce87Tz2orbfSc+CH0j4x6q9Gz4x2y
         J1jyKbHCuhMXClriG7SWMTJccK659lScRHmPf1DXC82QBOo844FQi+y1B0yhKywV3L6t
         TfW5VQ9Q7j/6/iI71AqC8neXCrfBnfswFQEMTvGpzssRS14zIgd0BHikPn/IWPoAQdYq
         dUs6cOrUQH3UE7LxDdDK7G1DoOC3GB41+PBm4oEVKO6a5MEkV2zyrlwt2fEGIUlO38ZQ
         VO4g==
X-Forwarded-Encrypted: i=1; AJvYcCX+IpqzXpWGVCWo7qLpG4+AWWRbRxjn2GxKcV0AIFjCqrqRus46/+Cp+mGFGaP5wnYw+P1aVVP2DRZuyFjv@vger.kernel.org, AJvYcCXg0Cjm4GmKxTeWBqIUNkuQ/GmUxxJ/9KdHNCdbObFfuT0wKdXPt+RAy+mzIEcX5R8wrEaL/Kp8WRo8@vger.kernel.org, AJvYcCXjeAiDdy3/jfuWDIuM5sc+x56UqC5VLBffTEYYG8QOu3LsNhbnlzk/MWLFJ4cujPB3CfEuLOoSqXDyIrDpaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZkXNlBC3KzDX1cWHtzjT5N4YP7AeqAGWcM13xYZ7sKzEGF+C
	fkpxSJ864itkf+9CNBvNeocVSF4CsO/GEbAWr5D8a7V2zik95rQj5W0=
X-Gm-Gg: ASbGnct1g0o3o3N54/jNwBUAzoQJ51KdZHB/hRPdy+UdCNy0d2fibz+kxZX98HiDAhs
	z3u2E6JoBz5EuKAQOgTFLKg7wjnJEv00KJzCtFIKN13EI1jn3ZzgJ1DLnI7vEt8NgodVWyT+kW/
	sgIPG6cqRsbRH9ZyU3GSG4+fdw4VihpXS+0k/6vsqL3/H/BPY/8itwrwegj910/EgKxqVHrZmIJ
	H6kGybEgwfrMt+hWrRp/8+k6OckexJeBQ3+2OH6Sf/SyDB/tW+Bt2r7vtvp7b+RklOlrJTLQ4zp
	TVkN6yaAuZ5zsolLtWbATlL1mLBAA7UYkMs3jx5XuCJU0JoxDqJ/m6j98pp9lEsbtJV/ji78tet
	LAKnFNFaE9PiTfVNrm8vFxX+eO2PI2w==
X-Google-Smtp-Source: AGHT+IE2RTGSFjJk4MFLsZPJVqj2yyUhB6opmzSaC3+yQjEpdfp2SrS3HcTsJ7iKvNkAhBmjnBo1uw==
X-Received: by 2002:a05:6000:40c9:b0:3a4:f439:e715 with SMTP id ffacd0b85a97d-3a6d12bb71bmr8920279f8f.9.1750678632528;
        Mon, 23 Jun 2025 04:37:12 -0700 (PDT)
Received: from alex-x1.. (mob-194-230-148-213.cgn.sunrise.net. [194.230.148.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm9092625f8f.29.2025.06.23.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:37:12 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/2] Asus Zenbook A14 improvements
Date: Mon, 23 Jun 2025 13:36:12 +0200
Message-ID: <20250623113709.21184-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First round of improvements for Asus Zenbook A14 which has just landed
to linux-next.

* First patch updates DTs from v5 to v7 that was mailed earlier. Fixes
  GPU enable and mistake in firmware path for Purwa/X1P
* Second patch adds audio support. Audioreach topology and Alsa UCM
  configs were already merged [1],[2].

[1] https://github.com/linux-msm/audioreach-topology/commit/952d16b16c4ee23578c001c97a31540c61315a0c
[2] https://github.com/alsa-project/alsa-ucm-conf/commit/87a48b90213106f6e310dd611590e6a608ae6596

---

Change in v2:
* Change order of audio nodes to be alphabetic
* Pick Konrad's R-b
Link to v1: https://lore.kernel.org/all/20250622134301.10403-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (2):
  arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
  arm64: dts: qcom: x1-asus-zenbook: support sound

 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 198 +++++++++++++++++-
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   4 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |   6 +-
 3 files changed, 203 insertions(+), 5 deletions(-)

-- 
2.45.2


