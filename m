Return-Path: <linux-arm-msm+bounces-109767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOR3O7VzFWqdVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:19:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F165D4110
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FA2730053EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22903DD510;
	Tue, 26 May 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIBGT111";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbQy02yn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976FB3D1CB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790748; cv=none; b=qoVP/FFCdl4FzPWT2+8Jmg4XQn2Z6h2rZNSDJ5tQmZ6F1k5Vm2VQs+00f2RUqocHCUkHT+5bJbSuhlUaOBy2z+0KQ7+GUO4F0T+UwAl2jAShuBLlia7zilud+bKCaHD4QbR7oLnVAbev4MGnIwMviteB6ZqlmBN1KX3GrEq0DL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790748; c=relaxed/simple;
	bh=3PRqDBzu6gwg3vTreiFL4gFGbUN01PFKN5S0Cr+LoL0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZH4Mk7OArxgg7buWNFb0lYwpzTXtngvHgYYi4SJl36I1CkF18d6pzeJXO59BghjXeWHl9LoThE134K1ECXRqSVotZKpivIQ9iMV6zxubrjQutXlBo96twcORqqsHxRQYbSStw9vlsxCYDULJInX6tPaT5OPMr1HD+QBv0YoC0rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIBGT111; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbQy02yn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q531Me1802476
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rji4xxWneb24wn8bv5LJ/Y
	er4lrNtS6+L3//4OB/NzA=; b=CIBGT1115nSYnL12B32ab/pAnnyXAzaOLQENhm
	5wQFRbC6qtI9iDaNAoTL3MwqQr9ns53q25dEyOUHqhD19PZTNx7HR1e2sL5cAz0G
	Cff4BPImoNszAPbLd388XxrveZKNhDN++zlMAAN+LrcumZe1E7yEZpJeJLmv24Kj
	maDeAVEILbXu9nbtQRoC8kXqnuYCSOQtDKVKfGxgTLnhbmNQOEMVyVVXNjcO2PPQ
	WTYllcQcLzIyvVBEFKt8H6ALVfr2H+L+BQvlOSlljPDjmlwoy7gZY2JNpbJzSkIl
	AJ42svSt+IdjNFAb6ZDwNEk/n4PfiH+oYAb8ikv/3+gULUwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqm8f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:19:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso115959235ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779790744; x=1780395544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rji4xxWneb24wn8bv5LJ/Yer4lrNtS6+L3//4OB/NzA=;
        b=DbQy02ynusu4ve8K9FfzCcWRUdly4FInB9W1NBhoPT3hLkz44vFR4PrpLEkzcWqicw
         fvn1uYdZlZj0IRiROoofH1oxiOwsRfVbm7IfXHjvMl8jLkTsfpEgNjh51z9tlj7cIP+f
         5uHQ6F2uBK55uuyB4k2KNffJNsdMaSvsrcbfYW1Q9oa52MwFbWIszdyaglqV3kE6PgcD
         tOZWXPzfUH4sEifXVwQrRermyL6Z8NbHFwh34IiiHeuna1QEYWWOn357fUqUlqj3WI9O
         NJWlMTJ2Zd47S20SfIXOrICtZYZsSCF5fdc8le+fQx6Oe0bGlImVNZANtnzRcPlYTxBi
         PTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790744; x=1780395544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rji4xxWneb24wn8bv5LJ/Yer4lrNtS6+L3//4OB/NzA=;
        b=CwSsMHHALjoAerfy63DTd+Tcxn/FwqtVsRHTpK9NQOcgN0PxQqT0TFBA4iPXOOgtSg
         Xn1kKfMIM/A8Re+fGvEo2kfyQExlkf11Qie/uzJXljGFeBJtsLve0a4CKqwT/ji2Ws2k
         1W+ua4ODWOQhFr3R72fquQdsNIBcroGg+gc3bQkaAbJm5+8fTuS/rkdZKSOnYgmCDJFk
         RqDnCT/SbGcVN8H4MXZU+yPdiFZtCRwkdyR3qMt2jNgaAcy2xggvEuBbjMaEoHuuElYw
         wXlyIu1OjrbdWq/HbO51DMhnQLZ84vC5Lreg15YcTbcitcHnr7vJGG5Dmlf67EGtGd4w
         cmcw==
X-Gm-Message-State: AOJu0YwSnj1F6AwEBgyjNu/VCP4T2DY5yxnc3lKB5ynnRr5jrbILriD2
	5+r6s3eGpg6InWD1F4Xv/9YFDF/88e8s84hm8j7J8yCydAYQfB1n2EYTj7/TMKwl5jxBc7prH60
	UTjaO0ODk5Xzyy/82r5sgC4VDKM6DcaNAxK0yvv6+OA13H/ENelWGQGbBLYfsiNvPlYy/
X-Gm-Gg: Acq92OGpsFfxGZPw5IQT0CbxafPoCjufvWXXR2sBG8YT4Tf9Veefikf/eMGcnQaBDnJ
	9Q+/gfwwXbR/rbsbE2Fqa433khJIqCwe2imgdLgByE4HNH87K9FQL0ssyn6rZzoatkl0mHp/AwZ
	2B3km1ohb6JvijCYdYsT52znj/Z9Z3tPD84iSe3kzY6Ns+Mx4LGztjte/KjG6zK2YSpsXtZfcQu
	MvG62RYv/PsgSA/NtByev1dpb0lUB9U5NyDQIWrUf/AVYiqETp9QkiWpx6Kaco94V4Ght/975/f
	6n09A3qZUNc++6Vf+IO7/cct9b77EXuIfLPN/dW/9GYOyOygUEXtB9PkO0BLGe/FlOHR4RpBXF3
	uceuatjza/BmV6XvsJ8io6YvqZlezALDvTYNhXfz40QdHbjcisRPvCVs=
X-Received: by 2002:a17:903:3c2d:b0:2b2:42b1:adac with SMTP id d9443c01a7336-2beb031af0bmr185779565ad.3.1779790744430;
        Tue, 26 May 2026 03:19:04 -0700 (PDT)
X-Received: by 2002:a17:903:3c2d:b0:2b2:42b1:adac with SMTP id d9443c01a7336-2beb031af0bmr185779265ad.3.1779790743905;
        Tue, 26 May 2026 03:19:03 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm159941105ad.36.2026.05.26.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:19:03 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [PATCH 0/2] thermal: qcom: tsens: refine wake IRQ handling for
 suspend
Date: Tue, 26 May 2026 15:48:35 +0530
Message-Id: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHtzFWoC/yXMUQrCMAwA0KuMfFvoCqvTq4iUtYsalXQk3RTG7
 m7Vz/fzVlAUQoVjs4LgQkqZK9pdA+k28BUNjdXgrPO2c94URdZAXFBknkp4DQ8MKXOR/DS2j7i
 Pve8O7Qi1mAQv9P71p/PfOsc7pvI9Yds+MJQrS4AAAAA=
X-Change-ID: 20260526-tsens_interrupt_wake_control-08be7b86591d
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779790740; l=1373;
 i=priyansh.jain@oss.qualcomm.com; s=20260515; h=from:subject:message-id;
 bh=3PRqDBzu6gwg3vTreiFL4gFGbUN01PFKN5S0Cr+LoL0=;
 b=tVB31x8VVRsR5cpVeyvy4Xcc00EREhvd9rXPce3t/+sJ8wRg8YZlTLDg9DT50jsZEwhVYUvi3
 O0LhnideJptAPEgfAICpNu5zMOs1Y/CNKUzgePU1gZexmzuwB9RPvxL
X-Developer-Key: i=priyansh.jain@oss.qualcomm.com; a=ed25519;
 pk=xe57jjgIoTuNHN/Dp00kZl1mAJjmROaH7JV9sRxEoEQ=
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a157399 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O3d7Xy5pjfPrWY6nMl0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mK7rmUwxcJXZyosMbR_RQCVrGKancZBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4OCBTYWx0ZWRfXzxw/nJ3Mto7I
 v0xQWVU4QjWMBsVe93MKNg/fZPf1q+4JyUYhuO1dzCDqlIgy2lj3n8yVwv5o+UpJ1VdbVx6/qod
 Cjh7ot90JO6Zbrc9tN17H/Nos8upfvHegXKim36f5P1GmZaE05TwPhCck0A9TCYDIrcG2BdvcKf
 h8xE4AzY1H7lIeoVRNttdVPiu3jvNr2348jdWExrPLJYQlruon7menuUEMSSyLrLhj91p/SPLYI
 ze9oEk0/cSr7c8Jd84AA97Od2XSEful7J+z2PDhugOODcDoBx7iVMZsvxkVZ8nEuc7U/pdvBW4C
 8vBSR0Qq+mI1u0HSO7VRz+WNhXKohyGghttW3KzRSTGvXxPZG86KG83XO/zOWtAtbWFBe3Jn0wl
 PDzHRMdEzf0W2apI+v3iv6EHIJ6p+zMtTWBx5mUNcza1PKmmyxDdP8F5PQ5xTuoel1948AOcFbV
 LaBKRAxCOJRlbStZpmA==
X-Proofpoint-GUID: mK7rmUwxcJXZyosMbR_RQCVrGKancZBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260088
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
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-109767-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79F165D4110
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series refines how TSENS threshold IRQs are used as wake sources
across suspend/resume.

Patch 1 moves IRQ wake control from registration time into PM callbacks,
so wakeup configuration follows the actual suspend state instead of being
left enabled during normal runtime.

Patch 2 adds a platform-data opt-out for wake IRQ setup and uses it for
automotive TSENS compatibles (SA8775P/SA8255P), where parking suspend
should not be exited repeatedly due to TSENS threshold wake events.

Series highlights:
- store and manage TSENS IRQ wake state in suspend/resume paths
- keep existing runtime monitoring behavior unchanged
- disable TSENS wake IRQ setup for selected automotive targets

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
Priyansh Jain (2):
      thermal: qcom: tsens: switch wake IRQ handling to PM callbacks
      thermal: qcom: tsens: Disable wakeup interrupt setup on automotive targets

 drivers/thermal/qcom/tsens-v2.c |  9 ++++-
 drivers/thermal/qcom/tsens.c    | 78 ++++++++++++++++++++++++++++++++++-------
 drivers/thermal/qcom/tsens.h    | 23 +++++++++++-
 3 files changed, 95 insertions(+), 15 deletions(-)
---
base-commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7
change-id: 20260526-tsens_interrupt_wake_control-08be7b86591d

Best regards,
--  
Priyansh Jain <priyansh.jain@oss.qualcomm.com>


