Return-Path: <linux-arm-msm+bounces-101413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHfuMqLczWmliQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:04:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50C382EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFBDF30C0D8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 03:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021F73537F0;
	Thu,  2 Apr 2026 03:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atiKGzz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4lMxbdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97783537EA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 03:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775098903; cv=none; b=YUoo0M0KrVAsMdLwqpbTS+Ppq+6SNAFurIGecMUOQ1r1huocudh9J/b27ew55g5L8JTNVsfWT9hNBZQ9ack6eBlSrKe1e+ja6/TSedMraPYJFajqcWOQdti6Sfs0yrUpeE2ZEpQSt1CoaGU7Jgvct6MrJ/gW3IhGsu0zOitN39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775098903; c=relaxed/simple;
	bh=xvIhsQLnf6VaC5Osn71e2H8dj70AFPG1lZSuD4kkNsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhAMjt2aG10EQQmEy9j1dN+ZfOo2RWfvat0YCXuOvFEzcB6+1Frnn1nYet5BMD1+wJ9dqNBeqbzLRbyozsZpKMrXPs9rAu1E+pUxpZv70EbDsUOaNBRV3sCGihQtkTVsvGbzRf05o+1gKZ/xIBhRSlWNmEKTpbfHa79fem56Fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atiKGzz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4lMxbdI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Lax3044204
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 03:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AllDrQRxwAl7RCBJmeePH104tAT70KjLDbo84NciKdk=; b=atiKGzz2M0U6E1Hh
	FbdFOgHERWa1EoiVQq0p495S3zCEoToAk76wytbhO+p0iU54f9isRvFd/pcb8gzC
	4Xgir+644U6/f+s4Fyez1uwJIaVOj4hiU6e+rRoiJwwZUQDHb3En92mwPGCPfo21
	8G1hI/lbUw2Mj5QsLQczobOTr/Vutd0RfPacLUr/1eLrBf+TS8/GnLIpLMiMQ+jq
	9ZZF9JnHTbokhj1LQmjj4WRygTVfMA0ILQIZ+4/p91ilKBWsYA4s/pfoPYMsElI/
	5jS5pEBNDlVDc/gV67JmNQ28QziI6rAG9GA+Lyzn/qTlBm2ffnGnCq+wLDvnIeby
	5WXPaA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483tprv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:01:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12a77b008deso2083773c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775098901; x=1775703701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AllDrQRxwAl7RCBJmeePH104tAT70KjLDbo84NciKdk=;
        b=a4lMxbdIOfXqNNutH0be7n/SdnlHHtv59i0YYOUSeRSYeYL+LVUIJ4HF/92DV+Y4PG
         bO5ykosA7p4LCOLxzdpuJ1BspZw/HH3IqPBuyzyp+uDvvvDD9/HtsyEpslRaQSNIP9uf
         lEpDCIsMS9JZRoH/bmmSBEfndHbNVFGeMe3bkfrsZ3L/7MbaWTmwM/ficu55UxTv63L/
         dxvXmI7sdyrpScoIEV7T0xVR34uGMlGE0Z/Jz2EhedU9vev5MNGm+/HER6m4Ul4SqjLo
         XijJzyCuWhzw/F5Gb2BiXZjZd9juxopqhZVaDNNqbgxSkDsvndyjvw3lu44fbdbgkmy8
         xQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775098901; x=1775703701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AllDrQRxwAl7RCBJmeePH104tAT70KjLDbo84NciKdk=;
        b=HTAT3cLnWmrX8/iHZzTq3Fs7dzoIyRdJ+++MIYAlf0FR3iuBVK5aBHA+Iw8UJXVvfL
         k5wxN4N0oCaMzHsVRXvrCVT5Lo4ReVIetG7rwqjjtQ5hzqPch8Y2lqc8ohqcBAqjuOtr
         wqNwaXH8TCZW2uvXO8S8phomtuVMv8FkhazEM3olqfYDSBMBmR51BvH4KfxB6QXfAxEK
         jRdweqnq1MZE4Iyiywcn0KDPOl7GjdbBT8FGkz5xNww9sEaWPtbu1WV5+Uk0haJy2Egn
         ydvI85tz8mjnhzv5rcbbzkmW0PJx1WH97N9CvV2p9FC+im8f4kV3/ySwh63m1WNLrbQ6
         mGNQ==
X-Gm-Message-State: AOJu0YxdrcCpQEGnW1iu/6cDYfcmMsxBauKxaEtaiy/wJOJQooHel2Wl
	xQX/o/gWDUCeyTxm9O9P4GVASphB1H0SgKyX4KO3G2d4VaW+imm2ZEw0NsZHV++aJJYnTNIxHmB
	rtAGiIZY8kqDh/P9Ggv+d2jncAdB3rFXKnViv9ETz3NTiKqEqJpcKQOGsXZECquoaUSs=
X-Gm-Gg: ATEYQzzq1xaFZEdPMrM5v3IRhw7s2QQxPDjNC2HbHlc8g5EhE5tSb6D+HtgNUKrFXHv
	el22HsCkHw8+CHJ7yvc6DduUh20L3xjj3WPzRTDZBSpBtuoUY1oBW0//OSajuB9nYpNWfpR2QQr
	fmVbH/5YmgVGD1k5A7LloyNMvAsEjZFixe20p58h972NylbHxs8u86Rys1rQUb5yzlW8096smVC
	2yfIao/S/CS6ePiAjEu11ywTdY2XmwOARlQ/I3u9S4zCZJPLoX1jmi1csePkNOTcNfblAu/HyGP
	h6ASLQVBEmJpV0O8mWvdIqLVeuO1JSJd4yRtKgMpS+Sq4ORZ00NqnQt/uKSdWlRfwLjgvquvyaz
	NCXebrEpQuyUbMRsf3zkMWfqxvWMWH9qVl6P4Aou70XcWcb8H18UZ91I23ZtDQxMvmAlrXsKjGQ
	==
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1075726c88.10.1775098900990;
        Wed, 01 Apr 2026 20:01:40 -0700 (PDT)
X-Received: by 2002:a05:7022:458c:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bee639048mr1075700c88.10.1775098900112;
        Wed, 01 Apr 2026 20:01:40 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm1287044eec.25.2026.04.01.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:01:39 -0700 (PDT)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 20:01:34 -0700
Subject: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Document Hawi and
 future SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-external_llcc_changes2set-v1-1-97645ede9f6a@oss.qualcomm.com>
References: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
In-Reply-To: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775098898; l=2958;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=xvIhsQLnf6VaC5Osn71e2H8dj70AFPG1lZSuD4kkNsA=;
 b=UxYvpSs3KbM8aGkfbVs/PZ16ZOn9en7czLcEF7YcFwobXdVfJEh4SPICstvLteJNbvx+sIXV7
 2ShvmHAjM0hByZFthynH2n+7Ryn0Ycq2KboA01Y/dh9NFEoeo3gZ4Q5
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cddc15 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TYsQ6n2DTjt8ZF7sQeIA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyNCBTYWx0ZWRfX+aAykfm2b1T1
 vrojn2lUzIznUoa08WFmDhc8HDplHzmYyDGjKTtn6Oixsg+KeKqAUNcyL2YS5dgnxMOyfprEpIr
 W7q+26J5W5lfOyRL8VNlOIXLI11hVmwLC6unXg9EAt2FduTJ6ihNaODnvyVtULiK+2Bx5wDEFCr
 03ThofD9iLEt/sn+ingYFPeKsjGeSq0M+Ucf5WFc0w01DDygzBsHqGmLbyTW0ish6VMt98wu8wb
 /rXFei0vF8xPMcJ9Yq20bEZzsEgx/yk612OrQlLP5xt5/Qj54mNN/dOMbF+2YkFkPfpUEMrsnyx
 eeizcC3vWeOZT1Od0fKSjtvbrCE2hNtW1PWY4jGcnhy/yxMj4T1ZEOZ4tMc4yMrwb8JpHXIfL+G
 7mz3C/UKYYDdPUZusMLi90BOlT1Hq66H7Np2sLKB7zT7rVdL0kBM/4Z2rQn1efISMQ9LJ1DhP2b
 HC8eEWHPXEdZtV94V0Q==
X-Proofpoint-ORIG-GUID: tNFfqkeVZ1QYqQ-xWT79DrBO1XAPKCF1
X-Proofpoint-GUID: tNFfqkeVZ1QYqQ-xWT79DrBO1XAPKCF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020024
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
	TAGGED_FROM(0.00)[bounces-101413-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F50C382EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the Last Level Cache Controller (LLCC) bindings to
support Hawi and upcoming Qualcomm SoCs where the System Cache Table (SCT)
is programmed by firmware outside of Linux.

Introduce a property that specifies the base address of the shared memory
region from which the driver should read SCT descriptors provided by
firmware.

Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 29 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..ca1313de10ca 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -11,16 +11,17 @@ maintainers:
 
 description: |
   LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
-  that can be shared by multiple clients. Clients here are different cores in the
-  SoC, the idea is to minimize the local caches at the clients and migrate to
-  common pool of memory. Cache memory is divided into partitions called slices
-  which are assigned to clients. Clients can query the slice details, activate
-  and deactivate them.
+  that can be shared by multiple clients. Clients here are different cores in
+  the SoC. The idea is to minimize the local caches at the clients and migrate
+  to a common pool of memory. Cache memory is divided into partitions called
+  slices which are assigned to clients. Clients can query the slice details,
+  activate and deactivate them.
 
 properties:
   compatible:
     enum:
       - qcom,glymur-llcc
+      - qcom,hawi-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
       - qcom,qcs615-llcc
@@ -57,6 +58,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: handle to a reserved-memory node used for firmware-populated
+      SLC/SCT shared memory.
+
   nvmem-cells:
     items:
       - description: Reference to an nvmem node for multi channel DDR
@@ -318,6 +324,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-llcc
+              - qcom,hawi-llcc
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
@@ -340,6 +347,18 @@ allOf:
             - const: llcc3_base
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,hawi-llcc
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
 
 additionalProperties: false
 

-- 
2.34.1


