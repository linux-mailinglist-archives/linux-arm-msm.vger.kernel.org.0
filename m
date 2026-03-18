Return-Path: <linux-arm-msm+bounces-98428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOHZIDuKumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:19:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2B82BAB21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F7D631B0C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF803BA24C;
	Wed, 18 Mar 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdW5sT7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZ18BNGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF03ACF01
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832140; cv=none; b=UY2/WGF0ka0QJKIfQH2yl4SN+895pd6x1xjMcBIs5Ck7k8GNWF7LprLQ1/R7vuE6IgkN73hFMtZkrjJVyWl++rnFR+9GT+5mJLdxlrBWS4hYK6/xcAsswBdR9AGnWKndY1Iv4/xHY2EFsHtZDAeuuZ2/ryvzTI20O+cuFhXPg/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832140; c=relaxed/simple;
	bh=1ljK/bO9o6mZ4HLRc+18Ogbkuf5uNqqxM034sgMWf2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/oyeAgPNvRqHYAVswd1nHzrpE8U07T4U4DYP9GNJ56RAIwEIUTdWjUpER7g/sUDblaYlYBq8LGIyKhjs4FEKs0Mq1QVoJR0qKJpib4c06V91BamWjNp+U8KgOzIrA+LNB1h7B/0iYNUKVQd+HVRaL5QEtO34i514MjjwR3Cg1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdW5sT7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZ18BNGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Dbm1402517
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=; b=TdW5sT7azmyOXmDa
	YF7IKYmMUXhW1FA/DfvlvKTEiYyKWmsmL7+EUHq2UZQY11wc0wYjwB7Jq8NSmA8y
	Q2eIuEtCbpAjWxMgdAmfO5B1YVbaJN8MB/TRujfEa1TLuvF5WrrTz0CO1zQYDb2Z
	747OGpGQkuBSFGTkWhO9t+DNnoRtOnCe6TPpgZBf6A2GOmY4+ELxOxxgOKR9iosL
	xBYfyWcch1uOykkY66OQFLPJe/i8dS4LpPlreMCQ12W3L1ccgWS9aJwMC+b5EmsP
	8mKuckiOj0reACKzC1hHcQKKJ05CGg4aVBnks4L0PwGaukV/8dpZ9w6mG0ktm5nn
	Y0uZ9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duetm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509007aea22so306946971cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832137; x=1774436937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
        b=dZ18BNGt5/G+1IfFwISYkpbYwR3gVpW+kCiRrRahpCLFQBdxPNamJNOX7y/OBc+3Sw
         feA0l0n1aMBQGQsie5mbeWtufPUw6ZWh+nvbw34HwhSOoivseQDobSswR+ItVSxCcO7f
         ukZRHFtXxAy1ulIIWCjvSQdkqR0CHjE7bIatEfM7r7OpxKvKAr5FiT1kwax+AgH4Ag+U
         Zg5UDw424Dlicj/E0SrasflvgvZRZ3Aw7fwMOhLjqa1FgMz8z2xTUD4vwm0PkmeAftQs
         ZavnvEQ4HENMBx7Jbr0Enj3M4PwNfpx1tBNIZdCV0YSC4xZDRluJtY+ft0S1lc0XsPHM
         Wisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832137; x=1774436937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
        b=eh/fm0cP4l0xnIDTkuibjNiaZScZfTSHogGGbolsl0bFRogmOwWD7beL2RoS68B/qg
         GvYIfJBSJnJIWVjZX6ToVjVKSv2LCte74u4AWLl5BrjtBzM+CIhMLiHlLcRjU//rYnD9
         Nm6GnGyGVMdM4UtMKjp2WcjIN7M8qMDfF2r03VqRa/ewIgNxAAgnUVc2btKYlOtIwrrm
         7oD9Th+AgN0+M8t1odbFWr2vphnCC7HxYa9tpHPmAvAv86bRi8OaQ0zfpOsP1cDqkl41
         Vn+AJg085+q9WHaG0jg4Bgf2tCuDBIzu9e9uzvT9lGs7l1cG6bVcVYl8q3nkC6xhC4H2
         0mAA==
X-Gm-Message-State: AOJu0YwBFAwwsqLl5mD4DGZlqnoKG1ohG7qSkpk3aQrU/JX4DjaQuhP+
	OX88CjzEm2eK+fd9FtRL/T+49MT1jxxdKTCCGDrcs5Z+MKrPOMTkypUz7IYiFPW36QyXG4RSGDM
	/aqrWw+jQDmrH2Az8oDelpsIrVxnJmc/I/JltO0wFqWbdGkWjPQjhrmEGQthSvsHviLQr
X-Gm-Gg: ATEYQzyS0qF1QOH6ufWx+wGJ7DYGUHkyi1KRrCck4SCR9MxIFgyeh3DX75QerWAGrEq
	Jqcmqw3gcBuqM0a8TxoMi06fZnTdk0HlHMGevQ5Aun4sUNXAuferumIll+Vbo+ZrWGlBhasI9wK
	2vZ9XH0enyBu/3mdgDXaeN2c+FKwNZszFUdTM3u0UO1cYuDyWYOFcePPJm/uisOVjsyxONI7Slr
	0OimN9zs0B0w6L+NbWQUIVXdpkaRjjCZZY3+IL05+EDrPRxrKVPfVT0RNQ0q5aEkQpBwWavOB6Y
	jD36YTLXp6JVCXZwmB0+MnU69Gocx/PGapcI2QQ51KpZe8z/Zb8TPEtwuL7P+8cuJ729kPL0vPZ
	oHTU9QZxA+j671WFgvCntRqtMnY5oObwPfbTtPi9qeMEH
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id d75a77b69052e-50b1479780bmr35543801cf.19.1773832137218;
        Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id d75a77b69052e-50b1479780bmr35543471cf.19.1773832136760;
        Wed, 18 Mar 2026 04:08:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:43 +0100
Subject: [PATCH 4/5] clk: qcom: milos: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-4-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1ljK/bO9o6mZ4HLRc+18Ogbkuf5uNqqxM034sgMWf2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe93mjmetZrRPgAsC5Qc+kQAHIvszCOM8P/L
 6mnrmwA8J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvQAKCRDBN2bmhouD
 12fMD/9bLyR+bZvWFZSQ/S6LHSPwdk4KMMNlO1F1BzFb+oOME9LshAEoe/gSJ4B4XvSPdXpw3Uk
 oeEiaBPOmOTdkEWzIECpYhuqlLLOaMXqITAG82xydt10Xn+MXTjTZAHVHYy9V7EbE6D6FhYYDha
 hxCV8dGGd3PFoDoY4qZAAqSerC2OmXSQi6pqmaiIirIPLdRerTUUNkf/J11lUp5G/aQVdoNf4/I
 BEyKc2gP7d8Ga+zysmNcKbRNcvmirv+NS9brtDzv6zja5QGrF5PTNmzcjPc6UTOuJOPPiEuNboi
 lxmjQPQkECLjLyaxR5YNrOXzK6CAOTFBaO30OZc1nGVj7f4pGvb3jbGtgjej8pheq7SZzXiOJl6
 lwN3+61POKTFMqFcyu6JDUa5Tz2NEnuw2JsqwjRTqCh4bbXmhl9tT5V9gm0zklhqO7wAIpSYBS4
 9D6R9RG3lQzzhiT4ZyKobMQ++xFUalF6hkkXDyInCJJ7A/Uqu+KU36SDwk4XY0htlAX5E+4+RYe
 +BxGiO+mQl+M8eM+wcSMx2CXEoZj5XDiJm7Y6VXqXCrs1pdy24DO+pA4sXEF020o+YvLmIhqaWp
 xExTZWN5d8fkx7ouLveJpWU1nCA4z6ncvsMMloVwME+tUt947bVeYZsRif6mbniZer5qfN4Fuwq
 0DIUVdrEZ0Z2biQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX6Gi0AeMfj6CA
 dAyyieTz7goRR3quwEHATgHVIKFhC0K/YVDq/AGSGfmJom4BMair0L7douff2c5Gc6jknHMXjZn
 h5+eq5D+7gtSTUUeZerB4Ky+0dd7vJA5UgQFJK7hZlylan9sZlZxbsGIe8nO3iFqIjWjaQKL6ZG
 n13QkbfGSy+ptTD7k2uaR0QqnznrKRp7m/Uy9fGGjBXcbMslp2+8ZBqeH0XeRN5FmeuTcdAS/jM
 VLZa4P8SeuhECqUWJw5PBqDXoDX9PloIMK3L8Tf4iLkUt3Ec1lIPpBVFU6wALua8YpiuziwQz0X
 KF/MUGzlXXDxX7F/vJFpWSJdS0iU40ihhV/MMyGNMB97zwEOxflbdTppexL77esmiF1kQaPHE7/
 5A6v8OpYUO34OUYEGIP6sw0REw8h2rYGFz3h3iqJ1jU6fmeaj82lwhlWkhyebbSbtSOaVgIURca
 eGEVvAkD96Xd3LyvgKg==
X-Proofpoint-GUID: XZ1dhUNg9QDP3N1csM7NUtGqOGlhAJr6
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=7lwp6ARP5289FNF9c8EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: XZ1dhUNg9QDP3N1csM7NUtGqOGlhAJr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-98428-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF2B82BAB21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any clk, OF or
PTR_ERR API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-milos.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 339cb1c63ba7..0a483fb6683a 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


