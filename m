Return-Path: <linux-arm-msm+bounces-96258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMvVEWO/rmlEIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:38:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3899238F78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 13:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55101300D463
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 12:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC3B3AA19B;
	Mon,  9 Mar 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7Ri+/Ec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MW+wRvdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4196B3A7837
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773059669; cv=none; b=AquvbFgHjqLcOxQsk4AxhiotMAc56JQic3TbMWdLjeZz1j4+UCjm0exDhZWTiM9auEt9XefCOGreNca/eVeEIN2+cWDXvye9GCMwhLtBjR4Jes4XcTHqp7772rLo9z+lsKAKU4KPdwhWSLPII826oQNmpeTg6PH5swMREp/ARvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773059669; c=relaxed/simple;
	bh=uHvarZKkcWBPmEKkDgNjhsQDN78sa38uRQjIFbhEi7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWfEWlABE7FP9fktgB8cWypBC35oA9FglgFyYHUoqUeS1KTk2vhdul6Ff6YZfwWhaB50QKWopSRvzayLeRIN/ySifOXr+8cF9kh1lOcw5pj28WeCCZu3TPnqHdQklzTdnseLqqL3OCBWIjwPxkvdPk64nOjFBDcRB0XKwObX1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7Ri+/Ec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MW+wRvdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298W9be3773088
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 12:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5Mb1KC007OM3t3c8wVDsk7TCU1iQIR+1koW
	4yiFNyPA=; b=Z7Ri+/EcdD4CZxH33UlBvpeTSka7UxYqwbPoi4sbzXoMgCYwxzl
	pu1iLHjK/KGugkemC4PU71lkF1zslLn6MAdF/1Tmk4Ki7o/4M9s/eiWaYvG0edrj
	bg+1xT3Cm2gw+s2FDdSjZn4oHj2e2Oz+USe0oERuabnC3/AjhWstvfo6c4gDo3bF
	bNugW/z54wQrtc599bWqzYUFCT0ynDa5Uw3J1KN6xZHpIC/qDbRHwDsVeASxFohS
	DeD0pgnvLHYK9XdXWnFKFHLrKvFk3ocrxdbgA1NfoHQ+yfnf8wnww+gXT7nojHwe
	ap9zwBMKeWf6WdrxTH9LrlO3dmChC5xUu7g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8tuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 12:34:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be07cafe1cso28422027eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773059666; x=1773664466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Mb1KC007OM3t3c8wVDsk7TCU1iQIR+1koW4yiFNyPA=;
        b=MW+wRvdTUKjjZUZLcaOVp8q8T8YqU6NOIuw9ovuuXAij0JDanVDO/VX1Ft6tQnOWm/
         8YjZqnNoHmkYCY4zJdcaWx6uEao5eCSgKVrHoVqlCLaeIZhZnbXr259BLatTZ3Y3btDl
         uGsINUMiATS9CtPutiR6E7Oi2suG0Ymjrgb9Ikd2aTvrGDLkeS7y2ClIdUdOUFloDqf5
         jk/K8JADMsVE4VBwmnGZeHKsqmFbCd7DveMVVoZ7vxYEBF6URbVEt9NcXaHqFdAz/kNk
         XgBb3lmfNXLCIguaDCFvraNs5NQxjb0LG9nPKG4BztgTIRBAz692PqhIS+HWyhPLORAu
         KH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059666; x=1773664466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Mb1KC007OM3t3c8wVDsk7TCU1iQIR+1koW4yiFNyPA=;
        b=j9bP/Gcb0G0KdorZ3cvkpKo7NFnxF/Az+WQXoDtVqY4CH6e9RVgDrk00RjE7FdfG9F
         FQ+R14+/jILjkkfGpJjkdV0j2JAXimSSFoKg22BYuxZNCxMSmN90tHmygyhJSy+RRESW
         pJtyVWzo6simtSCgYZy/73w99SRwnWUKx6vDOw/80lEy/W8hUCEt01292CGJCdCjjqZ/
         BqIltXuy2yjBZgrFPTQzYLD2bgDcgDOgBn+pXHdm0MZ5ip4v3BXxxLc7jNQP7a0r6Fbl
         ZKZv6ivJwT8wY2ohHRCQFicm2aoHqzCu5O7z6ainbkArnX/fFg4HRU4TILh27B8cFjel
         XWMg==
X-Forwarded-Encrypted: i=1; AJvYcCV2e1BNfFc74pZA3FOho64nV88gAPy18Kb4XKU7Ca0DJ56zO4fNAy4rYjIoHdzW7klPPc5rC7Qmt1H6iTNM@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqIo9gppg9stjjqL5CkDwJfhXlnw4vCZKSCakNdskTiCfBKtI
	0s+UhfFPSTFdwTfkXYmbTvO1H3pCTn1+sZla+0GtfQJZizgMVBUkRi4k3ogwEyc68+tF0gDYWX5
	1HlMGs1YfVeIIbTHUeUyOVSfJHCG+ybhEcPVUF4QkPPdu4w4kKmM/jjC9pvP/kXs/NiUR
X-Gm-Gg: ATEYQzxcvilnPMCECo3G0b1zXk0jTNUZAitlXAhlV/Zh7wDILYIKjkD02t4HJBmggBo
	BD2QJYqivBURzVGqC+RYxbZ5rVkSvHvEQ+VU6OzAJXk0zF4o36+i8wyddRfe1TvwLQteSqr0r2i
	xTXrK6MzVuXfgGsEXUixHVKFsIWK49leyENN6SKfBG4BVRYaA6HZ8A1GS4nf39eop+KlNp0pJtr
	9aSw70ITqyeUPrWeFqLAX+MgrksNDLUQsGWXghONvxhE24hHPXd9nti+YzHZkuT2Fs4iHF2nXNX
	i0Q76821Aqt+jvYbdQzPQkENR/c9Ng5ycfyySJzFeJXyfbfqDF9AmptGUHevQKwlHoHE8+n5rrw
	mRZ+q1uLo8M6hCRRuw4RJtJ2xGI0e7j6/ySs3gfzA6O+nSbEUQE6zEyeYvrhwBAeQCUzMs7VNUt
	DpsxepDg==
X-Received: by 2002:a05:7300:cc12:b0:2ba:931e:7021 with SMTP id 5a478bee46e88-2be4e091747mr4250284eec.34.1773059666044;
        Mon, 09 Mar 2026 05:34:26 -0700 (PDT)
X-Received: by 2002:a05:7300:cc12:b0:2ba:931e:7021 with SMTP id 5a478bee46e88-2be4e091747mr4250265eec.34.1773059665542;
        Mon, 09 Mar 2026 05:34:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f8481c1sm9629170eec.15.2026.03.09.05.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:34:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: remoteproc: qcom: Drop types for firmware-name
Date: Mon,  9 Mar 2026 20:33:57 +0800
Message-ID: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q6MsLuGzUIiuzz-MFMgMNA_KyYp06tc9
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aebe53 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BPq8mJ8oFBHe2hRyu_wA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNSBTYWx0ZWRfXxDH3GDVxbmUH
 1NqhgUJHiPpU3cx3D7A21t0choWjIgbK5i0redjkHPx0FjidZ8alOtbpd8az1vGKqG4VHuPIxAB
 IzoYBOkFEoBgvJszPeA2H/CcZQrGg/opNkYJe+DZ/YGrKbkypm4nojRnHUL0EWJEJWyo73UCdAJ
 SBoatxEqLZVN0kAy7H2hg+3+uDJVCu0u8OCq9MlfVxwKYhjzXxDChIEfXamPDiH998W/f8KJ0Zp
 JasI0kkQOKLuWH7jXUzW5M9kdZpKZMdn2rO3SZDn63KH04rcpBVzwIr/W9rkPfQZHfARtTbp+o+
 hOjko0WY6mAKA0r2kLSXvQtTRntfn+suJT7sptnz+ohTt6eD/3+VYh6ApqJOsJ6xJGyI92L7s1R
 BO78BJ/jVLuCSiBeC19LMjr53d8uB4B6u9P72ds6oZJAz090TZYCREh/YWiHxGv2271KaeIGMu0
 fO9/1PjwXJ9ssMihhkA==
X-Proofpoint-ORIG-GUID: q6MsLuGzUIiuzz-MFMgMNA_KyYp06tc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090115
X-Rspamd-Queue-Id: E3899238F78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96258-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The type of firmware-name is already defined by core schemas.  Drop it
from individual bindings that have either a redundant definition or
an override as string type.  For the later cases, constrain the number
of expected firmware names to 1.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
- Add constraint of maxItems 1 for string type removal (Thanks to Krzysztof!)
- Link to v1: https://lore.kernel.org/all/20260306140306.1328719-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml    | 1 -
 .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml    | 1 -
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml        | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml     | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml     | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml       | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml          | 2 +-
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 1 -
 8 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c179b560572b..1e7c165f925e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -137,7 +137,6 @@ properties:
       - description: MPSS reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 4d2055f283ac..1b65813cc8ad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -126,7 +126,6 @@ properties:
       - description: Metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 188a25194000..bcd2bcf96e24 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -51,7 +51,6 @@ properties:
     description: Reference to the AOSS side-channel message RAM.
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Firmware name of the Hexagon core
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
index b1402bef0ebe..7c9accac92d0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
@@ -98,7 +98,6 @@ properties:
       - description: metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
index 005cb21732af..f349c303fa07 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
@@ -98,7 +98,6 @@ properties:
       - description: metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 5dbda3a55047..8227527c1d77 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -42,7 +42,7 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 5d463272165f..8c4abde74915 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -56,7 +56,7 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 11b056d6a480..27b8c127d74f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -52,7 +52,6 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
-- 
2.43.0


