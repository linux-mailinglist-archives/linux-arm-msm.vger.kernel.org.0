Return-Path: <linux-arm-msm+bounces-65559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B4B097EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 01:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35554A12E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 23:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF42274FE3;
	Thu, 17 Jul 2025 23:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9wsBCea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FD242D7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752794937; cv=none; b=EYJytQQfPzmacyK+I0MXv+GvzWVEoZv8ZI5szl+AB/hy8uPWI6FgA+8zRCE1XGI8BOp0sZPkqDBuKFreV0wdfMEyGj5insZH3KdFeTKFXH9mad9uC9GIphSXcPNeTBmKHUPwWqkcfUN4z3lPQ7hPH0Nwoa+KazplkvKcTNFfSlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752794937; c=relaxed/simple;
	bh=udsEqVV7LdT+uN+5FwPOiwEpbQETrk12bfALCusLhWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQfzpwVeLDu2ZAPy+g6tjbYdlrhmuTVKDcZm35Izl6JfVX+jnHl1Db510ZyBCLQKRAWBEzsi/LAMkU2z9T5YSEtAerF9V3ZQuqIKenEGFbYVVIu24VpS6QToFv/mvXIsMJSilm30esb1L2yhBFht4zTG3e8qOrD+2OW8W8jVsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9wsBCea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HN31h0028124
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ybo7EjvadG+e2xPAFSbem9WLo3NezVcN9Dxj9pnt8I=; b=C9wsBCea/5SUZ+We
	gMDDAN/IrVHf8MOMSvjccfInrfRQbC1WLA+fpoWpySPF4RC+2ogHOupUU/BtVq02
	D8ABSbJfX2344KRXK/syqvq2tjOgYUIXTdRPQ+8lQOn2q8jRRlniW5OULkD5whBO
	T3xe29sFysQEgVdAYrXTMetJzZayJhgav8IGj458mZJ6wQMyBKRdrWa6PKlarhQE
	LnbAtLNa17JRN/dxlt0Tf3rGie2W2n73HsOfUd9Uemw0lhPusSkB+pmGMF+YeGmS
	xOIl5WVlGaieKbm9co4ErR/Ty7ld4b6vbDLOZc8+I5P39UCwnT6H87svQsqAhZo9
	JzNncA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh61q0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:28:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23dc7d3e708so9982915ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752794933; x=1753399733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ybo7EjvadG+e2xPAFSbem9WLo3NezVcN9Dxj9pnt8I=;
        b=qsfHMFAaZC3sXkzt7iiTAWVDApTXH4/nkLzYLw6JL5DKB8bykrVmpUM179gogp7bYZ
         1g/KYbQ0SV3TeDPhHa2VJAVkEqvuyxivuVYWZO7OU+08UQODWMS5ZGkHUj17PGN20FUe
         yFiwHjyQyW2w+5YksDLBQWALe5ZwkQMhGasHK3gZGsm/p4FMRg4I4O1PoASdyQsgOgj7
         DHPce4P33v5w/1eFVgyCQjCOTrzdfkBojdZQHTbOyF+/6UlA9on6RTVwro1Yh+EXrQBd
         uGTaE4yZyU09ypI3XVsVIHQ/u53rbFAYN7GyYtmnZQDCBlVRKlxmr1VwmU3a5/p8tQU8
         FWpg==
X-Forwarded-Encrypted: i=1; AJvYcCXicT6Qss1U+dP9tpVcCAZE0SxzBm0uslFAUSLH8VX3F61do4PW9TufIGyd7ct7gPz3ShiKdknDuggqskoR@vger.kernel.org
X-Gm-Message-State: AOJu0YwhN9uyi1mpFnVmXqlmiZHdo9GDQndWXSFewbNOPw+nig93hGD4
	ebvnAesrnvN7u5zS/NS0xl8MSWr7ikaFmAqeZw/c04EOZGskEmiUCBwjHeTYUvln02Ospy+lnxJ
	3+q4Js3U8qT7Gl+x2fz0rsL+CLbVNaXJJy96p8RPwI91XN45VWVrWZqKORld4PmQ75uQF
X-Gm-Gg: ASbGncuI2a9/kCyaI2m+TEVsadyRGh+R+gjQt1lMh4CmEqxvTAxJ4ilVvzKfsKwvmjI
	UCfnm/KUxEZfkdWDI8iiM7WXK/A36JrqFAAJkhb9EE8/WxE3YqxcllnMQdh8JYg9NyjfJycNcz0
	jRA7oBbYqcFE3TSFprpqJQkPJnwCKo9du70X9ZUkRbsF+MBQld6WC+w3tgttgEVQMqveVdS/zcJ
	Bk3kZlZathUUO9lYMvdpjonY4LFe8sJvk7Rga7IkpdL3QkVvC57y34Gl8MgN6bBWM0Ch8MwHFiw
	mmLNR74i36KFE5qQWKqspJi7To6CRDuKUa4wgm8dW3sgVfiSx2F0P8QnNNWy9tCBOiK4hhyVMsy
	fb/B13pnCUMyhN+gwdIjFOyIq
X-Received: by 2002:a17:902:c947:b0:23e:1aba:410e with SMTP id d9443c01a7336-23e25684a2dmr131959385ad.2.1752794932590;
        Thu, 17 Jul 2025 16:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOFsGsD60KTJbjRpb7CmKQ6G/KVM9LZO/JS8BWAYceDSZWFciCkRmX/JdxbdEmCVpfQnmDVw==
X-Received: by 2002:a17:902:c947:b0:23e:1aba:410e with SMTP id d9443c01a7336-23e25684a2dmr131958845ad.2.1752794932095;
        Thu, 17 Jul 2025 16:28:52 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 16:28:51 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:43 -0700
Subject: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=2566;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=9wdF66K4CeeQceORgBagEdldT12aDYJZI4HWG2A/5Zo=;
 b=JXB49Mx5GPk/Liru+c42GTK0DPlFLUxRjo+Hug76DtT7FgEsdc5XCT7b67DDFF0rkAtfN5RR0
 4BxCu7l3FRlA71wmUkiYi/DBhDEFVlhPdfUpaixEMBP/IBxggCMbO/M
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68798735 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=cmjLwvqn_fhjV4Buc7kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: SrDVQlpaWWLiaQTKpIcf-K3_K562Jau0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX02c60w3bHPar
 5i60E4QhpNTMgyf3DlrhBf5Rdb5b3gNlDzbLKENuvhAFNA7NhRc8+81dErOqnqgR81yJwyPbr08
 qxwMyHY7VsJ88VQJGHmZljSvrLOMBXAnkf+FkfVE+fG6johX02JCiHy1ktjrzBg6jzCAizgZlEg
 75wKJqPgaeMj7WW6NtEWL+9LP6HBNohZ2Q0ma3XTkIqB38YRxQtyXugFVW4Js5CC3b72yu3SSRo
 n5oOFOYQqMsRXZABxG7neh6l6TW/wUCGjWNorW5p2dvuuOL0J4lkMU+z+6AINKkcYPEoJpBg/9L
 LWY00MKUOgq5J1xo/hXcyGnk/8ZnXq/rlyNUoA46hfctwY4IU2cBpuaZoRLUUOLtpUUoV7L9ALF
 1G4g5rNuJVdonqS1Uf7rYtGzgHeYVwDpLpT0httKXEjTmtlhhsEuIA5wNp9/8lNRqBpp24x+
X-Proofpoint-ORIG-GUID: SrDVQlpaWWLiaQTKpIcf-K3_K562Jau0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=732 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add x1e80100 to the dp-controller bindings, fix the
displayport-controller reg bindings, and drop
assigned-clock-parents/assigned-clocks

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323b..4676aa8db2f4 100644
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
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e47333..0e699de684c8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;
@@ -189,11 +189,6 @@ examples:
                     "ctrl_link_iface",
                     "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
-
             operating-points-v2 = <&mdss_dp0_opp_table>;
 
             power-domains = <&rpmhpd RPMHPD_MMCX>;

-- 
2.50.1


