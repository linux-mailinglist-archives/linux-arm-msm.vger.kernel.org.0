Return-Path: <linux-arm-msm+bounces-112130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l0/fHyrrJ2oI5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:30:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C458465EEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:30:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CKoBHoI0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GrG9Tgtv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5653430C6F82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019973F86EB;
	Tue,  9 Jun 2026 10:24:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B382C3F58C8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000640; cv=none; b=J7BokZjNLoJ6X5qErtc2eeFKFZgBQ1u74yz7eLSUQfBUhmJIPLsoAcO30JVYXcNeMEsVaw9FbMw37Q+VxoeiESof24noDL1GAWpp+DzbLP56yRFvn4QogkgSxCVR1VUiGS9ArdZgdJq0XsqeCxaBFtxmrBFaiIKlzTQHldh/KNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000640; c=relaxed/simple;
	bh=pC1mGgaIlteKYS/xrkrD3YHJcHRMN75E2Vyo+SLpff0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDNqcm4BPa1GbuRD6+81z94Nm7Z3juhON59SwaXoUTR6RfOIW42N+QSLz9cPoY7Bj3/LjMLSvQq9E4w9ngO9DEOnj1ZU79lE0QKwgXVkieEfw89V6cy/fPqjZ3pAvVDnjB/SwAZmh1ZJKHT0MmJSxhJnUXwDPwUicVWwYXI/VTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKoBHoI0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrG9Tgtv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vL6W1907457
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKgYDYPBlOhtmPoSiz45+kStOgmnZmmTba53sxzPQDQ=; b=CKoBHoI0Zr33eVJV
	VIAvU74DBbEfiBwqZqLPgitceVeJjPfLOk7ehdlakS/pVSDdN1C17B7BhFF2DMrZ
	/F//argb2Ug9PAP+3ZX+hTNxsHIrW5E8gIswxuQIk9/w4K6/4fRR+NBAtR3FrnkP
	GRACSakB1LpYn5y5tSr8LXvuXP4ud7aT0UbYzPqZJpXMw+7+jO+mfHYp9hNa552d
	zdHA5lObDl6DNpM451rlAvwOALvSpnOBuiGg5R6NRRAn280FTwVpJoJyf6aYvs9m
	t5pHpToTV89ahMxHbb2rBpAZXt2MoZ4Sj2vxZXT0BwlwcQsPvN9PZ8sezGmkPFVV
	pyNVzQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr8yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c32faa62so98861625ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000638; x=1781605438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKgYDYPBlOhtmPoSiz45+kStOgmnZmmTba53sxzPQDQ=;
        b=GrG9Tgtv5hMvs56A0Jdo27zV88Cx17LNzG5DapGKb4DPi0jVVmixK+5E7uBWkVBkkc
         CpeZtYyNvKm7rczNIaurhN96tzoTRt7JK8wmCumX8n9I6kOeh0wDTbO90OA01dUS9hpU
         vHNH89sUzeuIysoXuJCZFAHGVDGLsl9gLGntkjIm6ZEQuIJfiyVCKY8ZsJNT6jCc5Qgh
         Ho35ZGOjbVwEQZu3qDvvUp2ajTXc8/cKxvzWCDoXOFOrYxkUUIp32gFsMLR/6LJRQcwX
         M6x97jemPg1l4/Swz79Jbb3IsCmZbAaI6GsT9llMjoUZjtZIS0oz9FtByd5E5MptcjQn
         zf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000638; x=1781605438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKgYDYPBlOhtmPoSiz45+kStOgmnZmmTba53sxzPQDQ=;
        b=O6dYmsuppdSn6EHf02qCDEuaJX8AFd2h/8n1xP4318dWfCrSuxk+dxQcKfMtZBRJXB
         h75WmnBMMDFRgF0ZtY0lbYc+oL1Z9u2Uoht/R4MZuJStzmP76z4XP+DcXLxaqzGjxJlF
         Jurqp/1/fr2IKDd0rzE+XwnCCrB6ucAw3TutuY/gEUmDycWVs1+RwE7AB9kgs2zL0+oE
         Eho5A7sQQVRruE0UjmyKp/CFXwQISNrernj0SglqkeYmk5HF5eh/eWhi1jXj/b7j3DMv
         8QnAvcyjSQVm26KN+k5ZUUuzUM4lZ5CJIP4e7Ikqm7Hi9FSPisn2VO9ORwgstid+eYNM
         RhhQ==
X-Gm-Message-State: AOJu0YwwaRMNGUHpKyar3TG9iMDSyuA9t9rZZOKFQ10dSSq1c/dPP7JX
	OPOMBlGcUtAdvsC6o3WsmWWJnNUeHIhQakxPppOQALOOqnMINk99S3BYQdLUFhCSn1c8H9xE1yV
	BIJHmtAv1jzB2auejmqpkPmPniRtfBhkz+Tl8DnB+Oszc8B4XV6cVgv/WLymNt3+7a9/C
X-Gm-Gg: Acq92OEPHYQQYZsvFfa5/JBUh05sM5LD68p4oQ8ldBVihogTKLfdmHmqFYXJw9vAWn7
	pPFKB+5YqqgMx2726CbAwSQSjaJzWWHNofp123S/DjyTHHCko+rSDSN5D7Rf4FNBPZ3z+XHj7x3
	LEuhupCG7qe1Jb6ROkHNMcZmXAAJ5A2HTzrJCNHKQsrux/g5bNi7DdCIDmCuHz/FWv3sLU5R+KL
	uSiAAWfiRS7KsmieA+yIavXiFJw8My37eia9byfLR18MsXfXBdNY8sW3reB1A9DD3v4//altv70
	ojpDhy9oGZ5lqpFIb7370lxn1t7j+Ish7jIZCnsA3UTE1wc/PxtMU+lQFphyktuCVwLy8Oq4iww
	FcWoZenRjJf9I8xJgtgEicbYwmra8jdrfHskQ7Aq5r59X3omLhiAPKo6VK00DIQ==
X-Received: by 2002:a17:903:41c7:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c1e85e04bbmr218292605ad.37.1781000638381;
        Tue, 09 Jun 2026 03:23:58 -0700 (PDT)
X-Received: by 2002:a17:903:41c7:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c1e85e04bbmr218292105ad.37.1781000637883;
        Tue, 09 Jun 2026 03:23:57 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:57 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:53:02 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: monaco: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-7-291a2ff4c634@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=4369;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=pC1mGgaIlteKYS/xrkrD3YHJcHRMN75E2Vyo+SLpff0=;
 b=FteM7M7xdWvEjlgMVDKv2WluSpXor3Gl6BiLBfPtzDudw48Uh4d0TulEbw9tnYSANrmiWqbbT
 OcXipIfH6GHDahy1oGfSWDMSLQVEE4RMfjz4W4zuyGpg7YgYd3uTcnf
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: QF3ZvhPNKrTwmXhMmGizg2dHt8_8LbUg
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27e9bf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WTijfvStGCArOK70lPgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX2eJcl0LieqEb
 ksySRl37tiNRGuwoaPkgGhu7cG3TdmlB3qRYmJLIu/oJn73I8r3PGxfpotRh3KKWyXOs0l2hvLQ
 5KZezW2WGBWBGonv88hlUOzjCfQAIj1qfg6URj9tYbj3YlSjDX/Eug07XO8r8Sv8KAyG3fVE2Am
 J4VnUrhd0RcsE/ArAMLWp6OeNhiDo1TiKuuubwZHe0XKZFqC8k6sBSWaJa2l6l4+tVeAOdJBs4L
 KqU3yov5KM2Qf2s4xucLMyhJeSIeck51fxuCLtAauVIuzue5HzG18TOO7xXTRfaU2YtKNqNGW+n
 n7znxiK29LZn1yHP3+qMJnucji2ELAOmmsSCJeSoM5CgLSepwd9NKP0TE7Z0Jh+W6ZuhwXmtTpv
 tnc3uDtcu8rPBQuGceMK3/6yM22RGguI9OGKyQeHerFtmMeF1YGX0x/3N33sfGWFBIrdXDMDKOG
 ENVxP38LwTabBvbs5IQ==
X-Proofpoint-ORIG-GUID: QF3ZvhPNKrTwmXhMmGizg2dHt8_8LbUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112130-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: C458465EEA3

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in monaco.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e4c8466f941b..1756e8423a25 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7728,6 +7728,9 @@ remoteproc_cdsp: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			status = "disabled";
 
 			glink-edge {
@@ -8160,39 +8163,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
+				nsp_0_0_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
+				nsp_0_1_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
+				nsp_0_2_0_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -8280,39 +8331,87 @@ cpu-critical {
 		};
 
 		nsp-0-0-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
+				nsp_0_0_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
+				nsp_0_1_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
+				nsp_0_2_1_alert0: trip-point0 {
+					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp-critical {
 					temperature = <125000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1


