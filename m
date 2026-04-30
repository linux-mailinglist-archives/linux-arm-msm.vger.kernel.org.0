Return-Path: <linux-arm-msm+bounces-105283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAm8Mnrs8mltvgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:45:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD549DAD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 07:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 579F3302086F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 05:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFDB370D71;
	Thu, 30 Apr 2026 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqULfsmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaESG/Qi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7836BCDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527924; cv=none; b=CEnsxnYJFWDOha1qznAG+gdjtH9sGINIJZd2M7uh6S99wOqCPI4CX0BObpIyzAyOhUBLePJ7p5AzVoJIWRwrBJZTXOGcevuqmHGFTzHEhPL3FjmWEFZstbcKDVyJYWD93Nc+phGOAHDG5IeJhVdgOfWjJSfB9vCMQwzcXlksvU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527924; c=relaxed/simple;
	bh=YK+n9SPQAGZB/s+aq80dow0+aYbP07f9J6el90ZDUj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j8wN9+DISXqrxgE/rxQQdkVJkeg/Wk/R/g1V8lTkdfqf/ElAaKJhLe9Qi4xq35MqL/vMR2PP8GtCH6kFVm68ipFoctBUo5VuXN6IPXInk2RvbIT5ugG+XQ+j3vl9xCeBeceq2FKs0fyRzZLsRMXZtplTYpXErxyDJ/QuBagcu+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqULfsmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaESG/Qi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TKbKUf2855822
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jn+54zDWh9rVbo8vC/YEZCMwFj3aAoKWhNMSLOUCbQ=; b=iqULfsmGpcoWnc0H
	wDWp3/fVhQrWBD/kcwS0tNpVrd+4u0RzkAtqQFUqFCjfXKebvS63Ok9EJuHAYOFV
	YKilWTknQZMYsc05pvkV+voJjOoglfyUyaHtoq96k38jBlh/JC56a6VpLSKM2P4W
	pB9BDlTdS+7U35KytGLQsoAKM3QGE2fJPCID1JUPCegnuVKe39OSUj8BVGevLvkr
	LKZ+XzAa06KcFxCm0qc1738anzxrI2q5JHLdHcbGySPR3niUhBpTnz9zfFmWNG2z
	kas4otA9wf7B8vnp8VuTtJgaVlT7QYiKMpM3xszDe5kcXy5zfs69/QTT9CtxUy+F
	r4Y3EA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp2wew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:45:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fc22424d9so1538847a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 22:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777527920; x=1778132720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jn+54zDWh9rVbo8vC/YEZCMwFj3aAoKWhNMSLOUCbQ=;
        b=JaESG/Qi3TgyWa+uR1SzpE4M0K+sesOr1Um6Cd8GsY97Xlz7Qt6JC5ruoyCGdgjzPM
         RTKMob6qM/hvkcp625td9/uPlBGLM/pK2eUE0Mcs6eiY5g0rR1+aNBMKRCdUWHh4CT4X
         J1GUl6qZNCk6e5INjkutcKst/ypK8CEoJh4S4T1bEtb8JWdta+lTNkEipA/KI3WZj+ML
         EXKiTutkZlGg1K1KhYHURjJKdJPrQj5est1lDFm++U3zUqN6x627chiGmBqr/s1bwB4p
         mooikRl3wN2VbG/US3WZcirBOzV93+A6nGQEFX3siO9ek0j3WlLt8rm/cPx6Syo2M1nD
         3NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777527920; x=1778132720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5jn+54zDWh9rVbo8vC/YEZCMwFj3aAoKWhNMSLOUCbQ=;
        b=MDw8vtIqvFlERHghELzyFqGQv3d8bKB7SBiPhPO2UA2Vi1vTBpU4Q4K8aDcedamXAq
         swM3lGNa2y5WIlg8IVSDDo+ZgYmuHo/IIgAkcsS0nYxffANmab4KT8/I/80jHhxldFXK
         Yeqipthz+zChTE/23DoruPJisITjOAXX5YxZFape3KDKFSMKOT8jec1VI7j9FDrxLm0Q
         nNtIJPyAXPfsBgqxGebhKlwl013tSn2hYjCuTqG4s77enTiU6px0igvHk6p4tOT9WWvK
         nIeYXfWYOk201f66M1WBQQMwhVPOsku9FroZRBQWGk9b32+zA82dWbou8ZME0/AVtEZJ
         S4pQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tiZvwaYmH44EmidwCYJQiII9g2/Sw7lRDDquHKajz0iDDbjioWikeJ8G1i1YkovoSU+wPCYpYQE1AJ8YJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUCB8qOO4nULvwtjpoyABszjoRsvSUorL6UJ6JvcwOk1xluD2
	jYza/VMsGWaXyGavKgvf+9jq/gSYIleRV24ZvlkGV7Xd+Cq0Jd75TyNm53YGy0d5hxltGiI1axv
	RiNM4UwuX6LewHhZGXtZ4JLFqL/jTjeQniCxcypbeHRbxZRs0t51+aWaj/aRysL3Gfmf1
X-Gm-Gg: AeBDiet4bnxYJIpXgcPIE6fbX5ZQKJ7uJ1eu3I1vfSvkmuovWj68FwZ9WVgbcwPyJYx
	liVzC9BABEyrvyxBIh1m43QH5nDAI7FU7kaRVfIB8qUkaQCEE8qs6E5KSKhuenf2+lkdj11VfYS
	Ic9e0Wb0PtoDj7q6fEy/BMoOga224GToiku1PL8dMZAfrXW2OWdfU72YotGJbo8CsTwpVxGMkwU
	iKhHy97V7mMs0d+araQPH4BIImfgH+8piyC56A9BgSk5WbGbinI5M73zKmlCy/OLKIOmPxwEs9e
	MavM2dfQFU0DVpVuTNtKa7xe3e6D6neGcHVOUT4Pt9RtMGpTdi8dqGdi8BZ8UEoO7JHKEXjq0eK
	9xK9qIB1Vs3HIYfUgaaJnC8RC1qV4cWFh0rx2TduuLTveNLkRnLjOcdonmqhyeOYbUw==
X-Received: by 2002:a05:6300:2109:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3a3cf7caa16mr1647221637.27.1777527920589;
        Wed, 29 Apr 2026 22:45:20 -0700 (PDT)
X-Received: by 2002:a05:6300:2109:b0:3a2:dabf:fef9 with SMTP id adf61e73a8af0-3a3cf7caa16mr1647188637.27.1777527920150;
        Wed, 29 Apr 2026 22:45:20 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd64f21cbsm3955231a12.19.2026.04.29.22.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 22:45:19 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH 2/2] thermal: qcom: tsens: widen temperature limits to match hardware range
Date: Thu, 30 Apr 2026 11:14:21 +0530
Message-ID: <20260430054422.2461150-3-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6ltnOdsT9v1Pdy9FY8n17JYzCFhYic5f
X-Proofpoint-GUID: 6ltnOdsT9v1Pdy9FY8n17JYzCFhYic5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA1MyBTYWx0ZWRfX+is73jzGprZ0
 DSNa2vF24eFqc/+H2Hp55ljGFFk2mt4XJ3g244NqJAAZl4UTO/HgcyNfr5J8Ir0vEea/MJ8hHje
 cLyfl126oYpkJXNnXAkR1KarHm4/oNNgmnRdI0SJAVNKvfa8fTGLzD0cHQqHLinKlDN/NO6ct2v
 2nNxakCWGLfuE7Rc+tDU42Qhu1SlvsUiY4YvBOpIkkzjnkYVJKbvbF6VHggVSEjoSCG/Zvahw8Q
 G5lpQQj74lxIdqWfJA1SlKoaJVz2g/5KGiJFEgnVeRGLHyzquRI0ZUutPBSWSAZNU6Sa5cfpeuh
 z4jc9/lTRxfXF8aOtr1sVG71crHtgrOiGfhvYlho3/7zurEBCXrSf8+o5cIu1xXDPxLM09BMket
 hCRq4/TAtiZYoB9kvyi6Fazc78P57gVrvnsIclo6ZZNVvJY+0GcCrBIhkoV6gBBT3kj/LdcTc95
 WXtLIeTL7YxGDWSLB+w==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f2ec71 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7FrdJh-Z1z6zKSyd9LYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300053
X-Rspamd-Queue-Id: 83BD549DAD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105283-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The TSENS v2 software driver currently clamps trip_min_temp and
trip_max_temp to -40°C and 120°C respectively. However, the
TSENS v2 hardware temperature threshold registers support a wider
programmable range from -204°C to +204°C.

On newer chipsets using TSENS v2, devices may legitimately operate
beyond the existing software limits (for example, up to 130°C). When a
trip temperature is programmed outside the software clamped range, it is
constrained to 120°C on the upper end or -40°C on the lower end.
If the actual temperature continues to exceed this clamped limit, the
threshold is immediately violated again, which can result in a
continuous interrupt storm.

Expand the TSENS v2 software trip temperature limits to match the full
hardware supported range (-204°C to +204°C). This avoids repeated
threshold reprogramming and ensures correct trip handling on TSENS v2
based platforms.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 814147735ba5..3bd654c8dd6e 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -54,8 +54,8 @@ static struct tsens_features tsens_v2_feat = {
 	.adc		= 0,
 	.srot_split	= 1,
 	.max_sensors	= 16,
-	.trip_min_temp	= -40000,
-	.trip_max_temp	= 120000,
+	.trip_min_temp	= -204000,
+	.trip_max_temp	= 204000,
 	.valid_bit = BIT(21),
 	.last_temp_mask = 0xFFF,
 	.last_temp_resolution = 11,
-- 
2.43.0


