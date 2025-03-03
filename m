Return-Path: <linux-arm-msm+bounces-50082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602BA4CEE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778C218987B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8F823C8C1;
	Mon,  3 Mar 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNcaZywe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163923A99B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042540; cv=none; b=Br95haZXgDMHyLAT7GJ9ry8tSPqwoZwhAgpZA0vB9eZItNxfcU4oNwZpuzA24AJ6spgZjgDlEsTafSKq/nFO1lbb6CC/eOAUJAo1hs3K94uZrkowEUa3XLr3DbX725X0QMYiLy6GMzrxvAo//HoafDkEbrtIMcCj66SO5983xUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042540; c=relaxed/simple;
	bh=j9JOgzmcmvDWHrhUDefHzjBfMqmkn65YnVmg+X/UHck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghi9KTG3IwDVpNPgjYNmd6XcQEsckIJqk2hNCigPPaxsFQY7eiTTrStNOXkIR+glALdb2kQKDKSF5q/qHrKrmCEwB4Tv2EiT5Q0n0UmQQrolnONDCvuK+NUGhef6HzOTtavk3hARVWaJgZjdBpC5SweV3YQ6Hf3+CMBqaCmS7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNcaZywe; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54958d611afso284085e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 14:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741042537; x=1741647337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvxvtp/PgMA+KOB5zPz/+gF3wZdvPxrXXnP8gY1icsI=;
        b=LNcaZyweoqme/xlGnNO+1hGw9phHQZmJpbsGABYj8/EXBay54/emWwFkCmAwUioOni
         Yt7m1xSHjXL9nQFz3197eq2beCjLgY60g8NJC1BGwTkdLwBTc14ISiVpz4evTHAdPVtz
         gREv9RXyH2isBHurXT75c5sD3dQw8yfk1uzT6RYe1kc1Umzhy3xDOj4Pgo7+EFE1lTEq
         6RPDTOe28O1TSSqEfM4wlyE142VpMCT45Vs752Ykw8NBy63vwtrXQmm9dp/a3Qzc/jMN
         2AxLFg8FZMkdLdgm6biJQ34VL6vpcXpNPCVOit3XmL7e+E1oq9kabC9to+F7j+CmxFb9
         7FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042537; x=1741647337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvxvtp/PgMA+KOB5zPz/+gF3wZdvPxrXXnP8gY1icsI=;
        b=Ff21zb880hbwOMqQ1Ai0AY3oeIEZrYymTsSQr9FfThG7O93KxR0m8987XdOtfNv7JX
         XOnzPAmewD/vu7p41I+mGR8HDQsM1x4wR1lGeweNF3TuQVVfaHeyCVLSj3if7i3T65+T
         39ybVLtCfZcWqWYDLDozFOD3WW7aI2PZvR0r+XfSeHi6LerZgMDtMJ7pO4FRDgGh5A6g
         mph0Hh3XaUMwKSy6ooeaJAfU9sHtkMB46Q8E8nLilEoqADdpByXgvpyPpVH3Gm53GKSJ
         1DF2ZzGOYEGUDMcBNdNS9ISGUXm3YD80xKZIh893WeyBxJz4U6KDNCYPgoSWgUkLq1BK
         6g8w==
X-Forwarded-Encrypted: i=1; AJvYcCWZDT2JQ4u3buRlVdlOTVOcNd60Tfc23aVCSs2yZ4QwPfwZnFMzZw51ReVI9mlH5W60dZOC+Fo92W3H6nIF@vger.kernel.org
X-Gm-Message-State: AOJu0YxppQPw02U5sotDPfw2yKrqJHkeHPE3wxBtBU78QCBv0L2oWQh8
	p7aWD8UM4X1Tdj5Z4nVwbHhRHpKzPBkwB7N2o4QIKiNYMA5YX+h8fVkEdYk3JoY=
X-Gm-Gg: ASbGncumdzGq+pb9mFt8GcgISnxUcpATvZXnTG3PmqQ4u2/9jHQBOQEKhSdWCiM10Qm
	EsQZxgA/dxZ3+BfVyZCxAmwuQ0ABTU+qqN4PJDoKnkXHr1NRdKx9srkpPLupc10qD+FBuSuw0vu
	S5TLbrD7udGJOwSmNvf3cYqpTbEE0792LnGAZN3usA42dYO5r8t3qcCYEUG2BAAzfdmbcvg+30X
	xsQ2S91ae/dZTcbl0m1FeMl2NmPij5toRnb5M2GY22/1sPDDGkiasNX8F8JrA6/l+S4ij2CekAM
	0YvPV9aNezoO3LQootvV+Zmy8K8580C85t4Tzi3q/kbBFPVGGBQgYgJ5B4N4x7j9obKmqaaPnqF
	sUf6QeRqpGSQc7KOI7OQpEAvKBgUdIWlaZg==
X-Google-Smtp-Source: AGHT+IHzrwEy7B1YWBxSPh2b/rjqFRLEHa6zuKP4h6nXsDizpRThpZqROcTmTjkAlkgT4Q8oWxRx6w==
X-Received: by 2002:a05:6512:2810:b0:545:6f8:232a with SMTP id 2adb3069b0e04-5494c3682d2mr2008050e87.13.1741042536678;
        Mon, 03 Mar 2025 14:55:36 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495f630cb5sm662059e87.212.2025.03.03.14.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:55:36 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
Date: Tue,  4 Mar 2025 00:55:21 +0200
Message-ID: <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM8550 Camera Clock Controller shall enable both MXC and MMCX power
domains.

Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d02d80d731b9..d22b1753d521 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
 				 <&bi_tcxo_div2>,
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>;
-			power-domains = <&rpmhpd SM8550_MMCX>;
+			power-domains = <&rpmhpd SM8550_MXC>,
+					<&rpmhpd SM8550_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.43.0


