Return-Path: <linux-arm-msm+bounces-112338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OmQgKGodKWqqQwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:16:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C73086670B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:16:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bIqMvWW7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eBysDmoW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112338-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112338-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73BC6303C818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4393A3A6B8F;
	Wed, 10 Jun 2026 08:12:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC63A6B82
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:12:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079172; cv=none; b=WYxSRnDmmOtlyk7VGuQR1cQjvb8JVXIv3jH/ID6XwPI4rLBW/3gwS5jNvRWcxQMi+QLOtE2fP0+p/C7oHnXt4wjJttymSswokz0DsUyE1ELmoYwIMwwCZMRonYH7a8324b+QQxr3CpPcURzHDo9yDO7ZPKYVAAO25Sb9ZhIHAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079172; c=relaxed/simple;
	bh=7VWPbjsAj3atobvSe+7KvejJgMR926itbAPlgg6gfgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cycJ61o8l1ys54KIfqlp8PfYQBqQha9CFkgnNB8ZNKB00jHRz86ENxZNg1xi0TludGV+paghGxnHnD8RPuc0uQM5zJ+jAWHgap48BRbO3PkPYW8BhWpSjWzTMirwasIHQUOp69BLHkiPFk4Ua3ARm4MGk9fav1a/I9+Lg3szLFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIqMvWW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBysDmoW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hjep531415
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vFU0GJhNHWfPisIlgqzJ49P1CSL4kfjgJ9e
	1GCqIn3Q=; b=bIqMvWW7ZbelCa0elJDk09VqPtQNLo37EK6VW6JJeqhmi9PWfpK
	aDQmwp4E4hB351fvgZZEhizxTjX/eZmH43MyEQ2YeOrHJ6F2jMJY1UWNIW8Vz/ZC
	mrAwaDGTDurDjVMW1qXNdlWBTo2ULmr7ZXhGXKJ+NTemSsIrIYxWohnF1xOmnrCV
	ZA8/oFBmU9tKQklxBoS/dE497qYnd6KfuMz1xXPU3t7zxkr05BQZZKsvMB8Dm3NK
	83s97F6HfZtDQPn60D9museUOSSgkTbRhBpo3T42v/MTXRkNZAP4EPEBqDZJU6WM
	kA/FmjYWZdskzwxHz02d4MlV4HHK7wgm84g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rtmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:12:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf0b7425bbso125383225ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079170; x=1781683970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU0GJhNHWfPisIlgqzJ49P1CSL4kfjgJ9e1GCqIn3Q=;
        b=eBysDmoWT7gK18+bx8cQoQRzKVKFbyvt+SxRYfF0RM1LpZry84fEhQisPEdMvHgbjH
         Ly9Q36SKZ8BXE+oWVaJRI48Mbsq1beh1eLUw5wuUSWWsd3Fqo21PrSRj9xAA4hYkWWic
         w8Pj41bYGs1I/D91Yd+VVaXi0eUt8Jlk2XbWXBIxygKXKPCSTJOuU2hQy/WNnVNjR9Jd
         NiXX9XW8PDFjHCD3ZPlbmbklKhJMz5nrpuQKOTVGjAT2gf3IRbut/wQJXyz23MEmE539
         14i0wg7ZhWk4QBy2WfXMsN3ybbo95Nxoiwr4GejfpWQiW8PuO6x8hdHOtcc2j3rONVET
         czaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079170; x=1781683970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFU0GJhNHWfPisIlgqzJ49P1CSL4kfjgJ9e1GCqIn3Q=;
        b=pnMlwH4TdjNmZgrcgdPe+XxY8Hscjk+gaGSnwpey5Cb7VYhCM79nZ6B7zXHHggC+NB
         S+luxl5gNHq8f/mOh4P1N24K3VSVyxTgnL3tIahCsHhM7DG3G1Abtu9j8wIdhuHgzFBf
         /7LzKVjN6krZWWyDAigtxBMKsIrzGdI4wdXAfB57rJZHY1Vs32YBUVtnHwKnc1PIi4xp
         lsr0lINLMDU2ZlURpqFLpFToNl+uMmGrvPZ9qFGRc1shooRq6PMdUkFytXDa7hpfyLew
         GXZTLgZVxrCsVfzQ1ZqziuJqfr0cfVl9l5eMhtY6hZ/4rFxVcRFxpWlrze2bakI5AYXP
         T/HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hAPVff5LXmUAuVrgJ9F+D/p8pfCOxIzmq2FHbuat7VJ9qFbHnkPbIqbsEEaFHFG0tLW23KsX3W0pwzl0t@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPv9/Tdo103TytFCV5Sz/JM/fKWqu9VOrQhQLtAKjyMSWFnjZ
	8Hpb3O1FTupF0SEXU8hgmnGfTEjeiY/WGI05uIOaARSFNnRoiyk5fOlctfl2MVeOrLqpVqLG38w
	pv8pH2md+rUCIQG7iFieS9w2jyk6Jk+YJv1so5luuT9QNNKst/DNk3kNOzb8olS+lgQZ0
X-Gm-Gg: Acq92OH1/1HXG1quwgFRfEmUA0Z+HEpOjLrrnqM2gKlrXKkNHuew9/tLhW2TQXNl+UG
	lFyMPoE5hzB1AoFJhDmYoO+qGRiTP+EguqlCzxoItA4nM0+m45T2J7lYhBm2mQT7RP59FBKLY5W
	QxflhFrjbMMIWKwKDVb8/EVmpn5Wdntxi2ShbtxOzwjXZT/16IG2hJk7WJO6oY1ely3TcNf9iJD
	6kcvaf8ybacRIA5zFYpJC9GcwfilENUlWzljNPTDCCXIo44BhD6vlqZIqvAT+k06aflYOPhP7IN
	iCHarVZGkx63glQFwcDxAl6E7RYXXIoAWIaLEC0U0rwAGuvA2jE77G7oTfN76GfYYwa2z7n5pKc
	M9ontyOuivef/hbetTvIOslWXbYabet6KboX5WOm6m2/JQz6drKW2JZjseiYx1cjYaSLDOFxUli
	rtF1rD6sfKzsZWMUP4eNVZSsHhiupVlFb7X3ajC8iSwdGKE1SW95wnmlL1Q+0UHQ==
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr268647895ad.0.1781079169916;
        Wed, 10 Jun 2026 01:12:49 -0700 (PDT)
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr268647335ad.0.1781079169451;
        Wed, 10 Jun 2026 01:12:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm228858575ad.21.2026.06.10.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:12:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add support tsens in ipq5210 & ipq9650
Date: Wed, 10 Jun 2026 13:42:39 +0530
Message-Id: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfXzBuY1/MO7/cg
 1DNoAh4RgDQ93ZDR4D6eYQ69nUZuPMgrNhqc3mfLUIzBoSSKQPfTVsZcfJPhKfhgUnedp+rYLtr
 DNrFblXnxkoDz5toWaVBeBRPfpbAB/N7ZIYfIDseyUK3n5f4HrW3AdYlUY8pWX8S8Iht97WzEe6
 +DAswJfONmiiJvwx9yGqjnctjZI3jALtkl41MGpZ/88Th0CKQqEJF986DUpjFSZwamDoTgM/t46
 YDUr4KtU2yGRN8og95bfeYDZ5qSP8DvAwMOgvBPM75aIcl3pbOojwX5jIJ3yoGlxgRau67VlV6T
 8ElpgGqhhPEkQhjuqWeLE7UwaMYpZvN2TJwnmXm6vVN1t/+mkNXTKeuGDCRPaRshyZ7c7s5iPwg
 gzCEib6o8ThFk5445Z4zbRpkbTTpfS3iMOf+qInFCWjS1mmWUuNJW9CPUR5Ni5xOyvzIQuV8Wgf
 6MgXM1Kkyyu3dvOkw2g==
X-Proofpoint-GUID: Y1ADQirSourpWPIC-Bt1vr370U2BHGC8
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a291c82 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=O98__aPPj8GWcYWuEFUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Y1ADQirSourpWPIC-Bt1vr370U2BHGC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112338-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C73086670B4

ipq5210 and ipq9560 have the Qualcomm tsens-v2 IP. The tsens framework
in these two SoCs are similar to the one found in ipq5332. This series
adds the sensor data to the tsens-v2 driver.

v2: Combine bindings and driver patches
    Use fallback for ipq5210 and dropped the driver changes

v1: bindings - https://lore.kernel.org/linux-arm-msm/20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com/
    driver - https://lore.kernel.org/linux-arm-msm/20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com/

Varadarajan Narayanan (2):
  dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
  thermal/drivers/qcom/tsens: Add support for ipq9650 tsens

 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 drivers/thermal/qcom/tsens-v2.c                          | 8 ++++++++
 drivers/thermal/qcom/tsens.c                             | 3 +++
 drivers/thermal/qcom/tsens.h                             | 2 +-
 4 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.34.1


