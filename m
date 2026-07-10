Return-Path: <linux-arm-msm+bounces-118307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VM/sIdj7UGob9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:04:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411173B921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:04:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gBZn+iDi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iJzP9Jcs;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118307-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118307-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60541307D148
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2358A2C3245;
	Fri, 10 Jul 2026 13:49:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75240274FD0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691394; cv=none; b=AP7YKoiObfmmk59tTLno1N14BGLZTlwNXa0Rd+TCyBVNn2q7Fnn4gL4NVxTDH2Y/39upZM+wTO1FmuvrbInO/D2u8WuDB6V4n8zZfTQXujROsBFDa5dd3TTybEgm6Lo+qJHyDKm4dxVNJnJNxORmaUTGSqo2HxbXXPov5vHRkvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691394; c=relaxed/simple;
	bh=zxBMczz7tx5uTlYUiWoyepHpOMtPgRVLKVk7BjgiHKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PeV7WXKgKtuWaI7KymFFmUmSdAZVhbkoN41exnHh5EI28eLOAb42UKd74X0zHcmFrFTFC33mb3B94EFHAanqRdll3mOgcw4kvl2myUA7WHq92dZs8LzM2fcNUpD6OFHnexGG0l8kdenIjKPr1yFjRi87jLL1jGMSGAiGCFoLLAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBZn+iDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJzP9Jcs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD72va923501
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E+JuTe9LyQf2nOeuBdIrYz+WJ8qwMfc+x1coqRussb0=; b=gBZn+iDir8uMrIci
	AMSXx5n4MtPP3jwCZmPsBx7PZxaFrw/4GrOiSMwXJYa8oLbbp8Ik4LzfeXt9DwUW
	PE/hGXLwUC2wpPjpIjsMT3b1VCynnWGbOUMm6gpDvkZBTb3+V4PGvgu77xZDElzW
	QYxakZcklMRz0z4bVi1oRrFWFP+ylQdYGn4c/iOOSxbSWXsz9pM32F73Hz3ikur2
	RbMeWnMTb6Dgs7u7rPQR2wUyHSzfURlyDgiXzmT27COF2ZLQMGi9qU6g7xs+nOD+
	UAy8Mg//vepNF2tnRFC4ocy4wRp1jQEjMw1VR6KA7vwTPdooxkwY0zbSXExql/f1
	cyxBVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0na4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:49:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso6717121cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691391; x=1784296191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+JuTe9LyQf2nOeuBdIrYz+WJ8qwMfc+x1coqRussb0=;
        b=iJzP9JcsYFkSdVbGKoOZ/42NsaP3g0Ek+CzaHMqsc4gAlI7KJocPtaonq/fojoFvrq
         cXzMu5EeyyBZYpSyMTRKhDatC4lgePZI12EpCLn1Dro71Ou03lBdqSmwwEzzT2+SY8Ik
         m9ySaCHxh9Gi137iCW4iCE3qJkRRDm1JXk5kQv1X5He7cmnj5aP2K0s2OhgxKIamxEGd
         lXvr70czeDf2nNLRLHNHZIrMCJfDkd+jg7iFV6QKEf46a1DidS3rWyvb5NDWFL54tlei
         D5YMH1eoMCK3zzeaFqr5XKDpy6mp3608BcVSbadgOjoN9J/pKfUK1xDKoaeg+Rn0cn00
         pXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691391; x=1784296191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+JuTe9LyQf2nOeuBdIrYz+WJ8qwMfc+x1coqRussb0=;
        b=OD23ptCpJRTPcZnerBr/2lfS6nvHriMAFkSVp2drvWryx3nQ94gceZNqTcGLsy5fd5
         b2TsXTcxOg5tIkRklqPxkXTRVJEQP5u8O0U3jYoR0JXXJ6V7zY7nb8rBT+Xq3h01uA42
         EwnX5Sq1J18Gw9pCP8QlxnwMy2X3C9XQSN6tCslUR0UOIh2FJFwt8CkZwTgonpZsZRcy
         LFe2X7WZthbo2mt2G58TN/4pjilqt7sWAOgKOzXIjcMXUlFIEwpTm4JO3J16avgaAQZ6
         5fwZrHz7Rz6glNsu0CqJZHwVg62rKsJYOXLNnPLEBs7+X8SgWfmnLAAyXQV3U1cYpxjA
         8rfg==
X-Forwarded-Encrypted: i=1; AHgh+RqiVnSDA2S/g3uEKPfjj3SPaX8BHAvK50r9Cgv97HoMIOMMVFgwvZLpv4PwglAaS4I6/DKx0AioyOPWub+f@vger.kernel.org
X-Gm-Message-State: AOJu0YxGi9v7Ca2ZEFFrfLIJtEXRywfC1myI9uDPmFo8OI9qC9xjiHGt
	7YnvxI/0cJSMqkkpYur87m8thk6/tOE185GFvI1xQtGzSbhD8GF5rT3QqdkVlZmOLMepXpvmmet
	wSuPvxYn7bxaXpzp7N8S/NEhnZbo0yZW9B4pDznE/VrR275smbsbz3JLNbswfmtZjx/vP
X-Gm-Gg: AfdE7ckIDTexLpVzv/4Brj9o+XhoEByF6LwtMgsf6mFEEGiHwW3ZEtLN0ARAqlNjhPA
	JYGdXNHvnov1rFANktIasRkl4KY1FiUYlFeBvIl5PSYNDK6mH+dlin4Y+ly9yAJYj0ql8nPOU44
	13vhaisSgyGCrPUx+fpkvAuYEwwdx6J2196lZvHhugeNEJOrGjkzU21N+XpvoMDcvl9qJmjHeYG
	PjXu+yWqG58YAuyGCAdI4B81K7KEYm11uBb/rWLfFXoAbDP6aPesNWzqzmBxW8U2E63BIz+n62X
	Z+9Qmxv0qg20WFSUjA6HJ7f0nW+P8KWSjx13zMf6RgtyZFHczLysmcgqALI5mEvLf2WT6PzuPcE
	iQh6O3buKzNd/kRcr9W1q89SVfTEl1OKXAhYJ1/u9ye+SLUkchfxn2N+6gHu+bVA//9I7/6f+iH
	CpR1MD809YB0nXVxn2+dH/TvSKHf8gNwi7lgdZis2zJPGCHmWK23L1Z+ExLC0p4azt567C8mbRd
	PrcHPmhpXGEygY36VDS
X-Received: by 2002:a05:622a:118c:b0:51a:8c97:938f with SMTP id d75a77b69052e-51c8b567917mr119635441cf.70.1783691390496;
        Fri, 10 Jul 2026 06:49:50 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51a:8c97:938f with SMTP id d75a77b69052e-51c8b567917mr119635031cf.70.1783691389909;
        Fri, 10 Jul 2026 06:49:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb94c782sm538164866b.40.2026.07.10.06.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:49:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:49:43 +0200
Subject: [PATCH v5 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-leds-v5-3-a8972d28c28f@oss.qualcomm.com>
References: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
In-Reply-To: <20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX2jOfNQKH5CL6
 TEGIP8hAUm8Ea4GjH1p/+IxoRvfj5e3C6efoSvyksi8+Hbcyj6jaSPXndxILzTciGTJl6VIL2xp
 IiX7N8GtXy9sZLkLowvdNDhtwAyoLCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXxrqIKJ1hW6Db
 Wew9M7VfQf8zX5ro6vTT/0NCDsEioNnGBdC5Xc/6Ou8dgfVZrHXuVoIvyQHUzPkfFT7qXHFBLuX
 tcbSqz6WEZ9fETjpoJUggR3Mn77JebyGPvO4iFNCrbYCWSfVZrDrC/xMqzC/rgvHeSP7CJZFGSt
 i0lFnPU1MmNpUqnCKymphdPYpgdCVOIdr7GaLNUu9/PMhtGh+I57vAs9qmDDBURuOZeTcK9qgyq
 IsuSF/CyadRzF+k0C7DVbspW8IKwHFB63dTjA/l7UwAoCw5piy9kmLlzsZPzfGeKP2jUeoSEIoQ
 xcIrS0SKwhQFxGQCbhf/E9MFY7RYeBoi+NnN7/mxeza3yo2pu5B4WM5JFdrXoc7BhyYa0LRecRk
 KLvPznrP5fxo0slupYS+zCprpj06H/fE/0HsTK7KxA5mzoghuVZ7PWfO3Zo3+MNNOV8w4djL21d
 5ENfrSbZ20qgbhtr0yg==
X-Proofpoint-GUID: jQLcZFJHBh5UAYPY_hrRU5alpt6YIn_N
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50f87f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_r7M38PZvEBKBeOnwNgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: jQLcZFJHBh5UAYPY_hrRU5alpt6YIn_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118307-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8411173B921

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 160 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 126 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -596,6 +596,7 @@ config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
 	depends on I2C
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This option enables support for LEDs connected to the PCA963x
 	  LED driver chip accessed via the I2C bus. Supported
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..e54a60c7bf28273ce5a2a7f8fa41f85d31ac94f3 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -27,6 +27,7 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -101,8 +102,11 @@ struct pca963x;
 struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subleds[4];
 	int led_num; /* 0 .. 15 potentially */
 	bool blinking;
+	bool is_mc;
 	u8 gdc;
 	u8 gfrq;
 };
@@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led)
 	led->blinking = true;
 }
 
-static int pca963x_power_state(struct pca963x_led *led)
+static void pca963x_track_power_state(struct pca963x_led *led, unsigned int led_num,
+				      enum led_brightness brightness)
 {
-	struct i2c_client *client = led->chip->client;
 	unsigned long *leds_on = &led->chip->leds_on;
-	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
-		set_bit(led->led_num, leds_on);
+	if (brightness)
+		set_bit(led_num, leds_on);
 	else
-		clear_bit(led->led_num, leds_on);
+		clear_bit(led_num, leds_on);
+}
 
-	if (!(*leds_on) != !cached_leds)
+static int pca963x_sync_power_state(struct pca963x_led *led, unsigned long cached_leds)
+{
+	struct i2c_client *client = led->chip->client;
+
+	if (!led->chip->leds_on != !cached_leds)
 		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
-						 *leds_on ? 0 : BIT(4));
+						 led->chip->leds_on ? 0 : BIT(4));
 
 	return 0;
 }
@@ -221,22 +229,52 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
 	struct pca963x_led *led;
+	unsigned long cached_leds;
 	int ret;
 
 	led = container_of(led_cdev, struct pca963x_led, led_cdev);
 
 	mutex_lock(&led->chip->mutex);
 
+	cached_leds = led->chip->leds_on;
 	ret = pca963x_brightness(led, value);
 	if (ret < 0)
 		goto unlock;
-	ret = pca963x_power_state(led);
+
+	pca963x_track_power_state(led, led->led_num, value);
+	ret = pca963x_sync_power_state(led, cached_leds);
 
 unlock:
 	mutex_unlock(&led->chip->mutex);
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned long cached_leds;
+	int ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	cached_leds = led->chip->leds_on;
+	for (unsigned int i = 0; i < mc_cdev->num_colors; i++) {
+		led->led_num = mc_cdev->subled_info[i].channel;
+		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
+		if (ret)
+			return ret;
+
+		pca963x_track_power_state(led, mc_cdev->subled_info[i].channel,
+					  mc_cdev->subled_info[i].brightness);
+	}
+
+	return pca963x_sync_power_state(led, cached_leds);
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +338,77 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_parse_mc_subleds(struct device *dev, struct pca963x_led *led,
+				    struct fwnode_handle *fwnode,
+				    const struct pca963x_chipdef *chipdef)
+{
+	unsigned int num_colors = 0;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds))
+			return dev_err_probe(dev, -EINVAL, "Too many LEDs for node %pfw\n", fwnode);
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret || subreg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' for sub-LED %pfw\n", sub);
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret)
+			return dev_err_probe(dev, ret, "Missing 'color' for sub-LED %pfw\n", sub);
+
+		led->subleds[num_colors].channel = subreg;
+		led->subleds[num_colors].color_index = color;
+		led->subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->mc_cdev.subled_info = led->subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	return 0;
+}
+
+static int pca963x_register_led(struct device *dev, struct pca963x_led *led,
+				u32 reg, struct fwnode_handle *fwnode,
+				const struct pca963x_chipdef *chipdef,
+				bool hw_blink)
+{
+	struct i2c_client *client = led->chip->client;
+	struct led_init_data init_data = {};
+	char label[32];
+	int ret;
+
+	led->led_num = reg;
+	led->is_mc = fwnode_get_child_node_count(fwnode) > 0;
+
+	if (led->is_mc) {
+		ret = pca963x_parse_mc_subleds(dev, led, fwnode, chipdef);
+		if (ret)
+			return ret;
+	} else {
+		led->led_cdev.brightness_set_blocking = pca963x_led_set;
+		if (hw_blink)
+			led->led_cdev.blink_set = pca963x_blink_set;
+	}
+
+	init_data.fwnode = fwnode;
+	/* for backwards compatibility */
+	init_data.devicename = "pca963x";
+	snprintf(label, sizeof(label), "%d:%.2x:%u", client->adapter->nr, client->addr, reg);
+	init_data.default_label = label;
+
+	if (led->is_mc)
+		return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
+								 &init_data);
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,37 +447,18 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= chipdef->n_leds) {
-			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
-				child);
-			return -EINVAL;
-		}
+		if (ret || reg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid 'reg' property for node %pfw\n", child);
 
-		led->led_num = reg;
 		led->chip = chip;
-		led->led_cdev.brightness_set_blocking = pca963x_led_set;
-		if (hw_blink)
-			led->led_cdev.blink_set = pca963x_blink_set;
 		led->blinking = false;
 
-		init_data.fwnode = child;
-		/* for backwards compatibility */
-		init_data.devicename = "pca963x";
-		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
-			 client->adapter->nr, client->addr, reg);
-		init_data.default_label = default_label;
-
-		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
-						     &init_data);
-		if (ret) {
-			dev_err(dev, "Failed to register LED for node %pfw\n",
-				child);
-			return ret;
-		}
+		ret = pca963x_register_led(dev, led, reg, child, chipdef, hw_blink);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register LED for node %pfw\n",
+					     child);
 
 		++led;
 	}

-- 
2.34.1


