Return-Path: <linux-arm-msm+bounces-71963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02529B43246
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 08:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B864016904A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 06:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2ABB26A0D0;
	Thu,  4 Sep 2025 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtvT/uA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9E4264F9C
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966999; cv=none; b=DU6Y2/D3RtIdIMjZ++vuZzFBaT+MWahtfmp4ufXCKw2s0tOnoov//Twi+hBm3kgRqRCdStYNTNaSwW5PL6anzjTNbfvearcywlKun/mEesEFXRxi/Tvgqk8MuAjzUi1jA953d+AIA2pmABvEVFbYo276GwtMXlU5eAR614FJHIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966999; c=relaxed/simple;
	bh=BUBeTRGlxh5yBy8bsZ3XJSCTZrfRT717lc+uZnjTECA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3xTwFGDIeI6VQPZRTgo+mhKEkYCQLt+0tH25xSFDJu1NA+GNilhqsPjD+WP1yltvg+FR2S0T5ChSSw9QAyZnxUhaz37uohbIlGwak9wLLqEZjGr4JeCEaHsNg9YBOw77wh/Qzn1zj7nCqFpujojp8sFJtc0/iLH1aoE6FvyVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtvT/uA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58414h7u019972
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 06:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AO6iEgJ9nzZiIvfqCr2K7LOo1og6DI9YbUhKFKaY78w=; b=JtvT/uA8DoEYSotf
	/pVsvx1qD3LRNVjl4DN4EtvdqBki9s6xbDdkW83BOIQ6pfSDdC9AvXkpmv6Xo6VK
	KLTkKs0xCG83feZBroDpGE9Hqvw7edP5LCUqumriR5S8lDaqa/3v8ScAKKZodfRT
	Y6ps2TvqOUOBLU5Z5um6boue9DuvKCm+pSUciZQ8lz7txq6qSv9n8Nq6elzlSY16
	SUXPJb0VgmzlxwU5YsBdrA29ymDeQKfGne37i0IAaa8ZgmAFUhSB2Cv9tTamws4k
	YhlctVx1JHzPvYJd3y/klITQXqTZiMzDKrzs5yjYuq4jLUTn22YsUVs5gLaPzs77
	3xb3Zw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk968j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 06:23:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e395107e2so717508b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 23:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756966996; x=1757571796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AO6iEgJ9nzZiIvfqCr2K7LOo1og6DI9YbUhKFKaY78w=;
        b=ZqKnVYjXVa/jJtrfs9v5/VuixHiVvSkri5zm6fJFCGqvZpCPZ9Gz/2Ce9WHI4dxBdP
         pSglZRiBgKNTZNeR9qceg0d3KnWtoKuxjWDM0o/eCzcF6U5h1y+/Hs7arGv+rczjUiHj
         Zpp29HAdGDIFlFvSIHSRtFcwk+lgkKSYdRKZkU0tTsU+gdiDSWZ/gf4viPuo6aA+4LDQ
         FHqAiuF4mjuyXEmFZGj82q/d/t9GfaxTt/UhYa4ulnmMgGBxiBlPei2e0hh2DZEn7IJR
         1VpHipa6IVwKxmG40GP5Iq1Zhs+ckvowQ1Pg9Y2dgmoy0VIJL0Y/4wa5FVXGeX5i/1fU
         4jXA==
X-Gm-Message-State: AOJu0Yz+F8oswlF1Pn7mqJs0aLyu6bblZe9zljA7JT6aUZWuVSdxmQWw
	PW/0LOy/oS402ziXcJX31KuFc+iLtOa2e64bdpNGcdnTMmdfmhGi5RUUCNGH0Nv8ZKaKECRKgCL
	XBINsybq+w+cZJ9I173RZQhxVu5rEau4AnkSzh/SPhEoh04s3+Tdeli46pmsWlSF6SRw1
X-Gm-Gg: ASbGncvU1eO+/Vzkw7gtp2msmzYJf/8SdYc3hur07KAoVOwJtXpQv4Dgm01OtyAZbuE
	h/8tPV5GYZV27AmWdwGU6+c2NCkVrEoHPlsjZ8oeiSZaMJkcyYpAqOeM9YsKfp1+NJsfUYQS79C
	dmvJ0X6AK92Rm7C3SsnarrUhXyHy7szWWbj5UVYO4QzzIv/f1kmZpkRZ8cx9HQ7fBA9XKoXfxRR
	alZb7dSIAiwujqL0S3PxOys70e/6McOam8WXcJTZ2jnAROWvHplJBYcijVd6H/I1hi38X7WPP7c
	6242HwUjlFPCcfpibfjwCA57wnztAHhoqKiejAGhIYmDsgbX5A6eYhG4LuCEh9Fv2y7msTNG0GL
	kv9K4AMluqzDOTZ8=
X-Received: by 2002:a05:6a00:4fd2:b0:772:641:cfb8 with SMTP id d2e1a72fcca58-7723e0d366emr17986400b3a.0.1756966996562;
        Wed, 03 Sep 2025 23:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvXohAA/unSga9vVXl1kTHuDcfUmEtv9aPvZ2haTs0//u+0U/pKB3T8NlkE0osq1/WTnYyFg==
X-Received: by 2002:a05:6a00:4fd2:b0:772:641:cfb8 with SMTP id d2e1a72fcca58-7723e0d366emr17986362b3a.0.1756966996051;
        Wed, 03 Sep 2025 23:23:16 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723427c127sm17120911b3a.62.2025.09.03.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 23:23:15 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 23:22:02 -0700
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the Glymur QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-glymur_pcie5-v4-1-c187c2d9d3bd@oss.qualcomm.com>
References: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
In-Reply-To: <20250903-glymur_pcie5-v4-0-c187c2d9d3bd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756966993; l=1645;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=DwIAlVG79vEnNxiE7JeLaRZgKTUUwjCwHpMa5vhARMs=;
 b=TxaO/eppeOEGOzYPQ07gElbix33P8l5Tcwej82955emjawk8w3ibEnTEgBuN1Yl74dqCxNpw8
 zb9tA/evQYFD29dcc+y1prxYzZzr83HFgxZ+8QPjidrS/k+bZNi83tW
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-GUID: adFeJVPBlSOt3BF3BGpljDvknh5KRXn2
X-Proofpoint-ORIG-GUID: adFeJVPBlSOt3BF3BGpljDvknh5KRXn2
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b93055 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=prgL3jgsdPShhDvlN2UA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX0GhqreLWdmUn
 qH368uH58z3vSdbelIer7V4YzHzJZoP1IlqeFO9ecCXIsibarhzLUsfG6z2BDCmdqbrUv1xks+G
 rzk1aER8feM+zvu2Uit2nsSkUb6YOa48iqLjiG2J+odSnLMGQw6YZlclr3uA8TKFp0L4m9wTDdD
 hX4+fTReeaHYK/PCIjTf7Rm7sLkTU4eRbDYclTaWYTyQAWpaWppstJkRXHD4FruRdxwn10++NIt
 We1rgYz007hhdoHU8Ww3wQxyA/eoVgHByvbrgffVGjY/NY5VUjJoW5pkCm10mwpeMFyXe4GhaqZ
 BMJpmBRvpLTS81212QRy+ovhReR0/IKNW3Gnn4PKzhzZq2CDf/J9AO1oRMi036/uZybuI2dqQy7
 gjl34pzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

The fifth PCIe instance on Glymur has a Gen5 4-lane PHY. Document it as a
separate compatible.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index cb706cf8219d015cc21c1c7ea1cae49b4bf0319f..1527616902ebeab975c9c79d75cb1eada64ae55a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-gen5x4-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -178,6 +179,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
               - qcom,sc8280xp-qmp-gen3x2-pcie-phy
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
@@ -213,6 +215,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy

-- 
2.34.1


