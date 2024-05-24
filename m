Return-Path: <linux-arm-msm+bounces-20367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AA8CDF26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28BC41F23DA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6F8D51A;
	Fri, 24 May 2024 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPPtpMqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CA21BF53;
	Fri, 24 May 2024 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716513683; cv=none; b=rVhZlWmcq605l8pjHCGMxqkGa8cDmnmFvWbKyqKsw3rB+Ky/2BSJ4VURLc1abbYsC7DLJhQICIqdNfp79K5Wsdhlc4s2KKkRL0RP15RgBhovcVB8dE9bocu2OJ4h9xNtQyGp3kZtIhNPTZh1JOFFqOB8PlAM95bvoIgcZ4mMW10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716513683; c=relaxed/simple;
	bh=NoaOUjbYffG2oVE1+cnE1at9BkX9K3GHUrejZJ+nR1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1ePTSXxJiLNU6F7lHID5WeM4C6TzBthSWFQbdIc4HgKLUyioXZz+lMw3NjA1bWleWnU9rEBv267mH7W4mPPD1tg9RWRWAMnIPOLS4lErBK7KvnwCzT0yV53JiqxTxoElKQitP1Vs51wK5/aNpbkVebliwCVMwoe+i+MJmo+G78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPPtpMqv; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-df4f05e5901so2325839276.0;
        Thu, 23 May 2024 18:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716513681; x=1717118481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxW8siyxw1AYj0VmMo8J0Cm5HJ0SxGgND32Gg2jRRuk=;
        b=CPPtpMqvrk/b0tIp1vfnUwtgIoiWe0zeXbTsZSJ+9Slnb3LjMNnBhE0H+CtuteJYon
         TCnxYB2nCrzcvUHXfdrG/hUGyKsXojsKprjsfWIcMAIabt5qug6CQl3ilnDQluKIPZrL
         3+/V0+uWQo5ADrgoKIIaQp0+wrvdfRrBoG4dt/Cg+jCm8QUF1ISmRxgu8qQ1EEAcRa5L
         zKVa8NHtBQZDV5h+kF6o2eNjVWGVZ26oQvdNgZ8UVBd971WIa4vj4qRF7HqcDbeVJJOK
         XkOUkyW+2R+VG+kDm4YWcQaZ/eswMMWjvQqO/lJ4Qci7bDArj39nvLU61e3sLz0QRB/2
         wi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716513681; x=1717118481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxW8siyxw1AYj0VmMo8J0Cm5HJ0SxGgND32Gg2jRRuk=;
        b=MF3rWDNPEQLO1KqtIuJr4HFwkviZuMTqv+jqZT8XGalks2jPz9sGcS2Dw6BqrwThXi
         YgafMiX0pG+cpNodApYm4JeufD4WufWyvbeRhH29gKpszrhgL8e494RsNwwYEvcCEwTh
         pIOlv7siMVSRAC3LtgIzx05pu8cYdzp1kNALwXuN2zZjb7yzT9RqwMyBjeU4Dar/7KAe
         bfeXnQZ12jO6yMWulBo6t1RIEQSeE8nXmMOcWKQnMRFmpahdvArfeV/+y0skBY+b1NYp
         gLszQwsaclsiw487jYAj7OFwbpEALZ2f98CATxe/GErY+2/DSBWmFuyOEVow77/bCrcb
         VyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbAYg6l9gZ5sfpGKPRXxxsty7g/KQZgPF5NXKAlyE6cktzNJI0WXhiV1E1UM+faNC6od1+TF1n6jmd58ONv5qX13SvNWDeuBZMkfP6GW/fhxqmVZOju+ois39HHo+iVMHBuSoELESmZ3g=
X-Gm-Message-State: AOJu0YyhI4VB4RxE4Tb8OeUYhFDCkdqFxGmX5WyGOZ4tjoEp/eZXV+fm
	VIEA2K4MmpJ8JZoezxGRS2ZOsJ+QSm8nsIPEC70NJRtvxfw88ep8
X-Google-Smtp-Source: AGHT+IGtKfQ34xgOCE+DPD1gQTyODdr6YwdHpmwMVlQe6TuP7MiHQ1A8OYo4jvzI7zHzvNdn9o4Wog==
X-Received: by 2002:a25:ae1e:0:b0:df4:df14:61bc with SMTP id 3f1490d57ef6-df7721b7236mr992243276.29.1716513680910;
        Thu, 23 May 2024 18:21:20 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac070f05d5sm2253716d6.50.2024.05.23.18.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 18:21:20 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670: add smem region
Date: Thu, 23 May 2024 21:20:27 -0400
Message-ID: <20240524012023.318965-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524012023.318965-5-mailingradian@gmail.com>
References: <20240524012023.318965-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shared memory region is used for information about the SoC and
communication with remote processors. Add the smem region for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 80e81c4233b3..187c6698835d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -509,6 +509,18 @@ aop_cmd_db_mem: aop-cmd-db-mem@85fe0000 {
 			no-map;
 		};
 
+		smem@86000000 {
+			compatible = "qcom,smem";
+			reg = <0 0x86000000 0 0x200000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tz_mem: tz@86200000 {
+			reg = <0 0x86200000 0 0x2d00000>;
+			no-map;
+		};
+
 		camera_mem: camera-mem@8ab00000 {
 			reg = <0 0x8ab00000 0 0x500000>;
 			no-map;
@@ -1139,6 +1151,12 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0 0x01f40000 0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
 		tlmm: pinctrl@3400000 {
 			compatible = "qcom,sdm670-tlmm";
 			reg = <0 0x03400000 0 0xc00000>;
-- 
2.45.1


