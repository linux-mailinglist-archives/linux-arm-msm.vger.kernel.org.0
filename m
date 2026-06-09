Return-Path: <linux-arm-msm+bounces-112131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wlYuIzrrJ2oS5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:30:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42D65EEBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:30:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JHnBmgF4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WXctiO8R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112131-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112131-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2BD630CDC58
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F643F58E7;
	Tue,  9 Jun 2026 10:24:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346723F8ECC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:24:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000647; cv=none; b=ByQ5Y3XLzPw/vp0SfaQ5XXHg37s0d+PrhKajMwzZ92346wYSwzh4lR3o7w4GQ53UsbzRkxnik7SSXHFWyfsCTAxKX/IM62JNwuDlvn6ly5OCqeQNvMnrEhAYyBuCCOa77LTiOJ1Uh6oPCSZi0C27YV6nXujWmjjQv/n648tK3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000647; c=relaxed/simple;
	bh=wfQ1JVa2OEIPjp2oLJEIyFWQZK2eWFd9pxIhDg2ya5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i57r/F5yBd/5pJFC/LUv/iMlsqYz4KW2lalq4lf5hIV9eqnGlPp+Em6D+eu14SbepVxDHLeoFhUVCrldwVsLIdsVUB+q6IZldYrekSQePv16nQrLyHsC8UvN+VuiHNBzKPPYjU8QVD3POKSM6OyiHTG1ouSe3bwIA4tCLPIN+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JHnBmgF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXctiO8R; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vDaq264341
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lOf6/MoXl3oRGWQ+ijQXP6yP1mY0/3/cDLi1MCkBDg=; b=JHnBmgF445AFD8nf
	2A4chtlAG4Rp5NNybbcQLHLyviagAFDTj8DF7JkTO5NnIfB2Fla7BZg4GBhmIIaU
	PdRzgnJ2kr39ZAB9xurKs65xI+Hj233u4gYr3bvIDqF90eUEMkyLc4SVbbPAnu8v
	CmoTL07g3N9rO2x61jxDarDe7JWbHrOLkrfIhJIO3t2ozJXuesCS8ckgX0QEOc0o
	8vUCPGykbPnMBC58DPsa1Xll+B9AgI8RpPUlWE1QpM39pFMDBKGNBunRO6zE6dv8
	iOYYQMculLZX22l1oKo4gxgtxg7068GxlNmJnJodi73emOG/c/w3SXRapwsOec3T
	PJwvIg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0srjaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:24:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so55589955ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000645; x=1781605445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lOf6/MoXl3oRGWQ+ijQXP6yP1mY0/3/cDLi1MCkBDg=;
        b=WXctiO8RuZJ5Wemw4pQjB+/nQLXpIQ4oG6cZC1LA0PxZ83iIcdVZ7qWOJoFsG/yEN0
         OK6287hh9oe7MC4OI/ugzj7Ug+nBUJJad1CZ8+6teoJKmUpUd/kRQDRnUCbXquAOdRKF
         f3Rvgr2Hf8vLZUC90Hz6QtUxXEFczr+wxZ05LQ2HKsiHthJk7hnn08KniLT9MqzLhKaJ
         zlLq2Gov+Q1mca9JR7nptBHMMUR/TB73AID/xeav9kA7QQuR6aNlz90yGLcJC9jNgNYW
         +k9AYRgd5m6dTuB5S1sXqvvWg+K1+jz85PB272uLPVtFArJAFkBZFL42BJHUI4UADH+L
         +y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000645; x=1781605445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5lOf6/MoXl3oRGWQ+ijQXP6yP1mY0/3/cDLi1MCkBDg=;
        b=iK1eVwkpL8xSn93OfE1/CCUZy5b7uyU4cw7BnkGtD+lgRuhM1tIAKyqOs6WmLv69vN
         ZeLXu7DKZqR271yWzWWf0Qrl7fLQcJ/MgQu2EIRIV5NmvD6+iMNE8r2Jyn/UyvBXj1ij
         r9eQY8rN5j+074L4xiuu0d6/m+x2dHUb/E4GQSMv+9TS2PawY4TC3dOIuC8ycKQagl6D
         zg+RpRZhl63JR6EwDin9XuJXI0lMTUsuh7FXC1+KGVyRX53fmfrPOPECLnWEsGtZCyG3
         bgYZTXiPA9unHMWZ9TAq01o0AhxlCu6bjtquDHMfG5eYS5cTSy0mWUhsX5+lMlSTgUO6
         6mjg==
X-Gm-Message-State: AOJu0Yw3ldDKzztrlSgG73U7qf16yC3+4kmfmAfcyoqZdxHEjOjwfW1t
	eWRsJJfMDxgN4uAvYsMeT+zYSgHnFfRwCHAxKQ3JTw9lNUYacYHea2bRQjvE/1IdTewKTXGwaYp
	of2MGd2eXEtUNyBWdp9adx/o4VsovhWqiYHxP1+hcsWLg8pryfTGyoOxEeJDfpUnthKDu
X-Gm-Gg: Acq92OH2Fsg21/zr1oQ0HH7A0nKd17sf35NhQMO7l/7N6PX7sJdxcFAFvf/b5olwSAZ
	1R8iA0dEF1tDZzWGFUs4xltqNoKk6JLROG+okdUXHT/UKMayvzCWquByKcFtEqMISVI4smdqY2I
	4w2KB1yhBCS0MOVB8L1cLr7xluj9I3+yaqGbOCH0jmHGVB1kJaTeyC06imKceCpq6pbYufkgRcM
	PsmqsS+PBAtwNsKdn/kJqXl7VUpuAzZOE3cOYkw1Qo2qhM7OmM+sT5euX6o9kgjvrfVb0R0j2LS
	YAchXIxKnUK/AYh1OXcsVlJ0ChdeGKF72q3ifUuUVfu64AX1J8kAa6KEccNCYx6DZcJJux9X9mX
	h3PWKqmWaLpamJvHFkGpm2B3fN/6CiDS3PbrXGRrU6Moonq3q7f5etx+g19srqQ==
X-Received: by 2002:a17:902:d2cd:b0:2c0:b74f:a58c with SMTP id d9443c01a7336-2c1ec7972e4mr162852305ad.16.1781000644711;
        Tue, 09 Jun 2026 03:24:04 -0700 (PDT)
X-Received: by 2002:a17:902:d2cd:b0:2c0:b74f:a58c with SMTP id d9443c01a7336-2c1ec7972e4mr162851915ad.16.1781000644212;
        Tue, 09 Jun 2026 03:24:04 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:24:03 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:53:03 +0530
Subject: [PATCH v3 8/8] arm64: dts: qcom: hamoa: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-8-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=3485;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=1/EBgOpAhJyMtBEb/QMXo2jKvBNr1eZw42mUkkravA0=;
 b=iBqU+QWhGahbBIaNjO09rqJvQRFgRBcByvlyNfbQAEP+QpP1HG4jrGCr2q6a3/m6X/IV9HVxf
 FJWa7KNPGOZCkmc7HQx/4W+J08E1hpNOvFIOkmZorftZLVyueq/oVkm
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX6hpehnZH0ucU
 bRMyqAoNlB65U6i8g+yIYE36/ym25LN/buQeBSq37YWd8HYPJdyTjT9+Tp5TuA6PEIbVkNBD6jJ
 3z9RJQJ1yeVQ8OJNM6NE4DX2+JJx7aZOcRfqCrjmS/tE8PnNYP6MTz8jcOqeGVPMl94cV7k1wtV
 0KAyuCvZu2wj4el73ziK/3uXPmbIUOPqfKH2GSXTHXtD6TW1dJOmu0FiyHBmlqyf++fJGRXRjBp
 M+Z16sYGs8typjsgaN3frAoKL7hIidejBCy65fl5lhvrQauaYFpDaaPh4pXqmaUWmbFYvpSPHYS
 krdLso7Ty2rvBuC4Grqypy8F8F5AwzyUL/inl2OVMtptZ+IaGwD4g4sYCDyCMig8GKUoR3IfE5q
 b3KFC3Iv6Fy8YyV/PRALN2SIBav0LlxnH96R14fhzhnDqHoOKbH6oxMV5WqU09Gda34V3vHT77y
 PyO4kV/JIEj1hbwhDMA==
X-Proofpoint-ORIG-GUID: oAk5QLmK3Q-rFUpmR8LNeMpckViiOKU5
X-Proofpoint-GUID: oAk5QLmK3Q-rFUpmR8LNeMpckViiOKU5
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27e9c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6B19zR5QVkII6VYPc-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112131-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:dipa.mantre@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B42D65EEBC

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in hamoa.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 95°C.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..92daaf4890aa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -8815,6 +8815,9 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			status = "disabled";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
@@ -9402,6 +9405,7 @@ aoss0-critical {
 		};
 
 		thermal_nsp0: nsp0-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -9411,15 +9415,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp0_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp0-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp0_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp1: nsp1-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -9429,15 +9448,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp1_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp1-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp1_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp2: nsp2-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -9447,15 +9481,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp2_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp2_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp3: nsp3-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -9465,12 +9514,26 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp3_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp3-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp3_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {

-- 
2.34.1


