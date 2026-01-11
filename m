Return-Path: <linux-arm-msm+bounces-88397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D0D0F585
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5AC3301C57A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28234DB76;
	Sun, 11 Jan 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjWO2hTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXQ/uAM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD7634C811
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146580; cv=none; b=quim3PhJMkw5GLxadRhtBQt00Kt6ZLRDUTaoQZo7oljYMzh8BX10A11ZnwTNM/MD6lUWQh36l1PRrEGD/8UWNjZbVtetr5JkRf7Uk8RTppDqZv6lNae9UuglxUu+lEEDsdw3OpN7/YxAzhFtKSfsx9zCwbz6dJYOvzzagVEkuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146580; c=relaxed/simple;
	bh=gRnwoWYVjN7GMrjsuBdpDhiMQwmfcdo/4r/Rw1j08vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muT5wrMYi4HCc+T6QPFHRIrJ1imMhl/Xey/l+4+1SIk2wX/LaaD9lLZ8Tw8FG+nq4Bu26ubHzLNPHKZUcR9z/Z5IBeJBSmveN5hgaE3SrSnONRQ9MWgJWq8px5FXI+e+lESgSM8siGQZ+OG2Otkp+C8B97s3k6e45/kOrNzAs18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjWO2hTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXQ/uAM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B9U1lg2136998
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4KqA588JLPQI0i1Leq0ab3vXKKNpG6AzEKsdY8kU30=; b=IjWO2hTbXJlcYtYq
	xkmsUc7n1pP/5aeJrEa264nHHcXjuEmJYe/0IAY/AqrFRJVdVeCKRhbH35jqyMHF
	YZ0LzOvC8Rp8y1KeSPAH00j+j4ECDduYtNw7SmOVPXn5lE8WWQ9zteT1RwKxi2IZ
	8pUZIInaGCLd9E9Lh6Xf2l778bbujEsWzpjPcA2oiCzYMjAICTEhDPKwCs2dgwOB
	bZFZoBHQy9kUpg3lZeNAc96by0WeEIQ0WZB+BnQZW3jYPhhWDZr1FcaQtTWid4+v
	RqidpTD/wO1EfWb5N4e+2gfFeMyLCEIgVow6jj00Ga1ab0YWvDu+zpgVwaLteGkA
	XBa9BQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks259jas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:49:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b8738fb141so1262831485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146576; x=1768751376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4KqA588JLPQI0i1Leq0ab3vXKKNpG6AzEKsdY8kU30=;
        b=SXQ/uAM6tLzDEXc77+jFJluSLk0Eb8ZG+uRhoflFbb8swV4+++SKPRS3zaRAgrEbg0
         dwGTECIAjwTGhTWw6hsZfR6ihov7drX7HZDQ5nuuEjhtvY3U3SPsbCEKMshnuIuQTdm+
         Ticdp5PARqI+FfiNY7sFeFv01ZYZuKyxfADTsiy+tQt/sPT3MBG4Qv8xbCWs6kR3n9Cy
         /H/rR+2cTlDhluh5CMx4gyaLn+yiE47Ba+BIC9GEpGWO50PP92VkV19BxLf/70VqBZld
         W5/xY2w4GxvKc77lbU9M+BxOc9GBO7VN8hhq0JmQG2YxHDJrZ06nh9MnmTyuLLvTBjCs
         H1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146576; x=1768751376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4KqA588JLPQI0i1Leq0ab3vXKKNpG6AzEKsdY8kU30=;
        b=m/nHcS8cN+4CjKD+n79IGgQY0+GLWQIsC3j/WUC5LdVmG92NxVplYQAHSsC/rUC6lP
         d1HJV5YkRUniJ0Kzm04YfhZX3PmoOleJpr0yRx22Fv4WfSvmk7KTQa91wvHuNdWSAV4D
         YOt5XlFF2oVeRly1hfWGp17LurrWcOfslK2X1UhX+x3FZo4Mod5/wFttUoJglFx2Nni2
         WFP6XErCRhz/Nk2Dcq1NS9vk1LV4bWMzy4rP/CywrOhbqoHHjeN0xshKF4pE3wxUPdRS
         5CVQ5Q/Y9vCE/GIpzEQIZfohpVJRO3nd+JuHLXIrvsqtyKjPBgScdJgQV41AO7wqyJfl
         Kd1w==
X-Forwarded-Encrypted: i=1; AJvYcCUAlqnHlJ1nCTiizq2PTSHOCogCTPdNbHQkg4XE2jfwkAW+jzrw6eXG2uzGnlkveL4XLzcDztv3haeThgI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+K4owvRhRtynJqdUIdJxFFxxjtWgQkvWlnwAhIs/MBg0bTPD
	4iUhIkkJUkFx/1Nw6akAYZPxSJrHpNoi+XAkkVzYdIUb9WSUAWyeyUXt5RM9nHEukbNYYPOedhc
	lLfwrh9IX6A1Gg5xNeoDKTEw00aKEJBrJJ7+zn3q3xi9gaejGvIN1QEmecHuC2j1Wx3Xt
X-Gm-Gg: AY/fxX6AU1n15HsIFt7BYQoNHIOHAoiuwF2tNI4WXEtMUdCEiztnsS2kXRmyl+1Imrc
	fsE7jTY8C6BXNKUq8uhtp4N+KXSFh0oZ/haXvJYXJ/uC2qup8jy+0gqflCFihRbSys5qDpBHvCz
	omQ12YBEEntfSFijeyYQmUpbOTXoN6543zNz+2nH1/+5a/QXsHiZpbrum/KwTk/xV15FawxqJkw
	EIxDuU/CcVzKktLGVVIBfOSja57/Zqx4Yb+/Qfpz5A/1DMi0w5kmDZPIvvZAMTJdLsV5jJ8BciL
	6r+tYe2xJc1HTyCVmyQ1xBPq8eN3loGJTGuL6Xk5KiHzG9HeErRocK/9pwgnz7R9G8OQvXVryId
	ZuFjIdErwqCZ6jjlZP2cf56hStNe/qUISzQ==
X-Received: by 2002:a05:620a:45a6:b0:8b2:3484:8e22 with SMTP id af79cd13be357-8c37f41b6ffmr2480622285a.0.1768146576212;
        Sun, 11 Jan 2026 07:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEWa0trsJvJBzxBLzNlhEFOczqLzE658VeGhg3pzzMzdTmL5qM/ocFgl9bywFefmIVvZXmoQ==
X-Received: by 2002:a05:620a:45a6:b0:8b2:3484:8e22 with SMTP id af79cd13be357-8c37f41b6ffmr2480620485a.0.1768146575802;
        Sun, 11 Jan 2026 07:49:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1637163166b.57.2026.01.11.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:49:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:49:08 +0100
Subject: [PATCH RESEND v3 11/11] dt-bindings: bluetooth: qcom,wcn7850-bt:
 Deprecate old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-dt-bindings-qcom-bluetooth-v3-11-95e286de1da1@oss.qualcomm.com>
References: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
In-Reply-To: <20260111-dt-bindings-qcom-bluetooth-v3-0-95e286de1da1@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRnwoWYVjN7GMrjsuBdpDhiMQwmfcdo/4r/Rw1j08vQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8Z8yyt49hmlZgBjJ1n+mMPK3BQevxhxyMGO4
 WJeS6jFk4iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPGfAAKCRDBN2bmhouD
 10LvD/9EoIogO3hR+yarHZ+NEKKnYGOjy8NuyyTeKYjVKhHyWGB4QaBbpG+LV4b3Jt5z5D/CpiW
 B9FUh+p6yspGKZFL38f4FyI9dYbTKY6uWzxPODOYZtJVzLZZKLM4LkBlMC5v8CJc57EUhJxejIH
 tSb11X9KswXkEBA4xxOGo1qlaZEqDT/vugaMOPKJqC2QiK+LS0hBNVlciLcP2TX/2wfjr3Mn4XG
 xNZh71cFWjwlFkLLvp+/Qddu9IieD2VIgfe2tcK0/tcB4zSyyIa7mxrIHGPxuNKMCfh/8tEpSRa
 dpK1y1O4MuH09fXkCM3XX6ZGvmOo9L09xEqHfG+yQ8LfKQiokFOHSOnuxlqaEQK2IX+U4ruEmQr
 ve8o/iVdRVExU4OSBUF/gHoaanVQyrgvazpNlZkBXunNW5y8YTCsblNVEIK2J/GLIoQWYgg0o28
 u8gJJueplBIFBq7YMXccMFCFWWGAhUwnGeFNvZTRrPrjmQZFONkgz6WZgWoQdJtlIVXivxGwENv
 TQmJiPMPoDdB8HDgYLRgPfTpBr3VEztlR1jJ5Qld5m1K/Yf4QTFm33NI5yxT4nwdmuu+A4Njv7k
 QoygbGU1Urs0MSmvJNsHk8Hyn4xSrBZ7AB6hMWMA29bVvz8N2t6ShehQK5UTBg/7uRMu8Y5uKh0
 +C0LKhWV6FCGH5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX3QdqvAFd+ef6
 O5LDW0eoy1ycH6VisX7Al4sAREANxaRFeNcTnYyaY0dAeHVRR6UU06hEjezXhcl8nerR/1cAMaZ
 NbiGwxtaiX36scAiqlQ0EATS2o5zF+bpw21YElutNn0mrn7LxHG0ik7FV01PEIXuIZHlvfiEmJm
 2GXWZ3PwBCE/KdBNaH3495Hf8yyiQSGsHhchkv2jSP7Rmmeke/9SmqkD9i3eE4AHLUhA8PYTrVa
 6ct1rhJX/qOFvYe9TK4tkoW7CWCv5Mgv6XODTwwi7ba0+uWWgLjEllck+BW20hYZhhsc7ot2DfY
 rlwYFC+zFiZCC+D3Qh+UigsE8yjGybQX1A1mqt+cAg/hdxorYONPwOdGiiKAKUnRc7k7HwG1jLX
 Bo61sOVAgNxFdqFfjxm5Xm2rWC+u7cqFKS6j4/+TpvcZSd4d12f+RIo1B4De8iXcPCfSVq3M92e
 br7C+rwAx7asOyK4IeA==
X-Proofpoint-GUID: ERGu3TGxXtLHiBOqoXMci-IlAnxwzMV6
X-Proofpoint-ORIG-GUID: ERGu3TGxXtLHiBOqoXMci-IlAnxwzMV6
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6963c691 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Yne-JONsqnic5O4-CUAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

Commit bd3f305886ad ("dt-bindings: bluetooth: qualcomm: describe the
inputs from PMU for wcn7850") changed the binding to new description
with a Power Management Unit (PMU), thus certain power-controller
properties are considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
index bd628e48b4e1..8108ef83e99b 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
@@ -18,20 +18,24 @@ properties:
 
   enable-gpios:
     maxItems: 1
+    deprecated: true
 
   swctrl-gpios:
     maxItems: 1
     description: gpio specifier is used to find status
                  of clock supply to SoC
+    deprecated: true
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
   vdddig-supply:
     description: VDD_DIG supply regulator handle
+    deprecated: true
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
@@ -44,6 +48,7 @@ properties:
 
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
+    deprecated: true
 
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle

-- 
2.51.0


