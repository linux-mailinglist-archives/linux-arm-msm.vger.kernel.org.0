Return-Path: <linux-arm-msm+bounces-51616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88124A64F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 13:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFE7A188445E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239AD23372E;
	Mon, 17 Mar 2025 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLDBHDrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52223A9AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742215141; cv=none; b=ft+DFmmZqveM+nI3/o6tQknyVJuqjbscRuI5u0vIx0mg2ZKnudIEif6E8InNAS7jnjgjTAJF+8b+D1JgoTUb+oHXxJS8LN2aOioAWDWSnH/vK5i84XnvmMPx+TXdrYQ2muH+GGH/HXwoHMjVfZOI4Ss/cUpo/SqI87u0cqvtsQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742215141; c=relaxed/simple;
	bh=/hxF+PEemszqvjTSxb9E/nvqVqQPHkD9b6GWzowCc2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RjW3rxgTAB5wZssOheYqGL2X/Kvq6CoDqR4b/y5M+eZ8+ONmd8hLfhR6GMlprJHMs/KVTLhVtH3kNnSbOZFjQPghuHSOU38lqV93X6dPRTPzV6w2zJD2GuzwPhwP8vQ3LwS0Cwq+G/ahKXxueYXbU22Bzxej6imkmKdv9Fs+gqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLDBHDrg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA4FLA016310
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 12:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5O/HC5QkEwB/sgub+YeiIq
	IBm/Db37yAGEHWZ6B6amE=; b=iLDBHDrgkkVOdcd03giavkO3H/mCXLhP1dkGu0
	ZbBUSsTae7CIzuYnLL3j4LhaNkW8+VdG59Tt/Dre3MiLFc56sdEQtWTdfUFCaODR
	sJOgGExdANEXmw44IpxTfruCLPXuGHhKRQJeOI8qIy6uVIP5H9u8lsDizGUyEHWv
	XDq2xqaAi1LzHGyDWszHkpQAtULqzT3hai6/JoQin3KR8O6fa/ZB2uObr14rxHyV
	6zJIPnygZ4qsF7dDRGzfCfBL+KeeKEthKn/NOepyQkgfaL9Nj+RXHHPnI+pyre+m
	+Sx4PSCLajWu8okAFQJzg9Dg2KCUFyINGsnu2Ysaoz1lWChA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdmrqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 12:38:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a960f9cso68606445ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 05:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742215138; x=1742819938;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5O/HC5QkEwB/sgub+YeiIqIBm/Db37yAGEHWZ6B6amE=;
        b=pBWuH7/U/nVcDvp+sBSu03NJSS1B2/pt1PZWRxSO8aHy3Yn3mFfAT/sDY0r3kVginG
         W+BdJdt459Zkma7H/VxrYY4JLVgalrU1DtcuQpBYIj8xS83vCgXFvu8OYWU5gUvYqhRS
         hOhb7UkdGYWRhtPOKwlYHSqYLTub7oWI6ix713eaAQxGperDtaozfHFDaPQojNhtLPdC
         zFly2zLo5v315g6nuXs73mQUZpDE0MVVP3uASD4gplv7KQQxeNksCPHbV0/1LmAUgXDQ
         dstUEPYFOf4f6fXbVK7UogIgwCHFZCedmvTXFuO4qN05ju8Z+N2ZFb24/oMFm/cMD6JC
         mGpw==
X-Gm-Message-State: AOJu0YzmyL22RebCNNal2/ch9+dc9Zz+584K5y2lSu62mTQzZp3LR6jO
	KiUMvxXi2h0nCMC00/O/82RhWIdnPODdKbkO5aHUCwLEQQRrRBCXO07R4y0OEDlTagfF6EQAAN8
	eiU/P/L7DybjpKh8t0C8gRxw0mFDh+BvX/EgLt2PALaXj7rI2F1dkWWnldo4/Fqub
X-Gm-Gg: ASbGncsmhsOPDg9QiIoIbc8yxBW9rDg6BkA42EtaXeJrZsaTbGICLihChTAr1ZLoDvI
	RO7U3nvhbAvIfkD8QWWxpVO1xSzfbkkxXM6bSYucD2M7FUF7rHy3nPdqNEZceXXk4YaV+/X04sA
	wJRNNEbt86O3vKiXs5yhk1A8U4V/vaI91Ni2dUyfEsGy9Yvrl6iGyGRgYgD59czAm1UaNpM8+MF
	CT2PtifnfaCmB9eUctknZtKWr1BtHbXt1cEskmXHv2OcfP9sbDRiZF+wYyYYSPrYvzGDrIoTzPn
	PzMw7HbCxuUWBtBjEap4TurrCKF0Ow==
X-Received: by 2002:a17:903:2a86:b0:220:e924:99dd with SMTP id d9443c01a7336-225e0afb7c8mr177068075ad.34.1742215137844;
        Mon, 17 Mar 2025 05:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4/yCRYwOwoAwMt7RTrFKhfYHdnSIaSN5evYwfdr8Bx5AnBOwhQ+5deFWmfGIJynOjD7eqrA==
X-Received: by 2002:a17:903:2a86:b0:220:e924:99dd with SMTP id d9443c01a7336-225e0afb7c8mr177067775ad.34.1742215137496;
        Mon, 17 Mar 2025 05:38:57 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4da0sm73665165ad.222.2025.03.17.05.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:38:57 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 18:08:41 +0530
Subject: [PATCH] arm64: dts: qcom: qcs8300: Add RPMh sleep stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-add_qcom_stats-v1-1-016ae05ac4b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANEX2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3cSUlPjC5Pzc+OKSxJJi3WSjRANTM5Mky8TERCWgpoKi1LTMCrC
 B0bG1tQDQj/p+YAAAAA==
X-Change-ID: 20250317-add_qcom_stats-c2a0564b9aaa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742215134; l=998;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=/hxF+PEemszqvjTSxb9E/nvqVqQPHkD9b6GWzowCc2M=;
 b=ApMoYnW2DQV1NW+U+vWoQ5oTv6C65GgCV7GpBXOInpSuvH1UYme9IF0ESNY7tMH6xCZTGsdbt
 VB+xtAkISSxBg1E8phnEycIJ4ilasWGDWOpcW1GLHx5zG2O5Pz3A1pL
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d817e2 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ILUfUccxcQ_60TC8cKoA:9 a=QEXdDO2ut3YA:10
 a=MJ4Y7Fliwi6_CFRlaTST:22 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: kVmfdF68kpItw9OZaxKF_zkj7QbQRLSP
X-Proofpoint-GUID: kVmfdF68kpItw9OZaxKF_zkj7QbQRLSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_05,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=852 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170092

Add RPMh stats to read low power statistics for various subsystem
and SoC sleep modes.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index cdd412706b5b7bd2a953d20bfa9562043b20a18d..35b202a6b323de525aa8c4cad7595a8eee43326b 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -4262,6 +4262,11 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x1100>,

---
base-commit: da920b7df701770e006928053672147075587fb2
change-id: 20250317-add_qcom_stats-c2a0564b9aaa

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


