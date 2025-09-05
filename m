Return-Path: <linux-arm-msm+bounces-72363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F1B4638D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 091E17BDAA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79CA27B336;
	Fri,  5 Sep 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq1LpPPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346EE27990C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757100243; cv=none; b=fJkwFUPjzu1b74lcWltLR6TCGqgHY42LQPdAYQreqI4oI/g+AjpEqp2QbFgES6YASEIeEw2jMXsZSwQphp+xrmcGOtvom/aiocW6PW1mKfGWDl6wj2oQwpA8X6bHzssi3n0caWRWY6cFOBcuz/ObYUR0h6CJVwmZlFGyzFhk/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757100243; c=relaxed/simple;
	bh=srGN4WhgcsLMS/KlvSz1eAaY77p1cgmpEUU/3SXesow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7MrFOaQpPG0cVjJQdoTatu/Pt+GYVH1AZeTYxbStXm/0377vL+7mbiAjVlUzANorrupYRC8B2uZUG/GFDt0B5xXe+6U4x4y+9JQ20WffFrJ1O04FzB0/Sbs/dGDLeQqRpWn2WJ+i84ru8sWA6vDNl9u87LU7uPKd80xHbdCaoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq1LpPPP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GHE5Q008316
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 19:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UaZY5Y1LnNR
	AK4qvayKbjf6g+d3GE+1VhtaKAe1H3T4=; b=iq1LpPPPe6ax/mbNRbfl2lJAgrk
	jdRI9PXybAIWuImTFMS8YkDOMzw9Mc/L2If0f7mFYhZNuvsIwXBUZmGOii1ywRJo
	rGK7xxM3oIF4hUdwZQeomcZqjL1VggfCviN/GKyTPoKvrK//Yp9FloFVKdVkFZEK
	gb3o/pnAsEOB+90KP1AXIUbCdAcmg+Mx/BsatB9+bSOiAZxFEbHdGZ9FBOXjHaD1
	QGhkhvkZUU7Ouc+ypnPsqSEezSeRMVXaZcEP7044AnUziZN2h8oE5j/Irzlqrws7
	WwZp/tpkecUF84YDcSHdRn70gPQC4I8YDvfCvmZGsXjYuH3TAZHvP2UWufw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjva19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 19:24:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24ca626351aso5674245ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757100239; x=1757705039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaZY5Y1LnNRAK4qvayKbjf6g+d3GE+1VhtaKAe1H3T4=;
        b=JkRr+b0H/FAAhjtxy3Nz6PcPyhEXZDgookxO8fKKG8y4yQEBPeg0U6iIzopSnAMdl3
         cXr0KQTC5LBpCyBhbSoIArA2E1yqILwlVQ+JEqWpsMKQXnhURxRY44hH5DHOlf6ghLQb
         uJZUOfYIwV76QQHfoKhdWGe2b3k9BUREk7dRDY3fUw2yAuHZ7JFY+Qi32VrV1R+eK9yd
         TXKyPtKbHggFoqR9+C+O5ynjtzqu5r1w0dHhaa2t6oQHVUSJmxFz8cUP7288Vz/aOkSo
         dRMroVjg01xhxKW2ZMMZt6HqM2Y2A+on/trBB2+Z84ExugnV/jParH30mfpYjJJrivZJ
         Z/Wg==
X-Gm-Message-State: AOJu0Yz7kJnNzkv8OnufuPNuTAJ128D2BdqW8hW33vTCVh4C5xKvx1Ov
	O9DBY/kFQHBQklDMR04Wel3TQ8bCnQ7QO5wCwlCmr+2LE4phOlcmC1eh0MqcFVUd403Vf9sloHa
	unbGwtQ9IWMX25FWitfarMWDlXz8KgJ5fd5Q505d2OyEjNONbLQIwmrxl1I6puaOvb98E
X-Gm-Gg: ASbGncv3DcLUj9MAP/FjWI5WLU4jNKOx3tcxmWDMdhStaPe3nQujU10zDSR3WjrH0EP
	7JHI85M89B0aRAS1P+s6N0roRNq50mNqB8/bPFUsxhTsIqjc+IYYZY3V6889MGxbttlzEU08VXS
	moLJ4S+9D2ziI10IKOptMN3qhEXfOvwxlzmEPSQ4eIwNk1Z+9BzTRXRd1paZb4MEoLfvmEHyWzi
	X/ThhwUzJO8a/WdkTmZXLsaazCvJYrfa4eov17kBUpA21xrEeLONFHx1xjBVsL7NXY2i/buMXrA
	NZg8EsapG4zDt/zuAWfzesFt3dk6X3V2llE44F4xQwwzumOtvpYw91DBdMFfl8wJaDB3a2Q=
X-Received: by 2002:a17:902:c40e:b0:246:7702:dfd9 with SMTP id d9443c01a7336-2491f113dc2mr206779015ad.6.1757100239082;
        Fri, 05 Sep 2025 12:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmsSbG7P7sBg6yvvCEFKsVBf+CyWQn38skY3q8PaoBvPhKQ2xHKRloQaIxTAZOeMpXNWnAig==
X-Received: by 2002:a17:902:c40e:b0:246:7702:dfd9 with SMTP id d9443c01a7336-2491f113dc2mr206778865ad.6.1757100238689;
        Fri, 05 Sep 2025 12:23:58 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cc1a82a34sm52397055ad.151.2025.09.05.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:23:58 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Add Monaco EVK support
Date: Sat,  6 Sep 2025 00:53:47 +0530
Message-Id: <20250905192350.1223812-2-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68bb38d0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Zd15BVePnIxtF9Lu70oA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: L-SzHEGBxeYs-ihANLpb5k9yTPvkVoIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX7Fckti1kOTgh
 y18No8XnunOgPt457G6XYJKcgMTokXctL/87i4K9H9q34KBCXztCbwykW8+dTNf6+AUI1+C/ITt
 3Pry3jpRaWAYAHNKPHzQwjcDh5ZrnwJrP8DJrfkhcr5XDFAC2kO4epXmOuUtHwob17sdJhSVmPR
 a+S/hqLUtYwu2p8ywrxCAKXXVwM6vFvdQFgaPzOw3aF5h++uOUCFGla9RhKP0TQ6UP7mBwIQ+8J
 BBAJULHM7k5WqUAwqq3qZH0u8Vp09K59zjcuBoZmxaFLfOSYNxJ2NViocT73KkBHEF3kNqLdKei
 PiuMwKnsbhhId/oNapZ3lMVuiOUJX+X37sCjZ+9408i3TxW+Y51rL5+1975vtgTGQTnMz9DMdVw
 GrkYkLfB
X-Proofpoint-ORIG-GUID: L-SzHEGBxeYs-ihANLpb5k9yTPvkVoIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Introduce new bindings for the Monaco Evaluation Kit (EVK),
an IoT board based on the QCS8300 SoC.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0110be27c4f6..7d47d0c04376 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -855,6 +855,7 @@ properties:

       - items:
           - enum:
+              - qcom,monaco-evk
               - qcom,qcs8300-ride
           - const: qcom,qcs8300

--
2.34.1


