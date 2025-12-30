Return-Path: <linux-arm-msm+bounces-87007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D69CEA572
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A84813050CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 17:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E40C32B9A4;
	Tue, 30 Dec 2025 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUOLxKkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5trDnpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B242E32B989
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116343; cv=none; b=fWINcBP76SEgR/Hwy//k/Q/rVkkyTaOESNzl9LkXOSk2yW5ZwcASMGG/JiqFmqbTwU9+7qTK72nDvRr5GrBRzgclPVO7S9SSWJHiPgU9JOyfG90qGWwboevBICIRXHT1+jY4AlEBp2hPbcf4xWS/jA1cU6RJpd/YhYy/8JFr/DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116343; c=relaxed/simple;
	bh=ct1orlHuevH9HG/+pLvUirRHI2pkY03TYbZBiXIZqYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YtzAN+LtKw+D13AzFoNwXjCNZXG1UjwneDaNERe4CUVemSGndGbGqTRtrlKF1S7nrxcJlsBdud0OIlNQAJaZ87M8oiN6BLdEpbibnys0o2WpeNUY6zJ4S8Ld2zp/uw6lQrz+JxEVw0pgs+hd5nZoaw5AdkxQZspYh3nljWAucQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUOLxKkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5trDnpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9umAR1751668
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BpUds3aWQH6EBO3XZtfqQOdzwrf7ZAJB59/4giqyUU=; b=dUOLxKkb5KvSbG8V
	mRDFQTF7jUkrQe7e4bRJ6b9mXbSm1Zy9bDe9d59+A1dUcyK7SzbBSkl2sG5dApna
	exCekB4CKdKvBxCJy+9OKiegzRG9V0gzPn+lU8kJ3z8LxEoC8fDr468E7+ropbGH
	2OAlli1zdmmMq6cFgEu8x8GxAHUTruMw1Y0wb614hVoixN+0fgrUs6XhxHaXRozJ
	CmGhFC97PD9ea+bvURWQSwPS7s1I0gHQb3gMGK5CRkdjR1oPTpEYKxsVG21FCk/H
	soY9i6IDNABsUitrkGf/mUR1BRYgVHUCryCARcOzuOqHyr41lisLUnBefeLBFHnb
	HaDhDw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0sgthyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:39:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so19541731b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767116339; x=1767721139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BpUds3aWQH6EBO3XZtfqQOdzwrf7ZAJB59/4giqyUU=;
        b=i5trDnpQBZalqlLdksZ4A/My6xS1hxNxtSOq4UU62RyBMEGbxaZnu9SscYWbvTkGqe
         FNIIAjFi63tiEtwYKjYwDAef0qrDhrDx3fyGtUCiGNSK7+7T5qAJ+PxgYjB2+WUatMKz
         CkWC3MX1cSsoT/wZKNiZaWy4/6fr2Jy6bvmCdX+cqS6Q/BIHZLJAA5/we1x4rRMS/IWL
         HSQ0ojyhyX93slsz/o4t3iNILJY4qwHLkPnRzubkdgmkOgnyMqku7+xThnOoiUlnZn7j
         PBTV/1bx5uRfQHjyp/Oz1sfR6wJ6xy5ctqRGGnXF/0SvNr7cJ2lUamob5RE2v6zR0GKl
         Mvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116339; x=1767721139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0BpUds3aWQH6EBO3XZtfqQOdzwrf7ZAJB59/4giqyUU=;
        b=mZKVnsSJhdKR/tmkSZLCz5gD1/O3HKRBSBha6AgrB5kNBKSh1b5RiZNLNzZhlTkA6G
         br2UoVyJ7GYCKcHRoy4YVstioonNwg3/+92KTJdnYepnIbAXu+3vnXgAJdtSZ1Y7z/dx
         aUj0ADqzov2dnT0WCj+vmyAbitMu3uxA9Cs+oFRU3NPj2O7KVeFewXYlu2K1ARkGcta2
         7n/740FPkmarBNz+HNLFTjIilqDKta5xvFDA/xqvtaYsrqaDajxsH7c7l90w6iE/6URI
         tGvB6yrTwjuNXp9HYV7+RZ9K/uuQ/RpeU/tjK7jWgTD2IKF0T1b9V7d/XSSWrzlYqop4
         w2sA==
X-Forwarded-Encrypted: i=1; AJvYcCVt5v+BrgTU1dD2vCYIk7k5yxPI4pItWyd4T/GiDk2BxVoDSG2s6cEYskW+2Me6i5z1yCQEPNd8cwlYPRpa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+r/dgg46beYZ1CkWdOupYJVvAPESBvjntvlk+1UZFmnCLBtt
	iPycgswKhRZEHDLymU3WZvGsW/ApysU/HVWz8fSHkHmK23Hh3z/ywQoRFNlDpf9Y43LRx22eLRA
	O1vVVC1sxNWRAyPlqZcJ2mbcn3X3uWtVnshuT4ISCBXvnj5ds4VRo36+5F59QE3Had9OC
X-Gm-Gg: AY/fxX7Vwo91YrdX62adqg7V+kR5Xbg1/JFt3v3kXldh552L+an760RbnQlm3SOK8zq
	Dbn/PY8K6PhZRc98+62nghrnqFphx5RWrVeFAQ2Rwmwc9D3ogGSb7AilFEQLo2L49IKPNgy2p0L
	1pQm58BJfCuqayxc/Z8cDXwuR80Op8DRTd0o3pO8YB7AdsTutXkCphw3tTt1U1gQcj8MZieAyHb
	IFNXQJSA/mKzgdSxLn1ITuBC4iEUD7df01DVda6JYSZac9zzjizBShVVP7Myt0B4hIqpUj2IAsp
	miHVkH+W+/7g2t3v25t/Oy18l4Hly9a/NJdJ3ysx3n8MSLrIh8cOFHSC9vwDDxMYPEC9YqhYw7M
	KasCPaXvmxWEMYBUO1IMJyYgFI1g9VKV00A==
X-Received: by 2002:a05:6a00:414b:b0:7e8:4471:ae5a with SMTP id d2e1a72fcca58-7ff67456b8fmr32724950b3a.38.1767116339329;
        Tue, 30 Dec 2025 09:38:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEEmO0cWpUOJrtAy/PKVetRST5lKoFqF5dOeQsDS/mZMQ4Gq4b1Ue0MxB56JZ5LwZg9hUxtQ==
X-Received: by 2002:a05:6a00:414b:b0:7e8:4471:ae5a with SMTP id d2e1a72fcca58-7ff67456b8fmr32724921b3a.38.1767116338844;
        Tue, 30 Dec 2025 09:38:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af35f37sm32865208b3a.18.2025.12.30.09.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:38:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 23:08:36 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: hamoa: Extend the gcc input clock
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-ufs_symbol_clk-v1-3-47d46b24c087@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
In-Reply-To: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1OCBTYWx0ZWRfXyctXwu6w17E/
 9waZPOs7Kz7kUDqYLI5XilG767xI5j5CIE9MFFPke9aySsXBpjn+si1QOdTN5k9QIVnmiB3I0oe
 4Eaz6r+cKmZUbHojTrEIbjQI3m9PhZOWB6vTy4xQqarNRWvRUcRZqHzvvNfllbeojBlSysXndfH
 CzNYYpxXN29ZGhBvBEcNkeQl2jR5q/2cfzx9Znnk1A6r9JCIxhhWoEAxmU2Jf6MZo7wRc6wnD6B
 DMY2W+Zd6B6PtBHT6BEGHgU8td3LYvCqQrJfifrtoq5WbPxGNY4acZZ6irEcjGlP/JDHoFxidWi
 sC3bzXkw0G9yobt5HHBXge4VDIsEE60S1e9MKvjVvayegX02YKFvGtp0pkxXTp3flxl6SC8WOj2
 gd92/Vdc9Vl/ABHHsNZNTjgAZig7ZCvNLQN8OUWOXMs2yPGJVbHDyxlE+hMUl6q3/wAz5zIUdKW
 XdJYmyZMd616jKi/Emw==
X-Proofpoint-GUID: gSDAwVczf1iF9stuAvFD3o1M9DZeIeTN
X-Proofpoint-ORIG-GUID: gSDAwVczf1iF9stuAvFD3o1M9DZeIeTN
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=69540e34 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=us8TmX896EGkFYs_XRIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300158

The recent dt-bindings were updated for the missing RX/TX symbol clocks
for UFS.

Extend the existing list to make sure the DT contains the expected
amount of 'clocks' entries.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9c523e1501f9379ee7049c6287e96..21ab6ef61520695d977f9d741ce633cf537171ac 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -834,6 +834,9 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
 				 <0>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;

-- 
2.34.1


