Return-Path: <linux-arm-msm+bounces-104449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBYZG4BV62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:35:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568A45DC6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 383B3301BEFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D413BAD9F;
	Fri, 24 Apr 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLf7kq0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLFh/UDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBC3B961F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030502; cv=none; b=ZkSvKiWAOcuraO6tY1IL1Xmaxv5+5iIqx+65GFsItSVJ4B11jIN7zvvkrTd89i6rniRUsCZjWKmU+C6JIizgbHc1ZLjsWiBmQb2joz7Ark0nn5Z3ojKJXCZ45TqWbCmI2qU934LA65uujFJ9ZIchqEykR4wtdguzfjDaEZfCoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030502; c=relaxed/simple;
	bh=uRqx9+tFa9YY1/KJ/Gku08nL4dvx/MN+1g5RGjJmq4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NC/AbVp5fUHBC0w+9ERMupEKw6Y7/Fl/yEftRqiMcwEWpS+OuYeUEwaVp+EIK07oQS2x6GyoiXkynVYryArZ5/+wtev5dLIPmqq39j/+Cmk++SIo3S7hAcwf9kTqmc3H4zOrdCZgsw/27t1DK8wxRqRbOMg3H3clcelI8ko+dhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLf7kq0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLFh/UDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9G0GR2709849
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oSHDQ58vYI36DndD9bBqdtSMKh7IjUIJiykP/8kfoE=; b=FLf7kq0Pes0slB9b
	D9FZCYpkHYLKTiS6JNH1htgwRHkOxhvAPW5eHflvzW5akQoz8Ji+UdXraFIGrIGa
	MnbXw1UpVjXNspp3CPl5Oo5iTvFOZc+lTL+hT/rkz0bHeJ6PbnC7UznWtUj/Uewr
	QfIzGX8/9fGhlpuY8knd8MB0kK9/dPvPOkDO0XrUyos7T17b0/mc/thUL+DjsiZl
	Gio785bjeH77hyZ2A4RLGEzRXU4eObjMSXvv8as7W3f9nE3v9e+G22wvnIUibCNW
	zgltcH5+SPRGhHSZuEhRJQpbI7gUFzte7JiXlaeNS8VIvELBI+vxKDuMc6/7urhm
	QT9T/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9uwbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:34:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so2019697a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030496; x=1777635296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oSHDQ58vYI36DndD9bBqdtSMKh7IjUIJiykP/8kfoE=;
        b=VLFh/UDY367xT+7XGXiMzQedhq/7i778TyigeNX+kfpupBMCqUgoIoH74bigXbQvCe
         EyZjmw/pCe1JI+LFQsPMapcZpun0P971i0cRgMXg7hzRKjP459ShRwu1+2lNp4uhbYp2
         5ijG/T9tlkR/RjrGGibbDSehXi8l82GY03WV+TImirAE3u6i4MMsPzGyPGTJO+e51BWw
         a0wy860QEKEhMcusu/kekc8AOyGxvo6MkZ7hBxa4cbxYumSwxczi5jMzqxZFusdGrx7q
         Hz12JGhjwn/bXxELLgbgq9snfkhdw/yQIuUZX9rASDMM2yUuXvp6ib6zfXGEfCmA9unD
         VSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030496; x=1777635296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9oSHDQ58vYI36DndD9bBqdtSMKh7IjUIJiykP/8kfoE=;
        b=MwGJ+j3sy6vg2sn79M77i7Uyo5cIMV+xHW2INeCPvi5Xw2wjUQMYdQ/WtfnbQu5fP1
         hGZkwH5bkarZEXR+WvSCkZhpAGuxWn9k6NmE3xC/KHcngvRfHld5HdzWx3MlVRwVqbbW
         unuA4C0etrKt7gF37L7aS13ADqkqreOArXI0C8c/yqZxBymoLVGjqaiskmI+TjlKr593
         DtQ2jXnS/+d/jO0L8FldTpDWA0SxJ435T8GA3lmYw70eKDHuXRu9pSMNujFXmYcbIQRo
         l/7dqCZlZoRyAvmdaxnaQ03Vde7LQXZpspShpQHKDe5F0dkNlNdT0zE9A7mrjUv7ys5j
         OVSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VmCeLyPrWdppfouG+ve9FPUl/qJjdwgsC6dgRsv+mnkxcWTf9PeyifVzG/cHYyjR9lKCITrsYDCOJBqPO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HQwLjH+6hu94wr7kwWniZKLlQ/R1PfcKx1z+R5GI7ouevmyv
	CoQyD3cwxeaMsll9cCJ4E1DUiGMleBb/M///ZgujdQvZClldOqDYL0y+y15u/t2FRRBJiLhk6B4
	uIXEjvtA4urlykwNZNYyxyU3xu1V+lXoxL99zF+nHIJUCFnd3hj34MmNCFT0jO0Uv1/m0
X-Gm-Gg: AeBDietwNrD0gAP0+rr4t6X84o17MGq3tpodvvaPS+hOYMq90+asvfoTd/qZM5s9/1F
	GQlg7bNPj5kN6iFEH+4KF7Vu4GyB5QNKUtSlatyVSEJVdp/RaLIMazZqmhN8bTY7K3dnVZkHqhs
	WFKU7vMuyfPrwPEOW3OOVROFCeuwwtdGO7BK/EIa28mAATZFdxvkkcRSgSggmcE+fYFWdlHxbLD
	XiCSOLhD/f0LoAdIHjYbycPDN69cdf+lUx17/vNmFAew52G7IGvFB+QBvk8EbLCPIPfP/wWCQD1
	E6Zg789YpH0pLGyg1me3wqQg/lrXWBe/19YhRRi4tkQ2YE4CtB4FjblsBnC5sPq9EmAOAlVyE6x
	kQc+Jq8WU0Y6ZMMuRBS3Ihnm3JfSczRozsmYNppDpJZRJtBPI2jMuxEYtwdDihnOMPg==
X-Received: by 2002:a17:90b:5865:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-3614046f978mr34671509a91.14.1777030496001;
        Fri, 24 Apr 2026 04:34:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-3614046f978mr34671476a91.14.1777030495353;
        Fri, 24 Apr 2026 04:34:55 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm24204734a91.2.2026.04.24.04.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:34:54 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:04:15 +0530
Subject: [PATCH 1/3] dt-bindings: dma: qcom: bam-dma: Add support for
 kaanapali BAM v2.0.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-knp_qce-v1-1-813e18f8f355@oss.qualcomm.com>
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: m95XG6QXDZpwHQZjBd2LkehQokjE8I5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfXzQFujKB6+R8S
 GonsFJnXeDqqoj/V5re9Enjln2R5CTynZUvBCX9uqsDZ+JrG52ynqStjtB5p2wD6ItL6SJWEU8C
 SRfD1CXBsS4Yr+Bq35go1/1yZrq1+hB9FWnXY+bXt545k3k38L9+F07HGC3Z7YIw3hO2AY8AqAO
 J6Iwk9dLoVG7HOq6yeAHa2tn1Kb8hClfC2ZZ6NnKHiTVrY6sUml9Bz7TgIrgM1v7IojjJs14bvk
 Jcx4Ja401CDD1OekxIKW+igcCJK+g7UEL2cCmZjpAhmRteU2UdKSwG0+atGfyEo/mBtxgIhxieW
 5ODWFB+Gs6gTN84ZzELBaVTpMUl6l8nrzGKDgMFva9+dUc+zAV9tr8tjOsmMW48Jd7nD7rTxDTU
 KcomEL6k2vx47J8nBEtEAJVTADI/2y6PnprDXrEB3b/vcC5VwagxIcYmt+jdtsBvTlHCmH6TytU
 +OfYLUyh+nVE0j9dAzA==
X-Proofpoint-ORIG-GUID: m95XG6QXDZpwHQZjBd2LkehQokjE8I5R
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb5561 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6hn-QP140KOHNlEGON0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110
X-Rspamd-Queue-Id: 0568A45DC6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104449-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1dc4000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Kaanapali support newer BAM v2.0.0 version.
Document the compatible string and update example along with it.

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


