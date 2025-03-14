Return-Path: <linux-arm-msm+bounces-51358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF1A608DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78BC117F843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A91632D3;
	Fri, 14 Mar 2025 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1kMUQdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1EE1632E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932570; cv=none; b=iHyV8ukEHIXIizIXrQ0C5iijo78wIe9Oh3MGObnLAMiyXcZjOa1dSfWQymLXxYe4Ex1VF6z1cuReIwhCcK7WTkpCJeRfIRK5DXYh3g/IPZWQJrPzIvDn2OJaU7Rotr1WqWkaZ9vDNCIytLyeQqBDw67q/u26QFJE7PQAzcS0XGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932570; c=relaxed/simple;
	bh=fR3qQKGpGRxj1T6vPpbffnYHS20YwtNTdXiSdKBpWug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=es9JJjo+t0twrmO9gnvqRCRiTTNFwGrSckJGQp/snn1iNYmuaPkEIUJVm5TORiqn1ggdnHV/6VW4BuxV6F//VhL+4oiThGuWT38ma8pCujNhdMB8f8Oc3TJH2hfmAEBclxdsUcUv/xzAlvS0ihnASGtqHrxNE+sMPFTDXqHXG8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1kMUQdc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DJvTPO015189
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=g1kMUQdcqMAybrFS
	15GvE6JaxHBE5W65B5Fv8RhwbVVBdkNQmpiUAKlEuLQ24c37qZKaxW6tsMf9JEbn
	bGaD9RfgzU3SKXA0YwEVk6AwXWPcN9v4LFTKelQ0b5GGwBx7JP5mt1PUAopkGbr+
	DkyKUTLcOvO/2WzcUwuJY9PbgWHIQeuD+ZI1F8RZhwF+Jd76frO0vWlfw9iJvmB4
	ktRIPr3faHxl9/9Ih+q8BdtwBFDcv0PmL11jsp7+Pf0rZiYIZuWXSRxO123R9/is
	YE1xciPaY2Se+6Pu5BdSEarjTsjHg2vwAeQci8tIxOvvUkCFJ6ANvApyRf/ryzBN
	mCHTQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p0798-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:09:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fb5a7183so31282366d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932567; x=1742537367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
        b=rQRWiYAg6olwTMOQ9CXSg0aV+YQi6SJ9qCZBYDx54VMyh/YnEjIGvFZPuILewl0l1m
         CIuT7BTEOvFmBGlwdYeTH3WPWiWDxVi4sW9sdeskVjB9/fQbDHYPonOEJy6Z2ypeMOyk
         T22dOVHkU5aOddwAccQebEULfD7d9iCImZjBc5biaVyR6s1OClGwiU4GXKrHJgWBlDmo
         5Rq5S3ActNiUf55r1wxhNzqaZo5LyANRPyhJIz432ajca6VRPqATaW5cbi+svGzSyN3m
         92xgwd0fbh5/FaqnUswJ8Lm3rEgAWvW9HIqedEadNoU+0hRCcc/lcP087Hz5C3JuFJkl
         ezlQ==
X-Gm-Message-State: AOJu0YxwAui7sbibgE0RmX8wj8jvPSCYykwLuXWgZ+39EpiMoFWE54ty
	0SBOi1OdUTxpmjnENhROx+TkWIcM8xY/6Du1+G3qs6zUj1QUmgE4GUTFlRHHU1eEdmScMpykRbi
	fAgCXGpFlcyPLvi1U8DXeVeQPGfSnDRySO+yaLcMcNJ/P9bd7ulpZs4eIdeXUsZ1K
X-Gm-Gg: ASbGncs0lmf++ibhOpr+gMUAsv+gNRuJzDN5gQYpysMQCYyIGX4lLujpGCytGj+IMy/
	4YU/fwAj7ojN1+8cmrSROVFhBdA4xGec45BoUS3mjQOph2a3/6Ew9nTPBMvhRdBfdPa9kID7v6o
	cd4gNQR4NBPQPp83+2Ev+p8A12/dnM+hwF9WpUOdExga5m4cPJbfgl8CbdvurF3svXTVfZkSLEm
	yPEsHvywbmIn1bbeOYQpYY/dR7z2rfkSpjwCh8jCc92qz0VnU1L3FB8UkhbpRJGET9Z8FJkbsnd
	vTpVg9Fma5a9sZ7I906zD0bhQJ4nGrUVrkkLIvoxvKE8jC0Tw2A6p+R7XKVxhfG6QY0l8Vqw4tO
	JLHxz1JccoCtU/ZBFXt1UqyWpXd4Z
X-Received: by 2002:a05:6214:1d04:b0:6e8:fb94:b9bf with SMTP id 6a1803df08f44-6eaea9ee3femr18760656d6.4.1741932567078;
        Thu, 13 Mar 2025 23:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcEa9Bc266rkd2ufdSrH8URTSt0lvVJ8rYD1A4CatJi7rKwY9bNrmzWb340X/FvEigsaAADQ==
X-Received: by 2002:a05:6214:1d04:b0:6e8:fb94:b9bf with SMTP id 6a1803df08f44-6eaea9ee3femr18760376d6.4.1741932566765;
        Thu, 13 Mar 2025 23:09:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:07 +0200
Subject: [PATCH v2 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-3-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rlE2xpFfY7J55afOHaOk75u4wJM7Vmfn2Tzptv+fXHQ
 e5PC/cs6mQ0ZmFg5GKQFVNk8SlomRqzKTnsw46p9TCDWJlApjBwcQrARISl2f/HFLg9zFjh9/3j
 l6lpXunJ9YFcvwUSXKYlFYuXsrTG+vlEyUm6Ho8P/6xrJd5etletKXnebQ/2hWuCDO9N3GLf/fm
 p9Qvuuev1TX0mnuh/MCdlPnu8Kv+WzVcyHpdm6Iny/77XzzejZf20Xln29ccdPS402nXsEPseeU
 ioYH5945MF3DyXp8nL28k9n7SrdqJMv7NU+dLbFe8mWQfKVfwsUzox0X7R2RzmpZJvDi6x+8+co
 Onq8kCA8Yvr75cl/9iMSjoc2Dev3+HHdELR4DZzuOJkrpBb4Z/ZWerY13SqXyv/YpPxoo6V0aGA
 zeecwgLeSNV/xR/1PKw4VsbXSp/n7jef3sIgVrhPp/YpAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BWgVBpozXebiTdzODdQwVPqWP35nzPXl
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d3c818 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BWgVBpozXebiTdzODdQwVPqWP35nzPXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=919 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140046

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


