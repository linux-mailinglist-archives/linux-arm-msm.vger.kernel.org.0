Return-Path: <linux-arm-msm+bounces-15812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 018FC8929EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 10:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B731C20F8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 09:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD424FBF4;
	Sat, 30 Mar 2024 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KGQA+6rJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7EABA57
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711790003; cv=none; b=l5z1flYZweZiI796xg7jKhauR6qWf9tgKUp35U+xGR3EiVz3wk4XMOsKPHMgj+eHlNvmH7cBp0uaAadUf6vTNlWb+cuC7p3LFmK9y+Vm66rbqvKQZ3HoLvyqNC4pHFsT9SFACbiQFp+l0SZts1zcZJFtXy3TDo65sYqsS+o44XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711790003; c=relaxed/simple;
	bh=hfcuUfuH4Utmln3ZF/NDaG/F8P52KEMNKxEh5L8xc4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W8Wv10qYJhWBZjNHVJcPquuG7aNEG7z0kZ1IJm1ZG4mODKJ6GC4vPIr/qOx6APGD6Mt2JYx/VFW8w0y5r2yftz5PsGN1fCo7Un0Td30Q73P3qAH8fHdXcBABIdlwzoZKcG1b1Wm9Ntl1BebgVogtmWJ+vSWaZK1fdf99ikgiH20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KGQA+6rJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5157af37806so2973173e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711789999; x=1712394799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQNM3EOhi4PJ5pFJ3LXwT3lu91N/5dhMq5qmt2uZFSo=;
        b=KGQA+6rJWA6ilhOR0RcthhWO//jqxh05v/SNDXnVmckNHklKu0k0rULQExjuK+wrVl
         tuGIcbxqvAo3tArAUVL4NuouqE3PN4LP0icVzaCQ/OLO21smW/0vO2h+ubnaX4EoLXW+
         e6Fcr3bZTXsEQcM6FFkHf+dRjxnuHchv/V7neIycJMnK31lyrO4wyRe7KKtVtayJTw7y
         t69V2RIa1mT6bLJyael6PaxSez8dJyaX7n5mCt12kvNEKpHrNyvScNx+7ZzjpuAnQXHi
         I13eBtlT6UUN+PPR6jL9afxD4AjTEEtysJRSiPaqUqdgiqym9SywC3A8Unwq4Nw76tsi
         lCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711789999; x=1712394799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQNM3EOhi4PJ5pFJ3LXwT3lu91N/5dhMq5qmt2uZFSo=;
        b=Ln3sIEar6Asnmplmy6u+1vfUlZUrqmE6lqP0HZljM6JelXU0S8rJuNjmWCBYB8bjqt
         kDCKNFw7HA2d+U3grPoWBtZtRpZj4+N86PD+iTw37AB4XnCXKrnGc4EyXIwDJiUnTSOs
         90I60xWz1ALxXuT9+ntzqd9ZTTXRcAz32YG2lJa0oU2lGN8QyVfHFTLqN9xBzmcpS2Wy
         8wxpqUjMAbsCbeynIIS7W+19O+R9HMmKe2Cd5BTXJ4cJMRiUpZPgCl7kLqRN/R896Zey
         YTRxLUNL3lv6+MDeMlYR8JT2gXY6+PQvBpNukMq5jF5BCT/w36PvFbOBD/xPQ/ymLc6d
         e2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXzys6UsagsJ389/QoWgg+Fwnuf2ogUt9Df63D9slrq8aOMUGEJLXliCajRm5mDgu51guzxxogJuy/dD3JPgRltafZKx77WZ7Xub9USKA==
X-Gm-Message-State: AOJu0YxECP7DwPzPZO+x0/7aVx0NcgKBNkIRFlfhtIj2q3ko+km/UF2a
	iEkX1TL+BL6/EOVeUdXPpp40L7pRCNgJ+Jr1MimiUDCx6ADN1Ctjs86oRK/FM+Q=
X-Google-Smtp-Source: AGHT+IEjSpbByfHvSiQJRPu7UNykzpnq8VEXolWuCujs+keoQ6eFxgRPNnyenkikyhKNWhJjtoY3og==
X-Received: by 2002:ac2:4dad:0:b0:516:a148:2f5 with SMTP id h13-20020ac24dad000000b00516a14802f5mr181151lfe.40.1711789998936;
        Sat, 30 Mar 2024 02:13:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id az15-20020adfe18f000000b0034335f13570sm3984261wrb.116.2024.03.30.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 02:13:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: pm6150: correct USB VBUS regulator compatible
Date: Sat, 30 Mar 2024 10:13:11 +0100
Message-Id: <20240330091311.6224-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330091311.6224-1-krzysztof.kozlowski@linaro.org>
References: <20240330091311.6224-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first part of the compatible of USB VBUS node misses ending quote,
thus we have one long compatible consisting of two compatible strings
leading to dtbs_check warnings:

  sc7180-idp.dtb: usb-vbus-regulator@1100: compatible:0: 'qcom,pm6150-vbus-reg,\n qcom,pm8150b-vbus-reg' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
  sc7180-idp.dtb: /soc@0/spmi@c440000/pmic@0/usb-vbus-regulator@1100: failed to match any schema with compatible: ['qcom,pm6150-vbus-reg,\n          qcom,pm8150b-vbus-reg']

Reported-by: Rob Herring <robh@kernel.org>
Fixes: f81c2f01cad6 ("arm64: dts: qcom: pm6150: define USB-C related blocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch, pointed out by: Gabor Juhos
---
 arch/arm64/boot/dts/qcom/pm6150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index b20a639cddf3..6de6ed562d97 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -64,8 +64,8 @@ pm6150_resin: resin {
 		};
 
 		pm6150_vbus: usb-vbus-regulator@1100 {
-			compatible = "qcom,pm6150-vbus-reg,
-				      qcom,pm8150b-vbus-reg";
+			compatible = "qcom,pm6150-vbus-reg",
+				     "qcom,pm8150b-vbus-reg";
 			reg = <0x1100>;
 			status = "disabled";
 		};
-- 
2.34.1


