Return-Path: <linux-arm-msm+bounces-113876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vK4qDxepNWqA2gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:39:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E36A7ACC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 22:39:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XFPJxlk4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i4GY9UUy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113876-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113876-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC4D9301BA54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A883BFAEE;
	Fri, 19 Jun 2026 20:39:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD3BB677
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781901582; cv=none; b=eotkwporX1/LhGJGLowtQ2GiL7p7HWVFUChwPywiNeZpHi8TMuxpmqsV9G8A8pZMODDQrTn033S/I92IAcFVSuQ0efNCd2fcgMDU4dC3engU673LqKANNUFsyFSs5eh4NPQls3ntDgT8IqTyx2+A+6RPIl/R9cCRsGumqEbKvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781901582; c=relaxed/simple;
	bh=IdPiTr+89NTOkDsqWrjX1ex8thLpD0pPowUiZVQhR5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZyI/o+8F24C3Rd5/P9NG/QIaGr+l+mh/mPCTZ/HVvvldtcoOPUPy/bqjcs9uBDAdMMx+R8NDcZVpu5ZMnMnQ7XdDMFoHgKzpn4pzIeB6qDH/B9W558DprFQZ1Bi0zIbBQ9iQMakKKYjDylCxqqevZiI/uk/g3dMXAmCmlA2Czc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFPJxlk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4GY9UUy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHVc2l1120594
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6mHh6th2THC39sSiP8zXRHuvf85QL4Oc15TqVlsTEg=; b=XFPJxlk4sJA9oupG
	RcCM6FZueJyW/2xrOlYUtjQeX32x0nLXXAYcVQkn9W2PfiXKGIswaFKmWKRVSAGi
	FjqXYtF2/RpKtanqALxhGA3aUDIdDHrShs17In6bX6ahZRP193nQwG1VRDGW921+
	6lGAatdm5fphkC+PC0+P7CtfMzA7xXHoQyEMm104XoBmDtFL4+UmLnezxwlDOpXP
	VH6TtWqclMvG7U+sL5BXblagTh1cqNFZLNUaZDlNhthBHJSbLUu7aSVhWE8VD2Uy
	fue/yT+GYCNR0eWmq5Y3FA/IB5Yn/ukCBlhUp6d1jXOCTag8qIk4UbFzpEOQE9ra
	f9fMig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuvm97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 20:39:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428384f31fso1687716b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781901579; x=1782506379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6mHh6th2THC39sSiP8zXRHuvf85QL4Oc15TqVlsTEg=;
        b=i4GY9UUyoumqdz4okU+2IMbeUpHQnq+tHiSya7cxMXOPk3M0UiyaxH9qdWgR2VsLtE
         edQikUMADNM7d3uH5LH5A9Dp1sVmgVIQs7l00HjoAJX1yUtVoJiIaLr87ZBmwcqyi4LE
         P3GDT1kHe/2VOWPqOPiHU1Bo83YEtXnIgadZTjYNf2Pfz4AXOqlTQ86Tdpz9cIw+5D68
         3sahAz1MfigZcGqt4SGxGogo+vW9XPER14FkhlmPKdUQQRB63eqd0NKT91W/UpfHxI3B
         Tk2M9pjTIb9z/e8gygNdZJT7FGnIWdTgvUETdXIa72jvnx0HbB4wjffWwBOo4GYAhn4K
         7aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781901579; x=1782506379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6mHh6th2THC39sSiP8zXRHuvf85QL4Oc15TqVlsTEg=;
        b=Yr0ZhWkZuzNAGT5ugpPKPurs+lNsLbqQgcubjZhTM0Ek55zqR7PtiY6dkeg9HXu7lX
         +Uc3TMeetqJfRB1wpIv2cPJeFHZcf699l1PAiVFqJO3BFCzLP4IP9dU0BON+l5ldNI3H
         d8nPl/z0esHJ4cDf1BtdjloCdQu/5fGS96KFK6JqNXeJfU89+Q+RXMxZmriwynF5JFzj
         kAFD1EoRYxybfVBrpblrFH+pAlgl0gBRYUxQ9PfNpJ/+Q8ymROzpYTbuMlJqbVjaSJV7
         ev6ltuzIWSw+QKYaRbi4Uc7JDCczbqHARYhRyFc1i9gNEejwz6yIKD9+Pm8gc2CYU0QZ
         eIsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rtWYRIxTochqh4RIZY9ETZ2lILkNr974DR3lXK3kz53QsTExBZKl2Ej7SU9Icbt1LBRZPNLmh1FukyeB5@vger.kernel.org
X-Gm-Message-State: AOJu0YynCZEvu/gunNKe0A0nUdjrZ+dvmOYVlM2mXvSTrkDH0k6lRwDP
	A4elPFTf/dV2RzFJZSKiGcLPq6DkB6DOZx3Nip59xcqZUyH1+bUSLqUWd1tRNDN5tf1laIU4S4v
	oNCIl/iN7qEA/3EH8xuREs6hidBU5Y/S1LjLZInujNkVwEKooRvEP6k67eUY9a5GycqF8
X-Gm-Gg: AfdE7cmN1fkqtHHQqYg3JrJc4NIh/7XSS459DvV351uK5tLhblqlNOMfGZ/7Rty0OJF
	qXs+q3KjV0gA7SwFMiMzlTqK1aTDICdIKkD35+kQdf8hk+PtV2KXs1tij25O0PfIb3yY1PJzdTa
	x7/fd25hyEfKmHQCAOqtKEd7x7QkjqC9uH1AKg4zRf7gm066Fyi4KxO02PdrPErPbb3IplNaN3n
	DFQlg9FrQJh5y3m6RZ4OnH7eA1Y2sRFXUP0742uSw9QqJLZm1dVfidG/gZjsaLn3CzTqUyK6xTp
	rh0ynqm2jdTZmPooRUxuOukAsYHxkU87GUXcIVF64HCxVykxim0+evphyeeOnUZAYPdrpIkF/1u
	HUF/tNJRwI3uY3YF9gRXwk51wgOnAR6Izbe/ZdnKaXYPXuw==
X-Received: by 2002:a05:6a00:1994:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-845508bb9ebmr5453493b3a.32.1781901579401;
        Fri, 19 Jun 2026 13:39:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1994:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-845508bb9ebmr5453467b3a.32.1781901578740;
        Fri, 19 Jun 2026 13:39:38 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm94190b3a.53.2026.06.19.13.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 13:39:38 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 02:09:10 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: glymur: Enable SPEL powercap
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-qcom_spel_driver_upstream-v2-3-a3ee6837c18f@oss.qualcomm.com>
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781901560; l=1091;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdPiTr+89NTOkDsqWrjX1ex8thLpD0pPowUiZVQhR5A=;
 b=a2bYFX9QFXmQuG66UEE4ITsGt5ed+HmoW0IWJj74zrTxkNoU9kGJLeQw3wsZuLdKvP3hP65MT
 7uCQ512DOqxBlAyCwHfh7lyRTx1Oc26Tsmis/sl1EK4aeBJRqVMeny0
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfX9SzrxDMBfxeO
 xL4mUklmK8ER7tu2FThRTFz2z3sIwBVFrOqfiyV6GMDiUfcdGLo/PIgcoqcXIYImfO1aWwNH05K
 MirjcxOqq0KOM/C0pfRrXMzWclT1/GM=
X-Proofpoint-GUID: H2WsOs80FbUFUSjIPc7U6ZbSzdvLkVht
X-Proofpoint-ORIG-GUID: H2WsOs80FbUFUSjIPc7U6ZbSzdvLkVht
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a35a90c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=O8dm-XbEgrUGq90DOXoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE5OCBTYWx0ZWRfXxW/eyHAnr7uy
 wEYnP+3NXtyokc9r3ailY8X+jSw/ISQbJ0IhS1vIUcB0w3hL3ne/zq0hTZiFHoCoReUPqVUzsLW
 J4Cd+nMlaISmh5GFP/YCriLFpcM7/JD5GycG4kFUTddrBts8Bt8jiwlePFHqCQzmYb615bpdvd+
 FB+DB8cwF3a7dNw0p5MbU+0/mnh/0rsD4kN/nesrsdO8dDIb7dSOrTHnZ7QeOgvhrkqshs55ufH
 dR7YI5tS9E9uDekma0WJZJ+RMAqqOeN1ao0oypJjDYi3VUxo4D7vDRJmJ4M2yJ4GN+TKeyaigVF
 jpAk6PwdgZuC+zh+8aUOoqZuZS9RuVx08adksPVZ2nQ76aMF8PRrfE9uw9Er4FrPRqRC07G4wOm
 AKqX0F0tL1Lguqn3cqjcTWX2uRj/UgMV+yRDsEephQzRFvTNJaRBbacv7WFYMtMbwhV+OJOlyTk
 CpVGuDlPufIDrBw9mkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113876-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F0E36A7ACC

The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
based power monitoring and limiting capabilities for various power
domains including System, SoC, CPU clusters, GPU, and various other
subsystems for glymur.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 72c7dc6e4f09..9cf9180e4f8f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5033,6 +5033,16 @@ spmi_bus2: spmi@c48000 {
 			};
 		};
 
+		power-limits@ef3b000 {
+			compatible = "qcom,glymur-spel";
+			reg = <0x0 0x0ef3b000 0x0 0x1000>,
+			      <0x0 0x0ef3d000 0x0 0x1000>,
+			      <0x0 0x0ef3e000 0x0 0x1000>;
+			reg-names = "config",
+				    "constraints",
+				    "nodes";
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,glymur-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xf00000>;

-- 
2.43.0


