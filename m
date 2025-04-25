Return-Path: <linux-arm-msm+bounces-55629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9CA9C84E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B158E4A50AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C0E2594BE;
	Fri, 25 Apr 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R+eeTKLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A2D2566EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582046; cv=none; b=H/ebmhWFduk3F/XjDRStGApfClaJ95aRBnp/wHGyk1GMiyWt7+weIt7WrFfbTpFcf+x2pobTYSYvtitai11E1pTMyyfyQA8RwpuAdgVcezFIAyJ23DbOUYCOCouEog2v/Q83y891zGQ+HCA4WCkhIiufx1x8oUfnmCN+a/zVuJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582046; c=relaxed/simple;
	bh=Wp9iWaEevQ0aCH/QYCEHu08kXHucbrbsnspzcdlMP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEbkwJF4V5lqLjs4aV/CMIjsozHOTLgs/+dXBL/wjwUpjWN6BegyctR9WBpsq7TM5SGPEbzeIHe+Y+6em6ISuagFS14VFdo4RJiIx8DFDN9u/Dmj62DWJQzwBZlVjXaGF5GakclEaD8I+NjAZjaQZeMAKx/7nQPl7NLEAY/WWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R+eeTKLK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso471402566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582043; x=1746186843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cpfS3QrdUns68NcbMwvTGZPMa8x+Cgf6fBqEa3ps8Y=;
        b=R+eeTKLKPcu1iJwwRVh74OGOwVyksp/ePYONMTkyEewi9nh9LhL+/8JOq+LvmsNFz3
         JqBD3o6NOTPHTGbRPTJu8unkUUMa6PQW2Xf6SCsRFQhmcroyGLoahqdSCNhDrqo/KQZ9
         zdZjAsBAbx/dLpcy9wKEo+WJNulL/blN3aLhpCgaOmV8iheUFuwkuLccMdpdDlxU2Yor
         /xona+hE9M+BDLRRSGw85PpUUKkH3oxeW8I0LtbETfJij7fv4VuGuJFCYV18MWrnRx22
         wDPp4erBwBcam90iXr+K0+8MhWGvOesyNuKnTSmlJjFaY7dRF7UtmDT6Q0hx06pgSjCT
         aRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582043; x=1746186843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cpfS3QrdUns68NcbMwvTGZPMa8x+Cgf6fBqEa3ps8Y=;
        b=bAzOZco5c7vFPg4iVJvYdsgd4M5qf8OIY3TJ6KF0uimu6bXAsLbDJ20248dLSTMMAf
         4qZkiWxYIt/3jVn6ECnhfoVffjfy5hnJmT5ZxkA5PFKiOUUpDifTcGPQpSGsiKYmaerq
         zYIFIP+IJm42AOD3cpvLd4ZFglzu9sCY42cObqs3wytsZ/JEm9MAbzrxXsnOsV1s3NYI
         AjpRTZYYn9NYjf+9N9fEmMDk6kUC/1yYVFmv+8RZbiWg1kCwpSvtv3t4EFaIeO6ZeatH
         aObD6bVSYoKE9FGmQji9AKe0t4qqFDy3mYYdh71NMQ4azmYiQurUah+dUSvyAb/GflfF
         UzIA==
X-Forwarded-Encrypted: i=1; AJvYcCU43lADCWAi9imx2N7Po+ggcjMK6VrlxSbmZI4+KDqPWNQ8UtJ1tkMuHdKLgwWtBFV60nCBvCfHnEpGgAgQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQUQSKy+6N5iPB0okQRTb5gVZXd9pDfgIXDGotkuQxtiPkt4F
	W0mcKlPzmJBIfMNCfiQWd+QbHyNx5+6X69cOzfKU0Yku5wgC1X7FbHjJB8c2AfI=
X-Gm-Gg: ASbGnctCAO9Bkx888IpAGwQ9qYsz/8L+uanmfzLbh3ySo5JnUq26LBvypfm/cJ3TVdn
	wrsUEdpQTAsemq2JU+nA60DJcR91T7VhyG/VNkMaDWIczJAnoVBfAcBTXdnC1TZL5abABOO1yQy
	SMCpeNDKCkxi45BLBlLpuk5eUh9xXd1fiu0DoeR8lnyBLe+mE8jZLYNTaT27WIn1IuSGiwZC8eT
	GCRGyuk8JY3HES8nYcX8PBqDWGNiyqVLQCmHedms56UsKMwGCb7IsEpkSzOKEdDRVco40VmUwt/
	9Y+uAzQggXUqBaCXMarX7xBKH3iG7f6lZVntaj7x4Cvz2xuZWi0bgeJVadWD8j3l5ebgX6PnN5E
	dICKI5/g2snmTaUBhkKT9PDOTRxnLitPLFRL3wMsaWWuVTH5hS2gFFc2UucS3iaJNCcg=
X-Google-Smtp-Source: AGHT+IFMeoo/hjF7l+e0BlykAtp+n1CvAkIhTlWy1LgZY1D314XWrkAO+8/iKA1i2R/FUs6u4NVzAg==
X-Received: by 2002:a17:907:60d0:b0:aca:a1e2:8abc with SMTP id a640c23a62f3a-ace7104d6d4mr182372766b.12.1745582042961;
        Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:49 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 85a928f980775de0617cdabfc31a96d044c5744b..befbb40228b51ad2771a4c0e6799d26045af5917 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -1223,7 +1223,7 @@ dai@16 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 };
 

-- 
2.49.0


