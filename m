Return-Path: <linux-arm-msm+bounces-112351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vpZDGrYhKWrIRAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:35:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE6D6673A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:35:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V1vSnDJ8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WwqwguhA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112351-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112351-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ADCD30FB76F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954873B0AF1;
	Wed, 10 Jun 2026 08:32:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A43AFCF0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080345; cv=none; b=HlyykG6Gvlf0UMQpFjvX1zCjtaY+8Xum5J6bZB9IM1OpoTe39bqx/iUmCweGCzEKzXe0EqeBZPV3UJq5/tUWWU5fT/7DN+VpYQEOTT+dFuxjSMBP6h9szkR+wRRfM9Nzzfn6gHBwZkzfXIclcH6l4F+vQ69ONeZD+Ghxz+mgUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080345; c=relaxed/simple;
	bh=XhmDLNuuYry/M43FbU/9q+6ANPyk2l06+Hus0cO7W9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Al5tZcFX+yQa5ffeZIXF/NAeas6eZQUVF99J2+zq65n701bcrV8RCO857sudzbATz9CkCIerlbEV1HsolE6TgamOsHl+k+5AV095nqYt4FwaisOJanRV0LWjYFU1a3S1AUNXk4GAw761cmuUcpFt/p/uDc9nqrpu+esRjHQNQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1vSnDJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwqwguhA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7imxM997513
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTswalinyg8iD6/jNxsdZSH9Oe1xTUexU/vQjRnAFyg=; b=V1vSnDJ8cSAvRv6T
	oiYtwkhRxgKUlRQnz28ac9jf13kcrb+aEJxf79zyWfHzzegu1NAniXqH09E1KxUo
	lsNnL3ypnib42I/+8VYN3kxnYV6ODsYPZwDQzU5b2dWcInfZGTSA7Ypjj+TFT4O1
	DL3IsziC+rI/oBR/O1sYc0PaJicWuWlCYKK6GVIoLeRlQjzB7H/iF6OFarnw2p+w
	RgTAHRqtXwKWDRrMNa3c18OMRvS4672uVOpj04nds9DMldALQLRFsamrMpBr7iDs
	6/cm7uJxHXueENta86QP3vtNABm1Bi5nlIUh3zGrbNGM9Cld3ivenZlvxVpcFDqW
	S5BRcA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8ujd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:32:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51787404d3eso118034321cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080343; x=1781685143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTswalinyg8iD6/jNxsdZSH9Oe1xTUexU/vQjRnAFyg=;
        b=WwqwguhAbUHrLNSV6vh0KLM9s1h6j7KAiqqpl3vpfsVN2R72fIMdqucc3XLP2hEEQt
         kQ6a/Et42amENGIPSfP5K6QqvcFvIoDRVmlih/uzSx8zsiXOgE22TUtnhk6aAyGsC+cY
         ft1IbZerWzSA93mMwdT16aRSghdu6amkvRmnsfFQ9eEip4xjcL12aZENF60FVan8FZ6X
         +K4OHqf2SN94CsBMEQHV/3XaTQalLz5ME/peEMGNMN8/fHFNk/v//56DCuKsCakV29KA
         eRbnDL1S4Yjecqq+85HGCzq8KZfzdDDj9DCJ+WQsKLIes7Ct38cHeuGNfdpZMOfrXbyr
         MA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080343; x=1781685143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTswalinyg8iD6/jNxsdZSH9Oe1xTUexU/vQjRnAFyg=;
        b=AAQ9qPVKtg5hJkPLwQ2Qyn1a/KAGHTSXHMzR1sk4B8qv2S9dXVktj2JEPW+ttYfkFR
         K8lJIUNenRtCtq5oCwfh8LGObyRbGEaIG6aiIZUs31UoVIv1MFhDfj6YKxJHVYfcfNo3
         vu2p/uvSOpmrIgA5a9g99lSOCe6HYjznl+t/JhLY8+0kecq6FmDwWcf+YRlbGib76/1l
         IYPCOaVBt2VUePH+p3lZichIUFfY9q4iDfLMjU19MVtMFOQygtcLeWMXzyXKei1Opc66
         u2TM+5B9LPuOAEJ2qrAJi1L2qTJdQVdfN1QTjNa71FcSfSafqeA5lXVfM2VBMSIO/oOf
         xq7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ElX93Bx9pnWTzfxlswGNsDiGQ76FFq7Ix/EZLQKQnvB7EvWLGSwAQzTFECkO2zg13cHSTkcoYSPvx+REh@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsSU1e9mkgwunmumYlXLmFXCsjvpPhgfxZvNyLHgDZcNaXwkZ
	2nnc8ARxvFsrLXovQ4mB+PvUzg5a2dr3coIr4BFmSYdUA3o5xVECnIEHCSxJkUyOVpG3KFHyLst
	QHBa2bGwoeW1h3mSkwX945tELFXxyBB3qAha3mdWCVtIdl9f71FlSiL9jSB9OCF2ovanD
X-Gm-Gg: Acq92OEeXpJVPwHx6zUc9WGH3cd1Zsci6y2mahFNG//J+Mb+D6eHROdX8HiPUR4wzPz
	MZom1pPYCuKA+fCvmeHKcg4a0ZA3iG0S3n3wF6nXvz3T38v/kpRzlXkft3g87hRGiMivNwG5Oy/
	mjuBkSe9oFhn4mstDbFwnFbB4VWGPjywz/Aq4dFl3dHwVLyEZnwvTfg+pdBG/utQ7IvgTHK4HcK
	DakqQgGjbjJkwe4Uco0wSIts8s4lZS8fVDf+1vt6RLkTMSsRJ0GOYSZ65p7pi2H/uq6gp94HhnC
	J5NHA8NzCXhXyGEj8iqZxscy+4Rs801j+EZw1cmjoRUtMkgAM+am12UzC81UEGUyfzjxkDODFvp
	oW9znPnlMbO6SbrlKQJi/cvYOpigCRA8+QHcoCpjDVNL+52CG9Zjh7+uGGyZyOaDexOV96Nmj76
	75jJO6Mexhg9SYx6wND6EuDVvTGctHb0u35zLsUeYfyJ7tlSKnmjfNk/KMbfkXDEhuSuRhIYW6y
	55kgmFkSCpd
X-Received: by 2002:ac8:5dc7:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-51795a256d0mr345052971cf.25.1781080342621;
        Wed, 10 Jun 2026 01:32:22 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-51795a256d0mr345052721cf.25.1781080342160;
        Wed, 10 Jun 2026 01:32:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:15 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a292117 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oiv94gMGP4RSIZK_lc_aZYXzGDa2sCrS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX2gEB68QUqe70
 GhyqZItyS8HEvhHd71dNMYqa88a8sjK0ZLjvKASGk24GDiVZtLlXPQy/Z8tkSFnLiG+nYPoBw9b
 HYdrYXixoX2ncxOD/Cood6PW+8D6o+gqH1k/6KuiI2yzTUqCY6oSEki8VT8+nqO+0qBqTRSsA1L
 jtyLwgbLf5tCsguMF9W4ULWfvKNALgmGV28SQdLXew90Fq2on9/4ZLrma5mStIwypjOsaCHIOZt
 aZA2l5t1k6zwfghJAC/UJNgtEoItVEoWM/uqWkpa+iWRvaGRy82jjGBlN0vQuU5liA4qNem3/A9
 4ge4ZAmln+dh9NE4tK5U1G9vsBwiaVLbYXfPgkb7rmNhZYqiztJn+XmrnsL2RTWdTD7t25m/A2S
 1Y52d1mPJFEHCgFHfCsQ/EDn3icwpgxT4KBEtp+eL7jbi8ywyTci1YJsCYVPCK9X7sKIw98j/My
 G0PecO9sWRXWRc3qZ8Q==
X-Proofpoint-GUID: oiv94gMGP4RSIZK_lc_aZYXzGDa2sCrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112351-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AE6D6673A7

The Arduino Monza board has a TI INA232 current/power monitor connected
on I2C12 at address 0x40. It is used to measure the board supply current
through a 2Mohm shunt resistor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..a526c8a07b30c22820f54b54644916b268496209 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -291,6 +291,12 @@ adv7535_out: endpoint {
 			};
 		};
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina232";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+	};
 };
 
 &mdss {

-- 
2.34.1


