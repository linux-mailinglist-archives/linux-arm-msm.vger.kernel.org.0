Return-Path: <linux-arm-msm+bounces-82845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48121C7923F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B42514E8369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7901DE2A5;
	Fri, 21 Nov 2025 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nH9OkKtT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUsePGmo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A9341AC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763730420; cv=none; b=TcU8kTi2bmyWj+GvmLq1sY0jk154BeQJOmKlMjRfi7Attobf+Nr9xWS8xRNJxsfZNXJ20m5lbFm1LkNpXYIHSOhhAQYX7KGdJoLtnoXFipE+692LNW5lKpcP2PXNysPHkTON8c1q0axBjf7O3dr3Glf4e4fvImEqK1lu3B6tXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763730420; c=relaxed/simple;
	bh=KL7GSGOJDUNSqUzBjyoBSU+RWJ4/0BrKMOwl04Zy3rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EDwMcoeWm3I7Ppr94Bwxc/IvJ4CBYNq9AimMmqhpFiyKDFeDwAx+VEKJqKikWR8hGESrW09EWWw3eHukcgyfavzxc8C12tdUP10WA+pCwG2+whmzBARrD36UEzGTRKA2HApZVhNvYxpLKLsPtBqtIqto2SxJBsBDfNHG+nIUG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nH9OkKtT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUsePGmo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALCTBWK2757289
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AeVyRb8Kb/zwGDfK1t+VZa
	+nW/fkJpPVbfbEyo9z6ds=; b=nH9OkKtTtbWXq2sZxMHkPrK9C0uWG5ETW35sgu
	cNKEYfgDOfZY0uj6iAd3PLPsTajF+w0npx06RIh9yPVhABIXDXix7at1CK7GklNu
	xOhrodF7DxtoyRDTM+8L+SBJcVFtgEJcberSkVqyFCNTW9leVNWK9YK6YS7U2UHX
	XhOqyaIEJOK8cPo7erIpyWrqnmuXlZ65i6AngBR0IrXkW0XGi1OpAjpLUTvCQWFF
	D7LrYl/MCOJpio4i9khVRbroNY1gHzrKK3XoMahieO04AtV02uP5yDGe4DBF5SqC
	EyW747Lm2QFcKmzOeHk4oBhZqPZzaP+H4gGEStmKSotgk6Dw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy61fyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:06:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b80de683efso3730459b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 05:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763730417; x=1764335217; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AeVyRb8Kb/zwGDfK1t+VZa+nW/fkJpPVbfbEyo9z6ds=;
        b=LUsePGmo2AxNMcaUWHBKkFTAm69EiZgqIZSpqaYsFF/bbIiYg9wPsEkCRif1UuIGqY
         wSNPW/CYolZTEO1hO1bJTAqUSnEbwtdYbJTf6AkET4O5h9CQJ4dFHCcDtKUoZdaQNTWh
         E/iB3WttV4FZE2R5IwZrZHIg93Ajr04wgAKILhnrzZD+kkQy7j8ADXihSOyurN2yXG4t
         pyjwzRwBrIAGKfYSGB4Gsz1bSMIL9c7O5JctCW5VepAiqaUhmegyffBByg/Ckb1HdSWP
         70Bx8bz/UexNYuP+L9jdpTWR4y13SojDdqpflwjkUJTA1UkteJaG9KGsmCQ9btn6GeDE
         8loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763730417; x=1764335217;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeVyRb8Kb/zwGDfK1t+VZa+nW/fkJpPVbfbEyo9z6ds=;
        b=G6vChs7iDlQ+i0H/2bAZzUfAXikmn0uGLh5/YIZISE/uMvmFJwDX7dLTGU51vmbxAJ
         dgh7IxgbNmcvMQwk+Vxeewfah0JOeOAS8EgzxmJM1+cItxvLHMKUDBgbDRCIgn1VHCxB
         lcXL7Iot/+Hq02aoiFUuE5XPn8P3sFZK6dRP/yegFIpxo2KaY6lQC3OjrQe+jGIxikG3
         XOyA0Ipu6iPP0Q16nkT5ye8HN5vXANAJH5W5ykboLxvw7PP4L2gap+48DAGGoYLc6pdY
         4MszxTCZegpySBjt3WT0E/5PCztDJxm9xxsbPevLriT8W8ObtS2Sw/chfcNePwbIwZxV
         tXBw==
X-Gm-Message-State: AOJu0YxaWHRlAqgFCMlh+j6WBHUW2egBIKTW2Sm6gZGdseZ7H5qwK6oP
	MgE5P8rxoTexx51lM5LhBRwxl+iT7kfVPuCfyqFZfSQEG4qKzP/fQlB6UnTUksq4o0Ckwo2te+2
	HfCdmh2kHzjgCNw6hbS3ezNZGRUVtO7PvObl9jypVHCNP8NRiZYa/+j0D19X9wQAW9g6S/ARBGl
	l+
X-Gm-Gg: ASbGncsBFp8t0qcelS9W6VyLmKqQX9B8GY31BpaZZTDlJLDdJ8OaKA7QOjkDaLAzq3B
	Rtisa6v/O/91wXK9fjz5H3XYyCLVjP2s0dDjVFojYHEjdDsB1LPtQBy66DjyrpcP6Dt6NZni1Gm
	YhVoBXNLQf9un/R97uoaVp9Kv5VOdHBN3jkZrempUZDUeSnDRZAGqI4egsCroPBw0mZstFFI8Hq
	LilqhPm3KSY2dHKU8yUBoftgrUInXmZmZRUmWkHPsqVay6x3HIU0vgI40B96oZXV8d/ISERJTnA
	tP2OuHd0lpUkoJJtfGLveW8zX36s1WIF8a4NenWm3Og1FhpXoI5OZ1/2qVZLTRpnWsxu/DoJ/4A
	xG0lR9LyR38YPJqiMBfQV4+v180BGucCXrgrAKg==
X-Received: by 2002:a05:6a00:c84:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-7c58c2a73admr2337661b3a.7.1763730417346;
        Fri, 21 Nov 2025 05:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1UV6iqZ+gJ6Epj+lmnZpKTdhWI5do5qLDMR4OD+jlvac8WxOYrWbXLYSeeZ4o1Oi3RqF0WA==
X-Received: by 2002:a05:6a00:c84:b0:7b7:5066:7f9 with SMTP id d2e1a72fcca58-7c58c2a73admr2337619b3a.7.1763730416759;
        Fri, 21 Nov 2025 05:06:56 -0800 (PST)
Received: from hu-kbajaj-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471f8dsm6174873b3a.23.2025.11.21.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:06:56 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:36:40 +0530
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add sm8750 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-pakala_qfprom-v1-1-9d16485e540b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN9jIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3YLE7MScxPjCtIKi/FzdpJQko1QTy6TERCMDJaCegqLUtMwKsHn
 RsbW1AK43TT1fAAAA
X-Change-ID: 20251121-pakala_qfprom-bdb2e49baa20
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763730413; l=934;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KL7GSGOJDUNSqUzBjyoBSU+RWJ4/0BrKMOwl04Zy3rg=;
 b=Pr6a95qDo6nlvQsFL8geR+WNbF5YD1HKzSUNCn5kBXxWw7zRjeraNttQN/sZ5d5UdzCTtqqd8
 aJIXL8qvJU0DSWNiu8X0aJsLzxiE1Je5eCn07yw481Eqj2ZREZzhyK0
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=692063f2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=O_LM-byAGbfoGcItTYYA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Y0hc0VHRsnL5ZU_ihplR_2IQvoEfU5M9
X-Proofpoint-GUID: Y0hc0VHRsnL5ZU_ihplR_2IQvoEfU5M9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NyBTYWx0ZWRfX0xJYotgpmRPd
 Zw0l94Ux+uOE3PCX6F3KFSSOdQ8IjPwyeFKeXQySHiU6SOeOqpL08stS2Ulv8UPbKQTFsIJPF/J
 VZCRu7MqnV4dlWnlzWQbKK3tJst10weU169kVA1ztYcPvqR7LtTj/au/lQoIpqyilcDWhVBb+46
 awiaQ+zAs+TmbDqVR4v+kRfE+PKB3wPz9M9VaGPGwCdgfqzytwBxaYek4sKNfoZR9sr84Yj3JDD
 QmC4Zv5dKy2qH4AM4zDBFk1C92OGsJbBrGty9Z1tOyKI9V/SVNCe5FUZgjqTXAr3695u8eHR7Eh
 qHQGoG5EWJ9C+/9JHpHZFLTCKotS9lyK/8mwWUYXSmQuKmxmDkZIwvlYW9m8ehPURGBja4hRTJ/
 YsGz+8/tbZtPO9lF/T+1CccQpftlvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210097

Document compatible string for the QFPROM on SM8750 platform.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 7d1612acca48..839513d4b499 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sm8450-qfprom
           - qcom,sm8550-qfprom
           - qcom,sm8650-qfprom
+          - qcom,sm8750-qfprom
           - qcom,x1e80100-qfprom
       - const: qcom,qfprom
 

---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251121-pakala_qfprom-bdb2e49baa20

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


