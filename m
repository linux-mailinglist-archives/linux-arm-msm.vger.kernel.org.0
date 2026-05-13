Return-Path: <linux-arm-msm+bounces-107263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEMrMoFcBGqiHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:12:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AD531F68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E604F3013891
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C553FE64D;
	Wed, 13 May 2026 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK5rhJZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4jGuqRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902E3EF679
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670677; cv=none; b=AgzSNClLORCb3dBLh0P+Hdnx01GBEF6u23nFXc8R3qS+gH8yXdo7D2plvzo37wc8ZQTx0XM0ReoA1DoYLju5SyZgG1C9VETWgIAhS4A1460z9cF4Vz9f4TxA/KWdPIPGLs2Md4WjDfHdKM3ngEdFUMnd21A+ECztOzUMGIrqDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670677; c=relaxed/simple;
	bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EK2+gzG48MGhGQYU0t5hbHh/O20PImymnNuJEm8FaNWdpK+mR18SULtM7IecGMa0YHPNVSYb2YIc8xCd6R7CWbrjxIGPzpLCo0U9zbfpsiCa/g+FtJ4uS6COJSAn7uRRhXXJGuNIij6OhHZiInHQ2h03cFTPDZjaCvcCnuoW4Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK5rhJZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4jGuqRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6FJJr3324677
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=; b=KK5rhJZvACG3B0wx
	Uy2X38qolVQXBPj5Wh15u3rauFOZUrdEpBSbszwYhRGH9kLCTcAYzRVE2dKNFQOy
	ifw2lACy2A//AyMMLEqu4crINamb331AeIldiV6RTYNMBUbbs+XZdzXZ6HMqYxXr
	mBPL1+iV5CO3n3sPDusl4c8CwYnC2NZ6dpxlc1wa4jtcKV4wSTngx84lBUWpfuJT
	dXp3YRifk4w3E4Dw9oWf/+DsBuxLhrQMkCf4JWH4I+Vfx3CtuxX+RaKjxpLhbuH5
	12vrCn8eFJywkZ0D1Gh1zKYuDHw+uTU3MrLoRo58MWRSOPqvzrR/lTNs9yxaTxCk
	slAfxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd951y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso159362721cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670675; x=1779275475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=V4jGuqRwEEo1rDhFYEMpDx0sfH9fUHCgNJyp+/xfRNiWTItWKuGwAcD84wlKdacb8v
         jT6udblbP2OK+wl80KIks9x5pZQMyJ6Aq8KYTXKVvPCeSl6pQaYKkf3Sf4DGp05a0lL/
         1ZuXINEHZyz9BKLLi5BvhmjjcDsjzn9nm7iZvgNqJ3CCBTaDsYCRS40wsh7yQZxAP6v8
         /dAoirQFw9yu9SvcK3a+hgDHFP4G5Vb8XDzeelNbZGc29jK8CQ6boXjOQK7bfD4MVuPd
         AJ5/f3brqmRhIfbZYS+vtBSuCf8IuA9zFGDoneW5b7DlCc0cQ4AwmFdyJjFqiENFgnde
         pvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670675; x=1779275475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=MiwQXVZ7nVEUCO/2z+qlcj7CWuJoOpB1ruOQBXX2Pt3UG3PCOBmITW3t2/wleOIraS
         RMPZOpymA+e6l60V+yxuZr+bE7Z/KcimF/UPpeagRrFMDcf/iPEv88ij2csMsYmJlFoO
         bS9XoXn1JjF2HIZtcU1jxrCEQp+apvHCR/BFZ67V3bSZKxSZAGgnegD1yxp+G+sLG3Dx
         0aoSZYYv0dKUOhyGTngX2uZhUqWo9vxFPhiu2W2eNieA6+hhT+ve/N1m0R5uXsVY6RAT
         /5JRBCN6hEMF7woVKEi+7N53DHkmR03KOb7aI/Cc+9bRngH/9lTVUhuXMpzucxuHB9fX
         RXcQ==
X-Gm-Message-State: AOJu0Yx5XANBdxq3LsaKtgTyy33PCV25PmaaTDvYcBnblqf4+vbaBWFn
	xRbApRFPo0TRwDDwbVlh3ZVnmQl7mVDtJJvXEfgGbZ/b7axqcfX0kVmvj1D33Z29mtoR1A7tMKu
	ntp3CBUGsyiQw63kBszJdV8K4JXcbefPG3JIuzkcTJX7akEtxMolAqRPqEHKPwSkyzZ5+
X-Gm-Gg: Acq92OFVSh3tbHkYvuCCIiexRjwg9aCttnIxPxQ511v/2yzXu4/Sg/8jxA15ktZmHgD
	0nf+NKQCZeu8ZiuatMqyARhO6Mjv0RzPjf4X6crkN6GftVWb/1GBMNDByXGQDzmGhx0P70w+Qtv
	Yw+oTR0dASacsIegipK2z5prlOYD+0oZ3lztY/LO+DZY1UPSUpj55U36wskc1CGFNPw9bk5Yrw0
	rFEk7Zi7UXh+zlpunmjBRCfYmTvpDMLnEuFh1L6AK6NR/vDwoXfoVaOUeuG5Ybk6htNDI9WAdQ1
	MjsuQrvHU80u/ZBYkq8H5Qv/BUA7ab8TERn7quEbxN0YYMFlBWegLCeQ3KCB89+KenzZKShyjng
	Zd85QLMVe1LKqM28A5UV5rI9xzc+9Mw==
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr30505391cf.20.1778670674760;
        Wed, 13 May 2026 04:11:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr30504851cf.20.1778670674284;
        Wed, 13 May 2026 04:11:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8cd49fesm72081355e9.0.2026.05.13.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 13 May 2026 14:11:02 +0300
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com>
References: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-llcc-v2-0-27381ae833d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBFxLIuV63/iI/Rminez/2Po7jQwgsFN2vpElI
 /kswoYGI6+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagRcSwAKCRAbX0TJAJUV
 VotGD/0a9Fs1IUXIJdbDPqavOWyVvNmv8KTsF4FGfr9LTNbDGTYyMnjxPCIqkijI4zEPLa67PJC
 S/5nwpQlCaWGbJjN2T6i2ePlFnA1LvlJ242fAEBN2BKKREtiPRvG55YYn6yyfDwEv8JcqYcOWHn
 VFpw4p8abgRJXlQM7/zjTrCO/jYQ/xYrF4yYj6z/I6cvBdpBdgvLfogYRTbk2RLTOyftSwBQTvH
 os9QTCPtK7mwYVThvj134E2cMcHi+qEnwDEG7QGUE6txgIbT0Ip+YDy2FljW9rrl87piltiMiwm
 Ah0NKUa6Uw3DvZN0xDkxdV7B1jwYGmuQSLJ9+KyVc7UwOxIs1ujaW7IZej4DzPm7zGhI2KnAMgd
 81YUTWIpOvBnWjY1K5eUW5cYMNH+qhwJ+zCbzfrxzUeTyBhrLgTMIYiHc5OGq30+slZCqHuZ+O2
 JgeW7FmoXsIDVzFagh20sVMGPvnlMHZkxfpJNBK+obX2a6KhExrlZeWcIlMAAzN1OuowQQPkqIX
 z4kq+8PFi7f18IRN6+jDlbfVH0NsoB2H6nMVkYMzTgQ3idbZqSz4cKSTyv+YXnCCBA2dBJaH/y2
 ErR484XQPAPKU3e9KY08+L1lGR+Yhp6I/H7gazAejFdlNMoS9T3bUFzOxvnkfZWb/dhqZMDZ721
 ymIg3UtuXr3aXXQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 6f5pQRKcuw2HmhswxbLl1iKrgpPGUli0
X-Proofpoint-ORIG-GUID: 6f5pQRKcuw2HmhswxbLl1iKrgpPGUli0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfXxflUzZbklelQ
 KY9Bw35B/7Z3UuMPsWALMJ2nInQeXNTv4x+a8mC2nK08m0aP3BC3J86yZsPykrLdzRaDKGpDSuB
 H1ogl4Yfz0iNTVdxlZCHvcMHyIcQh/9zgzKUguDGeNiK+va/WtdRkXkIRFjKIwGJQmHgnWXyC8J
 NWK78HtHjzZtHk6QEivT1oj/jCpF4JQznmeF+i8sXRURHYg7O/AtESP5P7hpVH/W/uXhIou0YhA
 xMIPVdoPQ5uSGUJutUP9fE5JNavRvVMInXqqagb4CwGBmdSxPnYI9YZuVvYbw/0CHDTUezjCdpn
 jDcvyJHgSMHEKP6bbWCx1es9Ea2rfIKoX0EVP2jphGb/GUkjUTeq4if0aivKDsOkA9VDVPLF9lb
 +KxNwNLRpVoDup1U4J+BHHifBdKB1xb/d2/L6XTbCwEoWEUVm43d3Hrohl8OzW3tTkxVh/LUzIK
 /3CkcGxzpZE76BgK/YQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a045c53 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rhu6fYff1SmOIWjBxU0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: 660AD531F68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107263-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
base register regions and an additional AND, OR broadcast region, total 4
register regions.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 995d57815781..90f5a54b76e3 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-llcc
       - qcom,glymur-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
@@ -341,6 +342,27 @@ allOf:
             - const: llcc_broadcast_base
             - const: llcc_broadcast_and_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC2 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc2_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
 additionalProperties: false
 
 examples:

-- 
2.54.0


