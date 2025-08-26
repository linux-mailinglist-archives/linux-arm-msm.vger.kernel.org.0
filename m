Return-Path: <linux-arm-msm+bounces-70937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1296B37206
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8681E7C84BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CCF350D43;
	Tue, 26 Aug 2025 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/2fyven"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925B362094
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232127; cv=none; b=jGRzHyG/GhexzhBaHi8IaarAExcUtYW6OONnQCZWLSYg9+xKdNso5Pw1hoWaGkP6zA55M1hYhYXZGlxupDCC4VnbY9Xxj+iBfeFN55LkCfZYJ2cCoLuZkBer5d/Dhw63xGsIQds3Cwtf+GFZ+9RMe7kZmNr766BUSyMl1T1cFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232127; c=relaxed/simple;
	bh=0qNN5G0trkSGssI8DdO6WhMsx6naV5xeqsAx0Itjr2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OpX3p/O48BvwXG7FWODbB37nowlwL2E2/V0i7iAUIMpo2WhQx1E5W252p4Bct1hgxZypVaQABEZZtVhYtNVrfgFHRY6BMcrQhRbZlJD27JV0UEjUZuHWsqdTGr/l9kaW05qbjooguyV0RfOLlP0J4CP5NPmbMJF6GTP0GVXQylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/2fyven; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QGCmwD003241
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+ihNg7dapi0
	zoNoXXHZt+X7WOykNzgoKa/7zoDikPNo=; b=K/2fyvenmJ/P2YNPLj/yoDyeqrq
	mnUhkMHsKkwfrrhnW4GiYlQ50foZ7eu79dhse3IezGAcjREDLTEQTDvpWG5cEdH8
	21Jtcw+eIC1KqeZ3IhqcbDcc2GSVHbYcG7TgKzmPdix6JndqW104kX5oz8OTqWWh
	XGhuNvkvjZp0zAjxBns+uR5hOPIzY787c592sFdyX5qrqKELg3utNIJHbigNhnOb
	LV2rYtYetf7qxpxfB8JFdj+VwmprPu1lZ5+fpvRI//WZi8vILxxAyOdRTE0yBGe1
	9FC0VBzqXSFVKftsHyBni5pELYMj153FBOGTXnnekgQBDDK48KxqNsLFWQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we1sr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:15:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581a191bso13244555ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232115; x=1756836915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ihNg7dapi0zoNoXXHZt+X7WOykNzgoKa/7zoDikPNo=;
        b=r6eo+MRmYxnKWnV8PSIjpvIlFLAIQ+8f6+tfr1j3RXNPd8YOEzjQmYqPTxmApI67e+
         bcdbMilP4RmuKauGrWG83AZNVz72zxp8bq4SJdfMaHswPekr09aRHj6PABI9+F43/7ns
         AvNjq8/hywfC4tD8oZpy/1IqVKvjU6TCkgnx2u3kQuuPcTkg2b0gtIZ2peMKsfcdmdoO
         XwMfvZIZsD6UDrTkDkNr1F95rSmQoDWWt9YmxNpzI4OPN5ejKi7dPED0Z7Hg1yrqkT9e
         ueNmLZrK6cDMCCWDa6EC6VGO5E+IyT+tyMn298szCjvD0kNVC9HdDGK3w59wvItly/9K
         XjmA==
X-Gm-Message-State: AOJu0Yxix7wikG6XJSHopKWLysBvVAxIdA4pqdygbcLIljrQvCoUluNe
	t7wKkT7Rw8h673d4uF+qtxdfqu008Xs4xA6f/R5vW0DgRPTB1cljYIYLelqLqZcnzbH65sK5N2F
	Er3+5IIrx4W4rAMy4r4VaiBuK+72wLXFgIa8/Byvv+lSDSYDqIOufiEWdr2BB8YBnuBCC
X-Gm-Gg: ASbGncuhEBv3Hf3ySnmhpnWjOM3qNNXTiv15Qe7YalXbvaua6iyrXao4bLE5Pvv6jFg
	/I0TUdSii2+npuwvdwHYpWnXvNDzFIGWQ6xbRoEpZYMB0ttYyLGI/N+CdkWELRW6rCI/ujCr6dG
	gM+1U7pXj1XzmG+WvL2+ORgFtAyOHOerPh2rE9QB6FiB+Abzb8TfAaZR+nk6brAFvQOXPAvVPoD
	dXiXj97Qwo66PXzUx+3D4nXB0mHX9yniPDyc7VOv7U3O1HaZAtD5LWm/cemehtdcnWUhR6iGDq4
	d6YHRniA5L/xYp95AmoQsbbFSqbWnqk6S2MpW3l96e1+SlQke6Ajq/ic5Gce/bauhYwzvqc=
X-Received: by 2002:a17:903:2f88:b0:246:b35a:c655 with SMTP id d9443c01a7336-246b35aca38mr69796845ad.8.1756232115006;
        Tue, 26 Aug 2025 11:15:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGATiV+04qck3dgjysFlVeEpbFtlXyRspOnVjNEGZ5zaJRMGiEP+KPvuRcHNp7ykWZ//qnDrg==
X-Received: by 2002:a17:903:2f88:b0:246:b35a:c655 with SMTP id d9443c01a7336-246b35aca38mr69796605ad.8.1756232114565;
        Tue, 26 Aug 2025 11:15:14 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffb47b9sm11065536b3a.3.2025.08.26.11.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:15:14 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Monaco EVK support
Date: Tue, 26 Aug 2025 23:45:05 +0530
Message-Id: <20250826181506.3698370-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8kk6KRmRNat6gpDTlzjE5qzkA_QrZDpy
X-Proofpoint-ORIG-GUID: 8kk6KRmRNat6gpDTlzjE5qzkA_QrZDpy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+xrNKgW14JfV
 X0VJo6w+10ygTaq66xPSjiC+9AnMl+G5F6aI2sb0kcSRgWdbI09vAfyZc+oQ3rjpkM0Sq1QFIpp
 tV1zRKPVUOyv5YjxYcWifLrG4KfP0g9UGDIuoz3BWXBdFEBPx3DStDOAEVnpE34/7GKPE8bQ1MY
 2Nw/ca1dnPb/SpE+14R26yMgCPfjyA9YfTZ/ZfGjHU4sMLaT5lDcZsZJ5NZFYiWHOqSCFgR5tP+
 9EGtVdoqLp9dDk8gtgXohRASONjmcpqhn2wacCntn8PL35LmO5KtJw4sywAIY3BdAqSQLNmH4qd
 v0N15U3sKzU44IzuGvS0fY2TdD/yoC6RPuAsBNIPAugyRVBXk4NkuVmzIRWW1rs7BS0fdSL6/jH
 jASQX+tV
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68adf9bb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Zd15BVePnIxtF9Lu70oA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Introduce new bindings for the Monaco Evaluation Kit (EVK),
an IoT board based on the QCS8300 SoC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af89..a4b125f83450 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -854,6 +854,7 @@ properties:

       - items:
           - enum:
+              - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300

--
2.34.1


