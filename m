Return-Path: <linux-arm-msm+bounces-72649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDCB49A30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9EE169DBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5022BE7BB;
	Mon,  8 Sep 2025 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBiwS4b+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44C2C0F69
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360423; cv=none; b=qp3thsRcW1m9vza39iha20iIlxrhfRdlfRV/eXthgc8lAHeFxjIJ4OWnwaGoVSunGg5HIbQKIAwz7MKIsTWj2a2xsEBba3pjTFhEvgVhPOKQiR1tr42KymxcitGzFRebGvgI49qCaTi6KiGmhtelnzZO5V54nM08HPsNpt/HxWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360423; c=relaxed/simple;
	bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlTAuCEBn9Kq1Y8PWQqXqv6VpDlBrxsOuiD/zG6v8DtwCVdc0UekVMOXzvgOPW7jxxzWGp2hlr5jL4tCLe3RyKtaYsuDy8Ui/eIS2r0M/KftsS3HW2vhYZfYLoLRh7K5WpTRe2SiIDdluZ+B49hPO/UwbES/xTEDEZz8MLA5TR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBiwS4b+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GbJKZ017315
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=; b=VBiwS4b+OjjF3Nlw
	y3LEwxbipBHTmcLyVfGQ/94uFZNV6tFzJ750TXRnlYjODWL9JFYi4IeII0bXeieR
	o79zy419jWcW8QkkLG+cmJy88bZH8mxFfrfgxetSrgKO/byBFiiTGdToXcps/V6Z
	4xiouAYv4SH1ry16tDceBmyw3fjUWx29j53gT8Sr8uDWr2lC+EdT0CNIIQedD27m
	Bh+7pmrGb4MeCHWSsLKg2NKS8KFpdWjzT2BN3xlaHeNasanJ4wBVYMVYI0z0eI4N
	6ubakKTAOkPGzZ3f9MTGnMk7Gdz0eZMRS+y0iqKW4JcFPOZ2AUJor32vUAg8ZxLi
	cDSJyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kwncx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:40:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b522c35db5fso1315112a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360420; x=1757965220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=;
        b=uUf5laolWpEn2EHnBVCT7rjzMn/lXWp10acSwm8Jmkb/p8bTspHNjDcZ4HALDQ4JSr
         ZLrDtg2tMr3rR1IcRz+6PaWFa3XTjE7nl4iRc8Ne2V859o0OEQyZG/JInqDnaZN5vnOK
         mtKVdwJ681C5JQGim8SU5K92DzBc02lFMmJKQogmjJOYo/06VPsJFe7O/+tCtFQd2e10
         cd8SjJtX87wcWhpYDVpAvN/XOXp5pZGH5MfR+YsCNO+3KMQfp7jkXDexfMR3wqsp2S+u
         UqnsXSSY78vkEwe7rv1SWZqDCbusVuYWNFJbdrN9jPpcRybGL61eT1Tam2GSGUKkjZYP
         GLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQqY5HjDTl2EJvSa36KxHbRvOwCyjZiOAcOpixo6RVY2iRuhnWmsr28CTarYy2Thu8FxMwVHQ7cobqMxeg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mhgzIALQp6LONECSEKboJOJ0ae5VX5P9LumQkEFZjjMlT+eN
	KESkJ43VJKp7TeXo8KHwTJN90NQpT3cK+QSXBoW6z7+7RjjOzeSgXNM81GL8gu+4WcXH1mgIJb3
	CPttmXAqVY0Msw2HFpQEJhFZsMGXpAz6UX+VMFBXICnMjJSTEJUKJyzwNZJMGnqEaINLD
X-Gm-Gg: ASbGncvmm6Hv34OUdFOciNHZU6wwjnY+yC0wLIZMPwA61XO+0tfWfs/qWpfLyY+Ae5S
	UHaeJqbolahTL6JiU7q8Ssv3pWgLxO8XxS6ms2PxZP5RvzUlsDWrEJIJGta0YSB9eFnDIQ/bQDf
	088mjG6F1TSaJJMKfB2nkUFR0BgwzOMLSJBXq8DWfbB8vWRaErXHGYeYywNumh+46tKpXipqxEj
	IDN7J20wOBsETPWRuchJlVu2AL0uVE4iYf6kp0PiXvOuk32d+gLKDZyrBRaCUtyLH8SAEmxOL0D
	vg8M1FCNEl0c3yTnY/j+vcMRlz83I08/Q4tOhHUnKHLnMAUvNUQvbhmNV2Om0vri
X-Received: by 2002:a17:903:19c6:b0:24c:e3d0:c802 with SMTP id d9443c01a7336-2516c896521mr130751965ad.1.1757360420224;
        Mon, 08 Sep 2025 12:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxhiT37B/NGt3Wi8a3WEea6fQ9S7xmvSLYGxYBSHf3TlZTrNT5DS5LYTWCDynBV7L4xpYphw==
X-Received: by 2002:a17:903:19c6:b0:24c:e3d0:c802 with SMTP id d9443c01a7336-2516c896521mr130751545ad.1.1757360419698;
        Mon, 08 Sep 2025 12:40:19 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:40:19 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:37 +0530
Subject: [PATCH v5 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-2-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
 b=xzIai9+odqedIq/xKI96mip3L8PPgW/pEWse8XkWfmWni4Is3GRw6oqtePWGYVP0l1+g1CF0E
 ps5n16/F07fANl8SeSNNXsQ8HXmzVnQOiLSHTCIAfl9g3OChd1VhyDw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXyEwsKhv9+c0O
 oKXZvgc4iKTYcphRj3sE8a4ZO9HKXpm0FZf3hl3JMnUsXLIh8O+6bakjWcoXIKmBcFG2MB+2UIf
 jexnwL1vcBudeeCVCUxMNIyu0GNCrsoUFmDP2lTfRB7lHiQYUlztG+cg5A6K8YMbb/iT+UnBesG
 aqjT6JAw/yGbm4ZMJpu8Q4vhz4KmriLHPDGFudTUVtPnfJ1LHZHg0B3rSyGlTs1BxkMZF9qQQPd
 GB1SrI9qsdAXYK7LpYjpE8xlyC4aNUN5kfmnPzEYA/7nfclxSk/qiwxEWXr8MP2DC8aWzGRTxsp
 mCtVjhNcK8pI679i9w1+oOyPmZZQkCF23DV4+Afyf55JKMti50PV7thX0t1f17uSlexXsw/XbuF
 1r26LZc/
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bf3125 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cU9g-aH8EvBFUcFSzOqd084xKkAgSvrA
X-Proofpoint-ORIG-GUID: cU9g-aH8EvBFUcFSzOqd084xKkAgSvrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.50.1


