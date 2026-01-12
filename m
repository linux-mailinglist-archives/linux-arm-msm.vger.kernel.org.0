Return-Path: <linux-arm-msm+bounces-88475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E78FCD111E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A1C0308B61A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5376233CE86;
	Mon, 12 Jan 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwnbxhZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0Wv9jG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9E33064F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205567; cv=none; b=t9mqqlgqGhHWK3lpn+nywKokiZMXoXVrFXWzSdN7dc+wBNR9Pck5M05MCwKVjoUQpkMU0q+Keqajg+H3iCzlKSV49PBYy+dJ8i/QtvZpJm3ic7/hPR1LSZJjDJ+X499OijDNm8cm0/IfUQvgxoT04t8EraXhZX2391Nc5lUdxJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205567; c=relaxed/simple;
	bh=0vK+QqIlVWfxb3zAfD6BbTvvB5V7M2eafy089fVa5I4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mU0wI9fopkYH8T9WI14Smo2K454hefQisOgz2TLTxIjsDJzxYf/OMLe1vxWt5LrUHnGX5TN1fG2/vJwJX7rpyua3DdMEBDkabDuCBONO11nx9xhtrfdHirDBBkPDZADppDqFauqllke8InDZNfENUFgI18AWn5J+fo6PAolFglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwnbxhZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0Wv9jG1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C82Khm3130406
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ts7gmQogGUrk8U8b1Qf8dm
	xzXu5HSt7TiDCeDL5JsJo=; b=fwnbxhZWyU0rF8UJUwDArHW2LuLc7QKvatLW4N
	VxU63J7NvHlkfiM4u0zIdxssiVo43Zh0Ocr10BN6S+5vBJzDFCPcCQ0n7cIB9GVz
	wDqQoXMi3eabm3xRSg4z+A7M5se9QVjvptz4EMpWMQ/xf3KFwB0yz6pWqbCevOWU
	3muEnZ0yBJroEVndPrPg63pgbHco6/B3eG8tnTcDCom4pqUVPlAI18yWMuRIgdhs
	wHE2ks8f6klIimdtdRxAagKuMXPMkbhqez6BZcOi08yZ8sTXwnL2q+NfmbiKuSfg
	YxAP3AZfWoNphO4S6iHbcMldJbaj5GZ9dGslcDuiipgiGe3Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmkk41bvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:12:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45a8d04b1f3so1501570b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205564; x=1768810364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts7gmQogGUrk8U8b1Qf8dmxzXu5HSt7TiDCeDL5JsJo=;
        b=j0Wv9jG1m2MYbgDJYHnZruFLqIKISA2d01CaHqWlTmvGW7Hg0GGq4ypoENB9gIDByA
         ZJrt3PiEV8dZb3RNhlprzmOUGTLiLHV6bfisK3UpqBLWUw6KCSVYCCOSfiZM+hs5vNH2
         rj5/5Su2kvXzPcSe8t5XzANoEAzYIHE2StXhvPn1xTawdjTBy8Ykp1mdroCYqLRUggld
         9hxd7Ln6QZAOjBm23fHzTBd5v9m7UfNtfoR8JGJZZAYaS4kp4IN0QZ9XkE7MDjpeRX/t
         tyczNXbMWYYQi6H2dwL8hn4swzjV0hWOdW6VwyZrECTOdfARVtFfC9eWl0No4xyiWIUK
         HuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205564; x=1768810364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts7gmQogGUrk8U8b1Qf8dmxzXu5HSt7TiDCeDL5JsJo=;
        b=HkHRIlEijUP6VXIfP6h8lb1F4ztQbLJwaPp44s9aOzNmSPZmNgA18R6gUbj3LR+TL3
         ohc+F9fL0KgQjobB62/JKV14LFyOnNejLVeMNIB+cJA4kLbQsYRjh4ltqCPcxV3WSHPA
         0GJVumvCx3Rqx5dcJju9LtOxMR5OeT0lheGHc2K+siahlF0ldPdmSkB2UiBH8m+DpP0k
         9rB5hrr0Lgg4ry7DTQR0zCYz+nFqc1PmlJtZTh1PrFkSTKt3np//oUoOhdtNwTtV35RG
         qWw5dE52oAS93K3jJdnsvfgABWWL1BQSUdo9b35ykyrO4jd4md2VjQMFQhpa/cdlCVvk
         +d2g==
X-Forwarded-Encrypted: i=1; AJvYcCXDFF+Y3Aih2o91nRcucBAYYOF6XqS4nFyPtE1pX6FzycruxyZ6R+UaEUSQaO8ATwSE5CqK4E/zu7Yrh6EQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfn7bYDzGo8yLmyyG4SU/DJ7PoUY1IBAM1VWkzsR0C3e1nSkO
	woA9kbaIbrDvtUyFI8CXBsZyIhFTa2OsPFSeXQFdAJFJ5yg7B8dPYKWONUKNPgbuJ2Rkkg6uLId
	js6EAEbvyYhgFu3ROFxf0zV3FjvNwlZ0ddZ2OnN94onQgrC1lbVoZgHIxlD6D/Hbgo8JL
X-Gm-Gg: AY/fxX7aDjfGvPgL1WGRExBpygtm7B0ykaSVdpLRN1+g1LOMKXLzp9KKXmM0X0DgMqI
	pvoe4HSjIwKL8AxyMSJ5b2twrA6KoMi6PQiUHdN3p5/wAreaAVp0wL0MtNjaNhG5JUpLXyKKRLL
	tlG0exs341gOH0fYv2qhq6Ymt5YunrgwhY/T3poZkid/YcJMbtVhF+uTSejGU00yNOIXqUqa1xJ
	+Gzu3atHyU9GQ2K8FYx3BY3shjTKxMMAhsLLFE8BDn5hGmQ1dqqoP2D5yokNZmr1Yj4C8AuZE+e
	Nn+77/4j7WOIfFJva+/YQffXjzw8NaVcW/yIjSPnZ27y/j8xYGWFzOAMn74o1GcvNVLzTZl+W61
	5mA3tlfNCgyZenK7QzI4QZZFUT1gItHKflaEjVEt/wntRDVCivGCn24fydPp4cJu9urDBRPeJve
	bs
X-Received: by 2002:a05:622a:8cf:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4ffb4a6add9mr229142451cf.57.1768205114464;
        Mon, 12 Jan 2026 00:05:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEafqlp5VNzDcf7IlNLwy/ydARsSaAA4k9ott1JNlaQCyMzM/jdlh/u5d4J1HMH+DlYQpJ0eg==
X-Received: by 2002:a05:622a:8cf:b0:4ec:ee04:8831 with SMTP id d75a77b69052e-4ffb4a6add9mr229142231cf.57.1768205113901;
        Mon, 12 Jan 2026 00:05:13 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm123116201cf.6.2026.01.12.00.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:05:13 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: qcom: camss: Add sm6150 camss support
Date: Mon, 12 Jan 2026 16:04:51 +0800
Message-Id: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOrZGkC/2WPy27DIBBFf8ViXayBAHa96n9UWfAYEqRgJ4ztp
 Iry78XOqupmpDvSnHvmyQhLQmJD82QF10RpGmtQHw3zZzuekKdQM5MgtZBScspGaODeZiIunTL
 Rhr5XwbN6ci0Y02PHfR9rPieap/Kz09fDtt1ABgSYv6D1wIEHEbRXAaQD9zURtbfFXvyUc1sHO
 77eBQVvS9Wc3y0sI5HdNYdmlxRCQS+N+myVVMAFv+OYcTy1l7T8p1ams4R8W6R5aKISneti9A5
 jFzrjoH5nQIs+aggWATvUGGzVef0C+wihPz0BAAA=
X-Change-ID: 20251222-sm6150-camss-2b46fad884dc
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768205107; l=2829;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=0vK+QqIlVWfxb3zAfD6BbTvvB5V7M2eafy089fVa5I4=;
 b=+tQJC00B9WAz2EN8k02v94WzFgDQA/LntPGE8BBQdenzQWdLZ3WWQH8sVtM/6vJdLgJ0UoTaz
 ZlUpphz1nkUBztCuml5lxChJckLkhHXdkI8iaWgS5q1FVID7wr0eI5q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Oz833u1dutW7tjtTVajrIQ6fy-PSUyh6
X-Proofpoint-ORIG-GUID: Oz833u1dutW7tjtTVajrIQ6fy-PSUyh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfXx5bvlUOEZaj8
 TGAc/XoHlT8Lx9HwpeaMshF9Pfa3YCQ91nc8QE5QYB5wEOpD4sSz6IKOPhu4TQmp/tQIBoJ1fD+
 TlgRWXmrOpc9PkN/dyeJhMsPrn+3E8KlFNFsz6vZn/8yuTxon2oQwEk3exw0EYkoFdn+/oPmmDL
 gCc1PQqleLHJWvZPjGAXjb8OjrVnVs+v+vOneTAEQrXR4/JxnWBqmrJUCB6EOn97gYzxRAZ0Hdr
 Ocfi2ViHF9uo+i4aYxQk6BhLBbsBANn1BCJLrJGxcSI37obkMvlxNOa4RH+GHxhUQ4US1jwmcYl
 o5ja6ESdhpEoCO/d5nH5nJkhv4PyUAO0GJqSLXAOSOXx9YcExMSgYzvSBGDAlvSwAj7DdeLumuK
 CenivEThia17vXC0kecYrEHF4O1t9oPaqWn9LQgWRhQxhQlFet7jA06qsCBSrW78iW69vr7/H9/
 0q+amKHdUoA3sFJP+Ow==
X-Authority-Analysis: v=2.4 cv=cs2WUl4i c=1 sm=1 tr=0 ts=6964acfc cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b5PrnZgeE6CfPZZ6BtAA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

The SM6150 platform provides:
 - 2 x VFE (version 170), each with 3 RDI
 - 1 x VFE Lite (version 170), each with 4 RDI
 - 2 x CSID (version 170)
 - 1 x CSID Lite (version 170)
 - 3 x CSIPHY (version 2.0.0)
 - 1 x BPS (Bayer Processing Segment)
 - 1 x ICP (Imaging Control Processor)
 - 1 x IPE (Image Postprocessing Engine)
 - 1 x JPEG Encoder/Decoder
 - 1 x LRME (Low Resolution Motion Estimation)

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/

Changes in v4:
- Rebase based on the csiphy regulator change and add regulator load support for SM6150.
- Link to v3:
  https://lore.kernel.org/r/20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com

Changes in v3:
- Change the ICC node names to hf_0 and hf_1. - Krzysztof,Dmitry
- Link to v2:
  https://lore.kernel.org/all/20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com/

Changes in v2:
- Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
- Correct the order of the header files. - bob
- Add Csiphy id num, improve the resource name. - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: talos: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 200 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 198 ++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 842 insertions(+)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251222-sm6150-camss-2b46fad884dc
prerequisite-message-id: 20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com
prerequisite-patch-id: affdca1f0af770b95444f99c203d291bcc41ec9c

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


