Return-Path: <linux-arm-msm+bounces-34177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755999AF43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 01:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA84FB2263E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 23:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B90B1E5022;
	Fri, 11 Oct 2024 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="bc4Uy37e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0871D1745
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 23:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728688826; cv=none; b=QGptvGljZoQPkLEKdxwixb48JBQilCSySWpSIfvl7wyIkTnrNBrQTanVuyXlwdG3s5kVBVdK8nIONdCN/uwlEoSQoOK06+0Uq2tHNW1RgCSWl7CVq2LGyZJdcB1QLyNyfpSWV6JsDX7ESCxll+6HmQQyxXTAijT4O9p+gWmUxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728688826; c=relaxed/simple;
	bh=nDNDo7ALv+O3cxUau8Fj+PX+xIMtyBWTHRXfMjz46/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATQbWvaMoMBln8gn9v6EaxVImCEDVxlHkF2M/DiJA3fk5tWJTyk+DQkj90arJpSEg+MsAhmvrwdeiJxGLJkwwGb2//VrESrKo3B47elO0ao52EmPFM4ykZYZm8hrcND0KcCjQqvi2x66JVG7+DXtenf18IYxQPitoeJS0efdAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=bc4Uy37e; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7afc847094fso161806185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 16:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728688822; x=1729293622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AduvL8sRkCTgfrWSsu7rKhjd0f6vDDJasPZpnT/qEYQ=;
        b=bc4Uy37eU+yFaQyNBGmAEw/avs7Q/VVscCax3yO4kzspawxhHSj41mf7dXyQ/NqncQ
         249Kt4Z7Co010gdTpFKh5ffAa5P7H99z4rNTc13KQLYhyR8IUxey9+bKS7b6qd3XuzOd
         qwLzlEgTp17BjX0vW9U93axNcfwUGYgus5rbH054QWcijpcEmr0jHl6n1j43V0a4Wyja
         82d9h4XhtGkyVh5o5Qgf7TY+cuJZl0haNzvbXMppOIE0a9br3rJp4SzMrsY658N67piP
         i3oz2HLCmzu81rdnXbjKATx1DGlABConyu6+FMBWQ3DrwrDKF+mWK7Fj/J/E3hoKQ0rP
         x3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728688822; x=1729293622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AduvL8sRkCTgfrWSsu7rKhjd0f6vDDJasPZpnT/qEYQ=;
        b=mm4xyKK+VtfQmIBjO+GZD5AgmYeZ6ClHEtHBIYFSB5vG2iYTuDO65734kPVgAmu1cC
         lstJd5oQA3dJJCBol1ZwEDV3fYmem1ii8Pzf15LEoNvCeUrK019u/q6RW0+eX1jjvKR5
         hvHKOlgLUJpdMRFig6CNxu/KwTfK3h5DcG4DCKXAy/82khIsbtRomu+5UCiUOGGCLIjR
         3SUiIRLp4pBc6/dj5ciCn0tBD2kjOFq3TrvUfjq92bKlWVT4h3cGAzgTHUKzF1rnbtS/
         EzYTkGYSPgY0YMSsA+ItIOGbXEF2B9FlNM/sA1M4cgEd9fS13VN1m+nFRfQm+GGa2Auy
         +U0w==
X-Gm-Message-State: AOJu0YwmpeSenCmClIDVkwUFNOj49DqFX1qOINDrjbg5tdYiYQAjedTC
	i9H17+uZu0W0g70oSaEjVWNBnSt9Eg2mzTx1bAq60eGdx/SmV8QrgZUk0BB+mecIzKpq5UpOY7u
	N+cQ=
X-Google-Smtp-Source: AGHT+IHERRNksDcH4woDGxy6Xo1Vuyyg8Mbm887V41NlviKjtKHNlpNjAXx0lyE4C/9XGCG4TpjpNw==
X-Received: by 2002:a05:620a:3f85:b0:7ae:2f04:bf9c with SMTP id af79cd13be357-7b11a35f56dmr600500385a.18.1728688822487;
        Fri, 11 Oct 2024 16:20:22 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11c0a8902sm89949785a.31.2024.10.11.16.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 16:20:22 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-crd: enable otg on usb ports
Date: Fri, 11 Oct 2024 19:16:22 -0400
Message-ID: <20241011231624.30628-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011231624.30628-1-jonathan@marek.ca>
References: <20241011231624.30628-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 3 USB ports on x1e80100-crd are OTG-capable, remove the dr_mode
override to enable OTG.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index eb6b735c41453..bc66f4713b231 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1568,10 +1568,6 @@ &usb_1_ss0 {
 	status = "okay";
 };
 
-&usb_1_ss0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };
@@ -1600,10 +1596,6 @@ &usb_1_ss1 {
 	status = "okay";
 };
 
-&usb_1_ss1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_ss1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
 };
@@ -1632,10 +1624,6 @@ &usb_1_ss2 {
 	status = "okay";
 };
 
-&usb_1_ss2_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_ss2_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss2_hs_in>;
 };
-- 
2.45.1


