Return-Path: <linux-arm-msm+bounces-70179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86038B2FB11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1233062044D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A25C34AB0C;
	Thu, 21 Aug 2025 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zULZqz5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4434574D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783460; cv=none; b=EQ30CGLj2qIWr+brCoyucN35yYaHd7laga2nlLBKxq4BCmvblxAPQE9PA7LEguNDwzvPrdnxcOCb+DCmTuw/MNQXQIVC2vrpE0fD4p1Mqq97sDuG2jOFf/nSltRRd4B2czN5sqwcruygrnsmcR3GeAZZrgWecQKPrG20c/hJNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783460; c=relaxed/simple;
	bh=G/wzh1LKlqFj1XHpSW24RpGEuz40jGEwYVOccwOIdpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oapktOYsWpL3tNU+Z8ZKeBBSo8eD/wQNPS/9RG8MrX5YF+T93c8AAypKs3eo29g/lOMoAhV6eolc1v0nLwRa3nuCsIXqAZ/zPuVJy/GzhsiKQDECMXfD4/CzX+g5lFwJMQJ5JGUGhtYihCOpP6kH+uDL2uQ1gE7cGWrIREch8bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zULZqz5U; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e411c820so656111f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783456; x=1756388256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9vU+AzX5hawYwkThmd0VTvOrafIrJwi5Pt/Uz+FZJs=;
        b=zULZqz5UXpUjkwFRw3UXOCtrEbLOiv7Cn8REvoC/uMTKpbeoKnkOjpnpZHhblgb+MD
         I3su75DC0OMw1txqNkz1t0F3dJMSyOyB6elCSdazVBQD57LfCKT9rfHCUn7PrChdcFkP
         Hlf0MpHmpnUzduhw1bCxT9sJJ5FnZdZgSWrtvfT/U7Ez01R8b5fPXAa7yMq9G7sLipnY
         hFJEsI0XgBNI6G0bF6JOnfymqxQqO06T3pbf2HXJy3CwHs45msPs6Z6LGz/IEqeHLRbc
         /vBFlgBFgYKFzNi6ST0FDRRgudax5sCEyhkd6brj8nbm8r9RUF9tRT6RvU1WUW8nLDeB
         JVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783456; x=1756388256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9vU+AzX5hawYwkThmd0VTvOrafIrJwi5Pt/Uz+FZJs=;
        b=i5OcoN9dsle3J4JuXSr5bXmwlEvjwyrm61KDee50/heUVuy22fU4DtgGRTJ4+wSUGQ
         kKG68i5zo49KYYp8x5S88ajsqCX1H0wVjHY1TA2mOCpLV59oat4C/qwgLO337RLjUPaG
         4l1L60DhUPEQ/SyIg9kRqkkYlgSLc77E2dl+pMYpvfUY0mRdo5+hwuSvYPpgMPbO5oUL
         UmlX2xFgnApYFjYFhnGyF6Y6qePlu/XdZKajq/9Ux6CM9MGPtWe3SUUukKcrVbxQfU2W
         BxDP8X+e6onVXCRHBUyjjYbFEcgF9VFR9i8p5AI3lUVDx+1+rotzTCQnwUMS0C9b/WbI
         a5jA==
X-Gm-Message-State: AOJu0YzjO/KxEm488SlSTtWtDQKJCZRxFg19MfnhMxWIAphuqY2OisMi
	To/1BKnnMLiziSz4YP1IOESLC5KNdkchU6dvLziSCKIA+zRLj1CQLxqed7eVTpz02bvGbAvXHUL
	7cMF+bKM=
X-Gm-Gg: ASbGncuEVKiSGdbhcQrniBYI/mo9g4NvECwsw59WqCvYZnQyFBwyEALMmVICWY/mCFh
	x1oAwaX4oKn2Zxf6b24P/lSF7rwz+Si76jdCKXeISF99Y8t2yoXkjnUeyDbr8ouxqTBMxKsPz6O
	BiJCwl2NzhNN4/HCTxuls4aXRtDn4c9oVfwLq1Ja+dq+/ZSPkXS0k4dmTEPwemkcitZrf2tOuKP
	d54KD5t4suIniWx68QyOY9K5rdC/k0QvS26xBlsAV2uSdzmmniaYksu9+pr07KT3fOvBdcZ+TVm
	phlJx5zhZ6/tAABpm7MGxwyzSyuDi/P2piZz8DVhfMYlKmT4dkJqewsVTnckpOlyBireHuvlIzd
	ifqybSKH8tn8vMm5bVKl5mhKKyKqWb/XnSJbJl0VSiNI=
X-Google-Smtp-Source: AGHT+IFlMEQm3EhWhoRPrCCU2bZyPxfPOFn+kWm4OX2OPTOR7JgFmf47Q+l/6593g7FVCWEnauSMog==
X-Received: by 2002:a5d:5f56:0:b0:3b5:dd38:3523 with SMTP id ffacd0b85a97d-3c494ddcbedmr1667569f8f.8.1755783456137;
        Thu, 21 Aug 2025 06:37:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:24 +0200
Subject: [PATCH 05/14] arm64: dts: qcom: sm8550-qrd: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-5-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=G/wzh1LKlqFj1XHpSW24RpGEuz40jGEwYVOccwOIdpo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEXvq2mdMaX9QWlttwqiai5xpU3E0/wwbzCiLlf
 DmfLGbqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchFwAKCRB33NvayMhJ0VTvEA
 CEvwdMset5GUP15wAFmnHwTAV+q6dAwIQFEzljLfd4dHET/nsdN4odSr/TFeTZdvb1HXiQ2h4rjapZ
 XjNtv2IULJTb9uPz8apRhlf7xB65kO1WTYZSKVdHKYJlTqdwrdw+bFG3FVdKzDovItBXbB3NOX9q5p
 Iv12eFK3aHtpcmf1aZuPEU+AC0vNIr2qHrqlCTpoDab1KLFAoFBxGY8sByZEE6tgO+O5ZxWJTPTcAi
 KvldlR/qNEYjkvAlq8iWm/ez3MsySX8jvlbegifQo5wkLhexew/7/J/UTixadFr15u4RTOaxfvmH/j
 2rTtaeVTP+1cRB1rlCVyihwpKv4e7Rm2gQYNhflWHx//vQjbcgYIbrwExKWrsCuG1lgUEvWYQA23w8
 11hTBjZSWaVxeIhKX3fUrHxVnYngsQvOcK2HYkQbmxYQ1ltklTnLc/Sja/rNeSELHbB/M/f11AMQ8H
 vscm3XW1drn2ITC9PCcT0QHUIvGThFbiIqjU/XMsK7krZ3zSxPp+P2e/hpXc4c2OxvOecW7c961NHx
 N+K2hkw/uHqC7m4UxccaGJRbPI/tPxd6PQC4mRaz1g7a/s1Qr+WrTDskpogtwp7J3XJlUxh8JL51Zz
 jn02BnwP627zur3cOJhJJYSu6TzjGEVsHBwp7szfBuMeavZI03s8v8wz148g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow up to 4 lanes for the DisplayPort link from the PHYs to the
controllers now the mode-switch events can reach the QMP Combo PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 49438a7e77ceaab9506158855b6262206bca94ec..873835eb1ce98f2306abcf0153a284f148e69cef 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -858,7 +858,7 @@ &mdss_dp0 {
 };
 
 &mdss_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
 };
 
 &pcie0 {

-- 
2.34.1


