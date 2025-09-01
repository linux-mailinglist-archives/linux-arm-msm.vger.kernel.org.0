Return-Path: <linux-arm-msm+bounces-71454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECAB3EEF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4F91A852F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB1126A0BD;
	Mon,  1 Sep 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ym9JeLuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9521FF21
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756247; cv=none; b=EijGhtfZ7tY7siQfEGSGjN2bJ6E5qQo4lTXcHjOsIguEbbPWsBR5mDNMjbdXQzrXBtnrDCCZoBQJ03EdzNJn6sPvsX/xwZ5pmMNGuPl0+3Ni89KaOCI6F/ORETLMBmyZEt+frJ4bYxjNjSze97+pViNYRtYs3RGFflGUlSuiWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756247; c=relaxed/simple;
	bh=bx7xXt09INExowWig9UQmTy/cQC45Wj+RdPxQaj6eJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEIhAxrVGt5TZ3Ht3UNRrDHKvswJcZD84d9nuujAUQmwXX7YebntE2Hi0arv4wx7LxkuBmfkPlRvAjTdzzFz4f77H5PWsl6M49Fhc+VhRrI20fAIskWXrGHUKNQB4KZxXWkFzGMTztbVbpF8uxpLQCF0R0K+V/nCkYfmwI0hBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ym9JeLuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4B65015301
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 19:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4OX51qzRIUx
	I3TxBnN+NqmhONIP6oKsziNERitS5R/o=; b=Ym9JeLuIHDyw7dbUu2zNae3C5IR
	bwq29MgUmO9XZsYSVoXpdMqK+6W0mxGNTLVTehnV7styf9YUN9+cm/BiaVx7WEYW
	nxFJLH/BtIjCTLhX84ekkiHBNsA9ZWm3Pm/bpvntxUqKLpNiljA2RWG1hYKWbgV4
	xWrkwRN9uwL/mCJFGf72mAeISP/ZVEGmYAP6SdRgs0g3gtoHtuJZwMvtsniJCuKr
	2B02GDjyhz+d7bx3MxLimYDaLOsOnExAF6ubgdmC096zhLwqZDW0kZtKkgKfarwj
	5wvOMMdlksfIAIocB9DNwT/fFPBO1FAhZh1vMSyttRMtb1GuxROEw8tgKeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkdjbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:50:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b31ba138f7so42133241cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 12:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756244; x=1757361044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OX51qzRIUxI3TxBnN+NqmhONIP6oKsziNERitS5R/o=;
        b=jchwcb3bC0371D/Tob0OX15UECHl7kVLQXo5IxgGrcBTqPm0BzlnShPQQ9gXxWm5oP
         YhwaEc3Jbfxx7eZzyeGAXpzkj0P8gYC/psCM9vwvzd116WTkNGGpETxuiJPRlT2gCx2e
         atba7Y2fWvtBTu2SSSph7GErCIaooelnB2dmPQf4NnJVcXpSWG3Xld82Az6vEzQZk7G0
         q7Tmo3jrvuK9tyfNjZaG/asUR5PJOjeTq52hHhNI8IquqbPvcfDAX06JsAxp5C9yFUGu
         RAn8FspmEx/jfRcIK3leXLtu3xFGXWp+BhF9TgH+gYLV2XUfvwpuVvhhCZVq9x0WC+yR
         LUSg==
X-Forwarded-Encrypted: i=1; AJvYcCW7uRlUEpXM23KGqR+c6Fjm8WXsWRSxAVBk/hx5EejBfJ6XQIYG3yXw1S9XjdHP/+oLtth9xLgEDJdJf9bZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIV+hvFCNAV1M927SG4hvsQF/CENvewAMLaneCaeuGkuhgj8aY
	BGSANgjXax4bPzkSpEIWZbrRKUp6Qk32qer9tIqn+CgUg6BeQ3cL5sUUcftzLUQTtRzkBiW1DUo
	wg5CqhnXo9iH8tQpVTZoO67Xyy8BrDme8hYDHUBbXWe7oAz9B8xw43niDhDRh4in8+pbY
X-Gm-Gg: ASbGncup4DcXzKyCvvUTQMjpSWy7RakdE/2c5WfTQ9VObJe3tMQ5buYuM5jv2YWGcV7
	CbG2Xf8PfuujJXqWPT067jZj4raTuUI9NiXX7iGOSIiovEZ/QBn9W+u2H7kM5q1SuXNhG69IEPx
	Jtohwxoc3k72ru1Ni9RNyy3eCaBwDRN8wCB5j1Dj4EYOJ0WWb2hQeL6IYYyCrr0PfAGcD4FYsIv
	tnXSvraLzaC6LEc1OOFvpjGCWAjE2OXhG8LD6g9DqXbGZg734W/w2lp797Mf9l9izu54SLG+1pG
	VQhed1BsVmSahAkbhydAYUygkYmRT+eJN9zAMFUjrDUf8XP7H9XxHg==
X-Received: by 2002:a05:622a:88:b0:4b2:9b6b:3e with SMTP id d75a77b69052e-4b31d87474amr103595161cf.36.1756756243911;
        Mon, 01 Sep 2025 12:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdtsZTQ5yA+DGAmAaQ3RY6b0TRKAlyx8wrOJKs00QBYl04GCg0fn/K9iiKQh4huHt62cr3QQ==
X-Received: by 2002:a05:622a:88:b0:4b2:9b6b:3e with SMTP id d75a77b69052e-4b31d87474amr103594891cf.36.1756756243388;
        Mon, 01 Sep 2025 12:50:43 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d7330e4bc9sm4653705f8f.10.2025.09.01.12.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:50:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
Date: Mon,  1 Sep 2025 20:50:33 +0100
Message-ID: <20250901195037.47156-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b5f915 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9b2JUy4lzbIbXjLhPvkA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TDCIvv97xUTDdgHegnkL60El30m5NLOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX9XpJ90ycXBq5
 wOB3Y6DuQ8pzkT4H9O/zjHVKQZfTVeMU/rsB03HKQtlJ/ibOxqwaU46xDRAI/SlGxfeb1NFc5s2
 AEp1MuYxehivTzo3QYkMQFKMC41TFprE+/J0CUT0VsNj1akxK6cCGI3lWynxOsyZ/Vta/c0bJGB
 oLxGdo22CpQTfnHHbqLlWMMFo3vA8U3EyBKaO/XfZZuuBmvYy1hL6QVZpNmJMNLcautKJ8YCkK4
 4WdssV4EesjiMI3BQemwGJsXX0sQtV0sWT/9+5U3WB5R3LDFfSImHtAu5nE2OAxZuI4gh6JPZqc
 o+9YvQCmvEfuMsq2PckcPoFRUWUavwPfDvN31YAE3fN1L4EnSydCa+MwvNFRvPFQDID93kKg6BX
 C2jpahCb
X-Proofpoint-GUID: TDCIvv97xUTDdgHegnkL60El30m5NLOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040

Number of input and output ports can be dynamically read from the
controller registers, getting this value from Device Tree is redundant
and potentially lead to bugs.

Mark these two properties as deprecated in device tree bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


