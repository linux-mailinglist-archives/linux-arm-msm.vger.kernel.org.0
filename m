Return-Path: <linux-arm-msm+bounces-80472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D315C36D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A30B4EA8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 16:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691AB338925;
	Wed,  5 Nov 2025 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/tK9eKu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDZXS1UY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC6333431
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361205; cv=none; b=FALf3wAlzrrJLOzr/Hv3zedmz4mac7qY3c++jQYo7INL83N7qmc/DDNFymm5KVawDLrPXVat+5TgHOslaFPq5LTcVYEqbmXjZ7jp812oNGBCur6samU4wYjAXjhPzfIivgeJNAjp5ONDBsBD0v4i66YzY7IjH0D6P2xV1x90C3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361205; c=relaxed/simple;
	bh=ya263B/ZSqT4MVjFdASA/QB9AUBc/m4QKS8TyGIHwqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYi3779kMJ+bIit6yjgetiOSOrxh7C2G3elGhS6HNRNyIl5yHiK9xgpLIaf2QNG2XZ/lLf2I8hdi4cxB+R3R9yoMtrZGTCRREYCeFoAMxa8ABLXZ2JPBpp8Jd9zIC5g7FE21iKPB7ETfPT0d/l28ZWKglLIdsXIhSohoFim+NTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/tK9eKu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDZXS1UY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5B31HO655017
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 16:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=; b=B/tK9eKudBTYKxsy
	GSJZazGbThxCm0WBUyndiev8r4z8jhWTP6pW/IYl9tjJfGSmqnqnrC4k47IXzLXl
	+qDshDQgToQnMCynZBISGfRPxSD2uk6HT3k74Sg7afo3L3xNpnh6QWoKyywu6bXS
	5eOXUnMRsIaGHJvoiYeWCsioEgID57sVhjJa4vBj2FJiNmYb4CSyW4wsymx/EFxy
	5GqdKKpGEH6N8XfqqlN1LRcP1TF0lWgXH0IVu3CtezCclvXytndKe0Q5O6DimzBx
	NaOGNCDGD00BUWdOoSFX/z4tVcp5K5u7jL7dhHNbv6rpsdanuHKkGc4mpjOroNWN
	ok3T8Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a85c8gxrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 16:46:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso71377a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762361202; x=1762966002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=;
        b=LDZXS1UYx5dTTJwqrpcBnvEXMxkUXDdSAHe7o7l8en6vr8J7EnbMk3nZMeQq9uD3Zy
         i2PvI43JkETF+yb/Dblosm52nwdhfUjRW8X0uK2fftv98BA+nFDZGrxe/BiIpbl/3ItX
         ETGTxpMaaXRFf479dJveoAf4aVeINz/XEpH0ttGUBK+xhlK49HhdIBHH0rvxjyfcWokG
         jungL29jkHLlU2y9JhV/oUasPe2vXIoiqmus2S7tv48GlFX2oe/TX7X8HXQ9SmjCUY3u
         NwQmoWhAfFJc+rGih61aj72nA89YYbRG9iE6k8bTpJMujxJNYPlc8IghBkb3hngv0QWM
         11/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361202; x=1762966002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=;
        b=gtMmBrumvhtD/KFbwSCBUx9FQC18icuNbn+/ZuaskATYqTbheiblOSmACuDlDSK3K/
         jgGiPdpK1SjByk5WfGWYGsXFk/zjYmLX7rpqqe+APPwWYyWXaRk7288WsFAwCt/R23cR
         EN7Ah3qEZTZJOJCaxOmdDtLNzsnkh6HUsacWgDV1ywWtY4VBT44Lt5J8bhhxjN4Hs2IF
         Od0BmzOblf0wuPYnU60ICNVTs/bPR/ynb16wJgWWttH8j0mouhCyzuJ/xAOqGqO84okK
         Z7WKq0N/4oWMmhAi14GXc9dtJ+4W8xC2mDuqKiVLDOAfeTMquoEWh+C/J3WbL5IHcGJP
         8/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWUoYbu0npqjlajECI/+YK6KZtYrS0W1GypDC5up2TrJh6MMgdZ9f00Qs0ngK1+HfjPocWT5/eqefGMOURi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5PaW8y0JFMsJFDagaTutNs11DtzcijE7LQvrKVWnoMXtJlfC
	8JUmxCSZAonDzJHAOSDtqX91IIGDqbBnN2f3WD7WTjDGX/Mln4hcf5LAgV8aSWg8pXA/gooya0E
	u0QT4hN1WbdnXfi6POMuuvURL3I0Zc22UW9ym/z1PzMyRTp05vHalaGs5t2iak6xFzHVL
X-Gm-Gg: ASbGncu6R1FaDoOqp7Ll32oSKldEofOui1WZbOLDG18z0P4e/z4jNb/9YJWmLO7weZa
	8zl7d2v5r4TolP4WCzNMPVD/HpNsaxmX5FcoEyyNJ05K2bWKmlmMVc1sFhBNBPQRyg4YUARZq2G
	f+T65A9JpS1OFhX4ewhNKxKlieaHKZ3Sc6KXrwNXerwCZt5jvVAiVIwAnaHuBwXzYez0snx3N2g
	su5bY2kuRTkChekSxl3dp6Mwm9jkr40by7J09DmtbdntVWEUv/GkhDYq8XRaN1eyMjbdEs14WI+
	apkwW2Jl9VZ+Sb4Inka2hWvTFfdtlmusBezkzOgD7CelIwyGeHk4mKyoMwVhyhAk4oBTB2LjOi1
	TgQtlB8brjy4LLGK3O+uc8kI=
X-Received: by 2002:a17:90b:4c4e:b0:340:d1b5:bfda with SMTP id 98e67ed59e1d1-341a6c1e216mr4653692a91.3.1762361201667;
        Wed, 05 Nov 2025 08:46:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPMHWdFNyWZRvVuGCjzCiFHWvN7Lxhr/hcgMjghCYGwwHQXJqqOAm/zVy06oneEFZN1o9qQA==
X-Received: by 2002:a17:90b:4c4e:b0:340:d1b5:bfda with SMTP id 98e67ed59e1d1-341a6c1e216mr4653661a91.3.1762361201169;
        Wed, 05 Nov 2025 08:46:41 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:46:40 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:49 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-5-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ya263B/ZSqT4MVjFdASA/QB9AUBc/m4QKS8TyGIHwqI=;
 b=llOeky1gtFuawhG9bs+RtN9AJEm5cGH54p+7rKBb4K2jSRLfFXnSsDFNa7H/0GucTQiOl1U8O
 TqCKRb3pmwlBVep2hTZjSzoGPxup8rkI0zoDUg+2wlrR6CpvDwnbTIg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 0nIv7PlSubgg1dqrcUjVkbk9kYlfDEyJ
X-Proofpoint-GUID: 0nIv7PlSubgg1dqrcUjVkbk9kYlfDEyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMCBTYWx0ZWRfXzpdlVNL4+fqP
 yGO14JxgnYBcAmPcVpi72Fy2YTGr2uhoFUt4urgZIG45wQ86BK38NVk3dtEDd6nK1uJaPqPmUVM
 CYRTZAgiXD9z/GyHQIJd52xDaDfUREryHpyuyPMaIdOHhJKl30DFL7uC3LrOKaiQWEjcnVd6GMn
 tTsZRgfRG0SYjpb3IECpxMfZdOtMt94oEeNCRc1/E5jGt+JKn9pQa+xH0owOjMY4Ix7mLsvdcLX
 kv6HoS0+FQVcqC0ZRT3XeaaVcqrGXZkj3hXB9C9VVxekyiXxdGAZ7kDozfGx/Mj9uuRoZBHPnQE
 MrEnFB6wh5yIIwfzqAmsQYGjk0Ac1ELMTqhvLoHlaw7isr9nSP5USKWM9cNibAXZjHYMJTDTtKj
 1ktkRguabt3LCIa8HmCT+huyM+AYsw==
X-Authority-Analysis: v=2.4 cv=apS/yCZV c=1 sm=1 tr=0 ts=690b7f72 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050130

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..8fb7d1fc6d563288288d24eb5d8288e7748f2c16 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0


