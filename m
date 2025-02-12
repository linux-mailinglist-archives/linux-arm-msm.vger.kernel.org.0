Return-Path: <linux-arm-msm+bounces-47675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD3A31AFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9C2D1649AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2CE14900B;
	Wed, 12 Feb 2025 01:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTCfZdJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8913A3F7;
	Wed, 12 Feb 2025 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739322507; cv=none; b=eE3uaEcnU9+MmEXe9m0ovWH3HY9modu4Hek8TjEOkVHjrL3jv5ziu5aNcxt3d7EV3smfkUV/vck6Z7+ISqQpmbHDqbIZwwguUVT7pbWXS7Bea0COF689goZunH79YbeZ93wk7P4YuqcJKEHsuepgJihNs5vTbaOgD0OHyEOMM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739322507; c=relaxed/simple;
	bh=NUawghqRrh3rkXopa/GiGWcV8jI6vPFr2NrVSrScqAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gikW1PpNMuHoaXDk85lDyMmh6+VhZP9j+1bhoQbBqXQ7MdJ9NPYCPeRBkJIWPG2wx76Tj3CLCegxUd6CAsc/EwrV+UmootP8DhN79T7rvu/ZNvh2Uwtnifg9S16qIQfR+wTB3uZQ90w3lTPH6OEWpDP6rwbi3iEREgj6zq13IlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTCfZdJa; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa19e1d027so8256713a91.0;
        Tue, 11 Feb 2025 17:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739322505; x=1739927305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI67GBxmYGSpIszVmrGo2aY8dYvHueOBqThLy2Ev9T4=;
        b=XTCfZdJaTbYm7cjRleFYfG7FE2q6EQLqMU6rk8hcrFiZMykuF0m8HocEZSwjHq463I
         x6vbRVtS163r02SyXuihrOw7wjl+7AtUFCzJ1A3qfDrZyhChcTycPCRr/+R0YiuYaaQ+
         gLTmQQqIZWIAcL3/3A7kPIbrhvpVSAExsA+MQxeXBIlBft7ZXW+Tdb1z8Xs7yoJ19Dpo
         tsudu2VaptzXCidsVc+4gnpgUnWOe0+rTe9rlHeEbZeC/1uHgOI2kA/R+pawYz7dIJwg
         K1ESLZS5oG1Sskc7MrP3w0mfP5sOSvMlCVgmMsiqM2f+Hfo1Sqj014ZZOfdUDlHl2O++
         27lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739322505; x=1739927305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI67GBxmYGSpIszVmrGo2aY8dYvHueOBqThLy2Ev9T4=;
        b=Fha9MJZ6uDF/g9jGfw5KFnRHgTUvQHu3mfQdynmc7pbVIGFxs1XeTiJS4LXAJA+BsQ
         qx8iQVuBK5WiNJ/5W9V6a1Z3JVOCdgWtOs8Dw9g7s54z9xxqbuVWULoLi1MGZfLPz14F
         +OQ5cmBiEc9KFrSAgqXbRxBF/kzqTLOllGwxmsfeK94UMa46sZ279gGYk5inYZI/ndeA
         6gp4dfGMpBlxRszslDD5irTjlPFpfsdD/iOZbr3jvmhwLC/EkcUlxcuamJCvIcSNFz10
         1P40zmp7C7GfercqAF7WRRZkxCPEqZ/sHfb/uq/MQ7582cAb2Z/btObK4vajpn0xiq9d
         yXFA==
X-Forwarded-Encrypted: i=1; AJvYcCVnZ4FGVnREB2W0rD8qCa6o3QhxQuaODBmvFgFhQiq3vCUirY9KoqANw+44/d7un+Nmug/bSvw/qviz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/xuwi7kWYwXyj6Rq3T0bnBtjPUK/KT+vt6yflepmZt0z2Vn3
	m9epYuCO8tls5P8D3TOV9ke60xrvOQnh7rciZOZGJr6stBr3HkATRdMQFlu1
X-Gm-Gg: ASbGncvfUMOXKflIkT4RiONh4QrE2A6WuQG7IFiasS0m/yHjKa0UOxIciOJGhIirtlc
	IbtpqJD661+eIxUN2LaZOKBDHm9nhLIcL6kGMp+gzs54/tSlSapIPfvuKtBSg0kFAtHNfWsh6mv
	ub6dZ7sGHrBbQUQ5kvJHRmIyaFXp9rQcqO94t6YkavAVzGxIOqXMz3HIrTFPOdAysERE+8U5Xwv
	XgDHLeTwbHyH78GXeom37u/tzHmBq5V0rplaF7ZNUnua4tpnlmt+tiMjSQuvzjdCzKzW9uvnE28
	mU+3QQ0nGg8zTvEkx/hFFzhjHAMCkjCceJHPuA==
X-Google-Smtp-Source: AGHT+IHaZVLdC2TCgPqZ7423xb/aLsEO171JW1YtxGA9PbbUY5S5Zm9fmDlBz3GqZR+5EsVUjP+l+g==
X-Received: by 2002:a17:90a:d00e:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-2fbf5bf4948mr1895144a91.11.1739322504689;
        Tue, 11 Feb 2025 17:08:24 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d3d16sm190408a91.13.2025.02.11.17.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 17:08:24 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	quic_wcheng@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 3/3] arm64: boot: dts: pmi8998.dtsi: Add VBUS regulator node
Date: Tue, 11 Feb 2025 17:07:44 -0800
Message-ID: <20250212010744.2554574-4-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to enable USB Type-C VBUS support on the SDM845 platform add
device node for the USB Vbus regulator to the PMI8998 PMIC device tree.

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index cd3f0790fd42..8cb1d851b5a3 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -29,6 +29,12 @@ pmi8998_charger: charger@1000 {
 			status = "disabled";
 		};
 
+		pmi8998_vbus: usb-vbus-regulator@1100 {
+			compatible = "qcom,pmi8998-vbus-reg";
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
 		pmi8998_gpios: gpio@c000 {
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.43.0


