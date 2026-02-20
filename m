Return-Path: <linux-arm-msm+bounces-93449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBziB2n3l2ks+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:55:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1E164DAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE5653051D0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 05:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE623315D35;
	Fri, 20 Feb 2026 05:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4Jdk/Rs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7aqkyAm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC222F5328
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566887; cv=none; b=qS4LOMzYu3Q/oh6h/YKkWfW95fKbQpV/KL3QBra+ZcnqdDjoD+syQg/znJwLMXWNfj+5KhB4F1OseP7iMBHQ+LtIz/ncpO5p5WkwCMRoUSrVFrV/KcwOL5V67il5HaCafn7r19C/F4bcFhxEsgIsqyqCXqQAVWwiewUMpUk2K68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566887; c=relaxed/simple;
	bh=YJTFGMEepF3OlAHZP8f2rwHLxWqlT+Xu+VLIoE2sCe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aqzyjn1m7Re5jRla7cmnpjl1n0oo0GLbtc30zpkX7OTdgFCnHWJCqvM6xMY+luc7RORE9Zda95WTJqEh7INvbMqi1MhqemYPx72EfHGhVUaM60hmCiofRYeFGr5YbNftlLBSzlpBzjP5dv/LAnw7MQGSPtoJRTIHxlwViadYk7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4Jdk/Rs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7aqkyAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rr0Q3034413
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjonDUMUOPD0sBh3EsKMWNmFtBDTuVGTl0/oR15Yd1s=; b=p4Jdk/Rs7dUJlMhZ
	oV5+XMPM9WavYwL7edqsuIxFb9511c5RVXbx9WjEi0pyJRcRMGwNwF2GXT0TcqJl
	RFeJF2Mk/gW5QQfYAGhmjdSt2Sr6xBJfV2If3lVdeU1cw/nrJNR3leUC1YHmfGyG
	9mEVyC1DbgDdEuDGg0a8Z3OO85vY4NS6JGTCetinq2rGKTQuhBnwcEzHVNOz8mcG
	glVXDv6ksEAQ4v+uzaUipeDaE/c/I80wM4Y3BIPeCMVB3Ou7j7w+4K2Q4gUvaU1W
	YcGLri+C8FxpHNspmMEHyB9vokJ0IcdF/MgaSORM1GguWWgxMsbnZ047WEA5Usy0
	B0F7iA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce6k01vrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aae3810558so22018475ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771566884; x=1772171684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjonDUMUOPD0sBh3EsKMWNmFtBDTuVGTl0/oR15Yd1s=;
        b=C7aqkyAmqCIbRZQOXsqanssBa1DEZYNiTfHbMumVWNGgKraTI/OsC2D1JT4CHMjfXG
         Qb7PA+2nFGAia9dE2YFMy7DK9Ew1ufprMreOPmH/wtfkKf9JGerF3nY5z1tWlBV0Obju
         WhDjP1kAmVIZfwgT4CXGdJeEtd010Td5yMgMsKdZUzVSJpIppl2TXXdRojc3kbPg42P+
         tMVbGwUSqri3HQcaLOaW+AtEUjn1spnDGpRjldw+9j80jO5JdcYfy/DFd0IX33ZKuP6g
         ngnR4oljAjdtIkpMh2Xl8udv1vamfVRdsICMZjk4VNGgGDw8vLnVn/eFC/Q23Nt29MRa
         DhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566884; x=1772171684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AjonDUMUOPD0sBh3EsKMWNmFtBDTuVGTl0/oR15Yd1s=;
        b=l+jFOj5XH6ih8Cn61yypoutBH3a571x37JbGuP5EzH3S0tsw9CrbPGg3czSkZZjKGg
         bXsfvFBR+bml+NhGWWlOD/DeRub/NDyZCQOWTgFHUiD47FSrU2Ah80y5ghYT2MmT6zhu
         nm4k6u7OvhgMAhyUhcdcLWVBGnZZvLMbbaJHK6c9AU5pBT9C0IASH8hDtD1NcC5wN/dx
         v+aBUs7s3j55Gb43U8WwrgLkZQmsZ6yKh8KwpW1Sh0i16rplLN9GNEYPxTemBuj/9b1R
         XGMEvnlcf3ELWNVNVkOWfiRYEFypHCAmn3DFnaIO23u9ieH/QCQENObycnMgy0rp3ueR
         zFuA==
X-Forwarded-Encrypted: i=1; AJvYcCWRAeZ/kUpn+MCZUm2rY3JNK5JXu7y4+2xS7mtAhcHS6vDTR5g3OltbDjTQx3YUIIBMk0X4C5K4ahnuHcGI@vger.kernel.org
X-Gm-Message-State: AOJu0YzyV74TtXJI9XjYBGDwjVS5YdMDF7ZnN6JrfyV4kmUBiBdzHZJ3
	sHsq8XbqJ36hS3SVF5aw69uExGjC1yhgfoOt9JxUpoY9dHD9En9Kl21P6Yb78EltxZriVRiSdal
	9lZDPaDAYbvyeQjryiFkRIsCmL4P8Kev2vyXhgB6wBQ9fy16l+T50HpDcr3k+zDDrvsBR
X-Gm-Gg: AZuq6aJ5VWRyJWVWwnvIM0j2wyrgI7SfADCyVTca+HvK7U9XuglAvfKQgaj+8ELV4tw
	OCCFqFvz7YdAn5o+urTCjpt2Mp0NgIrlr7/CgUsOU0mnSH/Wy1nKZVZgjGe3xxBksh/Xbc+R5Wi
	wpqdMoWpLaWCSHjj97Q0sPsE3QAUkZlumQm6hcl+mJY3/QISU4UI+SwQDGPicLBNoJelro51gzk
	kSHcC8fsNPEsFdT16hGHl7m5N/uuJWg1ud0W9/7HCP/aY6nzfsh2Z5aYQu2WUOSb4IfU8OUkKFi
	xmuzqi62Xv/CfY2FW9wW7BBUFwbpE3rR2oe8Zf9lShy9Ix0QrqGmRVkOFKRRT8HwbmLe86e5aaE
	zrJC95afa4ZEoZ6wwGdolxBLxMrY8nHbaKUAK/r+GIfvf4g==
X-Received: by 2002:a17:902:ef52:b0:2aa:e6fa:2f67 with SMTP id d9443c01a7336-2ad5b0e1346mr58078505ad.29.1771566883775;
        Thu, 19 Feb 2026 21:54:43 -0800 (PST)
X-Received: by 2002:a17:902:ef52:b0:2aa:e6fa:2f67 with SMTP id d9443c01a7336-2ad5b0e1346mr58078275ad.29.1771566883313;
        Thu, 19 Feb 2026 21:54:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa326sm197949665ad.1.2026.02.19.21.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 21:54:43 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:24:22 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-gpucc_sm8750_v2-v3-3-6c5408564c3c@oss.qualcomm.com>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
In-Reply-To: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA0OCBTYWx0ZWRfX0GeEhN7mWPt5
 0gLHVggi53smL4Twbsegsb9YMnPks8JfYgSxHlMbEoPnMm7i5kWSOdUJPa81qcO6AuxVMEgJVqv
 IxzdZ87nNcMMMRrEe2NVZmfsyUV785fu9AyWyI97mYVK0qX3z+r1cECZTG6/X5RuABfD5BCDC7g
 4aLVTEra3uYHlt5i0qVBOtEZMuhaKoZUrwKge7cc4f05Bx4s+K9noDXIsU5NwNVn7QQAm8rpZDe
 mYVeUcOUuFR/lOpTXzZpP790pzGXPvFyId1BcgUn8xSIkPSGGLMvp2fAcSRErKjIjUYlSbeTLq5
 lGyyzxypSIWuMEuyVyluxAA9y6z1Rde2gJ0nge/64sco3R6d8PduvG2BCmVZ/md/ADJRPBb3iyr
 g+4AfR/eAMAtUknmLdA4bRKbli/Lx/m/VWTwcQlQiQvTG15FjQlz0FwcP+5AFQa2kCefG04TFxe
 gzMC6y6+cgZ/5bXmnGg==
X-Proofpoint-ORIG-GUID: 4LCnl91ksMANtswM_CMtY8jdB5P-kIkD
X-Authority-Analysis: v=2.4 cv=K6Ev3iWI c=1 sm=1 tr=0 ts=6997f724 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=-JMICv5YTLeUKPlIpiEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4LCnl91ksMANtswM_CMtY8jdB5P-kIkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93449-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[3d64000:email,3da0000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,aaf0000:email,b220000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.228.225.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FB1E164DAC
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
is simply a separate block housing the GX GDSC) nodes, required to
power up the graphics-related hardware.

Make use of it by enabling the associated IOMMU as well. The GPU itself
needs some more work and will be enabled later.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b857a28859910f5c4465c8ce3473b00..0cc931d0bc96e9563ce4e7989ecd4ba50bd424f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4,7 +4,9 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -3001,6 +3003,30 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,sm8750-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sm8750-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
@@ -4515,6 +4541,44 @@ tpdm_swao_out: endpoint {
 			};
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,sm8750-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8750-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.34.1


