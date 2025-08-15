Return-Path: <linux-arm-msm+bounces-69369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97468B281EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DB553A8966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00A6273D60;
	Fri, 15 Aug 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkuVGHKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1725EFB6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268245; cv=none; b=QjSEX/uTP1klTCqeLFl44NWRcHTxmQb6Uymm9qd/Q9/4hZTIgew79GvmAmvHcwqgIUeebS9AMqJHwICD5iLnZ7r4MokQjDnOiMH06GJ7juDTA3htywT6PSp81pUeRrMwdasDfuPI7j2JguCkiNsE17pfoncnykZ+56GPG3YzQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268245; c=relaxed/simple;
	bh=hyEdJsmw3+fD6TBt6iVEMz+fGqwSjLU+mgD1J/nj/Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0kN9cV3YRKpceoIzbsILjDOYwOUwj1b54Et4wmgGKWWxF5UeRBW0MzrIMQrmPfmrUG0v45T5cKjLgJhOWaiWCgXdJcl0rHopgouWoIQOdwicHsNaTeiT5H05S3BiihIm30kXBg27iKMkPcuPc+fMtv1f1U6qs78k1iEV8+ifL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkuVGHKi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJFHf022210
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0Dga2ququ/iz0C7Gew/O16VrwuI8lG9clwmw5naUV8=; b=CkuVGHKijQzWfx5R
	OhtRYg8n8j7M+YBvnJkBGk/dA9m1ZY8m0wTtl3B4Y2uWCdo5QE8uhwLa4y6sZ5ZS
	B6Idoi7x0KRLt0FNqhKPsyozkAbv2qmkF1XWXUH1Eg3y8hTe7wzvJt9Uo/zpBfNd
	OmWE3tnewWd5nvxZREv1OPM9MPggCxCaG8kr+i9n2C/6ki9Y6hLa0j5297GTsVlz
	jDZSXCQPb4v9nCAtwiCT4FB9MeS7PEFFRzFKr1LMFeLnkU4uDVe52J9z2zNsuByV
	KM4vjkoMxtS/UrzPOP685W0Yf4qQOeB1gGFDn1KGnsiGvXkH/n4rDbQuRHSI2jDU
	rUQO1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmk75e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870623cdaso437985085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 07:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268241; x=1755873041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0Dga2ququ/iz0C7Gew/O16VrwuI8lG9clwmw5naUV8=;
        b=qj0MnL/Qtl03fjIG8IJ+lQAdqfmhXk3eZsDoZNJXFqQhBME3WYszoTY0S5Zv0jdrxU
         xD8vOGFBRb12++EuN/lIudZYEjY0VFO1qj1srlLpg8hF0R2SHFCp+2G/uYATWxeFczlJ
         sh9WZvtfuy3obMrh+dUjb7LJ0vCZHNtV8IPS39dF7foYhibudjOye+t1sbSAsEypRPRi
         Bkm7esHq8g7LT6IQfi1lIkUG8ZpjozGslKCsLSiuzjDFaRbrTNFGQqAOLuzAIo4Rl3Ag
         dSSH2Ag20EIaVOOEr48+IsblMnqZguWgPjIPn+5lFdfBsWkWWty/gifhkuP2zpvKio2X
         J23g==
X-Gm-Message-State: AOJu0YwvBbkcQQZcjuh3KIkaXGoHQgPD2R7uzhSnwYxplaQxrr3ukASu
	hHIPgbtJeUD4V1YiVIV7eW8hgz3Q6PUStC2p6sIsrGF0Zrep79cca+ypyrlHDjSHgXwB47/iHf9
	MY6YdmJrnFyyB0fE+8AcwOrABNm9J62pLwwp8h43el0DtGmWrAhFi31WwMjFWJ7Ocl8XA
X-Gm-Gg: ASbGncvvkCvzRUadHNt8SwKuK9r8OZSK8UJFmyQ/zaUUr2TVaY8StUfceCNwM7/OYgd
	teJx+/7ylkAgFmvOfaKhJWgOmOJ1crzJADiWRYO7tUgBmaYDtwa8QIHmKsMh6pagf0Ry+d5DVVe
	0TFWmGgiEtCMMekodRr2x4f7txg2TKw2Qyd5oOm/p4M7PfR/+msyH8TqMFoaCqmtz8TMqUr1QpC
	PkHhAqS0C3PaCjRTOenlsnyVxBrOrvVdNY7/10kySCpL6cJW0g6WXIYz2WcDNyj6TflfD80VPSg
	o/iZcf/bSxFRatA8Hufr42OfNzB0/kKFpE7d7ZxOdGpGPjaLqikng2CBAsi/TqCCiAOboY8kaCU
	a+06bEwT8eicU9k8uRN0Iv1QQO6mp192jyb6hDd/A91uaGmG1usZy
X-Received: by 2002:ad4:596b:0:b0:70b:9a85:2cad with SMTP id 6a1803df08f44-70ba7c18289mr25048826d6.24.1755268241404;
        Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbsP3wUZjJKRwWIURXbOZAQ20XVRCrWirWqOKB0kfzOToUE9mXBEuKx41mGrXm/2dIDmhmNQ==
X-Received: by 2002:ad4:596b:0:b0:70b:9a85:2cad with SMTP id 6a1803df08f44-70ba7c18289mr25047686d6.24.1755268240622;
        Fri, 15 Aug 2025 07:30:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:30 +0300
Subject: [PATCH v6 3/6] dt-bindings: display/msm: dp-controller: add
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-3-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kzfz4h3GQy4csg0TV4VQd6f6s6q0jIGQMAOr/+KricQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHNIR9djh0MjZ1tAnVRLTcBlTqr7v2pS+fV
 i55+ZtmNFiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1Yz2B/90KDCp05bcxoSE/R5Ptv0P1HM2cMyhnRTNSqf61aZa+Zg0T41QAwIA/s2ruhs1y/91atp
 SSJdoRo4oKpt0xbspUUvsUhu/Bi5d9Y2GtFcY01iOda3UGCVagrzaTyrl9qgw+KMqQYmAX6/QyY
 FWzB2oEllczxtuqa7SF96SqhD7MRUZ4IHXgZpMJsHql5d67w4idjtto0Q/x74OFAu/SaF+EZhiN
 1D/Pma4X/LHFqFde2Aubk7T00ovQH4hbOlwyNa1XQA2SQ/aFlUWtax6F6Wa4R9X1gO5kFOaWuU/
 e4Hm496V3GKBtyX6Ha6kelAiIIfycSCxXblTDJ/gVwLixQGZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX0L2J6ptnRqNh
 e83fITl7LLr/xwuPlqTpYokmfl3uoeXzZ1zH/6I1hMvvdEwteaaiiQ8GY2NA20QNibeJG+fsj8a
 +dcMpvjKw1yt0lBMuiEVToMBwNv4SXHOPZ2qcchlO5AQnSemCS+Vts1OZjuY9Z57t1GLx10ME9g
 IhJI2TPf6pgwy/FSnEHDItJZ/HjzjSRJZpTNhOASj+2WDEEjsI2KLLWl2PHA7uqdBXcEEA18wit
 EB5Y7pd7sngXs5eGQcJbdu8j6BRGiyImmWyQC/b7zrjjy40bkQgvyKmYyyCVAlI2FpfnJB+lj7p
 GX1EytJ6+8g1qJHAcQGbm14CNd8E+VvegBWjbUvMUtq9jEIeaPu3BP+6syE9vBecH84aysJmDn1
 YuiBeVlf
X-Proofpoint-GUID: 6rS4ZKhAdcua4PNVayf0edKWt-6IopUE
X-Proofpoint-ORIG-GUID: 6rS4ZKhAdcua4PNVayf0edKWt-6IopUE
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f4492 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.47.2


