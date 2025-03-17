Return-Path: <linux-arm-msm+bounces-51649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D3BA65B54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E90F3AA4ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8087D1E5B77;
	Mon, 17 Mar 2025 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWWirmMQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E41EB1AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742233510; cv=none; b=cviYKi+S6PcEuW34/9sS4/Du8UrL+3Tky1XDOvaw1JxS3dIxkaISLEMftXFwd25iaXbScS4mpqoUtuKo8qL0so13Jx4GiGCky+W0Ud4qrPXgT25ne73aAeO8AdhXZTeMXzNwW6OOks82nBfUjgxncpQLeIBpL7Xx370+U8ORsv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742233510; c=relaxed/simple;
	bh=Lp9Zy3ZOg/Qu4LlOPJJAadQkAgPZsy1IGz1a5M9STgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QovSbRzqRU/wuDOVu/HyHNFeoZmSJ9MPUlShCZbI0TQTuHkQpGpi212gg+Gvv99YnbQtz6GPQxcDXIEy1YcBa6n8WN1xlyXZoLSEIjhiFdGlrLZnbivX6F9mW6LItgJ+Y0nwD+t762etG3EzdllOkLql3KXJ879+3MCwpuvz1vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWWirmMQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9mJDf027983
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=; b=JWWirmMQI6Ri1QBh
	jLcs+d3S6OS9nWB1BoK8rqbgK0ZRW+LPNG4SDqcOS4aOFcNTAk1kv09BDaH7EclX
	24SnAkGMwqXhuWLnZd6mdQzfiCj02wnOrM/nksbr2cDm4ZpkyJpOqmd5UNx8Fi41
	yq3yFOeKettgJJrb/DVbHyVEfB/lakwYr6ATXBePYfsJM7NV1SaRMVeQGc27ctgu
	wb410LODnQjuNKMxLOlF6yVKZVClY866982Qi2+9/gB97tc9HqljMkqf2uR8hMDW
	TFotjCBHo5mkrOI1wVDkiRZilx1g2tuIfVXCoqViNQTarWl4Tz+QGYgphnK6qQtW
	Bx5JqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2u9wjj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:45:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91f6bb296so89039746d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 10:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233506; x=1742838306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6JYyDCnGQI1t7l13SJSEphsLkUJhxRy8R4wnW+KmNo=;
        b=iGFRsbRHYA2UPGusCTyJrjl9o01GDKYV/TEXeaEfT67zttQqVjb46xIFb3e5y9y3kw
         jOusZb6PHiNJ608Sk2jLFFqsGFA7nvBT8WZ+CdauNs+WpNwhzmon9vDqG/KqrIrzXJJM
         xE0BwBcQgSL2lgO0pY3fRA0kmhFynmPCDPQx4HM3OyELZzeKFAWjvA56U72K5zAH67CM
         nVtOj5CR0b9O7H13Vn1OE/YrgVEyoOmKV1+kYEz8oqIt/M79xTt896YvPXVQ91NKvzv3
         1vicyLpu7kmOgCqHkFZOXLxTg2d98nk1DiZAqWBNMhJTd63VXcbzH1q0ucTt3oyD1AIE
         NsqQ==
X-Gm-Message-State: AOJu0Yzq0hk+oweLQA8zD51N8SjDar++7haH0h1mZU+1ORQnOueCr2yc
	DvCW7PnpeuCZynG7WAqff6YxqEmc/peyM0quwcndxBX7BPrNAxOqIERB/cvPRxV5V7E+3KxbkgW
	QGEcvrkTZQIvAxDUKOvZR9r6Uaw2v1WpdvnHxL9+vsJs4aOdkkNpvPzY6q8BoZ6Kx
X-Gm-Gg: ASbGncufhsbyYLOAzi1d5sXJWr8s0jJFWEf3E8gI3QGogFqdklUdmuc5P1ey7cknCsH
	TAkdxhKE09QGP39byrLi9b+xKhB0Z9LmtwRe3O1Ui9UGj2y91cSRHMZeI1tvirgUHDMGc+2Eq6l
	vk0+3RBrZEI56aDKzaOKFw2px1nDdYZ9Kenoo3ThMMJt7I5cTVIWQelRE2zLlx9ql6plXaP1amJ
	KuYerCKzXQv5zU3H/127BZm2YGzq9T66gno3aeVV5lfINCX0bYlpShSlftrug797p00RehSneCn
	Gji4C5DKtzmH6GqdQJzmGAA34Los9Ma6axL84h9ZiEhNBfvL+mpHPqyfqze2at+xb+In1VJe3tK
	H38YVNn/C6WbQqdVNIjpcZgP61JL1
X-Received: by 2002:a05:6214:2489:b0:6e8:c713:31fa with SMTP id 6a1803df08f44-6eaea9f428bmr220911066d6.9.1742233505894;
        Mon, 17 Mar 2025 10:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXtmxTfI8erWiUZ8NMB+CxvpTl746d9810IAZ+A7Bi9XLrZgZVZ5iDDqjYNP9tLWfpymWykw==
X-Received: by 2002:a05:6214:2489:b0:6e8:c713:31fa with SMTP id 6a1803df08f44-6eaea9f428bmr220910546d6.9.1742233505496;
        Mon, 17 Mar 2025 10:45:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:45:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:42 +0200
Subject: [PATCH 7/9] ARM: dts: qcom: apq8064: use new compatible for SFPB
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-7-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lp9Zy3ZOg/Qu4LlOPJJAadQkAgPZsy1IGz1a5M9STgs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HzPjnBcIKNO6yuZWjC9nNYOeDW+D9sPOJc
 W/omJSU92+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1b8KB/42seJcItiEdCaOgz7ToqlTAJ0yDZVlyQWcUNVxK1oD8+KLpW7DaNjz6PTa//2xgfFZbO+
 QSAucKCCdIFPl8+EfArI6rOzlDcM+kt6vgSI6sKWwKtzN4pbIR7bnzrkSEvz25Cvz2XgLQQu1D8
 QhDYcg40wCEzLl+ke19LLMisix38WG35QyJX3/7A2z31WEtg2YXwiTNrtMlfKjz85rt5REHHC8g
 q8Dis9CnRF/xs6v+YI5HAvQdz3ATRRDxNBnzLNTDF8+r/chNwhaKMvCMP4PVaXhCueIoKY80kiW
 91GuXoNHVIlLpd+SsBoH9ykmKI9c9Qta5/NbYKBLRyUFpf5g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JsfxrN4C c=1 sm=1 tr=0 ts=67d85fa3 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=vGl9qbW8TQSvOBFUlmcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: hPl3Xq0D1lYp0ycM-5YV8OWBDt3-pWpI
X-Proofpoint-ORIG-GUID: hPl3Xq0D1lYp0ycM-5YV8OWBDt3-pWpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=680 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503170128

Use new SoC-specific compatible for the SFPB device node in addition to
the "syscon" compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 3728875a5506397b36a4c0d6a5ad12c067bbdd8c..522387700fc8ce854c0995636998d2d4237e33df 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -1086,7 +1086,7 @@ opp-27000000 {
 		};
 
 		mmss_sfpb: syscon@5700000 {
-			compatible = "syscon";
+			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
 			reg = <0x5700000 0x70>;
 		};
 

-- 
2.39.5


