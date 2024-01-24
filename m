Return-Path: <linux-arm-msm+bounces-8141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7F83AE98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 17:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48651F231DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 16:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C9C7E56D;
	Wed, 24 Jan 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrOCAIH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E47CF34
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706114711; cv=none; b=fSUs9MPtZCY/a6C4QvOG/CKagvPIaVFqYIPcgIW4vlSkmDJ0V4RwwyBQzcKEOxurXlcSqTfJi7Rqbx5lkfGS0Xl4mVvnmYb3OJRI3hacLJwpKvsVNsBy0gzZ+55DXeo/OVKYukbVK148D7pYUbrzaguXPh33F1POt+W8Un83bgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706114711; c=relaxed/simple;
	bh=3rZvPqvCnI5w/SpkzoxzJYPXRXQwQmMIpGF4DlHAUZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jt8d8Tdo26VlL7wwKjaTGmKFyLLi30NbjYY5ZrsQOzNVrZaFal7Mgh09ggcSj5uEsyptUSpAvddlkjIndyLomK2Q6Pbvho9/UAE1RPWK83v8dTlhvkr3yCNvxFXdMxMMRB/UIgPOLlBXfULBUtidsayqzwhb6HXfCCkdGGArEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NrOCAIH2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3392b15ca41so2564797f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706114708; x=1706719508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvoYaI2BKa7cNMRECEuAWo8+54tJ7nx26haCoL0CnlU=;
        b=NrOCAIH2mhyBjQXpAQ83pGqdzD2oPjwFte9Qj12ptfLf+MWKX62dDdBovU8xwGGnEY
         7WQnEYCrqhablATOsvh+Qio2UHQHLcSaYLtCTzBhhVCECL8tHuisT1zSLVR0//D2hrQC
         Jugoh2GQQ7vr+tDeg/kNnbdSnvMsyzAusfjxrgB0q53MxM8+XNsCU4ctHiBuvKwPk1Fv
         ruepGZXAw+TVumufpwUvjnTp+DruZLlDkbj7AYLqMfUUhgCYHUufsKDDtBwkYv10Spr+
         4G2ARxkz8IMGzu5nYFIFkoVdvGmyrhjBDUnooJX5EIMlVhWAk1Ld4vFA7g45MWjxXBss
         CtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706114708; x=1706719508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvoYaI2BKa7cNMRECEuAWo8+54tJ7nx26haCoL0CnlU=;
        b=wC3jfvRQIyignMIPbVFVYslduLHl8hwNmUW0/lheD9UPk/1+W1DxcMntvHQoX/c/Xf
         cKB89DtG8DQ+TcXPgyGRwr+MLDmdfQLD4jwZ07xf857RBGugRvH98VYVDKSF5tnkNVN2
         aIKXn7HqxUziO4lKKwG/POgWaic1diwTMySRnbHCfbHSjIZRXvyj0dlTw1wpplpEbWML
         uttgmxV60y2dAyjIa5AxolcGWH47bOvVNFX7Ige4D8uJ0Pd43EHDdaoQ+g88QMr5Fxv4
         9xwvCVfJVM3WYzoEn7WdkamqX4qNxz4jzM1L4Y/sjHlwq9HGgd0OwKbVh8ixXE8wB3y6
         EhQg==
X-Gm-Message-State: AOJu0YwPxK55K4aF9mr5QF8QDn7yySWlgqcmeiM6Wf3ueeMU2CaH/NkM
	7VmoV1PQRPHX4+hnId4ulQhBk5B6o4pCVyGdAWAC+cCBheFpmhojpx5LJRONvQc=
X-Google-Smtp-Source: AGHT+IGcYUmkCTRpG/I8E3chXDc/GJE+/1YMGUO7gtkFGBajwWIAW9NHntpMktgjfMEXg8YdZCuTNw==
X-Received: by 2002:a5d:4a87:0:b0:337:d8a5:32d6 with SMTP id o7-20020a5d4a87000000b00337d8a532d6mr629718wrq.9.1706114708361;
        Wed, 24 Jan 2024 08:45:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d5909000000b0033936c34713sm8137883wrd.78.2024.01.24.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 08:45:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: qcom: sm8550-qrd: correct WCD9385 TX port mapping
Date: Wed, 24 Jan 2024 17:45:02 +0100
Message-Id: <20240124164505.293202-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WCD9385 audio codec TX port mapping was copied form HDK8450, but in fact
it is offset by one.  Correct it to fix recording via analogue
microphones.

Cc: <stable@vger.kernel.org>
Fixes: 83fae950c992 ("arm64: dts: qcom: sm8550-qrd: add WCD9385 audio-codec")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 6c8e206080d2..76e9ca954093 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -842,7 +842,7 @@ &swr2 {
 	wcd_tx: codec@0,3 {
 		compatible = "sdw20217010d00";
 		reg = <0 3>;
-		qcom,tx-port-mapping = <1 1 2 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
 	};
 };
 
-- 
2.34.1


