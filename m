Return-Path: <linux-arm-msm+bounces-107438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN8dD3vKBGp2OwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:01:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A464539777
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56F1E302A9EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8053AA4FA;
	Wed, 13 May 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuDx3Hpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdDOJb2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4A3AD52A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698367; cv=none; b=FwHQ9U+39znkGF3L809Olc1ssscBulHaq8NUuoY/7isErD7yRQl/OKoYpA0d76hdMqr6ToOaYGjeET60qPxAMKc7U6y7TfYBx2GxqNfbJNLUDaaTQj8NPLpGdvuoi+eKseRkjtRmHavPUhcpBqsrjhZoe037O45Fr5fhDEewZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698367; c=relaxed/simple;
	bh=z4FbzAvY5pZ8H9vX/hG/UlmCYedeJ/87e4jZmsMaSQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxMxdymEboIxvVw8NDGdgPJnNXm07c45pvg7TKig2jHa0zjVHFCuQxCPomkilbeHF1aUNHjz4S1yhIrlLP+SIjCfeBmxhxeDxvKv3vCuCOICGwsTv0fRuwVMbU/wDycS+Jfw0RiawbYJy5SlUgUEOWMWvhHHVXs/rOPzxJLJl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuDx3Hpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdDOJb2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEvDVo4161718
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=; b=PuDx3HpobMVhh6cf
	vYT9Nj5kLtyTR1tHGzpFz57KQTgeR5WMujDJwuD7GfLT12USLXMqCqRe3bgbaL98
	PujkNrcyjHbSA7iT7KkX0i9ibsTa63r83KLbHRNntM0Gxu+QVDF3fxapVeumLypB
	Q/QMp93UZnpuh3NJkETwAufNZdYFHnwNNRtezfaIr8Qhbyt1JuK1Ikucs7VcvhqV
	ew779iTXrnZTmxn0FCLdQNZEUTMltRj7QRWAIs+IJ2KDd3+5MMpUOcTxe7cccJEw
	SUouCwroPyV6/3Kk9GXIpCPjodyjZP90C0LgDNsJiyslWVBeQTiS9xI0U5JOQb2O
	JZW4WA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91tdp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:52:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36603ad6709so7467181a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698364; x=1779303164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=OdDOJb2N41iKLTeSkAFv1fvX6RbOZ7JA5bcvmd3kio3foIpJ61W6UJRQjkAEpbLndC
         oYfb0Ebbma2HkdkXbAXwa3TixjQWge/Vm4WXELTW6UCn5Nli0JI3Y0RqcKjl4LYiNTmk
         spApSI59DtO+EFt3IHzzifVOcQyIMTAQ5Jq8+SSY2dDW4nJlFYJ4CbJXv2muUAyv1jqa
         qHZMTBYCnaaoxq0vVZW55m/Rv5YXeaQUAwFy7l3WagzOPw42lagSIWcewq04CSMaIpMF
         4YH9J8lFMCNkz1eiS/1iT6kr7YmkWwYw00IT0K0Xh309iEeQwennwxIVeVsazBxUxshB
         528g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698364; x=1779303164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=FlI1PQYOeYeG7DWkds/QTt+y75FD6a70SU1h5TwzGIta15WXAg/t/1g/KNLGfYQwJO
         HZocLkYg954oHhmvOYaFGpVZIkL64GdgSSGGjDJPvyq0GEdnC5uVs7MdQodISTGjuaz3
         1hAEQ2YbcxJKY5RMV+tuGEwv38XELApBM+8nIEKx48svsto2bXJEW0l5GOPEf3qPCuaM
         kdd6A36QFU9KZPL69S8ewHKl3sCZMm92fcdGIDwXtLModUtsVHgZ7u5QyKh2A95B66U7
         uX8yQUaojohmOWjVEoi/iSkQwXEZDuOmWlrPju9oNyoxa4bpNjYzgSU8qxQUJZBvXJS6
         /83g==
X-Forwarded-Encrypted: i=1; AFNElJ8xPcSd+7WBGpujZCVyXVzejjvhacWHUfQcDOO+QU1coteBTnINgc0D4YtTRh0d2Lj1J8hCChe2vNMp4E6d@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRNC7FIt41EvDC6W6k9w7Ucs/s7IMU7QKT/+ZI1YG9gAa2u6F
	sH008gRKQTcv+xfd/UikUgHYcYQ33liUpBRLXYXViW1csmGWQG00OpnAAwX8Otiq9BxW5RgArpu
	+wJPrAEFrmyLhrovpCjqg7mWmV57UwsKTo7MpGKA92ohnfWEYWzLNWabQ4pnO/5w+4m6b
X-Gm-Gg: Acq92OGSjSI8amEzemUEAKWJKPKGaeKNUzL5erwTzdgf4YXecl4WPCUvJ8c4VyF4jHk
	mVXLs04YVre+CTtEOYo1YCu///FlU47uTXeoqStw/wmkW041uHxjuCyhX/ezTT4xKbaEosw1eBC
	lefuh/8Kvmuh8oEjeyJTSxeV41BcfQFSnci+WC3+SqK6hju6ohXuRvB+DVIRuPQt0oLOIzo6wj5
	liX/69g46oiyK8lTu7iihD5jx+Cx583wTb+uENO40+wQaPTEIuN8t9xKMFQH7GiAlWtRJbH2GqU
	rm2J6U0WIf9fun7Pq7mqaUcJ8egp4QZukK4ziUrYiyUQCD6NaMwdh9wVhox83pkw1SaJwh07AMa
	qrhEJ4yCPrUCb8hT3KDu4yWEPc2WclMz4SdbNHE/NTW522SdZ3w2m+mQ=
X-Received: by 2002:a17:90a:fc44:b0:368:4cb2:17b8 with SMTP id 98e67ed59e1d1-368f40835b7mr5264321a91.21.1778698364346;
        Wed, 13 May 2026 11:52:44 -0700 (PDT)
X-Received: by 2002:a17:90a:fc44:b0:368:4cb2:17b8 with SMTP id 98e67ed59e1d1-368f40835b7mr5264290a91.21.1778698363854;
        Wed, 13 May 2026 11:52:43 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626a04sm3660219a91.14.2026.05.13.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:52:43 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:22:20 +0530
Subject: [PATCH v2 1/3] dt-bindings: dma: qcom,bam-dma: Document BAM v2.0.0
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-knp_qce-v2-1-890e3372eef8@oss.qualcomm.com>
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: PHMwgG4Vm05z0UqUOOb0vtrEd93A6VSz
X-Proofpoint-GUID: PHMwgG4Vm05z0UqUOOb0vtrEd93A6VSz
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04c87d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QMZoEd0Ms9iLIoMSFykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfXyJREv00qfcYk
 7lVXdWvPEyPuPNoqTS1bixXHSxdZII9A9saeMHOwhlELK7AJIY17pcjjLNmMoJb83z/LuPfw7nY
 EvoQn4klIUUh0drvzc+rqz8tVha47n3ith+GOUUPlbQUWvRvaKQ/hBDYqT7bgLdsmKxhZGsEkTV
 f6RF8GFbC+OnEfs/BmLY/wByxtrrTORk4hY1Bvw94l1PGPszQomUcwHSbe1vj38bi3NnckBOmsl
 hD9wGvNyrlM/aMSQS0Tvt6N3rNXSrVT0IKTYlX7UUnCDHFw6ZJHwJAwsqnSTwZiPrYKSQfnh/d0
 r8P8Bx2nXwZ4+ChRX9Ad7PI8OWd+zF1Bw0rr2zOXZnNuqLyrVdwsl1DcYtPHFrcQVZo+1s+Fc4I
 jDmsTycmQXjaqBi4bi9eU+yo4JP1rQqy5PNNcEUIQEsampEyocgPWeH+gVM2vR87QwjXJQMEFz2
 7pf2JsmCp8+W/PC/cYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186
X-Rspamd-Queue-Id: 0A464539777
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107438-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible string for bam v2.0.0 version found on kaanapali.
BAM v2.0.0 differs from the earlier v1.7.X revision in terms of register
layout and offsets, requiring a distinct compatible for correct hardware
description.

Also add a new example for BAM v2.0.0 to illustrate a more complete
configuration than the existing v1.4 example. The new example covers
64-bit address and size cells, IOMMU bindings and execution
environment–related properties required on newer platforms.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 6493a6968bb4..0923fb189ada 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -23,6 +23,8 @@ properties:
           - qcom,bam-v1.4.0
           # MSM8916, SDM630
           - qcom,bam-v1.7.0
+          # Kaanapali
+          - qcom,bam-v2.0.0
       - items:
           - enum:
               # SDM845, SM6115, SM8150, SM8250 and QCM2290
@@ -118,4 +120,23 @@ examples:
         #dma-cells = <1>;
         qcom,ee = <0>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@1dc4000 {
+            compatible = "qcom,bam-v2.0.0";
+            reg = <0x0 0x01dc4000 0x0 0x22000>;
+            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+            #dma-cells = <1>;
+            iommus = <&apps_smmu 0xc0 0>, <&apps_smmu 0xc1 0>;
+            qcom,ee = <0>;
+            qcom,num-ees = <4>;
+            num-channels = <20>;
+            qcom,controlled-remotely;
+        };
+    };
 ...

-- 
2.34.1


