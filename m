Return-Path: <linux-arm-msm+bounces-104038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDuJEFmI6Gk6LgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:35:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6C443857
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCC963022B87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9D83BFE21;
	Wed, 22 Apr 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MN0jOFfk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZxv/6OP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E65306D2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846818; cv=none; b=fhMwjzZhW4fX/dwxNZjCDj7wLwqUVOB0sYz/BE6NYx4kZ8bTBorDzZi72FDi3UgmYex4CTZOS201dARZs30gdxDw3uHUP5b86VAQKV2hTcZFSev9i0jmi/MXBeJ8CshGre1Wk8AfDL8hIYWe7js5AjgKNZLG+NI/aRcB9B5I/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846818; c=relaxed/simple;
	bh=GQzIMGc8m6mOuwW8KpFXYjna1OpBes/bX1oiFXWnkAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQw7lUrRMGVwKEoE129EjJ6D0KxsNkbmdTsHNknmajRGGb2yBLyem0zwrgK2L3kIwTdojG9pCpiIqC4JTjVu9rBrdwmqcN8vGuRsO/0v9yAfI0Rvr1x+NwzK6QKWVhOeRQ2d8v9tSMmMetAuDYvi2WyZm8dIVFH75u6ssNlMliU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MN0jOFfk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZxv/6OP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4snVG976785
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LPjc8m6AzVjjqOcutkhEs0IZBZSR0oe/CVS
	xl8wuGds=; b=MN0jOFfk6DQ9YHECHswsHrQSX5H4QErTttrZ2jlkRrXhn+dfYNo
	kiwM2cOd3pv4BWb+E46d0kgLm+xlDg/QmLnfR3CfgHIA/0qZQHFkglzm+Vhx3ML6
	3j0h6BFEAtEgjJLO+6mo6elDCVJDtd+aLBO8Tk3wZQm15v9i4AUKBxa+lYc885r2
	aaesSe+//TzeJtpbG2YPMdkhUaKU1IDpu2M1xlHRc0bDZU93ze+g8kPKT1Qd+Dts
	VwbdS9sa6pt+KbqaxONt5rZYh9JkkvgmjXCvCiQoWwb92lxweIrcpWPboo+hybVC
	pEpLnig/YIbiQ79T0tqQ4uHGlmSFX4CMDmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneahrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so125501361cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846815; x=1777451615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPjc8m6AzVjjqOcutkhEs0IZBZSR0oe/CVSxl8wuGds=;
        b=EZxv/6OP26Cgjf0wfvoC1fsBWnmEsyDV1Ylq1UuUv32BFsk0+tVZ2nXFtRiD//bL3h
         1Zc5bNNEpJbYqz2/DWwjQNjd4vRDshIV/WEuN/wI6geuVxnkqqbXZS6z4+OIfknmuqPN
         v55kzN/9WmYXn2Ik4rE3L3jliUv7apcIl9n5auF4b+394S9EplYAUG9SAPZGClMf6Z9l
         8u4xO6+CXSjYNmtZ1twzFCyxMLimcU6ZmngdwwU/9Zj6Ma/dApVbIBmHbagK3q9Vw44u
         DN6HXmZmDgkQXfqnEpvdGOuhsoyF34VluyFfsl24pR5WMXQgk9twNzoG7MLIdae2wKSJ
         jZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846815; x=1777451615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPjc8m6AzVjjqOcutkhEs0IZBZSR0oe/CVSxl8wuGds=;
        b=BCLIVqPd9anPbNsilqN7WBxN09eAQ/3phTuL/fiipyoMTDCbcqhmNVEBWA0Uw+WV24
         TrHBJjtoTUAYvWIHvWaCooqOfZSgmDwcLHlAC0HNAZ/ZGwmf8YBZJYSKr1aL6wrGUsEj
         Hrm52fDYx/Kl3R2W+2VOuUidv7ccF/2eycebY2Z4RlyCNqcD3A45X7o1Uo4E/eLRVAE0
         DmWQgXlLa5BM52CI1MJWLwo/WdLbuPC+DtZ92xVrpED0cnZXLEHRDFFGahGwA+Bp5hP2
         D5VWbK4WSwknjZtfHuivbBVlrRV8XACOLamsOG74Z4dlfzee5jkGeXCSUxIFhuV8Pu1+
         PvWw==
X-Forwarded-Encrypted: i=1; AFNElJ9rB+vVScpsTe7IxWUi5yWDkUkgMvPHQ8TqVbRUqf/yzuxK38dqVRjQo/g9zQwFl6EpemPAoZaebAPWe0g3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb6RTXH041TihMwHzNBVGav/Nt1WJTe6GLh32vKDicmw/wsNs6
	v5v0y39umIXifjtI4Q2/RJuMIiZU8XVXERMqx1vddQk47KqEi/tNtnpgFY114HUaRSbl9n6Fncb
	k28RDW3uGwW0JiLkr1AxyYXQmlaqkMpXgPiAvDHxLYlq0nyeW2KrOTTvvCet1rQlqWu7f
X-Gm-Gg: AeBDiev//ASTmepPu0BbRwnbGE0diELvNET1S3n76qGioA7Cz9T5MqsrXnmAs9ETgdo
	fwfQ6YXftQHHT5Mh7/W5tuy/ypriYtpvSBSIjpUmkGJrPVOTDSpioh0uG+X8nyw87H7sowI30pQ
	h54kaM/ojC1LMhaDKcQ8yiib9R6MeSd5MvHuvfudPgGf+uju4HEc4lfqHDgueqGIwFaYZ9z4Zjz
	lo7tu0hqXdX8eFIOlStnA8jTqweRFQm/ImxTMnyLAMO5x53fsWtKArhSv8rOrEQMvrJnF947W+B
	BYv5OrZJPEeNl0mT+lKCtJGGV5e68+dqGG6T/89z31H2qprvMqxz1qneQaqNgrmLOWaa5BO0ZCy
	UlH9TPH0EDnnltgosYh7ieZExDcN/UGC8Dj3x+Tx/mwa+D0I=
X-Received: by 2002:a05:622a:4a18:b0:50f:783f:31a6 with SMTP id d75a77b69052e-50f783f364fmr136400471cf.38.1776846814651;
        Wed, 22 Apr 2026 01:33:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4a18:b0:50f:783f:31a6 with SMTP id d75a77b69052e-50f783f364fmr136400221cf.38.1776846814111;
        Wed, 22 Apr 2026 01:33:34 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm289624445e9.1.2026.04.22.01.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 22 Apr 2026 10:33:31 +0200
Message-ID: <20260422083330.84247-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=GQzIMGc8m6mOuwW8KpFXYjna1OpBes/bX1oiFXWnkAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6IfabehHXiy6R4nSvp2dYN9Oq5OlT/CtYTQrT
 gMb59uvmyOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeiH2gAKCRDBN2bmhouD
 15MeD/9SJ7febDf2FsPVgVDhYNvYu/kFpovOyZfDDt0bCJs96VAnT0j0YlMwQ721zhNFjashvvK
 v+w+SWMxXEy9vMgHZm6etbgEQ+hlB1g4NBtWZiMR5kNk2e31ml8pjF4nh6KhuacQjj4ZNnXGBaU
 My8s9lSwmiAwby6myuvOfUiqQ+h0d0usT88Hb0JIBnRqEF5Xnpi9uR88AUhXMqNELO+OJCeH4MD
 WIN8whGF94RR4/C6Q7WoAPa3EWPUpEUTRj0FzzGrdf20VPui0NBK1VuaimzuluCrqV8Zu1FOTX+
 8SkqxqXR0lFJmIE5lg/xcvhxcgAazxC4Y7uT/v9QEqSy+eAoUgJ36ZTF2J7QA7em27QEcfFgYMC
 hyLEYmxzwckymluHIRCpK4cda2YhKUFZBJofzOJ/rs92rVH6H5iNLYlrB35E231kX98J7pV2yl0
 cnGlIU+6yfMJBqFYO/XofMTcvJ8e6zMc4Op9qWJJalpUjV6dZoX4JlAH4shH8lehSxHCJhTU5pa
 qCSqk8WXpPm75cyWYcdw9uzRL1mQySodGmIKrPAkp7D0RsOgjV4qbipjG3sv3vuXD2yIfAmS8FQ
 fTPSz68VWMOWFWQqtCyHt7alr2rqUPif4S3Bmmy+eVuNS722ptSTXKd8StInE0ue+kEavUzpk4R aLd1Jw6llMkvzFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfXz12+TIh0bsZs
 LediVmMKPciaK1E8flIFMC8KyPzCqASu6kTaLWrQWhEz3QrGDV8lwwU8s9dnOrlpXsRYYyFZ3mb
 u2nVCaaiyx6JZkjE+3/UcxGK0Og47qxGWz9kPKs3TG+rPTyU1OZqeylw1MQRWuUa3vp6BCtcqiG
 4jFX2nO8vfA+V08BtVEhRm3jKVG46V5NoUjcFWaAvWAzK7kecFhrhtN1cFun2CZqZw/Ct2+XioM
 Dc9KrmjdW0L7ItaJAoj/B1ehW6bEt5Ko5fRNnGdrtQQtZ5qtw0Uqj1PWrLRLI9dslr/FUFHd3pi
 eA5BSnUPZkoJ8ir6ckgH3cM3cL69jW2jHcQzntcGjA3kZJqA+f5QtdTLfwVXXTRpMZvQ+hgAVVn
 VWeev8slxcMFY9fMNziwnYqLvMcI0e6a838bI4yX1jivyIOFQ+JibTpqElGDqip0T50B4ufFdBN
 AzvygPmZLxfH/DXZ4zA==
X-Proofpoint-GUID: x9_b-uMl6xjUP0UH6m6b2MnkZQfUAaoQ
X-Proofpoint-ORIG-GUID: x9_b-uMl6xjUP0UH6m6b2MnkZQfUAaoQ
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e887df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8lAh0Rh_Yh-szdre4vwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104038-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35D6C443857
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
 drivers/soc/qcom/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..f6970431d07d 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -27,7 +27,7 @@ config QCOM_COMMAND_DB
 	  SoC specific identifier and information for the shared resources.
 
 config QCOM_GENI_SE
-	tristate "QCOM GENI Serial Engine Driver"
+	tristate "Qualcomm GENI Serial Engine Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based
@@ -36,7 +36,7 @@ config QCOM_GENI_SE
 	  Engines present in the QUP.
 
 config QCOM_GSBI
-	tristate "QCOM General Serial Bus Interface"
+	tristate "Qualcomm General Serial Bus Interface"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select MFD_SYSCON
 	help
@@ -45,7 +45,7 @@ config QCOM_GSBI
 	  devices to the output pins.
 
 config QCOM_LLCC
-	tristate "Qualcomm Technologies, Inc. LLCC driver"
+	tristate "Qualcomm LLCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select REGMAP_MMIO
 	help
@@ -237,7 +237,7 @@ config QCOM_SPM
 	  Adaptive Voltage Scaler parameters, where supported.
 
 config QCOM_STATS
-	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
+	tristate "Qualcomm Sleep stats driver"
 	depends on (ARCH_QCOM && DEBUG_FS) || COMPILE_TEST
 	depends on QCOM_SMEM
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
@@ -268,7 +268,7 @@ config QCOM_APR
 	  ASM, ADM and AFE modules.
 
 config QCOM_ICC_BWMON
-	tristate "QCOM Interconnect Bandwidth Monitor driver"
+	tristate "Qualcomm Interconnect Bandwidth Monitor driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	select PM_OPP
 	select REGMAP_MMIO
@@ -287,7 +287,7 @@ config QCOM_INLINE_CRYPTO_ENGINE
 	select QCOM_SCM
 
 config QCOM_PBS
-	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
+	tristate "PBS trigger support for Qualcomm PMICs"
 	depends on SPMI
 	help
 	  This driver supports configuring software programmable boot sequencer (PBS)
-- 
2.51.0


