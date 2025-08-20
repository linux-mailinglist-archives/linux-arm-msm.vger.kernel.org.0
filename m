Return-Path: <linux-arm-msm+bounces-69925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9DB2D8B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1683ADB93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329212E0B4B;
	Wed, 20 Aug 2025 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6ZzACJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11922D94BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682543; cv=none; b=lDidrh2m6TCR0LgOf8snbbgxGmIMQDQXhmMzBRBUhotMZ2XOGfwsy0jC54VwIsGmhv5uhFWyf1NRamAOo/1CwXQPxRiDT0fu7s4qiNNBqGS5FJiyQ76OyrO4YGUiY8Zka0d1LtVhPGcRraCL9eCzoc2ntiZHrdBLvGUi2002IaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682543; c=relaxed/simple;
	bh=TjE7e881JVJnbF2pC7aHvYEjeplK5Jqgj7gdtmDIJTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDzQ+PInYzFuuJXT+7aXf9oGcr1rOjAE/kiRGYdDbO1CmG4nhq46NM4dXnaV6il6asRTn8435a0lWDK+1eaBO6EvYp5l1YM/oFIIJbUZoN8NIe0wpP6yrmsguzkXDgxOYsH+EftVmir19ZrGXwHA/Zywg210bCW2mkNqv3ZIhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6ZzACJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2Yc031297
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfdbDDF0iaKbmDjAc10VCP1/rYHdufYQTCEri5cSINM=; b=c6ZzACJ9ntzGn7pd
	F4Yq/lTRlsaCdklIJw6c6npphgDFDfNqymLrq7dGBs2GWKk0poBKof8gjfnWh6TG
	ZsE0QPKZ0JcTsTkKPneiTRnaufKaOqgjMSDmrlNlSnGITiWNe4wIP7Fz/YhXPpC9
	/kGUBHVxBZieZZt4XPU3cAWhHTpGAbmurdmkt7ZKPeQKftuCRjxXhlYcKWZNHOmk
	1OcwLH+UL+0NgnPks1OiMbgRaQYpRTQVBXBrgUshD2uZUmfHnN+4IzbwUdI9xxO0
	fuEFaeuqD2+EadfBcv9f4JXOYIbGjnLB/3E4aqzgtW0sbsAnYNCOxWkwDkzrQ7Fw
	IP+yFw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dh6nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:35:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47173acc49so1701385a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682539; x=1756287339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfdbDDF0iaKbmDjAc10VCP1/rYHdufYQTCEri5cSINM=;
        b=ClTdG27zcKTubHsABZmCTrY/G1C2K0+NYcIzXpnoWmPAYyOj3rO25G8loarE6/aHGq
         rML7k6ZsTeXCOy5w+2DzvDYVFsF0K0mM7RpxoNQvjgDI71XdAJ7xy/gVAea78xYPtLop
         5kPizETttm4Z9n7WV9huGDdY66LGC49+c/9gSfDbFrVIchdnuQwOARRf4PQwVWzWN7L9
         dhjam/JROD5j9QqBzQRaI7Snj8HRGVJZc9N77fEyfMdVh62s10KMRzJqGxuG8k1p88zu
         aealEefXZmwEQP8nqeswbDTvAkk07i89RK00yloi5UekJkshezgwro9NAaaCqM1lJ3Ni
         4yjg==
X-Gm-Message-State: AOJu0YyKYgKqIQPe8rIG+2YmKPtvCuUHuGnzY1M/+UQ/arlXCn8EjnKD
	kpXHLxar4jYXmAm8a3C934uz7UOLrLQeb1bkn/c/4ZXAXdqLkGtzq1Cg8NxWY+qOvtkgD2IrnvK
	TCD654NvOqMyD0tDkjtI/hxrv9FdmOBhNbyTs5oy4WUaWKe+fqAlRC1vNUQZNjm+G38ZX
X-Gm-Gg: ASbGncvzEizNaTonR21zVWLeyCAqIHiKV1EAZWYMPaaDcepEPGqajwPr/swEzQueff3
	j4FjRnj3okp/H/mNscq/mTvHly+F6vSdoPcW7PWL3PlB6uEUFKyGPh5i3qX6INosrh1OR9F7Yxe
	XSzCY8IFvHr9XQIfvAxZ/Y4U+qXxHCKa8+sGKvRNgFltW9UJzmy1zgzOdBUcpTCwEkBr+7TFs/t
	1fb5yV5BAE6aqUt7srsCQyQZw17unznryUxEjstwe6oY4zE8qNz+m2lxIBWAMdtDs2TE1WP133l
	Z5lO+9aOwU2mXm1DtndpXsIxJ8BbxDpvX3qTMiVmEzT08W/SoUXufqDaNy6f11F5UsM1Cjjar7I
	eW6x7Ut+K3+mBykPN9WlPu9Xp9xP3NFsJ5LjHJlpiN5l85NnmP7GKrnMT
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id d9443c01a7336-245f85c8f03mr878765ad.3.1755682539163;
        Wed, 20 Aug 2025 02:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGruFqyjDNjNZap3tlQ1QMYvoarVGmRE48uLqorBf5FfkGpP/sCgL8kWEJHeFetKvlW2BsAQw==
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id d9443c01a7336-245f85c8f03mr878395ad.3.1755682538659;
        Wed, 20 Aug 2025 02:35:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:35:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:43 +0800
Subject: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682519; l=1064;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=TjE7e881JVJnbF2pC7aHvYEjeplK5Jqgj7gdtmDIJTo=;
 b=YwFU8m0AxT0KFGHqI+UMpcgWIIE1IgQqEACZ3mvVMDlXo2yCND45p9Q1LVkk1fS+g3Vf0Oj8h
 owjuMU/XXy9C5rqcHiom1RQmoTnCAwpm4ldZajHq6LLdCFeZzebhABE
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX39nX6Ww5G45p
 diHdXOEQLZ4mdVXEru8xYOKhdQy0bDt4hPvhU9wtT8ytIlg3YCH58Ep9068cQ1zEqGBD3+8mzS0
 wHRdka+bAEqP5U4c7DrbFx8psp+pZK2odok4ITfrQaO7bE0gNIOe0hXfoAAzxLzJsd7mj48Ubnu
 FHiD4rOPC48X/7RpJaOuKO+Rmx5nUVw5oWOPwXbPVshHP3QJ/GlZ5t2BaVrWmTUBwbtJ32QCel1
 C1LlX7dOU2X2Xl+kfT5zP4r+aGh8mzJCRLenzXtZlbg1OuDdywHNZU0uEgIG4iWFAwEsM6Xuvhs
 t2xhhvO1bE/QGFz40nt044Ik64rmPhTG57C2wzFl93z9Fy+YUi225pPN8AvESk+HU42oQeWSynA
 v1SxINi6YBLWXn+cSFSUTU85Az8zLw==
X-Proofpoint-ORIG-GUID: gL4ceraCQZv-8aA9dJzdMsMmk6bML1VW
X-Proofpoint-GUID: gL4ceraCQZv-8aA9dJzdMsMmk6bML1VW
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a596ec cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hz27nZlvLZz7BoqxLNkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add DisplayPort controller for Qualcomm SM6150 SoC.
While SM6150 currently shares the same configuration as SC7180,
its hardware capabilities differ. Explicitly listing it ensures clarity
and avoids potential issues if SC7180 support evolves in the future.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
+          - qcom,sm6150-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
       - items:

-- 
2.34.1


