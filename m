Return-Path: <linux-arm-msm+bounces-80081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC96C2B3CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78011893436
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11203016EF;
	Mon,  3 Nov 2025 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORAXuhGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f92z/70v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68D2FFFB9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167937; cv=none; b=GnpPhlpFvwmK8ceQ/xkSmNXHkEJnEstJ/bqe8nyW9K6YXiNM+ilnLOQzfwq0lLMm2jPRk8kvBnJ3TjBhlR9MqBaTBQhpBqMzi3IXnjM29TdV4hU1cAJFzIggH9F8157etITsRwPLmi3bLhC69uvB4gYrebKQX4SYey/HJN3WgFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167937; c=relaxed/simple;
	bh=PbBYKOHljQv0hEquyz1u4VUhJlHsSAixsX5XEF3aXtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vDx85c70b44rX4W2gf1HPS55efx3jiugWKENO9/FYuMIQDJnaJ8397pf75gSqjuEKcM9wQt6t1JHuAhb2XZLP9abJYpkteofXzKuCp7iazlUADRcbqMttbZOYi7EVKQdH/x4Iv+TjHZ4Wq8sEo1l9q7rhRMh8WSGoZ9RMWTnJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORAXuhGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f92z/70v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3Aa2k21958739
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b9yQV3m8YeqlCN8IYeHs0/
	SbZ8IPaj5crI0jwyLgZOY=; b=ORAXuhGWmDvQWwQ9LRI8fG/f7dZOILjbOHc+8P
	IajcyrjuIfWWvmrHiSRCR/9GRJv4h3OGaV5wJQyUjb0CAQdo1VRK2qVoXQKz+Zzo
	nUWpdvjiNDsXODFoZRN6O64KTnURbZnEAyDFPEyC/Mj4aLAK08dBeg1K90bhmjUb
	2ohqcTf5R6Y9gqW3/E8EjYdRQW5pDuMOlO+mhA4drfGdc6sXBVrE9bzpAd7z/X20
	F81pU7W0F8ZPPqQgl13iLjfaDMe8BMRun3nF5+dz4VDJrucuMqqEH0X0gKlwOugz
	nBc3J04HlWNTuclb7zA6gSMZGVtzvvgT994+SAha9w9uSuuQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6ma8s7yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:05:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-782063922ceso3813582b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762167933; x=1762772733; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9yQV3m8YeqlCN8IYeHs0/SbZ8IPaj5crI0jwyLgZOY=;
        b=f92z/70viNv2GXYWEz0GUyAa8oFQanhbE58NIogOx5pCIJ4RWHerp5hYRW5/QI36pD
         Yw5N1aIulnE6lJFm+lF1v48zvlsqkh3HK4MPLcF5EO8KT6/SnjX/usHhszHiJ9qD2FhU
         sN3NxLociz2/YuaOBDiIJS5+ladGHJ9bUno7l/oIbv6fbXAy4cJ4CetwZs8PcZ6BLYpQ
         KBQTVz8LARZbN0Y/Xlbi2OFHCbq69RDFYwdnAY3TNOU55DZlohlfOtZ0ntHUliWDTctm
         HPyu/kHqifkp5H2EDcHcGxRCcT/IXvqoUKSLs9dZEB3P+l+82VHhO9gf5WuIzTnqmwwF
         Hvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167933; x=1762772733;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9yQV3m8YeqlCN8IYeHs0/SbZ8IPaj5crI0jwyLgZOY=;
        b=Lq0dmZPTa4KxgeU0ajHIZxx95VVMh+G2bucCpzxeGFn/kqfH81WTpqwae8ZZ/2hwt4
         0wEDY6gIJLymixKMhk/4k8Cb/SrDbzFRPGkIeI/jCqDScrjzfbIQOhIMNH5IvvRoMzYX
         G/r6tzcd0Ivx+Iv0cAbB7n+vo+/oAia4mrE1atx8RXTXXFe59JUf514uSH5aMqP1ZYCl
         qYi0oSCTCJuDIUz3pqHFcaAkz8ai7+z2Dc6JqNrdlYBp6abByCFH0wpkf7XQzxazzCYl
         UtUhb0IBV3TLcT58V0PupBFMudL92v5AS3cUX+Uc2vMm5VRccf6iJtuPBNJO1AhDIPmM
         jZ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3SPiPz4/rUn/QkvCt8D1Tfj1QchW4rV3krp5D15hNg2Cnnwf73RaUzs6p2tPIKeqoRQclPApXexSf0BBa@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhFisX4d+U5im6n4uZ5wDsL2Cfv725wjrand4lQcNff4X7cBA
	7mixwbruOCo9/odXBC++je8AQGsY1zrBvJaEAcs2kUJysh2VGdf1MiQGuVXC3+dpPrkwsP3znkQ
	Jq3LCWh/qVkPD68lwQ4EQ0oAN1CcXWWEtbbdAH030MRQSHrg71CxT8YbCSWgBiIWVyPsx
X-Gm-Gg: ASbGncu4rYa24iB0hb2VXFpjlTUxcnj76dgPZ2IPSyOVL2Mu3qnhd0Lxsie47jPAK/0
	3yHYrW+LuTdsiBb/Y8kEiNZIa2OSC1cTm7JMk2TMtmXarPfjDBjNwBHfYKAh/6hMvE5QCpP8O0j
	HCRy2abt1EQPcfhdThMxT6KKJcXu7jd4m9s4WBfS1IIxAX9aaeCpe2rxHUzhgyDs5EuqVpzdLaf
	eO0gLAggz5KSE9fKmEbECvfUsmVPp0q5csS96ZHl0OkuNg3TeEZsF4GSXXTGdyIUG3y2hJzyVjS
	qXNuh8iazlvRM2tKVXEGaLUY7aYHiWZVzuxL6bhrzdLe4tp1SCgpcc8AIYZypyCg/xlSqnMpGm6
	DselDHlgHd32B65do94fyy6+hM8OPjTaJfHQE
X-Received: by 2002:a05:6a00:9295:b0:7ab:8d8a:1006 with SMTP id d2e1a72fcca58-7ab8d8a12ecmr2438514b3a.2.1762167932608;
        Mon, 03 Nov 2025 03:05:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOO2X3OCTIqFGdg+ksykjsr8Jsfhybzyh2B1RQ3QM+gdzBjae298OrS82qMQLYKfqudkH2UQ==
X-Received: by 2002:a05:6a00:9295:b0:7ab:8d8a:1006 with SMTP id d2e1a72fcca58-7ab8d8a12ecmr2438472b3a.2.1762167932082;
        Mon, 03 Nov 2025 03:05:32 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db09f362sm10753700b3a.38.2025.11.03.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 03:05:31 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 03 Nov 2025 16:35:17 +0530
Subject: [PATCH] media: iris: Refine internal buffer reconfiguration logic
 for resolution change
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGyMCGkC/x2MQQqAMAzAvjJ6trBVhuBXxEPRToswZQURhn93e
 EwgqWBSVAxGV6HIraZnbhA6B8vOeRPUtTGQpxiC71GLGprIgUkfHJgiJ6LEkaA1V5Gm/980v+8
 HSJfEx18AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762167928; l=2639;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=PbBYKOHljQv0hEquyz1u4VUhJlHsSAixsX5XEF3aXtg=;
 b=WYIuLfzXNU08ovUHkWxdR29tQKAMXsBBvw47SlVLVxzDgjaiVw8PeJOwtXaV/G18pYuWmc9iW
 nMgXX0Jka0oDkEtyXq55bZXVQbNw4FIzZ9pUOCWBawkCehrzDcFDEYw
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: clWq6qkyaxK_XdZ6C9khMAWlqR7NtHm3
X-Authority-Analysis: v=2.4 cv=UJDQ3Sfy c=1 sm=1 tr=0 ts=69088c7d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=mRoNVkTk4HY_DrcNXJoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: clWq6qkyaxK_XdZ6C9khMAWlqR7NtHm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwMSBTYWx0ZWRfX9bctGw6HKamX
 k/kK9ZB/Xm0yNGqCm1NnGYYM+iKtYb2uwRQyeeXCKcoPeTVgStu8wztCtwXdmo2rzQXC8G5q64O
 gFHVoSSFRjufAupmo32UzTtwNADHRRXIPg/EKtiwnS3GUSbrYPiuae35EO8qycwJtvz/EPANaZ3
 k8YEsZhZheOxLPbKvAHZqBoZFhM0BmnPy/ZviWbZoo6gsHmIMHKv6woJFkduWSD70hOdimD0nMT
 nFTdlcc3Exqw7CnYQIcFfBLBkIEH1XR2N8FqYybSbc1sQNxyyM9huhjArkWzgmncHhMBWQsj9dg
 egg3WhgtlMSr4UH7M0AnSIsM32NSCCakAeVzUBn5ffmSvyFARjT3gvCsFPEHjHWUUq/ZBOfzB9+
 ZW1eB1O5/w8jr5VQfdiwzpfYS+2GeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030101

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
 drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25c1e5bca0abe501f 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *inst)
 
 int iris_process_streamon_output(struct iris_inst *inst)
 {
+	bool drain_active = false, drc_active = false, first_ipsc = false;
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	bool drain_active = false, drc_active = false;
 	enum iris_inst_sub_state clear_sub_state = 0;
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
+	 /* Input internal buffer reconfiguration required incase of resolution change */
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


