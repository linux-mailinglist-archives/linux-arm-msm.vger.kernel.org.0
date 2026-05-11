Return-Path: <linux-arm-msm+bounces-107010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFRIFqxYAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:31:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 536EE516ED7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E60A63028D15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F088383318;
	Mon, 11 May 2026 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3DMw+w+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSRXRCm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654638330B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538241; cv=none; b=LhRrz0YLDWV5xRvoo5FTzxoqIp60qL/8JFr1Yy9IR127KeLKIX3CoDyJnF2uhV0gSjOCSpnVRjbLqmaGaJoS27RNVvo+6vNQAm/S5CCZa9+lut0NEYrJl2vj3Vi0zn+YGF3IKQX1F8kk0Jma7mgKoIoU99VjyRjad5vaR1eNa3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538241; c=relaxed/simple;
	bh=E+1GLuDyRo5xJsPchj6gbw1ljk884w3Mcmg6k+BHHl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d31Y1J8/npjaibu3eyEQiGoyY0EXSMP92Q6vK2qzHkCGkcFhmR9eLSYufOWU24uEV4X6CfKPfovVbS2j9gFvxmTrXREQpa0iA4XOY4tGBixn1882JFRH18gUBHQ0bedQkzJJTRFDtJ5GxqGug3FaIFnFby3yUrK0mJqHKzk/gAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3DMw+w+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSRXRCm4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6bhN2573820
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=; b=b3DMw+w+N/9GxBUS
	1NB5SWDv4tBz7QN0HA/VcqtKp0QGd1l9LFbuooFJCjvq9aMt98zzNa5Abs68fRA+
	cLQZTb+XaFkeRQxPHcl4NdKM210kU8S0xUZ4iJEssut9MJQ628Gew+i4YvfoDjeM
	Y8EJdSoIkd30D5tJWHr183dw8Wvr6CqUWrvfcMHiK/E9uMHeiONFwi3QWlDh+Is7
	Eymm1a3jPTpHYJOJA29abjOuEOcrMjFA6lXrYeacIi7oDfzfsLnyNKItau6eynO5
	QtFHv8YxboWx1SDVOQCM3rhHqieAqBbbmf5sX+ooEkBXBvzprMos1nFXtRGcA+ig
	vL1a4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28fbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba7662827fso42567705ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538239; x=1779143039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=;
        b=ZSRXRCm4uGSc17iVqez83PkHJmKub4iTkhSivPhw2zpKmCLdD8YuIco5MCZqcpWKEH
         ItHRzxj67g2rhsQRjE0GnA74EmZQkOaXisLxMp8znuMN+3DBTxmHvyr3NVZs5lHyiMMy
         lN9gdMXYPdpkqE0+h3ewDColfdpH1Kfl6DKkGtVFBHzMoLsgLhn0DBYAj4D6FutDLvDX
         gcevPODOgnWZFrnCoS4dSnrUqulBC6xf5PfCrq97Y3Fq7FmBNMwVGniHOjP3mT2b/wfX
         m6T/lIUlOaf/lA8C9ntd3CsIe1nZ75L8JULOfbvmZBmcloBvpFPQsvglQt8kNbEp5Mp+
         nmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538239; x=1779143039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7Frk5q2FbrccyAZoFFWXLc+MXICjLS7DMiAdsGdoHA=;
        b=f6yFn+9bf+JSe72kC/bJQ4cV5saCcTM7BaLn39DZ74O1YJI0n5AFKCS4SAFelG7nqr
         jUD48IlE9trW1E0DEnkF8MH8bzJQajp/knewbgfjVY+s2yU2E05lIe7HtiDjI5hl0BEx
         Npup2bzbpa1Iadc1xY/T6x3ZO5GVHoDy05ZxXZUpSGAQbLR09CZD6mGbpO76n/LXq9Ye
         rEi8KXAIVKEb6iapnM1SFqQOeRQQFtzolPgfSE+zFrb+KayDTFi9tPvzw+fLqJhF37g7
         atgE/eHNsl3Fnj7Zs3mZRlM0zfseBf651/juiDUasFVl7Ym+MBg8oj0jH0ihTmU/XUgQ
         oNEw==
X-Forwarded-Encrypted: i=1; AFNElJ/1VR5IQdpg5sV57nkRbCcqKsKZ35hw+UHZp7PQPrX1glxeWp356SYFnroqISokwcmpKyqt8wuaZ6suGNA4@vger.kernel.org
X-Gm-Message-State: AOJu0YxY19iGk3oK2VG9sWMb2gFyejPYk6sApnE+FwaTxvIF3FogLeGH
	FdzE5PdlDra8o+u2wZffNOgUfZW2+dxUDUGPpBzMmCZJe2/8WLQw5P2XkHAPCDUd2rhBmd+L64X
	jWhpB8kLsv67rABTxRL89mqKvRZchHdTb16vDeuKQoO00z9CbK76mSuUAOo7w9k0f5grv
X-Gm-Gg: Acq92OGOWLB7FrPz2hnPkcx8ThffWSQDwpuiXrSrWHAvEgpOytFrJlh69PCcGPH0qg1
	hfH33nBMgHm6DupJ3eD/UxVkmzK25LCmM4QgIxeB6o2QWNRfMC3YsecxdcpWlSFpyjBAWtymJ0g
	SQ0qY+Wyig2yRxOOdO66TCYhXhphNUF2vued65EeGw+jQHiX/a96dOArjd859yoECngeyIkjeQO
	d9TPbV0JhSyEd0KbcfvAeFyrTmcZY0sme4mQaKUDDF2pipafByAJ3sBrxx0PbMnmM2/k+lzXSWC
	dQAGuboUM1ERtPmYheZEDhC9gMF8OJPOciBN/3pdO/wibyo/0U9YC7Kcp9snmkEc4p0WVbhYE2j
	/ZJPJd7qMVVf9QWTsW0WAso6cv0vEAU6Ai5SwTr+G1qb6mQ==
X-Received: by 2002:a05:6a20:9144:b0:39f:c93e:c7f7 with SMTP id adf61e73a8af0-3acc3538b93mr1274538637.0.1778538238639;
        Mon, 11 May 2026 15:23:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:9144:b0:39f:c93e:c7f7 with SMTP id adf61e73a8af0-3acc3538b93mr1274515637.0.1778538238163;
        Mon, 11 May 2026 15:23:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:17 +0530
Subject: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=2262;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rscpl8C0bBlWpsGZRfQr8cfwna3yHTFswaa+FyKvunw=;
 b=coHh6zS2m9SCj16Gzyz7t9BkZ8HEBuHE4W4uPRbQpDal5KptphD8Sputqj9jokSZ2d48QX9E4
 JAbZtSW1QrVCU4M5AZnST+pgHSljyAF0noTa/1EOUAF/8SwP5RojBAi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a0256ff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hQog4Kwz0n0lKc2wiB08TLo9oWcj4sJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX1ApM4t7W1EAb
 mYUadvOR7Rw6uPDJZDnTdsrUy8ozLtnfyaxyix9WrU9dXeJJNyAfMkV0xJxxZ/29g5YKYsoNaR4
 dI2XxRMifcpug0MHuZBQ/jtVSjbzd1BrIuMH2T4ft9mX1oYlTx7PmaICo6STAHHVtAj/qfBE7/x
 gStp/uOGVuDGPFzAXqGq+ZqFs3Hb7ArKO1OaqbkxwX4PXbEXskrg0nFrxzQH+gYdlxI36K6o7yY
 8lsPPHSVQZd/koCVdNcJt6qccPqLTlXG6LKBWDfoLijinEnqNOIMxfKy25/It+idqyMb0kMEN9+
 85TwErGOyiSRj93JfO1nNmrL6u5RNgPNkndWZ5grqOVBzg+roRMCLwfDJMcMGWimcrtEP/umlHl
 5VK3G0ey33heeiXzd4Er1tuBRyeAWIprALd0tV60sgiqHvhSAslp9u5sTmNjWvYp/ph5ILuNXLE
 ByZKh9HfNZwgsbT7zww==
X-Proofpoint-ORIG-GUID: hQog4Kwz0n0lKc2wiB08TLo9oWcj4sJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-Rspamd-Queue-Id: 536EE516ED7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107010-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.103.194.128:email,3da0000:email,3d90000:email];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for kaanapali platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bab654bbd6d0..26a4de9c8d45 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
+					"qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x3da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,kaanapali-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.51.0


