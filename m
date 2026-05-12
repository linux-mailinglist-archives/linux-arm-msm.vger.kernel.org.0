Return-Path: <linux-arm-msm+bounces-107166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDHTNKl+A2rS6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:25:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5066B528A1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF7763101477
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABCF2417DE;
	Tue, 12 May 2026 19:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHIi4XZO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9O1eCYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1EB35F609
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613745; cv=none; b=jHquUDPwIT0Si/syQFUsuNPYFxzKuSPbGE6y+uf1dIfEFgjdp5gT6DzNL6ONJ/SwmTdBTJJWK6vrYoyZpEbopkqyjYv5gsel86bEYWCeH5/DWKfvHq6Ft7CaAA6nvBdsjwk3y/fj7oMh40q8DgyVv9+7Hzg76yuNVbaiulwFus8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613745; c=relaxed/simple;
	bh=GnY9q+Xc2Y+VqHrDqGOayOA+eKomJ1efauJwSslPH28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNmiBNFteao56vOwkRpD7vknfFAm38N8F8IflIANXorEVktx0LkghHQ2Ly5sOCCHM1lOadiqmCZu9qAOY4fFJz94+Mw4jsMKcplVGOEM/FWZjbDUCv6XXh9HzpBgcKC71/GIDUm42niR+lrSkir2a9+BJBQGaMUweiAHlny1mpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHIi4XZO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9O1eCYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CChPW91410916
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=AHIi4XZOid2bnlQb
	QIHtIk5OsfusjNOScnd7fdBKK8XoScIVE8weXJViPK6qOIkFnMDHkzuSXXl3ya4/
	bpcD4oP4jkNV9ukkZTlqRsMojjMcK1FyOWXrq/O1YQbP3t3mbQ7HF9qYAEw38sTo
	NKvqTZMO6cNaXE/9rcm+9nzEpdMaHDd+VT2BCuPUOMEzlz3enK4tIcEZ2XYxYNf+
	1M/xnjIAeV42EbXcQzJuamxAJeElG+D9nzcgTUv67R3R8lHicTuNTbMhksRX1Y6B
	fvz0WGu3BWiBZ0eu58gVfp2UXR8lStUa34jyR/YzOBDa5Nf4yd8ZXKmsa+Vs6Y78
	lHA9SQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f31hd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so107291495ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613742; x=1779218542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=H9O1eCYzZ12yDwj0lP3wcrioD4DE3pyNyuDr9yL5mkjrJTRKeZfJdy/LFG0MQUlw1s
         fWyneesOboQ0Zt7OGWEQ7UXF5a6SqlpwpbQguBMSwNpBbyQybicNzcZ+vNGyQBc0rfto
         sDwr6wPrhdXnxHpHkoWcDsmNikKjWZg18Jsanm4dQry3SkCLK/zY1jD6EsOqovy2BzxF
         NtbIN4OhChea+yuTlfZWitgpOTIQ3294kLXLcPcyaNPV9rJ0aYLNxC88mzLQXy4524TG
         aRLtN/B5JV75HZiEErjwZgiwKTyHpUrwiUMUsmRUl3HCk0SffKpoquq98pZEyVhjOAWu
         PGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613742; x=1779218542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=tTWsBSb26kwPP2SXTq2BBPrLhAls3bsPtGHu4cL4GUQ4HuAKHRcNdwi7tbc04lQwes
         IqSWtviskRvcdLGWZPvmfAhWnx025pHYyprAcmphV95skCaCRz4GKT2bkr0ih+s0tZK7
         jWIkzthLZQaTOBFdxn5Ew55tERP7qISIAP2mwUEc/BwFGi3/LA//TjSz1oDtE5nK1nRi
         zDx7aPOurSZBayuVjB4gg6Y6Ri3h0JrKAtJBW8I1pAGPnj22o4RMJKetUIGonRIbYbJE
         ItrmDFeLLOw96v6fVA6+K1SbCUqj2YpvVRLOAO4MjCy/GcQUU9vGWFiwpGJylxj84QpO
         NC6Q==
X-Gm-Message-State: AOJu0Yz5RNMDifwOyLpGx67HUj6CRQXNu9vW4PaTkXfO1XWBC4GGLfzS
	K5hCzjeUr0WUYZSYnKjnSgMR9qy03Wmp7/enzhsq3GQuDq63Yn8G0JHBd95tM7fCiDZiHlolvZd
	4rYGNxIWwOGt9D0D2V/HLVNgMmxsIKsAaeIe5y3LRLLMDqwzRxYldXoOMAonM+rzh0AXb
X-Gm-Gg: Acq92OE+cRilNymrtBONDs8/RO/G1picWlfX4OqhpQ2i0lAVgiqFmr83rmQHUeHpHMD
	0X4ul+PAeIQal2QrG8CzS529Fs8/HmjhaPlxS+vkOb9DWFiENugpZxkqUxh7qYdD+cQQA9Emah9
	qjoVLNdFXoMJh0Sx9N8pMYxb5G0ExsKIy6fh98e60mQJ5SRjGL4gqEGODwEDOzXrJeD5F+kp6uC
	b5xtZfPTLgxSEKYNafU6YphvdATI9GO8It2t4PjceYrkPudLuxfJ5z0ZNz/9agZ09i0W/d+GHaE
	SenLHssUE93KIJaqBSidNyyqHmPNA09zfLbeyAj8wKsn2ntdmii6AY/HO9w3cCdRDrLTjFV9JbO
	3Ural091+8Vflc7vF7us+NBqJwYqAIWbuztY+GniefmfGLg==
X-Received: by 2002:a17:902:ea8b:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd273a8a92mr2765745ad.11.1778613741942;
        Tue, 12 May 2026 12:22:21 -0700 (PDT)
X-Received: by 2002:a17:902:ea8b:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd273a8a92mr2765565ad.11.1778613741469;
        Tue, 12 May 2026 12:22:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:21 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-4-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=2464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFdQhBrAHggcU0GWES+ohMA4WsH2wnpDPMNFqXrANzE=;
 b=qewqACwvjsAf5rvaenjM+cLqWEE+eh0c4Ai2zQhfpx1rVMx5eMwCU4q16+hHSs93d6WWBiv12
 Z0Idzufub4tCvGngKqrEcib/6jgSNpiH55A8CXbP5MkDaWFgVCZm9hL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: BBh-4YribDbn6NOR1HD6IHzT14KE-dvk
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a037dee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX68EOSCZa/miE
 U7iMliaFL0KU0devPqHB0QGaNOT5INWowWVAyPbJ6/uyDeFDD+VeaoWTsXERxUL1UtfZYyX5S+A
 q19bVb+biHyLih02tPd1IsBP46SU34aWBBvqk7sjO2bjQjwSiCrqZzm66dJt9BZPHhzGtmvAa5f
 drVKzgjIuju1r0EcXnZKNkYjwIlkb66ueuxvtpT4lJAHMOsSBwp0Sh/T/VOx/qnrivaGHRA+DQh
 R1sCVCFrtkougFQttzP0ANWg8ok2iVWhNaPHFrRgkh8OFfcDSUPFYoz450c8s9FTSnEWqE6mZhV
 T9g8dwV4Om62tX+HJZkuB5kv83nF7cGCApF6NII9jozY/YKBYBaNaF5nAX14wspHz+i0fyA3HFa
 BfnXXElpv35DSjbxLs0gaA0oMjZP2kOZYuU53UXxgo0FQxdfj0hp3eE+jGbkCn+VPxaJCPqc7QB
 Xn9KF3oDldCndLaowaQ==
X-Proofpoint-GUID: BBh-4YribDbn6NOR1HD6IHzT14KE-dvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-Rspamd-Queue-Id: 5066B528A1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107166-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3d90000:email];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf..5e76a0d53f01 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,44 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,glymur-smmu-500", "qcom,adreno-smmu",
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
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0


