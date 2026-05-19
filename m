Return-Path: <linux-arm-msm+bounces-108438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN+1CDs2DGoKaAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:06:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1057BDE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2971D301174A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDA2477E31;
	Tue, 19 May 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhxY9+z3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyAiDhBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8E39DBFA
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184882; cv=none; b=epyI7tnqaALyag7CVlO2k3LxUpWmMHwEQ/vSoe0rIPPsNfHncpN5iOAUiJT9cGo5uG3HIFmg3tOprvEpsxiK3/Vjjje+Jal+JomfPJJJqKVbJ8wPYi+OJoCP/H8gxbNW7JNj+MlVf9uS/GD738igGiAQvH/AxyORCMvRN9BzIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184882; c=relaxed/simple;
	bh=lWVTpz/kqKcY4/UPeWm0qkYby9NGoWOGYeSZguwOyIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdOLkFcx3QkfxfZdRUabZYlFpHV0RIYeGMPnKbQD6fSbDKeSxobFQidw4gurKudHmX6trajFnZJlMvzfjJoasXU3EhcMHWGWLQ28QEHahMudfnc2NflDF4R2Gv8bUWzIqDmanHpgc92BTo87zt4GaXvoEZ8U41aKCZwsOWB6dfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhxY9+z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyAiDhBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5a7nU867004
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qwsco92XKy/
	c8TjFQLr3JV1bIXoXKOJTtm1UZjJY3mA=; b=RhxY9+z3lf1xiVJE1uNuPG60l1N
	FDjDMUPn7ler7sFOv2MQ02kQr5dOXBsaBQq9jVGbp46KbxxY4XXYzf6OUF+inm0h
	pl6sq8n8A1I7H1noFV69jL62OE/2V12N55V+TeGeYzu5sDQm4KLDkL091aXCFkdK
	MufN7J2g+ucOXpoRiLu/NyDd5SvwWU0vmGud8qNuBNwtkccCunCrpowXmaCqqkJY
	jM5TdX9lm532CWTbfB11HT1WQs9xWroRzCFi2TN9UEpLz12tM9lr+bncD7p/zC8I
	5bxJiYkOMUzGtuz9TRX3pIzV8anUlCCge+vLU/6y/bEW+TRwA6EzaCHe/wA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1h4u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:01:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5163ade1583so69299271cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779184880; x=1779789680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qwsco92XKy/c8TjFQLr3JV1bIXoXKOJTtm1UZjJY3mA=;
        b=hyAiDhBEFDcV74nWxQ//9sN13XIjy96/eqLMelwkZYsZrN+9MWLe0+95/2vNMMbFsm
         xqvyNyLguRdbGCLCnrjMLwuv8KA58I+eMPoMeaZZa82kqfzK9wYNz0WU7qtKutNbK3bZ
         Z5dgd/oOA0cGBBui0lurtfG0KMWQ2Nb/AFdZ4s+ZfdlOGEpVjPVoeP9U4ly/KnNq9AZl
         MQXnEjYMYc7CkYJHMscJeoU1DRrbkgvfaKEB4F5+lwb6Nucui6oKMWvyVfLBr3/DRxHY
         ltGNhE70F9i5DSsMjjH5oJ67VcERbrSqw8JHT0CxDt0TqocryYWtb3II6e4Ye1dZV6uH
         RZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184880; x=1779789680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qwsco92XKy/c8TjFQLr3JV1bIXoXKOJTtm1UZjJY3mA=;
        b=J6QY7GDesrE3WRqS6R4KeGlHDR5p3YEoynV80GwlR35hSWg9c4GZ8XWfRrGjEe+Sq5
         1L+cofiGetWmvKCC8Rq5dxADCPFB3jSYrOA0Nqax261ohQyJ4MZqNWpse4TBCVzphb0X
         ozZh9P4vQT8mxOGr3dFEhlPJFk00SpIZHCnw0OJWxbnsbrsouBMyR/1SdvvWLHgOrvL7
         bHXQUwXTcc3cMPrfgY5WHEy2WTGXuaPAd/4Ap2x6A2B/1yAUa6CqRkJP+PoFwZykgDjL
         MCauerFygR5WvY9OEfr6bNqE43vgUTXHVcripPRHSYMPyYiGByNsTNHFJYGy6XysQt0f
         E9qQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zhf6Me86C0gNC4DwY8BrZRJ3uvG2FJJfTf+0vOQ7dm7UOBufps1j0e+D5+A9txarLuYUBpgl8RLfogQwI@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmRuR0X7XsbVtn36uZBx0SksDaosuM4Upf+QB83xvkIyVw3Yy
	utP2D12TPnR3ycuSz9Xse4iqR7pjlM9OfwNow4AET3UD1sPChACV6oMkp1TCsdaPidGQOmGSbM1
	seR85lTRpXL77OlgiU92d0XzvYlCe2cyTT6vML+xEgLFsEfdCvHBSn2UBL8FMquvBnB/e
X-Gm-Gg: Acq92OGPCooBdthPeCO9u8F6C5ZScdzRRMmGv7BeQBwWuj3U5EJsKWTwtkQB7Otv99J
	OODchUgvQOSdQHDYUy2b8dRHfCkZbpcvMpu6TrYUZ8bWfSkUg3/eVrhMyYaEXnxM8WRjrfO332V
	iE6WDnzqC1pK2uTg7UC+7k2pkjP4ms5t1fZkWdGYSx8Aj/ghIxWJ5OwZIxapXqMP/cY1n4mzbXC
	UwoVvgw0mdSUe0btSpTfzWLaW79sy8xg+q0WpaJ6somjbPmFsfyUbwUbl/W6euaJOeAEEGhnf8I
	/E/AHW0pgE4EQnynwodBurNjaqlS+Ijb9LeofIesgf5ul3CIPlBtY0lavj/5Pw6WdPywG/62KHa
	je7/ui/ZD6bWzWDNFz/O2FPvLpS7XAlGmtU2x
X-Received: by 2002:ac8:5a53:0:b0:516:5019:d28a with SMTP id d75a77b69052e-5165a2037a1mr266074261cf.44.1779184845268;
        Tue, 19 May 2026 03:00:45 -0700 (PDT)
X-Received: by 2002:ac8:5a53:0:b0:516:5019:d28a with SMTP id d75a77b69052e-5165a2037a1mr266043091cf.44.1779184829684;
        Tue, 19 May 2026 03:00:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm44266388f8f.37.2026.05.19.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:00:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header includes
Date: Tue, 19 May 2026 12:00:16 +0200
Message-ID: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lWVTpz/kqKcY4/UPeWm0qkYby9NGoWOGYeSZguwOyIw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDDSvRj3rDpkI2MQFwfKt1ibfRNW7VtgVnFnbt
 nO4IBOi+mGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagw0rwAKCRDBN2bmhouD
 1850EACL7wIJGpPaaqpUhNUT+WuK9Y/IW5sHfdEGyaqznwt6caAtiglmgQGbhfX860Blu5Z6UMd
 u9SsnCzdhKto1L8R+lS/qWpRlTpXPbo88LT0k0nQ6Q1+k/jWSHrUPP9qn/hF5knsX6BObtkwhNm
 bLia0t0lI3LsZ2t9TlrC1hXQLbFsAN7Pvfnl0q3NpZZA71aAvZ6uJd07YI7jpUGyuwRKCbS5ytX
 jBjtCITxSTzxWP1gt9Fx184pMXn7lR+ca7hWk2heAV/bxN9PT6m80qqw30+YkVqxM+lxf+GDeve
 o/0SpY43IuMh/L1EWzsrqR+D7kxrLQkxVdgH+IGq+e5SFNavBj1oFCkLuNFhDXpeF8gA1XNSjk4
 SWZxzibXwpzfr0N9yCV/EXKaI/rsBWE3gFQwiwW+JIiaX7CWJb/IHskCuQDIVYGBA7/dZEPXrBo
 ma5YPayq32E+9cQltvyAP1h8ofOnsiGIfUMg4XDzBpOb+cRyamb3eP85E+1AFvZop8Y3ICf853Y
 Xa1/mUs+p1PwF07xk2uAtzmx0N86oUfI96SWsVdfgLIfnxzu+kQ/cqqOG6gRG0msq4M7GqJ0C2p
 mQ1RM96ZfYJn5J5kWgj7Q5W8i6soTX9zUcL3wSM792QWyqxtRjudX1pjMyAYEzsBCifQd5hTWTv DRZrD4BwKeq3OzQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA5OSBTYWx0ZWRfX8gXIKbxd6lSK
 NI+RsyRIV3OTOUYcs+szv5iR+eZjcyyIhenFXCu7ZctK50/orvgvk4nuuigcJNtfYEt9h/L2o4u
 sJUtu5w0eJYWWG1O+mLbFsg56NCssNTTCJjOj8jhjaYPnlkGfvoz1tTtNfhy1hVvGoFjCpZ2ECP
 zCDX4OSiP4cDN3Umma7YMdOumJrOtx2v4dkvw2zYhmaiWpykg18Sgq0AafIFXaox70w6l81bLCL
 8oU1P5mFuSiODm1gr2gdMjZVOyYuPcx//gTcs9qDBbzhmoz4GLyY3a/xJ9qBxPBneZUsnUkYkl9
 Wwt+T2l7xkNH+MbeboMLD1mVk8iYrE46AjKTb6AV820tZCAzLl+/4XJNR40JjhfS2/aEni/qQGy
 R3T7lWMdAuiU64dpsW1OIfHLFrSHc3+EUXdUOMMe5eOt6VdmZN84scuUKmxoAG2mUbS7FHLhMos
 8EFQC5fl/qn0vZGwOPw==
X-Proofpoint-GUID: y-ZVez6V6kxXPxPwj4czYqlMEzLwp_RN
X-Proofpoint-ORIG-GUID: y-ZVez6V6kxXPxPwj4czYqlMEzLwp_RN
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c34f0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OFmlXADJgatc2Wn79boA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190099
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108438-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CD1057BDE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unlike other units in this module, this one does not request interrupts
or regulator supplies.  It does not use OF graph, USB role switching or
TypeC muxing APIs.  Drop redundant header includes to speed up
preprocessor.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 3766790c1548..35320f89dad2 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -4,19 +4,14 @@
  */
 
 #include <linux/err.h>
-#include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <linux/usb/role.h>
 #include <linux/usb/tcpm.h>
-#include <linux/usb/typec_mux.h>
 
 #include <drm/bridge/aux-bridge.h>
 
-- 
2.51.0


