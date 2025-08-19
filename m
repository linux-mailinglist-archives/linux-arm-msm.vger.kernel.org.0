Return-Path: <linux-arm-msm+bounces-69739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0130B2C04F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44381887D8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92AF32BF30;
	Tue, 19 Aug 2025 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiCN2wLW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6932A3EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602703; cv=none; b=sJGjHt/kpnpjIr6vCmjF0DjpJNDv5XoKpFkb4EA9j85GwP9PiVQayxxEzLU8gJJzbTW5Zd2nN9aqLBunofpUYTzDFjjNkM/jvq7h3lBuKju4JQdTTmZzRYmwfzdUoHmReDngj+k+uVqcYIceQcwhFrwaXBQuqmeJdKrUdSIPPmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602703; c=relaxed/simple;
	bh=jfFVMew13aow9LdiRL7XgiGeNSFwWq+iSxzZgyk6PJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCDwJbEVU170xnr2g+TH7oflfWPAumxXyvWBYhraH1NLnLT57/h4ZPXd41QIz2HFkcDomQbXJzGi0C85xo24xhDPeSlpG9xBzZDljZof/XQaszLXhtXcsNUfblVCOLkI6/Jcx8lH2P+AQKetObZO0Ujv0zRoLRGheI6v4byN2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiCN2wLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90d1M023727
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylwnfePZhDFnBtzP9R6qdkGXQk7pZlCHWwEtxVPDs/4=; b=GiCN2wLWXZoVgDfs
	stxoqHqyku4mAKBsijfyWxc5WVTIOoboBVDDr0PGY/tggKGqyPeqJpcqv4CSH81n
	0LDsiGFU//+iViRO+1dUk4J9igxdo0JK6iuEErpivW/zAX173KvQFagg9Pw7ahEZ
	bAwsC9epKHMRu1M3kXIbbhSyQQifZAioEFQpmRTnzmKm10EjJM4206Sp6r8Nheau
	eQL6dqJqkWdcfkhmgWPs/wTrIjSdK4xZOv6tNckGttSKk5X9mdYj6Q/ei3F4145v
	60N5hNd9hsNykmDrqcgfYdq6bUktvUOcRTzshhHxlMmEasH6lmna+UoFEui/NLJC
	aV3Jiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5j0m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:24:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e591846so4716132b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602699; x=1756207499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylwnfePZhDFnBtzP9R6qdkGXQk7pZlCHWwEtxVPDs/4=;
        b=cl49hGGB0AAHSva21BmgrdHen8jLiVbGfPu05eOIh0+dBaTSoxABeReBBl9sevO3/n
         qCS/aXQqihmd1v7qBE7RiYF4BY1Ct5B1ViJwRlHDT99yOKKgH4JfDpkDIyzKkGds4abJ
         8pgQDfPE9I+20Agpp078mYva8i0kvDXz8YUrsuv+mqHovaRrUjvw23bS0an3MrtfozBC
         cORfsmsguKqxpMAV3hT7yM4gdqv3RIZthF9P4MCwntZ2mntKx7Nac42FGrq/fqVWgWLD
         N2Y0+oPJvApHlthmBopznajCFCNSu7GvXJVXkXziKfq5B1p9lm9UvxMWdYBIIM6oq0mu
         4eOQ==
X-Gm-Message-State: AOJu0YyxGKOaMruygZuiGPvSTM0iyMmhyB0ThQfMOuRvFzG2KVK+pfbS
	UmhbSLiwLAdBLRZ8IuvcXq7kKzyLiBnuOA6u9/wNkZEJb+bMwDzWBjyj7UEiivfjcvOHA6tnWD1
	NfK0XPMEkiWoT2GU4k4eWjDJS/ciiefBkybfWT/rGOAfHpyMo/q9xJVC//KiZlMIS3o7Q
X-Gm-Gg: ASbGncsJsIWJg3+daEiz3he6a7vPKDXTsQffYD3iQyDCDREp37pwS5+tD5c0OgUQ04w
	REGuXdIlzQ+Ji6h17z/ES4q4tu79OcD8ZMbHfyf8WbvyYaQrGWYi82HUN6gF95EVTOwlhdgfTL/
	FSQhCn3gGPk2M0XOK0vll9rHigprh1TIYaEuoG+O5ospmFCtIJYZVJVLokB60BfnaMRxbyEDIXw
	rqfHtryPjl7welofGY9CeZNGlKZ803N9RXjr6OKUfWfSbw/OPPLSkHQrIbRb8DemjyNp9qV7hMI
	7ihp0RqK5s8YqP3m22Z3ElbhuEnKE5D6SjSOqwK2f3nEjUZ5PwUIaA/rWGdrzQg=
X-Received: by 2002:a05:6a00:4b46:b0:76e:7aba:cb41 with SMTP id d2e1a72fcca58-76e81a1848cmr2455154b3a.13.1755602698961;
        Tue, 19 Aug 2025 04:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMOHVGcTe73LweODTfsXqIUxD7/Iwwz6sW8zqb7EGuvXAkkHJ30P27NxGICxJsbheDjqrKJQ==
X-Received: by 2002:a05:6a00:4b46:b0:76e:7aba:cb41 with SMTP id d2e1a72fcca58-76e81a1848cmr2455114b3a.13.1755602698489;
        Tue, 19 Aug 2025 04:24:58 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4f7cdfsm2202258b3a.63.2025.08.19.04.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:24:58 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:24:46 +0000
Subject: [PATCH v3 1/2] dt-bindings: interconnect: Add OSM L3 compatible
 for QCS615 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-talos-l3-icc-v3-1-04529e85dac7@oss.qualcomm.com>
References: <20250819-talos-l3-icc-v3-0-04529e85dac7@oss.qualcomm.com>
In-Reply-To: <20250819-talos-l3-icc-v3-0-04529e85dac7@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a45f0b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=bpSexm00WYn9fMQEYZEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: waWobiIcW1m8ycMppjMqVVBW2T61ZPHE
X-Proofpoint-GUID: waWobiIcW1m8ycMppjMqVVBW2T61ZPHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX/aWsHivvsVDW
 65/p2dzEhfLqMGeEv4uReCcBEwD9jMeZQQU5VA1eMIAhqBi2lWdvSZTMTfOvxErJITSuzuz2k75
 fiABW2hjalTisizXgtt0HEBGBtebFPXwMulz1o3M5hyxJeWThtZewkWXGL1ls1hi8i0O/9kfs0Q
 j3oAKl/4d6KNPUH8akfoCdLZEvdfEgRd4voMoHcZIyqVFwTrD+qb7Up9royN4gtfUuY/PiH2ZSD
 hW91NugFW+S8XP7xpcXw5IeMkcCB7aVJ2iCEuCntv4aiPm/QRbBkvO7J4vn9pXG5NkpRAH4sMGk
 I3KIuT6VqrNhIkXH7Nm0toJz3d/Igvgd7lZH+EKQ6sIbEiyYrERBvw+OWGjpa2vQAorYv1owJDD
 GYxxCQ1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202

Add Operation State Manager (OSM) L3 interconnect provider binding for
QCS615 SoC. As the OSM hardware in QCS615 and SM8150 are same,
added a family-level compatible for SM8150 SoC.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index ab5a921c3495298546e4bd34ed3b9e4e85d3c747..4b9b98fbe8f22258c209e8337bb4517e5f5888e8 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -41,6 +41,11 @@ properties:
               - qcom,qcs8300-epss-l3
           - const: qcom,sa8775p-epss-l3
           - const: qcom,epss-l3
+      - items:
+          - enum:
+              - qcom,qcs615-osm-l3
+          - const: qcom,sm8150-osm-l3
+          - const: qcom,osm-l3
 
   reg:
     maxItems: 1

-- 
2.43.0


