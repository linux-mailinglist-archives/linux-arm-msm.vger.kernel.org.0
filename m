Return-Path: <linux-arm-msm+bounces-104084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDk+IRqv6GlDOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:20:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E379A445314
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10388308EA1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BDB3CF691;
	Wed, 22 Apr 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evK9AF27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDGbZC4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1732F76D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856626; cv=none; b=Da1DytQE187cPENr4Zl3cNuXVxYaRrmwKjYc0RS5pfZALXL3Kd+kqLxO408sasIYgIxmhzcFDolA+8MNa2G8Hyvijm4JOXciDsocYbuamP0as7zlL7ypFNnQw/FvI6WpLZw/NioVMfEFGZ11vtCyoiOS2rhFd+3L77fYbe0fPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856626; c=relaxed/simple;
	bh=Qy/Be5/4hsLlhF16qrlPI+nyPqg+3meE4d+jGR8bZvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nD0gzI0kdhxpur6yWf8VEXYZyDbluz11s2jl+ScWP3B2ZkKZyMs7jUtA2ofDq8o/4ozyY9Slnbp/aUV3NermCJFXB3Un1qGympkbU0JP+/aRmBFrLu2/ikRkCEn3ld9toHvjQnzdBCf0lwyo9aJKWDTIUyTH+IGOz9/6StWkKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evK9AF27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDGbZC4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAQtXH2000982
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b4BYumIlUhTMjTFowWUiyeW6SXHWD9PMEUFmloo+xI=; b=evK9AF27Tk2AdAO0
	f2E+GfslRDKFfqnvj3e8Zon3sXnPp0yAB20e9MVkg3xb1fy42rT7Exh5a+wFkdWw
	grx6ZwS7S4TObiAIjQCExqOemYRhWTuMGy/h3pysCt0zHqoPmgoQ1YT6RPBFyqhG
	FtGUGHQ6G8BlGIAXZIznb7rZTomARqnauVVQdKdvn4RDyjGrx18XAW78ZckgKwEF
	Xl/Zsqw3Tzb1CSh9SQm8/5lAEyhMjzu32awmSiGoQmPYtrthDC+2aW1JDrSs5YEH
	mMw8rQ63qqu+KGTsePERN+1ihOd24sWbWllw0uf4uH+1Nn51Lqr+/U3bjEu0Wx7q
	ILwIbQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfb6pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79907d4c57so1207045a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856624; x=1777461424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b4BYumIlUhTMjTFowWUiyeW6SXHWD9PMEUFmloo+xI=;
        b=CDGbZC4RmHGZIHLjAImr1tspJfbD+6wLZZU1lfbiFSlq4b+xWJ08G4z99M/0dJQ9lJ
         O2hcEbpTEkrWgsM3BMsmZszbu1oodvpc2+m4H9b/KaL/Y2Y47m6X+GHNRKYmCtmfbmwm
         4WI+b09piPnR2JblO5s0EUM8+KG7d/asou8TYeyeZXhgm/jq8feRZTFXIjirr2OT0IVn
         SY7AM0ZG18iATMFHOw2ERjf1LyEJ5cqEvGnlBhIrJM7nSurzUFEp3UC8PfEQ8N4BnETa
         QMqvFsUNJDOJTcKR0BS3t5q8LEZ037hJ0CV41zrpSYZkl5Bcnh6XBi++dzvUNQTnxF/B
         G11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856624; x=1777461424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8b4BYumIlUhTMjTFowWUiyeW6SXHWD9PMEUFmloo+xI=;
        b=clGAAy8RNQrTk75t+/I3YVQ87PM5UxrpSsx6e9qegUO+GBFQkBRNgbNsGbJPlBrEU3
         wRYLWb+HyhRioD7dClISCiiNLlmMpDxON5nVKjL1lCRne3Z+A6+VreZ+AL79aWfoDTZy
         Mnrqb4f5qxYfhJwBlGv57wC48GgRBa76MFPlhfs0ZasBP8anm7LArp2sYClUrV308+7F
         e3n9V865Sj43+YyqESw4d69dvzlz9jBpvJ43+FqlO+Ta7bWZnoTS7oLKu8dsZMdvUDpv
         o8IV5G8Cy0g5MpQuz6EhEAOick9a4wD596ezcDrrPoQvpxUU/gGxwhvSjG5T8irl7rjd
         xe5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9cVdyoG/9b4KzgQffPyi4uwW/xcB0YKbJNkgpfObtmmmGSzubusgx5QAbwRrFClHV8AzM2UkwsI69GTJRW@vger.kernel.org
X-Gm-Message-State: AOJu0YxEL4FXMDD7WNPb9zQxtRIFpSXrhn+zErzUnFW2qtLDH0mq9H6X
	QivIvrOdos/nbpC0fggGStaHb9e15emaIqkBhI38jfZ8US/NJwoc7q64vg/3dJphgLd3EKepMJx
	p2ZMt3hsuJMtmpyWLNLkpuUxIZXXQ/yv4px5b9hDjJnyZjmvQjig3iNuXuvJtq0vSVKxY
X-Gm-Gg: AeBDieuL9i6bh7X1gaz9OvCeCeV8dPGsYuWfys2gYWK/m/Gto0FJkUgzPbO7AaPbAt6
	m3siftwTxh09kbTK8Ey5zP2AyguqTUfRZQ8klP5aHv6wwg+WRpCZrGqyxB48smPdiDRO7o+nVH6
	Szo2GPvP5zX4fdc1UVRfww9bpIQu9/avw/q5oQv9ox2msnqKEuS4xR+pooXn8hFL21h7dvl2ky1
	kAGG8hLxP7UjeqEreqJDjNtIOWZLaRh3g+BPTPb9J1GIwVyUf8oqgXi772JffZvRFk54os79cMa
	a8ZyrPGtIXBJZkNDtSrJw24wtLuzKxRBq0XCqlwZR0tq5v45fXx5q1C91a/2eRSMm68uSwprvHo
	AjUZOoc6dJ/k8+xkmOnCuK2l2bEOcn9AOpPnjvmZb1lr+0l5joksNJy/nlugmarH1YxR0sw==
X-Received: by 2002:a05:6a00:b87:b0:827:441a:c970 with SMTP id d2e1a72fcca58-82f8c87e33amr21942477b3a.6.1776856623562;
        Wed, 22 Apr 2026 04:17:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:b87:b0:827:441a:c970 with SMTP id d2e1a72fcca58-82f8c87e33amr21942444b3a.6.1776856623065;
        Wed, 22 Apr 2026 04:17:03 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:02 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:36 +0530
Subject: [PATCH 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-iris-code-improvement-v1-3-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1180;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=Qy/Be5/4hsLlhF16qrlPI+nyPqg+3meE4d+jGR8bZvI=;
 b=jtm67hkpdalOgvSzH4iWBc24BA4VoODxqqL80IMpuBtOJuoHk/m36+f7OGigaor+2z76JHmEW
 pLTW4DHrlZ8AAZ/k6cD6npl8gKWiGTzz6UQb24JLe7nJcBPbSs/c5dH
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: c4IHsTdZvpcHbn-2WN10aK6KJdeiZxEJ
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8ae30 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=et4WSneAAUjHYPCqp6wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX3cNtvr28/C2Z
 WjKO0K1qJqqUCw0fPSS32fVlFJipoZjgMmm37csVYNtmXxRwNk1L0d5d3OSCAVj+bC1nw/aSjd1
 Hs9ltuWXa7JkUz/uPLwklD2ML02OGmzkKUkvaSz5FKdsV/JDaa/WYxEZTD0eNVgS5haeaamIfrp
 YZgq5QGNccKgjCGCddnxPT+9eA6lUMiOBskxMIUN6f0/0N0iDEpbd4pNq+1D+KyWXyNmUkBrrxB
 KgdawFRQtlSjHZerkxZzG/0dsAeGIC/nDxE7kRtDezhSlGRPyY/R2dqk1pA2XzxPK/c121w8xRE
 DHIx/lnYQBt7tg/G3ikybUs/FcA6VTF1ae/SUGhZ8sOziEZz7Q6fW51eLvxvwV0Wr9BmKLovxTh
 BXOeTBRlBFpx8fuVkAv4R/YEWtQgFIzoNz7pgVeZhbk0mytrakdN5EdH/EyOMamZoX7HaexhNpn
 NWz1MfeJMbRdxGoCz+w==
X-Proofpoint-GUID: c4IHsTdZvpcHbn-2WN10aK6KJdeiZxEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104084-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E379A445314
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iris_allow_cmd() incorrectly tests a single sub‑state bit using a scalar
comparison. Since sub_state is a bitmask, this allows STOP to pass when
IRIS_INST_SUB_DRAIN is set alongside other bits, violating the intended
drain semantics. Fix this by using a proper bitmask test.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8..5552725c614ea2e336e254898270302fafa646c3 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -269,7 +269,7 @@ bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 				return true;
 	} else if (cmd == V4L2_DEC_CMD_STOP || cmd == V4L2_ENC_CMD_STOP) {
 		if (vb2_is_streaming(src_q))
-			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+			if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
 				return true;
 	}
 

-- 
2.34.1


