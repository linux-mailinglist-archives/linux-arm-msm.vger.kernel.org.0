Return-Path: <linux-arm-msm+bounces-92196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OAPMCZiiWny7wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:27:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549310B8D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 05:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D73330057A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 04:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CBD239562;
	Mon,  9 Feb 2026 04:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtnHQN8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOc6aj6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572721A9FB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 04:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770611224; cv=none; b=Qiex2YXFr1g4WKBWR97EMOU9WdqQrcgzJcpl6OL4YWfsED9pViIeTp8mU44KyyHzrlPoEHz58J4I0afFyP1QsAgBUDwRF9fe+IaBQd69Z78byYPqTHM4zLa8FldZee85yyoHNwnHRKDmXxmOfwj4kCAZGxtGP7iA9wJ0Gnx9Jk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770611224; c=relaxed/simple;
	bh=64mtoyI3rGPhumbOOlvNRSLCK6euquPvDtrTs+48IJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COischIXweCtAmUlrwdiAFglg2FAhE5gTJt7sGhyp8KIKyj9t4pS4na9r4gGPXO4gVYnR+ydn3SP97VScwb+Pbydr7XYLP1A4zsI6rg4bOcAb7n/QZF2w09aA0f8X4QrJB95SLZJy6HLC/+WOSVRDb9v/Z93NXOrxKKhVHrf5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtnHQN8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOc6aj6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618NXYvf3120604
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 04:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CluTKkAmEP8BDF0qXSxwp0NTZSAUMjQr+Xd
	7W/HUTXc=; b=QtnHQN8EvQPU8EPtU+Qqotqywr9+x1hp0BDTMX0sUHb1CCTcqbm
	Y/QQG2BsIIEQsalAC2IxlIQc3K8p3fjBRkm5ABQ51GCwlIBHhvsLlIbBG6PYvIyT
	Yqv00XXl02W1mWpugRZXsziH3Mxp4YbZLXxzVNBmi/tDOvWfrAmFMi85Yq2CJdYD
	eZW9sz32qJ1fQFV4ycrDg+zWx6DCviUmNXWBWAFLi77hxLaX/PY3Vpor9MGW60qW
	xizJBP5igFtDVEvzSVRPLsU81xOmL7QwkZvWe1PWaqAaXaZPaQMtblVq+Pk9SrJW
	tQJ2uSqnh8avBpd6paFRp6vGb8TN5ZIUbhg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g659xqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:27:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba6feb6ce4so4260505eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 20:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770611222; x=1771216022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CluTKkAmEP8BDF0qXSxwp0NTZSAUMjQr+Xd7W/HUTXc=;
        b=JOc6aj6qfitUEuP8ec1+OKRKPZg4mYBrFujjgWvogLvnn+/yBtlRqf48PTtu5HJofd
         5tiF37X55VRfqXrlg3inFdsMTucUBuGow/BcbGmiutgKA8/o0GYDAFb+RIbV0M9HqEVs
         o106JNWsvwaC6QTgDQUKg0lbNGDgPxwifO2ZH1PB6mzNFoQfmym19aZ52JcxHD/UjrUP
         414Yw7izMIbkCv1xLxKMHn/F34ZU4cCg3r1fxgdYBXUvXcl9PHGHWOT3ArJBWaYIqLlg
         xZH5xjp2hzkvLh0e7ZdOvGJXQIyXZqbeeosAZwH76d1sP6olyE1yPDfPr4AGWZuiWSXv
         6o8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770611222; x=1771216022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CluTKkAmEP8BDF0qXSxwp0NTZSAUMjQr+Xd7W/HUTXc=;
        b=sZfcXvFbNq4lo0knBmuIm2oE7gbDs8RNj7U0Ko4Zr+/WUDY2NJ7OgoBv4IKqjL7pMr
         tIPL1rtMk+LCn7XHeLqfb3W2Txpsji6lhjciOciPgLDkQaRHXg9tUmciHOXDlVspMM1d
         qva1azEtPSF6OnOJw6e5oSFsIh4EpPAwLqf/PRi4Zomc8pCs/7YFYsIvf/ZHZ90Q9Nwj
         JTZDgoMNYfX0nzQ2XFqPfUnihm/1Yl2G9c1tKzYVmOe9Eg6Ww8SLvbfK5sYNFdeHuc4b
         kfFq5QHxigk+/+GsJEF54Ut0XVe//RKaCqXjnYDSYUPcH+6un3NMiUe7UWCgVm8+PhiV
         s9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUyZiz3+Ki3DqrJ22/XU93aKPLjcbgUEmUFuNzCUbjxTRtwOc5j+jarmc8NYKdcm6IT3JjLEJVZDy6p/8Wt@vger.kernel.org
X-Gm-Message-State: AOJu0YxcoSdeJ8CM39JrHrh8hVF0oy+Xdcfp4Q6T/D7Srse1g8bgtxGE
	yu2hrypL7CyhArrFGnudLKuy1NqyairA9gjU0miFQK64Knz7nhXdc2VOX28Y7U/g8h3k4c/CUww
	YIoaRtEcV4ra2M8i5vn6WYbRlYUp5GfvoZVSnNO0ciOTn6++ZVSfb3VxqS9LNDGXzHlF+
X-Gm-Gg: AZuq6aJCik7H327/Jt1nZyxqmOy1JTRHjDjwhzQ+bPdvfRjQ3NusJM5SwTiNsY19WDh
	W2PvgtppXDMTtAjS0SnXVPqxN5K/kVw79DqvzcUV0FdqEWXdkLvVLyfyUBpffj2EGGwcNphA6Yw
	C0pqQ1IhVnAEv+KCWwFzJ74l2F1TA7rQdOeWcZvL1P7lhuo6abauc2pFLdBKIoFs5+lkp5VAafg
	M4wlu6yFO3MZUPqHD07kT4+huklH06W092zVsne3VgJ/Q0v2XCWxmNgVsayfnhyZR0ab30Baepm
	LEIfwL0mzBT1IHsW7UtoxmTGztEoOMnR+i5BFGMvXT6owBqDuOdZIzigsd9TVzt9jjWGwdtHQJ5
	GbUAXS0NiE+n0IL/he2uhbxYZ3XCfnPQAUXVx+OGKa1vHAQti3tOzoOo=
X-Received: by 2002:a05:7300:570b:b0:2ba:72b1:40c7 with SMTP id 5a478bee46e88-2ba72b14a53mr753208eec.4.1770611222114;
        Sun, 08 Feb 2026 20:27:02 -0800 (PST)
X-Received: by 2002:a05:7300:570b:b0:2ba:72b1:40c7 with SMTP id 5a478bee46e88-2ba72b14a53mr753200eec.4.1770611221594;
        Sun, 08 Feb 2026 20:27:01 -0800 (PST)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b86b800c47sm4053412eec.12.2026.02.08.20.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 20:27:01 -0800 (PST)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Date: Sun,  8 Feb 2026 20:27:00 -0800
Message-ID: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=69896217 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=PTHBu97LMlqcQuRu3TMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9CjzeUr3f9DCCdYYtgDOqIrtCEbYmMmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAzNCBTYWx0ZWRfX6vbxWMxFxPAL
 c0mE2Dpr8SuXer0kcd3+wqBpqa0aZJfBkryES0+cVyA7B9FNfWNs8rY0bgzKGvRan01WhfCghyn
 tnAnLSrD2/Oil9HZAKWsdCpY6d+6r8AwfKHf0wp5Kj4dQagwcEmZIMSz6MBPBXfFm3vRkPVMI2X
 wxgky21ZsHafSHBBu3YRpzo3PjhcrtBC9la1ffjzlzL10QS//v1iC3pVQNsspNLM+Smt+0zy9kL
 RNmO0SFWw/I/t/ZTJJQBJH8qvtYGIK9LIm6wJHKGWaBI4QQmbHhAyMEz8wlRQCIjg9ac1wXJKaW
 1Icjs0LwgTJanWFDyR0wR8wK+IOPHSXDoX9zSbMdkvUuA1WlugD4R1EoeUPMR1CZ1JfLOqWnDAu
 Av4phU9uqg+GACvN4g98QAANE31p2B86vGwDfZ0z+r+XxKUOot+nWgMu1hLR4MvbRRO7+1rlcC6
 z/dD78oA6snnSegi5eA==
X-Proofpoint-GUID: 9CjzeUr3f9DCCdYYtgDOqIrtCEbYmMmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xin.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2549310B8D8
X-Rspamd-Action: no action

Add support for SYSTEM_RESET2 vendor-specific resets as
reboot-modes in the psci node.  Describe the resets: "bootloader"
will cause device to reboot and stop in the bootloader's fastboot
mode.  "edl" will cause device to reboot into "emergency download
mode", which permits loading images via the Firehose protocol.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..2a490e0a8b5d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -450,6 +450,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			/* TODO: system-wide idle states */
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x10001 0x2>;
+			mode-edl = <0 0x1>;
+		};
 	};
 
 	reserved-memory {
-- 
2.43.0


