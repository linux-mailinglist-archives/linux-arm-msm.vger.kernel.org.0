Return-Path: <linux-arm-msm+bounces-25328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E209282FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18E31C243A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 07:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC09145325;
	Fri,  5 Jul 2024 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HuX/m0yo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FAB144D2B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165400; cv=none; b=F+9B/8M6KuTunn1Pl93PeAmjgotH/LZTW8QPAe9/eTjiLf/4O1qceUQf1QS1RutD3QOXoUkQeWccHu2mPioRL0J+FCbUGnf4TGDHBufq3cHwwT0Sgf/gknIyq6iZiQwbHlXaznP5EwNwqwOyy22+MctJQrheHG/I/O4qPHFsj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165400; c=relaxed/simple;
	bh=xMRKonIgiBI78xXfSxg1vkO7UNb4VpdzvYn8LbbXScg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mNIDgpcbIKEppYfYIPj3Ih1EW7dEEwTLX0EP+5oUqGgzUM6cuM9GPcmrFELZrRQ4z3pdIgbtuzyqBxST2fUa0u07Mu3nQvvA/CmvDukuiVPHR4pOURDbc5FDZuU8iOEBgO8Fn4oLiPPwho55zo+5ztpuRQpbkGggkI3ahTQS3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HuX/m0yo; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a77cc73d35fso55468666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720165398; x=1720770198; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8q0QP9vP7dfkRhnJhs06XzMUSeogIVDRANFYGZhnly8=;
        b=HuX/m0yowfHdvD3KXQTAhFJbOjw/DEgE7WLdQKw8aErbayrpILKN6NSg/e1r9Nl3hk
         wfHXsfcyUQg6iExYdhGUdZ6gGYtW8821Udliih9okRO6Cg6rwkY53KYwhYnEMvDPEH4R
         YVECwLPxzdzEzkM/muONsXPP1FHIwsnugQkvO2iat5F85lcjyKRS+bhS3lvrsbVbt+N5
         F1kP/m07QgVy0rl7xYdd7XIwJePf72oEphVhY/LYgJ0WMawnFmYtfRtaZyF4tJIjy9ek
         AIfJNGuaIAUVOc3sOM2pNWIfza1pexrRImP8ExqQRnYzXC+LGz3Ol2UryoUtobqR//Ft
         fBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165398; x=1720770198;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8q0QP9vP7dfkRhnJhs06XzMUSeogIVDRANFYGZhnly8=;
        b=TqWp8qOcNWyfqCmKeITba44kaaermMd5tGBGED/oEKtxpGm80ugvoZrdaoHfTY959I
         Uy0mACJl/9yzARIxPSDEfBvYwqoMVoX+zKKjo2k3Plz3cb0FE7l6RRnf9VsI4k4Ysh1j
         foaIL5/oVSBg+hivWPsfEZlLuABRbXCvC8rCdKx47bsnfSLOnGvsL9E9rMMJhVknzT6I
         XJj9Xx7IQ/NSgfjCn9BqKBkO7mjw98yLwgWltZEVvPhSKSEuMtN/irk2FFx/ANXrzz2J
         6xw0s5EB8/aWDRBFdqhCQW6eTzaDJl1WUbcD/5BitpmQNI/9x+GOJoPstN37P0RxxHxS
         m0lA==
X-Forwarded-Encrypted: i=1; AJvYcCWLu3usIBHOOehCYCW6+83zW+zMfU0ybZ/LaZPK4nWeEsDacqqQSSQXbnhrrv0gvYGdZ5L3GR+xFHKFrEYK3T+KnVNhXcCReHcOcZzCow==
X-Gm-Message-State: AOJu0YzCsFZjMNQIsPATI6GiZsL2vAWYVJHkJSCn4k/IlBerZxRP9aL2
	6o614x7ySn4Cxb2LbMUkdH0Vo6/WwQiPDuISqPceZ07/aSaChufyxxc8NZPzjTQ=
X-Google-Smtp-Source: AGHT+IEFQtKLC2KR8SHNPEDd94zyKDCx/t4ohydEafRFmL3Th2JhU9ob/EKwraM6v7NFE/PI3+olHA==
X-Received: by 2002:a17:906:f882:b0:a62:e450:b147 with SMTP id a640c23a62f3a-a77bdc1f137mr278703666b.29.1720165397555;
        Fri, 05 Jul 2024 00:43:17 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c832813csm51332866b.119.2024.07.05.00.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:43:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jul 2024 09:43:11 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm6350: Add missing
 qcom,non-secure-domain property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-sm6350-fastrpc-fix-v2-1-89a43166c9bb@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAA6kh2YC/32NQQ6CMBBFr0Jm7ZhOgVZdeQ/DAunUzgJKWkI0h
 LtbOYDL95L//gaZk3CGW7VB4lWyxKmAPlUwhH56MYorDFrpRllVYx5N3Sr0fV7SPKCXN1qjnL4
 05NTTQBnOiYs+oo+ucJC8xPQ5Plb62b+5lZDw6klbx2TJtnffS5pDnPg8xBG6fd+/uUjGJ7gAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

By default the DSP domains are secure, add the missing
qcom,non-secure-domain property to mark them as non-secure.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Fixes: 8eb5287e8a42 ("arm64: dts: qcom: sm6350: Add CDSP nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix copy-pasted secure vs non-secure mistake in commit message
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 46e122c4421c..8b9bff38e687 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1323,6 +1323,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -1582,6 +1583,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-sm6350-fastrpc-fix-760d2841d0b6

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


