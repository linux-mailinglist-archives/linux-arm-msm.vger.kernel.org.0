Return-Path: <linux-arm-msm+bounces-42930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039C9F8D54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D65E188D51D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB8519AA56;
	Fri, 20 Dec 2024 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAxo+6T3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2351146BF;
	Fri, 20 Dec 2024 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734680178; cv=none; b=iqgGuz4B9DJf6FIcG1Cvbz6BZCys3yf6KDlgvoNDyNdV/Bod87cEvv9q0NkQrGeUb1Wf3VWDC1vjxfQtkV4Lvc/YXzHkGQbwQ76+iyYm8OGgFyoe3F3ZdTMMZ5Ym9gDt3amvM8j13fcJ7ujeDDQEAv8SUBRg82/dKFrFC4npHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734680178; c=relaxed/simple;
	bh=av1UG6EYnUeUFstF53bS9HG+1aZgvFZseBi5D7ksjrY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RviL8bCnRt4JonGcSDndWc1senjKHd1As/W/1dmDsuY3YiKoK068pFIx81iw4S8ge/E3FHq+zfQt3KFO565aI3wzRzgLNW91nkhquJMEYp5LYJEVwxSt6pUKSSND95mYx5xk659iKoQdJaYbVxT7yPBOI8KKbw/eMd7ChGkwOWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAxo+6T3; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso2418670a12.0;
        Thu, 19 Dec 2024 23:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734680175; x=1735284975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBlb8FmjiKA5Os3dwCkEHc44h7U+PyG6rzFWcaBl76I=;
        b=BAxo+6T3OzvBjhE9hDhor+RPQ21W4ExI4RttAKdaDhveZRbopx7WlFtZqCsnsz2Mbd
         M6cMS+j32Xt2B3njNt8a9h3pQcHItz+zB0Ce5uTatoo0zBVavbU+Mr7aW3g0qg7QFwtJ
         vYykuwTw2w/z8wr/6ejm67paSorMY9ii47CFpJaMHnnI8K7aUDFefTMShPEX02dsAidZ
         fXH+lDv/F1eUWOBraAKTKd0RWIeuQAJgzrwlHGvoyzapQReKkQNXVMi+n9l6FBRJ3Agz
         X1kHoo5aoCL+Tw9mrZCoxcqSR6ZHrTmMuKtGXuowVujKAcBhjdHNgcIeVtVMCJDV+Uxg
         8g+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734680175; x=1735284975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBlb8FmjiKA5Os3dwCkEHc44h7U+PyG6rzFWcaBl76I=;
        b=iq3J1HSiSKECoxVpkGPBgntPFhY22P5rWgW1CpUUlFvAQO/BrzHsSszRS7tplgJjJm
         MpO4Dcmzlw8+BstmAQJtYx3zPPu9756zbk+vV9l0Pw5wE7Acuu6D6hqbXw8ed+2Pve4R
         zZcZC4mCEBr1l7k+kkLHbjmSNr8iNy154DcU7UZx8BgVzIasN60971aH70rl7QFz50L0
         68FMQoSbyBL90qtj7h7QZI6Ri7yMwK+1CzWaQUNnXV7th4RdCoJsva8ee3xwgRkBider
         pD+oWs6be/IHFjjDr2GqhKt9dH1JOeeOWzRdbYQS8GcINk6eJvhbaGhTKslxDX4WQPBS
         efyA==
X-Forwarded-Encrypted: i=1; AJvYcCWBIqPcmEthy7zoVzgv8Ydwur5CasTA2iKeQQV2zrX4jSmaDLEYaVbKAzU49MAoDgWF5DtBmIOSLvjd@vger.kernel.org, AJvYcCX2TvdlfyFgqWZB26I/xcJkgh7sQtFGCwah6ZfH8Qu43O7W4vcZ+hbtQwgmmIM8i1NNIsWnvtKba0fbx33U@vger.kernel.org, AJvYcCXn5hKUiY7IUWaSpbCo+G3mla7ZlFsgvh/Vk1ALJu35fpns3XymrXAZuhdFdxGCKEhXi9IiArHx@vger.kernel.org
X-Gm-Message-State: AOJu0YxSthzCBAcQDsPUsHNXMxB+50HcMblbPD/ZdtASn0aHaH1zeL+q
	a5IhVzt/X5+Wns5Kd/kSVyhzloCPaBd5n4UIXL8zC7UeTjs/qX4R
X-Gm-Gg: ASbGncu4Lx62MjbCQqwTvHazCTthrqOlXwZDfWSVOg1wjVfrAY5438Ac2ob+C7Ny2gW
	roYlV4hmdiGW6HvdqRr7NvOF/OtjomYpZjjZGA2eGp1xSUdeNtJaILoKszIEpj55JJmDgSdhL8k
	Qs5ZM2Z9F+i87Hqfb6T8IMZJaCsCEp5JOQJ5rpktE0n5HQPOujWms/92mpg8q4PP1S/jfKFFpyd
	YdTi7M/a75aNS2LRuOxSbeQLX59P5LWlJm2fDHeO971Yt5nDS6soYOZqHzELhEQA6BmTnYhZ6YY
	jOfaYUKoebGfQQ==
X-Google-Smtp-Source: AGHT+IGglwzFNIKQZHPB1WoMbecKtH4JXY7LEsVk84D5cFqpJ/qEHbnpxNsAD4GVB+w9TKMtGNhhRQ==
X-Received: by 2002:a05:6402:400b:b0:5d3:eceb:9c6c with SMTP id 4fb4d7f45d1cf-5d81de38c2fmr1331260a12.29.1734680175302;
        Thu, 19 Dec 2024 23:36:15 -0800 (PST)
Received: from T15.. (wireless-nat-94.ip4.greenlan.pl. [185.56.211.94])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a375sm1509229a12.2.2024.12.19.23.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 23:36:14 -0800 (PST)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [PATCH 0/2] IPA support on qcm2290
Date: Fri, 20 Dec 2024 08:35:38 +0100
Message-Id: <20241220073540.37631-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patches added IPA support for qcm2290.
Configuration is based on sc7180, becouse both has the same
IPA version 4.2.

Wojciech Slenska (2):
  dt-bindings: net: qcom,ipa: document qcm2290 compatible
  arm64: dts: qcom: qcm2290: Add IPA nodes

 .../devicetree/bindings/net/qcom,ipa.yaml     |  4 ++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         | 52 +++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.34.1


