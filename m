Return-Path: <linux-arm-msm+bounces-100461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJiIM4jpxmloQAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:33:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395234B07A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E9E03085112
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7873921C0;
	Fri, 27 Mar 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESWKwyAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6AGVNGX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95293A2579
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642804; cv=none; b=fm0Vau2HnzZi3K+8GCVmSDlEYj66mYe3VXWSD3fbaqXaRuK5ibcmSD/dFLGM6oJRJI0kqu1cq98v4KQa+EOvbXAAahXrPM+NrAWkMjQJXzf8PTKRybaJnarKeDwxdkc6Y7IiWLQ7eJARRh3YOg7c48XPOdZsAQJtWhRqtTU67iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642804; c=relaxed/simple;
	bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VesUHZ0I0un63aixPbfiv4e6pjhvJj5pGgpA4Ob+6LGrYwMRqL+5l8PCQLkcSg5EpDP3cfeHp4O2pJryiHdZ6qlncgKuID5yeUWJu8VQNEV5DzreS9X66h08EQfzwmMQncredl3uEx12s1xjp3ewFRBPFozTlihDeEKa6qOz88c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESWKwyAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6AGVNGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2q7o083479
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=; b=ESWKwyAaen7w7fyP
	XCCojErwL/33jOzVPaPm3niAoGzOc7p07HJ4TXTX9V9/nJqqF1d9jYGEW0iou+3z
	Z48C4sDbXw2AMna3xAl+u+bjPbjtq9RHc/GyJxlnIexdXzOliyrStAxDqnzivFQL
	dfNm2seHP0iGxZ3Lkm7oXLERW6luDjynXPHjgTrdmax0V1pZNo1G2uDHvLxIY73+
	Pw3bS+Wad4smlr7d6ZCRgTj2sxHGsVtzdrZ0TVdmW+BEoP9vF0C7NvWlMl1tTzqB
	6W1WI3+sV3U+b3F3vMOQ+IktKoBTI/jbNTDMUNHSDmTct1dLilurLLJDGLdwWzLR
	yleKBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx3cjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:20:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50937cf66b5so119852641cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642801; x=1775247601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=B6AGVNGX6eH4aHvY1ghnBw0JRlPO6AD0S00r9/ceCyl7VUcX2an4XQnNzPzsZNCc+O
         kCP90KLLeKUQ1sXzQOP1sKCUbJVIzxrpFrjdn13PRd83g2+Hy1z6LdVXHzULJRO3GJrq
         j1ZeM1cbaxJNbWurmr5GhE8yg8rvVoOuGuqlR4MumCRLGW91BmS1vHaVr7uu5DPcykDm
         t74bn4Sb86R0edCEyt95Qqdp+81tE/0wIN63w32quYUb1t+OCaVEYRKS7q1h6FaDZ8t8
         nohEYhlqjwKlZJaIh8jLSbSupOjBy1x9l+TPNqlYMeAN3ocvGJLRzcdgFiK72Z+1VTFk
         tCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642801; x=1775247601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=X1V7oigfRXdpHFvxWDhj49Gcfpivtbo6mrQ5jSHyADnRxRCuMGDZzQR+ivg77p9NWz
         itYGhdg1pfooQ0M+1/Hm5XKo2n5vVioCxK7V7TrsF+6yZ7VLaimbRLk3kOsXU3ZMxdy3
         e+HGxKnoag5bIhzQPNdnRHgNCRNvTGXZHvMRstqdwccKTbA7lzzhowZ3DvQ6Ws0ry6ke
         5LkDjbzTWCLVc2+M8Mo+3AGerxiw5htI/J1sKcO67YQt5DnH54ptBH3nSqfc8fdMsDOO
         /ph0gJCKO5YR324rtnbAwLyZkClJdFNg44ihrYM3jZlokh3vjLJIPfnPJPZ5agdE1wX0
         l96w==
X-Forwarded-Encrypted: i=1; AJvYcCVDDLRgVoY92nAwObNL60O4mMzHvEkR4FVoPuZYtzLwbD/81jGq5al11ZgM7qhZKsfkURScSza1sVK+VnmC@vger.kernel.org
X-Gm-Message-State: AOJu0YxfdSRX71MwddB+tg8YGokvSKdob8VVSpLGkuLEcazAqNMnYvtG
	oUkN037zQPIH8MrD076GfsoqG04hvhmIKbKObq3y5jIrFxzN3kNIS+I1nwu+XkM5Cf5nWO37Mxt
	xBy2PSpxu13oDClRHzTUAxjf1So8cuO+5MxFBit3i/F5btG5EO53RO2hYT8Pn2Xw4fdv0
X-Gm-Gg: ATEYQzy/tmpomqSNoe7ngjZzrauQoD7M33sR1rjci9R2eoE5oMfJ4O0yxX9+j+/Di2E
	QZ6YwKRrT7IUMp59H4Oxibn4mDWAQcWAlCfHte+DChAgBTxOnVf5z5UbY4PJ1UuEcqVp9CE60w1
	tTzESQQyji532e70KSq9af2/zCWNZQ7SWXgdD1Uq0Il8HwIyny7V4oMt109TMsYYNrBGpMSyfmW
	grCwi6tBPGkl6Zt3wZFdljCds9nDfsqUOslqy55GfHF5ifgZTsAsz/wwSQMWFlLa4GKeXEBmBq2
	ajggYhj+e+wsnWoO/TuhQrSJabTpxcllFbLDa5u7VxHvODKmQ+hcLa5temjyx60gY/uidR7chBb
	B0pHwrIqX3DEcpmcmm8SsqWljJV4abMX5F72+de+mrf1To5W46e5/g+4LM7Ze09D88bHeeLUZOU
	a7OhLHyLei9K1XIps/SwhJRvadM5h5235jsYY=
X-Received: by 2002:a05:622a:1886:b0:50b:2ca1:4d85 with SMTP id d75a77b69052e-50ba390dcb7mr51876571cf.52.1774642801196;
        Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1886:b0:50b:2ca1:4d85 with SMTP id d75a77b69052e-50ba390dcb7mr51876101cf.52.1774642800707;
        Fri, 27 Mar 2026 13:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:19:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:54 +0200
Subject: [PATCH v5 2/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-2-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZrEeRxdm2oFgIKpGcq8XmJigyNmQyJIr2oE
 szumgoILv2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1TAYCACSHejZpuRmFQIxR1d+ocU4SxkFFv9c/A7YB3JfkHaHvPZkLKu3Bw2W3R1xrmXjCIGheYW
 770KS9OuLpEuaWC7dRp90a/+pMtTTmBTNChqGI4BHWNA3FcPwsUFuAbdrYKvfKa0hyeVk6WwqKn
 KhQvKmgty9HKOzw6g8LHGb+k8dypNKn52slDc5uEPYwi3Q+oIxg3mehhVXL5xFKex/gvRVxy2zX
 QyWvhhi5sCJBM0sohsB36BU8q54f2BNtw4hHduB1jAwg/2kIx5tNYgBGAFzgJgq+uM7JDfYhUz/
 O7MVcjR6w0r9wDeAxax5hvyDQqKVgG4Dl8a7kuATAzdZP6/J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6e671 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hSAFqsofyXGsHn5IxGfZFo4J66eTB1bp
X-Proofpoint-ORIG-GUID: hSAFqsofyXGsHn5IxGfZFo4J66eTB1bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX7SthnFOAGXpw
 36ZvP2lVk4rn6TAtwAxbQkmz/EMiZyAAYQqpy0gx4sK4WNhXRCQSVCViGTvhUVFY/wvTkPvHFs6
 iJbgxGdNCe8bJKFgoUHvcDFwhIoUa2nAXiqhQ/axFfV1um5Eb9uFxn7jVLNda3rZlVD3epq/ou9
 jRP+aaaQcb6X5A16SaEQD5tab6lV+NXIQ3dwAJ53CClclp2Ulm0LUCa9LppEIUPy7wGyoEFJctS
 Z9hPhGa5QhvuvZGYN+V+cWJoaOKRXmHYnUao5/cEcliY4j9ZhI+EVlTm9M0dRHYN7dZ29rCdZ4H
 9FiizbmgeS4lWVcQXgaNzsBnZ4Wc+M9ARcp7LXYkvJBerW3Fx09weLlH7R6FLt8Wv1I/uaLbKfy
 3ZhZXztJictsxXXcu+ZO5T3u09+P9EKXTYGazH/jS1ft+1LVFC9C1DwD2Q6FkEX20CcuY00Q8zZ
 JBY94rPld398Yf3WRAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100461-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6395234B07A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


