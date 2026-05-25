Return-Path: <linux-arm-msm+bounces-109572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKfEIQz6E2puHwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE55C7209
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98603301AABB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A01B3D1CB2;
	Mon, 25 May 2026 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7kHD5U+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klXW4mfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A73D1A81
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694064; cv=none; b=nGKS9duor7RwPvzw+kM/1M21X/Dl2snbrovL1MmRFKZrBj6wRWx4vJTm9Ro3xkmYDRtROqII8bFN+arB+vOoeETLGIgiSkEkiMsNBLKDsq6DAS1wdQDJLv5JFVri7+PBgj4kkeSL4KbXhURpWV1nmnbpJCMY0YWqGTfoy3Xwfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694064; c=relaxed/simple;
	bh=b+fRIX7C6fr84aPBl4hswANQogblnbbZxE9mFPFUrXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d00LsrNRhvoEJp0T162CSupogYtvJZh+BWa7sbFVCP9g2hKtP2chYCWfSIGvJbU1oOtlF8mT7THcI9Ow45hwLac56+dkQP780921TNvHYnNLNiQ2EM/kKL3T+WouGXsifsPyX6C1Spz79/UYgrRMXsxAxpjwkQQP7AVZMiNSpuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7kHD5U+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klXW4mfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P0fMFe899413
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hSZnChPk1TWRUFz23ooFNx
	z8/9ibfnIjGVWt3fXZ3Z0=; b=M7kHD5U+eGqLWCr1YuWD3AzT1GHD66ZZjYyofL
	h64akDk9zxIA1mrcyFwUgQoyJE5RK6fX5rWInKVGYxEy8XVGS+4CsT/qZi6iGZZU
	EEekgOuhTF9yjd7zmQWoLiwkxV4DzZ6hjtKy1PuaprXmlxM+vs8zNBEdofBWYLyF
	dl1BxO6kCkkINMehTm6gmpjdz7BzUPc1q7awAuK3oIq77IRRTaUvylXop3ZncHXy
	WL5jJSICs59sMBf1uawApZ7tSeq4DHmN6tuw2X65tlxTmNi2A9P1zD7uFsGJDVuL
	6lWjt2/OI6VyZCp9+2olkekmUL4fYafQbDdDEhVuXiyB+XVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9nd17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:27:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304627c66ddso155952eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779694061; x=1780298861; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSZnChPk1TWRUFz23ooFNxz8/9ibfnIjGVWt3fXZ3Z0=;
        b=klXW4mfsVXRM2NQvrNc8smjY1eYtXikVAU4RQnPOljOracY/NDizIsUNm6sZVrY+ai
         2vRRw2nUJ15UQmzOoQun/TGPaZaKUwGBR5jqH4zW9Mz00kjSgu72TUlte8BozaGBFKux
         gXOGDKt9qJPHQPj4sM3ZGcYCUTFhFT47pgeXHYv1XYKywuvKT5+MNRNZMptDgvesvolG
         M3+6lFn5J9JiTmLXbpSE4Bv1w7QIVDDcEZnTVHF9Yn0weVLIILdyWjqt0RuGNt9QjlXT
         LSBt6PitHrs7J00HN+F74bX18dISDp5hACj8W1hE3HcAwArbwzG5gsbcvQbCtn7TpNDX
         CgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779694061; x=1780298861;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSZnChPk1TWRUFz23ooFNxz8/9ibfnIjGVWt3fXZ3Z0=;
        b=OBZU3QsCI+zZckk0NKKlnXoxzkqTm9wTsDqog2G/UylxmmxpLl1/BLe3+9qYB92zL2
         qZ6p+rTvHt362zF7GFLaSVyfdRSWpJecZxuRl4rob5r2VMcG0zrOOm+EkBfWU6wDsq2Q
         edD/W2tqIrS2s61Hz+nPtj5LG4smZ18PEsElnxBAnSG4638DhRugp6p1ChLG4yEepFEw
         P9inqj4JJ8d8t9tEGTbQeuweMylQGOGK/NfW8SOu7Y+3mpMuaUBADQOP49WDECK5aDey
         lqv9cv4U2c12MDi1GUuL6EDgdxLTTEvoYExFl9VriqkhkoAU95Gfy2FKyFYzlhsXSFgz
         0P9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9pIAgneYH1idCSimhnoNm5nuljy9qlhUbv9jkLfbdtsuU99ZezJvlyGoir2y/6RQpNR7fSHGy+Bw8LAJ4C@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAp1o8D828TKFSDXnzwFuuxkFQk8SEut1bnL7jJsCceqBwqvj
	LDLGLGfj5rCy2Q+F6OvIFkKJWWg1Qihm5tE1qZRWj521QmVp3UEAIY5Isw/zCChprIr+V1qxsWv
	r/gjSCNhrBJMtwjTE2CIdu/cAdgJI/ykjXxAqkc8sACvpD8eTWmSv/HRZDTXJOdyo3DJ5
X-Gm-Gg: Acq92OG6Q23o5BEPFovdqIDI0fRpoaHa/LMhKPW0/S4MtgMRL7MTqb9RjiwaZwKHueS
	9MASjD0GsbQye1LSe7CC2KeKDlVG80Xlkj+yY0iRzgF9+pl6tuI5sFlE7dJggGdQI+DyHBWvfz0
	XCtdw5262ugF+yzMT+qZei+QKBMULFDO+9CkesEOx5FWfIPTRK7nmODH4w7Zarg+GOKOn1njGL4
	AneDLjCPNeu6lqdkp5o+AtKBnrUphoT0XFRn17XBkcUsEdl628dmoYV1h+SDrbbz4j1LVfJ5r6c
	9t9XBv1wfxPplFym0CICl94xA20KlTXJ2YyylR/I4mzSMjDWJFIxEKuYX0HhSZwrGLsegl4miTG
	zDTkADeXy454Jru+MGw89KM+x6V2fQyPklcAg5YM/sszIYjEugDBR4LssIdGXtyWA6LZVrMmP
X-Received: by 2002:a05:7301:19a5:b0:2df:919f:ce59 with SMTP id 5a478bee46e88-30449149c79mr6594613eec.19.1779694060686;
        Mon, 25 May 2026 00:27:40 -0700 (PDT)
X-Received: by 2002:a05:7301:19a5:b0:2df:919f:ce59 with SMTP id 5a478bee46e88-30449149c79mr6594599eec.19.1779694059989;
        Mon, 25 May 2026 00:27:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ca2d80sm9180367eec.0.2026.05.25.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:27:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:27:29 -0700
Subject: [PATCH] dt-bindings: cache: qcom,llcc: Document Maili SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-maili-llcc-v1-1-cdc72b98b671@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOD5E2oC/x3MQQqDQAxA0atI1g1oMBW8SnER01gD41RmoBTEu
 zd1+Rb/H1CtuFUYmwOKfbz6Owe6WwO6Sn4Z+jMM1NK9ZWLcxJNjSqoovVHHOvDQM0SwF1v8e80
 eU3iWajgXybr+F5ETnOcPTuNwPHMAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779694058; l=2756;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=b+fRIX7C6fr84aPBl4hswANQogblnbbZxE9mFPFUrXg=;
 b=+U78c4x4dHLD6eJFeT/mAv4oLyrBL6Sm+byYWIEGFC/Rf5WkN9SMcfAiIFzjXAe95QUJbl3D5
 BvcDsCQ4k0cAx02Xm4pVZZU7+CLyvXgiRFhOknONWsTSUgLFtH/qT0e
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: PHGXEOVcYugLFlWK6PHrOM7aYeoyqwFR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3MyBTYWx0ZWRfX41xxKdtCpJFI
 PQMN82k3rPucv60S+1A0DX4ZnJjUD3XI29ca1ay2uUeETn8/tLI3WJkimWLIDDTafSF15T1i4XP
 ifD8Ere2Jy9h6W/GMtEkoXp9mBlNqLEsuP359atqMuxulKTp9GCqFH9Tz9zToyB1kvQJOznM9Oo
 0P5Zi4WTn4hK1l6YIHGlABYaZ+Criu7I9UDLGKWTB3SUcOvwkNmhNw9TFlnHAPQCebgEwjbAwYd
 1yVUE2pADs/Y1eHW8LTHM6zyBxoEw0YLtyX11Z9h9MibDHIKyXpDFAweEgInfLgycE3TmtYiXsv
 kF6vq1UV+UOXvEgSLVOIxVy+3NT5ufBtk7KNMib0gHw/4eIe/LxuG9QtHwWr90Jv2F3onDAClON
 TyQhLocj9F6qE7YNf5XIKhNoWHhUppjvlWiIup6HzG4FnQ98TmZuAa3+LVS9XoPt6OdjWEzV4KM
 jpMWyaho/C2xxQUYakQ==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13f9ed cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cvMXTzhbIQYqWXFn2VAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: PHGXEOVcYugLFlWK6PHrOM7aYeoyqwFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250073
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109572-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14DE55C7209
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the Last Level Cache Controller (LLCC) bindings
for Qualcomm Maili SoC which fallback to Hawi SoC with System Cache
Table (SCT) programmed by firmware outside of Linux.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 63 ++++++++++++----------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 34e3a2d78592..a1340226a0d0 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -19,35 +19,40 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-llcc
-      - qcom,glymur-llcc
-      - qcom,hawi-llcc
-      - qcom,ipq5424-llcc
-      - qcom,kaanapali-llcc
-      - qcom,qcs615-llcc
-      - qcom,qcs8300-llcc
-      - qcom,qdu1000-llcc
-      - qcom,sa8775p-llcc
-      - qcom,sar1130p-llcc
-      - qcom,sar2130p-llcc
-      - qcom,sc7180-llcc
-      - qcom,sc7280-llcc
-      - qcom,sc8180x-llcc
-      - qcom,sc8280xp-llcc
-      - qcom,sdm670-llcc
-      - qcom,sdm845-llcc
-      - qcom,shikra-llcc
-      - qcom,sm6350-llcc
-      - qcom,sm7150-llcc
-      - qcom,sm8150-llcc
-      - qcom,sm8250-llcc
-      - qcom,sm8350-llcc
-      - qcom,sm8450-llcc
-      - qcom,sm8550-llcc
-      - qcom,sm8650-llcc
-      - qcom,sm8750-llcc
-      - qcom,x1e80100-llcc
+    oneOf:
+      - enum:
+          - qcom,eliza-llcc
+          - qcom,glymur-llcc
+          - qcom,hawi-llcc
+          - qcom,ipq5424-llcc
+          - qcom,kaanapali-llcc
+          - qcom,qcs615-llcc
+          - qcom,qcs8300-llcc
+          - qcom,qdu1000-llcc
+          - qcom,sa8775p-llcc
+          - qcom,sar1130p-llcc
+          - qcom,sar2130p-llcc
+          - qcom,sc7180-llcc
+          - qcom,sc7280-llcc
+          - qcom,sc8180x-llcc
+          - qcom,sc8280xp-llcc
+          - qcom,sdm670-llcc
+          - qcom,sdm845-llcc
+          - qcom,shikra-llcc
+          - qcom,sm6350-llcc
+          - qcom,sm7150-llcc
+          - qcom,sm8150-llcc
+          - qcom,sm8250-llcc
+          - qcom,sm8350-llcc
+          - qcom,sm8450-llcc
+          - qcom,sm8550-llcc
+          - qcom,sm8650-llcc
+          - qcom,sm8750-llcc
+          - qcom,x1e80100-llcc
+      - items:
+          - enum:
+              - qcom,maili-llcc
+          - const: qcom,hawi-llcc
 
   reg:
     minItems: 1

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-maili-llcc-a4e215c75745

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


