Return-Path: <linux-arm-msm+bounces-71194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B418B3ADCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F5697B7029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0879299AAA;
	Thu, 28 Aug 2025 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="le3Qqzw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD032980A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421312; cv=none; b=QEeUodASn3whGjRIktitaDBzC0ZMA+XsIQKmvY4g9kHY+ROdqfHb/8oMHXhILTkn9FD0XrCCHukc4ebEFS9g4gJ6hOEUY7qGTB26NREgCmLwUWqV85zqOFNrFSlzRCmKz6awnkOUXKubKwHFnVFWFSxzQ3+NlzQxMsfEChPaeFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421312; c=relaxed/simple;
	bh=xYiJqMlXkF/RmUEDi8Jx/sYOhGWXsP+4BXARGjRG51Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otPJCatMEOlItNtdSuFO3ExPzVFfuy/G4UceosLlm+XBtCALbSaKNYAXzjQ9rG6TckQRcmVRXdNU8PFyCX3ehwhtamoWTzGvU95S/s23YYYoLL1VbU8B1hg2omYrQSe4o46jJFDWKifUrIpsNbcmR6UuWjq/ZospOB6k3SW8wys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=le3Qqzw6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWZAE024738
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=; b=le3Qqzw6Iyxa5OJ7
	5zzXr+FUuD+2gpmpPmYeU57Jyx/emIulnMXElkDcFILTX48wtzjEEAVggMoacYui
	4ZczuQ1A7uNRL/V3ztS5p4Z83BsIXznjHB3PXBqyDuyeR0VW468bvJffl7Bkqy1a
	sYJiG3HvdV/RjoxAHUKcSvXuIMLWje8cQFTtDZlWAS9t8X2rhKTj2k7HgTbMKUDX
	QFuGGdG9JSkNE+Mu8Of+tbkydk+L/lSQj3MJz4+4rrBrovw9kki14zdKKQZdpuxz
	eapPCCua+GAuUhX2bZ5fhLfmnmQ7DS0ISZb2zyQJhg2n4Mu463j4ZaQRzShN0Qim
	wHhSUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up1v31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2b3cd4d00so40332271cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421309; x=1757026109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=;
        b=p96n+8fNfdRsWb7y6elDV0NbAEWK6s1G8WTr7CgmXVE3hq0dKrNXoX9ooOuYjQj74B
         VQo/Ioz2fhCnFXEMdKx1NxaSyivwMM4ij1+fOMPqBKY50O2eCwRi49yTy5tVBeB9Psjx
         bLGnfoc7TaIWoxOwJJwDYFOB/RDDly3Ry5sa8ZXVmXXgwSoLMwQoSVTsuAMMdN/VnSge
         FEL+7S6pQCbKehxTjjnNjZ3UjbvXXFzPTV6Hxga5czzalfaXKMP1ayDcXqch6YtczJuH
         6xazQcvQH9tw61BFTIS+p1iyAMw8oRyCnH+KOCks8IAE6r/2aZZmGzRFWa+JaC981J9l
         EzVw==
X-Gm-Message-State: AOJu0YwxCqRM9fJ9BLxG0Ik0Uao3yuPokxesV7GOpWydV5XPw0lJngQv
	+q0FT5KVGl6g4oDekjAOBffIHabL5U/5ZuMl7TJIFb9kGe0Mr7mujkIVGw9hhzChE4gx/zPRP6Y
	oHQDMz9axZ3jDbgeNvdB8yGnhBG2iopxq+qY2XuxMgKr+ROO1b8H2tjMAbtGK+IvG25UX
X-Gm-Gg: ASbGncu4mTgzu0/ovokGOBCmeVLpKIPKdagip7i226b00lJ7xmdKkkdL2a71iq1Zn/Y
	rhcCEgspYC4KEkYkCJT2zvPIkR1ZqWrN/arZO28jd6fr3a1rHbTZNlvY5ELvW1SDwuFJdVgPMwK
	fdmJgsBFZ4AUiFkaico7QwhXJVJipez4yrGp8X8n4CE7TYfS/aDa9yZshaVoKnE9HdE/nPZnbRC
	33LXSkFYomIS1fdqUNQyGOpQU9GNzkb/urIXnd92QGZyVQhC3TZFK/wHdZHiAMNnSU67T+ZPCAD
	eDwvrf9Q3kL88OMFYAd3HdscZegucJOWBgO6L9d4A0R6c7g487sxDIBOz1lkWO7EW8VKNZxLj57
	Xz1oHF5Re7hjNlWLm89iAmkDkClnzAIdFQbZ6qYJS7kBfR8DnvgKJ
X-Received: by 2002:ac8:5d0b:0:b0:4b3:c70:6b91 with SMTP id d75a77b69052e-4b30c707d9emr9878491cf.1.1756421309416;
        Thu, 28 Aug 2025 15:48:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVn7LUU1wLuo48uIzVLIpSmBydS8V9QqNajZ72cj6g6Z/G/PcNUWq2BIQBuVAWtOfCSAhapQ==
X-Received: by 2002:ac8:5d0b:0:b0:4b3:c70:6b91 with SMTP id d75a77b69052e-4b30c707d9emr9878291cf.1.1756421308958;
        Thu, 28 Aug 2025 15:48:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:18 +0300
Subject: [PATCH v7 5/9] dt-bindings: display/msm: dp-controller: add
 X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-5-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnKbj8oV/I2z2dmxNHPVYZHaNtQSEhlpqnpLKeNGplU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aGOxsmRflPs+cW9GrS5XbfvoS5da7xw0KR6e0h/jsST
 njGJ8ztZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBFotj/V7yVaur4HN4oPv34
 9P1rrt9L/15X6CkQc35Oetpqvmeln7kYAsz4D187wRr+17/Z+93eLy4np+y4/v3wfPMDZTdivaa
 wHrT2VjJ63Lp5guKUI1UPiq9n96eHfH8snVm065n+Xp5NC5oyzs88qpPLx1EVVxHNX63Dsfjbau
 Gl6rMv5Ya17zhSqSp7/LF1hxwzC+ORoHa5u1vOnY91dnfQfCCyyiPv4P6oJS3Pkxy5X6z+Lv3XL
 /FMea9mXX6N/ZnQ9TqqU/a96JE6pPH617s/1dEGk1f/XHlwgQtzerdRooKGjYzyrKrHp/tP+CTG
 3V7dbHDa0VXmsPrSFu+fz2L2uZ3Yv3hWUQv/stZmN85vAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KAc2CLnBpHeM1OliHKuB5aY2lCa6POkc
X-Proofpoint-ORIG-GUID: KAc2CLnBpHeM1OliHKuB5aY2lCa6POkc
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b0dcbe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXzYHjvwomih2t
 py2hJZn84UUZhAAyu5n/aWo/weEChYCBSzZm2nJtvcLJwcBGIpr6OgjsrQA+wJzWRGt7OnrtHfN
 gbA7YP6fj4GUu7j14fBVa1VA3cgpQ+qCWX02CyMqqmIUD6YYOf7LrEN0XkQ1waiF8FtGXDxpimv
 s6N3m3s+C9CtXhkw7iCeqePv8e2+y/tsJCbd7y86ybI66bUCXvLdW6kRKQEgusf4Vv+rYvqzDBF
 6aeinlaNj96FZuAUolXVpy2jGAgbnmVXdcU8qHTMH7o4+xX0Ldlg5FTo9LOW/0iMcCoXKfmbmQd
 h6UWShY434rheURUKFIjuRmYaGe0kgBBGLPw42BXQwVc6T0olnmtiqpkvT6IRsOVun9ontEHXv1
 oyy6qDYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

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
index a18183f7ec21ac0d09fecb86e8e77e3e4fffec12..6316c929fd66588b83d3abaf01d83a6b49b35e80 100644
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
               - qcom,sm6350-dp
@@ -193,6 +195,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2


