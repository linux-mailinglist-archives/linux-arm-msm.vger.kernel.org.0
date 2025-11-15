Return-Path: <linux-arm-msm+bounces-81939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97397C60500
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A2EE4E32AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 12:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB30F2877D6;
	Sat, 15 Nov 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhpL0Eht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302CB29D27E
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763209627; cv=none; b=aSe3TAgmU8aKY84nBzSpDOqgpniBZ86mM8tW+vwlcQE8ZkMBzTiY/ZfFt/ra3SvjmwkA+iIhyEj3GLrLfi5G1nhHtHf8x2le9HB8N4qsVEU/+Zh+wZTbZ+utkXC2UMPq2FayUcRVkKTShzumPZocwWbNDtwgfrsV/rGUi3yKFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763209627; c=relaxed/simple;
	bh=RIIDYqK8+WQ2PSdCQKPAfHbq0AZ6EW+ywrdKhnPSYu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=scpZ1sCx0ti1/GQyGklpwgRtBxzT5SwvlhW6TJ8dkZ6co2JnB8RMJJTVujUn+Cji9dgY+i/f/cvgaazF3L8dabQg3ok9N99tsyAfFz4qflU1o8t/R+vYiA5xT4KwILQgFmQNnaGzesL3nsSN20PrsRcW4ctfuAHjQ6ue/8Mv+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhpL0Eht; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so4702415a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 04:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763209623; x=1763814423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS0z7bXN9ZDKGbg8dZUcy90RcvM3+V0Du84RVPjWaXY=;
        b=JhpL0Ehtmu0sWhAx2GcfE4VmJWdiWER+gFWo0q06CC0GZUUfd0j1lCVu0rOy/jvbOI
         uX0oMRoEr2QRfDwEagAJku5I5pBqVw63ZB1z3CxaZMncJHe05sPJrUQBONrt2iCIhR9K
         F36tm4n64+jaeXooE+VudeFT7eVFrr62JF6tEFugEcCkd5XpC1DKxhBzVah0gujNlXWr
         IDztwBAOLY6vTk/WnteGr0uD+zQE4Rl/EsciIGkVmCqTIqbjhSWGEUEkt69/ipIq4c8L
         tDp7/hm3LpbapwfxL48GoUZkXP0UVyxCfa1ii2uq0sqaaVmzdm6rK5ZBsDiXsiDfS0Nd
         WPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763209623; x=1763814423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS0z7bXN9ZDKGbg8dZUcy90RcvM3+V0Du84RVPjWaXY=;
        b=uwQji4lFDBe9Nhjapi6QJ3p9Uu5dTqCn6/an1zFPMN2wXRa2uG1AGdgLG9YdO5HiRY
         qQbTbOFJvui6x3yT3eGhwTvgF8+3yXuSDjBBEnVC2NWcGQmrHqYadwkFQFfai5CsC7K2
         IYX+Ati0cVh24cA7aYSwW5pQ22S6sQnDVcuqUN3s5MhKi0keckftWrye2EipPi10h2QS
         xhwnF0TWVk7NLVdI0NFuEW6Anym8J8y/EhoabOJo2TzzpMpQcdep74Ivo96n+dw7FI8p
         sVR2GuJZK8F4B5jmgH6evpwJVkKQQmHq8YGpBrm+oIKPSPJj1n/WIWx4HkvcQykAmtAM
         sD6Q==
X-Gm-Message-State: AOJu0YwKd2SODpy5QVOUiAgd2BBizr3aOerNFQGvvPP3Td+NNjJ6IhOA
	uG5nActHjnj8GUui8p4blSJf4vwJy2YMk2D4hAX9V9wWxp1Khb8kmfgk
X-Gm-Gg: ASbGncsQUzjoXJj7MZtaOeHujzQdfcsVVm9FSR4wtDgSWiB3WCWSKdzw9FtZvH6Pnxt
	8O2FAMDejZG6yU+VWP4LfQqyHG/0hL55NPzq96EmLPdpe9eBWAzeEx69eQEC4Iztn9Td19sv6K1
	KbqYcRbSIjJ5gHrlsZcQBpmih886+aaFmLtkgfiReGXkOEBtMkelxWN/8NIp3lBYWIK5Q73aCrz
	ammLjFNF+V3pKD4uqg5NJp67lBR8PO+vWFMYyaNbzG0pDiwgNehK0eEGvTiJzNzOguzONol3lxC
	EgXxKWYUrFJu3XRTINxJPXHbQFrpf5xAAGB+qV7S5ynUWI6I9xq+auA4BANTU0dhaimdlr4+4ya
	h8IDykeAx8l0hEDmngsL8lXRvS/X2JecLokJC77NeuzwSTNMjqbsMuN3Yy0rJEzP7cndMBIBS6H
	cTxi+Qi3hmYJPKA8Y=
X-Google-Smtp-Source: AGHT+IFhKe01VUFrV1x/fkEaUyx4/tZpLUueuWrAr7SYKB/mI4Fh78YzUXB9BPXeVLqjv6LBEqEJGg==
X-Received: by 2002:a05:6402:34d5:b0:643:18db:1d82 with SMTP id 4fb4d7f45d1cf-64350e2159emr5594925a12.11.1763209623102;
        Sat, 15 Nov 2025 04:27:03 -0800 (PST)
Received: from [192.168.0.188] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm5627042a12.29.2025.11.15.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:27:01 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] Asus ZenFone 2 Laser/Selfie includes a battery
 measured by voltage mode BMS and a simple GPIO hall effect sensor. The
 following commits include support for these components.
Date: Sat, 15 Nov 2025 14:26:42 +0200
Message-Id: <20251115-battery-hall-v1-0-1586283d17c7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJxGGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NT3aTEkpLUokrdjMScHF1jg9Qk87SkpEQzo2QloJaCotS0zAqwcdG
 xtbUARXdB0F4AAAA=
X-Change-ID: 20251115-battery-hall-30eb7fbba62c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251115-battery-hall-30eb7fbba62c

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


