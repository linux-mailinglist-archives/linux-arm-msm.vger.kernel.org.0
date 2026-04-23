Return-Path: <linux-arm-msm+bounces-104318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PVcO8UK6mnFsgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:04:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB257451B58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C51E83096207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9D13BD25A;
	Thu, 23 Apr 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqO/A+Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BezTc2Qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1823ECBCF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945655; cv=none; b=c+M+qSs9wX8DWxVmhol4OgFdE6WtdN4AtNgpJgFkSPJ9VP2QhVhOqpRIfQZWQovhjzxodmHelFTmR2oS9dFx85tbUXN5pzhfevvzI9JRytZRwMbKUwxsrUQs1+rXDxg01pmskQs2X2LuNpmFlKMuxrLgToqWY4aofvs2Pl3jWnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945655; c=relaxed/simple;
	bh=6erPIlXGx13GlJZwWabtQ127np/SDC9i/rMkHX7eIHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5Tvvw6GDK62A0FRMRADLyaJCOI1EUe54F9Xpg1vh6lyximE0jD7TgsLx/pyamdBHdmibVmC8wvSFjtWsPERs9rT0us3Xb+QW6stS3p76ZVbT9KukIBNDHlrX0q3L6uX8Wzj6K2ClGknrylLaZdZKd7Gga+8PSsPSIDo9SPlECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqO/A+Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BezTc2Qe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEwr3044048
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbQ90sXiYZv9VCLd9FROakxbCP8MmB1zAyP6+Do3MCg=; b=GqO/A+WgGXGd2GTS
	YXXdneToYWIa7Ogl/yZV3jhp8/AKH/Nd1d3OxwKyoNiYgvZcZKQtB6exto8aHXpX
	ywkWfwJ4Vq5PUYI0awQsG468orCI93gyWkUh5hh6annJTCe1j8xPPUkt+nu0U/uj
	eFAe5uk0DzMg4WLYTL98m5VPupWqrO/TRL3ZRnuDNwiPf0YistsmNCmDpY16IKp8
	U+WU+xy6HVY1JM+qnF9KZuYlw+V48d1Q22W6Xizu8I7wW0kt8y/A0fbJVwajL/af
	dYBnUbKijn/YfF19FRmPAoVZdF8E9I0g8EImRrKTLslTUu9n87Oi7YFUNwcGPVh+
	h3jIug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3rvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249975139so121445625ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945651; x=1777550451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbQ90sXiYZv9VCLd9FROakxbCP8MmB1zAyP6+Do3MCg=;
        b=BezTc2QeJL6er6Dc5AEb5fatatAAPIztXG1/56e5h3tIjHUt6gi4mQpX8aCc2LJLXn
         sTdc7QB05x7YiGsknBX3aVCcxCyDr4YBtUpxo5iOPK93QrYd31Q7LrfPAFnrUv63Wr/w
         mjxb+mP1mtOlivbNR+J+L0iYVxIyzOh734Yv4xkxsk04KF7ubgiGSjfvN999Xs6sQjZ9
         5lbRTgPkgRlMnBo+WWnNBU4H1PY6KdLD1ouSxjWLmTtK8/fnhwmUT4mWh0IpaNE23FJG
         AKVqNWZTMLSywaQHIpvrRZKyI/099VNJSkA36Fk/pz29OIatGMP8m2336k9/zM+xaf5r
         6ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945651; x=1777550451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cbQ90sXiYZv9VCLd9FROakxbCP8MmB1zAyP6+Do3MCg=;
        b=XpRr7X8MkzbCqwFIFPmZzdCXzzMYjcf8v93WgcGw16XJrztC1YzyJzQ5Yg3shBWU+J
         1UmOLeygNe3V2ugr5hHeZN/lEU+I3xpnZUkgRKzpuMzV7n4bcsPJikQRrEJ5exGZPTrE
         YjZOA8MIpNnmvN2+Nb89bmyuAU0o2dm2O06Mz0igyo7H3J5eR8ZbiCz4S8Qz1jj7rSPO
         6zhxr7g8vcf7S/GL2v4q1vNaFmk0uOIg0KEDs8ETv2rcCGn6YmkKruIkqBxA5yHIXIKs
         peSXKfJir9syAt3skx5xSTA5k1xUZ7yucWbNTJL9Rs/VTCKrvVx5SADygGNuez27Zgze
         asGA==
X-Forwarded-Encrypted: i=1; AFNElJ9rchzauoFuXwq/a9VgnAA57EpycOXGyG1soswk86leaMnowoO+l/sWGpw3F1gHdYyw80P+1JsqI1+inoHy@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7Vdv8mVT9N9eVBtRrzAczrABFxGddK5zSDhzS4mW0S1FV9/B
	8mfxJ34ayOvynus1CWw7LkmaDsx3enKh5Kpr5hRwGRVK9jaha2ozvByluVRZXxj6+BTeWXDUDpG
	9nxQVVNCuh4QPLGuAHYydd7toR4LKOQMUTlS05KzBdaGJp/ZFn1m6KsNqwtNuN7RkIT+/
X-Gm-Gg: AeBDietK7XDEWd58NwNWmaf/M9c5a9kxYIIZFXQ8rUSgpELKI5o1WP8Gz8+SPyMp9PL
	9gIta2Co9NFYJ1yPY1JAUnCfcZJq7rfAt684qGne8IivffZEu+9chxp6SCJrQdcwSBGt4PIw4lw
	CoFl3frd81LUOY48q+AScE3ORrU0Q9TTYPyko6tf3JqosJXCAy9AgocfY8vNU//EzUgbQAnIiy4
	PX9NZG+MAVm0IlQVfq4KokDgaNzXnpbXFiaX5GJ+dJkBMQMyKh2IrO+ctIDtalvCZp1uOLJMqd1
	WnDX6tXJR8kKJ0UO/IJwLkl3RJ9zVyg4ffTL2QuGhekgIZIdUB40uXaghOib0NLzBtIMdHrL8a3
	4aLfGhkPeWZtRVbEN51tkt6Ub+daZPaDAXS3k7eyAn2HZTROcuWVAJ+qWp+BbrM6FmnwSUA==
X-Received: by 2002:a17:902:9342:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b5f9eb06f8mr207924645ad.3.1776945651463;
        Thu, 23 Apr 2026 05:00:51 -0700 (PDT)
X-Received: by 2002:a17:902:9342:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b5f9eb06f8mr207924205ad.3.1776945650856;
        Thu, 23 Apr 2026 05:00:50 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:50 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:08 +0530
Subject: [PATCH v2 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-iris-code-improvement-v2-4-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1321;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=6erPIlXGx13GlJZwWabtQ127np/SDC9i/rMkHX7eIHM=;
 b=KvFXP2o4HqAnoKvG0uWQ3CIArqpVh9HUWwK6d7xBDzErjhMCHTveDAwooAfI2ZwweckiQapzj
 iEbGDGXZjBwBe360+Z2RA5nH8QSQNLzKusfPnLdbTqxO3X9E9XPEVgO
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfXzdgTbuDwhIof
 o5I/8rpr7k38bL6AyobPVmNXK84iUVGaQa0699/3xetq7QmxXR/mc9QkJvYamUBv7Kt+jCbVCJP
 lqdpW7nJrXLSjT3Bc6oj0OeY14ARPhsvayvRg4ZBrqXVhrlWwkYhruRavoHg0lGm7wACOPAlNz6
 yfrDxPKvC+NLFsiTnq8jGWqLb/b1HSEqNMZbj6Q27bYmj2Vnwhyk//jfVn+yJDv9BtdvvytQZlW
 UZulEbqWeMtvuYmDTGK9oecw7rUKfckfZUZUMFAcZz7OTzTtezooTYJtaZHnRK4c2bHeReb0aXQ
 KqzFHSX3i0MLUD07/10qPo0WXXJdOMCPaYrHlw7KTbZyrxaS3B2HlCUPPmFrOKEMr+7a5PTit2t
 Seeo5jt10bSQAfWRNK53yjNvIt8KYbPnv44SRV+R9EVFwpDDvS1svaA1yfcjOlroBeRLlh9e0ls
 QnYVuiBbyCfLGe6tHxA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea09f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7A-KeLSbcoVXy4yL1OsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8vKBahpBpkvg7P1v0kueDR8wMtTPbToG
X-Proofpoint-ORIG-GUID: 8vKBahpBpkvg7P1v0kueDR8wMtTPbToG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104318-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB257451B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423ba024caf6ececc827f7102e8f3324..bbecee1cc2d02a8283b3465afa686319792d98c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
+	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
+	u32 tier = inst->fw_caps[tier_cap].value;
 
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
-							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


