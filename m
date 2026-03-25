Return-Path: <linux-arm-msm+bounces-99778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AnNMSZfw2m1qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:05:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B2531F70F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 546D53162CFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DDF2EBB86;
	Wed, 25 Mar 2026 03:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au5rUQ0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSZPEiEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88702EAD15
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410839; cv=none; b=JMJYlbjp9/G9/4/djd/pcftIS/vdsgdwHHU0JEWpJdwqOV0GGcpaCLaurmJ+QaGiOcVJQcykXHdlrlRUPHsytQ01jGl9Vj+XIiuHmHyhZZ+4evyl+WMbXtr3iK8uzCJwBIQaVRWVsxNAZv+s4IoIWgadhHwopuqaOmWMXwNEvYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410839; c=relaxed/simple;
	bh=+eMOLBXE7wjoxeetGQX1D3VW19q27MSb42IYcApWQvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RDvr1yC/pN0nZLfR1j9SwCuR8HnMOtPVZTKC06hsBx2bh9ocj08QRFUlEs2+/z6CEhmPCphFS689OfI+WFNMt4pNrDA6VxOLxRxuhn5o/XIVt/eWuXDGYRZfXT9aQweF8klGs1GKp9Ta4oestEgMuRWhAxrFTBHngiC+nkFUgQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au5rUQ0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSZPEiEG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMhmRF2791272
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vzyNvMFuHZ7
	AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=; b=au5rUQ0c+E6bEn8qGk+2XRn+Tnf
	M3ygFDhnB5kivVqYU9utjr6eScJE9CNDrJvF6WbiGRIb5sO9z849JkMCptQ/gjCQ
	ZtUH6d8koDX/l8WrGGUEHZFkMEgg5bEVIHU/fVk/l+A8IpGHgTO07D3b8WaDg0Qb
	zlTG+lu/5AwjuY2cuxrWWCdl+v6pfLnSBtH9iawwl3+u+n4N2yIgVATaH7zYdhTi
	VyDve1qyxoRULdSU5c5FvQ1jOA0tUuzZnOeOtYzFBIbyIgL38cZP4RDmzQK/yFsT
	hp9YPZ0b0MuXbvCM3GwhZUjEisD3cxdmxE9Z0CRWqTJg73vQehQN4cpz/9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw439d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:53:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so4504192a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410836; x=1775015636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzyNvMFuHZ7AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=;
        b=DSZPEiEGIi5MoXT7vapJdkVVAVyCi1TRSdj9XZFWq7RbdfMJY5RiDNvT/3JsTRoCrE
         xEduMK3unebq89xl9LMr73KkVNzuHCGj40h5ghodGH+nLiR9ZswWTesKpQFVbFO2doYu
         3bakV7UDT4WvqmjqhFqvYFJgJP0neC84tL2lKb5DcTcUnH8GLWnRgDUTa0hiTUOB97Gp
         oIC9Vt6IqF/6BVFrqZqh8YGxQBkqjKJ3ZefkIOskPtaJ+EndWCrGOy7S2iaXaecFrevj
         UuHbimYHa6+fauXYeQwVSnmPt20wZtQXmcpUbpuSaF/NObMdHxCDGHQOjNl4UdLg2gIf
         5W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410836; x=1775015636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzyNvMFuHZ7AMRTGu9dBLqXG9QjRaM8aJeviwp6Cqpg=;
        b=Kl2ZZCqb9dXbe4mrTZP1kzokOSKXM0IZhqK0MxzQd8aoffHQprkhdbdtoU/3Gl2V+H
         o2/7VLsOaa36PvwUeR5vi2eWLKNMSIVqWRPFvpoHTupeu4vJBW+qx+BGjtL1gjb8qCTD
         QWX+8dyhSads7nskaZ0TcW7VT/A2/9Ak/4M5BxxHbBVp7dv4Mv1BA5B+P49HTerQipwy
         5lbjuxy5V+QVJfmUQeJKfysffwB9UlW/c3VaFrob5Z3mODcURAiLhA+iDY2UuILb5sYF
         4tubsEUTvf6/5mH92LqigGnGCkOrfvavQYr2ONkHM3ws6A61OlBS9rpGsF8Mfnx+VuDF
         DU1Q==
X-Gm-Message-State: AOJu0Yzw7U/0/JnAVEiso0eRxkMhpIDeF1Bt+ZCEl0Tx8ekONGp10oVE
	A6dP45ZHb0Z5OnJ7Ojyxclxr5KVMeFD3VFKXepxAa3gc6APTsHq4gW8Aazshn6j1lKuZs0Bq6kj
	FpjhCgMnmIZMdnaXvOoRLdV1I7msm/lXteP9oKXuvBI682zibxYrWq4u7grOIxNze5H6i
X-Gm-Gg: ATEYQzww2KVvbI0I9eG05Mehc42xumGUzH3bNcxqc0O4/mznOaJ1isjsz+CPSwu6cgR
	dSXEUp14LhFmhnuYdWK0m6p4Fl0fJXV/m/oG91fP7xjrFloh6qx6YBYxu7IqIqrgE25jI0+3ZpK
	q85lLPUGNykaHES+rD/nKSWaEFPJTdCgqfeygriPmhlnSnW0s5jGgt9CjBItqktm5gRKcrj+W5h
	FK4cRbKbSMk3sQIfEAhtHsUm2WYeWg7mBiyg0/dkLgqT+VSvMlFRd/8bAIOthISKuQgYduFyxpK
	BIVkzujdWh75+lfmYVMpLBaoCE1pbj7s/fdJDdvtDDKoHBeZr5xkzMV0GZ5X0r4I1ZmszT/lOVn
	2VFHuV9xzAn1FPyjMsEcDrzZ3PN9ezna/oSRlN0K01Q8c9xyyr+g5nSNobYPyXGvGhNPGlftgOa
	9/VtYwdTBv+fCvXVOAqHr9middDUunewZpjjCS
X-Received: by 2002:a05:6a20:431a:b0:398:ab13:b990 with SMTP id adf61e73a8af0-39c4ad5b696mr2381832637.34.1774410835788;
        Tue, 24 Mar 2026 20:53:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:431a:b0:398:ab13:b990 with SMTP id adf61e73a8af0-39c4ad5b696mr2381797637.34.1774410835085;
        Tue, 24 Mar 2026 20:53:55 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:53:54 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V6 1/5] dt-bindings: misc: qcom,fastrpc: Add compatible for Glymur
Date: Wed, 25 Mar 2026 09:23:34 +0530
Message-Id: <20260325035338.1393287-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX4+mPvrMCgC7B
 HtXeeg54+Cvz+yknSDE5xUZnR7MbNDHxMQlbabYlX8Z2tqbyLYrGoUiaWUxHGUX+S24G3KTd+FI
 SQxTyCQTDHw2TCYWYYXmOCshBNvVkFCCXsopGoXMIiWYkhk75AgHsK+iq/2UynGc466Na/LHu5m
 Xpm45sjk7UpuF2nUv+XPdB8Th5W4Yv7ZhJEo3sevEs1i5MeVeXiB/DD+x+JcXnKY5OVhQfwFrEx
 kiD08UDGV3a+BOO+eQ9gYLllaSm97WXkOYriDYwBDH/Bs0dXLJgAt2/lBwAXgO8Sw8n7ndpoIGA
 aZ05WnF91iiKINMJXWpMjfvMtKhi2W3RSkkfmomsROnmewwZC5Q5rrb0rQSeLP7yyIaLv0D/L5c
 OalOig789tNBCl5qwhPTv33W15KVpbE3yC6IuGKYhoy/7CT/vWlWUya9l+SeO7OP5ZVt+k0PYj6
 k+saH6Qa4/a9xU/n87Q==
X-Proofpoint-GUID: _27qiLhEjVxVIvYinkrDn79WVPsJBAMP
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c35c54 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=z2LoTb0XuyLmHK_nd1IA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: _27qiLhEjVxVIvYinkrDn79WVPsJBAMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99778-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60B2531F70F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document compatible for Qualcomm Glymur fastrpc which is fully compatible
with Qualcomm Kaanapali fastrpc.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index d8e47db677cc..ca830dd06de2 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-fastrpc
-      - qcom,fastrpc
+    oneOf:
+      - enum:
+          - qcom,kaanapali-fastrpc
+          - qcom,fastrpc
+      - items:
+          - enum:
+              - qcom,glymur-fastrpc
+          - const: qcom,kaanapali-fastrpc
 
   label:
     enum:
-- 
2.34.1


