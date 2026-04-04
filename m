Return-Path: <linux-arm-msm+bounces-101804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD+oEQN90WmHKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:05:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9847539C82C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82267301FD46
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019D434B194;
	Sat,  4 Apr 2026 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lp4PGznD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xj2I3XDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB534844C
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336643; cv=none; b=q+VAK5YZf8CHXCuu+FxzlR7CShpV4FbZEUzGUNCXubcBXZ3kbsZ0C+hzkhE/Pn0125E10Is1ojy94o7yxgjn9n9s4x3y+AsrzkNFKKF5RJycsWeX0200y+ixDbnsXxC7IMhspQexxZIvnNNHG+ZB9YmswxkcQggPq6f9oPnLSrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336643; c=relaxed/simple;
	bh=h72hOaaV3Wz2qGo/UxOAQA5Gn/+HYB0fHn+6ChQC/6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lpx1rRdi4yhQMUWxj/JHDSEU6+uqtvIAFthjQw4rfbiR340uafrzIGnOTfV7Eruy1ZAWaqFD4/USJAOa6TPLyiu9vQTUgH5HcktwzUW/R2FPtxXjFuO611A5i2MoGfX2NkXrfkWgNuFxmK12vkHtLPd+uGinIt9GE91lNdWHluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lp4PGznD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xj2I3XDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342q2U92198905
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmtZth3SXSD5zX4iUT5/KNuaDt5932j/HMFP1H0CNWc=; b=Lp4PGznDUzIZPYY6
	AfQDGUfXyOPolYYKX82N4dZAsg5spNO5JBxQr38jyHNLkH3SU3Z7f9aWgWsjlvcx
	2mNsKQfNRKNICxDXQn8uUs9RJcIRWFUcqCCM3DNTsVKoAe+s0vN4nhWFa9twFk7C
	PLmFU29Hsocr67Ex9f16e/7V2SqOn9FH+IJnNCY7QR3NQ3lhLxWIxzAgqyyjphXP
	mVRqF1bPylGfgD4J0vYA9KxouT0xDqaOX1ZZNF+oslxwehl9xpBwp9Br6fiSkBt5
	LD9n9RJ1MmYpslLlH457B7QYB7oWfWbBinO4q/w+UA9P75CM+EpOYJtb8E/bMoAt
	vMijkA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9j1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:03:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9010602bso2798374a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336638; x=1775941438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmtZth3SXSD5zX4iUT5/KNuaDt5932j/HMFP1H0CNWc=;
        b=Xj2I3XDjLBxtv6xoaqslog1uXM5dAcFQqwj/bmixKETN8fx7oUyPqCMueZ0zkzQLDW
         c7goF6vI1zM4yRdkrHX5zh3UT91Ji66XEcJx3Wfw2D3Wsayd7LkeuTXPwiYDe5oUeUwk
         1MEMoT/p4UKj2vJXiVlVum0rMsmJRfnpaCfHm24s3wUEXdrfuu5oBOWIzf78vLrVl+zf
         Dwe3V0QlcOqGC3MPzH8UdJ+iKNLs9MK+sW15TT5E4VGKp2Odl6JMIxzrX7BrIqhrDHlr
         +QvRezaSLYhjNuop7+YNsYPYXBGz4Qaaw0ffEbgnVYrW8smYz53hVvljdwO9sj/vmxLn
         BBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336638; x=1775941438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nmtZth3SXSD5zX4iUT5/KNuaDt5932j/HMFP1H0CNWc=;
        b=DAcoFqRyheOF83b7AlTPoQtMONsGzlFlbJVsMCkHaavSNC80avce9NB2stYMsWtxuA
         FqpIxqYz2xkr9AhB+bE0b9r0rFl/kjfe3xCu1gxFW23EWiF0iZf4k9r+E6gWNX5S+VdK
         Ye/+l2lm7quQwIn9HQBhKFJAuk+hzXN5GtsiLGSgqEfwK8f96SHnuAi+CdpBlE4ZfNAD
         tF0X1ba7kPMb9DreL0ywfh7TgsGLyM5PUtGiXWUK4Cajzk54TA0JvV5fa9WRrMDkTgkO
         0f37BBSTkWkP+CG+y02F14SMHXG6+f7wto7KKk7B+cs4if7w8g+98iWHACIC51QpJJYD
         6K1g==
X-Gm-Message-State: AOJu0YwmY6p5m3ImY21OoLupYISDlFe4W56/3j7OMUe+Tra2kW5RIRF7
	ZvmdvBAKqwSZbnlu+/l4uBhrl8UdreyQ2rm0dzfnpikrNkgvSsguuT4yHDj9UpxEDgFejay4R3z
	HnS+7custNddUQC81QfpzY4ZTHTSLH3H2g6l/oQ1HHYooVWh/Sf6EtPDyGpVpN9VGPTNtGLr+hI
	fC
X-Gm-Gg: AeBDietzptykB2DmspQW+poXL9lMy/SCc0ouoVCRdaPv065BLRnw7wDBkxjY5ESHkUq
	ZWw52+xBiKVq8gLljbVq+n3rTtjN6ITVk2dkEAuS0rqWvI+1Q2eGaFnDHxPBz2nP22Ld1jyE0rU
	/MeL41ompC+95kWUF+JtL7K2srNHgkIGBkp+VWAP0FWh6SvWzdNQEfYaAphc37vRw/Vdo5RXwsS
	Sh8Be5YbMb7BpT+A/J6Cd4tPNs6udYfdVC2A4E5uiy2kYzMEvYP4qtZD2rnBHZobhPrRif7JDTD
	8ujwhlkXtwHO3345dULExkuVxV6poogPz0BhVVCv/h7H3T7jShhYZiH14SWLERQy1qQPRoB+Nq7
	ciEa70N/8GdXhuutd+Hb/64dDLzAHBt3jvSaYUN12PYp+0g==
X-Received: by 2002:a17:90b:2ccc:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35de67dc7d4mr6566647a91.7.1775336638388;
        Sat, 04 Apr 2026 14:03:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccc:b0:35d:a0b7:9608 with SMTP id 98e67ed59e1d1-35de67dc7d4mr6566629a91.7.1775336637929;
        Sat, 04 Apr 2026 14:03:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:03:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:15 +0530
Subject: [PATCH RFC 2/4] arm64: dts: qcom: glymur: Add GPU smmu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336618; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JT5lwnVUisFrhJnFAuWZExNJ4rN4NkpGTeCu4OU5CF0=;
 b=EntZR4nO3H9acZ51Ka46YVBtGA2N7T569x46whj309a/ZNx2ueznbQ04jh9qhZhj54yrQNRUf
 /OsMJuZfi8ZCV5umqob40FeXJ73JFVkSN6c2VyNmHZfAPHfRkzu8dQH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX+pdPDVlxLL/w
 KeRNJ1CkYgQTraeU0vytgpcx9Omzf3p1Agt9MoSRLu3XQbkH2MSoqEQ/cX+2DA+ekp7e86kT4lf
 q8secjWCCXc1Z2AmXUJjOFNEXQJgrPOG5//5+Z5THl8B8bvgtrE0uy+u3Vpnn78rAfF+DnRDMR9
 LplWL4LkY14WeI6rMc62BUptTESct5N60j/FQHz7v6ZmMSZUoo9J5zRCBBM2FTy3k6El1OEwKBB
 yfWfiy62zp7K5en46N8+DwYRUX+N2ih/BkhiK1c7nXOthCeg88+GmTcmwWP2azDN3wbCRl39Wew
 E1n66a0BaBV383QqMCeE1J9Q4XJCNMza1Y9EBMPM3dznO1wNM7XGYcsBcX7saz5lNnFaKpCNM7p
 FMtc5DxCAz/CuZgNpsK83c0H4x4CDJmRtHy2WBil8uqXj1R9CfHePI39Sl0mSE2l3crMdsfRUgf
 HeiiB70ImGZaYL8RVqQ==
X-Proofpoint-GUID: ZuFtbT6Y-MgOX9w-qz6RRmDX6FOpaH27
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d17cbf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZuFtbT6Y-MgOX9w-qz6RRmDX6FOpaH27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101804-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,3d90000:email,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3da0000:email,3e04000:email];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 9847539C82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e65e40857b3e..a3fe2b12aee0 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3724,6 +3724,46 @@ gpucc: clock-controller@3d90000 {
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
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0


