Return-Path: <linux-arm-msm+bounces-51378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF74A60B36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CCB319C42E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C611C84B4;
	Fri, 14 Mar 2025 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ABVU3d7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85A1C84C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940490; cv=none; b=YOY1DP20F/roWekNvQKdudzyCkmUeLmHZGUd+FnKCA+ymfwzCuaBIsVZf9cE6EbCkBmcqf3o1S5M8nYhRrK3uVjlb741LvO6LRqm/34AA6mf6+zIbLHwKoAPSzA/eBZ+NV8ATv/j1EfRmAXm28PLtcB31NXzbejoxErAWHCINq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940490; c=relaxed/simple;
	bh=mppd4LmheDALrusB9T4PJj9qjgXGvLPRSBiVOVkjTwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n0ouqw2KN/LqVF5ywUdimYzRli+ftIQVDRCPOy4h2LVMU46x2+0f0I/aivUcAApaibsIGkijCpJdB6UQmvMRcS5h1v/+tjUn9H4KbRlwWauS8lxFUxSIZG/WMQ/Xti9FvJkwHdq+udgAvsBqYh2I5Uqlv5zWnCRbpb8OHtR8SZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ABVU3d7P; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so3042451a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741940487; x=1742545287; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+NVtuVU2ISJtStqxHLi/aMeg5kRvIk3MtAqB/jXcng=;
        b=ABVU3d7P8JpvvrdxbtwdJZqVgs18QiWje9f/moFUNBBMp8qXej9XFyb+bJIfhWcRuV
         Ni4LyhVUYt6O062qf3Wa+d3iDLh3AAsGhBSb9hEJHi8GtykfW2MzuRREe3t86+PzwrSF
         sBdQl+5p/E/owPbn9ds+F8JMpbqS0vG1C4SzfB/ppDB0+wqro8hJ1I6PuFYG7Ib2DLWB
         xbuT4w4C5XXhobcT4jTpNaZ/MdCa6cf1XgK/V1gxCHKddIldcJU2tyFFywKR21PLADyG
         U72WgOxx8q7cziSLU3R/LL/pQmf6H36fUy67Ajw9m7nA8yUwHGgbnh+t78AuY8S/wEAi
         PeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940487; x=1742545287;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+NVtuVU2ISJtStqxHLi/aMeg5kRvIk3MtAqB/jXcng=;
        b=tBx8QbkOvFQrCBKDxu7fqZVeGCZNtZn192Gcq/pH1sVXen7U4ynOzQQf3BwDGIcZv/
         Myhlvo3LdSQXanFvjkhnbofKNs64QRdsWYj1a8T9y0jPEdo1RpKmH1OfNiAEAVtNUEjj
         5gDUqP9tojpeWt3uOLQwaPsODDDjBwBaqhw781yAY+KVG7adUb5oyPzE8a9+O+9YlJck
         9znLA+cO8xp/b9HTh/7sK/YyLisRz39hEaAfxjdx+Yjd3SzY7YfV7Xzu+93JnGvl69GI
         XBJggwA3YfnvENOWV/DNwlsBRmc+MTUO+nO+dts99JJg/jSsiLtqeZEGuU1yZNtJgP6X
         mD1w==
X-Forwarded-Encrypted: i=1; AJvYcCVNKElD1mNXO7Kjk2gNHRI/YlC91166TU2n62uYU0vZoGUlQkrnzvp0bTXp7Z8ZllI4x3WNxuwee8wV3jnD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9//6ZN61MNfeI2VuDe+icudCYmMfGsgGhcNiwBT/fmjQGBcs1
	P0DFsH8NcsYmTtKQlchE3XINTHjMmDrZQXBSYcUG1AWyu3tJjOnVy5MYkQLYt6o=
X-Gm-Gg: ASbGncvZCIBq9FIiw0QvY9NXOBQlKD1+/+TzU4H0CO1BezpKPSJNjqDvTKDvOuCfevw
	MNmdUrcHdbcVl2X9DtoyiJoHZx5KAQXeDCcsC65nWpFR5Qr4naBgepPIedl5bEy9Ea+s1a5cxAc
	p8Na47ZnIiLVhdj5N3IRjDrr12/dVVhC82ZDvuJpB/VZIejJp0W/kMWgE2lxdVgC9cIznPdrH88
	akvPsSkP7+wt5KgZc2yOa3RLIL0S/N2D0qM0j171EbQttbKOQm2krE9EEjx0Tor/zczzNQWy0KI
	BQg4q6jV8yz5q9v12hJrXAxdhPKc14D8NKcCy727rFfvIriHmT9zDFM7C8rT0QyKldhjGsIH0Vi
	BX0bDeRokhvRRFItmig==
X-Google-Smtp-Source: AGHT+IE6U7GmQ58fz7zI6ECFfeW+9X4eiOa30l8vgfN5EOFVNew13LY0sJrmHqQgR2MvZBZ6zRu3qg==
X-Received: by 2002:a05:6402:1d53:b0:5e6:6407:3b23 with SMTP id 4fb4d7f45d1cf-5e8a0422028mr1472473a12.21.1741940486720;
        Fri, 14 Mar 2025 01:21:26 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad38fesm1643387a12.57.2025.03.14.01.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:21:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 09:21:16 +0100
Subject: [PATCH] arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAPvm02cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3eJcCzNTA93kglIj3eKc1NQCXQNTi+SkVGMLkzTzVCWgvoKi1LT
 MCrCZ0bG1tQABYppDYwAAAA==
X-Change-ID: 20250314-sm8650-cpu2-sleep-058cbe384f7e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

On SM8650 the CPUs 0-1 are "silver" (Cortex-A520), CPU 2-6 are "gold"
(Cortex-A720) and CPU 7 is "gold-plus" (Cortex-X4).

So reference the correct "gold" idle-state for CPU core 2.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 719ad437756a499cee4170abccc83f2047f0f747..5844d7d0d0e6b31c08de3391f5cae3f8d823b2cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1449,7 +1449,7 @@ cpu_pd1: power-domain-cpu1 {
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>;
+			domain-idle-states = <&gold_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {

---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250314-sm8650-cpu2-sleep-058cbe384f7e

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


