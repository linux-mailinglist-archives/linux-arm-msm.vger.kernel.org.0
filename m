Return-Path: <linux-arm-msm+bounces-117399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDTvBKhTTWqryQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:29:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C671F374
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:29:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SL+OEfYu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gMJpxJ90;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117399-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117399-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C317D30FB9EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B883932DB;
	Tue,  7 Jul 2026 19:22:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF63876B8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 19:22:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452159; cv=none; b=GLS9eOoc+gaUufoHiE7/VdFAAZqGXrg4njmQj7O8YTPRGLhcuoxFyg3x707RgjcoT2OPcoH/aq19jd2r2uEUtv6cwMfFiP7ldG56xO36SajmDIT1du3kokhh+md0rS0IxJ/CnDrH0Z0Di2khTminxfXrCj28mNuRPbDNGTUvihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452159; c=relaxed/simple;
	bh=MI+RWUz8fxMQfKb2EV9Pahzs/80+zpEY10m1N3YsiXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uOXkufX6IYeQ0Hi1jB+WO+t+m6Bi7VWk+XD3miU5C7Dez5EG3qwNzJNwQSGfz0yuYVOfL/POnTqrXdMUsfeQiXsZ/7HX6V+X/OCnQLPD0FR3ep5/r5U0gILxKSG7uSaz24kVam8HDfqTuHwoPN/MZIL4BOKMOggwXxTWa8mtpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SL+OEfYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMJpxJ90; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5xS2296861
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1A6ZSEVP95Jb8y66z/L9RcTyDzF3EYzq9P4CGXBhNw=; b=SL+OEfYuqwBBpvnH
	pmciEMFS/qzHUaPhZRqvtqCdEMrMdgU6y2rsoetjA2CQXEJq7Y1ZE49jbNY5Jyzt
	7WD/IeX9i1vdbFrIwj7TocoIm6MgDVIshN3Y2OC/CNUM5mj+didIailZhZWdpcH3
	cPm9VkxAUhnEZdR+W47cLmIs9iqVLs6adpANCAQf+wiEZnzGqFhm19Y9bdU1YThp
	eoEHj6b6h20cdrXhwMafW3FIzmDgMAgR6DwDvqdu9l1nXgnDkgimZDeoIOiIFfAr
	zZ62cVz2sZkMKkVK2vJWrCKpWqjCFhdPFescZlnBwIA5OR5sEeRNs0AMMu0XsgXg
	uOlZ5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su73tey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 19:22:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so57613821cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452156; x=1784056956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E1A6ZSEVP95Jb8y66z/L9RcTyDzF3EYzq9P4CGXBhNw=;
        b=gMJpxJ90Z4zAgz8MaKcqjzjPC8SWpuSGXvUDR8Ec2qxPdljZ6VQkggRPFj+rqux1rF
         /iW23niNd5B0FrPFP1B3dMdzQx0hCyZmFgW04V5eGOUDCXHJYZ5fXkMf3sIjSyfzCmja
         eni3+JN8PlupuHmkMex3exScljuqfgFzGiUD/bbVH+c7AURBvfrQUTGkN/Cf0nMCA6dO
         Oer2EryObPktqS2CJ0c0p53ddRXxzEf7zFPlzFJXrp14yel/ETtatCa57vAHGks8MS0p
         7taKknnSBDqQHpELToDARphXE9arwMf6YxErWwhGU0lepVIsh53B/3Bbc5LhXfF1je2R
         ekBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452156; x=1784056956;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1A6ZSEVP95Jb8y66z/L9RcTyDzF3EYzq9P4CGXBhNw=;
        b=UiiTGGedT4lGkj2wASIGyjegpxmL2PIEJq+CxTb1KfgeoVCxAXYGxRNWKpHRX/z980
         zvc8VJESC1eXH4gckv+QQtX5X+EKFUAJKSovfhEkSkf2Xze60bGco3GA3nIZZUVQUsgz
         HyZ6Rea0wiyG/eN0LqfXEFjwOBYLsoHJ2U4oUWdXiKfnL7f68iv60klAqn06+I2rsSDd
         4wosLL3MgjSui+c4acE0nIe/dJmLABK4s0gXbG5kBVS+gOaLou0BOOThSKLN/4C4B45N
         3ye4+N4BQJwbECwWTnIVB8cIgYTg05mLmsItcK0dUqgoiOXbLiB45RA5dyjjqynIml42
         KCFw==
X-Forwarded-Encrypted: i=1; AHgh+RoJhMq60H/huPYHBeJhFsAcvqfyhJlfAFJZxqpKf8rnz3mBVriIEx00o77pMmqqR7OIGeypedtdmTo3eKqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzkiFUOBAipzlLb6BzHR3pZTbCuUsSz4eJI8LSzjcGhDNK+QKFB
	OcqCruRcSTwpDE1PqfAzjxAa0wgoqPo6whRdr8LpGIUnIYTOxp/EXg/yVyyT46DofiMMtAVN8XS
	STF9QT198db9bKD1BLj6hJw23rlHHmFCpaDT6/0XCz+qgm3RO4izwfmEXWl5RWtZ6GC6W
X-Gm-Gg: AfdE7clqII9D11TMh7WNGkuYHlviYqGTwY4nypK1Yvf6uwmnimLt+4WmvecMMUOMRoB
	HUuPuqJ2i/DAED11lMi22FqwZefO+sGD3FeH9e5M1Uk1hVTZmJJUC6Z3JnVldtJQjv3HX8US7ec
	3l/7P2PyNPiL7zqAJW/ZhXZFpMgNSGFPGcmmVAj1zpr8gahN7ao44sGQZE46oLzThhxemWltJaC
	x6aZB5LCguG6pjgBlTtiPqTc7pR1MqIPrrauJY65v9fJI2KYfOGl+XFQUQ7jTifrWcLzNsVTwnD
	1NEO6ko0g96w01edG1046jb/s/CFFgCuHk1PKnrs3+VJ04TDcZiohN59TqHgoPW9IjPFlrubJ0m
	gkCh3YdlOO9uLTvXYZ+DWDWBXU8o/VizqjVPJ7E/gAao=
X-Received: by 2002:ac8:5706:0:b0:51a:8c97:9385 with SMTP id d75a77b69052e-51c748e086fmr67995951cf.60.1783452155407;
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
X-Received: by 2002:ac8:5706:0:b0:51a:8c97:9385 with SMTP id d75a77b69052e-51c748e086fmr67995241cf.60.1783452154518;
        Tue, 07 Jul 2026 12:22:34 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Tue,  7 Jul 2026 21:22:27 +0200
Message-ID: <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX22UmNrRWTFPF
 ccLb9CS0dFyzoswA/AT3MMv0mUD6cMclbT9J+fF4XczfmNoIM/tt/Zz1sxVmBMLGTiwU2I0OtBd
 mKFLY2uNsDjCLL5JhDM5SCALsBTnRmZUiyMl3WfLX+edNiBDAxOnSn1N5XxaAg6O8HxTbCq1CT4
 zNCBFb/EPPma2TgcAS+GO3zKSFf79ykh5csZedU5mYXWJ8ZOqYs02fZJ0rBiYTEd/xLawPw2bDC
 tRJqaT3o8P5anykRzfoqgggaSq1qcMWTW759NWGoGWq11jZkltUdF5BiJJw5qv1Wzw7cucAys+1
 hFK8iGsC8Bs5y+j/M6Vkovho4aAH/v4qYNxPMtIuA1ta6v3xzBjeogvB9RaXX9Gr/rci+C3XdIC
 FBdzgvufeeYGKlnqqoPh5jfkxOPbf7r6EGm9dVZL9oZVk3C1L2Nk/lnrQpQnkqpj+uPxoWB6SpJ
 tB/q1aBdzPFXIxFvYRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXwwiMyGqXYsVY
 uiM4459pRYF+8Mz0gmnFU5BMIk3ad3s4McdaXx23wribIAT/73LCkmf9fuAAr9xjgGfEBbWwioe
 fpnHO1QiAy9gcy6RFBnvl7fotOdqsUI=
X-Proofpoint-GUID: fPi3XjbISR1vhlw8SLkxJ5ACec_3tnGN
X-Proofpoint-ORIG-GUID: fPi3XjbISR1vhlw8SLkxJ5ACec_3tnGN
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4d51fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=9Fj74KSAFJAma6AI3IUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117399-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email,intel.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A71C671F374

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..121043348740 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,6 +75,7 @@ config EC_LENOVO_THINKPAD_T14S
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	depends on INPUT
+	depends on HWMON
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..fc480f093238 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -21,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/units.h>
 
 #define T14S_EC_CMD_ECRD	0x02
 #define T14S_EC_CMD_ECWR	0x03
@@ -67,6 +69,13 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +102,19 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec_hwmon_sys_thermx {
+	const char *label;
+	int reg;
+};
+
+struct t14s_ec_hwmon {
+	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	struct t14s_ec_hwmon ec_hwmon;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -555,6 +574,114 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input ||
+		    attr == hwmon_temp_label)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = ec->ec_hwmon.sys_thermx[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value);
+			if (ret)
+				return ret;
+			*val = value * MILLIDEGREE_PER_DEGREE;
+
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops t14s_ec_hwmon_ops = {
+	.is_visible = t14s_ec_hwmon_is_visible,
+	.read = t14s_ec_hwmon_read,
+	.read_string = t14s_ec_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info t14s_ec_chip_info = {
+	.ops = &t14s_ec_hwmon_ops,
+	.info = t14s_ec_hwmon_info,
+};
+
+static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
+{
+	struct device *dev;
+	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
+		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
+		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
+		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
+		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
+		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
+		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
+	};
+
+	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
+						     ARRAY_SIZE(sys_thermx),
+						     sizeof(sys_thermx[0]), GFP_KERNEL);
+	if (!ec->ec_hwmon.sys_thermx)
+		return -ENOMEM;
+
+	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+						   &t14s_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
 static int t14s_ec_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = t14s_ec_hwmon_probe(ec);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
-- 
2.53.0


