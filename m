Return-Path: <linux-arm-msm+bounces-112129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAqpHxHsJ2rH5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E191765EF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:33:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hgtixk4x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Yf/VvXR+";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFD9431DE6CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D80B3F4853;
	Tue,  9 Jun 2026 10:23:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03783F5BEC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000634; cv=none; b=deZP46zKbrWFW6N0u+hZRaG5QtMKV3iBvfEZ0IqL2pGpV2MI+BaECOjydqp0eebM8HVhgUdmOOCQ09N2L9+jGcB2xGLZ9lLEiFEbdEye1wNrlGy/Yp6WvZ66gWk1xcMqz5TS/9zCnmwQZa83vn9fFuKvTvKw5XdD0gWTFquum0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000634; c=relaxed/simple;
	bh=a8Ddnn2Nc02nY8QcpqWNes+H/BxIoa1XcjdKvupu35M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmNAAvICExOxnPzdBxqd9sbwbtDB6vnKDbBAmrVB/JzuaSbeP1nkfKViFN5wwFVDonGmjrrvubxFp7mm9kFGciqxZUUs4pWKzlYRFh+9mkzc8lXI6jlic37M3o99fHGQgV4fwjMCqaXJ+e/cmPwUJiiH7zctkb7lz3c/E6eaxVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hgtixk4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yf/VvXR+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vHre1868616
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ+KJCKJBYZ0I9hBBLCHrvszvJD/h6bpPe+WJahV6Uw=; b=Hgtixk4xHCl9Olbf
	2rEI7eAkXRxPojCOJAd63gayfCVoz/Jo/Pj3eZZwNuOXJORT/hW2aw5fRr9+9Sc5
	eAjqZKsy/IxFZFHNUmRN740ixbZTS9WIyfc26yQi3JYgmFEH06cDqHAeiiHQA25/
	RUnnN7HxeLihU9gSvVzQAcm6E+yV3zLZ+9U7nMD+OV3rOnHDeVxe6kTwP76znLR3
	0DguU5+KygXOL+2yU+hAa9p4q1doQJers4r/HxVqhRe0wdY3Q2id1fQn+ND7y+y2
	4gJNVJtrwr+oSkRded0HWj11BWPzX4zjfIpLhm5PKBefy97Qw8OYsIxv9N3r88Oi
	CpXPHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wg7t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so74174445ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000632; x=1781605432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ+KJCKJBYZ0I9hBBLCHrvszvJD/h6bpPe+WJahV6Uw=;
        b=Yf/VvXR+D7ZLJZjddzHy+2nkNALXo3AB6ltsWsJwOzEN36c1uQpFMBft3x7nzl13h1
         1tULJHo8bGB4zrRB9yMOG5mD357MiawXO7SlSoAHgTnfAUoXVWsYdSZz40vmexzhejaK
         PLa3sMBWoY2gat+1LIgmnhFVnj4v2w8qG89jlclOb3yKHJpG9MJTaadfGZTKeEUnpwW6
         LwOXbALtk7aQqrqaLOmEcNjBhdsrnxAEkNkN8i9I/1+Cw2ohBYr+RuHR+He4Hlheuek8
         OzHjnKhZjPK9XUIfmN9FCsL7s1Zw8p00Lkhq6yhUe0cw9M58WfrE+jcHWG7mbEGxS57a
         KQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000632; x=1781605432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZ+KJCKJBYZ0I9hBBLCHrvszvJD/h6bpPe+WJahV6Uw=;
        b=DkSr6NIcoe7XVmbHy/6xUfajEdx0dzlftm7Tpn6VrBsZM/7S1gP4NQPax+uD4kNIeW
         JP6hfS0yK82KMu0R4ZM/Tzbwl/NKvn7OeOku2GxaOKBI3rawsebQj/uI3e41nq2ZUYtR
         lKuWmevqcpatuzsDtZzxZpOyG+L0wlS7DXllHsu/vibIPby/V7uotqkP6YM6wtUGyrxC
         VnTQ9ntRX+vSwDfZpw5ea180j/OipyEBWmIOaRDjb0b7rE/4So8jrYApFiGnvmIL76Cq
         4VJzmL/Ay2nUt8g5oNoOEAPDwZccpK2PRhFRVoqONITcOA75Fc0sQ7DdEsa3FjyVIVRX
         rLaQ==
X-Gm-Message-State: AOJu0YwYoEZdHWLF4p1l4ttC7sKSk1rgostmDbSfaT+iWDNVceMjmBRc
	vy6lF2QF8rHOGWv4pmDZyfa8uBNbdHXZmJEy1Ovkta5BXSG9wWhrNbtRRcpxYVGLy1d/bDsoAsk
	WupaP/00Zt2bc3GoQC+mpEwzNbRZpjM9JMQYHPYJXVJQb9v9bJsj5y4RSsbLoMpYHtoFA
X-Gm-Gg: Acq92OHGk66PqMM9pXSBG6f1IQsWj3ITC2tO8jop7f8uk9s4mfQdng8/Zml0aPy3LeT
	fH0wVf5sCEQy+59ika7xE5cQX4VoC0CuEDgntVCI/5LDhSOcyUG3+O31vY1yhC5tMIBFa//jRyF
	WB2YoklWrK66hW+I6ebuv+NWQpZl3PbfzXkaSn6mfOhL6zVyMDYK12X8USpg+LZ9Fr4T21386ON
	kyV2xT4HrSD6bH8vVvkhno/GbL/gq71Y7fRauhFHOpTbtLmNUYC+0Jq6RGbrKF0iHkFTZTOWTOh
	2imJemdZtJ7AtGqbELYRbBrDx776isFpvmDPTf5CdJHZRe+IVaJBaWtzPlqHRe+H0lI3AUjCoX7
	h0LPpMakUZhR2zoFqT9ojxmTRmoo7Beaoi5AalWntXnEh9eg0zL3dp+CXg0BC3Q==
X-Received: by 2002:a17:903:908:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2a1bc8420mr33578195ad.9.1781000632343;
        Tue, 09 Jun 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2a1bc8420mr33577665ad.9.1781000631863;
        Tue, 09 Jun 2026 03:23:51 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:51 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:53:01 +0530
Subject: [PATCH v3 6/8] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-6-291a2ff4c634@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=1451;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=a8Ddnn2Nc02nY8QcpqWNes+H/BxIoa1XcjdKvupu35M=;
 b=GgB6T6pl0JCdOhwCam1LbdsIaZP77JdccYjBCz/aXaONH22w1yDzdtdx+y+w74SGKIA9OCbsj
 W3NYdg6SUVJC20gru/sXeAX9nui+Vn+2F2ljYGSmMuB3soVhTCyZEjL
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX3mWLE50oMins
 w3aIDbECNn2psdaoE4XJB2bknLd2LFxWQG8j/LRSNUtrk+JZlDel3o+FPdjTN9pX5t+SvD++bTv
 qDCg+8HdEUmiA9uBOqxJCHqcEmYyTIDAlneO3VMCqeUOlIMMhLNrKOwcTY9wWhkyfTMsjeWx5y4
 Hx+BRywmMW8HT0wtqSFABAhFL/Y5iJmeDyt3SkLGyFANI1PZzTnZp1hKC3VwaUCBwrlWxm6X2RL
 5OgmQLC5RuIlF6z28ruWiZ4ioU77tEBP53H0ABNFACGnzSvqGz5APAhgwZcU3k/aJLI9t6uAxzN
 eAQzvvT3nE7pcD+JNb9pweSXjzazwa9VZqe4gojbZ67NmLhjFSTrKDbjerCvAuFJoR5GxTmxQR3
 bDyTXxb8tzGsYTrj+Q7vY5aNu8GAwStctMTrQU9NO3KtrpbANPZAJwLtnBqgv9oxrxYGSC2TyHj
 RyjIrXamwG/E7dzLXIg==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a27e9b9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Sq2dutmKN4KAylfvdeAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 1nxfxG-NsFrsS1eMmDysIJBs5Ob1yvR6
X-Proofpoint-ORIG-GUID: 1nxfxG-NsFrsS1eMmDysIJBs5Ob1yvR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112129-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: E191765EF8F

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..c105743764fa 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3772,6 +3772,9 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			status = "disabled";
 
 			glink-edge {
@@ -5425,15 +5428,31 @@ map0 {
 		};
 
 		q6-hvx-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&remoteproc_cdsp THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1


