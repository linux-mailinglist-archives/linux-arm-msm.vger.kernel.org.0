Return-Path: <linux-arm-msm+bounces-100990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LaXD0yOy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:05:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10C366ABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCE303018769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570A23ECBC1;
	Tue, 31 Mar 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDtQJUU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/ugNDYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB743E0C66
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947752; cv=none; b=CXBeANd+8z92E5SW5annuNoSkkUW3zzeQDWwEWwdRjXzTrEiR7sW9hRQ2tapbI9uV8LcpOHl07h7jLlzoU1nUyomSB0bhOnapz+YHwSUr7zSSTi6rc3AF8twDwtIuu9Cg0sH8HvomnGMyRG15b9ixCg7BcKLS54pYdlUgvh3twI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947752; c=relaxed/simple;
	bh=eisKC3CYLxZQq/P8w+3Gv95mqBJ3rmRXNiHIB9lj/NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpLe0Jp1bzzauwqNffwNlDKsdN9m6yNBZPQ4w57Wd0tXZw5hIZlJAiCarWHbcFug/moNx3VQX+bBs8qS7xbEpf4Q/QYbTTXJMcWQVz66PE/UZHsL7FMm7b/6PBc8LDn6Aam14tsEj4opLLYw/kTttWPPObxR68PQqMBIxQZbJjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDtQJUU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/ugNDYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8AvFc058047
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0hPnB9fJFbGu/sv5Ogg49ECnoHt0baKzNqz
	4h7CuM8o=; b=EDtQJUU+djr8Tz8UjnsFNT6vOGBVxPGg2O04AJ9cO4fG3AjV7b4
	eBBQvyWh/9S7wLTp4cfFKZYgVtbON39hRat7bCAPhd5wI6xF3t8x24uo3i2qogz3
	DszXlkle+M2pk6Lf8oZDRuBPhHD8ppaAHaWyswBmh/0V28gPRCZd6xtr+HGUw8Q/
	ssBToZscv8KffMzXm2vLdwzvJ7y0ZqMFnZ2rI9Zs9ioENgKcaBDtBboifV67yvLb
	rL7h6X69uUUVrIsCWy+dMslxlHuD5dgilEy1essg6t0CIRGDehXs0YIojXPL0+i2
	2yOSyTsG5bQj8+yV5S/07kn1N/l83g7FVgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkr7dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:02:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so3208896eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774947747; x=1775552547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hPnB9fJFbGu/sv5Ogg49ECnoHt0baKzNqz4h7CuM8o=;
        b=B/ugNDYe9MBigA/LE4v/TrDnYGIjtWfR6U84ZYvmYdJvf7SvkgTCuzw9pg0P6Re6Ir
         CRsjo/Zay89pcoDNWqyhG5qYVUajkVsUHMEjs2+GDNi+hfojaVe/QJ2hversgkYlaeP7
         nEFZON7EX5eY3dDDFKQ7ehKBt4s+0zfwFg1jTYDPjTnpuqaVcbBc+RaApN4+7KcBOCFe
         bMNbMP/jioqCWEKvDpbwp8P25Bq/q+WsIn1So0T4eczOlwibT2Pkn26IthFg+GsjiN8j
         j1gaYfodE4gvx721n0rj/JHuQ2ZL/MmKENOyw3WF2w0I37Rw++I3j/WqNeRVJ3NLrheE
         7xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947747; x=1775552547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hPnB9fJFbGu/sv5Ogg49ECnoHt0baKzNqz4h7CuM8o=;
        b=mFchDVLCQM+o60CbsUHS6HcGIjEVE9rXjNwsyu7DjDqy3RzLX/SytxWvyHATq5an2B
         MUP3EIS9AbgcuF4u/+UD4IXwx9SKX9XnfWRVYPJBQeUHtZV/uCXDik2IjBJoneQjiwD7
         FXvvafcgj/mQ9iz4qqCJZV9YaJtvoEHLA3CWXO2MgMUCw+1Q4AN1tNcrNo1P+bgB9uBy
         74fjpdzBKwvYMAvKw0FvW/L3CHLur8txBIvdMZURGQYraBIY87VXL32Hthw6xsX+U+Uu
         lv2V2k6N4XcNkDIHDKWGL2EUDvDVqosfIoAkOfw7jWGDnRnucEWLamBt+StVvzgpJtHn
         aSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQR7hP//I+Ss4W1QZtSpBhroX3OQIsZtN6xS4Y+Bxd+XCb1AIFYHNFnGLycvmi9eCJYrKyUpri5zOKeltm@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfKCaJYCRK6xsoqeQwLGhYq5vXTL3FP0IxUzb6BQD9NWlxQ4D
	XAjHQZui2JtPdP0d9hGN8oQAiKnqeeJHGdxS8l0i+1Z20MNKLsumEZIsn41PKqnN9DCHM9vIP70
	Pc8k9P0boQZpkpznyhYXInz4TDPTC/CsOavpa2wru7ntb/vjR9e7DltORqePbWgbF7oKw
X-Gm-Gg: ATEYQzyr3cVfxX5RmJyOOkZZNukM8D59jGljMECUlHtBcA6SBpNrDfd6sdVAXaohwkg
	+tCx7tEfPg7gdoeobCwKWRjwhfrXdd7n5tzZw/WMcHAZrvEI7lYhH8ZMvBnPZI4k0D6QYRDkqhR
	jBkA7g08OngUOfKFoAxaT6MAbFThld38Zn9m0FLO18ZupiCFjLu/99shjCQCtq2ROoYesVdVz4p
	3K6Qvdul8QEgLankgre78V15e5gYbed/JojOk0pJ2LIyQshcUj2HFKNPCDWOkJOnIQUTSgPpJMI
	pBUuRQvA9nLARen+SoeM6hR/soh1kBxfKOe3Z5ZBFT5WKr/Ps0uTow4jxWmEV9MzrYooNawjqaH
	eb+AmXfM5XQC2Ej6fF2hRblYY5d4E9617fY/GlpzMIixlJHPvWlPn8jMKyFzCEQj2c4H6HSmO4s
	ROCmGUyw==
X-Received: by 2002:a05:7300:434a:b0:2c6:1b92:1cee with SMTP id 5a478bee46e88-2c7bd966e93mr1543094eec.21.1774947747204;
        Tue, 31 Mar 2026 02:02:27 -0700 (PDT)
X-Received: by 2002:a05:7300:434a:b0:2c6:1b92:1cee with SMTP id 5a478bee46e88-2c7bd966e93mr1543067eec.21.1774947746512;
        Tue, 31 Mar 2026 02:02:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c8a1de559csm189692eec.22.2026.03.31.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:02:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Date: Tue, 31 Mar 2026 17:01:47 +0800
Message-ID: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NSBTYWx0ZWRfX0Pc1hXQDjneh
 Bw6m4G79C9GSnSebYCF4Qc4PdBUn9cvdcUkxXd2WTKCB9dCEld36VygijSZkNc1VL2WMKaGIyKE
 Vo4mXOU4m+5QFlcw4FcPkYQ7w4JWNAFmCJxBwsIV/sVVpx3MLbvuPSmn3DJB6EtHsE+0xF9zIlw
 DZAcAL/pH51UoRCxHP+hbmf6iecJenIfsFsqVCEHG6yBY3Mi065+mmRtnbu0xDa6+QGXql88z75
 rODVhIIidv8nQ4F1MeUwW/Y3TN3ZROPMitKpXbbro9QqZuvAbxP/TSpdblTLZQ9llBVJ9Y07E6+
 wA3K0fGxIECN5LihAUoWFnQ5fVyv/WAiYuei7Qtfig9fijMnrLHjZVPuz1xwfaT+j7ZEv17BXa4
 MKuAh7lr8wy7ohksO8P6nTxEfyn/o62OG4U6T4iIH9tKC6DhwvQvRVfN3/jbKdxVjyg6it7hCzd
 isV6oUoTNQhL4iKublQ==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cb8da4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rs7BxoZ7CQHKALr8RUwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: fqp0eZ-5SZStcXSP89AHD85lgBmCfup6
X-Proofpoint-GUID: fqp0eZ-5SZStcXSP89AHD85lgBmCfup6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310085
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100990-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD10C366ABE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These PCIe devices with MMIO address should be inside soc node rather
than outside.

Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
This is compile tested only!

 arch/arm64/boot/dts/qcom/lemans.dtsi | 692 +++++++++++++--------------
 1 file changed, 346 insertions(+), 346 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f565067bda31..03a712d82d78 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2694,6 +2694,352 @@ mmss_noc: interconnect@17a0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		pcie0: pcie@1c00000 {
+			compatible = "qcom,pcie-sa8775p";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40100000 0x0 0x100000>,
+			      <0x0 0x01c03000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <0>;
+			num-lanes = <2>;
+
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
+				    <0x100 &pcie_smmu 0x0001 0x1>;
+
+			resets = <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_0_GDSC>;
+
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
+
+			status = "disabled";
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40200000 0x0 0x1fe00000>,
+			      <0x0 0x01c03000 0x0 0x1000>,
+			      <0x0 0x40005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0000 0x7f>;
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_0_GDSC>;
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			num-lanes = <2>;
+			linux,pci-domain = <0>;
+
+			status = "disabled";
+		};
+
+		pcie0_phy: phy@1c04000 {
+			compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
+			reg = <0x0 0x1c04000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>,
+				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		pcie1: pcie@1c10000 {
+			compatible = "qcom,pcie-sa8775p";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x01c13000 0x0 0x1000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
+			device_type = "pci";
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <1>;
+			num-lanes = <4>;
+
+			interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
+				    <0x100 &pcie_smmu 0x0081 0x1>;
+
+			resets = <&gcc GCC_PCIE_1_BCR>,
+				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc PCIE_1_GDSC>;
+
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
+			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60200000 0x0 0x1fe00000>,
+			      <0x0 0x01c13000 0x0 0x1000>,
+			      <0x0 0x60005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x80 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			num-lanes = <4>;
+			linux,pci-domain = <1>;
+
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@1c14000 {
+			compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
+			reg = <0x0 0x1c14000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_1_PIPE_CLK>,
+				 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
@@ -8601,350 +8947,4 @@ turing_llm_tpdm_out: endpoint {
 			};
 		};
 	};
-
-	pcie0: pcie@1c00000 {
-		compatible = "qcom,pcie-sa8775p";
-		reg = <0x0 0x01c00000 0x0 0x3000>,
-		      <0x0 0x40000000 0x0 0xf20>,
-		      <0x0 0x40000f20 0x0 0xa8>,
-		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40100000 0x0 0x100000>,
-		      <0x0 0x01c03000 0x0 0x1000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
-		device_type = "pci";
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
-			 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
-		bus-range = <0x00 0xff>;
-
-		dma-coherent;
-
-		linux,pci-domain = <0>;
-		num-lanes = <2>;
-
-		interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi0",
-				  "msi1",
-				  "msi2",
-				  "msi3",
-				  "msi4",
-				  "msi5",
-				  "msi6",
-				  "msi7",
-				  "global";
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
-			    <0x100 &pcie_smmu 0x0001 0x1>;
-
-		resets = <&gcc GCC_PCIE_0_BCR>,
-			 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
-		reset-names = "pci",
-			      "link_down";
-
-		power-domains = <&gcc PCIE_0_GDSC>;
-
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-
-		eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
-		eq-presets-16gts = /bits/ 8 <0x55 0x55>;
-
-		status = "disabled";
-
-		pcieport0: pcie@0 {
-			device_type = "pci";
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			bus-range = <0x01 0xff>;
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-		};
-	};
-
-	pcie0_ep: pcie-ep@1c00000 {
-		compatible = "qcom,sa8775p-pcie-ep";
-		reg = <0x0 0x01c00000 0x0 0x3000>,
-		      <0x0 0x40000000 0x0 0xf20>,
-		      <0x0 0x40000f20 0x0 0xa8>,
-		      <0x0 0x40001000 0x0 0x4000>,
-		      <0x0 0x40200000 0x0 0x1fe00000>,
-		      <0x0 0x01c03000 0x0 0x1000>,
-		      <0x0 0x40005000 0x0 0x2000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-			    "mmio", "dma";
-
-		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
-			<&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			<&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
-			<&gcc GCC_PCIE_0_SLV_AXI_CLK>,
-			<&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-names = "global", "doorbell", "dma";
-
-		interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		dma-coherent;
-		iommus = <&pcie_smmu 0x0000 0x7f>;
-		resets = <&gcc GCC_PCIE_0_BCR>;
-		reset-names = "core";
-		power-domains = <&gcc PCIE_0_GDSC>;
-		phys = <&pcie0_phy>;
-		phy-names = "pciephy";
-		num-lanes = <2>;
-		linux,pci-domain = <0>;
-
-		status = "disabled";
-	};
-
-	pcie0_phy: phy@1c04000 {
-		compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy";
-		reg = <0x0 0x1c04000 0x0 0x2000>;
-
-		clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
-			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_CLKREF_EN>,
-			 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
-			 <&gcc GCC_PCIE_0_PIPE_CLK>,
-			 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>;
-		clock-names = "aux",
-			      "cfg_ahb",
-			      "ref",
-			      "rchng",
-			      "pipe",
-			      "pipediv2";
-
-		assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
-		assigned-clock-rates = <100000000>;
-
-		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
-		reset-names = "phy";
-
-		#clock-cells = <0>;
-		clock-output-names = "pcie_0_pipe_clk";
-
-		#phy-cells = <0>;
-
-		status = "disabled";
-	};
-
-	pcie1: pcie@1c10000 {
-		compatible = "qcom,pcie-sa8775p";
-		reg = <0x0 0x01c10000 0x0 0x3000>,
-		      <0x0 0x60000000 0x0 0xf20>,
-		      <0x0 0x60000f20 0x0 0xa8>,
-		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60100000 0x0 0x100000>,
-		      <0x0 0x01c13000 0x0 0x1000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
-		device_type = "pci";
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-		ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
-			 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
-		bus-range = <0x00 0xff>;
-
-		dma-coherent;
-
-		linux,pci-domain = <1>;
-		num-lanes = <4>;
-
-		interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "msi0",
-				  "msi1",
-				  "msi2",
-				  "msi3",
-				  "msi4",
-				  "msi5",
-				  "msi6",
-				  "msi7",
-				  "global";
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0x7>;
-		interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-
-		clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
-		assigned-clock-rates = <19200000>;
-
-		interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
-			    <0x100 &pcie_smmu 0x0081 0x1>;
-
-		resets = <&gcc GCC_PCIE_1_BCR>,
-			 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
-		reset-names = "pci",
-			      "link_down";
-
-		power-domains = <&gcc PCIE_1_GDSC>;
-
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-
-		eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
-		eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
-
-		status = "disabled";
-
-		pcie@0 {
-			device_type = "pci";
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			bus-range = <0x01 0xff>;
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-		};
-	};
-
-	pcie1_ep: pcie-ep@1c10000 {
-		compatible = "qcom,sa8775p-pcie-ep";
-		reg = <0x0 0x01c10000 0x0 0x3000>,
-		      <0x0 0x60000000 0x0 0xf20>,
-		      <0x0 0x60000f20 0x0 0xa8>,
-		      <0x0 0x60001000 0x0 0x4000>,
-		      <0x0 0x60200000 0x0 0x1fe00000>,
-		      <0x0 0x01c13000 0x0 0x1000>,
-		      <0x0 0x60005000 0x0 0x2000>;
-		reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
-			    "mmio", "dma";
-
-		clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
-			 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
-
-		clock-names = "aux",
-			      "cfg",
-			      "bus_master",
-			      "bus_slave",
-			      "slave_q2a";
-
-		interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-names = "global", "doorbell", "dma";
-
-		interconnects = <&pcie_anoc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
-				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_1 0>;
-		interconnect-names = "pcie-mem", "cpu-pcie";
-
-		dma-coherent;
-		iommus = <&pcie_smmu 0x80 0x7f>;
-		resets = <&gcc GCC_PCIE_1_BCR>;
-		reset-names = "core";
-		power-domains = <&gcc PCIE_1_GDSC>;
-		phys = <&pcie1_phy>;
-		phy-names = "pciephy";
-		num-lanes = <4>;
-		linux,pci-domain = <1>;
-
-		status = "disabled";
-	};
-
-	pcie1_phy: phy@1c14000 {
-		compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy";
-		reg = <0x0 0x1c14000 0x0 0x4000>;
-
-		clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
-			 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
-			 <&gcc GCC_PCIE_CLKREF_EN>,
-			 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
-			 <&gcc GCC_PCIE_1_PIPE_CLK>,
-			 <&gcc GCC_PCIE_1_PIPEDIV2_CLK>;
-		clock-names = "aux",
-			      "cfg_ahb",
-			      "ref",
-			      "rchng",
-			      "pipe",
-			      "pipediv2";
-
-		assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
-		assigned-clock-rates = <100000000>;
-
-		resets = <&gcc GCC_PCIE_1_PHY_BCR>;
-		reset-names = "phy";
-
-		#clock-cells = <0>;
-		clock-output-names = "pcie_1_pipe_clk";
-
-		#phy-cells = <0>;
-
-		status = "disabled";
-	};
 };
-- 
2.43.0


