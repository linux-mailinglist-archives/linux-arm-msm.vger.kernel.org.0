Return-Path: <linux-arm-msm+bounces-75594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C6BBAD1F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5919F4A5367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155AB306B21;
	Tue, 30 Sep 2025 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rXvPUwYH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C7830496A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240645; cv=none; b=E0ErXoYnU/1B4n6sxTImJZv32dTCpcvB2bU54uIYMplHANS3q6zbKlvv99x80veN8Hh9voBTYZHQvqqNfCb1B7MRBbMsXYggUgYwH4OlmXM4zYBLVEOx3y3B/necbA3ga5bKq9Zq9xPCOPZ/36IPpA6fKJm8xKzNZZE+cfTp4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240645; c=relaxed/simple;
	bh=Qe0f2DSIOI6REPXvZsw6mfNG/f7zF2Kc4oN276oEtsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzmEwFqt8YiquZVSwf/GcWmjErxdOt32tjMhVGLRjxWK4Ik7jntsxA6Feij2zWqdlNm/eu3AaSlCcFF5CZS1Z5fGPE5tobXmesqgHBoNDu9CiNrw0LQOgJyz7nMp1+DSdKIM0mc/qsZBrJHIJ2YPhjM6DHFN2NZ2ahIpSBdUmDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rXvPUwYH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3e9d633b78so550375766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240640; x=1759845440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwEwaOkD7UmGdIyIsYNJIdPeNIJYu5qlxwHSoyboRho=;
        b=rXvPUwYH4aCKhfbpz10HjbPxrKZxEU1ILAlElKLVzULtot1BBF1FaPhS6it64jbQHX
         c9becfh5Xej7rslZBnlbG6Vufu0oHKYU0gz6UySDdC6WgXUw4Nnzj+AqpDPXjmykY2rl
         WctxkycmiUamKZJ8POVjJVmLP2PxZEKz2r6NNkiRpn4/xx11doj9tPR43lpeIXFxlJJr
         Ym13spEAgPWkSoFR4vnVHLxRRAi7yZyrVMOHIVQXP7kBcCbwf6PtE25fs6yhnfR4ZeRN
         xuwtJq625e5dKzCN4kye5JS1o2DWF/SMLPfu3WAAScFIAQgcvy3bi3Ee/PubcaJRfWMv
         ab7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240640; x=1759845440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwEwaOkD7UmGdIyIsYNJIdPeNIJYu5qlxwHSoyboRho=;
        b=uyCp9O+RaWvVDTrkKTX18K9LjltCnwEYnAxJQBi4wh6wSCqmG/fWEehRWJVb9SyZPw
         nHAw4iV6Kew71rX4OFGq2gDgfSALrd5aUviKLt+NMxQLXEz67fYE/FP864ULQJZ5soiU
         MrQIYMV6WZpU20JfrZS0NepVcptwvCd0x2D5xWXjSGy577NCg7lcInSVXO/wsi1LLnZ2
         Q6beS9GrwtOqMmdjqVr9XATete8rfB8mNkasSjz3aljQwxAVyuFujwpLGO+yjpuKfryJ
         fQ4DJfqXD//clXpPzn57LiTaZ5KTlgWHUBPr1oxi89wE8K9NSTInCEMRI2kNGyPtM1N8
         zvdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHOCwoELPYa+vS2gYwK7E4vbY1qeUQMKsNTMOX4j3Pk7XY0K6gKJqt3RynsSiLyNSU7KJXESogEJGCWV2G@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYKXb50GvyeCEHhzYg1SfgzuJdr8rQvUO88SntTgDj2wnLw2n
	/F0qvhogkoWohafS6GImNRCMQITQphpBMqCsLv9EaX76ZJfwVggGbEUDRmVoEQ8gmHg=
X-Gm-Gg: ASbGncu6ZF26m5a3LjMqePz6HTKf8gziG+Rg6swblghpY/0rpre0LCh0fdpxUDTGZn5
	/fbj47HPbnQdEkEIxbJQHyiMU/tLhHTmQhpacTSRvnHI++KKwXYMmqQNybXOQaaL8e9DPYtgOzG
	aFexqEntz5YEpOVgV+Iy4frOVNTXStEzD7D5DSa6DknNTxVWhX5Sb3/vtOYVYNojDdqzGBxyKFJ
	9jzy314FNI3NcwA+dEfp5kFgh9fzOGgL5aPAGXiLKw2akpVSVVI+VcE9O7CSwq53qVL4iXaWF/a
	CY7lZrE0+h0CphNi1eOnJbpY6k6znzZ3+WcpZj6B+5g5mWvHKMKu3cuAxh7OOwgKMsa5ok0m6DU
	+M/XiXVyOGpkbRU0wkV+tB4UFhyANeiwjY3VJfvgYMy+JQZp2OSl0LQTTLvgwBR+WRhytioMz6s
	Vn2FSnLIrUsURcxDuu6ftHHSeXIcZD
X-Google-Smtp-Source: AGHT+IFJQpq+WDwMaA7FjW347FsSVxwD9q92/cNDpC/Ji3gT0PuUoKthgOuYOi1dG6lyZEmWekcLtg==
X-Received: by 2002:a17:906:c155:b0:b07:e258:4629 with SMTP id a640c23a62f3a-b4138d53c0cmr550146166b.16.1759240640482;
        Tue, 30 Sep 2025 06:57:20 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:05 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sm7325-nothing-spacewar: Use correct
 compatible for audiocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-5-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=855;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Qe0f2DSIOI6REPXvZsw6mfNG/f7zF2Kc4oN276oEtsk=;
 b=B3B1V2m8I4ILfMLAP07WhFgzpb2Btd7IyCQvlV/gHJlnHz60/uC241UAB6TGvRLCLOrn77iYl
 7ounVtZZsn7DlxLzS3U09xKD2dn2MFQAYcB/DJJ9J6TcEM26TGv6ZJp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Use the correct compatible for this phone with standard Qualcomm
firmware and remove references to power-domains from a 'reserved' node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index f16b47b6a74c5f16657be1cb1e1dc03afedb1167..cb59c122f6f6adc8aee127944dd1ec2d967f3c2e 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -978,6 +978,11 @@ &ipa {
 	status = "okay";
 };
 
+&lpass_audiocc {
+	compatible = "qcom,qcm6490-lpassaudiocc";
+	/delete-property/ power-domains;
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.51.0


