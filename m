Return-Path: <linux-arm-msm+bounces-105232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCMHLyoU8mningEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:22:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE64959C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7283E305FFD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53334278156;
	Wed, 29 Apr 2026 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLZjJxj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PescjT4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF9282F15
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472161; cv=none; b=Xu/7TesAvj1qXHWInYaxwWsEJ3zW1b2YU1ewF2UqDSk7ts/Ak9qv5AIZy1TQiq61MewOdQE49zphxSf5N8aOrdmc9kEmThhvaV51qros6orqhdFolOGt8RBBAu3wC3QwapP6IxCmjGgGBMZYZvO25f52tDeNPYzNDvtBCUWjWFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472161; c=relaxed/simple;
	bh=dkdKTWjiIoTpWTw2AnmWZhkyXS5KUPx0v9M2CLb1BG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=id5HxFbrg2vbvHM6L3dkGw/tTDxN0gedCs65iT/Iii7fo4ZbN1WV2Fxeo3I+3r64GA24d+o12TzbdVNF3K2vC3ZU68XIHb+eX6wEpdrtoBhSk9CsXp3QPOIkAOHGI2KhmvDVJ9meldRugE5FH9+Ml8oV1pIxdqxFqoejnzPsud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLZjJxj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PescjT4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pmfk3752374
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=; b=VLZjJxj/JU1FlGZ3
	LbhNAJmxDwhPSJwT1rl/GwYebs6NikvrXWml6YXWqlGNwCcYiZW6kr67zaQY97c/
	YqIAJ3Ev3u7g9KcgwX4nopQW58wtv84ADoElTAjWRZ3HBtKPnsi1Zmxc6JhuZ/lC
	xdT2huGaGI/bPT0G7QnXjts9r8b7ovQMWVMtmiWWAZmtJ6zqfM9k4/PrwAJBa3Ic
	LVmvUJkpc62Ui0BCauCrH69pF6O/dSlqUoFnMapz0m4qLi1a2yAdMXF3lYWijxxh
	iRmyPIymHcrwJjo7lsnUbF/upnbvE7Vwz9A0M2im6mjXINKN02VvUMRfWgSf9lTU
	ywvbCw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1hvbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:15:58 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-651c92dd649so22818273d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472158; x=1778076958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=;
        b=PescjT4Y++ynOS787853EwpM0gEulvKkszTBWEqHuyJ2gmIB6F1itGonLIhCep3V/F
         fBdhpCdtyB/BYNs6lGsvGKiJM48naiBBfz5HvOaK0vT2p28Pw2d16XFvl9bQw1WT1JH/
         8osWfuFJ1CvMGdrekBae2LHbi6Pd/U8vO+1kfmpgKrvbWR3eGJQDdZJrK76BLTF3JE6/
         tOElTm8DF8E0vN/4u3d/zN4EiDtlRkjQISoTOZfuhutzKj8/eI2tzUbEDp1ANtXL9jW3
         72RHrVnU+Px8HfjEQ73o4ly8o3JxKBdmKnkvt2ZzCiypFE514DsLf2yRtHCSw5smFI5o
         ahbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472158; x=1778076958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=;
        b=Bf4mdBzMQkvHsrGJ2IVxh+lHPWXyWoGKrhzWc13PUwkrBGKqSkbgmo5ofMNHM0wp7U
         a3Pik8w3NIj0JnDLY1eUQEVlYiMtGrvEJBXoGw/1UdUh4Ins9YNS+lNjME68imprGQ3O
         eflwPp3HDMyYUGH1kbeoxIS9YTVl0y3F/KTiItlToSPPyjytRlo+3DCqGPuHb4N4kCoX
         1igScrfUnnnbZll/0vY9LDcXyGtyRc05LzZCnGYkYBfiQqSbnmDHpY18u8h9DOSBRewQ
         F0ci/hB2VrprgATV12RvAH0LhOC2zP970NQAxF/ClQLNWUwbBOsw9xL7mRwYrIoHiSMJ
         jm0g==
X-Forwarded-Encrypted: i=1; AFNElJ9ngArQd23fG5NJjmBY4ZZiGv51y9WwFMP89oDVlCBlXeqbwbYTWTVpoCldyrsT5U7h8EOkE3dI6EBgsD94@vger.kernel.org
X-Gm-Message-State: AOJu0YweuCj9iPXA0pS1GWJ3UcPj/2VepShDY3rw7f3Ui+ff7xMBu01v
	gh1L+byv1EK7eMI5jCeFgyUq54TcreqJQxKIom4fTVjH/+CT4fBp5vgtTIayre68yCNR23/rIzx
	qeS719+EBUbOoBV6e0fzETKsflupszuLnFS/4v37TDasmT8+LdjSuK6IrhxXm63CeqoEV
X-Gm-Gg: AeBDies9jjuDrlJENmtcU4fAsNG6In2dYjxlEs4eCKzxL6xPM0SC1qOsmn2CDELK67a
	eiQYVlali0XZA4Ea6k9xhfCdndfkKgjRqkFeJkVAZSm4MJU2yshTHUpimKkML6wgjyM5hGqxyvR
	mpiYK6UOVVE06vZkS66o7NomDT/iMPyS37y7QxOwieqj1InuqrQDW9LHfS5HX00dZLnuUHcaoEm
	XFna/Y6xB+h0jQ2XIS73PZYSMl72G3YqmrTb9zVCSGopPWnP/SBPUx2bQzu2QLeOlr9q0Z7gxbU
	YVvo8lvZUP4NjfwMA8dRaqIvRp9JWxRnRtllx/qduz/q3qPhrUF0qxPw2mXw928iajER33/y6SV
	7lYQklhJEd9X7UreScmG/fhYkTiZEEpqoOWUVm3KKMQx5g+apz2Ozbau1vhpqC2E=
X-Received: by 2002:a53:ac81:0:b0:656:25e6:e107 with SMTP id 956f58d0204a3-65beed51765mr7084485d50.3.1777472157591;
        Wed, 29 Apr 2026 07:15:57 -0700 (PDT)
X-Received: by 2002:a53:ac81:0:b0:656:25e6:e107 with SMTP id 956f58d0204a3-65beed51765mr7084413d50.3.1777472157021;
        Wed, 29 Apr 2026 07:15:57 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:58 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f2129e cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX6d4Ji4ih9M33
 54PMLMp+hFLpEQBQGitBSVRJ9KnMQjkd/uH04NEr8KInaimQ3YWetSgVmn2wVr4NhE+jgPHyARE
 Sslzv2vwfRbStVuz1Lh0yGKfUNOn+4GbVuzzYoE4REhJo+ifJRbqKXKywqgq6pkiuwsQrZioCxC
 jkKId7CKaGD3BH0ODWdXjWSexZ88wldh46tBo/bYhdlMQBwRZHQeUiuLEk3KFT19wShBjfWTjkD
 xbHOqxDOT338KeCEm6mbUXH5jP2uF6d81kNljSWTAmHUWvbHqzzj4SlW5NntaaQf0UZr0ZsgrLP
 MeO1ShCab8nDPfdm/L/goS+8j2UwEa1Mk9CC4GCTWYyalTLwG9IpuuyasUkoRS2QzpyYJti+Ino
 VHKaysZMwWo4tM4fcLhAGnnf3lZHS4fe5mkUW5yGg/bL2HLW7Bo0Mx1P9+nn3wbzy0AvjC+n7we
 U2synV/Hcv3zCypxuOA==
X-Proofpoint-GUID: UEv9GDm9fc52yXv8qdZiBcrzNR2tICVq
X-Proofpoint-ORIG-GUID: UEv9GDm9fc52yXv8qdZiBcrzNR2tICVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290145
X-Rspamd-Queue-Id: 51BE64959C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105232-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..8e2a872988d1c3d97506856e2e5325646db59746 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


