Return-Path: <linux-arm-msm+bounces-113351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sttgIWEYMWo4bgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:33:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D861B68D947
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:33:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mG1n+AnX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q115YO7r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113351-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113351-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6AEB322078D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4696742669A;
	Tue, 16 Jun 2026 09:26:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BAF423149
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602004; cv=none; b=pGQ1It5TYAzVm5t5Vsw3cyhVz4BhZWe33TTmCX5JFqXQHrLUu0mKlHQpYF19uBSzqCqy6mNASzL6on184Eh990AOT82KvrA90RYwS0knQw91/NHLAnU51TUmnleXbyU8ZPeJwqCzle3QH0lBLXFWjGRchEsnZtaFklh5jQ967iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602004; c=relaxed/simple;
	bh=RryLpvNjcnEgufiiYafBW/jYrFGPcPPAHt0L9y5MhkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6kLahwn/rr4y3kCXmxI1PiGqQFpOHDsfBJRiJeBf24Hlu81rgZjtOFoF1amI7zlYIt2P0w6Xme5DzTqkZdbaHy+yVVIYHKPbI0qFvGJnjX5FZe4wwJ4rtxuAotceg/OGTUR0thY4cIW1jCO8vGFuWMlvjjaBUw7v77DOTImgvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG1n+AnX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q115YO7r; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G7I6u52832764
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIBerI/cOjwMX/GlJu2xbBzDngpUe81Td7jc+2YOEL8=; b=mG1n+AnXZZQLKxy9
	LcbmRyegEqN+LD4gfIibl/V/lKqAcWnGjstylLk6dDZChoG/jg7txOC2K6pxwLIN
	PDPYuX+9nTAD2FT0+n7QG0I/wN9EC5ySe16BfliHZ2gxrBXk1A7x9RT111Wo5tAP
	kIYytZIWGqVWhV7kdPu2mT4KdERAFBBrHiH2hRLIB2YxO/7ETuIpx8kSAVyj7rUz
	rtXE1tjBJF8Mely+U1UXh0mSwhMtQDApT1IfSsfrjOl5G1cZL3OInG8dNmfnDKUu
	oJeqtwgrY1johUVaiKnbbEwMEbIW64gFpTAWl1Nn6C5SNl9r1aQXLevhjUJykytD
	FXm+qQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysrgp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2da7fa311so45237365ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781602001; x=1782206801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIBerI/cOjwMX/GlJu2xbBzDngpUe81Td7jc+2YOEL8=;
        b=Q115YO7rjgx37EOcviWXJOFHPqFDFi1M+QngAOszbVMS3PNZJJkSBL9vP9ZqcWRYGK
         ln594B4BVzSclArSBAYzg2QvCJFciNxlknqU8xkXfRaRsp/47aKy5EQy3dUa75o8nxO9
         8FzhD56lr631181zxoW6cVaXTKLPQXGZ6C4xuSpYSEkSzKbPTtU0jXaxRjQsxXmTGEdN
         ftgNRd+Z7ZSo2xo/cA93tMG3njLi0D8owWrXjqt3q00bjvsu3fERReoM1FrY4LNMUoht
         m4ggl/t1xzk3W3m9h3AikFBQit9sIPEVkdk1u7ijKJ/Qg3RyBA/MeyySBbzZ/8KZJbGJ
         Cm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602001; x=1782206801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIBerI/cOjwMX/GlJu2xbBzDngpUe81Td7jc+2YOEL8=;
        b=LuEt1T7fru8xVawqu1kil+4ohalv5PIv2Ug1tr3G75pt1OBATjhSGyP7K/seHBdvV9
         E2O6HeTLKR8M2AGD4aEP2h/9k3KjgxZtwBt7EafHsnDbkcG2UiV4frb6pKgc8Gf9f5e8
         o2NT6ICGVtjb3uce64PTFXSiObCGFAW8N85RUanpzj+jqvvEpIlWAiPCZvEdIoBSx//N
         5yMFtHrIVNc3h3MjKlc1vzLEgHLAIj7UfoPasNld43zE2Lbf7K0pGS4M5hGSvx/ucWoT
         8+hPiO11WEWOKfGa75g0LjFT8j8zS5m1vCuJNpCeSjhe82r9uXCiQ8uinkpGe23l2QgV
         IRsg==
X-Gm-Message-State: AOJu0Yzcl9ixpRAYqsSF49MWuIGJGiW/aYC42vrLLQpONlhNBI4RdZVo
	0Itfo7dvLpzyzmoB3QAjCdW3mQ888HpBFOX9LIY82MImSfE438ENkMqfP9G5tVE1mB5AAMREdov
	o2ZpGza1etsvCuesF2st9CgZ8aRt+zMwq3Yxk3cijagCBU13Nm4lplAgFna6Bub68s+Su
X-Gm-Gg: Acq92OGYGyui1FHkKkCNjzf6i/AYan67lxtPNcz5q484X4ut/XgXac8yvjdwzzN284N
	pioPTyU5PBC/b90z1MxDFtzQqSll8VQCW9KyWwtWkkJsUAvgkNOOgjYhXa7Y4WeG5u0fyz+y5RO
	fvA1dv05VfHH0jB2fVofjL2VG4BOUdxp7mAziH9PR2hkJtkA68C6O477TIDV2ODEcnw1AXNDU5n
	SUX8Q0Y+W4hlHx3k57g/SU0euUf2t2XLxcTBMhhJpgrZCwoiNHMsOBzw0nscV1u0TEjcLNT0895
	HjNTu+art+aT/b8WAAQ5ob7ubeB7h5qjIEjJiheKbziJalIp00X3qUgC7sYaa1vLBMvifOZYn/G
	GMk6wgJolvNT7rXMcrzbC4in9jLw5QkUcdRub3YdRzWw90EmAfg==
X-Received: by 2002:a17:903:4587:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c4132fbee4mr180613925ad.32.1781602000846;
        Tue, 16 Jun 2026 02:26:40 -0700 (PDT)
X-Received: by 2002:a17:903:4587:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c4132fbee4mr180613655ad.32.1781602000382;
        Tue, 16 Jun 2026 02:26:40 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:58 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: x1e80100: Add deepest idle state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-8-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1102;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=RryLpvNjcnEgufiiYafBW/jYrFGPcPPAHt0L9y5MhkQ=;
 b=V9lhyPCgjvFw+PKD4HoMKpMOXDEb8XdxYXuuuxvHbureBOGfY5Jdz4NS2I1KoFNgBWJHcxdRQ
 xRVOYb7c6mhBb5twRJ3t4moEkPC75zcP0Hjkd8laTm0YvF8G3Gi3Re5
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: dDJ6Q-gDLkKWyMwkBTBHk3FcgbbUB1sQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXwIONVnCsRsM7
 sWJobGZ8vfx6tLIk6O5QKqMZ6YVjPW0dMktYEMPtiSJqWb4brsQVBoshsBhFcWQckeZ1rGDWW+M
 9Re/47UZnuM9MH+pEE4JNysnlr0Rae0=
X-Proofpoint-ORIG-GUID: dDJ6Q-gDLkKWyMwkBTBHk3FcgbbUB1sQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX4wWS9eGTBQNa
 KIU9zdhOGX708r5xieAsRJMaXGYCoyPUFVA7AKJqjBMbAR39BZi88zVyToCpbaK9a62op+vr+rl
 0NxEUVINIQ81/cWEDpPlmtBlKXkZhvDaBLmkzdOky3v7+fMhMQu7Z9Vhud6aHRVAXKKw8u6YNjH
 PiRruzIHM+45YGz3LUZTx22l7IozvWOs2ly+AKxaXHn0QUvAeyxk9+FNeFx2qG8O+LtTPaajcyM
 VRiyX9JU2NhleVuTQjH0eLmwdfo3Mtpa6qTA3rS63umOoLw4+dR9YqFCRxlSMbfeAC23tI2m0PJ
 XPCC7oohEo8gmwh+iTz8mThL/nIut9MDD3sIr20wNY9dg1QltBIrSqVRRE+p3J1dpDOBHPF6o84
 9aHh4m3mtc7y3qORILZQhV0HDOieYZ3YIrh8q1x1zK2NmB317WSpDYT4sAmAIi1eT7ISOX9HqnB
 zFYM3WzYq1CBCRLD8WQ==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a3116d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=x31kQvTfQKClviX5dXsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113351-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D861B68D947

Add deepest idle state as GPIO IRQs can work as wakeup capable interrupts
in deepest idle state.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..47e425003028 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -302,6 +302,14 @@ cluster_cl5: cluster-sleep-1 {
 				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -460,7 +468,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 

-- 
2.43.0


