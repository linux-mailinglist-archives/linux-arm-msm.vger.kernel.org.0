Return-Path: <linux-arm-msm+bounces-55704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 315EEA9CFF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51A271BC3774
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 17:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5727421A952;
	Fri, 25 Apr 2025 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcyWkx4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5F219312
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603244; cv=none; b=Qw/0oFzs9jVkQcWz+MJLpClqXkppgAJTBYi4apoJXZurdb26MoSKeMhlCvvdCQbN5pLesAttx6MtShldogpZCS5AKm0erVHxSIU/00G5jA6gob/Qp+V4Pf/n7grgBSUlaksDtVN9+CZMTpmoi6qSagOlGVP2xndt6l5Fu+l72iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603244; c=relaxed/simple;
	bh=5HBnCldiWHLrXedPtP0eh7tSY9v0q49sDGZQ3m9ia6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/BIqsDuMnpDLX9x/ohDMZch/m6rUnv0gDGnOdlB1nDj45UDwZKeAypm5AWe1Xb1j8bnj9bTV8HSoY9JXOKJFvadg5rS2/U0J1gnvXIHHngseYY4+A4kvDqZvrpU+RK37aeS5Ks39xmYBHtfF6YkaeuUF/ia7yliMvB1ZBl5Dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcyWkx4X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK1tP021809
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=; b=AcyWkx4XzeiO9Il9
	s1j7pEUeaWfbuMvXnAv7+p97vGZvhiFH26iQhomeGjdvS+C6FMY5DSjJUFG/gf+a
	/j3tD0G5POLIfguBs/Pp1urdT50p9cubuycbsDMTobosEzzHIItHdF7/4zpyQkn8
	LCTDs4ZyoUUbCbBO5VYjKCgaazrnqJzBJc7yPF4lQd5fzCBdKMBcB4w0vBEoPClk
	Ya5/TuFbjyRv0MNAHeSzgbI6lp+nsdlTYySfV7n/VvVyNkwkJPCAuYLjjTFKa+fR
	TVbap5Tttx/tH3i4oAAswkXJQUMHo1tsIBgCDEEXnP+5jQux8dlUH/Ksg8lowWq7
	2Enyyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5hxag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 17:47:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e9f6e00so577174385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603241; x=1746208041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=;
        b=o1rqbusk4mZ04ce3HnTxiBKXhCYktR1JjTUin/mIhvmsE5/eMM8unYoMusfQ3aq2bF
         v+zMIU7jQaMWB5xOWZau7/YnOkTKM+pbUMnZCJ2bD2clQDQ5xzoFO+NyjO9xSmvFUiZ9
         aYfLUuKawxsru2S2+Rr3LczEnf/JhHmbydcgca/pdifxYdtiV97fVSPH75iRf/Mg9jjC
         0kl9wubZpMXwHe0Q1HO9qKZrStP/G5JFJZIUXFbNY5kmzsJ/+UURsdy8WPN1x81ptMd5
         lGFUxrR8Dp6yS8nAOtYgXRLLaSm30Wr3VH5EDDDNrKYap+/92IONzNaU6R/Ag35LPZM8
         YJzA==
X-Gm-Message-State: AOJu0YzjGVS9tlc8muvwqiumBuA/vjPZRwhkuG7953leSyEZAJrVO0KW
	H4Hkqy8WeRKbEnfx0xIVVlmoM5olyv6nsIlHUfkagmk0BAG4yEF9VZYPnodIhMp00a+PvuY6r1h
	6sv6JPJF+btEhRVJsbo094vUp66cdPJ7DZRNkLxy60+1VV7uosS8r9MErSkB7r7Cq
X-Gm-Gg: ASbGncswg/kwVfiGcdv82oI2QKW/4e89CqDlm+RGofpgHl+/UsxA2lCg7oclMknkGyD
	kdehBUje9jsVujJJSiT1c1/HxI+5KcAxv2CcWaWnWDPhmzzKAllPtpQEVpcpv14cpip5IKSweDr
	4z4SW2VKWSmOmP564Cyo3IfryuX4MiTT4zieh5iiWyrf77tgR4Ts/KMc6Hbp9so+RA425qo3fEV
	vZ47WHx8ND4RFEG6OkH37KDU7rBoJcwBZHQMxgvVJGIVgQF2EkBfSSptmC9ugKtTq09kKFPJbjz
	nkRmf0xYxMf/MOZslQLPkZaQ/qqnVTzrd3j3RxyiBwKsPKNNG/0Zr8ALW5QQjkgG30683fsHziZ
	tUj5JfAGZHpMtsA71PP3QPVOi
X-Received: by 2002:a05:620a:40ce:b0:7c9:230f:904a with SMTP id af79cd13be357-7c9585e1f74mr1027151985a.14.1745603240705;
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF1OMILgqcMRBKDsI/gW82SYrhxky6zn26t5qp8XKhWVFRLacJKvCEjJhdpZqwtvrIl/ynpw==
X-Received: by 2002:a05:620a:40ce:b0:7c9:230f:904a with SMTP id af79cd13be357-7c9585e1f74mr1027146085a.14.1745603240078;
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:06 +0300
Subject: [PATCH v3 06/11] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5HBnCldiWHLrXedPtP0eh7tSY9v0q49sDGZQ3m9ia6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaZmynFljv4w6xMUGoHpAJkHDp5672WeqRE
 D/14aaybTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1emIB/9l333ri39KxaMB53NlK1gyiMEjNLjnvFIEVAJxwCwhtYdqBrZgFgdToNy+ycpYzSTWq4l
 IRh4/aSli9s1i3reS7uGeOsM8lHpmTe18zlJwK92JCc5eT1D0H28FllNZYWXMidVH7JlUGSC5pU
 rRaSs1t0EtnDzl7gYiG/7gpPXz58ty0JN9u7elZHKCL8gAdKuMJCBlk9vgVG2NuAJqWPik9Egfi
 nVIKXQDYpmMGwVIcGHMTVcGLSE+s1YeM1UTTbiJSIwtdC/BbF1yTP67odyyWSIgC0MvqKd1MA8R
 kyrk6t+l50g3VsJ1Alv3LqrJx2BuIW0f2zm6MfDFmGyj6vkl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX4VdgOSd6F1kz yoQSigUH17VNmXp++N7mnEzfSkIQdl/HV0mjL8ozMyIsanP4bcJjPI63r6SmoeMcuBuGgvcOi6C zcmq6T0jw99p1dyT4Gle3PVSC/k1B4/fueeltSb5+DjkmH053aaXPoGbaUrbhdJCITzKmtJL/1l
 Wf1ts4yhauLPxh8qSleux2uUESx+TDY+5M6+UAzgh7XuwExQzb5eeEmpXtc4EOD5dEJqd3sjHbH aZQxBdno5eIy7WJ3x0Sp6gUb0P7jYK0GpyaqV9pWqbThFUaZZoqy4niXMAvTekpb6zWzOak8MCm +YpTGQEVrl1nsAwhhFfUO/OOni1J9k9Kqi14HYDRKjOgFqUEpQOy3zf0faMWRPSzUmGoa6Tu0wa
 CPQ+D/vrp9R/Mv2FgBIkVSxreK+sTNK2phfHqsqhOsmHrhmEXFas0o2sWooMrrVgDUmvDtAm
X-Proofpoint-GUID: _uFS9LOroFPG0xy5_yWDZK2qodUkwZ2L
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bcaa9 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kFHV7R2MqMk9-nUzAmsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _uFS9LOroFPG0xy5_yWDZK2qodUkwZ2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

As most other CoreSight devices the replicator can use either of the
optional clocks. Document those optional clocks in the schema.
Additionally document the one-off case of Zynq-7000 platforms which uses
apb_pclk and two additional debug clocks.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,19 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [apb_pclk, atclk]
+      - items: # Zynq-700
+          - const: apb_pclk
+          - const: dbg_trc
+          - const: dbg_apb
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5


