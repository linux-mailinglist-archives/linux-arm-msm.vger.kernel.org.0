Return-Path: <linux-arm-msm+bounces-78558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EAC00BE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7FF3AEA2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FB930E854;
	Thu, 23 Oct 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWxNJYC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E301E301487
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218982; cv=none; b=HSfknQ+XaUwyDPTaX5vQPmTHTWXZEkd6jrDHHmgAl+2QNJE1Ah47K8NfuQ83xpzaEyAsGPOoUCDv26qV5fQCfiUGVpwmq2Zyn7ch+cA+d9+y078cC2GNwwd1UB2xgv2RV2D5lasEXB2KUZVggptVJmfiA+uO2GdITaan8vDFXpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218982; c=relaxed/simple;
	bh=O7f0ov9vTfLRbLjUh2RSJGZyEQmlwikWpzB+7BwXE+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZAfKoRGFwMd1yoF0i9boYBXv8EEsPdXJCPRcp029VpFJXQNaLopkVylFbhhg7WOQ6TxXjfG3rE9oTeKm49ObTVPJpCnGQh4hx0B4Td7BZzrQwRTHtdiZ5uT9ym7mVGYhZxorU+r6fTjxrnQWTz6hcMSTWzS5pqpTC1YdeUifuEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWxNJYC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6df0i000663
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P8mfvs0DoXJ
	oaXO7wXqvtVIblGXbDsNop1/adqmTvLc=; b=iWxNJYC7tTJa9YL70ViGzWRPjKS
	X7PSdZTHZ6QZBwAs3ivHwJmHr+qxTsiaqCTWfivPGf55lqubw4qbxJmC6vWshHCj
	QpCmlqLze47BCy/y4m3XJB1uq7y4seAw6sp0FXrTB0pdeBjzMPGPUgVDFaHGfAKQ
	gVy6pGupVxvV9Ob6SKoVD6ogpN/PwxGuBX3q3kzLkrcQW+PW/xADfQ0UG+T9blwd
	yurVWYwTkLv9JQqxRlKe2wfBsPSOIe5QZ8pplVf7bxJDlGzWWeh7DUkAY0F4MMKH
	vHGtCefgVE9g6MwgjI9N4m9F5q20/qc2qjG8Ej5KC7Bi4ailQAubTOqxCEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdupb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e970be282so2329745ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218979; x=1761823779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8mfvs0DoXJoaXO7wXqvtVIblGXbDsNop1/adqmTvLc=;
        b=lx4fyPTJUV6n9P8G4+rk4WYDPXoSWOoqCL7LyNCwuUGEZ0eILYp44nJMYlMihv0Vu/
         5JEeVpieRsUYMdEbrHbTVaQ7jc3GxKhP/+dOElunrq3tosKo3+iNv6u2lbUIJM+pdKYj
         7h+s6Q9g8aYtYVIesyoFE7mJXeErkJEqqpyUtZQ/g73d7MyfIqw1jeOwgMyYP9MzxRdh
         se0u2YVBUmOXSInVzD6+o6eywj4Si4cw7YiuwBQg4ELbCl62XzAlJVWkl+6v+2NPaEWG
         5dem3L7uC07p+mDShF2Bub+JT79xRFAqbNI07ZNe0grY+5L2BerhvyxXWkmEc5tcwdVR
         Dx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZx64/TPSAlPB5dwm0lXJs29OoxQUMIhDudFhFFIBOaxwDYQDguU/mRkGKM5ltfDjtxUqGopvJypxPxIdo@vger.kernel.org
X-Gm-Message-State: AOJu0YwHaqD6vkT8N4mMUOsMfqnm6bDEL3K4al3WEagGdgNlxpB9ZdzK
	ffTItRd6nzYKDutDHyk+uLidw7+0qorIQJb80khnFaCyuOmcpLz6rKvpX8kJP5Gs/YRG5EQ46V3
	1CYCu+NJyxtuN6ob+4zEVkTAoVan/wXCqY2IbRMV0kRfUdK+ATew9wR6u89z773g+F0o=
X-Gm-Gg: ASbGncv2ji9+mj01z/BBhMZN11Lle71Bi98OX/ROvJgaWBbr2XskpzEzpSXuWYSsKoO
	EeL7D0TdtGQRb/0jLwbsyGHKMDaFhNrtYCbeH7/zVS6BS+GChQBKvNqD8OEHjw/B4DiZVZCs3FM
	Vshep/VyhkjmR60LBLbJbVWBqw1h9o3sgG16xXUbN3i+YLRuwad+0GVvmYUyyoB/YdptprCXyi5
	H3LmSeDOEuTUN42rNZwP2oqLpCOGEpnPMFn3wsYaPVrbqA2IZzUKFeyt8NHdi3XXxmcKzZPFXY0
	N2oHWPS3mbU+xlBL5k23+Wup5Wag9JuRfU/9ZeBDoVz1alMElpyKIbpTkjYC5V2Dk86hli0Ue1y
	o7Y86+fk+zLIt4UjywQtjxSW24rDGCg==
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id d9443c01a7336-290ccaccc47mr153641995ad.11.1761218979215;
        Thu, 23 Oct 2025 04:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUBXBV4AbrVjLdhmtE5JO/g8t7ggle1PnMzliYfuhA5RdGXlFMPcTHhQSuRUhryEqPpDsL1g==
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id d9443c01a7336-290ccaccc47mr153641715ad.11.1761218978805;
        Thu, 23 Oct 2025 04:29:38 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm20438815ad.97.2025.10.23.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:38 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V2 1/4] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
Date: Thu, 23 Oct 2025 16:59:21 +0530
Message-Id: <20251023112924.1073811-2-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1XnV9CD0FX0-VdpgIgh7bHtl5UrKeH0I
X-Proofpoint-GUID: 1XnV9CD0FX0-VdpgIgh7bHtl5UrKeH0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX1m9e8eyYRith
 XdU5hi9cKD1XT+FNrXBZghx80HbOHk8IhP9xiOGzXYQFdWKYz/VEo5ldQCFfFFRyP9/NqekFqAS
 SacGqKIGnfGRnirR3efdZP2/LlaLxlD+kTGDSUfm7JUFFSkeiBai9QEDBmozE/F2ncmjaWBoM5V
 Aq4wu9bRCCY9iurDa+kWWi0POifehx6KqSuHGusRrJBDJOKqdTtWMD5+TIx4N5nV3KTU6mflBc4
 jvrjPAFVE3PhB5KX2ZH7U2kTRjhCsj/ElA+UZC1C407tF3z9IEXjcIkWil7C5/+LkJQibbmfAoN
 GoVujcDEgxz3nHM4wRe1VtYZPumZB7oNn2yi3QdsFyowS8Ozzq5O4gN1dOMJ15hZIfXlkqhNr4E
 62uf5YyI35DYhcdrhX3dQNvYUdXxRA==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa11a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=yU21l3sC3bVkzOeoNhsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Document the compatible string for the SDHCI controller on the
sm8750 platform.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 594bd174ff21..027011223368 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -70,6 +70,7 @@ properties:
               - qcom,sm8450-sdhci
               - qcom,sm8550-sdhci
               - qcom,sm8650-sdhci
+              - qcom,sm8750-sdhci
               - qcom,x1e80100-sdhci
           - const: qcom,sdhci-msm-v5 # for sdcc version 5.0
 
-- 
2.34.1


