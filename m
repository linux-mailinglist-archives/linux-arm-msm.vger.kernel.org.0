Return-Path: <linux-arm-msm+bounces-68909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA5B24376
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 09:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6434616B9AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F972E36F1;
	Wed, 13 Aug 2025 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NR3o+EJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099972E9725
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071763; cv=none; b=bXik6dp9f2tfI6lbip5/TTAATAfcOwqnpx0SXXNaVMjnDaDhuhnhHfHIQzm9/uZWxfxS4QMVRNv6N7SrTdcTcWod/7Af2lyz22+/BFjnOu+HZJEjN+r9VG+bPKn8hxgMUsZcEUWwLls5ZwTiqOkTkfRrnZVU7yTJSL5t8XKG6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071763; c=relaxed/simple;
	bh=D07Jua3uhs96Js26Ok23Ar/4/MvIJ5BYb7yr7CLyRNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8j98z2+xUSxaXYweoeur3eolUuzAlGg0ZStrG2mhWmimhyW3xNDaKu+jkpNQuUpXwvUiPFYd5VoPJ0oy5Cp4OZJnEZn0yM0h3zsTqU92x5Y5m8d+EkszRbofMOYip07Zecsl25OgevizQT1DtgYVOaUDr57xooXXTkgLe7pbe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NR3o+EJb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIip011132
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7q8BR9F5OBMsEZzbyywFRTwDIso+RrsEIi+fPUY/e0=; b=NR3o+EJbKDDtp+mM
	WqvqKrsep2fZg6tXDy2VxboBE/Cwnm9RJ9KZF+IybjXsCRhZ0AtjEaQjp+fqCQmb
	R2nNI9tV3bCL5zttpTVJy1rONst15lSE5JW0B3P+a8m9FHEFTsaMNpQbsfZwUBcE
	BRC4LlizN3M6EoxwdXd3KIKa5vagfaGon69ggDXAIhoofKYJNUqceTWgwQcJNJmx
	tHGPTLVBKeulYfEd54EKRaXM5WxkPJn652+are4cAIDnjD+5ZeZMEx+CtD8tHcTT
	Doo/awXIkwiG7CByUUGlu7guQTb/QHSAtyvDWNaAgCeZuvEiZWgFvoWRTYkg9XVw
	s9hlMA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv2yas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:56:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b429e665c7dso8817142a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071759; x=1755676559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7q8BR9F5OBMsEZzbyywFRTwDIso+RrsEIi+fPUY/e0=;
        b=nRBzumSHiWBzsXZWji1lPX1yaGqZkCu48kJZe3W1j59y+IztFM4t7W28eenJt14Mju
         NUYfv3a53j4InGU/t8bDg2OWuydqeVt5eF+8u3Y8OPoBFA598TXjtUU94h0/1z/J8XN1
         D/b7ulslWL7FEhhiau60pSq3Jx5oasRKIqBMDxCtdrOoA5APLBlq5DsfeFsCS9CU7a/s
         XEbpsPCt/dl/SHH5mS9GI5w+QXsThxXYc7ViFgbF9qpJnFHhWQ4l9oAatXp6zhACB95G
         OyrlnzosT5Jr2TwhWrOBURki2yOmXOydTmvZUEOCujt4UFKge0X+Ra6W/X7l22LOWxUZ
         SG3g==
X-Forwarded-Encrypted: i=1; AJvYcCVCxbikZqfxrmfpek04S4YZTzC4AqDImow8MMw2aXv4chKWWBcAVb3etD+Sy3HH1TIKCptI3Fy1hmyqorNv@vger.kernel.org
X-Gm-Message-State: AOJu0YyTY6vmOEbNoCeQzYSj3mdtgIkl/LRw0lscGYvIVwN4t7TJBc05
	KWxDEST3k8E19sb28LR8Tio5ZW/Js69BqNARnPH3L4lvqR0rjWUVF4c5Pt7pDbT+BOlA3v0jPwh
	9RjoeFSB03l6Z4w4oVIy1gPXNw2WlSEmxUklE/zdCED0QSF/Nq5OErmzXwHLVE0xqQvQS
X-Gm-Gg: ASbGncuhWlK+VCAmW9HAF99hEGXOcuoNb0iDrVVwBDNsbUYqU4EEeYIXAIL+1wuivCI
	iPFINMc/kkw9KElDP/U7EOJc8ILFuHO8/zDjl2rcvXjMF/HQmRhnAIFPZBv593ictEsPAVO7paE
	dRJpTwBzNHApfjc4nxaAssz2/hif8gfbTtzteV0HLNDzwobqEkQU1GUo/WkunNqe1NZTjmoB4tw
	ZJM7/7QCGf/0fxXwWNkd5Of/2wJcWPewP7eYlUuVfFcTEfafwgJsgVY/kd80yUKTJp4s9OQ86hG
	3D69NGMxVaIObuGI7IL+aVSnZMFMFgRRDO9bRY7GQxOizEPXV5BN9ZcuYp/VUntO
X-Received: by 2002:a05:6a20:9185:b0:224:c067:66f8 with SMTP id adf61e73a8af0-240a8b57048mr3545290637.37.1755071759572;
        Wed, 13 Aug 2025 00:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdYTtuNK9Ef5PQP9T+pU7CHZDwI8WmNAk7Iws2gqgqkZgmeLbgTRT90wMOoMIIfYtKtYpH6w==
X-Received: by 2002:a05:6a20:9185:b0:224:c067:66f8 with SMTP id adf61e73a8af0-240a8b57048mr3545254637.37.1755071759151;
        Wed, 13 Aug 2025 00:55:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:55:58 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:25:17 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-glymur-clock-controller-v4-v4-1-a408b390b22c@oss.qualcomm.com>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c4510 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZmWPdgOBrplkPgKrADIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: EkzhDuRUFo3bDB5b_kqpn36lheHigf4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX8NsQaEfvdQue
 y5q6X7TH63cLlhu1kp+aQazaT5DdQQstPB84AAmZMwLz6OW6oq2Qs6MC6ChEYH+HrrmqO7uoBZd
 7XEWUSVFeQihtCzpKDZ+JEs4vBa1KBslBpXySsYNKrSrR4Pf6X7s05HJ1aGC+9dxL9w/OUNs3bF
 nGW5sanX85aHHIc8gtnIPLm39Uwc4pUBoGl7kgZZZT71bDNIwphMvOl6w9tGC1Dl6X1zXtatafx
 s7Ksu2Qs+pu1Oz44/W2khYufz1b3PEGEJGLhhmeIX4OrTjtAKJ2Mb1IVynGiwPBRxTnevQbA4JR
 nKNdgou8egvw1C+vajh1xA6DjP9Gi1nY+pVOxfaqmxnGTXcRLeISVxTQ6N17xA+0XyR1mQcHy8Y
 mwy+OOER
X-Proofpoint-GUID: EkzhDuRUFo3bDB5b_kqpn36lheHigf4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Add bindings and update documentation compatible for RPMh clock
controller on Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a4414ba0b287b23e69a913d10befa5d7368ff08b..78fa0572668578c17474e84250fed18b48b93b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.34.1


