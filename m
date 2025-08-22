Return-Path: <linux-arm-msm+bounces-70436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76518B31FF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F94C68359D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 15:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B8F2405E1;
	Fri, 22 Aug 2025 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CoUO/Jc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B7238150
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878221; cv=none; b=KakUqXNTdFngfKE8XaV1oj4mj379cIthRCS9naGfwX2hpqHXJd9MPxXlBaVFtzq+U8ktt0aJSijdSLWzy3OyIZltO/Wi21zM2dGFT0fZMRkN2Qkdfajt1ZuHCqhcuxYjKT4NQEbU4wVclbp5zCqARxYGXXCAexWPfM5F0YCzaII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878221; c=relaxed/simple;
	bh=w1VZqVZB4tsSvRFPjcFON1TkRO+UIqwQJ3G42TS9+0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Azn0kHPTPptR90L5SVPrxBzwcPKOm7sb/LFWR/rdvVsBCMGZ4mtQk8WhKMHgw1O/Uri8og4SqH7Fg0zNW2z8QXg4i7dhpgWxlE0YgB6SCAnxEmQ8BennHON/f3wjqcI2Wvf068nqaIzXI4V0iuztRz1OH7HAA+JwOr+L6TzA6SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CoUO/Jc8; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c64123398cso310819f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755878218; x=1756483018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLNjFnxfd0fsnNGaZyEi99xhqnfoLRLL41xepcgfytM=;
        b=CoUO/Jc8folbxPDMqndYMBBsUqDazOXFURFeQY4/z/Q2FkHMxUv0h7REc53P4/OZzl
         afOUt6No/BjVggD6fO/vmZ3cVIcokxemcgtohLYvIJjFAz409ulOidEmz3hS5pSU28Rq
         2Bzljg1VZdXVEnOeWhBEel41uFMi+66zhNHeDZtmHIfaptF19KHes4GxLcE78gDkKf+Y
         nt7VSO2eGMyCx3IoJ56EvD8cLtmUTFtuvR1aKknToIIcQBJGFvJpCSiGz3P5YDOphcSw
         8p8xKTwHj29fQ5a4L8AjVNfSH9IU6Uh16BzVS/SZjcD+KML9ZkGUycv+HbqP5jDWFCeE
         nvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755878218; x=1756483018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLNjFnxfd0fsnNGaZyEi99xhqnfoLRLL41xepcgfytM=;
        b=ubi8XQBBD4DiomMn44h717/0xDvp0uJQt8No9BesK9MUi9NNB1N/PzQ2IgjIqGl+U1
         wdXoQjaGiNOPnCaW0rNCynGgHRpH4gCvx6AgQXMKIyts+/h7AUxnvzkv+bztAO4O1Qs2
         d5kTz850avMxIwzhVonZYjpnY1+23fqztARbP/YDFGONvrSgVjAkuq2fDUAjmvCOi68Q
         uMXMUr3Gvc/f3Jvfyqv3WTa+pAwtxJjvb2+8eBQ8+gjP518Q9AX6q5rDg6V5UlT5Hn/q
         fYsea/f8ueZoEUUqF7S51xVd8BxdqJEkyDUk0SjQht7m8Y1q3HANDasvTzEsZ74Zoru1
         k2pQ==
X-Gm-Message-State: AOJu0YymClw2ecPljSgBFcRzNXBQrCo5IzGb7wCUqHbnW2T6GVhliqDr
	w38gUgfMBSoT7auI7GHGIGN9/j66090gu0xzO5m7MmSmXKDxfG5iGY6cn+KpaPWOMKk=
X-Gm-Gg: ASbGncvOdcMfw31OEpqsqx97ZIMOzevtdhdVrhud6lq7kY8BXIgTLJtM/BvwW+y8yTD
	QdtNTf6V/2epeZh/9kUtfj392580R6CBylmjZ9xIc1tLJihUXMoKwLDv2ZAsM1xDCfYb2P2UhvM
	FKz34QMRcOPSR0csVAnJDbZQapCxrRL5Q3DtbAU/exIs8/oUZX7c65IC0eqNSbjdK+rrLmCp4YU
	JhDC9eToYIEGnLDqDcVdBRls7ETJnlPsBxT+Ps0mZ10Jtfx4qlV7diz1kiJQh2ftvvMSi/ocMRe
	YeZpuHEC5e5IpIkzPkOdbOKSXZ3MPdqlvowBTfvorNwdktmi6SMv1OgkJiNtkmVeWlOFdPMNPTQ
	Rk83Mzit1tBiGcbKhtIW1iQXuLh+LydGUlhjGxUNkWOnya5IFuAim0Q==
X-Google-Smtp-Source: AGHT+IEmFm4+ceTHHTKE+fyS80PNvEs2hq8lv91bfxzNojpH1C6IQ9irqwAiOQCJFolcVtJxlRJB1A==
X-Received: by 2002:a05:6000:2313:b0:3c3:c280:d43b with SMTP id ffacd0b85a97d-3c5dcff5d74mr2404818f8f.56.1755878217619;
        Fri, 22 Aug 2025 08:56:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c3c89cd4d4sm10095765f8f.42.2025.08.22.08.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:56:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 17:56:49 +0200
Subject: [PATCH v3 1/9] arm64: dts: qcom: sm8550: allow mode-switch events
 to reach the QMP Combo PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v3-1-5363acad9e32@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqJNEHPXOuGvx5JN8cuE1YtPOfX+b700koEJW/nL4
 4F8U6g2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKiTRAAKCRB33NvayMhJ0WOCD/
 9YwkM/T0OKDcnApMF1AErStMU2LfD1vvp5oI0T+0orIOBrCBOFuBy5mMduiNZQTWCjyt+2Kzwtq+wV
 ApZUHUx8Cs5p/NGRQjgwvf6Mm0AnlVmTnO54UXwckwgXgarNoREEynzqPUCgsyZ6b7mncthQC5JaN6
 QbpxjLj2V0zdp/Y+/Sc0x7X8p+SMX6nm7dPs0M6GJocruffAYToBHT1dmbuKmmxThPNZJ7Q89Eve0B
 jWX5oGENeV1KK2BbfjQkIdsWy8gh31LfDT9oZi8Q0KjiSsW+AAbpW5JarVc//fBIZeoYQ1AEKUw99F
 HS5cTzSitIo2PufXW1ChuK9JvLCkQC5yDJNOt7jOtNY+waoFteJtdYPKzPZSiAN/1sjOyIg4dn0TQN
 pXj0CLgrT0mvJd4ZQNLbg1hYmSnjz+2QL1mXeGbfS3BYg+HeQ2jP9XNYP5DFVAVM8/E0FzQKCks5Ev
 h0GsMWqUnAJReNVJT+Py6cCKnKeVrqugiu5AGAfTvwFk27LEoAjrfmQ7lgkOr1wf1iCgjLx3NjWoNE
 RWtwbW+96VPiCNjS2oskqdV+D9MUmys4yDWgk+Y108BbT3jprloIgBS2LO/bKk8p6Kz5rA4L7H+xbI
 iGM5VQ4FUS95QwHk2m/UhNsqE2a+ceHDfjrLUE5h8yPc3fxOh8urJ++FCNAg==
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


