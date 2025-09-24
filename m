Return-Path: <linux-arm-msm+bounces-74627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584C7B9AF2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC80C3AF750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 17:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBA9314B90;
	Wed, 24 Sep 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8SAu5ZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044B314A7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758733282; cv=none; b=K9bfnZa4xzdk1KNEJcGcYmXZI/ogy76Xr0w3QeSspaRHYKyqIcfYhEUX48a3s6v0n58yW9ifFKPvCtCCAfl1LeEJmkvFj/zYiOYQSMBrTFvG/yVXRgFGaqC4WoS+L9gllG7AbZ+qozbVb3qZINHdySj5uokP20oh0+Tlm96TmZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758733282; c=relaxed/simple;
	bh=1gqZ3MvQgJWh+xq3wbNtWr0VkL227CpxddKguEfWUHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaY/4OteFDGiEoRwyuMGhCGY+m9tmjNXqnl+03Ir964KFQmh4D0vj2TiFJfONi+nDmDGffgpnkwGWqAwZRfjzveQg89jo2PScJWhX02MI8BNLbaDRHiGstLDbwr2Etth+mTcxgsA4ptEIY0lavo4d7GXoM8HfyLMAtwSVrVrP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8SAu5ZI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCvxnc021502
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJ5qWW3VgsVqvsqQFurOhps8jLb1RkvDdrsWirCL8PE=; b=V8SAu5ZIP9Z6TWnI
	LCD0/oiBAiEGumg8glUQOLLV7E563EPnIHjMAB1tC7+81IhH+6haKYElHfs3QexK
	DUlaJufTejCmZqxzOCPbQ1z3QbZJHHtBtK/tvY9vk+z2wpNT+sxJuFBqosOOTp0r
	kB2XxFtUhWsZdXuyEg+BLWg3o8glZC164ku4AFWXFVZ8VPjjB542UrBpNSVY8+W2
	YsvIYmkSldfJ8HcabHHiZl/52lPtjWimHt800dH6TeR+jRFw7nAWBJfWFSvvPkTB
	NVNWWufFb6GtkEOkj+hCq3VMUN1Av/RszgPfobrmSu6G+mXd0HNKKCAjzRk8xklB
	AFqC0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budacphu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:01:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso44365a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733278; x=1759338078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJ5qWW3VgsVqvsqQFurOhps8jLb1RkvDdrsWirCL8PE=;
        b=M/aiscwswBbm3828Wd6zXcrtz2H/j9+8CCyRTdPX2QgIkwccQB8whz2PXwVLMyJL/u
         LavOtxwJRGFgDBb/4zvMXOvhjXKZxaJZzRq9oAsc6Mnhh90Ycqh0xWtAfG/6TsI+dwsD
         TI5tvYEzXzonFQiNxgKcA77bOHq278xoxgE0jPMQ+3aGjsDGVT69W+qhbvdTi4ELJVHL
         8Kc3hw1NnKuHuaGrnI/mmJ0sNUVlbwEnRtCsXKHeY/BjfZNB/UMx4U0z2kDhHavFrJ2d
         XzycliwUIcKQjamSpq3XkWtltVMPsh83dAMJgURS1s0KjOOmYX/ALO1Y0NzFfkxE2chB
         LYcw==
X-Gm-Message-State: AOJu0Yznf7ALGD53wcdmVi/pu0MZLkG4WMkhteHzi/cGh9DfyA+fBf7D
	cDu0XAFKo7HbbKsn/8bcHdB08UkXhdhwYReguUtozTATZ8pUck3jsy/tA2IVhoj0q5VHtyotIBX
	xYECabBiLd0U5oXksuxL80a4cvNaIt0jFdplii1gD3gB4ydL3OY0oCW4YrWkdT3w9c+2i
X-Gm-Gg: ASbGnctCFVXl6ZiK/RxwPB7UzXDda8UfaLi8nhU0be84pN3/RdKmgXcYuE7w1ii7xUX
	Pj3YC/FUfJQnUTxzHWh9t3sw/V8uRRrcYS14Te5B7ZovNLO82oMM9IG2yOpY5BObJuviFVh9RLU
	OMNF2q3ha3Gf4lMRIJxW5a0cjXp/0CfQ5cHrE0iuFicgCU4eCQXED2xIKr1k4Y7X65TbCg5YobD
	Vg8g5ncJDR4/bVosL922+JTpTU9RRuPYUcNOFXqPXfv31pZleEeGI76gW8wcruchk+vEBJKIh0H
	XWHqGrLvrFLpWfE0MdpVcEIa4TiWPZ8UeG9jrJPdIEGiDZHLsATJRGtxihuWBa1Zj0DWKuQlTUE
	xGqFBwUbdMpwBqFjU8Z1fv8LLbg==
X-Received: by 2002:a17:90b:4d83:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-3342a2b94b5mr423341a91.21.1758733278141;
        Wed, 24 Sep 2025 10:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Gn2adVKxoUuEiLYPluX8ynbq2S8uNj2yDNuO4Gj9QlSI3rGTTUKHg3aCuwM5/o2xjxa5lQ==
X-Received: by 2002:a17:90b:4d83:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-3342a2b94b5mr423249a91.21.1758733277343;
        Wed, 24 Sep 2025 10:01:17 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda09a0sm2931299a91.9.2025.09.24.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:01:16 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 22:31:02 +0530
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO
 bindings for Glymur PMICs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758733268; l=3159;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=lI2WeMrIGoMrocQEBpzxd7VmrB4UTMw27mx1IjPUIFY=;
 b=j/IxMuzmBn0o0t4CiORKs4DcAU/tHSoi6Nf7a79qlOn33c7hhN44F+d44mTA7LooPlJ3+aVm3
 6cI+I77YG03Cx/uGiwbEV5UuUX3b45huuVuL9ymuF1gQLecewgh1f2Y
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: 5UaZliRx_vXD96TjpJejPn7Q2ZZ0KPYH
X-Proofpoint-ORIG-GUID: 5UaZliRx_vXD96TjpJejPn7Q2ZZ0KPYH
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d423df cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gVt0xI4JxzluFwnjjo4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX52cD88ShpTT0
 mbdabtP1mbSMwuvrsDDyFsJJGHRy24zws05CHKpW/eG9ppcLOsfn6ePy2z1JAmo5aO+95fuJeR9
 kRnt0HO9m/uTGwbDPjSvweSo7OW1LwWHwS8X4POeWqzhBPbWFfU5wwrzcPRh+BzRjoLWEXelpjk
 8mnajkrs3soHRzzxBSTGGFrI9nOSSm9Jm2OnLAJKehp4rdmPuvX8MzVwU+rTaGEl7yu1xaOTGTf
 QHux6/QvsWybTQABHewsDu27KGEr0s0ztesOtcQmR/iz+tMPaglVTlqjELMAYGhAdqvgDHQiZyl
 1qywBubQW4y2aRt4dT6FpAe4ZMPJA2EV2KTVnk3lfaFLoVLzyn+hwh/UIDQiHKGljnwc/5u3WbS
 NrrmEO+n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
and PMCX0102 PMICs.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 5e6dfcc3fe9b3c935cdd1022ef9849dc1db2347a..8ae4489637f3d1505367a936cffbefa4d3fc262b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -59,7 +59,11 @@ properties:
           - qcom,pmc8180-gpio
           - qcom,pmc8180c-gpio
           - qcom,pmc8380-gpio
+          - qcom,pmcx0102-gpio
           - qcom,pmd8028-gpio
+          - qcom,pmh0101-gpio
+          - qcom,pmh0104-gpio
+          - qcom,pmh0110-gpio
           - qcom,pmi632-gpio
           - qcom,pmi8950-gpio
           - qcom,pmi8994-gpio
@@ -68,6 +72,7 @@ properties:
           - qcom,pmiv0104-gpio
           - qcom,pmk8350-gpio
           - qcom,pmk8550-gpio
+          - qcom,pmk8850-gpio
           - qcom,pmm8155au-gpio
           - qcom,pmm8654au-gpio
           - qcom,pmp8074-gpio
@@ -191,6 +196,8 @@ allOf:
               - qcom,pm8950-gpio
               - qcom,pm8953-gpio
               - qcom,pmi632-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmk8850-gpio
     then:
       properties:
         gpio-line-names:
@@ -303,6 +310,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pmcx0102-gpio
+              - qcom,pmh0110-gpio
               - qcom,pmi8998-gpio
     then:
       properties:
@@ -318,6 +327,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pmh0101-gpio
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -481,13 +491,18 @@ $defs:
                  - gpio1-gpio22 for pm8994
                  - gpio1-gpio26 for pm8998
                  - gpio1-gpio22 for pma8084
+                 - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
+                 - gpio1-gpio18 for pmh0101
+                 - gpio1-gpio8 for pmh0104
+                 - gpio1-gpio14 for pmh0110
                  - gpio1-gpio8 for pmi632
                  - gpio1-gpio2 for pmi8950
                  - gpio1-gpio10 for pmi8994
                  - gpio1-gpio18 for pmih0108
                  - gpio1-gpio4 for pmk8350
                  - gpio1-gpio6 for pmk8550
+                 - gpio1-gpio8 for pmk8850
                  - gpio1-gpio10 for pmm8155au
                  - gpio1-gpio12 for pmm8654au
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)

-- 
2.25.1


