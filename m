Return-Path: <linux-arm-msm+bounces-104623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNOLFAwK72l84gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:02:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CF46DFC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95D5D300B9E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C784B3921D5;
	Mon, 27 Apr 2026 07:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDbpo84L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMxnLs0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8C35B639
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273260; cv=none; b=iiB/YNnMo0JNT6cOyGc7+ccmjUziZNXhNofdm2ul0o/Rj+73PhLaM/VG0rBB0zoxHWsNdthMmjJHjGCiz6+FuQ+RafJriLWno2WJNOJFny+amfmB5pfoRnKRaW2bShqPc0aY+qg7WEPYsaxR0uNd4jur/14VvKMSJjRB4k016Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273260; c=relaxed/simple;
	bh=ugik/6RlZSUdiUsj48iLPpckt7kO/YmHHtrl32iY6P4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdReN/sM9S+2V0v1FbAqoGQZzgqf5FjBO7b8VET38Q4kXY5PiHVye6ABbNxZ9TVgEI0NNn05tYLAvdKRGz0gjdZZV3HGNqoKobIZwpBcVo9YM1v9TkXND+xfHYCBt1FT44E+AySo/QXgBi+pvBkHx8Go1i7u8nzG2v8Bl2yg0nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDbpo84L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMxnLs0v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMC1Dr1463843
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XEUNKB6S8+Z+9ojQ8hs2qtCRBWWnjBnkbdL
	ux74/eoI=; b=BDbpo84LFg6/ELt7hccQsgnJ6QLYDsxBFEHFqoU6Svuba/6NbOy
	BxR1xdeWV5t4Gcv3Yt1pexzCC7QzEUU3GImVv2rske1uyRcPRX6c5inzHFtsRmje
	11VCLW1mmudgfWtXClak8+6n9awBkpPxgrgWEdCWSgkI0C4QdpKFMYanZpHSQTre
	6aSqnIMskn4C8NmIpPmu7bxMx4s6czuRka7z6xNvqFsBU5SvlmDx2Mbwzi5vWWoe
	d2HZkzp4XgZl8m7DD75Bzxyp4oGniqinukRmB4lcotjeyNfbqDBAXn13oknc/I3f
	0EkbSA06T0B2hk9GbyxnrLbqYe9+IZt3zRA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4utsxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:00:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94e4b6c8cd5so4109688241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273257; x=1777878057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XEUNKB6S8+Z+9ojQ8hs2qtCRBWWnjBnkbdLux74/eoI=;
        b=RMxnLs0vlx7sFYTB6xWxE8CO0BoX2Jt5otYBnvtSfgeDJuX2kj3VNIbxBKJqqPkuIl
         G88sPZhPYUo2J3nEi41su+TRS0L44UPpiztAiSIbGxsXcWvac0GLO0jMt6BOBimg47dX
         O50T3bJC/tylYjej3RzXtAyo/u19o6AWtC/ZKJBlAEieq09HX3N5JNb4f64OKLuLjEMy
         s+mcJLAYdfvldmjQdAh/0jqrGodSzr7733EuiA9PvdjeLqQbmoCQ6hpDoQTbvlkTuU2u
         Suom/DXqf8yucmki5OsAt4E5YUfy8SJUBtLkOygR8L7lz/e1VCi7ahfpS9auqy6X3Wbw
         b3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273257; x=1777878057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEUNKB6S8+Z+9ojQ8hs2qtCRBWWnjBnkbdLux74/eoI=;
        b=UjDq+p13xnWoSXAMo1TCdMj7Q6mXF3h4MHf1ZFl5Ol3bcNyU0dlNoLq2MvHcAut/NK
         acWxMNkuILButN3o7CQnlrIzLhhRLD7tLbodfMxcfWgYK0b9ooZpLmT5r6NQVxA/gAGF
         BbtMP9/sJFCJSff6WrMp2IxGs78Y8fjiHs9gfN3/wn6QcP3PSx28YVsYoKvxn7SgQ+Yl
         eAF0iG2qNQF+LYBT/+XePRIL9JKh1l0nCLshjkjykSGacn25QlHsKC2t6hipQP+WTweO
         ZAD+IO2WdF+j7MLaI2WFyEwC+hSbariG7Ptux+eHroBZoMzJF7ewuEyrVhnyJ4WE1Cqk
         K4tA==
X-Forwarded-Encrypted: i=1; AFNElJ8rzGTwLwDUsjS87DN6btadMBhsZeItQkTZ2id4HEIQiE3qanvv4bFjDuauRSYXzX53TZ+vdVxqrjh0UepP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Ieo5Rl/F67dGsO8jGsgW6S+s9pu9qt5r4eM3FV0U9yzspm+r
	PJb+2+EKVo4apZss7Vy1KLznNJhXEhlWr/9hx57Q/RzLmasViiN9rwM25Y/VbfiKMUiIt49mqGQ
	QZmxkSUcZfocTHzqSGvbiI4Uu0u9PyqTLgNAk49CAKGA0NzjfXIo+9QnHaynuxQmUiXhuEyGdvl
	wO
X-Gm-Gg: AeBDietp6hEO4TnQoU4Gmx8ZeFIAEc97v+WTEhKlM2nJ8SuWG9bVFq26ruiRDnADvBK
	c0J7jFswBviF4XOAQiUvKdPaNWQ3esEb4ha1Cu/m2Nis9MIk5BUjMhz7jSnQJDr9ujAxZXqGZBN
	Q1pQPqExdlU/40eSDdd3ZA9woOewSQ13Ku2zcrfZuRI9F31S7iQkmK5dJHnEjVdkVdH5TK+30S+
	3pF/zSeLl5KHUn4CXJ1j27xih129mGSMopesVXdjQq34N8NBwmkj9tlJSvRtTstlLmK1W1XA0TI
	xpEyGTxp8rdmMqUOQl12hqQOPb4rXmo7pQfSwfCD7een+B32ePae7h15ykjVxbed90+USHWPxK5
	98oyhf6sOu0AJmQl8W6K4XTuRPTTCr7AoFFz70I3MvkZ6tn2rgekN5FlptCvR3OZou+6coB3RA3
	lLuWvuz6QApQ==
X-Received: by 2002:a05:6102:290b:b0:605:62eb:46f5 with SMTP id ada2fe7eead31-616f740628fmr17820311137.14.1777273256602;
        Mon, 27 Apr 2026 00:00:56 -0700 (PDT)
X-Received: by 2002:a05:6102:290b:b0:605:62eb:46f5 with SMTP id ada2fe7eead31-616f740628fmr17820267137.14.1777273256122;
        Mon, 27 Apr 2026 00:00:56 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm79588511f8f.2.2026.04.27.00.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:00:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] serial: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:00:53 +0200
Message-ID: <20260427070052.18097-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ugik/6RlZSUdiUsj48iLPpckt7kO/YmHHtrl32iY6P4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmk9V3FgDfVGyzhQPw0wHo5ZcXuDQpnTIyhn
 LTjcg5v07aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JpAAKCRDBN2bmhouD
 18VQD/9K9gG1b7AonmsIqpn3Tfj2RCSbqC9mnNSxsW4avQXXRFznfCuCdiccrNlS1eogW5MG4GM
 IXX4bzPcmzhShDm8c0A+3QC/EKfluCGVi6yV4+INuHl/n7uyqOqKdekw4cHAFdO1GJv0VlWizuU
 3Ur7218813L1p5QZv+rFzMGjOVQ8zxcatMPfww6PLZl2z1zuLIgEwQIKnZJPIGDujR/axFttz94
 Xk7hMso6qh7kt72IyBIjIkSQXy9GfdY45bJhizpSZbhUT9R0k8zBEE02sjh1frNNMhaxQOhyPtS
 7XBCar0faPQVmWJO0pLPWyao5IHBo8/Ttli7STGBF1CeOOfc3b5CDAw6NZKzRXsYdv7GD7AfHXj
 afoMsBOxZVXCxmANIDXqKCJW2muTxk0QlbC7WPMGe/TeJita55trV4/uCSIPJyQ5738A/UVwsC2
 2xlKWN55q8dLMYd++SwpzTnfBSaG4EvXwiszyRP7fn0rF6rNwSIh5RHoMvSc5WZhzcczR+5ywqZ
 X0cqf95ZrrKrxAz4alranRO1r2vjTGlF1jy4JTz6yoHHpFg9C/Q/FP7X0mmxqnowIB5ZNs33Icj
 +zYPQhAPMHWtVPNNPt9PpnAuii4xliPTmO/43OVriE9AFPbFXg+9dKeC9jc2MohX3G0AEMCKMTm ysbHdjNqFk6gjZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BPPY1mdTzf8G-rezVaOXXsxfZggDGKTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MiBTYWx0ZWRfX2T3KkBYCJ1Wn
 Gvt246TFky1jSOqPN1DYESV08pSWuMC65il2V61msgnFkhddDsHoGfuv5rdjglDbRgwY7fC/CeP
 w5iDlbC5ZcPXdTIf0AXMQFFM81KlLVy1qJD5YDA7s02y2W7DR/o3/0y1jjoOhTtjrnGlKWRXlqI
 Uif8X3pbcaS2OVhbr/76jqUa1o5aMO5/WfccQxAQN1BMpN71q6hlalLwbLQaIZ18uuA0CTPp74N
 BVgn+ij7+Q72KIbh/eFfOdD+eJguOhXvQ/ScQJgRrczlZV3VG8UsnHsm8Um/Q8+Mgjn6Xr0uHs+
 6m0BcSwAemwfRYJyVpRPVLHqpUS11CnQnRmXENh91ggHp9wDb9tStp5RrP4srPai7bDSgiHJdlS
 aK7jlaGHw0i5C3oYxn2R4KjSuXbeSvVVn7UcwH10SiYnu6db5K5MDV8KbE7EXF78wl+Efvw0lic
 MmK8fpM9Ck1VzUizR5g==
X-Proofpoint-ORIG-GUID: BPPY1mdTzf8G-rezVaOXXsxfZggDGKTS
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef09aa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rDS-UetJi-EPvC9khCQA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270072
X-Rspamd-Queue-Id: 668CF46DFC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104623-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

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
 drivers/tty/serial/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 9aa61c93d7bc..3e519d001e02 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -913,13 +913,13 @@ config SERIAL_MSM_CONSOLE
 	select SERIAL_EARLYCON
 
 config SERIAL_QCOM_GENI
-	tristate "QCOM on-chip GENI based serial port support"
+	tristate "Qualcomm on-chip GENI based serial port support"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on QCOM_GENI_SE
 	select SERIAL_CORE
 
 config SERIAL_QCOM_GENI_CONSOLE
-	bool "QCOM GENI Serial Console support"
+	bool "Qualcomm GENI Serial Console support"
 	depends on SERIAL_QCOM_GENI
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
-- 
2.51.0


