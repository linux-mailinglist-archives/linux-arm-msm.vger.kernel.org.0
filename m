Return-Path: <linux-arm-msm+bounces-96659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOyLHLYvsGkShAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:50:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B35F2527C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D516F31A01EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B1D3C342E;
	Tue, 10 Mar 2026 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onYe+7sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCEITXLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488933C3435
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148141; cv=none; b=iYgDIeW5TQmilvv3SVuMWcXXMx6W3veSDg2mrTNaFM1k9fyBz2div4yeF1b0uEE199s5ExISRb/6Icm445EhG170uoNj55YhI3rRsvVLplWXs4PiAB6aGINbqrlArqCIOtGFIyIkt4Tr05X56TqbSdnC4SyO/r8lAobNigvK31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148141; c=relaxed/simple;
	bh=QeCFZ3bTwJHwGsvv/GXvdJmwJSsImDdAiRWiuHZQ6as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m79+itCjbiZ9o7TSW4Q3Ex7sY9+po6iVe0QNMjYy0UhYrZiZjuFzmJuC8iN9+IUyuXGqhTv6UOveUw4PwiiRJzFZeXcGAe4Bt452lMvym8Z/SsrHPlaSqgmNcnw3XiT9L6NH7v2z0tCe3aHLRxdnW39aw1QwQx4WALKrVblQsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onYe+7sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCEITXLz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACagSR3772534
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyzYmJPqeRZ/73Fnp6L+76cfnyvMiUZZHDC06DD7yJk=; b=onYe+7sni3hDEvPT
	WnA7pZgYuqS7NfB2I6kPeYbcKyi0P3BzAtkVn9TVV8T56s6NR5UNI4ik+eAMTUMS
	bz0bcSIQFYawZ051DCqu1ygulxH5t9J6GHn7cu5//C+/F+pHB/lh5UUHJ7ob6phq
	qPm8pbDBak9Be4sUqTln974yJMTfnc+1nPHvVi6zPLmLohnEll1hF9zmksVcFaI0
	ZeTMxDYIq1b6M01NMf2PwEAnFBkAW+Sh2kWaujoDinl76YCes8TdWq5FbYgYUUKR
	cYuUGyKSWi+/r/7iaC/bLSgEJI+D87Odqnoz0mMQFatXUWP0PUCg+pQTIdoEs1W9
	Ca0faA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj15wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd98d96382so36669185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148138; x=1773752938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyzYmJPqeRZ/73Fnp6L+76cfnyvMiUZZHDC06DD7yJk=;
        b=HCEITXLzBaDsIFSkK5z/rW/Re+S8MdoEw2HGs5PvkCdMgGBYY0c/kztMCG7oviuXFi
         +Z21pwhOVOTft3dArHcvjdZcUbl/Hc+0qAxnxAgDyEnyZfJJSwzkN70UT2AluMOYmyqx
         Wa4sRWnJ7wbPVEqbrlJwu+4JsTmPwutVUGv9X7ANfBlstIGUCb8tPhKUPnI8Z6jGGg20
         ytHCpZTqpl/RwdqZ0SFecxdlVgdzcRaS4+SUsKYBhpnXYkkzM5sYUU3IpABShvSiUW44
         6+8Z0/u6voLgf9OXEygXw4KAp+PueoGoY4V9sF2MHPre4F7mxc4jWa5nsEsMUbxAStRX
         9Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148138; x=1773752938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AyzYmJPqeRZ/73Fnp6L+76cfnyvMiUZZHDC06DD7yJk=;
        b=KhjyR/gMuWMPqGDrBYqIqnXmCOL2XJYq2zu9Wb2xBVyN/gjxPxY8GI7gfL++UENeZY
         8vLDaDvLtwRGT3H45BGTeUOgl8F1XoFnGu8DqK0xQHaycxGDVV4UeRJVpQT3GVpMdhH6
         /XSnGSWoS6fB7RgCBdZGD9Ixalx7t4L4Jl+rM02GjNf5VweQwQyxQGibWeE+b6AqDFl9
         Un+v6Xlv77vxfmuuCRuDwebn1gKSLx0toqWbXhS97hRwayaQKaum4aMB+wUhbmui09cd
         E+KpovJfU5Uuw8mFnDurSlL5NBw4hUWt3SbDItMAzAQc3iNjL4QeQtuMoNzxosR+A31Q
         PEvw==
X-Gm-Message-State: AOJu0Yx2EvX72bu8GbsEcaELUYQo2ZD95KC0StjV4LRHzBPMQZ0SV2O8
	UtoMkPbhmPSq522z8leW/YlKDED0+dt2v5vJJvM1LtsIzIbVMIelbxB61tMuBWC4FYXi5pJk8wS
	493nvKIYB4EfLxB9wcrCbdz+cp2g8/jpLiO6PP11tqcZ82znPhS/lC6g2MVsFLMg0qKhzIp2GdS
	80
X-Gm-Gg: ATEYQzzlFGrQExuP/NZ/56kc/Wp1ivztDcqBAkJ2cbAmkFJBvNG+9K7KHfzy1QCld4d
	T5cD8u8P647pVEK6PHXbSh8ZBDDuHuNZnn2YEKqbOM3N5DarwMHwSfqnTc1N4I0/cu5aCp59Zsb
	CiYrUgUaC8Kx2Iby4R2VVXrVQnTxqgcSTrtv86PC9wnMHbHcG/zdrsyhPzWw5tx8Pvuqvr4X1es
	5Hj6E4NhAbYVFNtKfTiLREkUwjlYiUufmgojI4KuCyG03P4rEcBpuYO/A17gANsbkMdnDsiWwT/
	aPy0wHQhbp03O3FiRfeZK7WZht1LnA0/zctdkU59gj/Lst7UgJnlAdOWWoO4RWuxstkwbGg9qTN
	zyCnJD2lj7X+dya9lbT/kgDzqUaofbxr6Iy4G95ydElCa
X-Received: by 2002:a05:620a:4482:b0:8cd:8fb7:7aee with SMTP id af79cd13be357-8cd8fb77f79mr562739085a.4.1773148138203;
        Tue, 10 Mar 2026 06:08:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:8cd:8fb7:7aee with SMTP id af79cd13be357-8cd8fb77f79mr562734385a.4.1773148137692;
        Tue, 10 Mar 2026 06:08:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm99472385e9.9.2026.03.10.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:08:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:45 +0100
Subject: [PATCH RESEND 2/5] arm64: dts: qcom: qcs615-ride: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-supplies-v1-2-5071a7052ea9@oss.qualcomm.com>
References: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QeCFZ3bTwJHwGsvv/GXvdJmwJSsImDdAiRWiuHZQ6as=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBfg0yw2Mhqt/oNByZZ2MR0v3suBrDVppbZE+
 L2aO7/Em1GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAX4AAKCRDBN2bmhouD
 1wxdD/0WjxsqE9P+K9xr+PAOcojw/oMiDETNg90hIfnxJQXjgtKat8yutrAg4CKE1Z/Ko6DVh/I
 gHIRGUQ4wj8Lnzr6i9qZeXXq0InkLZ2fhl+Y/JmxF9Ocw8m0C3XIYNS33Cdxnv48K01D0ieTi/Y
 8jRZKphbG4aexjLmmSMjwUD95DeSJ3cdirkshZY5uI3wkqcWzcBSlqFd+3cvykJ+zkaaC7BvRuo
 tJd5PwiqHhrfnItxnP8kPzGU3PgdokxAU0lH4mOg7M/xMaBMdrdssgh2AW+EpRXf+THZx1/VsA1
 Dr6dNIkDHaCcykOfaABfIxhc9j5wRUQ9qX8Tf7ckjwG9FaYytcg+stdgt/+hi7u2wxIwfZJ1uUY
 9OSfF1ishXpWTfVyGx+hMFlkeO3mtrZX1HQnW6a/8gSlqml07It4OWpJI/Z3ONqxS5AJHY+LUUr
 53f2eAqiTfcFaEOTBx+nqOKfTrSporPV5BObln9kxw+GDoo0rWqKKqbc0b8lPXzZLmS5vHQwn2a
 TjfLFXvP51NBfSB4u4i3QAU4VbSRfFAnwiYHWmahHrDxX5Ar+NMhbDE0WpsvhsdkJwJZpWwWR0l
 jneqBLnDzcVMcWyf+5pMZrWa3A8HXWqIyW1AZ3idSMWgSXPaB8lLQ/6PXGgZ7ioii2oBnSkEpBh
 PoapRmtKaNDuphQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b017eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-3cLnZj8YNrZoULhp2sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: dTjagHhUaumk--_IoUlSawGhzkrXIXTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX6F9Hl1Ln3J6m
 RdWLOdN/a5ZImAfCVJQUBfo+hBsg6cWAlaFMy/nnCD0IQGiEAmnEvmzISuMo8tYTu2UCvge3fI9
 lEJmZLeJbtPkxTT63pIK/rpH2yZttIcTzGlnvFnEXRobS0PIpPQ2nlSYFM8lbwMUH9sqMlEwdm3
 RxQXpw3Du2wyWFyUERAhLV+MfOKoNNk4ah0bToQJ4F50U8LRPT6BVkuFlxvYm4CzETsds4jbWdW
 xetEFWhTFu09OO4fZlERR5hgXm2uDBeo1bWu1YiShjNLpWhm71TniyUU3zeFYNh1SkUVso3eE41
 cEACtb6rFvUuGljs0c53egEf4NLn8o1e63uVURSKjwbH+tzeKkZzOBdXyvzXCuoHGEEBiFpJ1OY
 gL2Fm/7VcnvehfibCZ2wCuV3THTh9l0tWUOvuNtoOd9mOphwxuqnI5vkOtKL0d17dLi42mkkc7S
 huplDw+mU0w/9TVD4Mw==
X-Proofpoint-ORIG-GUID: dTjagHhUaumk--_IoUlSawGhzkrXIXTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: 7B35F2527C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96659-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5a24c19c415e..acb16cad6df0 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -91,16 +91,6 @@ regulator-usb2-vbus {
 		regulator-always-on;
 	};
 
-	vreg_12p0: regulator-vreg-12p0 {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_12P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-	};
-
 	vreg_1p0: regulator-vreg-1p0 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_1P0";
@@ -121,8 +111,6 @@ vreg_1p8: regulator-vreg-1p8 {
 		regulator-boot-on;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-
-		vin-supply = <&vreg_5p0>;
 	};
 
 	vreg_3p0: regulator-vreg-3p0 {
@@ -133,20 +121,6 @@ vreg_3p0: regulator-vreg-3p0 {
 		regulator-boot-on;
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-
-		vin-supply = <&vreg_12p0>;
-	};
-
-	vreg_5p0: regulator-vreg-5p0 {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_5P0";
-
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-
-		vin-supply = <&vreg_12p0>;
 	};
 
 	wcn6855-pmu {

-- 
2.51.0


