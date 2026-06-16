Return-Path: <linux-arm-msm+bounces-113366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2F5C8AgMWpMcAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:09:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCB68DE80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SeJ0tgmh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="c/Owo2HL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113366-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113366-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB4FF3009E13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C93C42E000;
	Tue, 16 Jun 2026 10:08:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63E9428849
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604526; cv=none; b=kNaySJ2UtldF/mpw4rl9+zZL/L8QAHz0OktxkLpZhdV1UEoflNQ2ILnLdYUZQ+jBo+044ys0ETZcw7c3lT8VL4ZgaZYsWzkfx1Frg+4ftBd19h8U2CgT/d07njAhU+/Y1AQFDIk99Ag+Xi45JWV//ociwh+W14lgKUoOXyKC908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604526; c=relaxed/simple;
	bh=Cam+lRe8QqkoGafgoRm2B2QogdzzLxofKNZhDKv8ZdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXrAfTqKFlKrO2UMfh9kOIy1yerEwy/Hc4SlLRJQ+Z7fYh+qH3DVwF4322m5YG57rTwuGpH1kHUEGWAEOaA3Si/0zep2EeVykiQD2nKaBtAWKZSBw859nbKp6iWaG4GqU58Pf/4n3Y0jAqDdf3qRVnYMJh6klcEIRLh2TPZ3uOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeJ0tgmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/Owo2HL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64bHg2911779
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCuohMbpxCw7pt//XjSJR0I5DVLs6HUVuEwQ0utUTZU=; b=SeJ0tgmhrLAwjXjE
	U05MqmE1gNlQz6t1nMuwJdQevQeIIJNH67GZ3oz/hvjpZtgQUsWKCq4P3vAb8avv
	PFdKsDiXQvKY6HxKdR6idNeg8gCKvIVw8wqTf9MjPWRUD8ICwBCP+ZmcfIR+O5IH
	MB/Hi3b9YM7NUMkSq7Fl59R4MjqHXOyPPm6bC89G0vgoHqcckIFlPiJyQBlhrL6A
	qHM3cqLmjvyIhlLPuhWDXX/XDkLNY7DXjz/i/wwtEFFNpmcCuP2PRnpOVM+etc99
	h4UXyoCWTwXgtxoJnbLEQOJqQ7xch0l16zLvfmFgbw0VTm4cDpTzAGdR4Dw8GcBx
	Y1qZwA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52seh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:08:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-307fe856724so1536473eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604521; x=1782209321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCuohMbpxCw7pt//XjSJR0I5DVLs6HUVuEwQ0utUTZU=;
        b=c/Owo2HL7pm28+eHPwkyn43VJdAjINMEIRJKEmjwxgn6ZBloKE5dBp4fgCTzp4wygd
         mcJeWZAGW5wqWz2iCx6Vmn+ndH4j3ENo50PHln6RoaVPOB+QkS5590lc3/OGVvs3O5cL
         MUeiZwtvgnsxyQQg0XtozfXExdr5tkJDKogQLcjaLwrHW9J3EknoHOs/55JTAVly9zup
         h+kiADMVITGWp6wGW8+ct/G0ebbB0AGXmwTnE2zU5vYa0LEENi67H9cFNNfWAn34M1LB
         3hwy8/KZ/m5zPsxg4d1L9jM37kunaDjE2Sl8O31TxFhWzd/OOuJHK0ORcvkQy/oDmKx4
         1e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604521; x=1782209321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MCuohMbpxCw7pt//XjSJR0I5DVLs6HUVuEwQ0utUTZU=;
        b=FeaWRrPtFhe5tqm4XUl+mGAG8iqoa7GzwTftO6lfbvFoAumh3AmwIBqsJvHxlHc7k+
         wCV8V/Paqonx98goV4OUYlE9Klep0DsdS4o/YtpP25AiLqAJMIwimzlyTXfX0oHr/zqw
         teVEbqwvTftqthB5yJXeNfR1pSsiaFqvF/ynqJ6QNiK2UNjlDiFGBse6lqNiA0P97HY8
         Gqwx7+QazKDWH7Z03v5yDy4QuD6ewpytzLiAyddr5jaVTkjvpJ/lffibFJwKbPCuYLVn
         ENhRSBuKZWPlfvmx8eSKBr17GH1j1CweA0bA3QRH8ioykZbBz4CTtEjipYO864ucogEh
         FA+Q==
X-Gm-Message-State: AOJu0YyHQLwxuBmA2LDZ3M4y04cO6zQRFBMvf3Bmr5ykWgn3U3w9rCnl
	rPp4Pc+bvwaaWaV1195RO6xMXZWh0HRVIFmrs4Q5v4NtLrXppfL+WDU7IGZhwPh2qIFOjkyIims
	YATquZ12D0Gy3Atxzg4WVvmVRRMwcruWJTU5qv5GIYKrbpawRJZQUhGSyNSPPSdgSKIGP
X-Gm-Gg: Acq92OFnyekqLwD4zRFbHGMSg7lDeRnQ/5njIQIWOUj3jNUPs/IADYKmC+PlW3BFjJq
	M5ZMX53ui0i3yTRESClea9qeTU1heQZSHyGBQKZEKjubzmab/y26HsJtqAajeWoH6KfD8V61WmL
	muydIY7XGun77drQSSWj9AxqilbigGlVjrHaL4OPyl7vkwcYeTjyi0lckFHLs3YBhK7a+vHu9qq
	PYC8r99kk47R6DO2PvhPA4s4+2RcZXQ7gO6RU9XH3h79zhYcBrA13rOvNFgFuM1OIUQNnWujCSp
	XuFdHXmcMmsK+x7VZ7gHmCEyDVDZrZVPzzxdPOUoAt4h3HUePqmzrF95yNamVIwdXTMEy1oRlan
	ge7Xe5biXi9sIVxX0Q4En/Ob8xoMr6dS4euMRA/4zj45wXtBxIrWdWbMiUjyiYdO2L22aGVdhng
	==
X-Received: by 2002:a05:7300:1482:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30ba5985551mr1760327eec.11.1781604520784;
        Tue, 16 Jun 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:a05:7300:1482:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30ba5985551mr1760292eec.11.1781604520331;
        Tue, 16 Jun 2026 03:08:40 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm18401484eec.5.2026.06.16.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:08:39 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:08:27 -0700
Subject: [PATCH 4/4] arm64: dts: qcom: Add PMIH0108 haptics device node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-qcom-spmi-haptics-v1-4-d24e422de6b4@oss.qualcomm.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781604514; l=3992;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Cam+lRe8QqkoGafgoRm2B2QogdzzLxofKNZhDKv8ZdI=;
 b=OWdm/RwW9Oxof8vpRTnu6O17HJDW2pOobkwXGQbS45ugN+h8l3vLtxd3wRMLs3sg3jBDkThVx
 7uOpgspJQSRBFY+z1Pz+V6Auy4s5xJrKbGJN6a5sZwsJTeLOuJ+Nq6v
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX389yexTtxKQi
 0GviylxISwuXt/pB7ugOsDjGE/bsEMl9I6VM55qWPR5l4Pblthnkvo/2edLya5SnCzkNWMTH5Ic
 B07oHOrfw6qTQZFQTQAu1WsjWSEbOzE=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3120a9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jWoQrppvmuiTGUauvUUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMSBTYWx0ZWRfX7nvweWAzQPv6
 FBYyNLHYMvWAyfSNEPlp1BYowufjDCxgoyMkqvaDZNzsYaCCRzvraxDUsqbXX/ZoLcXaRJt8cO4
 ohGaml9sjFth/6GQNqmvwYitgWlRW5dJTuxer3S/69LeS+qAr4Qpsa53Cq/fNeoPsLxOnmNbxJm
 kKXwlRerS19cRqL29hYodn2+8d2/ayyle8WGrpghomVIqDyZ24Rwk/fx1cEQTFetoYFgpdzpV2i
 9SK/3J21Fx1Ut8YIrF4jMALpIsm9VGYOoaJivbuwE4wIg9GTFtK7aq1mxP7M+IJwNyRoihrLHMM
 AWOT7dMl45Lo77fizamI8IdKC6wMCOqI8lcovGkpr7Z6Scv4nsMMXYh4o1B0AoXMQ8CYoL/bxle
 5T1o1124tW0ieF+GztqdX5UZCiCqf/VK28JvMOZ1OHVkCzqqqSD7C+6F9uMx918BAHeUad22chJ
 A3cv4DezDQdTlTpougg==
X-Proofpoint-ORIG-GUID: HynT9xwgK5xG5z6dEOnlrC-Ej24PKTqF
X-Proofpoint-GUID: HynT9xwgK5xG5z6dEOnlrC-Ej24PKTqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113366-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6BCB68DE80

Add haptics device node in the PMIH0108 PMIC base dtsi files, and enable
it on several boards according to the LRA (Linear Resonant Actuator)
component mounted on each of them.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts       | 7 +++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts       | 7 +++++++
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
 arch/arm64/boot/dts/qcom/pmih0108.dtsi           | 9 +++++++++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts          | 7 +++++++
 6 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 07247dc98b70..7e3f59fc008e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -952,6 +952,13 @@ wifi@0 {
 	};
 };
 
+&pmih0108_e1_haptics {
+	status = "okay";
+
+	qcom,lra-period-us = <6667>;
+	qcom,vmax-mv = <3600>;
+};
+
 &pmh0101_flash {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index da0e8f9091c3..0865afec47ac 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -744,6 +744,13 @@ led@3 {
 	};
 };
 
+&pmih0108_e1_haptics {
+	status = "okay";
+
+	qcom,lra-period-us = <7692>;
+	qcom,vmax-mv = <1850>;
+};
+
 &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 
diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..22c83c549ce9 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -59,6 +59,15 @@ pmih0108_e1_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pmih0108_e1_haptics: haptics@f000 {
+			compatible = "qcom,pmih010x-haptics";
+			reg = <0xf000>, <0xf100>;
+			reg-names = "hap-cfg", "hap-ptn";
+			interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "fifo-empty";
+			status = "disabled";
+		};
+
 		pmih0108_e1_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,pm8550b-eusb2-repeater";
 			reg = <0xfd00>;
diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..d942d6c2fd03 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -59,6 +59,15 @@ pmih0108_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pmih0108_haptics: haptics@f000 {
+			compatible = "qcom,pmih010x-haptics";
+			reg = <0xf000>, <0xf100>;
+			reg-names = "hap-cfg", "hap-ptn";
+			interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "fifo-empty";
+			status = "disabled";
+		};
+
 		pmih0108_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,pm8550b-eusb2-repeater";
 			reg = <0xfd00>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..7a3b8c440d00 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1138,6 +1138,13 @@ wifi@0 {
 	};
 };
 
+&pmih0108_haptics {
+	status = "okay";
+
+	qcom,lra-period-us = <6667>;
+	qcom,vmax-mv = <3600>;
+};
+
 &pmih0108_eusb2_repeater {
 	qcom,tune-usb2-preem = /bits/ 8 <0x3>;
 	qcom,tune-usb2-amplitude = /bits/ 8 <0xa>;
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 801c46d55602..4a1079984307 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -933,6 +933,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&pmih0108_haptics {
+	status = "okay";
+
+	qcom,lra-period-us = <5880>;
+	qcom,vmax-mv = <1700>;
+};
+
 &pmih0108_eusb2_repeater {
 	status = "okay";
 

-- 
2.43.0


