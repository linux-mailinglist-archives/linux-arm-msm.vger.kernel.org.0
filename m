Return-Path: <linux-arm-msm+bounces-101385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGKmBO5lzWmMdAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 20:37:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7B37F540
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 20:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A303E3014FC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 18:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58D9478841;
	Wed,  1 Apr 2026 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDtf3TqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfB4PH71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9047CC87
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068537; cv=none; b=vFa0cpSFSGIRSr8sthOdmczMvjBSD72K4zys+0v16lVJyuHEl8M/Msbehy0apkguvSFitzRq9HtJJH7Ibh+JkEGTe7FEF/uZqCXmk6gS6i4OBDC7f2Qvy2B3u9Z16GDKFs33nries7MWVZHB0DaneJM6UCPmhunPOnrbFzr2VJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068537; c=relaxed/simple;
	bh=EO6wIHJczA3VvsYGnu0L7zmcO4vFjyoJImmYAJYF+Wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7bm+eCk28JzNHgyiU6rYpK5jOIgNmTFVIM8Oti7UhkKZBk1BQvG47sfL+M+UHkxOrrkajHAFCLtKhKR2GsCL7jcfkdkIsbI2T0NONU/guGfntmQkq8Iynwi7jMHQuXX1KEvEtoJH559PyWD/mkRqW4YeqNVNAgL5UgvxpLZIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDtf3TqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfB4PH71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631H39u73364203
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 18:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsX33gZ8f3xGZ42QaWROnuVbckPXzgNU++EAXR8wAik=; b=HDtf3TqHBCLb+D7+
	LxTE+7NK6EL+2Ur8HC4hXHFPv+BxIKOGBSesNESnBOfB4fCVnFhCWHxfotgT1bct
	oKdma3lj1B2Xae+h8tK5mAkkyYAShDfXIWykgRNBfvciZ80iJ3SHyIZapmxRL5Df
	uPuaK2cwqp+nmqXKMdYzoQEp7YyGGBX0Wn+zhU2re8Ak2N01D6UmgKeTG6B5mst3
	xplHoX+l0p2xyNdDiNOiIAyEH8X3W0w2KUKNz28hiAp20quDFJylQ/DhCbcSgdbX
	WZC9mEt6j7pEOT0FpCXlUARORMk6r4wjojUxqTsvorwOrjdwfSjIbWQaVgyyL7Mc
	hgxMRA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e00a1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 18:35:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4120a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775068535; x=1775673335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsX33gZ8f3xGZ42QaWROnuVbckPXzgNU++EAXR8wAik=;
        b=PfB4PH71B8PAFgxuUBAx6WJGCp0axGXrWtaaSyhePUOoKI99uxTwYUODtVn+4jcTPV
         MtZLd7CXJberD9GXhbTH7A2pbUGikIdiWw8JDou1aaSfmlifwgNnKN2NijYWB2+Q5KCS
         n/lFRzxORXv0fvKfPZH7YbdEYXCs2gEfOcTbKvXNYuv2nXok2Q9sZQuG5iN7N2e4tKE9
         Z6AA9/ed1xqYdIGNwtj2+u7YWJsgoNPpCjvjuSOwtQr9oYAoj52iIl6zPPer0ZiQLKh0
         HJVawxHGELmg7SMr5yfmF3r2mtr/svzQ44q0J6XKKK4psUEqKfVqqR3UfJ/JdrcTSRfF
         CJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068535; x=1775673335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsX33gZ8f3xGZ42QaWROnuVbckPXzgNU++EAXR8wAik=;
        b=gExSb4Vli/idQ9kDX1ySuVIU14kMktsbRjoCFPJsdu2tpbI3ZwP16tS3GcWh6kh7wE
         hwkgJroRMHrPTCToZVvGDQXgjZln1EFeQy2bi04ULxXQTNRX6V3XPxTsz+Hgiow3ySX2
         oc2InLSbeF4A6X9ih7ozK0QqGYjC4RqzNJ7awfdT/eH4qIURlUwqqunfZ2qsyOVxYpnl
         TETlbxBr0Rt2OZb/qVSp8P7hZD5kjrjRO0AgcuIwD4xkl/1XOIr7V3kDDaU65HDhKOFv
         nvEFpDn1ikeeIF1usnhM3fQz+XDVeV3zGitvjCGBEh/3RcB1MoTG+VucmD9k+iECVUl4
         170g==
X-Gm-Message-State: AOJu0YyyM9B9w+61c6OBNcXBbghpaiLZMVdSYrXFzc6ngdgQqGr6571d
	876pR2vNDOf9KZ1YyCjQirO9FDkwrz/3n2+asSaud+z4djBCo76UjpPgLReSz5QeysyaP5P3GEr
	46+dZrwwO1uh0WLTMzol4JEwoZoN0qHWJh4dvK2pHEHwPLb4MEXjI0sqTw/8J6ufavVZq5aQnO6
	hF
X-Gm-Gg: ATEYQzyIDCWQhIVboPds2h5oesamtospzUGQ91ERaMVWuaz3lRyLhLko7tlXqoAI/lt
	mteUld9Z6pfH9pTf9FQ8txmNjjPNZpqlO/JCeCVmOphbfzAEFFg/hhROGizL4/aG2A1oLsmuTJl
	Wnvb8Jbt7487b6jWlCj7kPuITKzfhDblqzH9A6qVSn4TSSGACXUU/QdPszCuZ6J4+KjHUyvdZiv
	I2iRuvXGOl9yLfVo7GT3K9L4VGqx4Fi9ri5Nez7VUI3k5ko2uyadYYMWNxZfBueo1R7mTZUImov
	jf/NgE8lBXxNbrKzhDMdFYdZaetOKmlBmN4AGqqzjrkeUt5HnonSOOtb7Gi2CfGp0WHf8qKgmO9
	W2F0BrNdBMlawU44t9o5AIbqGSRz86wudhZS7p+Jo69/TUz8dShTAu1w=
X-Received: by 2002:a17:903:1986:b0:2b0:73d2:219e with SMTP id d9443c01a7336-2b269d0d504mr50755185ad.47.1775068534914;
        Wed, 01 Apr 2026 11:35:34 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2b0:73d2:219e with SMTP id d9443c01a7336-2b269d0d504mr50754865ad.47.1775068534487;
        Wed, 01 Apr 2026 11:35:34 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm5717965ad.42.2026.04.01.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:35:34 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 00:05:10 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69cd6577 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zOmKeGjK1Y_3dRScO7YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 01xcy7OEJfcFpQTg5bmWxdaoJv7gDBDs
X-Proofpoint-GUID: 01xcy7OEJfcFpQTg5bmWxdaoJv7gDBDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NCBTYWx0ZWRfXy8aS/yiBUYpO
 fTuTLgKFbmyxjuMsasUXO8zznvSq4+6G+f4asT69QKKUtXm1L6m6NxnSKWshtOPIppp8dcec752
 09GhP7Xd07bxBB9AhAzPVqtHFI//bcWOmlPz+u+qL/rTbMQZnOa8L9rBz0tl9ihl26R75YqieK8
 4ddo79t8X78zLsnbyk3T9Op/lOG6TSu0H6df4sTCx8yGUjSwf6wtVKTHRPTDjs23JES72X0LD7d
 Hw2V/Sui6Uw7u7ZZ27ANfGf3+4TUAL5obeds1XGbK/51GG4JG7bKwFCBredBO4ky4OrflkihLyu
 5aCYkxKC66YoNWg39akoNr4Z5KEvD/IoOo5tEvqkQLdT8BFLsMSBrZQvQNMgSxUR+x7T2DSodGB
 O7kmAFbXCuGe9TgF8Dmsj96uUwIOlUhB/GaopqwXtJlXSH3TcCRBR0MQp943Bq3nzntAw/SydgK
 433C6WHOBbZCzWsAaCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010174
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,1d88000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d87000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101385-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABC7B37F540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ICE register region size was originally described incorrectly when
the ICE hardware was first introduced. The same value was later carried
over unchanged when the ICE node was split out from the UFS node into
its own DT entry.

Correct the register size to match the hardware specification.

Fixes: 276ee34a40c1 ("arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 920a2d1c04d0..3984d6f8932d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5373,7 +5373,7 @@ ufs_mem_phy: phy@1d87000 {
 		ice: crypto@1d88000 {
 			compatible = "qcom,sm8450-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x18000>;
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 

-- 
2.34.1


