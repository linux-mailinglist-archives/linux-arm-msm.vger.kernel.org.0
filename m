Return-Path: <linux-arm-msm+bounces-73641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B174AB58F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665C7522506
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A672E613B;
	Tue, 16 Sep 2025 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvlePUOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE62DFA21
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758007920; cv=none; b=sjsOYO/mgjtFMYvgvh9mMnfD6lK6GCConDol1bX5geisq8ZmGiaKQY2XAsm08DgsP1QI242xcMHg0WcpXJrs+sKhFqecqAxyKNiS4wWWQ1uf+gHdSUnTQwHkovFNUML0i/PrFLi9IOs7R52AG+QsYQY53E/4xLVp7yNw7ojP1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758007920; c=relaxed/simple;
	bh=s8BWyyAJ63Dlk1aTjEk5L9PFu4I14q5H4nUlYBpxpL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gWBzUXNOjSmjDeXYOITWQCMWRyQNk89vFkojjNXBatIaSPPkQzI3lue4ioigQNKKSulnP+8oUFcMRD51C8es5QoiyIjuQ74P2pbpL1cv+O+h14Z7AZAszTg7deaaa5f6xn3gRGLZ8HeZg6x25NAR1GhCtebINvFWIQFy7eZeQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvlePUOA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3q3Is013126
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8CH1PNlJYICaq+xN+m08UU
	ZdW+oKMYDW8S3+NyltR0k=; b=BvlePUOASAWQFxxxwArPgrHIsLPQOk/9m4RglB
	syZOuWTGymdsSVo2xicjNmHKIfvKPst2uMROL4Zx+tOCGv6D7eDOXAchX0zWCe+H
	Qc+RW//UzkHYZuPOyVn/kfJad8Zc2e6HgDuW9Zc0YlMS+CQZ6fXhwYA1XG2XFpPb
	tcXyfMwZzYHksRPYBvPk4kXNf86P5nWIWHX4GYFu+JMk+UB6wtBCtbr+SBZms/se
	oONl5YSMEC7lW/UXn1yL14x6F3Fz3zI5962xBuUqRVxr9WLFOFeBkMdTqAyc20Vq
	N3AS/x6muc86+e9uhfZ4ZwzePQMY1bVQs2ggEPaFk7btS8lg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072qvq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:31:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54b301d623so916006a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 00:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758007915; x=1758612715;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CH1PNlJYICaq+xN+m08UUZdW+oKMYDW8S3+NyltR0k=;
        b=nbSJCm1IArwoAd5VKyalKs25Q2iqsNNB7x1T37IgvWuGJtmbfGaqYueq3WZqpQS/yo
         PNG4a7WethibJWnFyTTZja0r18lSe77MHUN3smyp9qLlbx05obI4Z6J4ZqAit5tcPZRt
         vQMK4oArWpN5aCF0UCQPBVwG9AwJPfx0OD3a0nEYUw+Z3gTftJH4NupsFSOD/MJaxgcF
         qLLr/T8lctNTCclSvH2a6PZHW5Nu4fdjH4uZKYkXsQ1oJUcEI+H1sCuLGGZgWybPd3sy
         F5zdBdkU61y5Lb6NiFjhKJZZIE64UF5I8K8UXPWvAvLtttncvLB28Zb0R6iqVsl9vZfP
         4tCA==
X-Gm-Message-State: AOJu0YwQGhixwDGvsceHfQBXI7vNWstSvTLhvQP7lAFeqL2lhjLC9fG1
	N5pwB4ydmTLsivv1pG3HVrqhwTVyq4PgZYmaEcUeKsO9F72uRIc1e1M7bLwdHsn3eGX1rdyHf7x
	n+9qyqi2eF4w+RC04+VYzTsCJEZlq3AjIXxctSxg9gb2i6Nkipq4HJJecK3EtLGWiiycV
X-Gm-Gg: ASbGncv7yfO5j4LvcIeZNRojdjf4t/WrNAITYSV4upD/Yy2f/vsdW1FxJWLlL1oTa2m
	ycUz8aGt+x9BvyjkssHH8MAbsA72rnlI7zPv92k+1gRKN3ZFIWmcyL+qI+eSmeXbG53nT0c6rVB
	b1qouZFg13D7UA2TtCVm4hpa4NeKpAMRhYSFAzK1fM+6K93deDqiJLa+2Q+cCqflcGNvuTDnntX
	+5uEDgrEww97tQRZAgVQ0lsNag3A26144jhhssa81jbHhGysgIf3BrhYT5+1X0OkkQxmmXfbrxQ
	3lFpHAlE5OpRiDuksU++7aDWcNxHHXU0uzAedHtiUkBhbhXMpQCmjq/WDNNVjSBgESWNTtDrzlr
	akqeFOqm06akADQ==
X-Received: by 2002:a05:6a20:6a10:b0:249:ba7b:e350 with SMTP id adf61e73a8af0-2602a49db95mr10679942637.1.1758007915319;
        Tue, 16 Sep 2025 00:31:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOuY/+fNjx7hpbqu6n+05NZZcieklyq8hxAQX1LsQN7umar5jYiFVl460R7yZnKdRwQ7hEuA==
X-Received: by 2002:a05:6a20:6a10:b0:249:ba7b:e350 with SMTP id adf61e73a8af0-2602a49db95mr10679911637.1.1758007914773;
        Tue, 16 Sep 2025 00:31:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ded1ac2fdsm12995589a91.27.2025.09.16.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:31:54 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 15:31:35 +0800
Subject: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFcSyWgC/42Nyw6CMBREf4V07SVttTxc+R+GRWmLNAFuvQWiI
 fy7lcS9m8mcWczZWHTkXWTXbGPkVh89TgnkKWOm19PDgbeJmeRS8VoUoK0FG8DgNBMOgyOISwh
 IM3SY+lgIxUFJpY10tjJVwdJVINf516G5N4l7H2ek92FdxXf9CeR/glUABy7b86Ut21LU9oYx5
 s9FDwbHMU/Bmn3fP/mBkwjfAAAA
X-Change-ID: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758007908; l=1877;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=s8BWyyAJ63Dlk1aTjEk5L9PFu4I14q5H4nUlYBpxpL8=;
 b=vTalDIO4NPgb/9aizwP/CTx/sKmRglc5T80Q8X0k/OzwPWggEd9F5UCFxlYbD/A8iGXuwbfLg
 NpPKQPOfeyVDbyvvuTAYxdaa+lqtOqUegXaF5tE9Gf/4aDaHTANLiey
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX2nm7uBbZp2NH
 M0jb4P7R+ETK8m8Ko9Wnrw9LCaIEe/jIiuAkxPsFcRBHJ5/EeHM+SCS2o4di8Bb/tYZx4VhJhvn
 XIpEjNWyq1RgMj0h7ZUm/z2Ljn4tz6kBgrzuJGzNhBJvLkV9RX6596N0Zduyb1J5Da48T4r+kmA
 +OKuam6EXy1G1uTRqOGKZ9C1OqGgwAIK6hA4y4I3Ib8EzND/h73KgvhAj7lEg3n97k/YSzWZw/d
 ihqNMj3fwauum1JWe0yk3huzJIMFGB+k0ZQoh2pd2h+2AYdVtbKSqWVsMdLEGuX2Q8eyhNZqAGF
 KP8EqwojXaTUIk4tHbrTM7y3amF/WXMTeI0cHNJnyA6nMmEViQHBfKjzauuKIlBxRZTaQ5GNI9u
 0c+WejAX
X-Proofpoint-GUID: Iva64xxsfoETS_5k5nTtPoK5C_IANS41
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c9126c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tYuJd5ZQnYzUV30UbPoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Iva64xxsfoETS_5k5nTtPoK5C_IANS41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

Add DisplayPort controller binding for Qualcomm SM6150 SoC.
'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
for consistency with existing bindings and to ensure correct matching and
future clarity.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
This series splits the SM6150 dp-controller definition from the
'[v3] Add DisplayPort support for QCS615 platform' series and rebases
'dt-bindings: msm/dp: Add support for 4 pixel streams'.

The devicetree modification for DisplayPort on SM6150 will be provided
in a future patch.
---
Changes in v2:
- Update commit message and binding with fallback configuration. [Dmitry]
- Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
- Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm6150-dp
               - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>


