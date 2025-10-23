Return-Path: <linux-arm-msm+bounces-78571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CE877C00CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51E3834C149
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E19E30E84E;
	Thu, 23 Oct 2025 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jS9nCJ6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD530DED7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219476; cv=none; b=gZGkd86VNgBfIQmjiWGJTuYgR+i+L3P+gOXf5GtKtkRauf84dMtcYSxbXc8m7Op69+JDYJCN1k4j3VOIK66DWd50VhqytwjxY2N/urS+MSPQybIm3k83+zLkocFpfforE1pkvyEjE9pgg8B4BwSHSxBBzLXTYxmhBSSLyADOm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219476; c=relaxed/simple;
	bh=g58KuzkktKQpB2ABG9JXwvSPtzU67rd18b8pTepHPhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZTWxQiuiarcTznsPbCsCqDWLzFjeqEZj/1ZJ6ZKnZ+VnOuwhRZith3i8rX7cKOXv5EBxwfvnUQDw7wMd5ftmlQRHGrcXgQr0fTufHfysYESYHdGLoSYx1ztseZIg6L6nWkum1sdss7cZJ9elvge0jxv2WlH/XdcM+TyA8cfkJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jS9nCJ6A; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso158206066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219473; x=1761824273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjI2aJRLw2mG2p4ljVDPimKDlO2KaZ8by2HdaZyc1co=;
        b=jS9nCJ6AD0UffeUVIExSuwlPjWmLq/1fiLKYn4bfbi7MLoulYC8BTwk2kuO6Qshh27
         5aLOTDNapWPm/cqYAfM5DhNt9Qa0B2XyuHP9uxfA+Eb6BtA7nT2za/6mfyvt1MI0r9+6
         blixPAuU+tVh7aONnEdrvp5JjEv+1J2pkrlLzJr8Gdwlg49d6j4g9qtLE/KbKhAalEU8
         MmLDlmPc93wX71Co42U052nTQRmCq47CBtJHD0ruWqyXIrDB4iYnVo+hv8OeHZFyfUO7
         SlKrKy2xUDx0liGqCOb6q6oESGZJgbPgDi8kd0kkhN1lK4Nu1WCfEK0+/jFwraXh9MBw
         Z8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219473; x=1761824273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjI2aJRLw2mG2p4ljVDPimKDlO2KaZ8by2HdaZyc1co=;
        b=lW1kmWDbOd9ZxwMaevvEUJ91nItNCU+MGbshAbemzvKtWp0Rt1he2Ae046hp4H7gV3
         kMlYPmkRs3vUnEEjIAck/VprEgZUG+YD+fhxRxp81Ued6w90R7/80xfDZ+HUCgoIEpu2
         QwtiC8V7+dSOGBFBwhnW3XrYIpEUks2Nj1d2ZHCPWkpQdA5Jrixs8iANdOKs1SzeZUIU
         rAtmg9pON0hukoLQTM3XG39HEh6qHEIGyUtyZigqgFOudOfn5ARG3h9JrdNAo9XaGhUG
         OchVuulxXlw281i2evoYQmNfgft+yK4eZdZt1s/vlyxMPekV1qFVuOkjC6a/EmKg2rQo
         28dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa9ewCN7bJiDoxGFDcz/qnwV1U3bm88k9vI5kEgii61LQhwaayiPD2yX3OSrYa8aUyUGyb4y1hZKxORvTZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpd2frWMZmqXqwitWSfgHos/orX7lE+D+aTt4dry+UkS5NTlvu
	xhttvRYiqlyHb9VSZRr1KLcLwdXtEcx/JJ0gPZM2w54E8okS/CDrIBUEH9NrKw4gQ1g=
X-Gm-Gg: ASbGncskbKJWXZhoQArlHdHwn62wPGED/63FGOirfeTsgjLXfnMSXbBOivqfIgF8x2b
	1Gl/jp46SoL4VAi2U12Vmyvf6VpVuE4FjOLJ4dkUDORxbkNJHgcv4QsMHofD6kSAj9Nu7swWFIx
	D8C3rLkBLCvY5pqNXtXC4KkSZWkdLq+ffsT/wcZz/LbSchDfZvcmZDlw6Ebr3w9EFNdg8mwgln7
	fkEQaExk6H5wYjR96az1243rOlpnQGsag/Yd+qxBEs1bTEgfnlsMPTeD3D+FIAfeSKuuJ6W3Mzy
	fcibFKLs86YgHQMZhWBVxZ7+q6NwF4mnV2WcqE3GzEP3oyoL3IE35wJDCb+EY+QTxoT7ujyI7a0
	+0za7h24F7LlGsEZDzr37MnWl3vdU7JeJsx+dMpzfbSsKuCenShTwQeZ1wmWHOuml+seajRN/Cc
	8DO6aXOpXvdaVXEIt22JpReF3evcEko2hHL3+nlVsIIe6mP5J0vx+WR3SC
X-Google-Smtp-Source: AGHT+IFB0A7MKls2kHsI5nX6WsoE/dx/at6LNgngrYv4dSUQbhkg+Or/JWcuw9BSWnZhYzFJWcxWXA==
X-Received: by 2002:a17:907:3f0d:b0:b49:5103:c0b4 with SMTP id a640c23a62f3a-b6d51c4bf45mr279214166b.56.1761219473297;
        Thu, 23 Oct 2025 04:37:53 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm194429666b.29.2025.10.23.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:37:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:37:27 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v2-2-799d59178713@fairphone.com>
References: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v2-0-799d59178713@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219468; l=1930;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g58KuzkktKQpB2ABG9JXwvSPtzU67rd18b8pTepHPhM=;
 b=GRRmF9C1XQ5OuP3yDDE7QI2w32CcMFfuWZHPb78W+IrWkSEJhyBLbS9EyNO0PXqFRB4qzp1CK
 QU60zmIGBtND65Rzz7wMMqLRVWNpGPhED0HprkdCWDdb8pmTrwgbP51
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

UFS host controller, when scaling gears, should choose appropriate
performance state of RPMh power domain controller along with clock
frequency. So let's add the OPP table support to specify both clock
frequency and RPMh performance states replacing the old "freq-table-hz"
property.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 19a7b9f9ea8b..30e77eca4c02 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1175,18 +1175,40 @@ ufs_mem_hc: ufshc@1d84000 {
 				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
-				<50000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 150000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>;
+
+			operating-points-v2 = <&ufs_opp_table>;
 
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <37500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		ufs_mem_phy: phy@1d87000 {

-- 
2.51.1


