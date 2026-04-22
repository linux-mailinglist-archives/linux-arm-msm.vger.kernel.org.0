Return-Path: <linux-arm-msm+bounces-104040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHVYMumI6Gk6LgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:38:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE994438B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06758308C198
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758C3C2779;
	Wed, 22 Apr 2026 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2+HVqed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+0dmy2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0533C1415
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846824; cv=none; b=WtGFKObBqw7SHVz8NtG+VFrJdOuY4vFjVVvVpfgaa8Tn1uU2NyMv15dkXXDlJr2mFckM1S+4Z9xxcpPprsOShQrPjfuBDe/4XcLJQhJwJFmnkYfyP9DM9/g3GPYdtJIcavdNUmKvlyDf6eHnSh7VOWg4jLHi8SYV7tMX+0jcNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846824; c=relaxed/simple;
	bh=LxDcae1Cvk8CkIAPYxo5tqDfYwDPKuQV/ujWTnhMVOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=os+TLRtopyWlpdaS91fbJR/GsMcuTh4GucF/3c/kXbgeDR4CMtkMIkDBNRh1AZpRbiV+omb5t8ofvihif3VRK9c+bkjBpd/GweBJAhvJbYRg3pr20Kp53wbItRlH6db5b8tiG+NplM7lyh0bliWgGQZsyXUWTqVem5RRRSIDNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2+HVqed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+0dmy2Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Bw8d3083122
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fwISutmb8Au1uHUullISrNtsq4jPwJq3g10
	Mj30MPes=; b=p2+HVqedJeahgWNTz1hXfgQN8i3XruQ6kzKIOpYYhPG1p8lI6xF
	wFxHnUKvzjwIKI3puP6hXZt5bWWyCpY0t6SKKoSfRFDqbuQmWJ3on4q0+Pv+Zoap
	lTVpB34134hLl19sIefdbS+VL7pZshGZ2Ha3BqPZC8AYLw/gjDjPSlbG3iqPSgy6
	eCf0IqoWXced9MfdQxjKNQ7fmOpTxaCGY1cZi/XyUHj3SiNwd/PewUIPZH/cSy5L
	IVnlCJ0w0Ych/NbBKieM3FcSZHdHqsTut6BSmyCGkXiDC/yuifd0M3md9Q80PYqL
	cDrGCdPtIXAJi+y7pDuQKni0lu2/ypCrAYw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmjkxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so177129561cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846822; x=1777451622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fwISutmb8Au1uHUullISrNtsq4jPwJq3g10Mj30MPes=;
        b=W+0dmy2Yo5dGoZFAVPVdQbjrN+mC1eEay6hEmG/kGyJrwT2bVpkKui6rGXHb1U1u7O
         COHWZEjqpnTYukJ2K+5ih3lW9f32Hmv5TyQ3vuonB0ihclIp7xcvJt11DmThzdiIvQ/g
         rYITPosQUY/JNl369tp84LoFeDOJpjEBP0W37jIz3IV7UrIk/xhtnRWPb5eYlty53XK+
         x7FgAh9fWWiMkTyeBL1jxSQGkdHBGm04UQDVwOiwZSkrRcKIfclzJAvVhs8B+eK4+JDf
         +p8IX2oHiieb8r1ubJb8sC94F86haWMIYm9zqrfTmayhSByqQrPPEBb3a5Fhhb7IWOYT
         gvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846822; x=1777451622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwISutmb8Au1uHUullISrNtsq4jPwJq3g10Mj30MPes=;
        b=fYVJ1cbrNSSQZ6GR2RnMU/v17dUxEKwuZyUd5s54zKGPILnGiCHuA4UuhsZ2KJ633H
         qtDWmQMuZBlAc+l9yY4A0esdeNjvJCrAlNdV3rSLjsNKbxZho49RR0xvTBmN6C6bt8zC
         kos9nJxvgSW/r4Db5rzPQ3D2jizbGHO2SXIf0oUA/77s+3QpebxvtRSIWRZJxOENsHgB
         YiRCuWfwGyqO6vNq1yECbipgd6GElYTGsT3PC5i4E+Su5w9anN0SQdZcU0R9IlWnTHvM
         bDIbgpwpGbeSB7fQMFxuCAQEkLN9HD5tTcwHGfKA/BTwk5nDa0Z7Xfo1GK/eCeTfVZa8
         YlBg==
X-Forwarded-Encrypted: i=1; AFNElJ8jB4cywhmMJDFsqxts/Lx79RJTDCXdjk+pDmVVMa4Y8kvaX3U91wOZYdNoUaYZHT7YK0PlHU7bGRKRVuqN@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1II64SNelWiMT6IoxVtanC+GoX0jQ9a/wgtL/8DhQkXGKDQK
	C456reKR8+rMha1QSHJxQTAcpDQIhfyjPRWaeOsvVDOO7fmMWRXr6IP6Y8FkIafIWHrXhiihfNA
	v8nfRwWAXes/WsJp78gcX36rolHFhqidjkrwu42MqbdTmDAMXtPO2/MHoANRWRQrd8lVU
X-Gm-Gg: AeBDietKcYQV2iaC77rmyKpDBRPRNzdYL/8C9c+04orZeCjThq9WDG976o8LpmxScxX
	TrewRysRq0liI3vU3dSFamGR8Tpj0+iyboYvarLGO6Kw02cWUdxl9PHDK8h3GkIWakv6y5t//IM
	/7xaQu0NeNW+q+Z2LRMoXh9ThxhColoTD4FbCG+VmbMNy/9Go6lCKiwI6Sj9tmPFK1BQTK2mqq9
	a5DePVro03GHFnq0q/C5qO2D87c7Y716GwuKueuX4OygCtEFh/c0qIPfCRkHLcPT4ToilhQUe8F
	sizwMffNtbUUu/8ePgsFFgUd1YIf45a+mpUjJy33bx38Omx7wskttu4UuQyQZT8CDa/V0x+m/j2
	XJtAkx8IC37sFdH0039Ni0S2yyfUgy/PoSNvtcNNkediFSiI=
X-Received: by 2002:a05:622a:4cc5:b0:50f:bb01:9867 with SMTP id d75a77b69052e-50fbb019c74mr62178051cf.25.1776846821782;
        Wed, 22 Apr 2026 01:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:50f:bb01:9867 with SMTP id d75a77b69052e-50fbb019c74mr62177921cf.25.1776846821402;
        Wed, 22 Apr 2026 01:33:41 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffad20f2sm190292105e9.0.2026.04.22.01.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] regulator: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 22 Apr 2026 10:33:39 +0200
Message-ID: <20260422083338.84343-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=LxDcae1Cvk8CkIAPYxo5tqDfYwDPKuQV/ujWTnhMVOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6Ifi0DLUduNjr/KCTFkH3OhNcILy6jwUWMIQ+
 CESO5EV6uaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeiH4gAKCRDBN2bmhouD
 15kTD/9ecMB22F86bqXmZk6N4sAhDD6fc0pc23b2eoCvqW0qh7fsrJqGl5CIZ9JK65Mqln/96t6
 Nq+i+MoEYR5gr80YTboO19XkS0DB7Lp4LiQBpx9HPrlb/IVJkJvqNrFV/pJBWKyOwjHErxigrQn
 TF/LHd6YEVBZUfX31Lxcos+XvK65f0Gg+Hyx5QZOU10oOmQ0cvPbbLlMdKqm1gaYhoFIhPwz+Tj
 6+IPunmhtS9nRQ8VXnTJBbefZALzj8qKFUSr+v7NZ8Wdv+Pt13gs7891+ja3IQn6dtrKbod7bKH
 V05J9CW1lXL5amQT81D28wW+dk7SZaXHDSuMmGsgM+X/POGsnhczTPBxTw0mH9j/EgsuT7F4iel
 J4wlal2yjk2Cbb2UyT9DZeHwsRUmPriyni8jicuZ1myrTf3NWVhfEq91CVHyk0iT1ufQHdrf/Kc
 LpB/4QVIUL/eZefIJwl/yvjLl3XsRRbSpNVCm2S2Uy8+pDTbQrKpzuAm5ErKJH1W0hTRPjo5M5s
 MALTLHHCaIN9MN94wlVnMcr0cdF8sDuMVz+uFKVQq81H7bkzf6dNtDB3CEjJrabskOtLPKInyv4
 uaTphqKuDnWT6pBDOqYDZlN0FClTEmXxV9AB32AshcD9+s/zkKJz8DIAT7K2Aj+cWLOR9X4dx+J 7SI4EP5XpnTfmCw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QQtC7vuoEZNDtphmbSVJlPcEOYQqMil5
X-Proofpoint-ORIG-GUID: QQtC7vuoEZNDtphmbSVJlPcEOYQqMil5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX4CryVRlnSNK9
 Z9ooUQzX2hvlIx4t2yQ/0hUrBwwmnlPrH+QRqQjSqyfhyuYfPbyzI1OOlVgatAC5ZgD3s1bkoQM
 W1+r3B26TqL8CXinRTNNumgboiracEITQMYc1A+3/IDMAnLDAgKTCSpcYGWv+f0tTV1mPMcpE+a
 MXw7+Yoh4W3K/hxCOgwnllQ010/BRZTa39WZke+6R5q8aYq2U288JjQYC4QcfPbWS71PEMWHbdW
 C5oeDZzp7np1ChX6HYschQMpjGdSe1beX/O4ZsAMcSwgAUgvXj7msXZZlQTLLfrJQSd1+04Xo+a
 NproIj10NgFM16PEwWIJwSxeUPemdNABIDG11kpTEIYbwE689khevKeETEhMcHQCzTyAUWlpCXz
 JO7KdKIIsk0iyHMw9pA3QXg+FclU83LbOEyvJAwUqPcDbEU0B/C7Zf9Nb8vBKqkqJ/MQCQCHIae
 MTs3Wi/kReGCOC+RpQg==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e887e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EB2jJzu0MxWmuhHZFfcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104040-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CE994438B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/regulator/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 10e64e3ffb1f..e8002526cfb0 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1173,7 +1173,7 @@ config REGULATOR_QCOM_RPM
 	  "qcom_rpm-regulator".
 
 config REGULATOR_QCOM_RPMH
-	tristate "Qualcomm Technologies, Inc. RPMh regulator driver"
+	tristate "Qualcomm RPMh regulator driver"
 	depends on QCOM_RPMH || (QCOM_RPMH=n && COMPILE_TEST)
 	depends on QCOM_COMMAND_DB || (QCOM_COMMAND_DB=n && COMPILE_TEST)
 	help
@@ -1877,7 +1877,7 @@ config REGULATOR_WM8994
 	  WM8994 CODEC.
 
 config REGULATOR_QCOM_LABIBB
-	tristate "QCOM LAB/IBB regulator support"
+	tristate "Qualcomm LAB/IBB regulator support"
 	depends on SPMI || COMPILE_TEST
 	help
 	  This driver supports Qualcomm's LAB/IBB regulators present on the
-- 
2.51.0


