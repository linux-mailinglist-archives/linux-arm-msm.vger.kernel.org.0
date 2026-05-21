Return-Path: <linux-arm-msm+bounces-109071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM7nJ9YKD2omEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:38:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E561F5A609F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68256315B2B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7E23DA5B7;
	Thu, 21 May 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyFDOQNa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hleowvcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66083D904B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368826; cv=none; b=du0sxw2RM7B7navciKUY4v05LVxg6G7bNiy+pAEb5QZvbXBHuyvdpN7q6DslYplBoxcqaCqDeNruclvv5CpUzXwVrLLOtJul+y7pMWP7t4NFlANftBxecbJiosFLTE++0IjjPm/rz7PFTRHEEO2MiNDvIi119Da4c6jrDdjFqNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368826; c=relaxed/simple;
	bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaNmkcJhdc3cFzhkd5Jyyl5hmxdQ4SHArALIqGVN165dOtFMOISEiF0QLWjbDGxKYLo8wkiK8vg0jxM8YWds91hlOeHykieUM54RQ0M3/nP1+YEiD7wwF8Af52VfDmiyI5bQj8pDjTGMXtZz/kjL5b3HW/smn8Q8btb33MM0VIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyFDOQNa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hleowvcj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uhW3343625
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=; b=fyFDOQNaZuMcx7ws
	wNW4y2VvTTsaN70dxYfxZG4ZNu6lNCLEJosBF8TsmyVi+wJ/YDEWHVqx5i+tBXpl
	2UEW5ggABXsAfAEp1jXmfx5AFCVCOBn4lpk9pKvGh/9MKxqcNA0fz5PRPbTl0ase
	bkfhahC/uBwR5q4WhMd0hUQje68WzQSVC4TJTNxk+3MNleQ7NNeFu01B2tcHjsz8
	qpDTpGVOzvNFMM9AuaNq0Qdv9vAy5d5lzbSqAhYBIrvPLJHWxhePKH03LOjn+4Mx
	lXxDFI+q4whc0tx8IgOyzpQXVlfDY6BHrP+i//xg8M8tam+E0rRpY2Gr8MMUydqB
	BvgoTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahsdkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828f0f5c23so2924846a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368822; x=1779973622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=hleowvcjWmbk7TxxAjcX0cxc0xEjshP+vgC/sL5TJOhrnfZueA+hf9yzwoxhf78Sni
         bjh/tqZav3X2HK3yh+pby1JN3EcCaI87xlL12p0D7RS0yDNCsLGY9AZGEp+szSQSlyVK
         B70xMReRxIh0P7nU9YtLX/+p0ERWQq35EiFTZjTU7t9vkyDmxJ1UGWzMr0aKVbKFhhxD
         uHY2bi9gYKbcob0jDfsxxX7oz4RKbt1hwLZAce1xzLAgHEH9FCPBSx2uybYhRP54vulF
         i15Od3PknKnncNWX75HZWvUitScV28pdJJb8AqlybgRMpF9Cq3gg53f3JB0pJcTsow8z
         kN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368822; x=1779973622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AUDQsQ2outLuOjNI9ORXJ27URAcMQbP1Y5RcYCfHI44=;
        b=H5+oGbIpv+Oao8ERqbbaj8RDwLAlEKVLmgnu9Guc+8nSFehvgvIl47Sjsv9CEQ1SHd
         Cv4eoejzug4OA4mmUtSbs2TSfhaHbWWL2UVB8ZRhh6B4UPRLLNDd4o9P9eQwJQeqxNuo
         gR2dQ3yBV/F+zxJmD60m0VyMS1VpjP2KxwfDgkcj65LvmMqTb75jEzKoGorANiHWSfcu
         DNVF2kNZeOoHr0N6GDM2/PG77DNJQmVjVXUohCyPUvUqA6HcsBkCmGJTDEAuPB7gJ5fD
         VLR9PydY8jw5bgBIcY6tZzGWI2gicSL7A2SD1JlPLgsMD2m1gj6LLf9bUwL+YkLvLq1k
         LS9w==
X-Gm-Message-State: AOJu0Ywr+T9mLsHpD10w7L5lWarMhkRD5sKtYW0S0GB6SdyPevwvL5uf
	KG0uZPkhqHpovV0Kpf1rEpPtdqI4uTu7E55svzEksHIH9ZxBz0Uy4QI5yeJy6ZHwPaYPRE0X9bk
	7xUcquBW5E23TwrDSTNdfAH5JlS8t2vB/gWgW5tyQ4MUgkFm3kKzqu/yD5tiawAyQ6wTvcXqCA+
	eS
X-Gm-Gg: Acq92OG4NRxL6yNoT5Qid7GUBwGHGX3tfa0QkLUJBv2qoO2TVN3B3Io41GuYWPapA3f
	06krmWJW0/dMbwqMrh/2diSCW/XLo6nIq1lkEIKBbg7pMGrM0S1TehRcf0wXrga4nilpsWGje56
	q7aH9kog14AsJ+Qp8mWA9oBOB+Dljg9nD/r5ShZv2VT/Ry4/EAliG5blQerNvS8RagRraMK+ztM
	aWKcZDzWWqiB/ftDiAn+IauNBYQZbm5E6EUOdc6HcTng12l5HqawbIGJYkD3TrN6Uw3s5sv6lrW
	XVtt3m7fzk81htn4+s+1qtdXxyuzrZNNBy9mvLDPq7d1+FEgYnSx6NSI+9TsS7Oy/ELnAKJQS4t
	lsfylZKqPFEchasg9k0ualmafJJePQn72E6Tpx3zSYsosBxO/hrcvoIce/G6CQu3Br1Q=
X-Received: by 2002:a05:6300:2189:b0:398:b433:87ed with SMTP id adf61e73a8af0-3b308b3cbb7mr3652004637.44.1779368821679;
        Thu, 21 May 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6300:2189:b0:398:b433:87ed with SMTP id adf61e73a8af0-3b308b3cbb7mr3651947637.44.1779368821176;
        Thu, 21 May 2026 06:07:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:00 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:34 +0530
Subject: [PATCH 01/18] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-1-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=966;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=whWAp+INItUIQjuUf+3XOOZ4Nif49970RqMMkGBDhSQ=;
 b=bxUKQXfLdQYKJq6ikqV5bVd/yC3vExDy5QoA12C6rjc5hSEmQmPZppukoy9BkQzSlElCxJk+A
 Q/LUeR1FPV7AvWUEkEpNW+f8+nuFGshYbmeFKbRZ3zyxTjCKicfA0T3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX4SuHpbBJe01u
 /ycR485llr5ZMirrhB7RbYlZQ9LM85jIAJognpEgYFglqMu94nkh5F5y/ex0f1Nk7H50gcH5HKp
 HPdJ0V8g7J+TOJ7LESBVj2jUptF4oNc1z1hfvQiP+9zZW80nh2O6ruy2ITEDaBR7NDki98UqzuG
 AllJgWKvkDSOPrqVKCiMSoDgxMGw2wHmdqWnU6A0i0Uv7zTgPRcqv7cpIixqvzHo/9moowql5qZ
 YSQe0n7UVuWdBcMns/kcwJ68Buufaokv+rL1Ij6NeV66neK7oGQZswlBHv/3A5JGo2RQqbkQd1N
 zfihZJ2wcrxd+vYniuAk5RZknCnWyC5vVVKrT4Bv48o/eZHoM640omsm/GZ/3FAum4CuEQip8wr
 y2SAiwyiwMSr2K+eTVZIdvWNQa1blsJjDyCm/WTKEOlHklMzF5EHVpMhETKxQ+nqli5GJ1Lbb7t
 kLI9ah/Q7B/D/b422xQ==
X-Proofpoint-ORIG-GUID: wfcUsmfCGIi32CiNssT9xpc0Gx9jl_Pu
X-Proofpoint-GUID: wfcUsmfCGIi32CiNssT9xpc0Gx9jl_Pu
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0f0376 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t4RzHNKIQDbQSdFyBH0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109071-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E561F5A609F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 082f7ed1a01f..302c88c47960 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -251,7 +251,7 @@ &pcie_phy {
 
 &pcie_rc {
 	perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default>;
 	pinctrl-names = "default";

-- 
2.34.1


