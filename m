Return-Path: <linux-arm-msm+bounces-87510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB65CF4383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFF29302E63E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9334346A07;
	Mon,  5 Jan 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qf+inBUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAc8h7lz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C205346771
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624437; cv=none; b=IwsJChSzSWI/M7xa3LbImOLmQv8XORSaxe90LK+iLpXViU12HmhoxVdr/CiQJreFPrxschYREEGjRnZ6p+NkqCGHrv9mwIIo56MhzZ3AtYIl/sWD5x6/fbeYkC0gucSDHETVAQ/rgLcFDVd1sDDYsIk6lg/Kof3qvx471EMREfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624437; c=relaxed/simple;
	bh=0/49bV7xcWqrx+PER+pNr4EOl5y9jYDTYIF1B5vedJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fVT7hldKYfuAN4LhcSEd8jUB7bitvT/GGsdWy8I7R37aULX68t/2ok6N2HiSeMcWR4YwOkxxHIH4mfJtTskK4bAfmBEjrGTC22d8RXEKWDRh/5hSike4G2HFr/NodrsMUvbZAIGcZHnHgM0k40KVbB93LmlXyDpLn2cg8JUVDP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qf+inBUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAc8h7lz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058LVLB1210004
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 14:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JL9j8lRAbIP
	3UrbUnDDXBBLQaw+rdcjrIyfR5u1zqHA=; b=Qf+inBUR0kFomEu0Bkh0Ab4lDyB
	y1LMAEysQYWehe1ZdZbPSULtPU6EUp1JkyO43JHYjePhF2ozRKtUwezxCosRy/EO
	I6G0/1RflZeuIzImTgwKNUoeAwAHVOW0KinhoZR9U1fCyVWh8uDj0ZrrmRJ4iD7R
	kFLE0ZsqWrSf9uM/kh1jofH7y2M470MpKzSKjyQmtjU0jVvCqoSlfldHNeftsGRZ
	ESvTzor8v9F46pXwfCknhK0IEpET4DwS/0g1QujUfS7PgawFuVQJlmwRQqnnZ9ly
	rf89T/9Lm//ZJ9C7/1pxoW7ks3aDtuHQqRVOHciXIWInZuGfsx9OUHklgBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hcrbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:47:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso59703a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767624430; x=1768229230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JL9j8lRAbIP3UrbUnDDXBBLQaw+rdcjrIyfR5u1zqHA=;
        b=YAc8h7lzp20BaAgAHkRG9wicnhnfBuoc+6Y5dYTQLc/DJigU+RajWLRoCejpI8wm0v
         V3wBk8lRTGenK2L7rBhmrsn1zPmmYixrkaznWhi2bHdg44x7kvMGjd9Q+not30NSqGhn
         69t2N3d3j9zVWBRnmgRkgXoHOEvL4fPHQUbOgBjGZWUcifVd99naGVvRJDRaWassMkQ7
         N9LdIFiW8NeqAWK3Bu2pAQB6ucG7uns/MLwxFxsOigCrNCBJ/QqQmvGJH6d9hqTOKUQ7
         1dt8syMPIBJYY1qxPJsyFZiIhhqLQGpQE4gfbui/IQ+bBmMk5slqWNuouy0+0BZt2JE0
         dTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624430; x=1768229230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JL9j8lRAbIP3UrbUnDDXBBLQaw+rdcjrIyfR5u1zqHA=;
        b=Yuq9mTtpZgqp7jeHCx6NMBUsr2F46JLr/oes1WIw/VUQqXnVqNnxN5BtwehdJi/s0G
         Rkv6FfFCmNb4RL06rtxdEjPS0xwfzNiunBSddtPvpfc9niZnwy0LsgbrncSbFtsdenm9
         PZzKVn6jZA+JQhDwkx+DOL0ku6+m6hffIGeIQ14XFzNMw/tX9h8tai6mMaoReZv08TGl
         C6Ty+ywgJrNjSgt/u2UVLtUMAKNvlW0t/DMrKV0VodxVZTLHk8Of7xwtPgj4QbrObAoS
         1Y6Qd89ligD5oIBhS7XtGhG8IJl9ROuafsmjhQFHLCbKyoY3+v1MXpfExCCJ7PxAqHUN
         joWA==
X-Gm-Message-State: AOJu0YzZzVYf1fsZZqjSVRfNTL1CFCHjlxtXr69wdYwpXpEXVJHMW+R0
	V/Qctd18LjEdP/xVlIOnjzs0dYvv41ZfMTNGx4NB7sNdtfUfp6s41s0SY3SmIL4Yt5NAjBuqjDZ
	G+qx+Kc4x90gaUxF5t4+mi7pPGqu5CjM8Dglvmv77ZD39JXEoq/QmdXGZDTSDZ8Debg0J
X-Gm-Gg: AY/fxX6MzEOKyvf4VJmqYgbywQIx/dUZk2TLhhhp4b06ICadzslsM1dbZEhGG2yWkGP
	JTDlglxiTny3r5olBn6GXfk8vfr/AhYoEiae5N6T9zv7S+yuD+Jd58kn8oWoLLn1xNDI31yNynj
	y6Jn3LOWxyIdwQlvAYIOjx8rG13244I9L9EWiKMQAB/aKBYMk1I2Pdj0zu36IaIEfuUvz9pxaJp
	ApE3j1d3NK7RWChlM4CIkA12iilKi+49Uzly+jjiwIwL7HMHmnYUf7eDeJyVej7RCbWmPKRtYew
	gRcDE86n/Y7IAA8XgdGcgTH9qJyoe16oDc8/m1pnKyIEAG8vm3SxWXK1o8T0vz4wwZW/DfKBMxX
	+eIkm5nlhcQzcstuyg1CF+pUqAZoC015cuaSyXclYkrpel2GY2Gtz
X-Received: by 2002:a17:90b:1346:b0:34a:8c77:d386 with SMTP id 98e67ed59e1d1-34e92139a88mr40066102a91.9.1767624430160;
        Mon, 05 Jan 2026 06:47:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYO4fyY/NKZqP522dc4OZGpMKPzWFprBwP1/RIUeyvYF9tNegohUl3Ei5e98Hahvi876HNPw==
X-Received: by 2002:a17:90b:1346:b0:34a:8c77:d386 with SMTP id 98e67ed59e1d1-34e92139a88mr40066079a91.9.1767624429411;
        Mon, 05 Jan 2026 06:47:09 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476ec311sm6634868a91.4.2026.01.05.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:47:08 -0800 (PST)
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
Subject: [PATCH V3 2/4] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC compatible for x1e80100
Date: Mon,  5 Jan 2026 20:16:41 +0530
Message-Id: <20260105144643.669344-3-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOSBTYWx0ZWRfX/lhdnCL4PoML
 g9XG7pxf4ux2Ez6V/OEdUAfbLo+KVGIUw0yZA40ZlPJIz3+vJtpaEx8EvTWZimac1vsyTpoUSlK
 ZoYCuf7dTx7LBVMVI5yNH3BKJm3uTYwn2pZ1lr0P5zq7OSaFETcgoI4cKFAiVAVaewVKZYKUHVv
 TSEcMSMsIVn/OQ95DmouEXO9801oSw82xo2P8WnDIJAi4gMBgq9X+DRJaQkmXS5VkvuySqhIvf1
 ljVs2WfS6a4LBQ2lkMSRqA745M8VYaJQgbIHhdFnNBf5o4JbGX70FmIzt2rqcLUZS4Ae3l6iO8h
 zhYAg0ljORC63OJdppUqdYLpJekM1MJafvrdHRTzDSucQ5hQQanN3dErnzbd3yDnPy7/LR5cNGS
 SpsguZBsctd+jWFnPPjplXgko9XLPSbjH1q7JbpYX+mMHBnxmzeW0mm10SqUckVRf+55ZjIMMnf
 pgRhIDWQS6+brNtrXKw==
X-Proofpoint-GUID: gO4AOP4FyixU3fsea2JGArcrJ0jMKyLv
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695bceee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YpgvqVHoR88ruzM84CIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gO4AOP4FyixU3fsea2JGArcrJ0jMKyLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050129

Add UFS Host Controller (UFSHC) compatible for x1e80100 SoC. Use
SM8550 as a fallback since x1e80100 is fully compatible with it.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 37 +++++++++++--------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index d94ef4e6b85a..c1085d178421 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -31,21 +31,28 @@ select:
 
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


