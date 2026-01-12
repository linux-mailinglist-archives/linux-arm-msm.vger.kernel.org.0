Return-Path: <linux-arm-msm+bounces-88560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A2BD1287D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B24C630A92B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457B53563F6;
	Mon, 12 Jan 2026 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTCbSLQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d69cZ4jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604AE356A31
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220617; cv=none; b=SsgO96qkbk/AxqFXPn/nOIjJRy/9rURx9TO0BC6w3izRhayFRXhXld1KvQcgzY0FYWJujf8Lcvm0vzIoc2n6EOqlYmewmukHBTp3wkWiME1ZD56Hl4ErvmBPsA+NFmtYiScVuGnqtQhsYCUypRm+M0yKb+rQB1+wA3k5wpeaxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220617; c=relaxed/simple;
	bh=CgEbXiC0tRFYy7nWbQqzxFqDe2dxsHJ9L5SvdEX1eeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P6/DRRzP69hPmsLmfmoHAR9/eDC+KQEX4CbgkR+w7w5s+yLsWmw34KWS7iLelAwyDSf9WgyFfYgBPChnm16pwbrshAAuqexgJ1OqWYzJlpF8FJf3mkw3Z4SAcS7WoRsSFc2PSOV2LS12BnYIXTY7VHeV69YfAIDHV7BCcHcZvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTCbSLQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d69cZ4jg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEdne1315899
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugE260vZyoXFyprFtv+qvQF3sV0ZXOMPRQvSaQD4GiA=; b=RTCbSLQB71zL1cnj
	o/Mmqc9cQeTzlpYv3Ky6rXcd1KOsFc9HTOwfAKmKpxI7rRjlRxrvgGX7hiEzQaS0
	jLaKD0Cji7sUigFyFBa7VOTBAq8N+fj7FX0DfDvOmo8LYcQzXqyRKwG+oDpVWyTi
	Sqx5YQja8RzK7XR5J/AcQSqserdN7/76P7Zl1nzni0r5vDuBW3AtrOv6UAYW9fli
	ymBnfgl+oiK+vznU13UhoWe6griMXPkW2pzSzdl7YQIlBWzcTXGmB8ewBORrGn+a
	4xCLS0gUy9wikN3v1j0WWrKK+X1E9HhIpmycS3UF3bxPt16DHsCzVbykDTUTiog6
	uw3Gog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hgbb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:23:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d058fc56so53269085ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768220613; x=1768825413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugE260vZyoXFyprFtv+qvQF3sV0ZXOMPRQvSaQD4GiA=;
        b=d69cZ4jgVKiChn515P+0ZuW7JU5GrQKd5jGpKvta6qaqZJ1GC1VeMcZ0f2Vi3iZTiM
         ZzvmDcHB3jCkpelprg76RgJojxtGYyFZ2ZpBFd8zg4+NqypjFypk+TvK/5XH6xkeqcep
         CwSAETxtERPdV1Gku3+COwyqwJcziEBrDvPhX3h5lXIRjq0O4OFzR1PdxAAIxcsUVguu
         41FpYcM3uTYs/SwaEgQRUGSrJDiz3wwzU7+Nt1l4K+XSWjr6WZr3ot14DqD/dORZWz2U
         fAeD8LenET9yW8vS7jTnCjViRzlxFxRMp7+vJqw7fUm1b4EIkwbujVa5I9hB+GLtxPVD
         rUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220613; x=1768825413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ugE260vZyoXFyprFtv+qvQF3sV0ZXOMPRQvSaQD4GiA=;
        b=DVTjNYT/kVUnUKAyXO0jcbQ43UdOsCJWKJPDPJPDKvw20HwPAqfbVY/uhOOQ81G4Ci
         OL+DKXR0B70jKi3x+nkSrHyH7Y9rj+ZSrpAZP0u/8FP2KcmW5QBIKAjbYqhEQER4fD1B
         4zB9IgWd+Mp4F7lJiqS3E2sV+MnhEvje3PApG3uzqEfwx3DrG3eIul7/ObhJk2tLvc1V
         Vdw17bAaOwIX2WXwzrHhz+Ob9LY4O6NwREOaPnYuEFEKQNeLhRowowQRvgpDYYT77BnG
         /Ye/pJlDoyFr+tUdsO8dYizgi+JzFoykM5/Au6MTbDUsVGw0gH/rduxRboWrOyq4mkYW
         TZUQ==
X-Gm-Message-State: AOJu0YwuWM1QyDF3ZsbIUHGmGrivshgo10rQDtLIDfaRmtHlK4ivpJBG
	xzRYt9cSflTXN8opI+qia0cVTIeOOu9eza21bht9iEV+ezC5rRGn4DcnIP7I1fxSMQydRUC4Ka2
	zh3eEEcTBpOxVno1NNXQ6rofBynyrorUW5J1Na6gmtUityS12FapqTUk/GWXsTcB4Q64/
X-Gm-Gg: AY/fxX50Bok68ehCyhMXph8dLgeKrr8CZGbm49VcVe00b5ZNiWh4fZ2D/6rk3wvEeqY
	mYI3bAC/D6z3GiGsNtiomAyeOG7FQc7kiP6vMagbg2n3xeJNfC2suk/PpxN1yS+ogjDtL8c3Zwa
	ps05eZadIL5KDTd+dHbILA9yYWH2PsDsn38bvCuAYvd/ILQFMZ9eSWnGKFvp+7g3yIWSem1PO9B
	PCQGX1E7xwbZ80m9W94RmYy5mfqut0L96n+3Zu7BfE1GQRU0aCcqK1rBuB4YbfSfQqJNc+agk5J
	2uqSxd0s61fecWUmpEt1/2FdXvKMz8/nfx/x39hO+rdV7P92qZfbzPbIIu23URr3cbVg/IBVPpG
	PplpPNyCcxtEOBJCtrVj7ByOgDM7+8wKObB+ZHfC2vEo4eqyEwodWjYJKoMkHg/zRCrFqKfpoe9
	cykMMt9HA+7VVK+3PkZf88HMLUCrx3Cg==
X-Received: by 2002:a17:903:3508:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a3ee4e8351mr167242875ad.30.1768220612991;
        Mon, 12 Jan 2026 04:23:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkHE25L59KfOtX96NughQFvBikRNFtvaW9wf0A+6QcZm7ZIw10Sx0XpCL6Geu7fSc+Iz41bg==
X-Received: by 2002:a17:903:3508:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a3ee4e8351mr167242695ad.30.1768220612488;
        Mon, 12 Jan 2026 04:23:32 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47147sm170875665ad.22.2026.01.12.04.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:23:32 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 17:52:34 +0530
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-upstream_v3_glymur_introduction-v4-1-8a0366210e02@oss.qualcomm.com>
References: <20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com>
In-Reply-To: <20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768220604; l=796;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=CgEbXiC0tRFYy7nWbQqzxFqDe2dxsHJ9L5SvdEX1eeM=;
 b=LVt0yVMYF4p4ejPYJgWI4Cgk1aTHomVISQomR0LHxwHU+IT7Oo8YAgjV15X1Qd5UrNXTgZ5db
 jL8UmDW6xVFC+ZqyB8j4Thu/+fWH8VgkbRAq1ezZ9QlmShoEvuAZ+RR
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: dfePf5Lo5WZ-ddDIha_58j_1TRlkMt4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5OSBTYWx0ZWRfX3uMWZZnJDj8Z
 01KdKDFehch3rLn30ofhZFixIPr8+IWFumyfITavEg4l26jpzNkZr1BZfO34RjnWdzVvIuv44Di
 X7VGVynf89ojgY/i2z2NRYM7zHDiXi3YMwJh7MwCQAU8MBU/p/QPRt7gMlZtgx91CPGu57O66AG
 G91Epb0o/qWXPrMamZ9xnpQMrwjqn1CYsKpyF9+aOIxZSA5Goe2RfBLGgVVZ9go8O1CsXPfIQaD
 mIPgk6iq3MUzMXJdVpcBquQIwiKsUx9RlBdtDGTGnQELWmMPBDpJyL7k83kbdPE7aIMGGUbQaEk
 DFemt2TK4WD1bwru9xwE3FGgspYAWOck6K7EFfTlB2DNJsiQnCB5LDUQBOeZHm3lpnPl9AbvYpX
 VtH9CGsVFYk/4q1l7548lThXxEiyhxs0bvCqji/qbRyIpQqcN8x8Um4gxsfgP2gXubVEh7c2CIn
 7UAJX/qWxQWf1M0oXuQ==
X-Proofpoint-ORIG-GUID: dfePf5Lo5WZ-ddDIha_58j_1TRlkMt4q
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964e7c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KVNckf8Hb-gWPUCTgC0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120099

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..5be53b50f5ad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -66,6 +66,11 @@ properties:
               - fairphone,fp6
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.34.1


