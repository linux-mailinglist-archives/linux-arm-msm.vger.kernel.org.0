Return-Path: <linux-arm-msm+bounces-104627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NpaCDgL72n14QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F746E162
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B3D30B51DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDC3390991;
	Mon, 27 Apr 2026 07:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShBIFr+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmXupt88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E613939A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273276; cv=none; b=SZg5737M/VzvgBqeqPwvoZ9xUYeleIFez8LvSRjjPti7RoeFllNvYQ5Uf6cQsu9sxkVUUAfuId3OZ3lfia9d3gVW0NowyW+KfjDYiCPgK7q/2OaihfcNGpCLUn50Y7bMlzLER+vm2KacVgRUChQZc6FAXKF156sDcIwaTpRiEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273276; c=relaxed/simple;
	bh=qOYbUwZti9vKGZJJrZFHC2gG77JmqXwyHnddoQKDN7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gp5mUJFQpkDL/ZeoEkrX32Qs57JioGHaCB9BI2pd8lhzCOq2bLctAD90eQsX9TgsJkkdN7AH+ceu9USHSTkEUGzjj4F5Fd1J6V+E2a+kHe0LSnljK8FDcYbnlHMtY/oJfH0bm5t9pAhgi2TFaxkFihgTEr97Vzfp+b2CdQ6Cs78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShBIFr+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmXupt88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QMoKqW1642712
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v0LeL0rsVoPgsd4bEw7xJsbisSuQXdez2dP
	rnAnCRe0=; b=ShBIFr+bdwahjX4GRp+m2siiaYpNtVRaSM9SaKxtHzIaeHDhvP3
	HrlLf+KCznaB6fSa0zwgwm2CjFLaNQFk/mhSEB5NvHFpgluqz5OxAE8m+OnoofUh
	Nw5wLU3PmMFyZSto2GNQvAvztlc+XD1qtFksIujqbz7bknlSg7O1q2qb7Hvl8c7Y
	k664edCb+2JmBytql7f93/DvwR05ETgVCiP9k9G9q3JKPRVQXX2ehKuislFXP94p
	vtlubC84FsFSFS9dConqhrsQ8fn5/WojejPzMmCuiI7xONPHyfzT7SDyyGqXs1LP
	1onXuJvXpZ7w95QaqNDSi5et0xm6B68bBdA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2vtad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f4a1cc334so7136248e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273273; x=1777878073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v0LeL0rsVoPgsd4bEw7xJsbisSuQXdez2dPrnAnCRe0=;
        b=XmXupt88/ccErU8PiNTc4yc2MfaK5xMOH64VQDMybbFo/QjEQKOAPUE7aTOHkNj1EV
         mnfqhONUFWSTZ3O1+oPOh+L1voajArD/9kL4oMgOKlkfgHS819RqnMGqv+w88xlwY+IA
         Rzu+0TzvIqOjA08WNbTBg/xPofStlIwHRmIn5++yeEStcwuHK/yt0pxLkLyzAlp7wmmq
         EzHwEaxuNQJXtPCkSMrImKGxhab2Oe39T84gZoO11pfYi4lMuJzXIfHnC2r/SB5jjLWA
         AzL39NxxHbSO/ozN4lea+sBvl9HCaX9boE9H7XouD4V3/tIsDXqUmLCDKAVPYuYZCeD2
         yUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273273; x=1777878073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0LeL0rsVoPgsd4bEw7xJsbisSuQXdez2dPrnAnCRe0=;
        b=EcROErob3E6UIDI472PRXsMlgAEK4VnqnuQAyttqoTdNxMhoZNL6eVQirUVNGNY45h
         hkQolwNqFR0KS+vc/yRj8CooM/h2eT69Od0izCt+vO23j5t3YRga6wrokFA1triJVSgh
         TdRIirxl485OJd6U86Wse9GVxW9Oqv1TCACmXY8Ur523ztX4Bf93PMS8uDKqZwaHE0Fx
         OmxN750ZDHKcMM3qT+A6zbYRV1UMc+BWYEFgjY9H31Hs5AT7f406fewhKp325buZb8mQ
         jTHEReRuOWojnZyl1HRyTCMIoZVHW0QQAh0TDtQlaQSnCb7hFulC0h6EYPH5qeSZGvVN
         hBCA==
X-Forwarded-Encrypted: i=1; AFNElJ/EqF2cmKIOGAWp+4h/kN6m4cV4MXRmmKHowcW+9IfXTOzKEUpRciUPtkN6fJCt7Hgr7atfdAd3ah0JjFeW@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqAbY6996+D+ilRlo9+WqIdWqdq09HOzCU4bIgpG4gjfQuGLg
	OwJrugUqt6PVtooEQ+MTUI8tIWbf0BplZ4mGtqcYFCxWShjXHZHtt6310XPHDrcyKjMQq0vh0a5
	e5U14ZQQ6cQ9rH5BqF4tnI23zfuVdhj7GHuW3CaJdjVVXLEM9Qz1RYhFT2ZupSIflP0X8
X-Gm-Gg: AeBDiet4g1Q5UidGN/earoYIDMQQFA8s4Fjv52enI6555ULEa37+F1FoNIwkl67oT4P
	WyhNazObOYvF9N7PHliw87dXEKojF5jL8EYQ78xcSdHEe/2t08y1l5z8la3iN9A78OiwtphUgX3
	ED6MXaNMEfklEs+iubPXombq3Q4GvEDPp8N53iNGLwkSMNVdIIGh4XdQ8rvZoESzLo0G4QjyIcc
	hrf2NyP2FGexjmikwchgJAq2LLSd+UgyRX72ME+ijR64E1Qll6up7YGKnJSnH0KAHYelnYk9di6
	GszP/Fx8MKlyuOKpkha6dyMJpVfjrDWdExj6Wo30IFl24OFnPHZFj5MlHK95FgyuD8t0/nSKL4u
	f5vrxjkMX/EYqHB26HoE3zG3BC1V7oVurKrMTdqWeS+U7XPtSwUjORMhv4HS5on5XRco107euu9
	Mytkto6sSQuQ==
X-Received: by 2002:a05:6122:83d3:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-56fa595340cmr19910516e0c.9.1777273273501;
        Mon, 27 Apr 2026 00:01:13 -0700 (PDT)
X-Received: by 2002:a05:6122:83d3:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-56fa595340cmr19910459e0c.9.1777273273128;
        Mon, 27 Apr 2026 00:01:13 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm38080035e9.28.2026.04.27.00.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] mfd: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:10 +0200
Message-ID: <20260427070109.18271-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=qOYbUwZti9vKGZJJrZFHC2gG77JmqXwyHnddoQKDN7s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wm12W4oQT6OX7XQcmclyE0Jf5Ms/IHAgWrXX
 taLBmEGXleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JtQAKCRDBN2bmhouD
 1zUVD/0e3xxxoRRh/pVLlpeCVkTWjjWEchhmjfn01FIrKi0Rj/r6xMKueg4va8Tv0mb9FUMJCBI
 5cyIG3ieLRTb3wInI4E3p6de1O5oSLn5Wewe5oJD1lJDHh40HXGmJOs3P7/x1HJjHeDWL4eHXn0
 huxzGzBEKkueASpSLyoy7NrFquufQJeTZVA03kD2IA7MZtYMwOEJzM5j32ccSefy3aWNyU0WDo3
 JpS8jkjrQDiltPxRkOgksNWeGY0DfYQVChvcLqlsq+fEiNqcRVsr2wXKiYF+nZq44tolKu5DVks
 NXlaHkJlZ9/t3a756jMwt5d4Jk/soE1J97zOPLhmff5/uDkreWGAIQ5OkHdswTtCm2RbYiTrY1G
 FYKCdOr1+CI0N3dV5yyqqpZFVSLaWrOpwsaPfNzmCtWd2d76E8DfXpvFNXvAdN2O6k4jwTrOVx3
 BetdQ8hG+5KrEM8Oh2OR8EQObOvB/XyOe/FE/7K+LT0wLUjUzKD+7wySNeOcrsJWLbC8lNfUeiH
 sPhuLLoL4LxVEii9T0uO9SSg/dHHQNCqRBjvSO3MyA4S4/SMg8kCK2gISx/TJGUcJ0YrK/uVV/G
 SJ4rDIf6w7ZVQCwNkilw84C+RBTaqOlZQFMoEKmTUO2gYVrOP2Xm51DARcziRfhqVVg61D5f/zI 5AiSEpDFH+jZb+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EzEoP4hdYkIZ0WrorZBhPCfsJr7tdumH
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ef09ba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hVColWPPkxbLGD05XNAA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: EzEoP4hdYkIZ0WrorZBhPCfsJr7tdumH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfXzmrEpGEPSRe2
 Ib1lFV+R92nOYSjdeijMHa4+KoGFPxQqzhJPdWMjKe3lmRrnJo+35VL+qbtJUIqO3P0+snACfQ9
 BaEJrHrZ2UlOMxZa2IfTL1/5n7mTFwkjg2KMF4olO40d3aMDb//MFwk5mtPyfYhZWvC1tTOamv7
 kneO2sTiep08xzTkXOVpeT1o5LUU4WI4gqJVN7jiZDLGC4EPpS2ppvObOEA3JvFaBQmMqKfQPad
 b8o1uqfXI1NwzWmI+mFdjMyqrnzpW8Js8S7P6aveWJBm3Rw05veThi8Sy2EAa10GP4KpNlHZA6N
 6uMGEUgJNFoFC47P/CIfU+6A8k7qYTcR330PUoU6COrAMB7dV38hnGnmV/XF6YtasUgg9Wd6zf+
 V2NLoGeUfS2aTC1rUifhp4uBl658OgJQt8MwtZI67AeOqtKHmSLSzFvfZZzuV3Sc9yAAJrEoxST
 AOYh5iYwsZuxtjQccAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: 8C2F746E162
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104627-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
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
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..b9ad6cc5cee6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2388,7 +2388,7 @@ config MFD_ACER_A500_EC
 	  customized for the specific needs of the Acer A500 hardware.
 
 config MFD_QCOM_PM8008
-	tristate "QCOM PM8008 Power Management IC"
+	tristate "Qualcomm PM8008 Power Management IC"
 	depends on I2C && OF
 	select MFD_CORE
 	select REGMAP_I2C
-- 
2.51.0


