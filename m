Return-Path: <linux-arm-msm+bounces-80393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8FC34002
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 06:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3524F18C0870
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 05:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD7226F46F;
	Wed,  5 Nov 2025 05:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hP2v/6CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eizNSG8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605F24888A
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 05:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762321671; cv=none; b=gAEzR+VkVBlPjWBJ7ZkdsvZ8AkdUi0dv2DLTGPe9YGtaIqkXP1E+CYOEXgWyFPu9/D+5Psz4D6bq2Hijkcnkd59p5Zd9QaSvMNn3EzvTmoGi2qHqSJkL+0kcXTFtKEqgcl3jlu/LNkJgK4Inwqx9GK6sOuCWvNP6CbYdrzlvcFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762321671; c=relaxed/simple;
	bh=CmCMkFGdjKimc4a8I9wySoXS+kBG+D4uHqlvimyNf3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JSH4tLlIYH9gQ6rHpytzQojblH11v45SGb6YWOPfot8NSgrDlbfxUedZfGhU5w5nlmQ/dVBnVSDLTlEXbXzGRPZI30Grb2YybIQUVcHqrl2E0jn7akD5S+HCn8e+zk8DyapiSiASepDDE87QUt8yai7anCXjaKqqYk6IzwktQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hP2v/6CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eizNSG8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfmoY2978782
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 05:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=83MHbwvzUZdEq/T0F1dNJV
	sVheiPbFtUJACtWCcmOL0=; b=hP2v/6CJoe7LpamhAy8MczphHmxktuMddW8dJq
	GH0RDq5yfTT9+Jcf/Uf1vyB6r8RJybUJhqetTLrO5TwWyc0fdC3eN93Mxg7iiMpY
	2aLaxqPMPTyLiFzWlSxUjlhYIW5fLqsielQVtyvwJQfuCdyRPF8iA36DfwSssvFm
	lQpTPwNQr273YTn7Lv+UMEYo5Ykvw9H3U9OhuacETCkx86XBcv94Owv2598dnuoH
	UGqEl41oojuUpKWcQSx41MXSwbX34cRC1Bqup8x1URdc5yv+nF+52VCtPjl4C8bT
	UdEqTblZ9CK5yMQzOIaQ9wqIupXOxnrmq6fiRiL/wGZDmH6g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjtqym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 05:47:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781253de15aso15198218b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 21:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762321668; x=1762926468; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83MHbwvzUZdEq/T0F1dNJVsVheiPbFtUJACtWCcmOL0=;
        b=eizNSG8VR9Q4PMPnlEHUQ6YQdE8wct3JY4jpB8i2aNqlyI3Qw/k8x0GFpWbjYjep1L
         rQAEDzSQo1BQmB4YkIeZZvhk3T09csUpjV3Z1XmOs5B2jCdu99v/tav5JjUBcO2RigwP
         oS79aIAGhe+dDADHFBuV0Do5DdlQQ7z1zQOkD1QDw6fFok3qDIn6pBTFYJp1TeyqLObZ
         9xEFLDa+OBGF/AnKSuVgONqRvX8UZV6ayBKJabIkC1YIgoq9r6OvvvWsEOp+Ugpo702T
         2l5+8D8x4tm58WnkH5su75AgfhnOz9TZBG4aMqxYkg21XblTlf17LA11wlZdFlYrme3E
         C4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762321668; x=1762926468;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83MHbwvzUZdEq/T0F1dNJVsVheiPbFtUJACtWCcmOL0=;
        b=LV2pMWJu4ZY9OpZo9zNI/eoXsUMbZ0XXZ40AEWof42T+dVcpQ0vqrERYu/vgiZzXuc
         T4Vyk28wH7C0QgGLrvQDMGE/ETaBD3V+/tjKLxhnBpRcZNh3+TySTcR/8Dy+d2SqsfmA
         y/Fy/9qJVeQ80tAihAV3w2z8Ek8xrHfHDhKQACctW/dA7QxK+Q0xNx470hP3gY6x2Nwm
         hYEw7bQZNENQhwav2NsgjdM5FKR74tQ2mvRJtUdlUgRalVQKg6R692ezsOkVEtlDeqg+
         PYHTE6qnmHJRKS/QeSGfAURYvTPJ1j7EuUqsn6n95y9G07I58plkM9EkLzyQ7Um9kytC
         NOtg==
X-Forwarded-Encrypted: i=1; AJvYcCWPBh4x8dbB1ZTMJLgjLsXHceB0p2dAZZqFr0nRg7qhMTrfAx5pifp647CvGLmj/PK8aO78NjhJPhKYXCiX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fvA5S0wzPbS44fJRYovALjjg12/z49UU97Qd+/YTkred+2na
	QmYUYTM/Vaj9eROcuVMRKVzBWzjdB9XXXyvnkM0vekylrhiU/WsOGzz5tD29JibHILBizX6EpWr
	0FgQ9F8SRdVmOycaa+O9kQWFtjaTnr4ol+8QU8hUb6ufFrAlymcqle+2xrc6QQNYu+foo
X-Gm-Gg: ASbGncu+iuk2hpJqZmh4kWB6ezaWfcr/oZdhdMfFzrAk/CZlKlLmenPKCrOoOUyhzXL
	UyKeiSNhwge5ZR68eZ80qta/qPQ3NnhIYqqDVNrkV8oY65fnN0NNW7ic0FcwaEDNrx8OsTXvbLD
	DN/67omRFWpsu40DPEpvxjrtQ8RguIEPTWDqWE5CeE1zIK/o8uJnMJ2t1SWZL7Qz072PeW8aTnM
	QMF5PZC9U1i+BF4qyCddGP/+b91cRTLW1cLhuhakKVP8kUEEpKLYvc+EuZltvLFwj9NobWqTZ/z
	uOym7gSijJOHL49xa54t3eCWAIm2vO3kbsLTsjDTnbjLU5KrBscUQQKgBH/pJluB031jTfGRgtR
	FFOT+h8vDNxOTs6LnDDjl+Vkay+NRs/n2NuhA
X-Received: by 2002:a05:6a21:338c:b0:343:70a2:bca9 with SMTP id adf61e73a8af0-34f863015bcmr2554555637.53.1762321668401;
        Tue, 04 Nov 2025 21:47:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHox9k7eKy6idJXRpDoSZegqgrG1eKq8dcvVFuh9rbDGp7JdOle1rYXMTc1Nt5mZN8yZZBYzQ==
X-Received: by 2002:a05:6a21:338c:b0:343:70a2:bca9 with SMTP id adf61e73a8af0-34f863015bcmr2554527637.53.1762321667890;
        Tue, 04 Nov 2025 21:47:47 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm2090203a91.14.2025.11.04.21.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:47:47 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 11:17:37 +0530
Subject: [PATCH v3] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjkCmkC/3XMQQ6CMBCF4auQri2hUyrBlfcwLko7lYlCtdVGQ
 7i7hZUxupnkf8l8E4sYCCPbFRMLmCiSH3PITcFMr8cTcrK5GVSghKgkp0CRR8Qzd/TkjQalHYD
 TClj+uQbM8+odjrl7incfXiufxLL+k5Lggm9tp5xC0TQAex9jeXvoi/HDUObDFjDBJ1J/I5AR0
 1ptULZdLe0PZJ7nN5K6X6H2AAAA
X-Change-ID: 20251103-iris-seek-fix-7a25af22fa52
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Val Packett <val@packett.cool>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762321664; l=3061;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=CmCMkFGdjKimc4a8I9wySoXS+kBG+D4uHqlvimyNf3M=;
 b=/iFaMOhCzLvfIlk8VviJtF0/+OhwhDKTGibbWsNNI5IWpqKCpPs8jIxaHpqoL81h1K9ORp80m
 wtfel3d5xtbAbV3c2ILDXNRq7K3CcdT6BhZN7I/JWMbXqdVTj4NZM8p
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690ae505 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mRoNVkTk4HY_DrcNXJoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: lIanbNqgOxcL3t_iTMYl2Uf1OU5JLFZy
X-Proofpoint-GUID: lIanbNqgOxcL3t_iTMYl2Uf1OU5JLFZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAzOSBTYWx0ZWRfX6D7M/L5n0bTe
 6VXdsgvVqa6A7T3eqvnGnJ9weROaEQxhm6lin+g7tKJr1V2bjhKIQaPXOfJic30OnRAFOQxW7ET
 lQ8wc3j2XdMSBDiqFivXQ5Vpba7UM2uf5zOmHEuF9JDA3ZDji/chn+FEX+nC7bc544ms9BlFlL2
 Hs3GJcWDPgnZvgy1wU3aksVw2kB1sp8cjtf9YFJ3Zm3nJ2bqRY4Nzx4HDRYVPb+U7KaQbppPz4f
 Ef139tP2tHALwtWqIdpt4A51ITEbz30f+Vf4aPMKyJLwSZmhZFstIf374idMwa2ZbI52DZu4KF3
 AY9Xt3bRDX/bDz75CmcvFqR3i+WuPO0cDzaRgWtuIF6ZrmZB9jKk6lWJzWs/7VFFhPkpsKAdqgW
 NUwEhZFFJmdllYehjb5JAA1rNRRVag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050039

Improve the condition used to determine when input internal buffers need
to be reconfigured during streamon on the capture port. Previously, the
check relied on the INPUT_PAUSE sub-state, which was also being set
during seek operations. This led to input buffers being queued multiple
times to the firmware, causing session errors due to duplicate buffer
submissions.

This change introduces a more accurate check using the FIRST_IPSC and
DRC sub-states to ensure that input buffer reconfiguration is triggered
only during resolution change scenarios, such as streamoff/on on the
capture port. This avoids duplicate buffer queuing during seek
operations.

Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
Cc: stable@vger.kernel.org
Reported-by: Val Packett <val@packett.cool>
Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v3:
- Fixed the compilation issue
- Added stable@vger.kernel.org in Cc
- Link to v2: https://lore.kernel.org/r/20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com

Changes in v2:
- Removed spurious space and addressed other comments (Nicolas)
- Remove the unnecessary initializations (Self) 
- Link to v1: https://lore.kernel.org/r/20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..7f1c7fe144f707accc2e3da65ce37cd6d9dfeaff 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -91,12 +91,14 @@ int iris_process_streamon_input(struct iris_inst *inst)
 int iris_process_streamon_output(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	bool drain_active = false, drc_active = false;
 	enum iris_inst_sub_state clear_sub_state = 0;
+	bool drain_active, drc_active, first_ipsc;
 	int ret = 0;
 
 	iris_scale_power(inst);
 
+	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
+
 	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 
@@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
 	else if (drain_active)
 		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
 
-	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
+	/* Input internal buffer reconfiguration required in case of resolution change */
+	if (first_ipsc || drc_active) {
 		ret = iris_alloc_and_queue_input_int_bufs(inst);
 		if (ret)
 			return ret;

---
base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
change-id: 20251103-iris-seek-fix-7a25af22fa52

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


