Return-Path: <linux-arm-msm+bounces-67618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F2B199E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 03:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D333B529F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 01:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4F01FAC37;
	Mon,  4 Aug 2025 01:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVhKXJD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F841F4CAE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754271470; cv=none; b=TlsfYcgdUllJE5hMcHTFzNTsf4VsghPE9bFnEpI35ShzHYr7JwZG2nJ4GYGEv0I4yNW2OZtICh652qDtZCBZ9/c8jIIYnF1NO2KA4OqC36Txh/6rTWxBBauU7AsVAfcs4jhB0pPIzH5tnD4hR95sYKqeFasUlKn0fbommqXHiqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754271470; c=relaxed/simple;
	bh=Qi8gRAEJ34INypIr24ID0chs71JhYSBH+rUZfs438Us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkY3q+sUlltCqTXnGqjAM7ztyMpHLKweXSD6sG/f7D3ufCYiyusnbfVdoNcoRtgsExKEYJk8Bg9RnFZmGFY/4w8oiq+G/MaPQKhXbSrRPH1vFM8qUBLuU3ddxkQXVQS4V3q16lJpZ6NdmuPssWQVu4BWy0t/lehNKLMoRpLpqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVhKXJD9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573MpLjB014583
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 01:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9IjdeEMglbRc7avHUFqyJ1eHhJH4uvP7KKrPsQ6vyg=; b=GVhKXJD9J3XWUDdn
	vJzzltKbtIbs2dDFkC8LmWEJbWcMpVCJCPZudgOTOE684IAwN+ro8RQWBWpSmGTw
	Yz5OAJVMQe+YuxPYCo7ybB0z0+bTU4g4g5j+MPf/fZ9vf5RRrxcBGF89Y50t699O
	aj8RE0/yvxpdxea2I4M9r3gH/DHh/BVePwiXioh/2c4lw1ay1yfPBX6eBdrT6ZqP
	CkP1XUheT3wTGyqyE4b10jRJuCGppZB6S+9OfB9orWmLqQJ7Ajk3/qH4agt3MBLz
	4JXAnOU/dlhfyM+OpucdG0QKKhBAOsCHlSi2oeCv5p6hlWlzo681XnI3G303RcHH
	L4HIeA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc31td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 01:37:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-75ab147e0f7so3839003b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 18:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754271467; x=1754876267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9IjdeEMglbRc7avHUFqyJ1eHhJH4uvP7KKrPsQ6vyg=;
        b=otvG2eFGSlPtow91HkLqbSpJrYrCMEdTLA7MtCZGEzUtVB3WrPzpwphffJ/7UoC+D/
         5pN2yW5AbAQrGr10nRdbl8ojkVKUH1/1LKnKCY0pYouVbGLAM3+QoQhFsKCAJUSGZaRX
         OiV6zRm2YkEkOTLuuz3KblwpiWC42VjX9CzTYrAWp2Jb2Cjko5+Il8XgCiTf8EFS1yvl
         38lEQxgQn2KaHl+89pHu0OtwFNwkX4wdIH/qR/WnAyJtRYdzDew20mJCZSfG6OgibM+Q
         KnL7d+WcvfnQtv+XoOJV9iQdE3NnRwDl7UTsF3fY3TBcB3PStieBrbszwf70ffm1gmxX
         bj0A==
X-Forwarded-Encrypted: i=1; AJvYcCWa1kBLN1KLzWczvij2WPT4oaPVMQDYecMcnLPq3mcvnyD7qKi0QftO86mzETALYleIJOtgKTy+yH4GTd9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwsI56Q2U5ilOMAUylL5VgGOtoWnAVceauZH/F93SH9fLbHmCWv
	TrAwM2CpCsOdtw3//OhvMf56v2V66JEZxymDE+1uy2gOuYBBFfjMu6TBGkSMJDNq9qEBV9zKcbl
	HdoSgWXCM5A8ZqZTF4PV88iXc6hiOIu6F855eTAzHUbgpseHGlgQ/YWXo62MKz93h0g9x
X-Gm-Gg: ASbGncuLuO4BcWW9rLogwOeN75UFgn/d7yoMiWSFcAobW0irfKFN9t0cs/eJdlGm6Cr
	tNNEptATETm96HQUvolmxc6viOyP2SlNtpsa3jWIls26iMqBx2CeTuL1ar6z7kJ4bD2g4iX9gtL
	5bCNEN27USmHT5i+czgVgUCOwjViW4D/YfCYpKfA8b81y1m/YtR7i86C9gufgH6n1Tr5edvJqOY
	gljl4VaW6fL0Vdl33dVY2ihny45ZaIu7UeKrh/Zab76eeqlF0M8J7kUgAchLf4Q8dFvcXS8yG9D
	I1EyxSdZzpfCl+dyvX3ULAZQy8mOOC0zGkbi7f8L8uiwr8PcgekNo26rH7pctSyd9zuhVHgXvjj
	1CbZIxhFLLEnmzBuT7wzCqrhkLa9tVR4vpQ==
X-Received: by 2002:a05:6a00:391d:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-76bec352e73mr8215362b3a.10.1754271466921;
        Sun, 03 Aug 2025 18:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUBGG3OwuVHYe0mR/+3ZFomsgrUGYYPu7wDXwsRlzBw10/sl0aEr6cPZX7fxWINSD16zY4ZA==
X-Received: by 2002:a05:6a00:391d:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-76bec352e73mr8215343b3a.10.1754271466526;
        Sun, 03 Aug 2025 18:37:46 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm9208626b3a.102.2025.08.03.18.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 18:37:46 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 09:37:04 +0800
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-hamoa_initial-v4-1-19edbb28677b@oss.qualcomm.com>
References: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
In-Reply-To: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754271458; l=1233;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=Qi8gRAEJ34INypIr24ID0chs71JhYSBH+rUZfs438Us=;
 b=YyQA18jWAI5zkIi+fksL8lbXlcam2uVc7NEdatXPYVG0tORktyGT8R4cOcw+3HmQDhhXWscPM
 xQ2WWtw/kVpCjwonhVUuJb6NaLdzdrs5QEUywso1C82tfndyXpPp6pj
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: YmgX30vGJ-oHW3He8qpmRSTggJOHsUoY
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68900eeb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YmgX30vGJ-oHW3He8qpmRSTggJOHsUoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAwNyBTYWx0ZWRfX5bIrf1pIDdka
 FQHcmAlUnv0sLXmDdvb2nqmY6YuMKK2lgMnvj6Kxb2bsJmYnjp8mhDAweTtEARLrgFmulKDsZT1
 4VCzSWS+Dmdkf0NxEGdAuwBxJCW2KNLMoJdlZ4y1MJa9M/BTFJznSwlAHChAkyIeA4dgcXXak4n
 2uQTs8jMkov7/0o2mM608PEJHUUBYdpHRzme30136uaAv0ggwtNvIpEVCpCdIdRU8x+BMs63yDS
 3V/Bz9v2XwMqyyQHpRSu3J0VGpuh2JUAqvlW467B01x7PZpwvGwyUW32zJDLW/TNfoTsBxHOz1p
 6LiKuHEG/w6l4oPcIuHB7MZC6Rj+Vmj3akBOp4wldXMneqrF75iluXWjuMa+3GwL6AxHzaf/kOH
 4N9Yev00E/0VWRSwK9+GFLz0LBM/1YKivvoYJzRUYtj5OQoP+iB4hM+hJy/YdK4WfgZWkaM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_07,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=960 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040007

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47a7b1cb3cac1150bcde8c2e2e23f2db256ab082..65003e16fe72dd4eec9423030fed6078b4a79959 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1165,6 +1165,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


