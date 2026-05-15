Return-Path: <linux-arm-msm+bounces-107793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB0lEQgAB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A825554E351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6260B315B315
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD23E4779BD;
	Fri, 15 May 2026 10:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K715b/JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyMalq1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C747799C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842001; cv=none; b=l6goE9YpIFASXi8fy/cin3Jq1j85yWto4hdUHy/g0D82Mijd8dWKIjmw+0Z97E6wTQGstZyFxIf9eonVFVkQvgmXlKt0dQHWJxDJ3dCxGJJ/54+fMeKAQQRBe0xTz6NkBIF8hxLItOPhkONJjBH0oQp/Z5corLkJxmUVql4vsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842001; c=relaxed/simple;
	bh=yUPwZ7nx3sItMNqsXllva4yHZXEPbYL/YigcpkHAKIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/Lo7gejSn9tJw1fM8Sg6WO9O4J6iVTbNStfDjtkDdKs6q7xbsc7t2tiitl67d3XrIJoKrYXJBcAM/brTsrmigOUDTHSofIADIkegV25DZNTp2dIsZnd0aUx1bNI+46GvdKSbCTwLaoe3BZbPEzbzlP91NwrnhiL68APos95Nhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K715b/JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyMalq1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4p7gM4008230
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyod1xcUrYgx9CzChaNG2Brzec+ACoqmFiT1FPPZGdI=; b=K715b/JHzQf8iLxU
	/FVLy+ixGyjQ/202GPMRJE+FOp1u3dd8z1FodM/gNDLTFXH3GfB3tyjomiMHLmMz
	je8Wrjtt24ZnTMoYxZZe7mzL5KFS0zr4eEStLLBU624XPZcrEB4f0USI7686PRWs
	q8Q2yGKoH/bYlRtIhPhKt68lDFG6x+MpBSUIoXEfbZ4xmzysjSr5wmRMsFxnAr/V
	e2dZVz+n2MnZb6/pFxoQ46uEjGDMjtyy7mySo6xdwoBCIAvASlAPAyiVDJ4Me+cZ
	eg6XhBuuoIY9mpjZpkYJEqy7RenXqWFRijJUJUwcHL3S8AvFWXQMhEEIMxSFfLvu
	1tgo3Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stwpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:46:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so157279835ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841998; x=1779446798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyod1xcUrYgx9CzChaNG2Brzec+ACoqmFiT1FPPZGdI=;
        b=QyMalq1AhRaPFVnRWBd81HkLyeN0sEjarb1PbLwqgyGX2bG8AEebfp7FuXl+BBjFqz
         2LyerQnzlobHEzBQVTZM/ED5JaV1OZBOpEDza3ixhFM9qr8yUnEI0sjQM2sK+8ikBHEN
         90S9I7QFZMqqZspX4p14U27DTpbqD6I/y6xZ5j6frg8PEziqA+P2+V5LItQ5YooHyfSE
         EsIWQle04g0o8SeRyrKPcBvtJKC6CtYPKpfhs9uV/Ctpu0MBxq5F+SYHNsUqwtBvPntr
         CoKv0YR24QfdCLgLuFBLbRpdMCo5bw02GMmXED9IU+jGHpF86jJIogACxjSrL0d8Z687
         g1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841998; x=1779446798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyod1xcUrYgx9CzChaNG2Brzec+ACoqmFiT1FPPZGdI=;
        b=OUVDWxptO8tCC4wUCIZAaXhUUSpueW+8vSMoMNN2dbkuK0v5VEFhjglgRU8FKS7AgB
         MoIzcaquYATcpFtn0bHEVNVSRE0VCLJBpPoyG77EeSHwe96eNFLl4AjIw57WjCn4tKzV
         hz+k8fgeeL/jXACj4P7D6S8QLb0/s4ACRu4FcZs+Cm7y3iCh00Uaa+6Kd3/NHdR1li+A
         OZizDvVbVrs5AI6ySphVfRmgZ0nYN2ulpTaY7ZP7s37skzIK7TyEohCSlsTzU0+/1ovc
         1wwdQrlZ6HPY/6GN4sHXRqtl40x4Ml1yO5vy/3uUuQojPcbFVT9TVa71YUpGhIbsfrOe
         XjRA==
X-Gm-Message-State: AOJu0YyNcPKQAJ3fp0Er5p9RxsD/fXGsKsqCtDRzN/rQ5lSTlGLVOVY5
	Ql99QXTxkm3WuXwRELyAmHxbZ9ZFA6I9wrqkEjcLkCjjeNnYsd0f7qRcg/8iHgUZh3NXeEqVwOW
	OjU6wdBv6spUzxxHXJQ7hz2WH9VPADuQ6UvshAYdMISxDqHXVMExQT+Z/vvErWOnD07m+
X-Gm-Gg: Acq92OHN328GiNZ8fvr6RDT367/JW9IHKm0ie6VToiXjQ4jn3NoWRVcHS1qlE47760V
	0Vjpp2WQIQ/WygZ9J8PlU1h3kJGDjg4Syele6AwqWnc2mtHGv2/TObYrWT9FRxdYwm+ilgi2bW8
	qh4FFWcd2z4/YHirxGUkZAHOumino0fen3dcj7qowNd003qJ6Fpq7QNATvFdt8d2vRH3BYZa9dY
	OapFHfifA6B1Mdp1kM5IRAHI3/Nw/ZgF4MrHksHGdlR5rtjBe10YbfNkID/NcPyyLkCyXAwxd4t
	BqgerMI1EG8Zci86pWbfJriX5YsbBsH+pjcWlL1ugybOUqjO01kKA4iEDtwlhY/UeahdAsPYWls
	AxIA7t9s2rqV4qJJ/g9QM2R4Mc4Kj75WjE5eLSpTy1PRWd837IIMPlBc=
X-Received: by 2002:a17:902:e352:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2bd7e8fdd29mr24875845ad.28.1778841998465;
        Fri, 15 May 2026 03:46:38 -0700 (PDT)
X-Received: by 2002:a17:902:e352:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2bd7e8fdd29mr24875505ad.28.1778841998028;
        Fri, 15 May 2026 03:46:38 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm55839755ad.13.2026.05.15.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:46:37 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:16:04 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: shikra: Enable ice support for
 SDHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-shikra_ice_ufs-v2-2-2724a54339db@oss.qualcomm.com>
References: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
In-Reply-To: <20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: WH28yX7jP704YQQ2PSVezr8nimPL1i56
X-Proofpoint-GUID: WH28yX7jP704YQQ2PSVezr8nimPL1i56
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06f98f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fg_DINg97nz2W6SJEv8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX0uWnw7izZ6o0
 q89mdSShlFdSytJO5N0MMSk/nGPQqJ22cBjwmIQfs5paBPnx445MTLF9i2Wt6Q5QgfIetsMdx95
 CUHuj9YFSyOdPqB8/+B/Mxzk5Vozu03hkWbQS2pEGvkFjPgEqJ68//qC3EqkJLTfoe0oX/VAhRB
 0CRl0fAY3N+9UO1+Cz8d5PNqfEam5u+ZNdch0HK8GkZtpwgYDmww/NUG7WuJEj7UyIfOOaAVQi5
 9Jg6NyAE0mC2ttrZQr+FGkO7Rs36kvGkzb+wXxE7ZqEj4dZwdpTWCpwc9IbKfJ5r4cZKC+rET0X
 PIb8efVVSxeZJIKp/BovZR0Rse6mo5KFVhluBZdBUo9EobLpL82fwvxbLYrmq5k1jWMpi35+tPC
 adCLyDFbwi2HPotH6DJAxg3LriGo7o8P85hbfJY3+3F8vMpwu2L87Q/B93uJykEGAz0O2bNAawF
 WnJPpSnszWaonq8xGkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109
X-Rspamd-Queue-Id: A825554E351
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107793-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,4ac0000:email,0.72.114.224:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Inline Crypto Engine (ICE) node for Shikra and connect it to the
SDHC controller via qcom,ice phandle. This allows the SDHC controller to
use hardware inline encryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 262c488add1e..0b988dd607df 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -641,6 +641,7 @@ &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			mmc-hs400-enhanced-strobe;
 
 			resets = <&gcc GCC_SDCC1_BCR>;
+			qcom,ice = <&sdhc_ice>;
 
 			status = "disabled";
 
@@ -663,6 +664,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@4748000 {
+			compatible = "qcom,shikra-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x04748000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmpd RPMHPD_CX>;
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


