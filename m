Return-Path: <linux-arm-msm+bounces-114505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IEx8MZYHPWo4wAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:48:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8DB6C4D2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:48:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p2vlIuEF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ce5PXpFn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114505-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114505-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6549A3052441
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C622F5474;
	Thu, 25 Jun 2026 10:46:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F9330675
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384389; cv=none; b=cMAyP5hLv+qAeIOL/ljlHhE/lykGf6PdZDswe0ojALpStHjVWi6FbPaScZ4Pa6HJUpOQfHczJVyi+/Zz9w37bA57x8bhRpSGp+9kGznQbeszrwmHxWjrqh2oxCn7g2VYx1cs7vLAaN+xodt+TfZB88+dKLneJeVyZRa3MF1hCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384389; c=relaxed/simple;
	bh=2qv5ewq1ayMiwA7pIPcW1bE63RIRPVWk501yvyFDS5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LlHJFGqVVVysLB8c5cTZ8u6rk1CrN2015JtqlKa1NwQ4pEqfkMrFaHLP3grdmh0OfNxy8EVjBjWqkImtyLmUpek1WeHHMiPv/GCRzSjXL34ltURHoItzvvMSRmOU0UvzSsJ2smx7403zYE8Fx+ae5u5rfQtNz19c2jYqPT9BTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2vlIuEF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ce5PXpFn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k0Y21398021
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=; b=p2vlIuEFK//7zrsL
	WruckMQiBkDEmLxwbQzmmfXGIGL5YOMMjWUSo+i+xpaX91ShoIoUGVXvevgXGeLD
	cIXFyN66VSv22T4lID2FK94VHbBkoJhf10M9BIbcrJcqiVXS9lJxUTPzebq3BwSi
	hCqycZ7QJy/cTuk15n/eoNiBUV5l24kQf+IcD5fQ4ILiSZmvuwx8XyfbBLpMqCT1
	WXlhrLNGD6I0RF/534OGWzZ49z0KfeaA8hsNK36vvdxh3gjpRAMv+1XIIe/GCzA5
	Uvl4+4BBns9OuUe/jHGFHQg1JfC6ySV8R5GlXwnYnd/qkNSMVpPDvwhrHIGDR+3i
	nJQmjw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudhqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:46:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7e921550fso18401625ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384386; x=1782989186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=;
        b=ce5PXpFnhxJv1iEDZNeYKvvWWCFo1QwKpoupPnK3SCPbNCZp+0vrvWJgiVk/xnQiIP
         qh23IIaSWKiuGyWA35BRQMCMy6m/tDQIbhb+ZNLloDsEkKoQcx/8ikCj4dJIdbeBGPb+
         XT+7TXo+DKaOVoQMpnUrzzTF1MQ0RXycY25f3OPsAmneKDisasE34AusSmCMQULgnDKW
         2pg35xxZJmtdPtrtorA4WP4j0N05r/wiTe1JuttAGolvIMCKBxZ5+aS4XIg4/ybfv3Pn
         sBPemVhaMS6wZscHI3OmcFlvWFNakH5W/MuoQ0lQ11KhdDAtyUN/ypBzK/wdml/6F9XE
         0fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384386; x=1782989186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Og8dUuxYfUI8iPCT4BbZaBKBzGWQaRRs4BGixtCQHqI=;
        b=ZJfVEfBxjx4L7CbnSfF6n0uXt7rffAupZ5yqVVCPpPKEX+XDqxfWjfEUd+sOSsmbie
         DylE96Wb3GTYmtK5Lp40SmxVVMVoqvmv/ddo+Npbn2eKNjffAUHqQz7eoq+Ntl6sGcDp
         gQoUCsdsZXUcwE3o6rYozQed1XvL38cRDJuK5vi0WpvM+2mryS4QhsZLgJOGgIpqw487
         UkT3Pn8Nf5lJhFRSwiqxIa18TZ98jc1gXoEsp45mSqBbZk5TabEQh+bkLBLpEveXyr4g
         NtQBSMDpkttOtwhdyjjq4M0ESnYtq9ORg2Tawhn83VD15DbIrMp3spvZ7elKhnZBBEBL
         Aqig==
X-Forwarded-Encrypted: i=1; AHgh+RpPES66QoiVfncv7KUElYyf8Al2cLo2oDRDEtDMDHfmhJdql40NPntxoWpSVh0nTw82NspQoNPdXFxQXctv@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyIpbLlHpMcWe8l0UYiFOmLA7bWLQIemOtM96+/rYNlT04NiQ
	WWn95MIqc++X3icy9TEPXhFn1JN3EOGfgu93oJ19X+OBo+JY0LRil26xBO8t9egWOMyDYTN6Qwc
	rHCf3Ym3LUPXKene5w4TS/KyehlSuMRzhtc30x7YyZh6Dp1yagTivniwRGDU6YlRce7lR
X-Gm-Gg: AfdE7cmX0Af2s9LSB61WQaWf7UAGq7ZHaIZenecGOn62uyYHzoqsjSSnJ822QywQIGs
	hzvQBcM14ivqkPO5Zgpio9EY17EbeDCXxq+jg8yBIz0EwGxfT5I5KmtV3feMxfrJa8RbpxKprTi
	ZMRShuQOvTWZOlKLhn82cE2fiTI1RQRwyGmtSBOLgumhSTSJ2jjV1cv3tnQGfcKCa+gpYm25STT
	QeG3+B3SlaHiFQVupLFyqkPRKYOu5BvToCjg6JG07k/HdfsdIaD8pboO5KILfsMdkRfvEfVkFLB
	OOXSMIGS0Cvaauy9Bwa5++PNtY/X5nw6Z7rK3ZwBlaCXotto5ZoI38gcqPH5tVws7qcRLky8hEv
	v76CIUoM7uYWA3GyJZwIESLbdlj7L99VH+iaPCwOyylLOgchjAY0P720truiLYJWdJSWbgXHd1g
	==
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr21454875ad.35.1782384386257;
        Thu, 25 Jun 2026 03:46:26 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr21454685ad.35.1782384385785;
        Thu, 25 Jun 2026 03:46:25 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:25 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:51 +0800
Subject: [PATCH v19 1/7] coresight: core: refactor ctcu_get_active_port and
 make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-1-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=3815;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2qv5ewq1ayMiwA7pIPcW1bE63RIRPVWk501yvyFDS5Y=;
 b=3vlrcWFnAHSdC4q4HVI5kWl0yLxPjWU5FuOyiBV2dpVW3NmwTup+szP/owlmFgK2Y9EGCu8LL
 0YhWZr56BubDg2VIYoeooe2EAPBVOOCGz3bihyEpTHrkLSe0+ocJyDB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX+fC7+D2z0XZ9
 YmASt+M64xIlE0utwczTXFulwv2wlvm9iCltWWuolWeYXFKf0G6We+uFf0xXVGKubuAnJvX+K76
 dyMI6gi2bYrwDYJJQPM12ZLB57CsuDM=
X-Proofpoint-ORIG-GUID: Ftnq2vFmd6wCTgi8LT4OtPjiVbU8CPKP
X-Proofpoint-GUID: Ftnq2vFmd6wCTgi8LT4OtPjiVbU8CPKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXzscwJFtq8XgV
 sSpW1Yl4zIif1zSASZVb3EEiXm94LqvOgtnppA3CL7T0Cyo4Vh2VfIj9ahA+Y51Ux0f7RxgEO43
 Iv+I8d9uoFHzDHEqWp8j6TteggKMuPjI5hB3r4fCaBFGb8vjUqYzl9TWSWNtqi2K9FBJiN6Tmm6
 +mQt69zEMFK8AOoDhOeDb495TEeSOLLXRYqZdW2luva4QUq9pK7D42LtR/6BcCDxlStAmxxooQb
 pZO0SECuYHxJXJWD1M1IlVatTsPrfIz0ke+WMGrj9RaSMGiLbaXmINWYW7yF37dV1/+vkmfsJkT
 vwhA+icp6hYD8mrmkWVCrcpjGLR4T/zkUiRxCCjtgiRHCqk6H7ZMyUavvu1DxaQR1/4E3yfqT/I
 ZmcK+LwxFqdcVdeLa8fKEGmMSHI95Si1qC0FNVAmcwQnlY8zJkuvkmqzTUSFqI37oeewZTgZYvi
 KMd/dCAfyeJrhKxgi3w==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d0702 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114505-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C8DB6C4D2F

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +---------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6d65c43d574f..7a7a85acdca0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e8720026c9e3 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,7 +128,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


