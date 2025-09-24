Return-Path: <linux-arm-msm+bounces-74762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D614B9CA21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2973D1889563
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECE22C08A1;
	Wed, 24 Sep 2025 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y85xpRhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21032BD5B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757054; cv=none; b=GDpOnq/33tmA6A7mb7kjuUxES2XcovxAVROZJ3DPRH3lZtbdw9RijESa2Zvg9JjnbvFfmOLSPac+6QLeTSftU2qvytbRcg/lGQ9rBFotZ9byYk3x1gqXHMfzVHFI6GSH5Ygxi6tDH+Q+vYYAw9eGthy48tLQj8xeFGlQz5PsE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757054; c=relaxed/simple;
	bh=MbxEjMIaUENf1P9WEPkEfk2L22A1VFwABKvQjLg/Xoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBEBMhuY2RnGwLrdSxGbBi/Hki+e0FBvDm5tVE09mot4IcoEzEeN5aBXv+gjUfg/XonmU2IiWsIFiNNk5zGm3wgo/ftRzMuZoBs33Wx96hYeuGiOCabtPxSKknDapZEa5WzV7xyuJHjv3/TOdETVv2qhb8AMp+yk1pEIH6j6E0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y85xpRhX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODC2tr016461
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feXVGRefITNODxeUJQMMl0Hw7fIAFVpnWml1r8rDvSc=; b=Y85xpRhXsG36zo6E
	0DiELzQtJBPqZexV9b+Eh6lTPaEtwMVostvBM38kfU6jTjjT3AZHkaPgcR1nN3Ij
	+uk0hyR0RVJPRxMOR48Rl2iO1U75/nqRQk4WdE8gQaqV3jL/j9wUo11TQBBhgud0
	mEoY9fIqgJ7DBQsKqU8rDktanUB8wjgquC6smOV7NVnBZZ3QHq+Ri3HEdVK+Sw3J
	GkIuKneaDBBSamMZDBno6dVB6ar7kfWCYUh2Oy/ufvJbJl2fhiAud71On0LmypQ7
	gpEE9d8KWMhBOYLrOLCvJFqo8l1XgyHqj2+GnyQyUzNCT6dbNTDHa+YauhSQNbat
	/1Rmfg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhvbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:37:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b550fab38e9so229675a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757051; x=1759361851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feXVGRefITNODxeUJQMMl0Hw7fIAFVpnWml1r8rDvSc=;
        b=J7vuMbTX6wLxEBbTZRvBmh4e+Oovkx1vKti3dJmODMj+r84HgzAFEhWVf14qTADjjx
         MVenHbpxTsM5ay/pUl9fkD5/9cNT2/CI2uJMkfTBs6YvGwyb6m+7bDBJ+CAUfIIIAaYe
         YuUBDKlOPuh8+n3c6OcxG20m3CHZ5teX1NvcBPJrOswnCNG/bqMVZ7/VMtRdoTqGQiLt
         WzvanYaV9qz8h8b5w9ghOzBFABNQMgTU5Bndil0uwooX2Y1rJiouWxlkTco9erLXF4cO
         wTT+60sVqJi8ZCLhcP4z9U3JTGuySg+zinCZCjHWsy9a+T/bALkNEVWQ71a+DJR0YRVl
         Hlhw==
X-Gm-Message-State: AOJu0Yy6513ZH9uAN4JFuXKZ7Yvl6xNoLusJyXsBFwuGgY9aLoNvr1Fd
	7OKJAdA+kc7jaw9yvmsSxb++eWxgl1kwt64mHjHkIt86fQCmcUac/f4nETJfrJ5tHUPzPJAXbiX
	EHeTh96tZGZyD1ZzbrX24zTew8PtL5oCqZ83QVQh344w8QmZQxaGTdunrWrHGyVsSNbkb
X-Gm-Gg: ASbGncsTxHLG3Ln2hudu32rs3BOU5qqucKY5xOMSQf8SiNphrVOpVLwGDPtJJlHGq52
	Nc+GMnB8gjrbdACZebGH2fFhFP8zz7aTGwWCoW/JmxPz0o0dhgQKCt98Wv9lDPmzptpTjTJXM2Q
	jXVfnL/vZH5/gqDid8kQF9NO97aQMI55sbGCZ8RloP3IZcFj4DSOfBRDymMIpovY9eedYHvzLN+
	CN8g3yMLl4kKAP1BBMXWOQjZqaKpPe2F/tT3gUw3Q7yQzG97HX1FN6XcGYGAV/vcqiCBc5gM4ez
	saji/slg2T0fMY/aP26tTXjG3OK43l83GqprE/QAYRA0fhXprERw71N5peeFJIzkmI0bOKzeQ/L
	HJEjbIVb1kKbTIf8=
X-Received: by 2002:a17:90b:1b4d:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-3342a2cb650mr1454578a91.29.1758757051225;
        Wed, 24 Sep 2025 16:37:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb0KpgTvAPWQG9YQkzgc8DpK2qH8dPaSgf4xK0XteXzopA5zzTkpzU7C5BCgrqm001OepIAQ==
X-Received: by 2002:a17:90b:1b4d:b0:32b:aee1:18d5 with SMTP id 98e67ed59e1d1-3342a2cb650mr1454556a91.29.1758757050772;
        Wed, 24 Sep 2025 16:37:30 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:30 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:23 -0700
Subject: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1455;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=MbxEjMIaUENf1P9WEPkEfk2L22A1VFwABKvQjLg/Xoo=;
 b=42zVztKkOXeN1S7cXzjNRiEnLF4tGM0ToLX1k5yT5lVTdwOtBlNJ6D7wBlNwRkLIlOLGE6QLE
 d2VDs9mZdZnDEaV0TGMefSB5I/ua/j6CUQLjo0QfiLdd65ktRjM+9xH
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d480bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fQzFCQHg6D5FrR4bPmwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 47qMA1Ra__xCgoFreh5itnLxD0ngVQWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX5en5+y27XNr9
 t7nG5AFcEbvIVFd4HlsRLE1asB1Nbl46yUm0dNg6vMr184sJqcQnv5muJYuaky6u24Z4y+ZQU5c
 K6Wc60h/UbeW7YiDqUwZeBVmGuOgJ+sxF1elBjRKC5PbFjNZGiHyaZ6TvATETL6vS48KzpgMKwx
 TxFNUzbGgr3sSdXdvSWx4nN7SfecfwRMhr0sN7eaXbpAd9AJOEsd1X+T/mMffVoxo3F1MXdXKpl
 eDURjahx4F9oEbsbG1IQqamf6wzXRb02y1EQQVSRCjxf1uOHRZO38PQkAGA3aUF1KkNHrAn+QPA
 nOpKpT5t174ObBPH8/7CmWFHCq1suqgAg9DMZbsiEmNZjqAjjwHcoHptrgZlHGTotWT8+A9tnt1
 jQ/YlJeK
X-Proofpoint-ORIG-GUID: 47qMA1Ra__xCgoFreh5itnLxD0ngVQWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index be9e2a0bc060..031fdf36a66c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,9 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - const: qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -107,6 +110,22 @@ allOf:
           maxItems: 6
         memory-region:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kaanapali-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 6
+        interrupt-names:
+          maxItems: 6
+        memory-region:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:

-- 
2.25.1


