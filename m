Return-Path: <linux-arm-msm+bounces-104316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJD+DUYK6mm1sQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:02:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D8451A75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52882307584D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6633EBF06;
	Thu, 23 Apr 2026 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oopMWBFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXfB8S06"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFB3EAC9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945646; cv=none; b=ryvYYKS9kBBhuHtp147HqB1/7URvQ0f/sIsOlo5mkefFJGN9MpupmPDpP9jslwClOFvZowuir/iSRNMpmPuvHEODcXG2jb5XnPVIsvhTdRaxFCZn/2WRMzw7VIRrTMny3NhY8aCMOkXnjfXbg3ZgnnX8uFMJ6Bt784XZA1xfSHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945646; c=relaxed/simple;
	bh=i29lXDR220N9S/ZCltewSH2m1udYLebrd2wvWU1dcKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/61lHRqjVn1qoUZmPDldkh82wY7tDYGJrS2LpVpQY+9k/J9MlSaCSA00HDI+qsdj+jaD1Dw7Jav/NRq/K4O2Pj4GwDFEu6x2IOL1PvYofuNQ9n2HH+IYzEo55uy9lGzfYhDbJ97SWtX/DHmc+Un0Y/Fhj2JI12WkO9WvP/WSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oopMWBFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXfB8S06; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u5GQ3769050
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2aLu8tVOEk23kPdNH5kca74rbgoKNO8p6b0S6AIX50=; b=oopMWBFNUqDHxJ1f
	8s0BBoh7oQ2oUzN57gQW8Cl5ZLn7tiK8UIqUTppahGzx3BX/pudEpQ8YpdWNeNfy
	9uARNbs3BpSPu23gB3ummYCXvAe6qvIX04fm9XRSEsUwkIQFPIFRL37sP1bdHhGl
	R9FuPxP0aMR46mdkGXkyvnmeyBvmTtyLm5VFZ0X1QCaiUFk0M3WM746Y5sAKHhDY
	8jTi5cvXjibGCyFhtnYK9CO0l9ONFaako8fB0p48xdAmd+DCU3pJykGADlvsmvFL
	v35EyrbHwhwt3sPsfcgBn81aeJ6OHfmVmyAl2oXhkDEeIjaFjRq1duhFQo9NMUk/
	IYu/bQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq3rfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:00:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e06219cbso84169895ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945642; x=1777550442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2aLu8tVOEk23kPdNH5kca74rbgoKNO8p6b0S6AIX50=;
        b=aXfB8S06sdtr6af5IopjaRjbnIfmg5LEpb5X5QiLlrvR4SlLlbNeB/sy4ER8MEx7Vn
         cvbx1QodEObNBOMXXkmVt50g6A9xihMV1L5kAoZziW264xF4BsOw6mi0RDlutxSfH2pR
         TW53hSLoAeVwmD6kjcklrXqsyH3n5RS8PGI0HCsV6HXX2CiteiXlkSzraQ8I4ZxCoCXq
         I2CkIEvLUIjvt7V3gUO/eYuHg4heqgA0iaQI0gWTtR9bY/e4I8WwMqyh0L50O2yczWl2
         hQwj/lGOlFIpx3ar/MdIDX4clhV+1CICYk18HfileZeLVB6LBvIrdftojwkJxD7ptZG2
         U6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945642; x=1777550442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2aLu8tVOEk23kPdNH5kca74rbgoKNO8p6b0S6AIX50=;
        b=ipc+Thq8j849/UPFKvMopccPZArulWB2j1AwnLCcNrFdeqqgmPW+gbsErkcoSFEo8C
         QXp840AT4FW/64XL54746x9FZ+v0J8iC+Ulxy+2NeCaW5VnUX0xm+M+3cqnXYfJzqZld
         TehNBa7Mxopz9pF53hItdUadkt++FJ4e0i1wbIDDIJ4XzKOOowJWxVOxxBqOQ1tc4Ap9
         2vVuV6pM63B1LwtbO8RBnWbFTuG/PXuE1fEydOOVGEeA5QWmF052uN0IKLLyTg9r6O++
         zlfdoirPAitWAcdBZQoyxDNOTFTKaMog9kB+OZz75EBCGHZoFP/Wn7UNfmC01o3GkvDS
         IHBg==
X-Forwarded-Encrypted: i=1; AFNElJ8qcFw+xWhaUqdLRXZjyyhFUQ1vaxlZjNUE8VWQcjvmlSd8GKzCc7qMWZBVHzsixZLalWcsY0TF0/suP7f1@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2LkH/1qZtJCVe+35VuiNmRro1I13cMoxIsl+TZYKjYeIAud1
	B8UHqFHz81OO8UE8rzbPoBklxnxbkylZCTjXLbKBPSUuZVI/lL5PpfgnBx57eTbeWqQvAxlgCM+
	3KM92Tc3fa8uUBGv4tW+TSLcnBpXst3EW25guQmZVZa2ckEPWQTBA2GZPcLy17yuzKpS5
X-Gm-Gg: AeBDietEHHBOPfIM1RhkFm5OYSgVsabpgV7k9umGwiQSJq3HggZMy00LICoqN7iwdAx
	Zwmkm2TyUcxqfRHUXiu+cQHIcvb5tmp7LLAsLLoAqpNAcRG8pn0XkHNPr/K79lyyRIZLeLXI1gS
	BJkF1FGmk7+UerJ13x1tTotUxZ1gHbh9EBO3H3kVjJgfsxU09AH6jO+7K/NZ7BAp0dVEVaMvVkL
	0RI2viSxzpct4QgnTUgXrHIceJB2h4E6h0lIOyYpfuY2bAXu0rye34n7+6n+zqVQnl/0f6plIsB
	2eX2iaTFskJC5Img5/n6xP8aJlwXimb1eFmP/AiwCMXRWWh8YCL3aIRlV4TdzydkgNDHyuZH+9T
	qijfTZqa0V6rCfG1/0fdJMT1mz3ItGNdrlfDyZiMLkZKBrqAwE1HVp90tVYFgOrHKo3JdBA==
X-Received: by 2002:a17:903:1b6f:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b5f9f3c58amr256862165ad.20.1776945642442;
        Thu, 23 Apr 2026 05:00:42 -0700 (PDT)
X-Received: by 2002:a17:903:1b6f:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b5f9f3c58amr256861585ad.20.1776945641792;
        Thu, 23 Apr 2026 05:00:41 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:41 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:06 +0530
Subject: [PATCH v2 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-iris-code-improvement-v2-2-9e9cbf00f9c9@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1339;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=i29lXDR220N9S/ZCltewSH2m1udYLebrd2wvWU1dcKI=;
 b=xeE+GZHhbHPYXGZ//YHmYFmemxBp85msmf6bNdSFq+mGc775eeXFdc8EWaFwwrGuU+8PW8+AD
 M/Mxj15Vd/iBIYFYMzdZWoX1K90Lp3POzb6/M6QHD2vAM7VGuVVHeuK
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX/CpPzLnFBukt
 L9YlWtqI1mw7WUBhy83Gaezre6FF/UIIjC9wK5cW/JUXd22YAcm5uqxBFrdDMt27T5QMuafFVYM
 3gtsET3cByqUIBmxJbRoUucnENF+2fgwzGZWlt584arOVA0U357D9iRV0E+S9mwUGgsf+VFek91
 RMaNlbYKdXhfpEf0CK2jYsyisrAQZGRFKsv5aAkNAHENb2TOf5JzKf4pA7CokU3KyYFrbfY8mod
 sD7ij0Wyjeqgs5DjM4+8GokUv6kNby77Q3b2WM8tf4exyGnebqcfO4ZLkDoEhJMgl1olQegMJQ8
 C+G65jDqMF3jVQs3XL1P0YkWKURp0owa2FnDeqUnG1+Gp69OqOXq6Bitloi+T0mHndd0ncecCw6
 NteHMuZbahZpJLzzPbFUuqenS9cipAlpIgry2rtg8LhUMTbmSp2d+QEoz5bY6M3yaFzS1JyMjFn
 UgzXZv7YECltP2+1e4w==
X-Proofpoint-ORIG-GUID: wNUMpQ2h4XWM9rKLgU7h44i99lip6JLF
X-Proofpoint-GUID: wNUMpQ2h4XWM9rKLgU7h44i99lip6JLF
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea09ec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xFg6UwmA3-Dp8VzUGb0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104316-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C38D8451A75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The state‑change debug log in iris_inst_change_state() always prints the
same value for the old and new state, rendering it useless for
debugging. This happens because the state is updated before the log is
emitted.

Log the transition before updating the state so the previous value is
preserved, consistent with the existing sub‑state handling.

Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750dc7edc4834f32a51f2c5adc3762e..e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
 		return -EINVAL;
 
 change_state:
-	inst->state = request_state;
 	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
 		inst->state, request_state);
+	inst->state = request_state;
 
 	return 0;
 }

-- 
2.34.1


