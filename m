Return-Path: <linux-arm-msm+bounces-84295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 157BACA2583
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47308305A3C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9199272801;
	Thu,  4 Dec 2025 04:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikSISRMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bbpp39Mv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B33594F
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823625; cv=none; b=N+xQEQ4EFRx2A0m/aRpQFabm0Fqnv0xkDLumPqPyH9kg91gFHqP4nZTgcAI8STA7DiUV5qTTNXkxMrkSrH9xjTJOMKglwsmOjHFwWG1WpwVnvzZX0v4xCixfKOpYPjPeu/8168a51wQ3GNcDjJ0XbG4zu0TbdUOUbgw/bAZelik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823625; c=relaxed/simple;
	bh=9UiwSJjo7k0PhGIMnULViSZtpueyeJCmyzJ2DH9c110=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YM8z471Oy/3QD+CshOGendCEsht3wZrw6yCfW2J7st6kWLgjYTf4KQmO0pwajH6CJ9mXRb1+kl4PuCVeVLIhBYgWiblr3RLgWTP+j2XBUAUqVd1/qZSvZPUWatv+ZiG9gMsmiEbuoi9lIiU9d44lN5UsAApdAoVJomJmjL0gQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikSISRMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bbpp39Mv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3LvSrs1374620
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gibI6s/aKkE
	S2xAJDE4O3U75kIeUNHOsdYXPJxPzE6E=; b=ikSISRMF6IxogBDw4TysC1SNBgr
	0qKDRQ8FZyNRvuezCgESw9DiINNyopA8yFM4+HgnwYptHH/+yP8aTm9t4CILwawy
	1a9WLuy/4zEIGAkWqU6KJiubVuD0H8C+OzEDMozjYRNRvHNFMY8qpdBdLIwSNjtF
	ogRS3a9SimlH9L+Qr/J118IeY5ttHPLBiUdDU2DpVjz8oTyhfDy5MdU1/E1Duxj3
	wKb69OA2nxWcLytkQEoyOv2GKCaXpSQ1+Pj9+UWaBasNFCCDdG6rZ6lw++0LP0Ot
	6OfAfb6DEwdrjBvXeHN7nutTsX6B2C8rJkZy9o0cRiDV64I6QQy4TjF9ZKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm0baue3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:47:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295592eb5dbso10110105ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823623; x=1765428423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gibI6s/aKkES2xAJDE4O3U75kIeUNHOsdYXPJxPzE6E=;
        b=Bbpp39Mvh9icfmcRPlPCssCIlR4i1H2kQNlzcx6fxqfQlD+F5xgXj4D8Dw16gpgG/H
         x4jEoTgA2AESCVsUMz1BghBY+XTKqmkvyLdJIcnICx7p+DdKy5Rwyon9doK788LmbnGd
         U2rmvYv6rh+gScGe4EkuDlvo9cabOJ8vtw8mGb9ErGmtBQC02FjeJzXo47h/S2jxk8jI
         v3Ja0T2vL62tl5WHJVCLTdWxVOr+D+ENW85uMJDU0AkiljFounOIiF3hdap9CZBa4Faz
         vG2BN8mCKNfRMdatpc6BXp2raCMa5E+k0gerY/Rjb2G1AKot8BcKSVlcypHBvTxdrr3b
         JTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823623; x=1765428423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gibI6s/aKkES2xAJDE4O3U75kIeUNHOsdYXPJxPzE6E=;
        b=GHdCQ1MNs0geNRb2/vkyJIYDwbM/Nk+5hcvtY88THUbpueUEkkP8+pUEdA4EnBFCiX
         h94vL4N0EHz1Vw6RSAje+Qu05a4RVfsCwc6PCqSz/hARiArQGVIflN9xS9Yc4cKk1P/X
         Twk8fz2rIBOiNnZAgPsCxxgatkV5OL4PUPL+IwlztP1/57jWioAtWYvXxqtzLZMAz96w
         H2YW/t3H0cvV/uvsyv9hY06zKlnZc/DNpXgtXkzWgsq3Dr4kfobFnfQLqtJHITMRPRTk
         fOyosB/J8zOCVX4lZQt833eJoas7d+l2G0zu4tdJWrvBqfGMlRhGpEzCyptjj9AZvVEP
         pCQw==
X-Gm-Message-State: AOJu0YzMhFknHdfXVXnIThTr25T3UDNRsGqgI/awXRhNoNNBwu28GSHX
	OJvtgJTREnjQW+qhHacgF5wdPAZNq1F3Dkt+zwGRD/dOgs/hie0fwG1rDCowbdw2Otta1S5mnVX
	JS8A9O5E9a8O9xiZ3KApULupDJzPSBX6SnyMLHzn1v0Bco98R+J4msgjuHNghG/thx/Oy
X-Gm-Gg: ASbGncub/Kai+c1a5VpWVYi6D9e9dPQ+kruqdFgKGaPlyWIAt7EQbiolCv2HPzbLQRp
	/KqaYjdKtA7T51B+zb6XD8RIh1G+txZqvQgA7EOG3yHVsOsvftoPRZr7gDItvWrwihroKHcM1W8
	OhKWhuNe9Pz3EyDPbbbdHK3gEOtNV5qxxnHAVX2cERTKS/WlTxKFHGwtWWB4CwPVdOYaJtDlc7l
	0G7Q8lclu/fLGS/O60ShiFS2333hdh1TQAvhESambIxOlS14g3+f32tFekv2yMfNxt+liGMqc+j
	q2A9l4MGvc0ZwYRiYzB8qh+3TNT8PVZsMx/Af5NRUR/A/pmKSUybyQ6d2nD/gdv5z/gN5oh3Ry0
	7XExqMiktfyO1BXC+xCB+B/hFV0tc/UAfrXwjZP7GSt0VTbA=
X-Received: by 2002:a17:903:186:b0:297:c638:d7c9 with SMTP id d9443c01a7336-29d683434b4mr56391835ad.13.1764823622845;
        Wed, 03 Dec 2025 20:47:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0GKAK89hN9bwJO4hk6zK8IKfdMSHrM4ElfZXDAhFnPTpybMplsTMuf5Q1EH9XibuMTUHkgg==
X-Received: by 2002:a17:903:186:b0:297:c638:d7c9 with SMTP id d9443c01a7336-29d683434b4mr56391455ad.13.1764823622393;
        Wed, 03 Dec 2025 20:47:02 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm5217995ad.25.2025.12.03.20.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:47:01 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
Date: Thu,  4 Dec 2025 10:16:42 +0530
Message-Id: <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69311247 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_cinBlex1LSEt1clrZoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: f8rN8mzXFNPw0MCZUpmmr0MAbgl_hgHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNiBTYWx0ZWRfX1yfhJ7ojoXmt
 DN4iMNulxNEPdgpTJOTcv36nb1bCUmcjZv80X418+p9lBAWlJ5yqkQCY//HEVUpKu72OVsnfLVl
 +fcUFZ/8/i0c1ReybqNzSHuYoVJmcZhViA8EdSnkbc/N2g3hANyk2MpIybh4l2s8wuAaOZp1xLA
 Yq463KWglsFFoGatdomBnpgtKXb1LPjUt6LN1mbTLJqbJ/2Un1KK6ZWMCT2bR5IcToNJ8Y+PWMD
 3CNaG1m3Tt8+wJCF2V+5XO2+LIEtoxSr97lxHQc67BgxM5HX49VIj5HKe8LwYufczv7Fxv6TWaG
 0x4/HYRZAanfj0qsPBUp0GJw8IqckGGIpmg37v9irCH2f1bvSKIgOF74YNWiRS+Gh0yhRwq1QOm
 cMFOII1C6YcEheaN7BOOu4F4LP/ioA==
X-Proofpoint-GUID: f8rN8mzXFNPw0MCZUpmmr0MAbgl_hgHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040036

Add squelch detect parameter update for synopsys eusb2 repeater.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..f2afcf0e986a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -59,6 +59,14 @@ properties:
     minimum: 0
     maximum: 7
 
+  qcom,squelch-detector-bp:
+    description:
+      This adjusts the voltage level for the threshold used to detect valid
+      high-speed data.
+    minimum: -6000
+    maximum: 1000
+    multipleOf: 1000
+
 required:
   - compatible
   - reg
-- 
2.34.1


