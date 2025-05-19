Return-Path: <linux-arm-msm+bounces-58386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31929ABB7A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE1D81884CD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91128278E7C;
	Mon, 19 May 2025 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ahi/r0cb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6248278E5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643677; cv=none; b=MF94myLgXslKvhooXVqK/hY8yr0wCPKpvKq5+GI7RD+DMuCzFcS+MVUQIQWukZjXaEhHuqwZ5XnQgiiZo2fg3xt/bEJizRyvMSys52uyX5+i9TkADvFVrY8hd6qqt7IPDyntfksLBFL4FABt1GDzJCbOBYek2Gr7mdhpw8ZSnLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643677; c=relaxed/simple;
	bh=TsLhbYEG4W2UZwLu98GnAPHGkYHCo0Vd/d+EIez/5IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+6QxYW9dbEvq1RNTuYpaDOxUluqppZMqmcyc2r6s6DPXfaX56VJZMLKuV8+/uAz18xWpAn907iQyjZ+8eZxIN2DF6AtWYkufxRoCsaq0AwuTA0NYLASgEJ3bezyx08ceJUc1Y7NcgYmWmYmdCeDHDC0+3272ugPj+ICIuBKIYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ahi/r0cb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J0pQ5s022663
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3i9LWuFQVKGnOBRD8v7wh7A2ciM2J9NI+q99j6RIhw=; b=Ahi/r0cbJmnnirKs
	k8TyuQSJic0aSrcFWjC7aeBYOXp3hEoCJrUngrtXskoF2w0dspWvMQhq6KErqCTk
	Tr8+68FszJYPpfiqtPs/Lp2F0rGWUMHhcxjhmBp1fOZyT6+sHrxZXyJaVy+t4z2O
	n3h6OAvIG/YjLKaDMiACu90nn5xbdAzoOFbNeWMxIGqDPcgu4e7OvHS9p+wEP9iD
	eOwflDW942j3XEe61kapODxtzksW78T3xXPybmzTablastoJBh+/W/SpR7IvnS7+
	bwOIbh7cyarvhPp03nMZTWlZ6uL3jMpOplXwj0LQ+mB0pHnTpBqXXbMpdmvW/Ucc
	OYeSUg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g3ktt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso2630846a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643673; x=1748248473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3i9LWuFQVKGnOBRD8v7wh7A2ciM2J9NI+q99j6RIhw=;
        b=VXAbq4Mp4UyS/gZgTdbTtHx9g+KGpAOSatj/hZCfx+aOgZIn+hQxhgImcAirFSs6db
         Gr7QgHJ3AGRnR/yyXVnab6nkqKMkFAv+Qxssjevd4+eVCWKdkxDAMHHf9nMQV2lbr7mq
         q7vk9jrqVKaEiYwSts0FuRzb2jNP4vLT/LjA+J9HINrvXxadORkK5AkupWL6OmDdqCMD
         FPs+5ag79qWVQ2Kxf8NUrmDKDpk6+qC6FwMmL3k2enV/cr8wcrMyfHysTv0y63kYK3sZ
         GDgQY2FvLzgxDgZ2I5wHldL2mGReVXPo9BkwG1cS8Ignew52QSh16oOibKBSvWyf2pLM
         BlLw==
X-Gm-Message-State: AOJu0Yw9LN2HwK+fgjPQGsejirz6j4r0IzpTo4QaYuJQMZC4JSB0eCSF
	/Nly6oQANCfbrWuAHioBbOrmtFqUv9iP+pg7oONyG29xD6ifjAfy/+dm1sNUqV3GAjqhpJsoyIp
	6rUW5ZcVmWgYREyEJpJNkzMQDUiF1XWGYa42bL3BoPE+unX3WYCBC/9A20wvnVd8pKNYZ
X-Gm-Gg: ASbGncvjZN9bdoHMfHQcv2ejjLj5tBuPf6sJ/BxNmC5IwR4d1nY591PvP7NIkPPLU4s
	3op1xihsfJ8oJAePU5FHJKEQZgqBjw/N1iMeuau1GyEiv/B7EkmJ/GzqTIpDzI2G8xYID1z0IeU
	mAM46HaipDLB++PUCA9bfrTQCz3f1MgcWIa+aJPW5nHsbqE6mVbCsJ6TxtAr+4C6068cT87cR/i
	1BJFu2jBBPnGL5zjD4coGGL6XZhB/MiLAE83eK9TZnbQWInDa1agMSgxnW4hX+O4/KBEczuUNro
	jPr0NxIwD34V5ufWdcOZFBu1A6Iq6h3NFZftGwXygM7zgmnPdkoo2HnDMV05A2kaTV6IMCDIKjX
	+SMzHzng/BpPGyO1bsx7zAWB99c1dDwGQnNKuOREtGt5bzgc=
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-2162189ef47mr16769120637.17.1747643673273;
        Mon, 19 May 2025 01:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkog3pLTR6wQhBvQeivAevxsoJCv2JZBKSEW+h0R+Q7bF8fXq9mejEIQNqo0rSHrTjINqnmQ==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:5ca4:2744 with SMTP id adf61e73a8af0-2162189ef47mr16769088637.17.1747643672863;
        Mon, 19 May 2025 01:34:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:03 +0530
Subject: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document qcom,imem
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1835;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=TsLhbYEG4W2UZwLu98GnAPHGkYHCo0Vd/d+EIez/5IU=;
 b=OyCJmSO5oVigl8JwR5QSAjSTJGL1WO0OhSspgEdH0DngJj+D0n8HNy8BGLCS50hozF0K+BY5G
 VqaROZdDVKIC3mA82cHdtMbTNVAdiR7GQGAAn39So0tJPJpk0C2V1vN
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: YRQKfrlMUqKCFUTYB9PjgnerZpojrh7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX8D5deYkwkvHq
 3fVaWaCbucdNbmTxwfpIvcSV6DXPX4aEgCZiMe/v61ZI3cNmjqOx7EujzMyMZ7Ca5lP+7aer9oP
 Zz9XwCH9RnPJzMKpWcnieaPHDVrK4WRBnlkZQUphSvzllO5sb5ouBBufsaX8Srrza9cQBYKzTZs
 5sB5Scvz72D0YWNaVO5CZjrWQstt7OMl8bJJ7VizcYwJpKST12OnwgPlef/TEOdgffwzNCegfx3
 xqoqnEzPuGZrZNkySdG4D2AaND6NgYePaWvt7tMPdfEm0zuV0u9nkaEdTZ5d45OXR+bnSau/myP
 J0RSeN7YGtnt/hDyvEuuts5ji++4ck24WIKiJoojvgJiJ6DH3XcpRDBQrZSHEQdK0WgxsHeDtpf
 Z727iyo/I7ZtpNeR1hWe/EKCFyLxMe8NRHbKweVEM6WQBa6uSPkaRA7xeQDB9ws1s/wkxQHi
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=682aed1a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hdD7v9c95OJ3thUhsDcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YRQKfrlMUqKCFUTYB9PjgnerZpojrh7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190081

Document the "qcom,imem" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- New patch
---
 .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -81,6 +81,16 @@ properties:
     minItems: 1
     maxItems: 5
 
+  qcom,imem:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandle to the IMEM syscon node that exposes the system restart reason
+    items:
+      - items:
+          - description: phandle of IMEM syscon
+          - description: offset of restart reason region
+          - description: value indicate that the watchdog timeout has occurred
+
 required:
   - compatible
   - reg
@@ -117,6 +127,16 @@ allOf:
       required:
         - clock-frequency
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apss-wdt-ipq5424
+    then:
+      required:
+        - qcom,imem
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


