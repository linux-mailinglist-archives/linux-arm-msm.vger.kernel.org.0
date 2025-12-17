Return-Path: <linux-arm-msm+bounces-85572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C82CC8D71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB21130FB1A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED45335CB93;
	Wed, 17 Dec 2025 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqB55hmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWhd5hCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876C34DB4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989311; cv=none; b=cuzQJ+eUGTRbob/C45/r13ysekUIVt74TuLHAaNW/EbVDcRaGkWRe27qUq4It0L2ljuIFVeYjxNMOYEXIhVtFbD5ISTCpe6yhZiXZxdPwDoi6qZ0JNM+dnh1yvrue8YGXerzFKnQd3i+kksTrxm6l8Ggef4qYt4biJH/Y6rengU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989311; c=relaxed/simple;
	bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=upj5CJiyEGlfrD9YtkIcMwb6AKe7Km24H3N8SzlkY67kAynmpEcEQ4DCOkaVcaUFhUfuHojypEO24Olm79kBCFAtk0eNsbm4wp9xLU3FwLoGyzCK6dejU8kmtc23QUkNVJCm/XTZqsM/YmXmojJt3ReapyMD+oNNoRvqNSKQC7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqB55hmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWhd5hCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKtSi2764466
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=; b=gqB55hmbAYs5+DIz
	ICGBpSpOvVuvHpxaSZzb/b06z9O72t6LsjWxax0qDJLbb2/EUDqlnf16tsJb68Hf
	y8ir8xl0nf2niqkc3diMwIRzoeJHeitB1fdKN00hPw0WHVRqSf5iYuwTYRyDvI14
	kJdTJp8QCSGAPc4d4SuMPDycEqBb7rzTsBo5edx6Xuqc9i6TVY2Cy8dOMsA0Sqru
	zky0l4gegd7WOZrIBL3mkFONsktFoN8E4QbuyF9TtYLL4m8BFrw6xCi+tUQn5+TM
	U4C40h4MLc48Z2PagV8IMkZ8GNnSbrSVi6RLRFxgiuc1idC5RZA2j/dkbsOO2iYW
	OCSOpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefk6y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a089575ab3so59011685ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989308; x=1766594108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=jWhd5hCD1TPhfqC6NnpdVNW0PAW6LQqmCDrABYGyxxu6ypd4w2JHJoSDakSlsWhFUq
         64oWW2MiH/OxR9nEmbK4KS932JI5/coJE0Wwq3xcg5COQdWCYf85BzYKPBXx69mT+/NK
         Iht8exylzzKZmtmNX8vt5ngX3d/jPfatyjZI9xGJNKyJJTEm3Q4DALoC/7Wim4ENJIHT
         gN0TJmQ+gs7v2SSkiJaRtfubjFcakpxK/Z5o3B1r1RykhUSnCqAGY4HPo+wmJp2GC0fx
         xMMDOisoinrg4EQ3Wmk+jw4svjgPmYUJHLySXTTeJbXTANIFNGmBEXN2+HivSYoDzkBB
         OrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989308; x=1766594108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAPzsylvQAf0leJxcPm7SZsbOhaaSA1OJ2ImRJF3POY=;
        b=U67ze4MjpWQeF/wUwoA6aTLPNUJ8LzbTgJWXaSLhqlw0Th08NmEEaQ6t8HofJKN2GJ
         y717v4BHp9JvEwsJ87NDxM/J4gztgK74IM8Hq5E0EhVp7wxal7M1akIv/gY6aT5WXAcv
         vXfzCBgxaf4J9EIFgRIpz7dFYRSxC3u5Eqj0vosxC33Aw/Wl0xgpnBgkBXRlhf+S/ZEQ
         vXqceDQqx497Txjo1sZlv/oQuYtpiutQy0uGj6LghxLEUFfWzJ1qmItTqhRR1YejiWSt
         2pR3hZKbwlma1bM4KNt6bpj9u4W/ltJ5EQPl7hqXgCKSIX+WKURTYJySDKn1TR6w4/dP
         3R1g==
X-Gm-Message-State: AOJu0YyN0Ruxd+mA2/DI99U1F0dwpuFE7BYoibROnT6d8xmtM8NdmQMm
	uOO7BWWFh/6NZ6NsqpXJ3IcjJC6defhloV1SBRHSDxhlMvXu67mYx/aGYPuXKz+Nh7u43cgcGTF
	R6JIc1eVPBHE8l91yeQIvCdfBQYD4s8HTAJnZp3T9j7kktsOoSV2AaHl6MRDswzWt7na8
X-Gm-Gg: AY/fxX7bgw5xyYoo9Oz5ISdSZh7jHZ79AxLQzmmTVmEE88GjGbh2UIiwtQ5HC8pML1s
	DXtO60rGSEboj4ThsZ6J4hGmTR8V6mg94H/41ufdv0XnSYUFBwepvOkbNDFVW9HoI6NdrTPRRWs
	2i5m3zqNRVTHNI3s3MGd7+g8EHPD2N0Av5cdbNYy+ZQqrOzeOgIPLZopW/Srqozw3NQmeYQyEyZ
	+A0MI8qblJ55OkaKuJOOJ6MKT0W2pBmOUZSK0nD9Z4cSh7JG77Rt05HEOSl5aVxG/UM4MfkRPaP
	nI8l3a11EPIkcDleXYmUf5MzW8SSiMryJzmynT/tb89c8Xsd+sYHiM7j+RQN8wqJQp1BcYK9YeX
	oLHyIIkIt4yNrFdsFnXsNjehPG6AtvPoXAV/1
X-Received: by 2002:a17:903:40c5:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a09fc8b009mr133318495ad.40.1765989308195;
        Wed, 17 Dec 2025 08:35:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFZjMR3LK/rVvOPFe4PMiFfY0LCdsriHF9Dve2JHTFXJJn+pLlf/et8QtwVDemMNI/yUJxKw==
X-Received: by 2002:a17:903:40c5:b0:2a0:9fc8:a98b with SMTP id d9443c01a7336-2a09fc8b009mr133318045ad.40.1765989307577;
        Wed, 17 Dec 2025 08:35:07 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:07 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:37 +0530
Subject: [PATCH v9 01/14] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-1-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=1346;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=fkI0IV5pKXD+Z8pE0/I4omqNa0GvsOuaX0Z626kXB7M=;
 b=Vo+xHZl6vaYm1DqkxHAcltW+hqiy/OHXdM3AVnRMWNOA0Uxl4zwKclZ+sZPq3Ww/LZmruxDE/
 g+Ei7rwGNgdBEcDSbdgyU8S1gZ0oflkU/gfWRRBk+UVJ3w1vYN3x3YD
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX6Q8ItzyT/aeh
 zVAQPUAnvvYQP6zkPNe3PhWzosuMf2TxarQMBQ5qwocIdcbPWi5bxFhZw3sdbTuPNJBroaJpIoK
 BWhHdlgLhAW4KdHwY/rOUB3aqQSJZ2/gmvDrILD6WcYxqzXty5RCD23s+KD2Oyu8LTkog0QhD2e
 1d3CQB1Nsn4x96IAwpY73nO3gcfI+i/QN3dxg2StFuHQ/ta8Z9McCjcCkerSRHkjMN7bHQgm7ax
 +PJu1XASZpoGNI1AYXkkRA1S17wybKNArzkZQoWjc3ftOKsBUYQsVJuIPdl6A5a6ISDRE+o4qEL
 yB2p+Ls6det2XcHe3FfxN3x6w2O6OusQ+k93o4mGGeLjwGRJAx7eIlPxdcedIk31Xl1PpPHAT5D
 C1kOTtGA2lXdmte/mnj1c/P0D4E/NA==
X-Proofpoint-ORIG-GUID: ju5EGzBgiwudaPKnJzP3TAeXiGgJnfvb
X-Proofpoint-GUID: ju5EGzBgiwudaPKnJzP3TAeXiGgJnfvb
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942dbbd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nDsJnkO8JLPJ0mjf3QIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170131

On most Qualcomm platforms, the Qualcomm Hypervisor Execution
Environment (QHEE) is either used as a standalone hypervisor or
co-exists as a module with the Gunyah hypervisor. When QHEE is
present, it configures firmware streams for remote processors.
If QHEE is not available, the operating system must perform
these configurations instead and for that remote processor
firmware stream should be presented to the operating system.
To support this, add the iommus property as an optional property
for PAS-supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..68c17bf18987 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


