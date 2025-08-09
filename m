Return-Path: <linux-arm-msm+bounces-68174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F257B1F35E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938A71893BB4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F5D27FD75;
	Sat,  9 Aug 2025 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9GwGara"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67C427FD4A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754728449; cv=none; b=ZHOsBHmImwSxLxatGSHXrcmpUa6+FBLSo/oykKqSptkOqNY8cUPY/7O4l13GpJ5+Ulmx2LcXCDFZviiLEyThendIyqNaasbp/adOigeaOdY+l+Ts2H3dz7g6WXL0b7Bfbh1YMdAexzVkEUQiW/xDfILoW90k9evptM2SCKY05Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754728449; c=relaxed/simple;
	bh=1Y7zY65rJYgQ8sY2gOOTnCadfQm7t9KbDktMxzdbFjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPvX34VDyMq4oe8TYD/w5WK1xSIIQoaV+sXEnyNZ0g/BDp3CbpQxm/Shv8RglCxtdpBUnlEH9xx4YFAHXRt3//ANtRrh1GE9UvmcHR8vHOum6RZeEQrSAqnRxMnqLgp9TaTlru00C84WXXF73gYyyxyIxElPovafvFOUvrEMnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9GwGara; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793l0XL028703
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 08:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=; b=G9GwGaraZ/Op0nXw
	0zh7xI5yozxuNGwywTecJ/riIn228egTIbjUCc/RD/zp8tZSD04p9PsEXzzOCmjT
	+RY3OYjDYELTx8GIdvM8OKLgB4Wsul5l4XxLUuvSZurneQjXG8jqFiKQv7aPO3Fy
	fT8VatYlMmom6IVuJf2wKyWKaHsMqUuO6R1sZLd+ZJaD7ByNEd9nnAdmTkdHYOYM
	wABPMoTGl1DCcTsGbK9cVoJ5pA6biRKdMmkmFNkQAyAY+OIwoWDyF+ok4Mqy5631
	b4kH5rPzmq+jshKeSsCGbb/Z7xDJ1PhqarMSzeylQICQYxdzWGqjXqQ30HLPGmI/
	c2jxDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgeu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 08:34:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08d73cc8cso71961951cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 01:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754728445; x=1755333245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wukwq66wPKvNOpEVoTlqCM/dX5GluHetZv+gB4FYahg=;
        b=IAFGM6QU4YSWMocGnejg6d8DNAwzKPJZQfm3neDwSpH8PJVrrDJNveF5zxUc1bWf4c
         6zWL4UNDqAV/qrzVG3HAatG4XKyOWVDQOziXtHazhm3bzKeNTeZLSrIDzpWvS2uhv4GC
         7gBG3oFLvdHQlDgW7ywLqIi/+p2szJjP/RDbR7SlDJAa/dIeBacygajV9jzLdfnh7Fn0
         pSNCn/WCKOAePRc70lryA9k7TD3Tr2vCRaI1+6RWtOmqhD7PP4wS2lLx79zu+1Lcw9V2
         NolMUDbfSQiYNJMmqaRfP5Ig4p1rsTpXbFeEB2LFet3hZMe6XIA5/Ba15CMaFj7MhXWq
         YcHQ==
X-Gm-Message-State: AOJu0Yxuzhs0VlLd1lJusKZgQ4nT1JmkhgkhFb3iiicpLrjCBysRjHBC
	IXF1uOQ82pQyWPsDT139Me/e/uaXuOlveqJXS15bzzuIB3uiCK+jO9NbNgcL6I+dFl13K5VHBOR
	lvHOAiaYhwartHlHWmv567QZIZWEepV5yPMqtL3MRhdCY4WpC5QQcMkvsfpqddAHsz8mA
X-Gm-Gg: ASbGnctWNTJ8+TGICHiZ04Lf/avBJpi0+lYZa5AO825qKK6fRJ4b6af6RXt8INeCyxi
	FXLW0CYDb8HUC+EHuaQKUe8pvQ8YfHIn0EIsYwCSzOeREslaxUvs+I1E3ua7MTqenLZg8JQR3qv
	M+D1m3j0u3n1M9fpqLacCLm9Gt6LZp2rTp7enIMYryhcJsll2LZbW5aRbeDJnwuWNFOiy+RKUgV
	jWVb3qgjY087loj3KtnpuGUBEek2dySmtSKSW7+ieOEmO3C0q8A9aoE+dWtN7krceShJXLfTx7N
	xQzQrPd7xczmboQyHkVW4kijndYcVKKjtpXgvghrxKIrCF0BSHwPHIKNWry3n1Fuzyy4x3l4PKa
	RwzMvtlz7zRU4DeYuF6rflaA9Nv6Avhe3qP6AhFZ4vUmsLwLd52xG
X-Received: by 2002:a05:622a:1a26:b0:4b0:871a:1d29 with SMTP id d75a77b69052e-4b0aed40874mr94915841cf.23.1754728444766;
        Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFig4RLdVa+ZKtVVWlKq4qwy4Mdk+4soSl8FgCqEL8l9Uc8hKFCmYGvSZPG/3ishEDqASv9uw==
X-Received: by 2002:a05:622a:1a26:b0:4b0:871a:1d29 with SMTP id d75a77b69052e-4b0aed40874mr94915251cf.23.1754728444291;
        Sat, 09 Aug 2025 01:34:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 01:34:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:54 +0300
Subject: [PATCH v4 3/6] dt-bindings: display/msm: dp-controller: add
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-3-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1DHFOJ/5Vedl1A10IE8+ZyGBBk+aXq5TcrqsRnBV7aw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwf0KySR7b5nEafzqIH/w6XFWN5nSrXlVFTPu
 zpV2R/SmsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH9AAKCRCLPIo+Aiko
 1d74B/wLBzPtd5TN16CKun8cN+yKqM7XKe3lvESHvQ8ynyfNoHn2CFWTXxVgsxf6kOzCuuYZEwk
 U4siRD+S3q1ax07b8niuiEcC1bFAuvZ+x2e2UGJnkcip/ABE+g346Cq4711K8seCP4WT/47F0Ih
 eo/YMwLkL5YN7FTwCpai0BCighJaX7h1r1Krn6ZoBIUL0MlgPOqeMvbZ2q9WdTUpHnH0YKAosQh
 O7NB/nEzNgTA8sWUC24e6EMISlwAtmCCPWiHzhItkxdnAmi/lK+34OQSOhdIciDWozHs4I5ieHY
 A6hnaS2SU7P3o3tzqurhlD5EuBeq6qP/P7sFd+2QE4otzehv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689707ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LXTjkAqqvG_e-hvHT3MA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: B1b25abaK43vehKq55hWjj5_fhZZhQ9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8CUrbdHYPzgG
 /N3WlDiGFlEsy5+BnzeRSLFkjDMq6gq4eJweQINNWGl0dw3wDDCJd5pHhqv40Sf4FIRin8FSgUO
 APHmqYWyGFjTwxWzyNLvC0QIFXnU19C4g/Oip793qIC+JXWIt9t/DP617pXdtckXoZ2HcIpzQnQ
 97F/E99lullvbUCiR7Qn5iVKGJrcGH1ETIQhHVhgHj/OZvrnlClCA24gbJRER8/B9j0cnlpItw1
 +rlUvkWV3+JHSGmlaWz4QASlD6mub1kkaBXNhDgf+sVtPzFDiQJBnBhKn5YlO6qcfW4sUQNS6Cr
 +mlhs3Xvta7YCsjLajrlwNmAQweb9xwt8qXMCCw9e4IVFYrDuzOW1pswftkH136WdlLgTmU4u35
 ubk50081
X-Proofpoint-GUID: B1b25abaK43vehKq55hWjj5_fhZZhQ9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.39.5


