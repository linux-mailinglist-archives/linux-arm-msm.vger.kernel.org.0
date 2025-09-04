Return-Path: <linux-arm-msm+bounces-72029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29BB4395A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DAC27AFC4E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF822FAC06;
	Thu,  4 Sep 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTatAGbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F39A2FB626
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983411; cv=none; b=gfadf3DV0uURwBjMJ+Lh53FNhTlVnbFebgt9/5+rYOI8x4K8CwNWjjUg/qwJ/SDVkGJz+pT6Y9358fil8wXJUK4W2pAbPlua5I3fN8QGJYUF9HW+k/qRJT2WR0HAm4cELnfW5ahapYQEI3BneenOmWCabdJG4A25J2DhCp2r+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983411; c=relaxed/simple;
	bh=HG+b+jRIRTWPpc1sxXtE1A4aG886oTSQcaj4r4e1v4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f28cbHeP+IENUALWoOr9cgjLbBIVlwglQ8l6AqTx+1NTcDcqxQz+6FiYnySjqcOcKXmGwOMKyEIg/SpJbvKCui+lh0kdVplgge12aVaMkcLyZqTQY6znFkyu46T0uFloikzXb15dcnTVOxvNwWZ7/FswMjO9P/sIK9ZSNAWDqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTatAGbY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8fL032203
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XfwpEgA5iMz
	nAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=; b=FTatAGbY3Z50wOqnOaNxgxBKGDx
	8WZwFlE2e3jBv3kAkbBZ9RUWRj4sZCB3wmhSkfVYbnsp2h3XstMa3AzLng+2+9w1
	jB75pqT50tFfAUFTMqw0BFxqF/L1oQ995AZfaStNCYTngCkhDUrvRdlTYQRs89jh
	zuW6YZxGrWIxP8hQ3gBBmCoDGw3WMTm169Wb6PCYBX+gZ3XV7EbWbvTjEHT2DFed
	S8fDajpAfMLtvkgeqtUTTEpUfOx3USpfxHQf8zHag34XWcM2ssXQJRnXkDnGD6Ry
	+PvTMPyRcmghNugU0smm1QKYkOVWQAqS8DIK51eQU3YVVHOPGU0ibFSl6sA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfbs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:56:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3aac677e1so8066011cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983408; x=1757588208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfwpEgA5iMznAO8LzxBPMwKlKMUGeLCboiF0FAzcPH4=;
        b=rh80iU6gmYnUOi67CQ56cs/QaXDnswMMf9GT6u8YUa3+x6zPyVZN97Obu1kUnyZhat
         qRZ9wGBO+AR6FsY9YORKjBXDsbMwB3IJ0ivEORZJ/HTUswWZhfh1gV2d2AgBnsmia2hm
         4vqW4RytzeEDs5WDRZ0nNLcmZX8uI+C61K23b5jeSg8UQFxV0iIe8RUvjZWhYHuuMqy2
         Ak3XJIRBWJHiyCjJDe3rOF6K+c309eMictqivmm/edCqii49IrH9nQlj6+j3ZTGQ9sVd
         oSYJ1yiFqJ3cnNEh5oBglGl9xy3TPtMzXRqpBuyj+Hxb+1ppce6Imp2r7NZqorbuVOgw
         QbDA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZGC/5K2n/dcbnczFQ8pRIsRFJ/6eNvcSsG7RaIlfa1tCVH9MCDljLhGQED7uNpR/o4zjhsgxFjPlFBZD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2DYPJ6IGwGP5CRtIeXVHa61kkI3nzZcZ8T9zziLoiMWBXe58T
	eyBY8zovl1FlnMZp+5ofVavXgcn/+LGsz7dCrC78jsGnKxLwsciZPkC7soA2/L4nqjuuvmO/myK
	ObIwHeV/9m80qFQ1VTt9i8X7G2ZlU/RZyuKR2leQy2YjzxyxbyCd11enyRcSkilA0RcKi
X-Gm-Gg: ASbGncvrA9nRejayjdVawCC/5kRjNBNnNMDZw66pWvAR31YTC7ZCJjYFr7D1yJnZ3hm
	hIKvVSP9rEl9BthyRIUjGVJRtc3GjyzVxKN5HoicQLV6urdVwb/fR9WrEWxeFxO+/Tct5/DPD5T
	Wsu3PJ6k5tMNrkI602CtMbPIp9/zZx+WlxY64vaz3JidtXRcbzMo5y6/LVdsXs1ervUNdpioeHK
	IDSAO0zXLZDPjK/Gpw6vFC0klMkBtS7FOrlfWXeLM8IF+31SIJbgP1grcjqkzQDIhfhU8uNGLOC
	mAhUStuagTvsw/0fmPXj1ZbxV1sSDuahnAInjpoAvjSFgUBGsC3I8A==
X-Received: by 2002:ac8:5852:0:b0:4b4:8f35:c908 with SMTP id d75a77b69052e-4b48f35cb13mr55843851cf.55.1756983408433;
        Thu, 04 Sep 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMXspTwpY0S0bTLaJEpZgt7pNOpeSmQyZlUtp4ZrGY6tTLhs9q4+WmumIbVs00Nh4PBO5FNg==
X-Received: by 2002:ac8:5852:0:b0:4b4:8f35:c908 with SMTP id d75a77b69052e-4b48f35cb13mr55843691cf.55.1756983408029;
        Thu, 04 Sep 2025 03:56:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Thu,  4 Sep 2025 11:56:12 +0100
Message-ID: <20250904105616.39178-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: klFSHhWsI01EFxBH9vZSs5TJpa418w6U
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b97071 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: klFSHhWsI01EFxBH9vZSs5TJpa418w6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX0C8k9iHJb1O5
 eXckA3vNdlerLSZ4CnEcw+MeBXhi7RQ400cb0rN8oGr9E/sViP7tI81pr3TIJa/LV8vQxQG1pr5
 vQnj9qCBEd1Cc5uW5+hTTqOHGdwi9AH+RpCQuo+n+i/REeT8+o5BzmPqJrkQ4COMlf76dvZkU79
 rjkpkR6Gbo5vFbL0QRIWyoWDKRB2SWnnrH311+8rNKUPS2bmgIiJrHTR7JKsfgcXs63ILjwFMV3
 6e/ltiFCRo7zXGMV/fXQE6ngYNgyKKXYvmBTl7MPUSgIEwmOnRHAwpr31dQkiNtxShjGsDM1FeT
 /g9Ab0TrvU/O23ouK+18QWdgCJ0ZCukmzATSYzEAjztkP/fgPFqhKgaqf2E2gx0n7DRjJK934B1
 df17Mw//
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml      | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 95d947fda6a7..7ea491f7e828 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -73,10 +73,12 @@ properties:
   qcom,din-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data in ports
+    deprecated: true
 
   qcom,dout-ports:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: count of data out ports
+    deprecated: true
 
   qcom,ports-word-length:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -223,8 +225,6 @@ required:
   - '#sound-dai-cells'
   - '#address-cells'
   - '#size-cells'
-  - qcom,dout-ports
-  - qcom,din-ports
   - qcom,ports-offset1
   - qcom,ports-offset2
 
@@ -257,9 +257,6 @@ examples:
         clocks = <&lpass_rx_macro>;
         clock-names = "iface";
 
-        qcom,din-ports = <0>;
-        qcom,dout-ports = <5>;
-
         resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
         reset-names = "swr_audio_cgcr";
 
-- 
2.50.0


