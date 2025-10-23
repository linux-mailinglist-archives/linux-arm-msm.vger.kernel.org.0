Return-Path: <linux-arm-msm+bounces-78576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C69C00CF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AACB1358FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B6430EF93;
	Thu, 23 Oct 2025 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P1jE2uct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1D30E0EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219620; cv=none; b=o9zpaYHqIUoz0ma+fZaLuMXc2GE8b1VP8Jf1YgzT1t5gt+fzH9dbgIFEnouWHcvhmyE6tai/OJLJ+QjUhr3cRjd8VXXBn03UMxv3eVtV1+0TcBxcfDNkTxHbVFH90piE3VLudLMIQQiwq3xJ5ibIi/QGelIE0Ih0kIoyzRS5kcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219620; c=relaxed/simple;
	bh=p95Yod17aguDEQvaEd9jFzyjpv3eP0LhnfZGpsw/x/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEhQmBToRd+4QxHo4C4rb4ynAbuZSxjoxPPnSXn/Sn9S7bh/qHH2Vp24NuFvgpHQeViqg6BXpye/XztTxCL8ximZjUBhMVgUT/9waaL6uF2MwwBtKZ7hxRfeAfIxMa6GAq6IEUBqc9XnRXjO3K7j5sFhgxAgsATrk+wPP5OZhn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P1jE2uct; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso1122022a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219616; x=1761824416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b9aFICfN/XZyY8AY2ox+ovxPQcHAuzzYqvvmhyVWUw=;
        b=P1jE2uctxGdO+kePUc/sjbLYT+tCK7n0+p+K8mTdBxutivs7zkU+ZmgCnHuV8NofQQ
         Dk/VVd/uCtHDATVwRgQlsDPdYcQWMETAJl2UJi3XJTfDNDOXB9y8oqo4kWtaUL042X1E
         YNPPWnnxHllHhA4McpymzyaZ9TKRd6kMyjOLIwHgL84uWkrUdx3/m4X0uyXGoCF6kuxl
         AsE3midRPo2JOsU/SV38sjyAuzZlje19lUcdsDb3xzO8d9SEIcPReJSdQMauAcYqvlid
         RXysQgXG4P/usLZuB8GnvOf0LEESc/CJ7o6Slt6SFYlBABU3Ds6ifJ+4e7rIYRrTJpiu
         N34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219616; x=1761824416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b9aFICfN/XZyY8AY2ox+ovxPQcHAuzzYqvvmhyVWUw=;
        b=rA6QSa407uza1LkAKnxw4dXreWRObjM3bg9LdNgrsmDH5jygMNdYzgzgylJAMaZmec
         HSBIEwhRjtz9YhBJnWCOnwcx/fIJORQdM5y9Pk1OjGnJPXM1Jr9G5SLPR6D+6QN6+7bP
         d3supdRGSbCP7MVKEe9sgLJkRwqdZcItdzCk1kNJTFzlw4Kwza9rO7a4tnrN2MPGvJeR
         A8LGwNhlScDwfRzsFs1CF5dkO2JaU50FbkzVlYQGSgoL1Yul1NPDbQMLyQ2xZnzQQHJL
         Kc4TpOqESMuEhZh437Z8FLFOJ5bGIkr4dBW/+BbVpdhG2fFNfOlrOCVKP+xgEIBlY0ca
         x0rw==
X-Forwarded-Encrypted: i=1; AJvYcCWOs4JlC5s/XEAZkcePvQ3yYxheup9+ZF8An/x3vONSx8rkT0R5Le9Jl1llHxgSMrx4Jm688Rl3qHSkJywk@vger.kernel.org
X-Gm-Message-State: AOJu0YwvE1uZQC0sZX1b5Cui6I62E/oEW8qZsDL3FJMgfwG1LDaChKMP
	hB8h5ShunOZdzzgqjlbb/gq5tl6chmHzf+t3ZJXtQC+ARnF4T27pDjEm8zh1C//nddA=
X-Gm-Gg: ASbGncudPPSiDkhA/wvd9ZDSXmDUiRQ1/TTS/cHKAXmmbBvaaFDt8IF5juEWMISR1DB
	ajfCqkuIccxlKBiHXHSNYh98kN0VU+4HRrggnTHJuUYcCyVlSmmsSMmlTT/pSMzina010hh/j73
	E1FgoCRvtX0OygDkjlPUV29HUiP0Pj2cbgrrqch+34IiO4QPTXdbV70bdLj+fJAWcS8/h6zFLR2
	LQ4pd+D7loSrhquBaYMRRAcPpeMl2rFtDloPJnXqY3PdQv6jQYC7wNE/fNKApHcWPWhKLUi4M47
	t2Gbn3U4ALdzs2jXJz+zGah++IWN2VSU7Z837DWP3l8ScNq2WbfPpikujkkkvQWJdw1o2KXvQmm
	GRN9sdDpcEWEkxL5K4rwwa2fFMRNq+3uViFnv6p26tOnXMAxj/Qvs7I/fkDX5IGdHf3A4q6esFd
	HrkzUPprb2kie4aRLJH4sIIshZhuSOjTYTwfJvUEJL38ystA==
X-Google-Smtp-Source: AGHT+IHvDD9XJ1vRSH3cXt3DI3SdXcHBMF1NFxrmnD8Bb/1OzLxNUSC4bWEuB+gxH+suooNl8D/8cQ==
X-Received: by 2002:a17:907:1b15:b0:b48:4966:91a5 with SMTP id a640c23a62f3a-b6474439497mr3315552766b.30.1761219615642;
        Thu, 23 Oct 2025 04:40:15 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfbcsm192518066b.56.2025.10.23.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:40:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:39:28 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm6350: Add interconnect support
 to UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v3-3-b68b74e29d35@fairphone.com>
References: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219609; l=1043;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=p95Yod17aguDEQvaEd9jFzyjpv3eP0LhnfZGpsw/x/I=;
 b=287cSFqIZpBinFoMzW/Pd2lFwLD4usbtB6bd6jWXziSDY0JCm4sfCEqMwGA3nCItJX7zjP7Ef
 J91UNtGS+N8CHwYp4HrQfTP5sIo5AzXnJ+P/BwWvV/ljlpPM7o9ijaR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 30e77eca4c02..01977d692755 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1178,6 +1178,13 @@ ufs_mem_hc: ufshc@1d84000 {
 
 			operating-points-v2 = <&ufs_opp_table>;
 
+			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
 			status = "disabled";
 
 			ufs_opp_table: opp-table {

-- 
2.51.1


