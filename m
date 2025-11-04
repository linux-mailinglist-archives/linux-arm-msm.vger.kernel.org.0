Return-Path: <linux-arm-msm+bounces-80215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF058C2F57B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9AB804E1016
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE53F29B8E6;
	Tue,  4 Nov 2025 05:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kqa+LrTJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ0ULAtH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222512609DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762233082; cv=none; b=HY38XYk8nhObhctBHTN56QqY/WNLovtJd2N7FtRMcrhESrtihewMOCGvkq96gr2anIeZObyvvym3yT/mOo70x1EsPbFD4+OXhR4Vdb4P4m7VsPyfhayZkphe9e5ItVJw/najFUJ2PmkuotgiHKALFixarTMuCbLX3xxCwyXnKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762233082; c=relaxed/simple;
	bh=DHiyPiHeVEJN7mXSBeHumDva6DT3sbfHswWFct5wfyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fsH6KWC6smwUC8xiTaRlYuMlX3J74uHh3xL4uAZj9zDTNyGUbiuAi4G6W2zkbsdiEUxhZhYDIKpLBMrpiq9snJmgWp3enL2GMwJkBdM5wutZpWTdMhuIwESQ4VZhaRG1AR9OOwHIWx5Yx+m4WZtbjtLxw1n3+/ThLv69d/3f5GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kqa+LrTJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ0ULAtH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43P2ah904583
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HGxYgLpY/C/ADuyIkMkTEA
	xGBXm7vFVck05iQr1eLLI=; b=Kqa+LrTJna9ST24P4D6cPRQJR5/tpp0BWA/MOw
	14nQzBhZ6LlogSO7x6ssgH7WvU+Xwp2jC268pqI9oZi2RsFUrl7f0FWYwCaEzYsA
	X+yu60ma22Ld/zNDgfUzhLJ/XYaePgu2pcRvkrlNXIOj9zeDsS3w2pL26voW5dsh
	7hAD9cDUAtAM7nRy7wSzqdFazHrMWMFfckbnlAEcZ2hwKxQtEWdhdsp00iZU2U5A
	QjyltEiAYc9npkpVjZdbR8HUweMcyuLXC5VaXP+vXS5TLqXLXBoHZGmQIIIRcF+n
	kfSwP1Hi/cCXYSobQ8HX+ZdRo03RZWXj/SlTQYGpAxXt3hQw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjr7gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:11:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117fbda6eso4790345b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762233079; x=1762837879; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGxYgLpY/C/ADuyIkMkTEAxGBXm7vFVck05iQr1eLLI=;
        b=jQ0ULAtH/QfdPIlfiFixsm1IBj7njzc7I9y1SUGlwwplG2cWZgsgcC6HuQn4e96caQ
         6/P37aORW4LB1j91d/GpsRiE973FTPMyNSS9c5kp/ppr2Zhxf+UfBoRof5mZTmatHkBT
         XL1W7aUv+oyYX2y8SfPBGbD2SX1nZzuDD5MTc+LnYYXjr9PMLdw/e6RZ3S3rxnlTTl6I
         h4CDE1N5UKtN1V7jkJIjDdEFvOx6h6tEjg3ihogZydxl6vgRj35A2HEQT/AiJ4//QNFS
         GkaZf9leFeuwg/5Aw8a7o5f5r6r4wa8hvf4HJWMMCr6S85P7tFVM8ZSkdtNvqhTXwC6g
         jjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762233079; x=1762837879;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGxYgLpY/C/ADuyIkMkTEAxGBXm7vFVck05iQr1eLLI=;
        b=DJlWIYypUwUd/lbCtPFGwy28yJRARNI3z+pFLR8JYT73WR7UOhB0bFcrTO13ZfQuMr
         n5BGDQxrWxvNKr8Kwd0nGx9LSB1HnCzL7p7CMx2crBGm40DPaUpL0knZuepnGsmMOoQ9
         yeD9U7xZ665sDmYl40hLldyFiFYUBvvVe0qgQxjPQfH8prsrogDrMAa4TvVkiad3fwfU
         6d1W7AZaTSDIsnIr41snWOpcQexiI1BAe9Rtx8JX8mhGfXyalUCNHcOWa2n18/4KBm8S
         o0kF4KHbsscTJ1wWRhHjFNHx9cPI8vZm8KYXZ4BYsXQ/9qPOoXrnJU3FyQUnvV31eJJW
         JysQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZzWBLna4lj48QVuargxAW2IklwTPqPZFMg7aj75KlidTwRp18/o2jkfeRbJhkXRS3gddSxA7A1WO3asxE@vger.kernel.org
X-Gm-Message-State: AOJu0YwzbEz9louFRBIoTGig/AIy2YQIdTL+AVhGmW7aFPReaNkTL0eo
	1sGe3aqbLK7FQE5UlXMeqMz92Mwf/QoFV/vIEJgfxv/AkEtpCGKNgn6Oj2iwzUzMNNolHQnzTIz
	GRHR5LJDKA39DwOURqu4vLWFRBahuWhX70bEQqA0WxhGsVNpeQ0umDGC91dHX0Z9Bp0xp
X-Gm-Gg: ASbGnctSDBx593sSc+YMUxPlkTUp01nA+ivILRlv+l36WcK6B4Ct8tYi5ee3lHhb244
	krJRMj0McLTQGxA3ivcNLZCM8mi0My7S+geBgHNUdChCCGT4xIdcDxgLuGNXFBPyZrdB1EGgBHE
	cf3npxKZE/eaXCFj6Xn6UdHLbrG30cTIhzzDLHvViRdbycjvcBVePXoxCqzbUAtMqKra1bSJp84
	lLWErItbdC2/kBJ8N2HlOvWj3sPCxBJzwj+WKlXgtEmdpuIcjhLfXAhOqxIrYyHLpGoZyIvBOJy
	wAut/S1gXQO40ZUmAJCQIi0Cw/GmeY/0LVM6ua1HKJupaEEzkXCkLpK41GRbMzGfVPXhSAr4OIf
	MmNEoccueA0ZdZGv219rfF19UpyWbaieYrhex
X-Received: by 2002:a05:6a20:1a99:b0:34e:d23:8627 with SMTP id adf61e73a8af0-34e0d238baemr2662021637.0.1762233078699;
        Mon, 03 Nov 2025 21:11:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkt+l50JG82nuKGRNdLks7Qm1cu0wwhEVaJxoOeDjsHJo1bUqvPBeRutVWpmU3HpqbaBIn9A==
X-Received: by 2002:a05:6a20:1a99:b0:34e:d23:8627 with SMTP id adf61e73a8af0-34e0d238baemr2661993637.0.1762233078217;
        Mon, 03 Nov 2025 21:11:18 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd392022dsm1331626b3a.23.2025.11.03.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:11:17 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 10:41:05 +0530
Subject: [PATCH v2] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOiKCWkC/3WMQQrCMBBFr1Jm7ZRmJAZceQ/pIrYTO2gbm9Gil
 Nzd2L2bD+/BfysoJ2GFY7VC4kVU4lSAdhV0g5+ujNIXBmrIGtPsUZIoKvMNg7zRebI+EAVvCcr
 nkbjorXduCw+iz5g+W34xP/uvtBg0eOgvNlg2zhGdomo9v/y9i+NYl4E25/wFOkXetbEAAAA=
X-Change-ID: 20251103-iris-seek-fix-7a25af22fa52
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762233074; l=2800;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=DHiyPiHeVEJN7mXSBeHumDva6DT3sbfHswWFct5wfyg=;
 b=Z9TEr7hhuODzz3lKHMGCc9oSH1i9a8lzwSoCk8Crr3ESk21rKODCq7LNR8agdj5bnh4bDRoaP
 f7NP7MwEi8PDuHLkAypsMaACeWn2bU3NnNtx9WfwIjsKtVZbWHAEPaa
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: IguRdapv6x3QQ3s7iQiAhT2nuQWYiC9e
X-Proofpoint-ORIG-GUID: IguRdapv6x3QQ3s7iQiAhT2nuQWYiC9e
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=69098af7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3jFL_YYMMiQr-fRWD0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAzOSBTYWx0ZWRfXyYyeeEm6LXQb
 OVCUZGMAhPg3q2IB9vkQdY+ams8nza3yoc8sR4rFfSPPi0YlTyiscHE15F6Q3GTvwIuqGbTkHFu
 g2qMOZ8scq19hGPlUHyPJlYFC68cF+tMTXmALfh8psN+tFeoKgILa9s8S1Rc/Xg8NMitauRfT8w
 MC8CZES/egT3S/oOhPMUhpEQ7WF5B4sxNZZXmAddlw6lXESQrQ3c9VG4AXMIxUSu3TvfWMy/b+N
 1oHNS66RuTmlgiiOMXUb0C4IPFb0ZgbI6SdZwSynb2WrJlVN6oLNGjvYYijg5+M5deTCHxZjajq
 tNwF946QApLda+0g9TP43K3zgm71Ve8iAGvZanVgzvwr4PXMIST5ctsg7LkZ34tIVN/VrwCrb8d
 KnH3/72MAGvwD2VIn/4cfhImJVNK0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040039

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
Reported-by: Val Packett <val@packett.cool>
Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v2:
- Removed spurious space and addressed other comments (Nicolas)
- Remove the unnecessary initializations (Self) 
- Link to v1: https://lore.kernel.org/r/20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..ee377131c8419c434c85ec8e4321db39bbdecda0 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -91,12 +91,13 @@ int iris_process_streamon_input(struct iris_inst *inst)
 int iris_process_streamon_output(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	bool drain_active = false, drc_active = false;
 	enum iris_inst_sub_state clear_sub_state = 0;
 	int ret = 0;
 
 	iris_scale_power(inst);
 
+	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
+
 	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 
@@ -108,7 +109,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
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


