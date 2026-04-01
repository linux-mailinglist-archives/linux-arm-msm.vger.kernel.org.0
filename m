Return-Path: <linux-arm-msm+bounces-101384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCZjGIFlzWmMdAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 20:35:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0730E37F502
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 20:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AA413020CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 18:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8D147A0DA;
	Wed,  1 Apr 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA5+D+Pi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVBOUpwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7334418D7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068533; cv=none; b=SF3Gw4sH/u3SsJ3hmg0wyaewRUl/bAq50SS/IhrR5XQt5iTQ7kVS9A81s5GQZTTiNpl/MphTjM/kpyiJNEnJVAVuYDDjj/PA5xxYrIbYsklQia3V8WRktVMZ6a7SDLU25JXh8Lp4WLC3hiR4Wexx4MApPmdVFqq7BUvO5XqcrGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068533; c=relaxed/simple;
	bh=q/a+1Z7Bcoh81uB7j3ETlggSbfC4HP7SGQcAffpd8GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KF9C6oe39xRPi0RNXW28OQJNQUb5wyvMaTxbiUS0X6fVBhRV7boKt8yCCkA3Zo9oNl4j6Yu3VyDYgoV6Gj9RRhcl08oj4Qrju4YTT0x+M5y95rsh71+IqrM8rgGo0hcnIgJPV3HZSX+kk9zQVcsGP3ePsq+mxzNxYURStT+fqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA5+D+Pi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVBOUpwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631EQ45V1882180
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 18:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	buEWTnY1y0nTx16HX/xpkC0Y9x5VrlhbmSN6bfTQ5eY=; b=CA5+D+Pif2Ko5z7w
	rB/8BQRE9behSlH5Dy3ynWvODIQ6ENfhDIyjRM82J3SzLrrXejh7DYmBCZgEOjhm
	Uxhli7igbhcMJW+OE6Xzqi0Yj6nQ/4SQJYAoRBgC3jD9j3BobX67N3h7S7tG2yml
	oNK7Iv5XaZ84iJwdaVKtBThyrtWZ02AKVfu6ct2DFTUH6rdhRPxSnc8Ybg6uI7J5
	E4bykXUy8ZTwkhOWM9+FXIwvLwQLp5XhcunfCYRHBntHJ3oCFbKR2Tx+PzU4ugBg
	HxtWigmWcVykOpZEPMQ3ONg18Ae0tPomTIja5kPxl+p16OvvGTN9Fn+Oofa1Pmwf
	C7We5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954c92jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 18:35:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0be75dfd4so171425ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775068531; x=1775673331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buEWTnY1y0nTx16HX/xpkC0Y9x5VrlhbmSN6bfTQ5eY=;
        b=jVBOUpwEiwcb4coXUwY5938bsRBA8sQTtI3VDXVkeafMINva0WHjUMDRvRFmHVRhwH
         16MVnUIoeYsDKHgpMFuiSIk8vfyJZWqZturc6erM3br1sat5iWxjqv9EvM3NiaJDLorO
         TMLjafOcT1NdkMbtKO+1bpgkfo1gXZJNy1vYlkRyzykPYwPz0h8SbzLpjjJzZajzq8nS
         +Pga/nmNg2bGFwe7FVHSdv2j7Lol85zNrgFZehUiL0ZrpZyCjRvFofyNCetStVC8HaYi
         Hq0qEDnN2p2y504gP5lvTcdOAlP94nytVCW/YY0kKzCVj42arlKv7ij99SD8uOAOjfX/
         w3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068531; x=1775673331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buEWTnY1y0nTx16HX/xpkC0Y9x5VrlhbmSN6bfTQ5eY=;
        b=iUa99hyoOkBApY5t0mUcdX5GdbVJydE9uFvo4uWe5mNH1UmYTg6qa11vc+9Hre3Xux
         K7Ire8XeNoymCCcEcI4ykfd+7PmkCFogUdaT0Iifq0y3oUu+vTEdWcMjvEPcr9rLPg+P
         HqyT8b68qn5VWYFXv8r+HLEZli2bPHtdUSBSEg28BkdqDg9YH52xQ+6Lh0HxHsdHprw+
         aTSghd1wZKFO7R4AXkbY5aXQHWwL3Y17CPxaPkapw9AWQ0KCWeczAXq3Wr9zqKoro0TH
         8Htd6sIMx5+1fZKEB7eSdIEgpxxSTD9lXg/7jxtzVh6Jme2P5XHrZUrClN8vknGgqw4N
         lAYA==
X-Gm-Message-State: AOJu0Yx/G26KxkvtJq7moJN/8/4AphPguZVHsvs0NkA0sWcQDJrCIg/A
	q3QRwMrtxVF49pjALSMPi6x74u5XpzYsJb8EVDL8m3ZNUmlBiQfvqGIZBODiA5rTO1Wgfii0QAH
	Ufw3aTKxzb6B+0jJLN2NdeRGTJcY8FknMmt+qLBEhAyel+6BGMuoDUQQ+pLm4pnWgj8H3XXFqFS
	re
X-Gm-Gg: ATEYQzymaRuo7bxZ9UtQh9Qa4vo2NLwomVMmGeuVz2WgLU5D/57CLpEwV34JWMfaEmv
	RjRCSgpKqLLkd/74IrvL7zrAMHqq08Ul2Is022CSh5Sw2YRn+KELzloOc7Bs608WPRvTpVuDQKQ
	DInJzRsnOYiE2Ylz0qcbgcbjqLUjjz06eR/+LKst1vUIXj3SF0EWC1Dz0oLRnwrJff3Kk/V+tnH
	bzKc3MPKM/I+YMwE9yf3zWEc4N3IKJXYUbw7eqcUKABFqvvgvhTkxFu1Ajw5JaKdq1ckDX14N6X
	6kW83L70YPmEufYPZlOZQG4lzrop+hJgxrkOPQlbDcZ7SJYQh9bvIR6XmkFSX0ELqcUpcwWaGsL
	bbPh049CoMy3KzTgZGfLw1d7ONI8QeGs/Ur15AR0Y2IcAsaODbNnMcpk=
X-Received: by 2002:a17:903:40cf:b0:2b2:5be3:ba35 with SMTP id d9443c01a7336-2b269d224f5mr46611895ad.47.1775068531056;
        Wed, 01 Apr 2026 11:35:31 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2b2:5be3:ba35 with SMTP id d9443c01a7336-2b269d224f5mr46611655ad.47.1775068530613;
        Wed, 01 Apr 2026 11:35:30 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm5717965ad.42.2026.04.01.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:35:30 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 00:05:09 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69cd6574 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bhJ4FvvW0HhCVhu0n44A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7HHF56UkkN8XRvX9Uq8R3-1VOWyA8hGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NCBTYWx0ZWRfX72I+ThcM9PvA
 bSSZ4WTb7PqRAH5fKJHCkD+iCVVJU7qiSSu7GD22dNCFNQGKzSf/W/Gnzu1XgbBFO3g8gCgQFe7
 PXlCtH/t3sH5zXg/Vuy21SFkEYl5QyRWIq0LhPUQ/38eOkgV+ry06V7IZ+7TbqHrg/GK1VJXpSw
 EKoxNhI13+JiolCfeCWi6mXbmJ5HGZojflKi3kFJBWwqDBKN4VX6A/5FDJOcsfMgFGo0f5/9olB
 jadfSSentowLoBhdeePqUSzQaOsjLxfu7NITWfDAHMVYFMDyVLmcC/tnt/mstJ0wiET576MnZ5o
 yuHsVNEU+lU0YMiiALP7jl0JqvXmGmvasqwdfAI0h3sIU/Y56n86hAwzTOV1zaHe0iE5H9pb3Zr
 vkpHhyEeV/HY5kxGOwm4bIPV4lx67Eg25/OH9qviAufVLL0cvMMFeH/z8NoDs0t5cvb2tS5OE1/
 Z2XvzGiR9wNLR4YZj1g==
X-Proofpoint-ORIG-GUID: 7HHF56UkkN8XRvX9Uq8R3-1VOWyA8hGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010174
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,1d88000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101384-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 0730E37F502
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ICE register region on Kodiak is currently defined as 0x8000 bytes.
According to the hardware specification, the correct register size is
0x18000.

Update the ICE node reg property to match the hardware.

Fixes: dfd5ee7b34bb ("arm64: dts: qcom: sc7280: Add inline crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..ed8361f79e28 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2578,7 +2578,7 @@ ufs_mem_phy: phy@1d87000 {
 		ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x18000>;
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 

-- 
2.34.1


