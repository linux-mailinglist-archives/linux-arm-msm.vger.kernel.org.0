Return-Path: <linux-arm-msm+bounces-55593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A25A9C456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133521BC1592
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A7923BD04;
	Fri, 25 Apr 2025 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7bkyZ8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5D0238C3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574721; cv=none; b=DkIycwBqxNySMLxp1cd0x5Q1NGsZZGa9wx/tCLY+4Q7PO4v3uMr2ddk1GauoH5QM3OiV3gzX8P1/E9JeFzYaLqR4hJ/3A/PjassBiHvwHjIDV40ZAGcRIrObGlgH18wiJhCfVrOp5vXXv7DrQYEQ9yAt2bs3dB5I4gUMfC0PFW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574721; c=relaxed/simple;
	bh=3617TkUnK6e9mSwxxO1mMh/x9UNNusI2dsALzPbb5Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7RX7mn1CMVvMfDV8t+fi+Kq44kI57EpyuBnoY69J+5m6qYuuqXfWyMBFWLpUQT7pMwzlfBDr3+Dad/KD3B09DKKNBNdPCjV0dsug8Kp6DLtFfe28OfYgzq4/1wN2LXNM5U6cUIQ/DzkzHct5Xw2WrKE9jnIu8WGRHfEa9zpWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7bkyZ8G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TBHL007414
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGL1av9CKAAAXCna1rw1gPi15ZH6XiWkTlMH9dyZseg=; b=o7bkyZ8GSObqQSQh
	3tPfJiXXzR4nNoMzfJxuJsOLTRtul0ZTMILUWelxWgcrV31+tYXHAwPH7LZFiXgc
	h0fwS+81SqSjiTb5NBc0+XkzQ9hYax8vyfnmOHWHbp7FB+b9W0hXpXXCCeoeAe57
	l0u28LzhKPutCF72xk4rTEWUc+kY6o/4OXOnI8UzzbHrnu3848yV2ZoJtLjS/Zvm
	zSJ1wWkX80Fo0bNv/xy2di1zGNe5kLnNLcUQLa9ncFKoXJgTXEDH3+oFRSVD7z0K
	Fj1v+yJs9BVSHWRNXDrYvFJ5w32FWpur20zDcDXVmP3OdB+cpOIMOuBqbhZ5NOCM
	zdx0Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0res7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:51:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so343325785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574717; x=1746179517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGL1av9CKAAAXCna1rw1gPi15ZH6XiWkTlMH9dyZseg=;
        b=YKcTn9vSHowTbxR++E/S6+/0zNCJRUiDxYK19900X3w2a6vGZMp8pl8gZvA3pUCXsb
         o+78HeNdZvWuw2R4ip17F2wuLIqspQRhnkQl2Q9v2VFBqQZBVJFEMEyuXwZY61kneBDS
         u5TR7SbQPh4VEKrfW0wcFQwLQFG+kiowQpih0dMBa3uB++t7r9Vj/dD+LzPOM3OE+BD/
         GC32HTeeBPON8DddPGSMyNpJp1lPulByxn86rtDBZXVh5TpzVTb7lk0w7Q3kcLX8cyXI
         JQYZh68JNJGpC7sTIDu5qe3HAQteyDf1LI5AUndTDl4MpmCNai5WsPD/9yrYEty0ux0x
         +FfQ==
X-Gm-Message-State: AOJu0YyLg5844UCtpDWUH2Ugzv3sNasen3NYB8hopviJmvTA+q1twjjc
	ZSQ/bE8DpdLovd8e59mVp0QtraHS24UVDdw6pd/78T5o/iwyKlgjBW7oHKRa+q9JSL54VpnGDuH
	BKhPrgVx+dxFmFCAnrnEKpK6g2YADI6Fy/fFSLMfwBQfFnOjpUtD3xEewBQPZK9Rw
X-Gm-Gg: ASbGncs4zgMZCnQ5NLbq39IT5njH6+ys07fG1CmDSRvkY8PQSKs7Ywy72ktpeExf6xW
	NdkUtPNfMeaW0YPwrqQ7RLsg3enOzC03I/sAg5xXWeW6S5DQ/rqB3zoAqwKfv8fPOOxONoVGXjC
	k5clGhvyvuVI2ixrp/Vp4FnGc2LjhR2r/Ix5hWOd5dW4Am0MNsEUBzfNN239JvoqaUcIuqTo4QB
	iq2Oi8eMp6WHkyZXdzZCY1vw6QvpI218Vdp/FuYHFzDAdPKxNT+C00BCZLmfvwYc/IuhozSa0T1
	yEh9s4xoQPzATUaBNuE98Cd8ZkMFhKNLc4kGLDOqlMEKXBOzHUk2lenkQQCin9gW+QmnIsTbbL/
	NvcER4zhl+nX+Th3KicpSFo/U
X-Received: by 2002:a05:620a:1b89:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7c960718fc7mr297361985a.30.1745574717639;
        Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1K1UfbQvYJ/2ntuq2gxMNlOns2PWPFkI+8B4IXD4Piapymb4QRyfV5nubnNlzDop1tGHtKg==
X-Received: by 2002:a05:620a:1b89:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7c960718fc7mr297359185a.30.1745574717192;
        Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:51 +0300
Subject: [PATCH v4 1/7] dt-bindings: display: msm: mdp4: add LCDC clock and
 PLL source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-1-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nAUeCQaacPy4eDcat81zyQ4FPPYgERyNRUqIhBqqdZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5vnKr+pjxAmRELwP3wO3coSSw4Fwr5Bgan
 5WBhmwLHDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1Q1IB/41yuLT8WBukhCIEw4AaTeuj59DAP+dWh0vz9m1X2dqGBV0YSaqkaY9lqWqJLOQw3qA6D9
 pJXpJ0Hy1H08gNLagSGomLL8ytcz7pK7yUS/hNq6XPbcH6ihYsXgCXOeCfCUTEKLBE0qJrrHCn0
 l0Qak+gEmDNOl98mXcb3p7nGyIOUmOX9u7LnnhgDtUwWYwVgs0lW1sSGyAB7/OGBJ+1fM6M6WV5
 MbsNDg3BOJf4Rf1bn6JiyibAFxU5QDGBtkSlZzev1OKNn/6ftFNCGRpGChPMYCSVbPT7lPjq89U
 m/iEJQWCzd+lx639KNn/vAN+J4R9Nfw76nOaQPt72EzzAmuL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: sC9pUo4BH46DjPI0oKAgmPm2rV2R5o9c
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b5b3e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JZA2oeZeEnBWUIejbVIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sC9pUo4BH46DjPI0oKAgmPm2rV2R5o9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX4HRT8iFA3kSS HRXm7nSndfFs2BWmZRFehVDRHD+Zk88wZFZkypgAwWCtyTbAOFeCK4FsMa8Pt0F2YZ3gpBhsUrF x3Pdm5/yEusP9MkOF/sAt935iF1RmfDHniWfHqNxCI/q5GPYXHRKAw8HjgCYMrkSaRQ95Wmhkd8
 9ceYL5/TYw+Ywou+EGxt5lKg4cWjqq3lZeP8tsGJlx94ZJ7OR/ilDIJABu0AhuElN/a7l2me7DY RTYFle9mb1CePUYWbEEKjGiUsSESiIb7XndtjvJ+ZN5kEuYFS+pGGvefukoHcpNBtClnK551WgG WYDIY6gOsQFjpxAlHzHZaaLdf9WmOo9QfySZ9kZyKyxq4nPruSCOFykC9AFgpsYlRmFk8h7zs47
 Z6fG9TwKDkJqqvr+kuXhX50FMPfMiyjTIz+AfsFHDCA8YIlOdFvG1pv8ZnmyZEZyjsh32lZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
PLL to MDP4 controller bindings. The controller also provides LVDS PHY
PLL, so add optional #clock-cells to the device.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index 35204a2875795e2c1f7582c8fab227f8a9107ed9..03ee09faa335f332259b64a42eefa3ec199b8e03 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -18,9 +18,10 @@ properties:
 
   clocks:
     minItems: 6
-    maxItems: 6
+    maxItems: 8
 
   clock-names:
+    minItems: 6
     items:
       - const: core_clk
       - const: iface_clk
@@ -28,6 +29,12 @@ properties:
       - const: lut_clk
       - const: hdmi_clk
       - const: tv_clk
+      - const: lcdc_clk
+      - const: pxo
+        description: XO used to drive the internal LVDS PLL
+
+  '#clock-cells':
+    const: 0
 
   reg:
     maxItems: 1

-- 
2.39.5


