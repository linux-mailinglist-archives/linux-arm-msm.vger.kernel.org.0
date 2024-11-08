Return-Path: <linux-arm-msm+bounces-37365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB01E9C274F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 23:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CCFD1F22351
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 22:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B531020B804;
	Fri,  8 Nov 2024 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKI5SVJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2CD20B7E7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731103512; cv=none; b=ZNN+RpN2KQp+iiScde51edPKvII55+98mDTiD7zLVu9uUbRTmthgbAp84RaZNk1G5nQRTkh6Y5JzBZGjQ2EIsqiuSc6Xr00YqTSWiLIOB5dOhBZZ2wmpHhq+7kXyaP2kMpVnTD3VfQ0rYUDAoWQnaQKgMWcL985wET3Qy02Sah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731103512; c=relaxed/simple;
	bh=6FfVkGoM9m7NA8q+wP0onySbK3VrJrkurSiyu5AGpkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzY18JcV4nPgiVFfRwmdZO0bBEYo4KGA5MEYmeOxgplRtcNWo47lOOm/z+dP4dZQSTbvRHVXyTQHQjS+sORIMPj2MkOLQ8LONMEabLuk7dXeyuvFAZITYYEea4Ey3CABtLlVClf0qovAwIPP5EYyivAVAmqeFYwbUX++V/6fH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKI5SVJy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431695fa98bso20709185e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 14:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731103509; x=1731708309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OorCPkMPlsXTIjmTQ3ybPTnkn5w3sqMZVgbEJ14Cx7g=;
        b=AKI5SVJywggxQemlHQMaK2jXZRt2vaqoQf8EDmzajbGPmBf9HDul4BGrScg0qEWOUz
         Es12eHSoCblftVnsFjzN+5UxHSrkioGN83+OtPbmuudjrUR+68xSA/JJekd6+DxYNJIH
         PJl6TbTv5D3KEYa/0JxEkPKBo7v87fgBMmJU4o4iILU3zXMEx/5YN8geHiuDVXlzpyrx
         sS1RIrp7YEC560Y06CRVkbgFLHkRXv2kukjOEpfgbsBJK7/iJbYAy6wrwFyh47iN51Kg
         hxwKyknH9Dv/p1Nq9P3KyCo1VG+8EtdPI+o0LiDILhteydmOp2fwXjFrTmSOnIf0toCI
         4eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731103509; x=1731708309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OorCPkMPlsXTIjmTQ3ybPTnkn5w3sqMZVgbEJ14Cx7g=;
        b=gNnixN7r+67xQKHwcIA4rAGruOr092Gu0Hm+b9fvMvJ6nWRuamE6ioPl7sN7P8SZFl
         cDsE99Qs71frIUnDQlMSIx3sc1Qys9sPjISNX9ToU14fl+kIPOSK4DQU3fyZa7Zwsgkz
         R0KIJ9Iqcr89o2hnyhfTxPwCBpqhtcDVAMKdaSPEZOrAdE+shq2C9P2gYKRLvKCCLOyT
         sdrbl9aedH79byshUQbdh6j4vSzM5GnDnbCvGvR7BWOhAkz9TdpQHxmN168DabzzfqPt
         Po0SaK/Knvsmkna/tG1RZwrx6EIxr2oRuE8xQGpe5Qtfi69RIGU7DLBi2JhMgSFgncIo
         w7hg==
X-Forwarded-Encrypted: i=1; AJvYcCU3b4/mNF9Izqk8otxcw4D4xcDoPJ30g2kfIusCaGGZs3NwCT4GkTnGBSQaUG9r/hWQVO4NF0Y+EwKseDFY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0gxD9FEybc58rRDlG6jg8tjt8TkDGBKprRSST5bL8ZT/pZbmB
	+4NJbVUvJReqLfs2IgFkdfxsJ01C+TJEehIpvvViUSmKjK45hs8tpqPZDEFXiezt/xSeYFaRHYN
	i9LM=
X-Google-Smtp-Source: AGHT+IHYvR3Zr2VxeiXvHxbHhpcUYpUMmNtEBPIqvSo0oVTypU3PFxQ9syTsoriOH5ZTDAvnEEyI8w==
X-Received: by 2002:a05:600c:1e89:b0:426:60b8:d8ba with SMTP id 5b1f17b1804b1-432b751dc3cmr33988935e9.28.1731103509497;
        Fri, 08 Nov 2024 14:05:09 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054ad23sm81676125e9.13.2024.11.08.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 14:05:09 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sat, 09 Nov 2024 00:04:44 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-pmics: Add missing
 #address-cells/#size-cells to pmk8550_pon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-3-c1e173369657@linaro.org>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-0-c1e173369657@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, stable+noautosel@kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=6FfVkGoM9m7NA8q+wP0onySbK3VrJrkurSiyu5AGpkk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnLosMAycjy9sHfpqKAzouUCeKJONhm74eM6Je8
 Nv1zDIWdmGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZy6LDAAKCRAbX0TJAJUV
 Vg6TD/45x3TVpXEwEjvmda4GKIFdK4JGFqqL4S9RtBBT/UpeshaE4ZGnMnDMDpsZrboby8esnVc
 JorP0GNyqyH0r07QBTcPwDKyQ5O/ogRe83j/Z90SGEQPdLmHvakPpwsLYO0KtQ88kKNh6kjepSF
 9ghlXk09iAab3XoHwcSsg3VFMxAojwUkmcAbccUAxTSRWln0zXjWob6m61PmEme0IMPZrFXtbl/
 0++qQTGC4bmc7jJC7bapT/1lAFtAKQ0QruGoYW5RW90SYITT0pH3RdIhtVMcOqqcIToNTFQ9fng
 Db9wvCO9If2ZKVNmfMNqvDhx4x3B7bNiOhuGJ67zCBuB0joM+6JYJCx0HO3CZYfG7hbUB7oT5ss
 A/cWH1ewvAI1MzxsvvjD4jWHdq96eGpbZGsjrytfw1T0NP6Jz8nwFaWei+qX0H64kM4XR2hcy6a
 r0ILlTu8ADr3OI8q8oWTIfu7r809kucDlAUsTzF34Kn5sWGdV6edsGYWkByPnMfFcWdKQRoCStG
 Cb+ZwaNo+PMeXx0+Y61M44fM/cf6dFDzHYMc+eNJ+LgVmF5sujOU2J+QFUkF3k7z5qxP3bJiYzj
 9d0ZQzkdmqoU//73u0SsVs8hN7f7RsXpsGi/MkAlJNpElWpJXDMSLa9tC9pPKjg6o2vdy1Hc5C4
 zN0Cagp766TNDjw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The commit 4b28a0dec185 ("of: WARN on deprecated #address-cells/#size-cells
handling") now forces the parent nodes to specify #adddress-cells
and #size-cells, otherwise it will throw a warning.

So add the #address-cells and #size-cells properties to the pmk8550_pon node
to get rid of those warnings.

Cc: <stable+noautosel@kernel.org> # Depends on commit 4b28a0dec185
Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index 5b54ee79f048e3208cbcd6f91e0cec073420fe63..5b9d67c340dc7a4550c9c7f16269542e400e4ee4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -205,6 +205,9 @@ pmk8550_pon: pon@1300 {
 			reg = <0x1300>, <0x800>;
 			reg-names = "hlos", "pbs";
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			pon_pwrkey: pwrkey {
 				compatible = "qcom,pmk8350-pwrkey";
 				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;

-- 
2.34.1


