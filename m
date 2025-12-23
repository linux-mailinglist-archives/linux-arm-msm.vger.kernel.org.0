Return-Path: <linux-arm-msm+bounces-86281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BECD8138
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 05:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1720301EFD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 04:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133F21DF271;
	Tue, 23 Dec 2025 04:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LROCrcvE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APKdlv9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849882EDD70
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465320; cv=none; b=LgJpsbL72siEGTYQabod1njOcqtJ+UA7cxTpLDP4d8xAmRiqu8fCUnTIj4POYqUsvbUCNe2Ge8zZQyX+vRsusF4uLbTiJB6hfrknx5gqwDyTAiGGk3OlMsvTnNm7yzSJND6prBzC48IqGXWpbpRuVITrG+Ro89Ar1tLbVaHBzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465320; c=relaxed/simple;
	bh=U4kz/WI7ex0zTWa7x13E4KzWLO7BwMKRODDSPUERHGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUqYQ0iBow1vxgGt2FeRADthWuD9CFiCs2BhEaAWUee2882OWmnP0wDCn0RS1WJum/T2yxV4pqlcklbjq2ZRrx3Wi7HqDhwDlNKPToZCjUjIQiWg9lU+wj1pEWCcgLhHHRIUajaIAfz4ELtk77jAZdkgylMsmNMy4zRwKOx3QAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LROCrcvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APKdlv9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMJua521630789
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUtvOLgI8VADR2HWEqnoHpAakK7NMYMNB6v4bks4w4s=; b=LROCrcvEO5VYVGWD
	g+8k5tD//9PqZC2E4mEVBNJLNrbq5R0Es5mnJf2KPfqyaP/LviW7VJHEIbwWd6dY
	YH5oQdoUfTEfLrZNPIS213ibxbj9FFN5pnb2L1XBj7VvZ1/ArURkRU0Ku4G/B3ZG
	OCJ+M1gieNOwFb6dHv3b5n3LadPixZOj5nOhSqg1wFhB4MHaWrpqPkQcvlzk4ivD
	PDEm+lm79GBDxiPk9TS5SQLI0e/gXGQhbbU5QhRSADB5tVtVoNU/oACHeIjYkSv2
	BbbSxDofrK1YrBRTYlYnGarEuS81m74hJGGttsyUeutwhkkvl34xzJnR1J+RLpwk
	ygMqiQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8hbq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:48:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f29ae883bso66933505ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 20:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766465317; x=1767070117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUtvOLgI8VADR2HWEqnoHpAakK7NMYMNB6v4bks4w4s=;
        b=APKdlv9yCzNGKjGxaSQapvWchRfgkttEiujfazCh5UT0WKbUAKxsmJSsNHJOWFcV35
         ov+nvsfT3SxwwrHSQXW7yfA58Pv507K6pGeDPPY3sRxUSfjUdTjV23aM2+UqMaiW1hN8
         HqHP13zfWgA9iFQVClAgKuGPwzWlNyKH21EYOjWnA8mXYSVv77AMz87vcsF+ej06Yyv0
         3zcrG51CYeF8DtHupiXOnSjE4bCmu+j6jLUK9wF0ZPbq/kdrm4Xw5yRyTzNMlb9hNglA
         +LI6AX/bchC/oENF2+LqjBUg//mi7N6i5zgMv9s+Ym0/TXnqxmAW4M2qF9Afz3PIisb5
         zRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766465317; x=1767070117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUtvOLgI8VADR2HWEqnoHpAakK7NMYMNB6v4bks4w4s=;
        b=lsxbJ7O18RhALs/biJPeyjdkA/ETjnhSvOOdtNEZoRbJOcJHGCkq4Vj2VKFdQIps6E
         zrBBBfK5aCKk+rOVJiN8eB3+a57FuEpKFpnMy+0BGAJfUT4Pfmyez6/ugPiz6P/Jp3cq
         /KrCs6pBEQqSOC9af446Oay4QtVSUWSi32oTvr8DKU+GmZoN/2EKqOdb4SmsgOZGSe43
         iYrNgFoNlXdaM43hCUObuNRgpAGkuAcwOtTAUM9nQM1fucu0bfoGl18F+GwJKwQQ909k
         aGk0p/52MEu94f/9cD7qdxCOicxHgsTirtqU9L7lY9dGmUL6otGkaKsgZMFUMvUcts1P
         OtLw==
X-Gm-Message-State: AOJu0YwybWY3750vdMKlZ+dzrCd01fPLPykk+Udc4KMMttPk3FM0kT8i
	cMhFcqhWmoloP/bt2dlkkTkmAVxHxTUZb8HGEf2r7O4pPXFbLPakor1XbixPBowHrThB2vobzgm
	7eKRkRMKo1O28x99HF4Cx6ck4vr69viE1JMToqkTJTqHD0yiLF9VXpB4+tt9oQXRZRJR3
X-Gm-Gg: AY/fxX4711u5CM1MEeRbcqd8hG5vV0hDsT1ny/+MLF0Pgx4uWuyrFUCByRVCIsjquFb
	4qOVB4VRG5uuBQLDOqdb4VyOWRS8X32r/DqLBhLBm1RTREMR+m3OMabhwlEABG3/5OnwNwZNpRQ
	UN2tAcpz9aPvAuVuEj0ORiQe0Ubdpyfhu3wrGuLp1bPIHRJYw2n1uh0azKgvpVxcSKlJ3bvhmce
	d9EK5e/IlGbsrsrDfnQ8vcXX+njODp+n4RPGu3iXK+dDyV93NXgkm+P57ykLaP14RzCzJNMqbo2
	xud8KAlHOxcM33Jok3eBjZ/OWGQE1rdodDgheb0Fw70ukFvTPTj9ip+rCVJgb4h3XkTWgc4eULt
	dnxc13XuEy6OVlY6UEPA8GffXyWkF7rhJ3eY=
X-Received: by 2002:a17:902:c94f:b0:29e:9387:f2b0 with SMTP id d9443c01a7336-2a2f2830fe5mr133218025ad.39.1766465317325;
        Mon, 22 Dec 2025 20:48:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVN9kuwMed0f8FNMLreINap0En5aXmVnVdLd+nilxG5HS7NLNW+IoiyeWanK8Zhir+tMyqHQ==
X-Received: by 2002:a17:902:c94f:b0:29e:9387:f2b0 with SMTP id d9443c01a7336-2a2f2830fe5mr133217805ad.39.1766465316867;
        Mon, 22 Dec 2025 20:48:36 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm111316245ad.42.2025.12.22.20.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 20:48:36 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:18:15 +0530
Subject: [PATCH v4 1/2] dt-bindings: crypto: qcom,prng: document x1e80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-trng_dt_binding_x1e80100-v4-1-5bfe781f9c7b@oss.qualcomm.com>
References: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
In-Reply-To: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766465308; l=832;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=U4kz/WI7ex0zTWa7x13E4KzWLO7BwMKRODDSPUERHGk=;
 b=3PjJp7uIY8LDmIc+gkpqgUELY8d6T2lLNLhZ3mShzzOnVE1VFJUbQRGS1nSQxYOYfL4ZbXPdZ
 mF+b1uyrvI3CAa65DfWrvH5roIEE//bbbc8TNYBh4Jx0us7/ZnLa/fD
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: 8fAfBzip9v3W7T8BNkqNRbthRb-c9fFW
X-Proofpoint-GUID: 8fAfBzip9v3W7T8BNkqNRbthRb-c9fFW
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a1f25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-yDIlTExAMyGpBI_tPkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAzOCBTYWx0ZWRfX0CAizQanOGZK
 e6Mkx61VJ0mJRqi72IQluqJwJOTkYm1CyM31tAHjVjYqjl/ddJf4xvUGkiajO3bIRIK3BNfjhPG
 2giCrt3N0A1tI9FWSjvZg3kpJUGoiFNh2+ePsSQIKCWSiU78ntYpJxpJypV9H9Vf/jNFdaSlJTy
 3zwn23cVJNjZcy4au0MGHyyWzqm+c52k48EMa48j6gYSCpxlQKSQXclrdHyVqZ2ZQ4TltT+fplQ
 wPnwlTGGPmBLa0UEiJIdQsthU1KnLSsS4S9LxEzibYJF9joQaIzljlYvMUFv8rQyscutVF79qKA
 2JZLR0ndlnbIThhp4XpBlEDixyVmz/iV4texmhUXV0+1+Buk2ynSDkSLySRDdI5nFq4jXT/GOVf
 Y+/GG9ALPJ1yxUnLez5CMewSPELve1+vzJFhv6IGnLNMyVMMQr0n/lsMi5vFXC6kRmUQa3FKh4g
 lSYCFTpgM5fu/9GNsmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230038

Document x1e80100 compatible for the True Random Number Generator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 597441d94cf1..ef8831ff2273 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sm8550-trng
               - qcom,sm8650-trng
               - qcom,sm8750-trng
+              - qcom,x1e80100-trng
           - const: qcom,trng
 
   reg:

-- 
2.34.1


