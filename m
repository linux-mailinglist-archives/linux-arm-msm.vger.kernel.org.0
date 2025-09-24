Return-Path: <linux-arm-msm+bounces-74778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42433B9CADF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A49AF7A1103
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B472220C00E;
	Wed, 24 Sep 2025 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5pg0CNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D3228AAEE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757422; cv=none; b=XPLBbfC5lwXN79E8GK0gC+VbFPOqUJ2haz7Llt5LbLPlIth2I8KvmuBLwAH/lGKQ91SDYAPgU2f0Q/zFRlKUywdVmwJzpVNvS3qSyrHb0UbHcpDKc+ZDrDuSFqnSQXD1AbQOY1KHOWBLZzFm71cs2ET4X1K7/HlEWz+QZ682OIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757422; c=relaxed/simple;
	bh=+PguNXnKz4shlGzI8jizbctu7QM/1nClTAgxolHd+Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRSEUxpp87MDZYfNJby2VpqKp5s4P0ttt730kbkAY/Tsal1EaL/K4uWIhQLddJlId7SQa57asK9KGRc4cOmcdC6hQrvS182nR6CAQ1EXIo2MkVEuOYn6gD6WGQ93GMg7jB5HQ8WosZadeNHGlJdhCoQ4oCLclzsFRbfPups43bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5pg0CNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwCRX017456
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=; b=V5pg0CNLOhyclzB6
	1015W++m/kBMoFtdlwGyrHkZLaNKyJ82wVVIL2gw9ueN3rqEgisi+0ty/hWKp9lE
	RKexsSUmfi3RSst7FKY6uR+LsyiBtkCamf8KnnnnEWkx3tuTwvq+eqF8/Ql1Fht5
	opnvS8LxNW4nbqDDY02OcInwQuoh6y919PqeEZ4Uvj08tUpLt3mBEMp7dpT8IjI9
	atyvsm6ctqFF++bnzdDadO6/G8Q7CqYrMRljDr3UE8BAOXwvUfM1OOMnRFwXr5Io
	2/k2sDExj+kPSjwdC9FInAqlhCBstrdQx9F+DmpKWH1MYSBk9ntxne4C5AWxMiNR
	VavUSw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyd9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f14f6a553so1364937b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757419; x=1759362219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSmqcMOdgm06/uXCrcq/BO6IeQZcYft2rlSV8w8pItw=;
        b=QeWMofn0uBp1zno8HGgLfODVp14Anv3d7rNaDK9s3z4E2IYPlyKaxP6ZdcBNdddtUQ
         NIlG7wPy0QWw0kfvt54mdSGPe4CIiR50ViRL1o23cDVsCDJqVGhdfplW4I5UPdUZSzZj
         ix/NIfEGNLWfVwzp3oRb/KZby3gFv5z4QEkHvuxSvyomx1MBRRS+rn4yfF211Qavt+eG
         GqIXKbl9cCZYKR8tQNe6S9W2UEBjXDlOuJB6Gsji/hgv9tfhsSaq0nRw3w3vz+qLcEOl
         juvlYm0W4VhVOCPd2oF05VP/a1WQBBYZtywlZwFEOxxVmAYXAWAF/ywO2pAXc9JYDY9s
         A5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXYRUzbsqOptKvUcKXCBdlv3F+UkRzbhOi/IA1EaoRZs3mnZQw4cI+xYj2R4BwhjaaO5or3x6McWmzsGfc1@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyTywDFSCyFbMl6JuSd5mQGRm+0FCTh4BsQnjwCxWMPRnS4mh
	z1aKYdwYfPFa6+cBEShHboP5dwCveUZgiRxd4V8YirwSt5fxsRw2ebpvUM6P2HESyu4hRr8xAMs
	pXEr/n9fDJE9BtukZ/4U8OJwTuiu9VPqMGq9a373Y05erXOjC2LxkUGypRowyBz98jQySo5I6VR
	fPFnY=
X-Gm-Gg: ASbGncsYTQeKGXE3JB5pIQfh0r9yu36v3wqAekLDo6/c16ZXTgKGNrG8iqlKrKFDwy7
	IMJDUCTLq68dmiJCIRyKXiFtFJ7vTGLzVcautFHK4Wl15p2lEyaB8kO/9SnOb3YnIGeLFJb3UdP
	BsFQRNXdoXhacmBHR9u7y59mQqPVlNUGkVpFd/GzAQWwuFnQOQWprdZLNpunG2H4WvkQN3vnFeA
	qw6WPIR83QqJjUU362ABWeHQmyqZ4KaAnB94jI5J74PSADln0TV2aT/YAuur08FLScZO9Day1ly
	xj+FR2nK051dGRM+Ke/a99Gtaos/3oGbV7j19bASrZf/lFLuFB7Mb3RzsWk2XlKsG6erehOLmEm
	7mVixMKPoleOn+Y0=
X-Received: by 2002:a05:6a21:6da3:b0:2ac:7445:4947 with SMTP id adf61e73a8af0-2e9a98848damr661861637.19.1758757419456;
        Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcuIRmS7RIsvaeOm57KDRbm38CTDuz3keIizggRlO/lUSftrPyZWVJOOBtLRd0M0r4HDiNtA==
X-Received: by 2002:a05:6a21:6da3:b0:2ac:7445:4947 with SMTP id adf61e73a8af0-2e9a98848damr661843637.19.1758757419050;
        Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm192088b3a.70.2025.09.24.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:43:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:43:33 -0700
Subject: [PATCH 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-pmic-peri-v1-1-47413f8ddbf2@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757416; l=851;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=QTBiSyI3nJAg71OzCZCRGKakt5nc3BD7jBRfC3qPe0o=;
 b=ItnrOGsrkJJ9kT+UpfamhX55N903VnN5e2kd4l4ebA1exELav+BfJJ21XIOhHTSOY4pKg3vdb
 +4In3GHQJ2WCZVoeV7Zy2f6F6sBswr3gjW/6QZeskFBwgalGXzeVfaO
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: CVCQ3epVThyvHiXnv20Xky0wyAi0YH-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX02FG7P/Cqt/I
 ZtlbAzTqJGNWmj7l+J6m+k2nkLoYSLJr/rQQLMeTwkg6aqPACeSsGYXpuxF+JLtASJgml0YGW3N
 oiyLcxoavORzmA55zgVKh7ANQCopTEEen6C886Wvb7IzFMMfMecZterlhnxwgXdOfxeW+Jy4v//
 fRXWDkcPZP57l1aw1VfoubTu6wq/BW72kNA2f/dAkFBiPehsST5ONDtTc2rNmQ5D9geueS0AL4q
 SlTb1Fms5d/nBFHdjZ2CnRyT614j8s15jbR3y6XhTS/KiMnFOSGVPZwH/ElmWWSoJMa2pFwjaX3
 gbEIoCpT6+Q+AK4wvARH/68LDILaKBQ4A6xQy6/OLrzZsfSk22O7C5ICrITuHKlhoWCXfgyEcEm
 ZZB/riLU
X-Proofpoint-GUID: CVCQ3epVThyvHiXnv20Xky0wyAi0YH-2
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4822c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5jWUu6Y50JxcgPCnrowA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add support for PMH0101 PWM modules which are compatible with the PM8350c
PWM modules.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 841a0229c472..1278152e8eed 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,pm8550-pwm
+              - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm
       - items:
           - enum:

-- 
2.25.1


