Return-Path: <linux-arm-msm+bounces-117398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bZttKx1STWpgyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B171F294
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:23:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aWLEYor4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UhMaS6PC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117398-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117398-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 658FF300B8D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6BB382295;
	Tue,  7 Jul 2026 19:22:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7BE366045
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 19:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452156; cv=none; b=uqiijXrziGn4l78D2i2yReGgLFnN49FUB3p+usBwUa27i9ujO75EHdznyvqKG3AlT7XS0Ch6tqP21VRuB0S7ozyY0Ly1wMyjLi5x8xQnHlLjgtezssT1cRb5yiVRBU3MAuTdlXcsiqj0+mYvnb2UnHx2sAnKygqmSfa3rSCgUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452156; c=relaxed/simple;
	bh=1Fs8N6cwVTIWmqFAeyUCV1zMsM4ASCH5uF4rAKhciGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3oZdFYWRBID7NGtskYBzc64J6JTajVXlvtBz441hrSwgiNwmbTBpgRF/1ahCrZZPYSqtynVkz3ma3z281/AjSlR8o9l0WZKnIkMwE7h/bCdC5VUuQrxwTci0V6dD8ftn2AS/X67zYkSPAKhzs0k7WPn8W9PbxuPCnXtV6BKEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWLEYor4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhMaS6PC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J58Ii471998
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l75MTQkX1SP
	NVbC3FrGgp64H9ib1BWH42DZHDWg2If8=; b=aWLEYor4HwInbMYms63/SrUsl7J
	evpOBhxgeGOmRLJ2H2oyR51YocdgARUxI0SEpYspZbM2xBOBnOu5EGB5O/+YMQz9
	tMiXTz4DWsd6k0VSoycA6Z7RKEWOvMgf7sIvUcgFpcJLjMFTGaapXCH2mKxDW1y0
	4JVTyHXJRThnA2gieFSKRVcpmMDP03+9Irgen17Bd38kNeyHalFufDXitw8ORvVg
	N2MDnD2cgLByI3eOuyfEXsm5FRRul2VihM5TdbODfBl7bGYzl9ApjydQyyTDti9P
	IMZhN4xnMW8ZzCYygJqr8221DmilU3UVqLmpzUM/13vEZ1Gbh3zlXsWqVqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd0ps1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 19:22:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so62542851cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452153; x=1784056953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=UhMaS6PCwC2K0MXL0Ocu4GI45mwPqJQrGmGUAP51+irnHIzWZVrdXCpTUup6loQ2nx
         i1Ia+1cH6Ru4AdtUD8/Q2vLa4UXXbhG/MAqusPgYYUmEpva9A2VeqaHf91FfXPPTvgGr
         1eXN0G5JIgR+tQeov2JHpUDGWSYJArkMXK7ac6V9HCt0u/cLc/zNqXekZScXXIeYHBUr
         CRP6J43M3f1DdVlHU2LWzqo3BMwF0S8DVS6rhpV3TFK88AL360WVgx4PxxSGqiW4Jh2K
         XQj9Sy/ArGbmJtNzXYH97BHnw3DBeNfws9z1meswghfZ0trXGcXmHi0eORjrmFRnUANR
         ENLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452153; x=1784056953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=Y7d+NoFATYLb9LsQeeFFH31gUU3doXkbbOdhaCggrK/KF4agQWZ2OBmqYYkP9CyOWG
         Z4aqTieRCwv7rmqX5lSxMnRD22s0lpW0FKGzDYLahDssRJuHyOjdSeUuheQaum5qqyy8
         OyU8fiGbkYDqHrK/h6hPoiO85bIHCd699ty02P6UNPOMEtJghFdZos8T3PqSTYyMj67Q
         IeJSxh9cP00hqWZHqTX2KvL97QfYf+id0+NSfPriFBl6Kl5BmtspNDBezMP8FJDkkxSX
         a9ICz+twT265PBYmCW76XkRanXuPsD7RVR/7mLLcONdmIp2jga91SDGEf6h1avgaZJUq
         WqeQ==
X-Forwarded-Encrypted: i=1; AHgh+RprZJdTGYp32ygFFqGHNH/ghFi1j/Y4TLZHjqhZQ/8WM1dmbpzXHy9AMu44SrCAKVqdkErR4eWAZODIgnSS@vger.kernel.org
X-Gm-Message-State: AOJu0YxFGNO5VmS1iavpD+LAhmuGbc3w2D/fTKlU4NAZKwczr7343bVG
	bLnt9YsCErPcUbF32uVuybLtWut5tB4mCUEXAuThL/5nLTeMQX/9Y/Al4EtHPxTxfI00SqVUeHr
	6S36HdFC054+l19UJJM+5y/mLoM7iJbHqJamTaRGwT4OvYFgpUd685/jSJUY/6v8O8LPt
X-Gm-Gg: AfdE7cmifUt1hzMjnyqNtk0UIO1RIwjToXTvRVT49yT8nNfSHV34xEE7N3mF5Z3FiWB
	bSacCr4xl8u6jTsNd1HArRK6pVUlFEAS7KU1BTn8o/EOvgoYWz/zZqbJqSzWv0HynSc73bue/nR
	DZ1p0RVeJceGz4K3sOgVs1FlOlMfvbQjVBlmX3kZI769SlSvWddYVyVg1b5uoGooRDDZHXXLkaE
	ns6hWCOXtP4tkem0BGkB9ZwjXpYetlaN0WbAfBlag837RpOKgjuIz0io2b5dBOMaKuEwn+/qoA5
	jDj//1R6bFYxa/o5Kdw38MB6a0C5vfSxzjUUBmSejWQSoSGc55aoleJD7q4hpCoo3YFUhjIEWtu
	WIkgPKn1BtN4/jkuA75shKVq9OfCHab7IQV+/1J1KSCg=
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72265111cf.62.1783452153221;
        Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72264601cf.62.1783452152846;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Tue,  7 Jul 2026 21:22:26 +0200
Message-ID: <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXyrT/GTzykEp2
 aPpXcfOWB6TMkX/TM8Htw17S86+cJ0+DdRa0NvXJWLbSHtKN0xDO/1lS+RV9jgYC4s8pXXKmjwM
 dRIJqGLCd3GpV8uwelkozd+GxOHEKaQ4JlvOs23g2cKVk+LoLdjp3mo53195XtBHL1rxCH3kp1t
 OECrBHjhzST6n1p6J8RDqVUqlQTWnHD/orlQDgu5NaZd2im92y/feGCPcYrjKHHloP7Bk8UwPV0
 Yhn37S8kUTdA9Ogdlgwlsvg43naxvqaqTrK55akmVK+gppa6ZiYZlFhg12GCkA1RVLiQQZdULR5
 ijZdKU1pb+a5++jtI8XZnNaCejJGIvkbU7FY1PJNXKQ8BQKl/z0gLKozIpBMSyugRBGmXthZ2q2
 71wRTJqf+gYNmY0htZi6uX8iyE91DLVPw9H0vEob6gO16Yj/29FqWC8rL9zenXv0NLs7FhCr/pO
 xk7CC87kyueA55ZiyCw==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d51f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 9DgJU9OCbGoZPTzB_jYR2PZKv7BgDuoe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX7iXN7x5tx1fZ
 NL4uq2hfHCKnP+UOOvBeQz3H+0cdBiy9vttDA4A7SWaLLIhBlAQxDiVs63qFf0bqqDpDnWiz7N2
 fmsMzxRUb/3ftr8XS0n7imNcKbhl66I=
X-Proofpoint-GUID: 9DgJU9OCbGoZPTzB_jYR2PZKv7BgDuoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117398-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A31B171F294

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..f677966b52a8 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,6 +26,9 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -45,6 +48,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0


