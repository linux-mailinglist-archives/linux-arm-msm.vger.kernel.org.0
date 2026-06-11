Return-Path: <linux-arm-msm+bounces-112796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FAoYCu4AK2pY1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:39:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D563367483E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="cBpGu/iP";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="GrL/A2d2";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112796-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112796-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43A193142735
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949684D2EF6;
	Thu, 11 Jun 2026 18:38:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C104D98EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:38:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203088; cv=none; b=TvM5Z3amJKX6NtLysV3mOpPNzXorgfX0d6hkOGnSxcw4ddJZ2F+3o0Mf/TD9LhNIiEf+laKot9Mq7BHnRqc/26VjQEWE6RDkmiUfE0+CJy7OapmxD872owsEHFv1+TU1i/uUrhFvL8iBi8E4Hj41ppdiaMuW+Hn2yV+po6KW2Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203088; c=relaxed/simple;
	bh=YOkOPlGx5N4cYnsDHHVcCPeF3FpDW33P72uZWcaYh6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqUIkXy7iXKQkD2aA6C4OydSDkRm14Mqh/zzmIqUQkuh5i/nyFacbmy6KWgZLYR8JuMmJbwofeE3OHgD1wxVZE1P1eN6corvERcJ0sonRrv1n6tITY+HWsmTN8MuD+XaIfO0qbEAufiazTOAbo3WBX2Y7WQtRhoDssvcQjtd970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBpGu/iP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrL/A2d2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQI5q4028019
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=; b=cBpGu/iPMSDZKQOl
	I5yfmD+8S+to6BxfjOiuV4YTmtdFJ7WvR/SCXLrtdtLP9jGZjVze1Ehak6Xx5aXl
	3HOBGEDSrTh8Z6+drm5ZVXIEKEbUZKUsyo0jK91tcETK+7rwtdZfHrrd0/SBCGni
	opcc7i3VHsI8lizD37fGci9frCWoWEfWA0o/3+X7VWw6baMty+3WhNzav6Okimh2
	TwLDkXDK73cbuGVhK5pBlAZMuB1FzcYTy+ghkPhISzHJoc4DNQmb0CJ2P6MH52zI
	gmBFBFV6BQpOTMu7oE81ilABEnIqUu0d+BRIj07spNrqxtdq5lGBL++bf9n91lOK
	Mwpw2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gteg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:38:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84256bee9a9so130733b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203086; x=1781807886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=;
        b=GrL/A2d2WQrd0SSOit5nUqYJr/F0muxGLB7//pojwgqnetEL6aU79mIMfi514M/OeL
         1fK4WPNAXIxHl4kHwRbHzoMRBdji/zf6NoPUIO4pYFY6+KSWTkR9FHGmkqoTzHm3oC72
         huajrJYkdTeFG9qNnrUtydvo7HtPKMCNIq5mppBpuL1bACnaSSrHku3QxGkE4vIHjeoa
         FvhBDk/W52GNTZHwkZ96oRXGUCbWX/h6MkhRQMA4+0FrPk87GDzz+bTWfCzLAZUjshQx
         mmxpzkRW2MUaEunvJVr04DwSTCkS8FgNgXNfmWZ+Kb42HAc9Y+GsA58r3ot+T98hA3er
         7Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203086; x=1781807886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PfK1pXGOj99PCCrizdBT7nW7VolhzI0bx1MqJ3nKuI=;
        b=oZcMkbsFUnEHUdAX9hBkXWHHWBMK4q5dZzekPLl+KhCqHI6eurwQeaw8LtD+OOl+e8
         LNLY/1JixdxNEOEppoDtkthWg4QvpDUrdCeCBoSgF5Lx8M6S2UstOtKgK4mm7nfJ2emn
         XkqgWQQ6vcaWXzbf7lcOorXhuUxLr3WmEWVpLNdm2Qn79QEL7WYFo3xGwDCuNEq8zusD
         xlqrDFXCO53o4zV+jmxrOAxWdGNChdSW/PsZoNq8quDANpZOEY0umi6p8T5mdzK30JKc
         KHZ5JVA/5Ek2p8PQA4XZSD64puFPZ9BqkV8LtoKZjtye0GDOPgfGIJ/58W3k/g9eAzMt
         xixA==
X-Gm-Message-State: AOJu0Yy++Q1wUuX66pfNPjYkzZCCdTDyRSYOxW04wLayVKuVOt/2zMV/
	Gmt4MLrk1IPRRW5WvqlohYJxQaq+RtO2E1z4tMQ0ECFZdbQxXcPuXjlXYN2Fv/224LunLs22iBW
	lvQX8L4ElJBmo8Vr/47VBvDjj3DuaeXBHfrfEKgk8trD1bQOaEwsiPwkHtMNtcLrmuNcx
X-Gm-Gg: Acq92OE652mzCAE7eJF9r78f1JHE1+RMFsKKJfkMzcOVW6/rCpNMFM0LZHBvtypJloM
	9SBBnJnP/57LpbJT/D3xy3PRXYrlXim9sp1c5Aip2BKWOnRsljF1o73vV3lOVf8lBvDA0FWh43L
	oiqDnvUJazU2kz4iGj9EldWcV4y27Yb3PWvUyR/qgbD5DWu/10VzAY1MQBBp44Zf1GS53e4AlnH
	rB+oBeQ/JK7LyqI4qqGvf0S5hKmccHaLX6PmLo49t1TT8g82NKdoebDjUmTnW9l6NlPVP2nAC18
	4KEcDjp6KdafU5umUvgQ9+zCcno7KkomoZPIbyyqbGGefWA4TjlU0g+3jjGUQ34WGkUrrbWv8lB
	mmzszlwYZyZV5tx2NPbHbgRaXgAbr8faBd8EpBORQSNY12Cfk4wo=
X-Received: by 2002:a05:6a00:9086:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84336a9d215mr4674335b3a.24.1781203085817;
        Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9086:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84336a9d215mr4674302b3a.24.1781203085349;
        Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:38:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:04 +0530
Subject: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable ethernet0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3540;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=YOkOPlGx5N4cYnsDHHVcCPeF3FpDW33P72uZWcaYh6E=;
 b=ApzXY5wzC5GwOGHJ+Bi+P1WJlfEbrlFV8OvAOFu0dF8rKEc0eqdqInIl5UvOofMKR+Ozi7EGS
 aXR9zT6D7iBBRAsftI1F8xeifG1vaXy210OTMjSl43TEtFmVWFUgKk6
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: ipBczmPW0dDgtfkQ8o4KK-Hsc9kX7F3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfX9CAaF9grtJpk
 u+4yx0O5amraPLAOy/gwifQjkGQ9OFCWRhVUsKLOFgFeSJnBNXZ2Z5YqJ29lbO5OOHBevxqbZ3d
 UBYbPaSEah+i65k0439QRkYleZEDNMk=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b008e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=flSr5DCihV0d4yMzew8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NyBTYWx0ZWRfXwZoZ+ectOfPw
 TfPtzGFWHiTZ8GXH5+I6bw3GB1+ztV/FnMjsukO9c2N1i0eQOCSEi7Mmt1x4msO48Oz095vpwNk
 bT6KiHPIwcToXDwCZ3LPeUORogF3XWSqj2EfmLzy4eoihMdVMMHLCMPDUcn7EK+/ZsXFJTXz9EA
 iSFfb1rpDDYukNzjd0qFA61IEUON1LJD0AXqXBit98Fszr7/fazp+S4oHWFAIzOivgOJ+2qjf3T
 2fgNVYdeYNxlIhxtCGMR1FyHywpbFzICu1yVDic/gm/rhhKSsyz+9DNd667RXYYypQwgupuwF4V
 VAwgWe6ZuCZ0qUVGw9TN0GPegUiQPd7gYifcEFTCE3kYhV4u7C6TEtz/lrT6wUn00amtUbBtOs7
 FHkMnQImz9zKpffvDAagzeysMVUW9f/PfWT6pUOnx7rXxpU5QOUJ2KqYLfYqU5dRi9dfo2wCuAz
 4LG+G+OWqE87Ytqy3Kg==
X-Proofpoint-ORIG-GUID: ipBczmPW0dDgtfkQ8o4KK-Hsc9kX7F3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110187
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112796-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D563367483E

Enable the first Gigabit Ethernet controller.  The board layout is
identical to the CQM EVK.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/net/ti-dp83867.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&ethernet0 {
+	status = "okay";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_defaults>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -95,6 +182,38 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_defaults: ethernet0-defaults-state {
+		rgmii-rx-pins {
+			pins = "gpio121", "gpio122", "gpio123",
+			       "gpio124", "gpio125", "gpio126";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <16>;
+		};
+		rgmii-tx-pins {
+			pins = "gpio127", "gpio128", "gpio129",
+			       "gpio130", "gpio131", "gpio132";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+		rgmii-mdio-pins {
+			pins = "gpio133", "gpio134";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+
+	emac0_phy_en_hog: emac0-phy-en-hog {
+		gpio-hog;
+		gpios = <149 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "emac0-phy-en";
+	};
+};
+
 &uart8 {
 	status = "okay";
 

-- 
2.34.1


