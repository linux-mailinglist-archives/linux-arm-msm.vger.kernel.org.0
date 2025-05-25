Return-Path: <linux-arm-msm+bounces-59333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73130AC3572
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFF6173FD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAEE1F4C8B;
	Sun, 25 May 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR8+SLA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E28F1C84DE;
	Sun, 25 May 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748186610; cv=none; b=cBrG4HjoEIeiCDK8rGvKC7Lv/FiusNHSvV9ueu/ZywykJnSaOmrBevkVNrWrkZe8a5w1PyGRs+OeBPxRpeYDVWH+QgjLaHTFdzevbep6s1iXVglNK7PWB8wko+O1DemW+cS+Zi55rBi3bn7TO9V8nQ5QVUm58QV7g4TnbZBRKAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748186610; c=relaxed/simple;
	bh=+A1EfTD2yPQUeKTgXQy7NNsrWBAn+7aVHJdvz+bK+/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3EnH9AS5ztnfeJACFi72snmqxY12MkewILpg4I8x3qOhLXLDbc3LmcR9yYH0zkpTW81ClQTD0Q/1yef1JL3tM2+t5Qq+vH/uuKGkr3IdYtMDABoURV44bYyTVDQyUnNlxt83L6yw02Fjchxnu+9cgi2bD+449hqyOWm4ndTzuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR8+SLA/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so707041a12.2;
        Sun, 25 May 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748186608; x=1748791408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKhDBv/MIlJB2Q7iLs3SRU9JxRHCjkldHTGaujrDmE8=;
        b=XR8+SLA/mB9PACRfG895RZi55tKPmnnwLo0AegIINTcvW6u6psYrOCB6K6Ug6o8WA0
         6K7lsrDS7A/X38VK+OXV5MhFwcEhkoVisVNm6lwY4HbrE5rA38WV/8266cBUCAfPg3eT
         jXXsp59ShosNw9joaAVjRSbzKxzP/21E6VrvFdSMLujWunEzClkivxb7HyzESEY5VVAU
         oKGJbyFz1zbBuz8k0S7cFqPRJn8UHZCXGvf668dEtd2INCKZ8HGnirDDZ/bQynP6O48x
         6BxiyxLiFnhplNBoksiEwtYlrH0sCHZNw+ohEkSac+FwXuoC14td8CJmskqi3pOqz2V+
         q/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748186608; x=1748791408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKhDBv/MIlJB2Q7iLs3SRU9JxRHCjkldHTGaujrDmE8=;
        b=W6Tppc7hhjnhMWy+uZLew/uVfofgwudgOP06miMXrTlxh8OUnqGpVSxy6d67DM9wXL
         EkP1i6HgxfuZRerEWv4qBVHi6+J6ESoTfWmSqf6utFHbkWnRjqW3cFI3tewrxGsKZdER
         XkdiSNyufhih1TDhRCds7Zu84KIleCfI+mfnFgIyljssdIpvvi4XkS55OIqxUcWa8Y3a
         gSJjem4Ggy3jmm7eb5BitPHbfrng5VggahkKLLztnVWguk0ZKVFanifM/jwxbtzJhXKb
         RT/eN0XHzMotkaaITiCnmPDFfH81rHRlTbj0D7ASX/8s4/HoRJu+bq7K0jjmXpio2MrL
         rwUw==
X-Forwarded-Encrypted: i=1; AJvYcCVtG+SF8wdw/MFyjwn6net6nWqwiY7YEeazBtdbD91KjqHL5xqS/OosVAlEI1HEGM4VVIO/UjG1W1JAbzzRZQ==@vger.kernel.org, AJvYcCWmr4U8niGK4RgzuQ1qrErGKcUkTEJXPydfJPUFwtIZJ3UgKO4btzi7Ad8lOdVDAlc7/R26djbFi4Mx@vger.kernel.org, AJvYcCXvFAX4LF985HPd6VfeiPh85nebTD5/B8phXTA1pnrvXZa/A48z7RdH4+YUmu+3mQLnxpn7ERlNdi/KHCe+@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhxYHiHG5MYmo+QcKGBh617IbqeGlpWVHLNfZg7C4U2ich9Tx
	H/B7ngqoNCcW4ArJPUSIitSH6lpUqy+dkDCwHuWN8irtG9eqmT91Q7lI
X-Gm-Gg: ASbGncuqR4i7T4j+HsfUfBQtM1tNfC52WNaBYJMKUpcV5vMyXjI795tX3friw6pcplB
	XdfWzsgdgG0QeqMIRsEcdfB93580epzDHV9b4c1abIRqwqOcoRRz4PObwgzbeGQTcRHSfPmIcNC
	pVqjWPGGX8Aj7SavojzMOAHTGcyqUm4dlrQnohUVqNAGJjllUV1HhByE5XvV3/qEuRgaRYd4y/q
	2EJb2bicI2n4vlZTXkR7sjZJyI2zJNlK9dvIEZvDb3ebHdALAkS6SDqzdFu07VJvqV4q5YS2e/p
	w+uoksaFi4Yuo8jr494K8iBu8oK8PMHZiVcunrWxWTBZcCzzLA==
X-Google-Smtp-Source: AGHT+IHk1qyMSh5MYplcqsVeyYg2Oeu1Mp43zXg3vpgCb0FfFNTNxsSf7fHPXVjA2J1KSWV81uoaOQ==
X-Received: by 2002:a17:90b:1d51:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-3110f308162mr11278640a91.14.1748186608389;
        Sun, 25 May 2025 08:23:28 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-310f8faa31bsm3831654a91.19.2025.05.25.08.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:23:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8650: remove unused reg
Date: Sun, 25 May 2025 23:23:17 +0800
Message-ID: <20250525152317.1378105-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<0 0x17a30000 0 0x10000> is unused for apps_rsc.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index be8fe8705..1635e6c55 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6870,8 +6870,7 @@ apps_rsc: rsc@17a00000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x17a00000 0 0x10000>,
 			      <0 0x17a10000 0 0x10000>,
-			      <0 0x17a20000 0 0x10000>,
-			      <0 0x17a30000 0 0x10000>;
+			      <0 0x17a20000 0 0x10000>;
 			reg-names = "drv-0",
 				    "drv-1",
 				    "drv-2";
-- 
2.49.0


