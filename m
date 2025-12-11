Return-Path: <linux-arm-msm+bounces-84966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D95CB4987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 04:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39F373017F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 03:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4581F2B88;
	Thu, 11 Dec 2025 03:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Idw7JlUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="La+uIFgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4B225390
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422323; cv=none; b=MqQSt19tF8L2FQUcKP+Ao50Za6L+yYl+YT6MO4iKKK7KhMe84YHeRbEGp0Q+w5+y8+ijPdSuNF2Z80cHYw66RuHYcTqhZ4NCu9FKSqqtcYDIfP68HPltOn+55ar9BK1Y5hjdfEDBfF17VjwMtihDkUPtxJiWIJpYqTHTO2nm7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422323; c=relaxed/simple;
	bh=PQu0wItBZrUuS/K1W/yh+H8uckkQdIBZbL7HMrihDHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhGlRv2BUD0sdntZ+1dajz7XhtIDdqaXJUBlSNiGjQL/8sv1xUnTYZ1A/0zsTztWNUAzYcOiUqkt7jWP4bhzx4QaNnJHqS519Gth0rsng5PphHgpdtddvuvGKuq+sxoHbq+JDckvqhPV+A9IyIh0vOrVc/3XV5gEKE9imyKxe9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Idw7JlUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=La+uIFgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP3903544188
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=; b=Idw7JlUuP8fkn2ie
	13uPcPuB067Io/Jp00DoPsvG9yNZNeNJRnDcGYSNrXvC9rpPVaB0A0d2sO17BrJk
	l9JYgHSFk8ioCd/ZhUN77KEad3hg9JRlG9GvYKHWYa3cpt+4/J9gFQVUl4j+sLko
	aAfad0GwKVHZuYwNaTAiyiZil6spMo8grvBP6xlY2pPaJDbHcwR72tLLpXni2TEi
	kNy4xsDwsp2b/PjGZSKa0H0YVMJE5QuoXV3GeTygE/JTpvAApn9WnwKSIZbJDkHo
	1IYiXNz9RGGtwu53JWLsLCLkLUFGoR76imRLDENM+UtB/UpvnAWN20t98nWvOFEm
	Z3rYpg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp3x9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:05:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11ddcc9f85eso2488110c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765422320; x=1766027120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=;
        b=La+uIFgRbs4x455Li8XioTyHUcfLVhrVIrECF268pIPKTcbeLDgiGPwfj79KVKuG3L
         k5hIRVEvN3Bfh6CHrYKigIzKAp+zddVIgt/WruYEd8xEKuOre8v19cZxTYOn6XkyNDDJ
         ae/ay/cc4jjEL4H+EcmxxCUghezxKgjFSpK5lTvbXyAbFt/YyLAcsmOb1D7ICy13yZaY
         U01iBysFUdA79+tJ+y6R/8OqNM2PMTarSKOOMo5cP82vgfI9/EJDQo6+ji0bENK2mwsl
         Do7Sk8J49/oFVShqnUzFwCYcYzV2c39hJxGRL47AwuUCP0VLLwtOAnx/JPULfm59ySIf
         zHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422320; x=1766027120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=;
        b=nTJC85vgDbxB2ZyVdL0vpt+YyKS5G7dlplNHIR5EqiW0xxgKhE+K1Y8swAPCNmcVoz
         hMJYUNyy5etyox5bM21NqemYMCYazmOQvN6BSNrQkZUvy8zJesioXXn7IBRsfMKo+Gfr
         6f1IlLlVjTWK7falJIF2y4wn/DC8Ha8+sriBMYL/TRz1M8sntGoXL1ovS3e+D7Ls4tqR
         oZ3qxlUH6F/vf6KrnunobhZk5EZo6dhR94o52zIr8ZrdpJ6JR1HDFoFnizhL5nf01mkM
         /sOYSKddlmQHCi1gUeKcD1Tk1aQNMNa9jhjJhOtgfU3fcqM/tGxEehENnIbUNzOsgXDa
         Xqfw==
X-Forwarded-Encrypted: i=1; AJvYcCWg34EYWYQ4IeiLm1XC9sLw3QJOLaQzaOTeHPVRvhA+cL8edLAMkThur7DhH07n0J9INcMETHVVjH62JF1V@vger.kernel.org
X-Gm-Message-State: AOJu0YxqqqxiYSFddRjIsdU4e54RO1F4Jkj5l9OdcAIph980WzWImxuF
	Cj8aGZtp5kDpGmLID9dqW/wkfLztiBTTJ8uMz/JCnXio+4oapYZtONlLGF4eOL0jxM/JhL4YhHw
	HMOE7QdvWSBGNQ2bT43kMtcmhOFd1WcfO6ghOpK0bgtDVwCUfiw8oTF/JaGwl3q9uwa4jYtetXg
	aXw3I=
X-Gm-Gg: ASbGncsrJCb8ncAS0N3N403qLYStPoluV/2TTpwLR+IWJg7DtW/k6nkc7rqAAOGnxh7
	u361TZD1+vgztebyy6/HfGx/n+pXJ+cME7X+tCUrfvjiN71vqU6uzVaBEdSf4LOc4cGNZ86SpYj
	4vcVWtzFa7Zv429voHiGtCVbPrnRVZwsO8r+Lj45N1QViYXT6uTCxtJ9r0Q5gKUqZVDPJD1767i
	G1j/TzR2X8/eLP4rYtCC2ddhLrD6r8YsH6XiH2IMGGVVAP41c2wf0UaffmyffAoRDaYHeiy6gkx
	kKOuvQUseQFGuaJGH8T8Vm9czVDY48NHej2R+cgyCSXTQvoyVKfVsTqLPRESOVTi9OJljha9Sq7
	BtJdKlYxKgdpOKCnClrGrNNrxfpGIHxfFFKLzWlok279AcE896/uHjwBbb7qC
X-Received: by 2002:a05:7022:f209:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-11f2ee8f558mr499375c88.20.1765422320419;
        Wed, 10 Dec 2025 19:05:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7f/WW2p254Uw16xj+iDA9TyijC3WTJcFCKser1BK+diS+jprU02k//IvFf6q7BW5BquB1lw==
X-Received: by 2002:a05:7022:f209:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-11f2ee8f558mr499346c88.20.1765422319873;
        Wed, 10 Dec 2025 19:05:19 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm3935642c88.12.2025.12.10.19.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 19:05:19 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 19:05:02 -0800
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp-dts-v3-1-8dcd52f055c2@oss.qualcomm.com>
References: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
In-Reply-To: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765422317; l=973;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=PQu0wItBZrUuS/K1W/yh+H8uckkQdIBZbL7HMrihDHY=;
 b=nyirDO7iW+lTDwFTpZV9+9kQkABAQJB5ZHTUCdTbfcpTQAjiTgo0pYjRWmMrzh8MyKViT3c43
 /JBATjehUioBcuOlsAOSvX0aSofmXaUSNke+7nHEQJx7/4xvpNQBAop
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxNiBTYWx0ZWRfX05/s4rhIJY+C
 vnhWQbQvxWAo8dfe/lOZDQ66rs1SdzEOg1j2GRiyqeV21zwCA/nG67WH49RqtwgDiYxFmEG4SYt
 WgnmzSs4JQ81TEIZUD+t3CzJqZTVMjjhMkTeYdj2eC08igwF1b4biK+I0/GjjAO7hL4iaRrnRcJ
 DcRRNWBiBV/niU7x5vI/wj1k64uRwQVgL8w2LyltaBJYAPikgqwznQnPyXzLEFC90Bpsk6ylYNm
 9gAxPbZso5tk+o/2XAGMEWxqjCu3tAype0s+4qrLHdfnmQaeZ2GxGcm1fQM6uFoCIHr1Kq1ckVn
 YL9Khuheouf2gYhuMhwxRufXRipYObhHNzsVb6llMXjm7ZCPWFjphTVZDGOuQzSMvsMK39m6B6N
 pCeDK+ar9hjLU9WV+TMUmgPIU1TS/w==
X-Proofpoint-ORIG-GUID: 2uudOdUb4e93I6P6aA64LNRs9nDrNHI6
X-Proofpoint-GUID: 2uudOdUb4e93I6P6aA64LNRs9nDrNHI6
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693a34f1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8VIqy9Yext5eKz7IjugA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110016

Document the Kaanapali SoC binding and the boards which use it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..da287cc9119b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -327,6 +327,12 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,kaanapali-mtp
+              - qcom,kaanapali-qrd
+          - const: qcom,kaanapali
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.25.1


