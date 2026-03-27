Return-Path: <linux-arm-msm+bounces-100204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ2/FDdBxmlRIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:35:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF334112E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 491A6304FC89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5525A33EAE6;
	Fri, 27 Mar 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy7AWE67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEHoI8fY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CA6390CBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600273; cv=none; b=cYF74S4OjM4QzmUr2wqIhc7E0ywqFG/4dxXvPRX5vJxc2qa2368sjlSTzRdrxq9gv3jBIKn/GtF/lcOF7kCKmVVDt625e+ja06c+WaewZ6x4rX6JDvJSkhXW1VKhTalH9mzbD76LHrCniXeQ2H5ZLYx6PwrYvw/M7yVlxabbgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600273; c=relaxed/simple;
	bh=1sVb+gA96imLMD/XZ1Jk7Rg9NjlUlDn6GhrYUfJiN+o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cf54RnYWOgw8NgpKYntFyYzo8SUazefkaglYhpk12TWkSD54sktKaCA4wlI7Sv10U+WFFLfvanfGoj2knxUzYgrNL4JM0+hR+gSrMhxf0Rtv4TtqAdDa1ntk9XQ3mWZ4Znk2AabGHHoShBgQtYjPduyiRnzBqCv6PHcPuk0PSEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy7AWE67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEHoI8fY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7a53132231
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQ
	TCrz8f/s=; b=Uy7AWE672acoWX6cinbSAuztHNvJPClRKCpowSCnNCLUBbHmvcG
	F1mE80tU9xIfwD8ncG8wKq46plLIaQ+jvpXoo7t//71ImOIBvfQXJjFblaawf7bT
	Wy4/D7yCkxcGK7Kxrg07jOm1FWN0yOWC/82uSpXAf7ScdRYlV9ZBDOSBfBO8N4rT
	3p7dVZY6WzxLSXybGFiMcVbiFJQY0qZsriX26FEqs8cpBuxQySqEZZGNCbhMIVoF
	UqvaUP79JfjjMcN6NfH2HVSIa+ZBV1VREXdf3FYs68+yJtZOBFmdtBDM6bHBnwst
	mln6gmA5ARz1Q5k8e4sxzfgY6CCsgm1igjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s42m45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:31:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0b339b8dbso25506765ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600270; x=1775205070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=;
        b=IEHoI8fY3Ihw4kbfTHRdvxMfZzm27uAd7QlWlmyi6i50uAnD2hoMsyCUY8ULqc11yW
         wNwbrBdF6KnqauBlWW1+W1C+XVMHAMyHi+sRB7IELHal4yB7j3E2XG5nDOHu34kvRDhD
         EiheRI9g1U0U+qr500yfD/8+XkjO1YeW3AFu3hRoj4pXPGEF3Qeb5sidC39hkmUBPKls
         ueFtlktYJaQyGydETsejYWNAgCtMeNJ6y5M3M5mNe0pTNNHn2SG027wyvMiguM7gbd7P
         VZgAScgv6eSmpnQB3BKJGL0FK531msaBPMYus44NXbGWLmcemNzjMZ5Pl0rRUTaJcWJE
         6+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600270; x=1775205070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNEVpvQsInNBh/T83gsxcLGNhP3rX98ReBQTCrz8f/s=;
        b=sZq/EJTSQsMIcbZktW5vPoPbeSd/JQzSVHloHzYA6qrrUJRabntPyvoyzb3Aha+CcI
         oUo6QRM/q2y817VV5XAezRmi898y5CedJ6xvj+4/SelDXimCuPIds/zDoYmXj4sgfEqR
         22mIqSJdGHN2GA3kz9Mxk9NW1yRYliHRXzRx6h9yXy3/Hqv3Tc8wYrK7PqAZs+Q6E6kc
         OW9U2jxuXgXap2ZZLFvgXTMthbmyDkQ1215W0JlvzXPzOj0zB4eajngso1BV0cRskDdO
         oVGi6O+84KusMQDjqhH8UaQRCi1usUFO8jGil35VDl8wp0TpQiv0V6WKEZBhIGm4UCud
         c1rw==
X-Forwarded-Encrypted: i=1; AJvYcCXpbaQT1PtZCUEUJ1GX5V/Pl0NvaGHs5zBCmpms6pgb4A/6IFAY8/8oikRymX55JCbwggLI66KGwv/VTMAT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5g9hsx2/4W9THv4gCoR1b5pDHtwl8RkboeHhytkNuDt3T2vvG
	krMnLbQL9RxO8Mc/9QMsB4IFFfx2p5CBxMOCgikTIKaoGVB+26lZHPPubR0aijdEJQ+y1ru2GjI
	kCpR9LDDqz4uLECEocZgUMwoxyJ7lRSHXRg6H4JepP3W/dBbqlyIEGWeDLQ9DerPapFwj
X-Gm-Gg: ATEYQzwgXeA5W1cWJ0HDtH3o8WTZpcqdo6jD6jZnoD9cOuyl8WXcT6zGCAIB2RuI9z5
	eWxO0RwO2lZYA6EYrJEWIwB7L89uo+lzn8JzBmxaCX6CuB1IMRNM/HP4un/HmdZW6m5nnU441NP
	TTBMErPy3bIcnyJyADvbc+ltMnH7BSB4t8UqSAgGSWoUzBwqHPGZ17b5DdIjm0Lh0Uus0jyOqse
	SV5xIKu0kolvMUlQNNisYpJCtQSxKETadmk8CXCuTUvOqsVfRpkSySE67sjO9vhsV23zmoXn1lI
	ecLtpxlvOtcwcSHdXP2cQgdYyGHhjcPtS2JVhj/p8Ygp3AGWdVFpZX485dxwE/J6HDIKTuImHfe
	wlj5wxJMXSCIcGX/sK1ulR9OePG7+/Vwg+gooJV7RWh9QZJfRqMmWrn7ijpw=
X-Received: by 2002:a17:902:f690:b0:2ae:cb0e:fd60 with SMTP id d9443c01a7336-2b0cdc23332mr18319815ad.5.1774600270178;
        Fri, 27 Mar 2026 01:31:10 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2ae:cb0e:fd60 with SMTP id d9443c01a7336-2b0cdc23332mr18319455ad.5.1774600269707;
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: qcom: enable UARTs for robot expansion board
Date: Fri, 27 Mar 2026 16:30:59 +0800
Message-Id: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VOfytMAIuLYv8gNO7rcK20edokz1VMt2
X-Proofpoint-GUID: VOfytMAIuLYv8gNO7rcK20edokz1VMt2
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c6404f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=x6rImnyG676cKauWAWQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfXzFEaU7ouy7vT
 Ybg1ftaGCvhu9mvNq6m0MLvEWuKhHO2GYSxVFFh6SwFC1IRNzEXmvVFgmOET3z4/5eURB9hm+vg
 nzK5jossvVmWmxWS9nLugU21DEBUqmbRf/nQjFS99oeSbWlx3TmHqloouHd2mcEDA5IpIRpGFdA
 IO+wmTszig7zRJ6Ze4mcjQ380850xDiSvMbapOv5bG77mVl4SWUR4i20LD46WInZpnA9KbMEH9d
 5VYOKoBt7seXgK4C7txDkqxweiSUdCRpScvbYJnItUwtH8T9nvYsDcgA8wpe/vkJ5xILNSF0qRB
 TCFtPRFgpRarksSzpYVlwfnk3wn3XKli0uiYiWHlRH0bALvXhFF1Ev9I/t7qz8b9kZHCqI61W3k
 pu5JK4HeDEEvbC9pbuD6j+4J+ySLPELA9xFiKYPNYClPmya4IPtCn8LVGccJJDrjx6ssteweLG6
 0a2TGKrsPqtHcH9qljw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270062
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[canfeng.zhuang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-100204-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1FFF334112E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Lemans EVK and Monaco EVK boards expose a mezzanine
connector used by a motor control expansion board.

This expansion board hosts an MCU running NuttX and communicates with
Linux over UART, with all protocol handling done in userspace.

This series enables the required UARTs and assigns stable serial aliases
to ensure consistent device enumeration across platforms.

Canfeng Zhuang (2):
  arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
  arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: 46b513250491a7bfc97d98791dbe6a10bcc8129d
prerequisite-patch-id: a877aad0127409ffea7c0a7411968d336497b035
-- 
2.34.1


