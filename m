Return-Path: <linux-arm-msm+bounces-105681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM4QI15u+GnPuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:01:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB254BB5B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2A77301BA6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE97A38D69D;
	Mon,  4 May 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byhWmiCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxbnZNaN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072F38F258
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888828; cv=none; b=tre5gNXIjb7HIkK4rfPtLl1PRUId0yAWWTR2MaMhJ6oGIq6+7JIPzN4wP88knLbdtdpuWvoeFR+n4YySMFYZAp/3MS+G8LKT9DFRlTDYEaULU1BSltPAvjJCshnTlfsZVeJX5pu5Y0czi038DlW/Idjm65/qYcRrzQpfLYx9bRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888828; c=relaxed/simple;
	bh=6/Iy5kkgiDFD16hOKi/Kf/Di/bK0BuO/Zg8iKPfSReU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eealalo5XnmGZXbnYOe+sg5fQ7RPpS6UQIfOiExTkXR6yozOad65JjnogTmRHc4MB+dXUExNrE2ifJLV7EyYuVLyT64PpSgY9XWoEBDzrxVjuHq+yuFF3buvusMQKA6KmVsmg2S+Q4FGBJeShR56wfyKDK63OQ+iVNZa2M9ZXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byhWmiCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxbnZNaN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fQrU3894123
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=; b=byhWmiCGE58UiSSX
	/8hkvyfSy+9fpLARovfnkrJR1+hYYZe4Z91C5IpybB1pMBToYAhvw5Ay1YpU0DTM
	bBqAlXJmc8KpQWmU+V+Vo7A+M7fnFa3gnnhbvMvw6hF/n+0rWedlc6yBjFG3Zqt2
	I4fCJQKgrV6YA2YjlKLnFsxcXZkQkpGo4ruB4SuBrK+bsYcJvfuL3XlrrD0Nd7wZ
	zmgp1luCNT0xaACmBUxMfXxocYt4p65Rg87rhSMxmcJK5vd8GJaLzHHniitwR7/3
	r9tju7cN1TW3QV3uNQpWrEbVqv+FOgk03aavg3yzI6nf6tWgy9Y3mjcWpPhnxgz3
	EoUGsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpdf5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:00:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e2592ea3bso37704061cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777888824; x=1778493624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=dxbnZNaN8ol3wJlgrLYa4tjf0J2F6OrLn3P5QyO8/maQNjr2t83YsfcmSfThrCSPc7
         2Cnr6oFGgawGgWay28LMnOPaFU+V8bXoPY8/IpVmfUFsVweuV3lu1OhfK7HbRZKSTXcD
         Y2XMMyupbd9MXpI8hOBAk98kkhZEFaw13r9K5Run1zmRH/XtdFV0r2tgksZUl+NLVWQb
         Bo2y0uGJ5AGvr4RcsGQ1FjAzBiF6W7OsEMg824A/jMbGMQ40SICx0WwXKsBcomNQTkbp
         zeK1gErpT9TdBGJCqFj3B2TiY5YtWo/ZpjDJ+OPili/hzXfQ8HqHpKKHKDJYR8BirnMO
         aD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888824; x=1778493624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJ0q+BsBMSefHqR+UyMZLu13VRsLLve25e2t8/zYFpQ=;
        b=qm3dsKf67jCny+PUqq/xEpKi93Esqyso4u8VIfrHTUEVsjzBpoWYswtKxgHdtWtKgG
         zDizdH+7vexIWmPlHwCIhoObC7NYPEZX0QL/7ggovxmIyoiHYhWpeKTCNAo6apYri9sn
         0YVrHIGxtp7cccLEdIGNZxDV42W1q/LmUnJt1Vgwb4NsfkusomiUZ3pSyl3vX8+3AAV2
         IKY6M65kWr2/3okMGmntyauWzYkEDzymGl4a1/r0bSiKMbUFlNRtuO0U7DUXX+QU5c5Q
         T5ZzL7W6WDIowZiKtHmTgX7abYTYocu9505RNso/bFfY9WW7dReCkleszu7PQH70G+sP
         pLHw==
X-Gm-Message-State: AOJu0YxibmDo8UDfvXoDG1XsrmSEMoNzdm7iwuAmWkagbUyEU26jUR+m
	wUfrT/ExXvFHSY/AdJBjYh2ZHMK/Xmd1D4NVYIfE4LBpWhecnAKxyjqN33pYJmZWw+t2fc9kmkS
	vE0PX4WPXn4eFoy62ZvPeWOvR6VeJxMvzNtGKqlErEAYjYXhLrBbouH/MhPQcD9/GhleCAGio1e
	nG
X-Gm-Gg: AeBDies3ZOICLMQAFYymdbrUDQmLS3gFWPCdSSjPUmDnrhUoSgz5jVEWozFUAspY4t5
	+O6kZB7aYuhNWtFVylW5IHmiNIzMOC22i51UE0Y4RC2QtDDNhWdTNhTERUU+SlLTDEq4gxWF9CQ
	jjRM4U5pZBkYsZQ7ZcDSEIcEwOyWEXAZ8eYdjmsp05gnhs54ScDvRSJdWakHYqOf+FcJF/Dwsip
	eVkF/G6R8mUgMVua/89QgPIFxk/GepVEle0wuBr+B0GnVUTUWEd+Oj1rGnZmdYHhcH/W/BiWgZ9
	TnAC/hndaVIUoI0sHBFtWARITR8vzDO9ZR1a0XK26jLjaGP/JZRdPnRcMV1pnXyqpDBl6nTSF69
	fGN1slsuuHXk0EloRyN+Y8LIpRCae7znMnL4nYtXZ
X-Received: by 2002:a05:622a:1648:b0:50e:60b7:bb48 with SMTP id d75a77b69052e-5104be8a537mr136719191cf.18.1777888823353;
        Mon, 04 May 2026 03:00:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1648:b0:50e:60b7:bb48 with SMTP id d75a77b69052e-5104be8a537mr136717541cf.18.1777888822117;
        Mon, 04 May 2026 03:00:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm324355955e9.12.2026.05.04.03.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:00:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 13:00:07 +0300
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+G4w+saXMIInImzTSdiaBkOY77pQBwtLgo4zE
 L8KPJAft5SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafhuMAAKCRAbX0TJAJUV
 VkSmD/9JNGdd9hlYuPK5seOdRUw9D3e+kfq7Z5r5ehqQerDcyN7VqHmB59xSRDvlIXWv64aIaea
 iBCjQfDT9rwXqnSqR8sF/5DzLHjg2QO1RNpzsZSEqivn+iwVE0/qsIA3Xb0XRY0q4XFg/1teh5v
 LmgycaH51uFeneKcLgX3r2klCaCoLFiJ+o1Uf5gaZhFBX/eAMQIgBRnWrnVUXIDZwdUv9Bp6br2
 EIy/J40AidD1A01IZDjdbt7PFX84AUG9V3MeQhBIJTSVF9eqTk2HzKWJmDOVo5uZTBVUdPeNRvN
 ROj286zIbTAjH5S9qsjyV8L2vozam+SSHO2LQ28DRosOaY4l8ljLHLU0KBe8iRIMT79kIktHZi4
 +Z/Y+B1gHKgflmFEoGXWZC2Qa7ub2zzgYBGFHq+eQwbQ1x8YG7jwBOMRyupjQTqHDOHOCH7vFZs
 ZHfQJjXX1l0XGdI4sjdrXKQMg9ki9I5k3FPim8POsZhYzc/JybGDBiv7rMZHxLR0mIfh9L9DgQy
 Wry2EzsCE4wYfyN790i1mzMKUhgGW9kJiVa5IHNKYB9ibmadCXCmntgd4lkl3wILfceEnEy9fMP
 Y951inar12KW604qggQojjMaXeqLspk9jmSmlv06F9yZ7xk9/MXGuA/yyRvi7D0Xmj8z+enS5Su
 Mttmbtwwu8KZ4sA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f86e39 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rhu6fYff1SmOIWjBxU0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEwNSBTYWx0ZWRfX02MOwrCu4vbJ
 /dACTv+gCPANtsCCZKeuZHUTyIPdS5FSHLXLd9ct1XLxLnLrDT9P8DCBxWnBkD2C9ItDgZavLNR
 GsGIvrlP8tIeXfvt9tlsKf92U/fzlPiINUzxE/sfMRR17tRJSAR7X6pMDpuXuhi1Y1siSvDQREP
 ibrPteZklVxSp8q9MIxkWBrjYE01LPv7exqIV+uRmO4kQPQP8axhvEjM/J8ZYohW+tVA5UmwuDT
 CA9xY8TBssVUdDGuLUzdw15E3/S1+BcwGBVSGKZAjYZT6OwliXu6xLfyI3ONvXdhp6PxuTjZdC4
 NmryQl27ye+gXh9diHZl4IApNkigvF7KAZgTwQfgPsm2orHYpUAqU/YIVTJ8rWYYmKOfjAZF3tl
 2LeNchEGCVG8U0YySzQqZKXqJdhdU0Wea+XhszPJ0+TkeaH5eRW+urp618AT4eyXCLW8AUNfbB7
 lmrSLYk3/aMsljSRtbg==
X-Proofpoint-GUID: 0tSlX8khfZMwL-gVY6akNf876VquumWt
X-Proofpoint-ORIG-GUID: 0tSlX8khfZMwL-gVY6akNf876VquumWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040105
X-Rspamd-Queue-Id: 4FB254BB5B4
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105681-lists,linux-arm-msm=lfdr.de];
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


