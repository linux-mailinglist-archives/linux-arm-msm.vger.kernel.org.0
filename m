Return-Path: <linux-arm-msm+bounces-104778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKT/L5ae72kbDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:36:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E752477B45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2973050A05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491143E558B;
	Mon, 27 Apr 2026 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRZIIfxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7dOqJs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F393E557F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311327; cv=none; b=Fgq7jf4xYMfnNIW2x2UFnpezhYNPoMqFV3g4Vu7yOwY/kxGmYjD+hzOwJL2EJGBCBQm52e8bMIX4yyI/tvxYcTjnn68e7z2yBB1Zpeko8T1NyZ0Xof6o8RFGXAW5PWmqcZuN5ZF1Chps6B1MkKhp6CWL55UjHoGcsObjn4Mt3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311327; c=relaxed/simple;
	bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5j2BWOwTzoXLlr3z89HVdl2gUIB1ozOBY4RI0e4Lk4qvqA6UnszQ3hVAW3kHVbypvXcu0bjoieZwXScq1xmH8pQ30aAbYriEPF0Y5FqQhcEHB4I5npjc8tkCBqFg/kvnuDV9WTA/cnOnsbCGhTBY4UWxBjE56+eDcuK7OwRbGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRZIIfxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7dOqJs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNtsT663183
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=lRZIIfxyLmSdHEI1
	2wK9QYlFisa7A3/TZfGTApXbHOkOhRixgMzzkZh0Xm2+PiAepXQeodVY/tFdNGyv
	7ll2LzC/ts5bywDNMKoUoYUWqjZYM2sBaXVxodQORlohMBntTinYX3OGr7W6thoW
	fd2Tag0MhgAJmHZa+R3MlEdBZHHpQ4yyDoPXzImzCeplEfE9JT94AQuoaGg40jji
	3lMrkzm8BdsNhzyymzjBZCTQKE0u9pDjG5ZrwUU/8B3UDUczpEDxkmFqbRiLElEt
	Qs701sG670k2PFWgODLGAbzf/6coazRSyiBv4s3Q4aSs0lxiguBLaT3xyWvhQz2M
	Es8/cQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n01uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:35:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7c904d476so29812505ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311323; x=1777916123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=C7dOqJs3MkupgcmVrueCVsljEY4p/sL+3qgKvYCiWIhbX09lNr9DzTyrFzDA8s4//y
         uI4tVRYdzpfktoMQfR8M2nz+0dROL/AHr0KZilBxyycJgNAzOke1XlI+XlnDPlZ7wOwy
         4BTLNp8wpvE9k1bwmTQqmVBm4lvQ2w9rZ+qRqVgaMdaRheOGDW02ApcE6j7D4I6wn5u+
         8De3QBH3l5IQHXKoCTSZPkpz6I6KoPTAtbJzjbD09HgTeoijzewammHJi2ELEAaOBpfu
         lazX71ybw/RFyrUSEXo1Q5PVOXy1z5rSYrklc085nR7XuvbWZj1y9Wpwgi2TP/TRq7zr
         xsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311323; x=1777916123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=IeMrKkFlzLHSXoBlD1asZl7p8XkrXd3U2VW85h21I4kwKDc1QqT7JYOINC8hDpRJIm
         J4V5kcOJKOyEHDNegOujzgnmlhHtYOZTwcakVdvlWZw6e6/CSQyXtXgyGwL07+GxZTSs
         Nod1NUk5aGAvHYwyQ+U40O2l2fbpbm15aa+ZO6F2L9g8CMSQQO3mVmzLNUg/BeF/FfwN
         CC+2VS8d5jiUKuDUE42nfASElZWxaQLXVh0Yb+MjJYFYRJCWEJOMZrcJmtuh4XDuZ1QZ
         6TBv2WFYu5WuoXaRxr324yUTUJosJw8M6L8wSLcXTpUMDRvzY/eqIPvuuUJoFxWcuEWW
         BGTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MXKrn6UQod59fFlcvCq8uMW5Fwk4YVfwdzLiw8OdavBxQnRjPxcE0a19XznqFJEMgMrM2gdOvG/ss7KuT@vger.kernel.org
X-Gm-Message-State: AOJu0YwLQ23SoT97irW/d9wARRFGUUtRWLcvbWgyXazgK3ZT9FTZfOqo
	YSrzF6Is27TTI2d9lmuVUcym9RSkUWNBD218BEa5IMxCeXbKpZLZCw8xgC17v0AiR7z6BSKBuZo
	Wy5J+EL7HrcVoPxSV1TQwMEnkq66q/D6/yJLgPC01ZxXPLPtUK8EOU07VRAvJpheIL1PI
X-Gm-Gg: AeBDietlAZeat5YKdEnvjJ+7LtIefPfet23xIwqabtd4BwvJ0Tm0KAfU0o8POP2XQou
	j2Mlz8wRUER292nBv2Lhd2gu7mXIYXNv0Ck6GWQQMDv6SQzzI2cuqghtRKaZoTi07aGbsXq6Pui
	9lsijGNbD8rQegFbp8SWH/1TgFbzXBCteukNRQkff8OVdkz2r8+Q0i5u0XLxgOc518RyjWPRrl8
	tVuN5xAMtG147JKiqpraqMxj5GtFZKUSXLAECU6ePsUIzlekx/3qDhYylLS8as7jIWMK/7sbeNJ
	3niOkEIRUDnOrOepVoY1QYYVrIpXuSV23j6zA23cNZOIT5fdIAKMUj9DtumKGUQ+MfxhTTeGpK5
	ksz6ur6xJWB+clBO7Iyhqi0VGU8MhS17ncy7jr+4oT/69/AcxyShkMjgYZACjmE2dK3PQ
X-Received: by 2002:a17:902:ab8b:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b97a97167bmr1110065ad.41.1777311323440;
        Mon, 27 Apr 2026 10:35:23 -0700 (PDT)
X-Received: by 2002:a17:902:ab8b:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b97a97167bmr1109465ad.41.1777311322756;
        Mon, 27 Apr 2026 10:35:22 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:35:22 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:41 +0530
Subject: [PATCH v21 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-1-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=4001;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
 b=32A+1VzoGWg9FSbHynSX81qbLupW/hUgrYzIQsaZuSIHuB+n0hQE8ta4k5laVXIaKpofnQnvs
 +fICXcpyJbnAy+fAxeBYskqTifNlGwo64pkQbTOArzTafR9aiuPkzPz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NiBTYWx0ZWRfX5syN0BSW1jCn
 t7ahH3AbeTpNEx/x2c5xzD2RtZI70I0N8u2+WobI0xdKZe/7TwZN+oRpbp8Rz19h/FHl2TTFLTz
 pZ4wZVOJmuzf4AqNIY0x9ZhHGDlYyOSZ7QxnsaSXmtpspj5oaGyt+5stMOCnjJQYzy7T3wUyHVC
 vdGnNjL9qtJJIBTtpeU2PlYeRLA10DeqM8gXjHFj7dFLh5LPzVb3IRPiYeZpZuEpChFARq+9mEP
 GsuAviZ3Mw49JnLkP1YFKadE0WHa/vKDAnHkAAKcGdFva5auq8EITpkor6ADNLR01sBqmJM3SVA
 cH2SrG2vOzA8xLv0m/bWDuhBldd6gafte9bgSt+YxDCUQq5la4vriGERLesVjQA9FmRmMwo5w6s
 80QyoHcdtdpZJneltorQQ0PE+0iPL/M3H/488ISFlLGDaCNiZqDiCqndqjbct/v4x5D1yCOUVT0
 RwGZh0FI+/I7A79IMZQ==
X-Proofpoint-GUID: lBVSqlEO4iVCK2_A87kjxyn3pe5J7PAp
X-Proofpoint-ORIG-GUID: lBVSqlEO4iVCK2_A87kjxyn3pe5J7PAp
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69ef9e5c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270186
X-Rspamd-Queue-Id: 6E752477B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104778-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index d20e44db053256d87ad8034ddab233e49d36072d..7a74f72a8313b73c3e0930a426ebcf7ef6eed99b 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -10,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 #include <linux/slab.h>
@@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
+	struct mode_info *info = NULL;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			pr_debug("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -200,12 +203,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
+		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -218,6 +221,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
+	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -261,12 +265,16 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1


