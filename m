Return-Path: <linux-arm-msm+bounces-70175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C4B2FAF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFAD11882442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CB63451DD;
	Thu, 21 Aug 2025 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZUAusZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C0E28DF36
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783457; cv=none; b=ER+fE4lqjclhOM/gbYJ+Cj8KhwnXWpKqT9Q5mzaMxz5p0GUUUcnoHELSk8fxc2yZmrM+kVqc7vWFbFqaEglYlzjhSl3q+yCtNgI2Zw0AMGVGpu6IrlG4+pPMhohiycpJewz0YRkIXVk7KVmXCNTNbpEqRxrIPyUMPpTUUpJRQKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783457; c=relaxed/simple;
	bh=w1VZqVZB4tsSvRFPjcFON1TkRO+UIqwQJ3G42TS9+0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BS/xlE1lWdgd7RlOmN9IY7lNxicDu431x0PvlJokxe0DVHFIBN+OSnfWTZn0Lc6LeT9eHCAok7H0bwqP04Gb1K+rydoaDo03K13u/NUCuIdsm57qYG86ZvKsvkKpIh1pUsC9eXhEfbVXUBuZyeIf2a7VbBO6rOgbLV6RHMSUvfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DZUAusZ8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9d41baedeso578376f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783453; x=1756388253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLNjFnxfd0fsnNGaZyEi99xhqnfoLRLL41xepcgfytM=;
        b=DZUAusZ8r0LYLX0VL3wNUUY0oOhbS2hAv72WUlGuegnM0L23YLLA841rSp+KlvPRjz
         zX0xMrSukOPp3EpXGkmmMm5Yaa/BaXl4U9Jfyv9GzE5EjTCV5Xh68e/13phH6cSehe3Q
         7eYMRusinwkka1ophT/Na5/QQWTM4M+CeqOzBLSN1ANC+PYuJ2JPUwqs1GCMqkGaaZuu
         iCdABuHzmk5xUNOGNp44Uc8DrPZIWIoVMRTaA6nzpt8tq48edNTzfpDAkecv28DyH43I
         55Rl+FzlteNEH23I/vWAwHIDpN5Wdm3tmTHVrQGDy3puO/H1RrOshjU23m26+AWUBdfF
         j0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783453; x=1756388253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLNjFnxfd0fsnNGaZyEi99xhqnfoLRLL41xepcgfytM=;
        b=TlE16z+UHfDlVG3312fZ6TnoKAIvSd7Yn4B+TTTGviFihg5v/n7nhKky1UOPAE7+JY
         IRZXAe5l9PGH4Tro6r6R/qobWS005mzSziPy9MjvkKwJeE3futPvL0SGJBEvtRAAfqJJ
         vk822+gj/YI3M4yj/PYhSsPjhOKM3tU87tWWDfqiXAewOdi+ZOPU1jZBMGTZ+djW36qU
         GJp+Wz32CQf04xiRr6RByK+DLdAsTFEGMQGvV7zsFcUop1Sx+IeWigh8RJeX8LQE/oC4
         HRkidK93Tub1C4PgoIhaPajxkSxEe/lQwK9GmrBEpFKlHxGOnGOCtI5ctjEx94iOq2Sq
         QsKw==
X-Gm-Message-State: AOJu0YyRxa54UOgOvVAsQW3PMQmJ+uowVkP29pbOtEK0t0dKYe+2Snm1
	zSeJsmuwlKl94qFkTwYCd4EmQlXrLKJRxcER683U5/bdFGTW7jtHqSK23TYUgbsMpvs=
X-Gm-Gg: ASbGncvzT44IEJ8jroQiu5TRfPsEyiT/lQcRfFQzAItmPjMylQNk03F/ADjcojxZfMY
	/b25swhbM43zGNPwfmea/nikBHWURplWWnPnlT3OW0FKUsuqTbBWv8c2OW29T9CJzHFdSKfippE
	3iovfS/eR4EzMzJfiCPWvqEZZvFfxUsXzg/SHq1sMyzn06JyLEqn8mfye0tjQNzAa4802rXcafu
	wfKymzHJ9zNG7mueAetvbv8Xi7eDczjY+vV6404ilt+ZM1RGKvm2KbPbi6awD66kh0UVGV3O5jZ
	FpDc15iS7DX4dypKiz5BFVT2tEGhrgPkQ6WB5LNB+pFzDzzdZBefzAZ14qDuPh27O41fj2fD3lI
	AomwJE/007BI+dKDg+rR+sWlJUTpmSUk9H7FHuS6W98M=
X-Google-Smtp-Source: AGHT+IHI29R77nmCHb0nbYFtQ+16dSwZNjtjN8JpwWnEqRR4cDWkddELER0agEuohuWYjW2VyVLLBg==
X-Received: by 2002:a05:6000:2283:b0:3b6:1630:9204 with SMTP id ffacd0b85a97d-3c49480f096mr1985195f8f.19.1755783453545;
        Thu, 21 Aug 2025 06:37:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:20 +0200
Subject: [PATCH 01/14] arm64: dts: qcom: sm8550: allow mode-switch events
 to reach the QMP Combo PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-1-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=w1VZqVZB4tsSvRFPjcFON1TkRO+UIqwQJ3G42TS9+0c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEVYHPcbbho0B9Dim3clvaOPMUG/EyEj/E8xiUs
 3Wzz3o6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchFQAKCRB33NvayMhJ0aLsEA
 C/yWfqE+GvCbVfuDpndTww5O5Lq6cr/364zpf+9/CAyUDHJrxa6bWGNUrg5Q+q/bSvcE9GfyimL1pq
 Dk3nCu1QyjNV2xOyWfTn+mvtk0+ryicvcSO/SiqT9yRDmTzuocKsPEnjOVenmD6QdswwcjjazIHvbe
 zUuopInUOGunLbQAyPK+ez88dfNaE7F6KbYJmXSeTbh4msZ3kLdutZXnPNsNAoxvsNV2lgehFxT5/1
 HXEvI01XZK+nECGw+5+wNTAswytdO3vOzywr4ztR7no6xwo4RoIphl3Rf7i/hs7g1qgXgdYtp2r3OU
 FUwrT0JkvWbgcOriqoeYJo4RaRbjU71cogJzU6bzSsjrNS7zSHnnTHidMBF3P4NxE9W3YzVYhy2+2P
 BhG4Y/D/pTx2OlY/R+4XDVN1NAJkWyqA3k8LdTQg4MaoEG0l8itJBE/nRCtbWda/lPFlzDWqdMFias
 zL97HKjJoCLWbGFWXquQuIlzcPptf/80mAtWYc7w+Ksn27Ea9B3lB4+f5Gbz7uYfqwStHdnup/F5v9
 IEhIjtvRKnICMCN6+/HixskyQrCnUoswUg2zdg8g7mzvckGr+jcm6gY1wlADCGydrS5+rgvCnAQrlG
 zw9BIfM6A8y2RLu/HIYGXBdMvmAnBoHH+n4mY0rNrdXXLrvypOgroebDxBsw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow mode-switch events to reach the QMP Combo PHY to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 38d139d1dd4a994287c03d064ca01d59a11ac771..0409ae7517f239171a89bc0ba7bb47bc9e7fedaf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4051,6 +4051,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.34.1


