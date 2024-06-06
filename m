Return-Path: <linux-arm-msm+bounces-21867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B98FE2A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01DFEB2AC76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C88914EC42;
	Thu,  6 Jun 2024 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cWfMu6Kh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380A14036B
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664972; cv=none; b=gKD/3bTvrUc4QcalVSKeJWy+T6/OZsy6G7PV7pPL00GLobDewKV9haJsdM0E8k0UT22lteIAnKrtVXkPCQvHFH258dTCn39WZAxCVhV2expQ/VPJPGW6OI+cLpIoTp6J6Q87zX1jwF6CI2dX723cHdt3ZEyVg5fmx60exxp8fjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664972; c=relaxed/simple;
	bh=smlH6T7zNUxLgq0OmtV7Rk4JiobNDMTSW4bVj1LVQxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oEZ9vijHKgWRgZCmpfOYL2+m8JWv+iJbQOFTXsi5htkD87zWHV6T1P/8Ss5SIzO6fj5lQz9tapGsaB8ATyIYRiCSx775fiaauDKKSR1n+7V6Ljtbe7R54X7gMpOjbJsq32B5KGo8WZQLneLrD2kRV8Ht1PhffGadvmVPCJEru0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cWfMu6Kh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a63359aaaa6so93602666b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717664968; x=1718269768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HeWTsjDgfYcjvzpN9AvdtAEHKQHZVOf8ieRqkfpvQRQ=;
        b=cWfMu6KhrgPF3imNOHEt+r8zGhrYPeKzdjvKNo9rMxmyW1t30p5KBJ7u1GW4+0vlj+
         Msyg8ifY2oqtB3fPB/wcyifJZv6/4wft/lxFsA5JCEmSF6vAbnwCfNokRjip1ww+3M+n
         ytDfFbsvB4Bgsog0Dm135LOHYCXqIHyRHHP12XvTKV3ZBL0SA9M7Ng/cnFl5cqs8Zfrz
         vSrFNKGeoaxfFgLcwMAcF/Yy276i3V0N+jLBw8Dmv8E8mR84vtuChr/n1vxW/JdAMNFQ
         PD0OSZA157Z8UNDi5EGTNpTDk3ux6U90h8xplRwwpN0tiAdPtPd1T9LuJuFmxU01ed8i
         +vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664968; x=1718269768;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeWTsjDgfYcjvzpN9AvdtAEHKQHZVOf8ieRqkfpvQRQ=;
        b=LHTpVBXNKGNTyorrKUYiqn9sHywhjEJnT4lC7DCRTQHi30UbMho24TUX9CgSuAqfgT
         1bl5nFyrdVE9bD03Y9hltMv78OLvR7p2k9viUBXNZ/BuOa6KiuoYvVW6e+vP55B9Jdig
         q3PR5nOMazD3UIxyU2viHIcD58tzzDGnrxJvEB0BGGc5lfLAHR95RGmxYsgxjOSN+wV6
         uqe43tEopmDp8PUA0DsTja1Y3m9jPKA8YIXmEkf2hg9JxWOSS5iVBGqL8+aYvN4pije3
         brFeGlNc18O2MSmiT8EK3O0kVJRQJvVjQAYqL4cHBM3wnU7ae9BNc/U3ZJEIToRe4oV5
         btTw==
X-Forwarded-Encrypted: i=1; AJvYcCXkqD7V4fx/nh0VhppGfQeySWUStFalM3VKLhokUJjIPFb2iR7kbad59higKlwfA54umGIWb53sHxtfZ79Fem3n2Xh7eg6xXNHjpps4UQ==
X-Gm-Message-State: AOJu0YzYfPNtUB2xfdGMFlj+SIIexNbw8n7SfuHMFJXg/XEB6B0dU3ZS
	c/ImhV4YznoakujrJz0n52FhEac0qF+M9GM8CVet47j0a0gng2nKDPkXuLkrauj2BzvVTkWNDcV
	qyW4=
X-Google-Smtp-Source: AGHT+IFATerlbshiVB9ZH69mQZNENHUzFhrPR4nN3eku2fN5TTpR1lr0p7A6w/6VhU4mf30ksR4j2w==
X-Received: by 2002:a17:906:174b:b0:a68:ad68:c7c8 with SMTP id a640c23a62f3a-a699f67ecc7mr310175866b.36.1717664967729;
        Thu, 06 Jun 2024 02:09:27 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805cdd32sm67724966b.79.2024.06.06.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:09:27 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 06 Jun 2024 11:09:06 +0200
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Use .mbn firmware
 for IPA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-fp5-ipa-mbn-v1-1-183668affe58@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALF8YWYC/x3MQQqAIBBA0avIrBuw0Fl0lWihOdYsMlGIILx70
 vIt/n+hchGuMKsXCt9S5Uod46BgO1zaGSV0w6Qno0kTxmxRssPTJwzaEAUmb32EXuTCUZ7/tqy
 tfZcL1xBdAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Specify the file name for the squashed/non-split firmware with the .mbn
extension instead of the split .mdt. The kernel can load both but the
squashed version is preferred in dts nowadays.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 8cd2fe80dbb2..6b4ffc585dcf 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -551,7 +551,7 @@ &i2c9 {
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mdt";
+	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mbn";
 	status = "okay";
 };
 

---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240606-fp5-ipa-mbn-d0466de6b5bf

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


