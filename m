Return-Path: <linux-arm-msm+bounces-75568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5CBABD8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010633C7FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EEB24166C;
	Tue, 30 Sep 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SbtzrdM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DFF1DD0EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217855; cv=none; b=YsGtIyO37ND5jn7JDMkGnv67PvNMTh+U4aCC+72DF0d+4c2H68Q4WcfQLLkaNTApAkUSGDV74p/olvgrS4OKr+9q3h2XnH1GKsLwwnGJvfBh+sqniJk0AFSJIDGTprSrnetRbLukL33PVDrhM13asmS+xKBWXapk1XminWzfCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217855; c=relaxed/simple;
	bh=ENGheAYnNW3g5COpjG03gMGNXlOZ2EcAFRzlHVSA5ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ikUwavbVvAY6xZ0HaJe2Mkf6qptv6QYg7oAaLRkFGH+JzRe+6GHHlNU+FWW/ZigpvRb1WT0LCwmUyHUSG/EF8Pu2XBMKRa3LlmwIsYUoK0SikILVwSiPhDAFhwNaEYfY95+FRe9hsph/YtVI23j94gR2trdM+gfBi4CgLMnnRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SbtzrdM6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so11177493a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759217852; x=1759822652; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iApKO+F77Gmy+nvt9OQEdz8JuAQZPIJ8wB7y7Z7dgA=;
        b=SbtzrdM6fadj02L8XwAIEAp0QjVDZw8ef9lOJrgovoXOie9eIB8/j7TRtnhsDPkqZs
         pGrqUeY5dX8X2rf3edVDV5tR0k9hO0u+3wNmzF/Cm8xXvHECc5kCInRmuN6iy1NUswfy
         CpUrXNS4cYGsq8D/JBBbDKy8xZv3ujAdYoXSbvZxPeQTIOINyIQgvlrAqyTq0QE/3N3G
         qiI0RVmKrJgz0kafr1YVBF5CDYyyjTwWcZLCW12xELbbUDGTGskGa3Wy9poLCgmSj/FB
         h+kJtv3POt2SusRmn9qSZTDkcb2Ij8/Zw+DsRl3djiFaZ5W2wiaCEiimFkNVhZsdGOeu
         owYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217852; x=1759822652;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iApKO+F77Gmy+nvt9OQEdz8JuAQZPIJ8wB7y7Z7dgA=;
        b=DAwuUNwUQeSWXmrUknCPRmiJli141xzP0LY4H2JNNfV8EtMagKs5NpUWi8fNX0cceb
         G0dYtRedXGuPh+wUrYoueO3SVzlBAVjnjC4YVaQmCDfeKmR0W10YJmmRnXAAdkaiq/Mq
         te80ArWu6NHRkdT91cDTwxE3Z5KbOpW0q8vE5bfeAeOo76Y4G9clbfAW/JLZ34iq8CtF
         QTfcuTKC3xpWnstwsKJ9tWka8xPgpZCWST1f9Ft4iN/eUv0F6PmU/64ok8wGeJoRdakE
         +q3MLUTZoGCqmftSdimdNOXZ5HBa04ox7+n3hLYJ3/r2pEIUwA0Cq6XnQ9pBTjuPRnC7
         IDsA==
X-Forwarded-Encrypted: i=1; AJvYcCVof/lfDAIo48ospeer93NAzCNSJZQFvAD4JYlFTmF3CDOnJ96d9DR/1fsxbnrPko0JoG0Q784xSyD3MXWE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5wQ9mSJDGHP3nm51eqNhNuXzhW3pBeqWNXDajffvc43pXSkZ
	HGeMdVXBoBqD0b9hoMACekKhhkcg42e22AaAMcq/ZkMGjKcp0x1GSmDGIXilfjQt5TE=
X-Gm-Gg: ASbGncszGHFyIXD4ui9MYQLSJPiMYwM1B0CIFCm2j/4tZKSCGKwREM92ofalPpJJcUo
	jJZaRrjpRIBqMj09I1T91A5Djkuc1LWmStdks8WwzSV64H3cv2XUvYX9LptRIzYKIQQfFm+9wwR
	K6WA3Dde8uzpjyQYOd0kERehSax81d8DTSqUHPGxtBcN/o5C/c8nk9Vo/iS56wO1jfTdf3j75iY
	5EEOORv5XQ1mxbgDhw/uGWPa9A10ZBmXLGs6aCYYqflkh8EAJIUykeOJzj8VKyvQR4t/1A9WGrQ
	kQsmzoXcluu3SzhU48OgU/3e4hIULe9rTBS/OfST5SRduOP3o1qnd8Z0MNNUMipbh0nI1neHE/C
	G3m635pV7vKDFL0iMcSyPZxGjcC8mZ9WS+lVUW4S8cbEGNDBEJZrlpP2On8uYYPkhC4zDuJxSkG
	a7AC9mLsUP2jqZIxyiPQ==
X-Google-Smtp-Source: AGHT+IG9j4qCfb+pWcKxOWPLNAWJqVlW5gBDMAQjRf28CzIk+BsQWovz6lYnrw00odazuAg1RoDJ+A==
X-Received: by 2002:a17:907:3c8c:b0:b09:c230:12dc with SMTP id a640c23a62f3a-b34b7209e46mr2054121866b.8.1759217851585;
        Tue, 30 Sep 2025 00:37:31 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1084376866b.24.2025.09.30.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:37:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 09:37:22 +0200
Subject: [PATCH RFT] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sm8250-mdss-reset-v1-1-a64522d91f12@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALGI22gC/x2MSQqAMAwAvyI5G4gt4vIAHyDexIPYqDm40IgIx
 b9bvM0cZgIoe2GFOgng+RaVY4+SpQlM67gvjOKigyGTU2UJdSsj4eZU0bPyhZaKyXJlMkcWYnd
 6nuX5nz20TQfD+36Jp6K+aAAAAA==
X-Change-ID: 20250930-sm8250-mdss-reset-307c3e921d03
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759217851; l=1086;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ENGheAYnNW3g5COpjG03gMGNXlOZ2EcAFRzlHVSA5ng=;
 b=J1uq8r0DaAiTXMXmOmZSb+gbE0/AQqQXkde/No4Im5tvKyezccWDZwJHxiAQnh5r8fiI9uUYS
 R9BxHaVroVOCzWJst1RVXSv5OAglNbGU9CNARiExyL0gF6lWU3pNxXB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration. Add a reference to the relevant reset.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Not tested on a device, but should be necessary on v6.17 kernel.
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index b30aea8b05409094837ad494389d7c22fa1ba7dd..9bcb2c4c34388f343fb93083977b8d2e9a724bb3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4687,6 +4687,8 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x820 0x402>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			status = "disabled";
 
 			#address-cells = <2>;

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250930-sm8250-mdss-reset-307c3e921d03

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


