Return-Path: <linux-arm-msm+bounces-87806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4BBCFC80A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DA64300923A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B127A28642D;
	Wed,  7 Jan 2026 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yOUquAeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6C26A08F
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773179; cv=none; b=MOqBbH8FmtcVA4e4dj9vKVHQiWyQMij19kW5lwqEJnNqptSl37K9vzX9LiFMSJlunOsP7BVlmtYBxViDlLdGEWqroijbOYhmwmqKi+9w6vShX600na7CzKqEqx+DU/zw53mhg7xne/cgnt45YaoFkp3CjuftyBw2z20BlfZIpSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773179; c=relaxed/simple;
	bh=L7zFGJrpp7R/1SPywgnVmhsEuokhe1Ahx7lfge1c7Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=et9nqvgBZ9VjTKgX/Um0mccHrL1/2Y/klJjqhxkYMY+jp26CmR5vI6tVZSYZRdjT1emk3uiz+/N8WFwdSIizYSm4BHwGZn5nyxQFOQiG+HpFJID0yml0SYxJVDdfBXmHJosIURiadNptsDRWe+WPVcSwVVLSVi/DRW+54vUMn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yOUquAeM; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso2522548a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767773174; x=1768377974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UL8Q3N/uuYGWCPQc/j4tS88zUzpRBU6RKL22PZGfA+c=;
        b=yOUquAeMLkJU6uZY0YiZ34jH0yuh/C6Zw6cOkDeHep9aB4S6ONvm3ntE4MsenvHf//
         eWAAipHCFEUecfM6GQ7KccmGJT/i+S3SZB2ORrr0MrzRLamvqRhCMOYfl5SC/spxYPIb
         bjuEAumSmu4PUBVtcblX+DB2+QQbbUDbbkkheXTOHS85B+Bum3MGSBdPV4rDEs4UNqL+
         Nyb3TaepcMTp0+XnM/2yL0EATTYa7spQCflMjfhLn9mp8XYceVqWNkGKBoto635yJqxf
         it3Yrd7wOz0W/+chFFPNVKEI+2Gd6suS9cVe0emF2I8YnnrJhLvQ5i50L4d5qCtfTHwH
         1Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773174; x=1768377974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UL8Q3N/uuYGWCPQc/j4tS88zUzpRBU6RKL22PZGfA+c=;
        b=LburQFk8kfOLO/eBjQWXCthu41fpXnkBKZPo/ZI0JQG1r2nwr/DMgCJ+eRHXi6MHto
         xryNMyO1rUFiEGmJV6dntabaRmrFnwh9FfGvhq0R6+/O0Rr24Clye5N4ZzGsf0UdvLDx
         ZZNhn8nAYEmhTHWY2pGhn7InfetK02vUtw+bGWUyDz2WKO/z1igaiZDQYiYeA5yasCHZ
         yTej5wFN58rJJmxECrUoK//GQVjLuIlMH8QdCNh9UGKkI9L92ucuD5+Z41Y1CjLq6P7c
         MtGz5naUItToAh6lj7SWyT8aLVOFv/srNFa/a5fNa9i1TPzKjtvOsdq7vq6C51PZRyl8
         MzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUETxadA8aSZ35YR1nS6/JFHt26alNdvDVx9btPJv7PyXZPEzws1s1aus8eBsOaRtPP3H0x9hVpdJf09eT5@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8clSF+6FWWiHXE+2b7yBQ2TNHvY0RRBGB/6UuATu9jC0Kg5C
	EBK6Oq4l2ONp4D9Th/xRsQ3YE2zddU+mU3e/D66igYlrfwn9d1vv4QykDSMbSZkptXg=
X-Gm-Gg: AY/fxX5ximNRLe11Vhs933jmYDgyPkYIo8/4jRqgC5Njs3Tfyg4TJ2gMCirN+KgLyC6
	2GjpIlZTo3ZxFXql3H5k2PYnCP1GwnVcPoBd3aOMMKnC8xKOn/6np6zxXc0P1HD3KRLy0uL87GI
	04feXMvJwfM9e8z4O1F3Ylq+WSPKbHrRpiLIHePqpyG9zxIdPrGWa2rC1f6LHHD2yjy7l75gsI1
	s5o0ieLmYC7QR7nruA/FhC1aUO1Mzq1AyYU1abmSp4DK3/EMrtuNAXtAOZW5l+gh0a+OBY+jn0P
	kob7egrI864CyD8mN/8PZpmrCf4ezgH7zyKwjKhZwwlAnOepEUCPZzTwEwpQeQkV9q280uv7kBZ
	EIodiI9MJKNLJEYJ17LN5CR+vfe60qY9l8bZvM6uPnb6YnB8NfW5J9T6MHWjF6y4zD0vfJBsMwD
	tpmbT4Q/H563OzqEqXcxwJiYymJg==
X-Google-Smtp-Source: AGHT+IGoNwL2Ad4Wf5/kMZtYwloqDC2nclTMDNUXOI6+OkN3PNK9lgubRfkIS9pWfU3l7el4uXNpgA==
X-Received: by 2002:a05:6402:1461:b0:64b:63f3:d9ac with SMTP id 4fb4d7f45d1cf-65097e50cf1mr1240312a12.21.1767773173934;
        Wed, 07 Jan 2026 00:06:13 -0800 (PST)
Received: from [192.168.224.78] ([213.208.157.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm3941299a12.33.2026.01.07.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:06:13 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 Jan 2026 09:05:53 +0100
Subject: [PATCH 3/6] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document
 the Milos QMP UFS PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-milos-ufs-v1-3-6982ab20d0ac@fairphone.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
In-Reply-To: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767773155; l=1131;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=L7zFGJrpp7R/1SPywgnVmhsEuokhe1Ahx7lfge1c7Lo=;
 b=Fe5DRXgl1tVzMTAcH+EEUjx+bRFHCdB8IT+CJt8zvyJkZSSz/OKPkBx4UBM89cvHuO6GsOvMZ
 RcQEkaJMVezCF+L8auF0yI4aw/Rt9ht6yq2/Dx/32t723EUyu9KDJbr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the QMP UFS PHY on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index fba7b2549dde..0b59b21b024c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
           - qcom,sa8775p-qmp-ufs-phy
@@ -98,6 +99,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
               - qcom,sc7180-qmp-ufs-phy

-- 
2.52.0


