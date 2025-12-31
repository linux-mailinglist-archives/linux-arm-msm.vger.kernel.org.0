Return-Path: <linux-arm-msm+bounces-87089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812DCEBC76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71D1A30285F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BBC3191D0;
	Wed, 31 Dec 2025 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnPRuUIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMmpwrXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ECB2D73A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176455; cv=none; b=bFxvD/PjEjw/BhB3LClPu4VxIzvNE+sYMYcqqe29FvKllcvuaFcrhL84JurRN7A/AfEigHRaVQvcZn1nEZthl8sZBsgSB7TkSEQ5NFaus6fr4vBGhGT97AFGmAvcq+h8Zk464Q9qwL4btDRwBUlxwBaAM0MtnvKB2uQTWRgjctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176455; c=relaxed/simple;
	bh=8WR566cU73AzIVvj5nUGmGy2ZK2KG3l1HWVhlpXkS+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHZR28+ImW+QdQzn4hqxrtxdfpEj+0N3Mg9nOH4MN+KS6UyasnD3+k7uoGkGAWGZxTJkb1rYmvtWSXByM1tUTNp95WoxlRlz5BVI+n6B1sDl4721lILcNZJLLflxuyxt6IHoK1BS3kJcEDwAm6YrtQ6yyGxEdf0bL0MET7uhqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnPRuUIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMmpwrXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNE4cm1604863
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xx9aZG8wIa1
	01V/TwxOXidAinRDzq5VmWS/ZoJSBsZg=; b=FnPRuUIT/sj0BxH8oV68peQye6Q
	qQ4NzHhlo4/E3pzlChIrGn7LZiYvAMDNHholCmLDyEsMtroP+6TvrsKoZaIf4NV6
	rHf8sLhWGLikqoARANR2873ZQ+OmdhplGXU/I7rJqm+igzg83Rntd6I6DH04X+vG
	x1dLwtfs3JQrNsOk7l0E1yAAY82sAtcle2xzgZt/Y1tUuU/7S3QJq7Tw2slHoY+a
	xtJjzHqZFnYbELrTgIE9NnthgtEPmiApgBLW7btJeTm27Jq7M11+4sdLjY136bg5
	G221Uo0WKDQVAeHFG9NgCSBdT96EJ2gPqkmlTPgzNZdq63XC0RZqiF+3rrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skm469-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:20:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso21067787a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176452; x=1767781252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xx9aZG8wIa101V/TwxOXidAinRDzq5VmWS/ZoJSBsZg=;
        b=KMmpwrXGFwZqobLbDH67UDrFzFliwXGZHbyRRPGuwMxUCtK/EOoLLkZwHk1p6p+ULk
         fRKcImELatoEuHT4OXeZoMTIjqD0EBIHEkGmqu/kAS4SJIByDCrwx13LXs5zFFkoRz14
         yWf+PTG4tiwBIP2SfHrHc8hTm1TSAB4lFLFVslKJdrJ7i4AooHT3bBrGi7OFoStD5MvC
         aRGpJjYGG9XIuRNSAC4ikoA9KIvY6qfIM2JjNXoYuJ5Boj9FXi2+q9RK1rPqFZ6oYICK
         SuI2QgGXV+0QT3GPvx+j9ZEeIfdVqzy1noO8BAXupfST4vpPt1ITV1lOGHiBl13i1os+
         0UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176452; x=1767781252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xx9aZG8wIa101V/TwxOXidAinRDzq5VmWS/ZoJSBsZg=;
        b=rYx8qx/qZP9DhSHnDw2JHCCqCL3i5KFLAsjYVTPX+t6/CElFkJNZGwgJak0iJn22ty
         VJGDV93zKaAyaUwiGB1Dhcl/FI6Lx5fID0uo0qJH3hUK1fPKKGqYl1/CsGl5SGVT7Jtr
         dGhBVsr5cftlDKvmcLRtQUnu7fNYaPxMtI3msAlptiP5SwV8wZm4zmTCl9IAywkliRWq
         62AgAP2BARoQvn/Y0xEwF/Dxw7kvNEiUCxdp4rJ7xQT46aVtBxMJl15XEBy3DBBPK9qG
         A0HlilJJQ9//f2IvQxE6BRw/s8YmmTJxsZSfceK53SD9+jS5kLINFttutIUJjSM4BiwJ
         MI4Q==
X-Gm-Message-State: AOJu0YwdlzfKonzkH8HNh4zmg5xeJzZ7/ywEIhHJNwikutM7F4WONReC
	lIQTpGaa2IJbfQ59VrNUVw+Hyy14FejGpomiPlluILAzRheO3Y3SOB+ZKD8aRGy6SycQ1pZLhBp
	z4eRgvyVcrVBPj7HbQ1HCGnet5iVqCbUSUfXZCBv5pq4BnC6qr90Wb6IiIZwD8/C4M7MW
X-Gm-Gg: AY/fxX6dTCdinqOFdlBfxzd1+yc/VasvSgX6wCgk/yiMvABORHgMfZJSwLWFN+Z5ZC5
	b4UeNG8+ApF5KtuQnqzNACNPYQOnL2JIuu7aIEks/iFByZc5du4F7c75ZTF7FXufpfENS6+IY2v
	Zp5YnfPkGZzq47mMbgJvPEySwzW2mxeQn/lNO/IBtzkFCq3UVF3OW8Lvv4RvRr0yaL+SHrWtd+r
	TEMDkAFeN6C9KYBjdpJopu9IdLwQ+7llUK53rpdeZhLFegCb5yye2iVm4GRJmZWRa1fT/ABuS1d
	5pQJ70hRFCGMSwkuenbok9anPr1ok0+yq9Km9hTSro9S6RQtvHZigtUOk2kbrkAR9L0yB83a1DE
	sa3xN6MjTgiGv8+REUhVzL1GGI36nBbWAt8nE70qsLxKvembkNqdd
X-Received: by 2002:a05:6a20:e210:b0:352:d5b:c427 with SMTP id adf61e73a8af0-376a81dc79fmr31125198637.3.1767176452290;
        Wed, 31 Dec 2025 02:20:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6ef1qNkB4ZGwXjGOPHg2/nLF6kCSrBmPw7ORZ3kLabBKQWgsNm0Fbe+7WBYD7Up5GwaiDpQ==
X-Received: by 2002:a05:6a20:e210:b0:352:d5b:c427 with SMTP id adf61e73a8af0-376a81dc79fmr31125178637.3.1767176451804;
        Wed, 31 Dec 2025 02:20:51 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223ae29sm32163920a91.16.2025.12.31.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:20:49 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V2 2/4] scsi: ufs: qcom: dt-bindings: Document UFSHC compatible for x1e80100
Date: Wed, 31 Dec 2025 15:49:49 +0530
Message-Id: <20251231101951.1026163-3-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfXxEEYoC3YK3nj
 MmjZ4RJNRKkudEvuzksQOCFoh5suFnqCsU5tpirTpV+/vTtfCTb6P3h9d19QKcNrVmAz3/jkGQ7
 /1Usz9az/sOrmGY5tCZS123a9IeoEgQzIme9nGM/ILqMe+dTAIqaXQdvizN23w4t533DIn/scXh
 FPfY0Y7miALiadALxn3gY2Pju2qOy1YShGR48QSaANVI6PdP/wMUupYfisdU2VRo3ekU9w1UdwS
 jl3ZtcojrxKap59L5PpaNUkKq25DdvbjVTEA4K/EchXTEhjvII0xK/jS7O0UPn5nNN9zugaHMPj
 Y1aHlSB2KzwpW5vdWo7vkvAskUqRAJsv3scPYfiPjLiUcKM4PXCPLvfSnmqc7FYsuAMC+1D7nS/
 wRQL/4cCc9TgrCWPEVf6JcJJtUOZULP5FXHzhynQMPkHYvLgZoDZvM4Ll7Z02DKF36eJBbtdG1n
 ToRSzmaovnR8Nd+x49g==
X-Proofpoint-ORIG-GUID: MhIFp4U-WRA9y0qruzLsIZAn1otkDHjk
X-Proofpoint-GUID: MhIFp4U-WRA9y0qruzLsIZAn1otkDHjk
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6954f905 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=y5OUiIJSVdG28iL48i8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Add the UFS Host Controller (UFSHC) compatible for Qualcomm x1e80100
SoC.  Use SM8550 as a fallback since x1e80100 shares compatibility
with SM8550 UFSHC, enabling reuse of existing support.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index d94ef4e6b85a..0f6ea7ca06c8 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -26,26 +26,34 @@ select:
           - qcom,sm8350-ufshc
           - qcom,sm8450-ufshc
           - qcom,sm8550-ufshc
+          - qcom,x1e80100-ufshc
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,msm8998-ufshc
-          - qcom,qcs8300-ufshc
-          - qcom,sa8775p-ufshc
-          - qcom,sc7180-ufshc
-          - qcom,sc7280-ufshc
-          - qcom,sc8180x-ufshc
-          - qcom,sc8280xp-ufshc
-          - qcom,sm8250-ufshc
-          - qcom,sm8350-ufshc
-          - qcom,sm8450-ufshc
-          - qcom,sm8550-ufshc
-      - const: qcom,ufshc
-      - const: jedec,ufs-2.0
+    oneOf:
+      - items:
+          - enum:
+              - qcom,x1e80100-ufshc
+          - const: qcom,sm8550-ufshc
+          - const: qcom,ufshc
+          - const: jedec,ufs-2.0
+      - items:
+          - enum:
+              - qcom,msm8998-ufshc
+              - qcom,qcs8300-ufshc
+              - qcom,sa8775p-ufshc
+              - qcom,sc7180-ufshc
+              - qcom,sc7280-ufshc
+              - qcom,sc8180x-ufshc
+              - qcom,sc8280xp-ufshc
+              - qcom,sm8250-ufshc
+              - qcom,sm8350-ufshc
+              - qcom,sm8450-ufshc
+              - qcom,sm8550-ufshc
+          - const: qcom,ufshc
+          - const: jedec,ufs-2.0
 
   reg:
     maxItems: 1
-- 
2.34.1


