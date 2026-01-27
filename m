Return-Path: <linux-arm-msm+bounces-90873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFYqGbUReWmHuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:27:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9799CD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 688593011B6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF6D36E462;
	Tue, 27 Jan 2026 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVrlzJXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sm/DDENu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB236C5B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542038; cv=none; b=oFmSMl7xzVYer3MHqxFJffVqnEX4ipeGjeMgeXnQk6t7a4+cWa7v3bY1kzEgbyZFxBU7sWbCnM8vFplV4AZ5EjYQo7L8OWlc9UtNO2DrwH81g+vYY0wk6jpaS49j26OF3LgUf/KIxg8Xa/hrMaHqs0R3ThrE6goYnGZfb4BYsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542038; c=relaxed/simple;
	bh=vSZFJNlN6qqaATMmPhFNfzELRBaXsIenPjZTaoKki80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViBxikb2L2lZkv4qmwbuzvSjm0sfEr5jM320ixUUPFppxsrXhQdcGwer3iFIpHBlKtDSc0eJz0deZdfnwIjeaEe7WOL9/pcTw0uHy4CPfC22peSIA0H6kAm1An7zgEmIS1Qj4FvuOAi6e0SgJxKuf4gvPXYKwOjC78MGynQ629o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVrlzJXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sm/DDENu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhcDQ2477239
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tuv2CM/Pv8ftgiZOhxmVb0LJSvxTt50odthKY0Xr490=; b=UVrlzJXQzAgUlDJK
	xhxwqzxd8b2vTUUdUeP8cu7xHT+iH9082e5o6zSLub1xqhdu3497ay4J0VIs+4R0
	allnpY6DYHHbDOuIi2ApZX55MvOsQ8YOKWJ0PGfeDldyd7Z5cheSR45pqZytRmkL
	pdNqy7kWi0s6kMw1hQQU9BNeXjQhzsXwDX0W6SDoslHiqtyO1g0BY6myT+KCAXmc
	Iim7zrT9w5PLMHWIlr5Xohknl4l+03emDolUeAYRMQCOyzibz0SNbITezrIgmZaW
	8IHXP7Kqg1BE3et9Dwndy0H5sZ1lAyHS/mU8o+CwRDDFFNiafv78axkNCY7SMg8u
	Cx/j2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y0bvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so54455655ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542035; x=1770146835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tuv2CM/Pv8ftgiZOhxmVb0LJSvxTt50odthKY0Xr490=;
        b=Sm/DDENuheHLIfSa0RhrR+mH2d4/+DmII+msjY2Liuu3z87Gct73ACMJdScOAmXkID
         wpNstCBeoXBxCPYKg72OSipYkqWyO82cLDT3fatjXUGTjk+HZz/qhHHd80Bh95Y7i8qt
         8hWtV0qIxkKhdhdMqUzCECLxcCMr7Dbk6CrIurLd6nOmGgYuqk9BXbvMasi8HILdzxyo
         PGi01juTfNl7znveUYcV4losjG/m18/HgQf08FoS76+ciB2SYFGrdcdDv3bSuCV6kLzG
         e2v7i8lPi5jrfhGCWbbakd8nbZ7VQm8r6yfnCIaYvrl+nkPPyk68sOtCnk6a5u81mEx6
         aVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542035; x=1770146835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tuv2CM/Pv8ftgiZOhxmVb0LJSvxTt50odthKY0Xr490=;
        b=WN2T/hJuTbE01UCyq6fK656Pm8Kv5LsVcqeGyu3Zf+3YMmZb+86P2TDzWARE9my9OF
         hA+SqSt/cuIg1pJaaDL912OzL1AYvmhrPVElni817vK/B+TqAAOsGcEbGa9OT791g55e
         3lJ3UWUXWTowwdo8jBYSPaqYbGro1tAJ8XjMl/oCjutU6f1Xh8kbzgKtan4Vs/tkkYe/
         gB9GpTqESwDxjmEC8xZ7LyDSFrRg3uy5dOBsuLpBOQ5zXG7uueosprxhlxDYQ5l8ExQd
         c4RvIw+SBhxjhzGa7O+xYPRqT/daMsq5/6ncJN63xHzPVrIfQn9/oIoAHk07uge+wK/9
         2ulg==
X-Forwarded-Encrypted: i=1; AJvYcCW8TuxdVjjmygN9Yet3dt9wUV6EVodTuiJ8DHMdd03nIA7d/69+vYyA/4UE0K98lPqEvm8U9UX5JUHk0Fr4@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzdk/HZ0m/CwJEMhXqMNIZeNn18e0MiiCaUruvK07hTJh2LiO
	CdKIazAvlRmv7ToBqF4LrfQg1hZaENxVH+gaEObYprYA2qbFpNfQLgPBGN0qlNy2T3kZOebIQmz
	MvqV8MzU5Ekftea+/JLKPkI+tpSMkCow9BGzkGRy9nU/Z3sXSsYpw+6InAvBc7OU6WELC
X-Gm-Gg: AZuq6aLu0bUAPXw97/HLuiIqSugqiqbOaCnD//D+xwCWuwwGPWom0qrYzDQTgejq1jQ
	uqiGXX2Cxxc5i5XVg16VjnlyF/anN6nSzpkEWCgJL1B9yvDQM5uQZ0X5nZ798/jaj8IgWf9Q/5c
	pegOMxMey4WHrxYTf/rbJpu19x5dUZ+DYyptvOfl2xqfUyUAHr4Ur56gQOvWRkYC9AflYpj8NnU
	ktrxmE9hVx5b99oZAJk5be92nFovfvpqFt95fc8pZ6nik07wWacezWwPhtpNke0qJwmLhfz7QNd
	LZblwJ52VVOKiKxBxEtxW2kJStx/1GnI7zukwJXHOGGA9vaCq9WMpAEZM1tv+bbLnYeUz/4dEHy
	FEUMPC6hEBMg8NWAKaeiQgRQyM/OjQtAHp5i75/Hy
X-Received: by 2002:a17:902:ea04:b0:2a7:845a:7eb2 with SMTP id d9443c01a7336-2a870db3f11mr29517995ad.14.1769542034843;
        Tue, 27 Jan 2026 11:27:14 -0800 (PST)
X-Received: by 2002:a17:902:ea04:b0:2a7:845a:7eb2 with SMTP id d9443c01a7336-2a870db3f11mr29517805ad.14.1769542034407;
        Tue, 27 Jan 2026 11:27:14 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:14 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:37 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: x1e80100: Add CAMCC block definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-6-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: qCfwa-SqhWLjzQeX8fCXXWSMqKMI3UON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX1Cj92+1CeKo1
 LBhZnPkEYHliLq9EN6rq/fRXlAtT8Gg1pjIoLb1DmxJIwGckWTAOOSnkSj2w9Aj1QhnS8txrzj6
 JxPxLAB7/kytgqgIhlXMpIadME3AlYePVA0zOtjAQmX791qwVsdD7P9Xg0J1MaVp2nePu/BuEXl
 t4umZiDJ45cv0c6rLKiNY2XoZoVjpo5cTrBzY/fDxbyVLS78c8VeTeRRPkIKz58+QNBy/VmV2CI
 YF6gamXQXdJqmfu04WTMvyNsjxhActKXx8ijsoQARX5rIYukT8/oLLLNvohKNaSP+k3oKqs+mUx
 jZEeXtCn6PsSVHJRjIkBEL7uNC48NL+2T53tYYp39vpmwjFKhbPR/8ghi/BxdeHrTA3g9dphdzR
 3uzZEqV6SwIJSDPhZC/Mdxxzzl56aMuMR6/wLeTlw9Yoo8GmcuELdmjQo3rj8uNp1djr8qJatNY
 2IujZxOA9QxPWxkbPpg==
X-Proofpoint-GUID: qCfwa-SqhWLjzQeX8fCXXWSMqKMI3UON
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=69791193 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=blghiRbc6UYj-mkbEtoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90873-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,ae00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23F9799CD3
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189920a137169b14b607c6acac6ce9..029ec012d0a94b05f8d4356ba4a95badeda65c39 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5464,6 +5465,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
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
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.34.1


