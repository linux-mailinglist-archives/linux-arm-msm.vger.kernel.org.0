Return-Path: <linux-arm-msm+bounces-51390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC26A60CF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF1283BC38F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C126D1EF389;
	Fri, 14 Mar 2025 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sAEJ9drg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C41CB31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943839; cv=none; b=QblW3DHK/+N8xHlyia36vWJ0m2XidrULfmOwgPNpp658MAPaVMCkLFuUV/68j69kypLYXM4Q7k3w+JGSf692CXarZDRKTa0sHfDJeCgd00WnKWqVbxprXGxtK3YfYItwXeWdS1M9OIxNeKXeqV25MP0yZdNoaDyyJz7eYPcwa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943839; c=relaxed/simple;
	bh=TQql/7bvMiWWTcBiokJKn28h+W+qXYbOIZNvdiAC8+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKSdfbZ1Wyv1v9j2x5GhO4PukwxpX7xt8ZCEpLktFmRYMLdLsMEGJ5Y8/nUy13jQuppfMhP1TA5Iv6gZmaCshFiFZVH6pGS48CVC03AgGK6E0WkIjoDuHDExRknfMOdx9l+6IgF4m0gbgU2F3tUZHqPVE9K0DQgidysPFHsZLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sAEJ9drg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abec8b750ebso319062066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741943836; x=1742548636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EnUUGo2HHQ13RN1/OtPiMt5tSoeJymaCLmfHSf2tq8=;
        b=sAEJ9drgHr3+wBROICba5S4zJQg7ZAo5X311awjDLWBZqkJ9xirCzZjA5gdnNP6/+P
         UQtsEDta5CT3KR9OtozNCTvlAeTbGMVZPh8U5u+BZoe2P4r86KNnzjKADf8O8hcBPbLE
         VTOT10nm/AHDuqa/DNuwBjBYkt5YRjONTvWO9UNkvMmBqZ0iErAnYqobv9AfMdP427FF
         RacKPpMYj4Lx6T8sEMBU4dTaDdLpKuKwbuaB+cSs4xxcsHRxL6asOBMvwWmU8///r0sI
         nJw7GAVLMkJmW4kph4nx/e3N1IjX4yZ/mOXqcp9L7gjbA1+03T/hhML2zQDEWTwNPuEF
         52uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741943836; x=1742548636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EnUUGo2HHQ13RN1/OtPiMt5tSoeJymaCLmfHSf2tq8=;
        b=gOb8gKvpH/rlXtNX9z/2/eiGd0eRg6zFJFecjbb/ext8AIiIg7dQutbX/1O5IqAAzT
         eBtTzLN6TlNI8iT5yxHRyQ596+Ro/QD4LXNahZqV6+TIWHDMa89j3Oi2dZ+Cgj8FlGpK
         2HPNR/T1QnKzbYe9viMQlA05br/zzA0A3dbhJV707B2GdXzwZdmn22E/KpQhZ667Kmqo
         thI9V1cXXjBrfzVl6vqYlLG2WcM5HtPZ0w59bLhxDjMt0QwXUeWvQ1aeMRyFVOKx3aI0
         dQMAPePRLNTWuebxn6q4A6PMAGdZaAkfVo2K5GBebARA/+ikjsMXfkj/nc25EehtTt75
         CfUA==
X-Forwarded-Encrypted: i=1; AJvYcCXvX+r+qsWahN+pxfx+s+HPM/b1XI5phRYOOZw4TyHiyJHnqdH7hdufThkYkKatdePdS78cr4/Eo2WmBUbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrG+CHo5fBg1n5SlV4pBj9WzIOpbi/eLHwFJE1/sKE7vbubWFG
	Q7JEfCpItR+liWMBMzLmlKnBCf1ai6ovE2x0m+SZQ9rqQG5TqiRwVFQKbAveBKIPBMxXJdOzxRR
	o
X-Gm-Gg: ASbGnct7QV4njj5AvQmkvXYXumjJoOTbyjK9kEwJplI3IBulqj8Hd2VcHzpeJzvdQ+g
	+vkiklcYbnLgweVVVjRg4v0t2CW9+mqIkisFaYgr5mhgQhximnzlE+2R1RuUaW4NzZHMGavjfrc
	NPcsJyIQFFuDVs3vopHBkaSHhQfKeFmctKQ3Y3A5AWSEvQM2iHCRanN+8hWcED4/BGEV4kh/N4A
	B/qyYPNFerrxq1oYEnqWHHz66GjYP90P2Czz58itA0G4gOycqGm9FIzfjJRr8nUGRnTqIB5sKFn
	FwUib1kw2UAgUsuMtVkzvHrlA+MepNTVN5YpUnpRS7b+pk2kSvM7Gw7hKemprgx7ocwmWI1f9XU
	lg+HBsqr969evwBjUGKDgZ81tyCJp
X-Google-Smtp-Source: AGHT+IGROEW2AOW+QYcjTEvqRULVelQ6EYGyR5ofJR2GdD8rWy92xsCBu/twsCMr/ZtxcA4CpFpYHQ==
X-Received: by 2002:a17:906:730b:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ac33018ef75mr189422566b.15.1741943836163;
        Fri, 14 Mar 2025 02:17:16 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm195582166b.29.2025.03.14.02.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:17:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Mar 2025 10:17:04 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add interconnect support to
 UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 77ca8990c7a096f40aab5666da9f69465f59b71e..b26ee8cf66a3f53b6068efdd05ab4347fb175c61 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1175,6 +1175,13 @@ ufs_mem_hc: ufshc@1d84000 {
 
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
2.48.1


