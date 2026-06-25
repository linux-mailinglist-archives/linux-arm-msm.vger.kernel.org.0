Return-Path: <linux-arm-msm+bounces-114537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4AfjKKAvPWqWyggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:39:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD26C630F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:39:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KJwN2AVG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="L34IKRo/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425A0304917A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F2A348477;
	Thu, 25 Jun 2026 13:39:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFA5343D64
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:39:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394742; cv=none; b=rXABUTzyA7Ut+lnmv1FRFy1Szeg+CrFWLMdES7AYkBrLdyYKYlLIkpy/xftVRho84mFyxNaiy0P+iysGtfYr8Xj4MgMg8dxgEKS8r2kQHRnTlCLL7VbwrXFrjHoPUX1150Gotnp3zUL8lhaQaWgGcHMerxeWWc5kNjMWdjkgvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394742; c=relaxed/simple;
	bh=eTNswUiqskVS9ZNGyce2IjWnK5IaVBDer1hYbbIQrQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QRn3CUsBA4RGCAAsDzFxE3NFL3SctoRET7joZ1xaZ4m+Nmdf9iSXqxZcbw1NfJJ6FvhywIGRIK9u5qPWw3WdkqAUdHj8+IGXCqKxeCiO+lvwi50f6cnxLvHl61npiTGVVxEQoimruokmRVKe1qY99qghbG+9LCBB7gkj1eaQm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJwN2AVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L34IKRo/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kBEb1948063
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k3+UKD8JSRs
	WhGs85LxVpK6dP49viTBdudT0BOpZJbQ=; b=KJwN2AVGc7W7HJhTsUxDh9GudRA
	l4IDH/PPxmZ+ThxV9j7n12qe+W2zEsQwx/q0kPnefIcmXkiD0HXkLr7/FyaNnWYm
	tcVgj4L9gwhNiEpNQ+OQQQuVZcf58TQ/ij1HYpzrBX3UxfAmIU4JJDyzj8zWt2um
	J2H+R/FE5NB3997GD9cpORScBmFId8VqcvIn7da5ZGylLZ4TcPUm4ZIebjvhcUCp
	IRXZCtkYUg/xzkEt1YrvWlhr5M6syKjkxKK++Z7WSp2NfOtt0TKNtV2uZ/YfDLau
	f6Gu+Ya4bwzF4OO3kOgu0LrFlUvlv6eQIL85Z6PWa2KJkOXVw/6JxgGUNEw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8shck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:38:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-726eb357779so768287137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394739; x=1782999539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3+UKD8JSRsWhGs85LxVpK6dP49viTBdudT0BOpZJbQ=;
        b=L34IKRo/I80JekIaz490fanosRBUsrMFcrMx3FfdT8jwDw1NOJkIVbcAgjbCzlc4wy
         uhqQ+DrQJhMjUePLaj0RbCUJ8l6prPbrSDLtzJx7mKLUCWbDFcKVyQSiyOmioIf8AAQO
         XT3IyRzV5p2VLYY1i5AxQISTmqKdFifcDF/1c6JIDzAag+qB5Smh6yqXJcUOs6tfSkIZ
         1Kubt543KfRtj38RHncrsEDy+HZE1J9rtRvedDgAWHlREXnR9WzXy5FoM2TnaF8I0YO9
         x/dXF0mfjQZL8+E9AthtcjSTMRuiaBcfRzBuYbf1fPOWHK/Zn0BOaW0ZNaR30l0t16i6
         aMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394739; x=1782999539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k3+UKD8JSRsWhGs85LxVpK6dP49viTBdudT0BOpZJbQ=;
        b=IxdzILNPu5zViKPDB9Qgkd7CMbW5iMM2d9UBmRbN2uLzQun1/eHRVJK3PXuoM5FUgB
         lPVMDXrtSeeBOKqIEf+zIp9WQzJZTBSfwmaK/bWVFPPQxQID2zjRI/5i92JjiaqhT1mF
         hkPm6BuDEgV28GpRXx1d00oszfrv39l/Olh45mZ0kDNbg6y9UC4GyxNBn3tNEbOpMHZE
         LmnrAZFwZ9VTn8yFpWB2NtMIHolT26vshg5PY9Atm3WvxQSqQl0ynFvO2aGv1r1o7KIV
         mmfMUMZ+cmMb60dPzQ1HnmyWqDAb2ULlpWvGeMUdIexIt5goSwRspWKDIvvcvDJSo2eJ
         xaGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqoday8L1qNdxLMdIEpJ68V74KI0DKPND2kD3ndkAgyDnpgmse1sHGKL1zr/782QrL1p/KZBPQAq8a1RCxw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj5mmr5DyMl3Daz0RvAYDdtXgkDcO/nTIAHGJkaQ92jkNIMV90
	Q7P6e+rC6G4YS95PMTpQS2mcMMMdCMr8aP1deIs5CIbobRvbASwF1LkEF0rElpfxWblxT4A7X8l
	7vk6WspHWGLXXVnQoegl3wp+m5GgDOAlVcQNpgwffNdsbV8Dk66h53VFTNVNF8/9A36jE
X-Gm-Gg: AfdE7cnYMxwS4f/6kZn5WsnPZAfuCtDhqJLcKax3LEsustR8UlwZJXk9AXjl/tflLUX
	/G4exQBWvV4lpWSrbg24jleKcxgcNk7ZNTPedcayWvawQWZzk3ZdM3SvWYVFj7LXmZL6Ita6bS1
	mluofjoCPcaduG9RL3dAeI2pX0CjUKF8cijcImHg2n8Vk59Gsp4Cu/ywAkfJAzOJ/UdIvJpzEDq
	PX7+jySc80Uewcb/fI5ZZB6f+YM/Ot5xi0moyKylBoBvSAsIy+ONRXCU7yFPccyvDFs3n3cttbA
	/phQGJdJZzSl9lnpbYZJ7GSEV2S034w/XZyx1q4AQGpbNXxjSPnC+UsprPv/Dtw4q+pQgTPanK3
	//QP0aKm++yzWLEKGyUh3V0LK6crenNWgVaA=
X-Received: by 2002:a05:6102:4415:b0:71e:1c56:e792 with SMTP id ada2fe7eead31-73434045889mr999319137.8.1782394739316;
        Thu, 25 Jun 2026 06:38:59 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:71e:1c56:e792 with SMTP id ada2fe7eead31-73434045889mr999301137.8.1782394738853;
        Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Thu, 25 Jun 2026 16:38:27 +0300
Message-Id: <20260625133828.3221781-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX9FL0+q2SkVv6
 diDwKTSiI1iGA7eW3nqpSluNazaoLhSDRQD+AUSh69Emuu9B+HJlhfiA5Xl7aaaMwKKoxgQQijd
 gQzH6zlKaJjznaODnIpyivjY2APaJFM=
X-Proofpoint-GUID: i0EXpJI497r5LoSNXMdmAIiOIOmAKtl_
X-Proofpoint-ORIG-GUID: i0EXpJI497r5LoSNXMdmAIiOIOmAKtl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfXyvIg+x81bICG
 CQzlq2PkJQUWJSPw18xDmGjNzw2BT+2B2ZOykpfsi7iLI7XDaFr2iMITKYiyTuiRaaMJH0+6TCD
 wuSqKPeSUIxq6dNnFNaDLo9549Dp0pAgyGm07yBT32xnsuVW5vj1h5/LoSNhvNFGRYPr1DLUYeg
 PC8Upyi4JhUbYEQPfhkoaodR4X+h0z+LDXscxqjTpHfpirSgzJVWTbRNeTQhOclP2GQ53NGjYLh
 cOEhuHmoSNHyCXzFpj21ettUG9p2rBW1vk+O45/1VIGhmsD0KrkqKJiIHjFZsz/DlKbPXeLO1Oh
 0kMkfdNMHlpDOfmdC56w+06txXzVRHKLmb4qHgmgnECxh6xSBjkNJQQpxlMP9KXl6NZdVLoOT8p
 giukt0z7YFyq4Lt/tw4rl1GnUIS7alVPRaRnzvZUPcj8Gx2GZoCW/iSzyiiNPeMAl2ULkwAhR8M
 7NQzMEqc6fooheQqdsg==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d2f74 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5jZXXxe7YbI7BAy0yPoA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114537-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14DD26C630F

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

The node wires the resources expected by the qcom,jpeg-encoder binding:
- reg: MMIO region at 0xac53000, size 0x1000
- interrupts: SPI 474, edge-triggered
- power-domains: TITAN_TOP_GDSC (camera top-level power domain)
- clocks: GCC HF/SF AXI clocks and CAM_CC core/AHB/CPAS/CAMNOC clocks
- iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
- interconnects: four ICC paths for AHB config and MNOC data traffic
- operating-points-v2: OPP table with performance levels mapped to JPEG
  clock frequencies

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 65 ++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..3d741179c916 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4469,6 +4469,71 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jenc";
+
+			reg = <0 0xac53000 0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus_hf",
+				      "bus_sf",
+				      "iface",
+				      "cpas",
+				      "axi",
+				      "core";
+
+			iommus = <&apps_smmu 0x2040 0x400>,
+				 <&apps_smmu 0x2440 0x400>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					opp-level = <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-level = <1>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-level = <2>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000-nom {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-level = <3>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1


