Return-Path: <linux-arm-msm+bounces-55625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C8A9C835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF4D1BC6676
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF25C253F2D;
	Fri, 25 Apr 2025 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SLpjf20K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F82522B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582041; cv=none; b=I2XzHK3vSCAkXGie6cXgmtTwQkot14E9rwWqtV5CjucTP/IRAJqaUewBIZXrcD3CJK54FhsLIXZHfP4KW+oWeOTzh0ZmzruZjqK44a7Gsmp77XbLlFVZqdyRBwWWUz0oMWJbU4GFt3JxAbgrzbJZiHDfEPLo57P+Q/+tXV1Zi1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582041; c=relaxed/simple;
	bh=mdt+FfQLOXW5H8VB916VcVsQAh5jD9AsKl8jhZ67g9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAiOvSGaMKufkJlCeh9FqYGg4dZnuZa2yVgg5cE/tzPj4CsoAWDTvoORNGh1+8kR30xHtwgwbacL29EFbB/qm1yRUEfz53e/CUw/Sq2uxLcnl4/bAGt8lAThCy/z72i4vN/x440ZOdiUMJx2KKSagjt/diyrUIp+8BeBEo493pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SLpjf20K; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso3518175a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582038; x=1746186838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUVOyxfmwmjXh6E7hIxSYPGnlbPlmO8pnH9O68ZQFjk=;
        b=SLpjf20KVRAeuz2m/cmuNCX17cNJcXGYYzGRDSIy3OkCx1uZ1RdJjCNHcnSl+1USjT
         82KlBEfyIk+9o9lEbRKt3jJZESRhNVcSlol20+/SiGuuMPJjJY+yL+SecRU0xeGmE1wB
         xQuaf5SNPi82+DchFOBT5xbyFIsSgjrbwn835t/d8LAX5I1c5FTRHm2clDjPe0TAaTHP
         sMeVG+DRMmsOaFgQXsPw1N4NXP0PjtOnSZGASn7r30BHNQeEAguy9+0xyR2+HDfylmgn
         zQmVLGd6t7+l6GfrjUdPPmvxj5KYoDTuGmg2X7jj6AY7HWFmGQZNSUTd5nWrhAX3foz8
         vZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582038; x=1746186838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUVOyxfmwmjXh6E7hIxSYPGnlbPlmO8pnH9O68ZQFjk=;
        b=QPGb2HtCgymsaJ+ayaZ3SmTwqly8xCGfYAzYFqRl/nxL+RghnDUACrE1TVdi9iBwgK
         YRKYi79pRPHUr7Zg5j9UcIom40VO1tJos+kojeSUoHX2yeZW23V8ZcbkBglWeVBVemlS
         na2e0KfUqn6RhDehFfCFdoSNtTlzIUJYdP2DbYcpDl9uAPhhXE7UCxpjUpKGzDEP+sHt
         HzaGSLqswGg4qwD4gToAeXalT8WrFkL2RaHcJIu4HcXzpAwmQOpptD/AqTgN9MaQPWZY
         aFa2mG5MvqS1bTzpui/HfBRgeWj+PCL34Ho/SsAZHKOuiNysPB4ibtO78xIQg+a/ZgKQ
         dbZA==
X-Forwarded-Encrypted: i=1; AJvYcCXTbOU6TCkPkk1HQrLOW0+1A9EmgClnbsYYoP0m2zEnaRkNPfOIEIi/16s0UsYz8Ihg4/UFh6GK9/lqAyd2@vger.kernel.org
X-Gm-Message-State: AOJu0YxJvzC6xG5bB587qMz4DdM2DW3XNfu2ZKrOiX090Tc/by3piK0+
	vv23ZAvF3Hp3h9UNCE95DXQi7AUKYLWiyL2mPstj5WEgtBzoel/9xTsl0cjDiUo=
X-Gm-Gg: ASbGnctdeoiFdnfyT/ZPuZUtSH/95usEfDALobSqd7ti+sLRlFZbWo5F1GZgw2GhN+G
	PANyrWFPNZ5qI+yA8X12i2qQTTrJNpg8DRA2XsigLuEEYS1McQ+N77jn+IRKUjmyBOBizhkNKA3
	siyJMf6pPrlVl/iHlLL9URfLqgZamlfBgT56ohA9mqZw2DxdHRYrC8FWgj8nUqVe95JKyrzTajI
	hAz6nNuXMNoUcbrPMSW8n4IFZlLgIYBnzztQphCsndllZ2ly0aePLBJTsy9nSkIOLput6EHn6GO
	s2ibxP46/ZbVwY6yaS8zP7gxOQxr3yUoE840tqMYve4BEfEDqYkh3fzRyJMlZSxWEsKPbuFk1j5
	duRBAudX9ZT/cLegkhPXcoLVe0kIz5KG8OeV9Waumqhfr+DQYjahzMLMQ
X-Google-Smtp-Source: AGHT+IEIFzywz/urPBQhdVyC9b0OBvVea74eItKR2Wff2NqW4gNd3rRUW/MHApmdlOSrb3j2cNq4hQ==
X-Received: by 2002:a17:907:74c:b0:ac8:196d:2262 with SMTP id a640c23a62f3a-ace71133fb9mr169852466b.35.1745582038208;
        Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:45 +0200
Subject: [PATCH 06/11] arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-6-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 3f0d3e33894a0730bd0b14738ac95847bd92ee65..672ac4c3afa34011eba6a309148978a777e2fbfa 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -530,19 +530,19 @@ dai@104 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 };
 

-- 
2.49.0


