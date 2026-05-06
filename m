Return-Path: <linux-arm-msm+bounces-106099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGE/BkMa+2mtWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:38:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A93714D963F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8A5330356DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 10:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6043F7AB9;
	Wed,  6 May 2026 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nb5SqoK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cqk5rpAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176063DFC8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063853; cv=none; b=OEjQE29cHoMe8EDoDk872ZI90qk5bIwNDogTpDrGatEoaQeHcTH/gelRWE2HL9o8mkZ7tZayiRj1gbPtYwMTWM4mMfWxPBMqLaKkVoxxEBven0JiNa7GT921Zqxtx9hVn/8ZV7/HCYfk9Zj3vh+PrXwgPtMydCKJQ3G356paDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063853; c=relaxed/simple;
	bh=lWGBVuNUaAx+VKetJalGaesUDWD/ZksN5YY2bPlCo0Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sA5ml205tPZ2X+CoI/PIil7Ir3jU1N2a16dn8iJpoC69Hz0nU6mFGjHj56JHgF9Nx5AXOrXKZ0aQKA+KfAWEU1sb1Jmz+pqQcm9sLdetKpNXVGl82W4G/XK8/KSc5Y7x110R7tvah0YxrtXAeunj0I34BFVMKVNpbTfaWy6Q5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nb5SqoK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqk5rpAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467d5sJ248456
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 10:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TrF+D3MjBqnMeKINdiMhZi
	x8VF0k2pNZ97b1DCLBUJU=; b=Nb5SqoK9pNcxa9ZGS0p9ynCTRWAe1IRYi26hNW
	eu7+HZirqpkM7vKGjR8GecN9ytTaHNaurLvh/aOP5Bt4qktOFDi2G3cSHn++dYIF
	2BLuZwgo1SQYLuK9afR0mAAXJ0JGpXoMrihM/5+IMQlsdBExa0PFLyVdmU4R7m/4
	TK7f1NOOfSA1vgh9UN66+vLUrD4ifQnXvWppsmLLIJwzg8GXter4az64tbESD7D0
	wKaJEZjavDZt1iSgvWwLrM3zvnPZqOAOzkhdL7rQvV1/MAXK8/JgJiQi+puix7sD
	rLpJUyZ0Ab9MXfFHj/n+CV0PUwub8uAzg9tyHq8QuktI5vDg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq442x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:37:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8375e2df478so1278000b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063849; x=1778668649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TrF+D3MjBqnMeKINdiMhZix8VF0k2pNZ97b1DCLBUJU=;
        b=Cqk5rpAXDQj0bX1zHvG++3oII29foXmNO9iAfUOc70vP2I995/AoZxQqHvDAElICwo
         5ToKwmRHcvAZ55sYZFsSBUkw7gZjgZqgaMTY5ro1GIf3I29/ElOwVXr45EMyw8CYUjqD
         PD2bnk7v6zKXYjvKvLyWVnHPwbELT69xmx92Dl283WX0e5eUf/KeJyJK4Uqo8bMWduuz
         6rftxMOj4j5rmd/li5jaIYiPCh7tFn3r+zUvN8iEw9MUfe0FJvIfcl7bvPoP71UjQKdB
         pqlENbMRhs0P6Yr1ddaMqZIVmlq/UbFn0qWmu5nLc3xtgrgZAPAyUE4eKgRngH4ThIWK
         gFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063849; x=1778668649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrF+D3MjBqnMeKINdiMhZix8VF0k2pNZ97b1DCLBUJU=;
        b=MviqPwel54avCW1d1zkURN5p/Mj7f5t/MUAR6v2PvY2qC8q4lfujLvif8EAfW+L9TS
         5L5in7XUMcU6ldAGie62jCb+eyDp/XPaeIsaQnsDkB7MgJ9/UqdyvU1v3UHYIczBSp1D
         bdUprsfkJzrlK42xCOUowfN+BWYS6aGAo6+LkAYeflIn1+ouAxHkHPFrufBtSodNR5S+
         QpQD+kDraETRSDMm8syYTTxm0f0aHWrdfA59Y6MDg3E08vGLJs3vXMtq5GPeUMJjhNX5
         Nank5TRpaLDkdTvwWXc1MySwjxRpErTbh0WlVvlxUg6QULWIW6YDGBqrAuOOwhidfyP0
         kRzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uc2xKwM0HuRR0I9DiS9wzKgIgGjFfaC186BY567BL88EU5YmX3YBHpvHDyTn/dRTrKQuBAEtU6ft9OMM6@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBE+LESqrlDUFz9wBD27e6DzrJ0dwClago45tKNaRnU7lEzJi
	cTFrhQUDkUkGiKfYhZWruPEDCH403ZXmf00KaWZQ9DH0y7fIz4Ypw3k4oncFIXo86yA7cpmuDf/
	2E3mP03B4pS2bAcRvNlYQjphrqKQtqJ+ldl05bTQv2cBpkr9P2hJYOrpsVhEnQZX8lLaMcYwQuW
	ql
X-Gm-Gg: AeBDievEvr6PV8auKwvO46LXWQ6fbNnBGHBeBuqgylv6K582r04vlIEoOKpdxR8koaA
	gY8RJ2zWwAmLwcp1Vvrnt/ikm//GgBBZvuuSGLwVyXO+9stu3MGW+ah37YyrTGj2u/AByMeS5Uq
	0WT4/T1sRZIu4bdNED7d57JdiRJBWOodrj/kDB940MakOKsDJtdKTrmjcWkdBPFjaTJLF0DKatr
	Pa1fKz2IdxiUMCKTuUMxCLTOQ0zJCAe3TIcjgFMahcKpsPxNVxdwa0QYkJAtdD3y9+yzL2iHrDt
	khIkPNwjkV+Klfjtt7bdOdmA/LRlG/pP169H6/zCApV9NfSfYOSuajgcXtYADQBM6fuSkRW3kw/
	3j5pLuETPdkOiRmsQXyMv9s7NgkrHijo7VUlw55q85u6JMkFZ9mwNrQ6NWflbxdP0gyANZRVn9s
	CCHvWw3VzW2codN2cEtHBovwz73IJ8ia/wOBz+OuoHdh6KVx5BuhVl31ikcuD3OA==
X-Received: by 2002:a05:6a00:1ace:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-83a5e35b57fmr2603018b3a.47.1778063848577;
        Wed, 06 May 2026 03:37:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ace:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-83a5e35b57fmr2602983b3a.47.1778063848034;
        Wed, 06 May 2026 03:37:28 -0700 (PDT)
Received: from hu-yrangana-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm6167123b3a.20.2026.05.06.03.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 03:37:27 -0700 (PDT)
From: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Subject: [PATCH 0/2] firmware: qcom: scm: add tracepoints for the SMC call
 interface
Date: Wed, 06 May 2026 16:07:12 +0530
Message-Id: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANgZ+2kC/3WNQQ6CMBREr0K6tqQt0ERX3sOwaD8fqRGK/aXRE
 O5uwbWbSV4y82ZlhMEhsUuxsoDJkfNTBnkqGAxmuiN3XWamhNKiEZoTjDwGAzh7N0XiYHXdqEo
 ZsMjyag7Yu/dhvLU/psU+EOKu2RuDo+jD57hMcu/9tyfJBa+MPHdWQyP6+uqJytdinuDHsczB2
 m3bvuCMgmPHAAAA
X-Change-ID: 20260506-scm-tracepoints-cb645232acbe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778063845; l=2342;
 i=yuvaraj.ranganathan@oss.qualcomm.com; s=20260506;
 h=from:subject:message-id; bh=lWGBVuNUaAx+VKetJalGaesUDWD/ZksN5YY2bPlCo0Q=;
 b=o4a34wgFKdXqDsTKb7IQ4BONmQpTHuNzxin6yuf36yh27Nv2eTV90xfxdnfAwyTXVSndqCMAi
 znhO8PDmgzZApKNdFA44zeTnEipzz9DFj7HtW4HsqjxEebKxzq96ryk
X-Developer-Key: i=yuvaraj.ranganathan@oss.qualcomm.com; a=ed25519;
 pk=ln7RObom4c2W8MEnQqwZbOi6X198/6toN51al5+6rKI=
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fb19e9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NewMqQjGTZYH1I1-BI4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMyBTYWx0ZWRfXyiAx4uhNZjwp
 k8RO/l+LloSAWz8fdy0YASyCUI4lvMgZv2G1vp9AeEA4+J7iAWXtyMndydveomY9CuJV0OXmQGR
 dus/zwfQY4bYSpI1Usa8CTlTZj1Payq2WpgzO0nvaKp1N4knS9ogBSC7QkEMcpEQAHlWyLokOIb
 0Wc+KAkgq7cw20ywoZOPZBX0FxVJPNx++ADJ8Ism7LuAiZPpGL85ZOzRWxrkqsMJosN3smM/v4a
 peXWp46Ap2oCRG7PgHqJXxWcpUP68X5lGKNDGJ65fKT4V3/9M8pL7CG4rOhyINxK/qz6kOZMl8W
 sGrvgRgS3Wi5NIxOIt2qDuLo9gG0u+BAV0rhOrcLHDN3Rsqj+KyzvPHo1hpIwdkijp1pSYal+08
 bx+J3xT0j1RSM61CJC5FdjEMrFAx+3CffP6lyDJCpNEnWjpNgIvvSmrDANC+5hB1ANpo+SxL65X
 C6ka3gkkDiQFOOdjGNg==
X-Proofpoint-GUID: 8yFDlKfgv8Uh7B0sFw6r3_8H9mo9RVGy
X-Proofpoint-ORIG-GUID: 8yFDlKfgv8Uh7B0sFw6r3_8H9mo9RVGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060103
X-Rspamd-Queue-Id: A93714D963F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-106099-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuvaraj.ranganathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Qualcomm SCM driver is the sole gateway between the kernel and
TrustZone firmware. When firmware issues manifest — unexpected error
codes, calls that never return, or WAITQ sleep/resume cycles that stall
— there is currently no low-overhead way to observe what the driver is
doing without inserting temporary printk statements and rebuilding the
kernel.

This series adds tracepoint coverage for the full SMC call lifecycle.
Once enabled, ftrace or perf can reconstruct the complete sequence of
firmware interactions, correlate service and command identifiers with
firmware return codes, measure per-call latency, and pinpoint the exact
call site responsible for a waitqueue stall — all without modifying
driver source or rebooting.

To capture a trace on a running system:

  echo 1 > /sys/kernel/debug/tracing/events/qcom_scm/enable
  cat /sys/kernel/debug/tracing/trace

Example output:

  kworker/0:1-42  [000] ....  120.614235: scm_smc_request: smc_id:0x42000601 svc_id:0x06 cmd_id:0x01 args_cnt:1 args:{0x2000c1c}
  kworker/0:1-42  [000] ....  120.614289: scm_smc_done: smc_id:0x42000601 ret:0 res_to_callee:0 res0:1 res1:0 res2:0
  kworker/2:1-87  [002] ....  120.821011: scm_smc_request: smc_id:0x42000603 svc_id:0x01 cmd_id:0x05 args_cnt:1 args:{0xa}
  kworker/2:1-87  [002] ....  120.821379: scm_waitq_sleep: wq_ctx:0, smc_call_ctx:1
  kworker/2:1-87  [002] ....  120.823104: scm_waitq_resume: smc_call_ctx:1
  kworker/2:1-87  [002] ....  120.823551: scm_smc_done: smc_id:0x42000603 ret:0 res_to_callee:0 res0:0 res1:0 res2:0

Tested on sa8797 with CONFIG_QCOM_SCM=y and CONFIG_FTRACE=y.
Compilation verified on arm32 and arm64.

Signed-off-by: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
---
Yuvaraj Ranganathan (2):
      firmware: qcom: scm: add trace events for the SMC call interface
      firmware: qcom: scm: instrument SMC call path with tracepoints

 drivers/firmware/qcom/Makefile         |   1 +
 drivers/firmware/qcom/qcom_scm-smc.c   |  10 +++
 drivers/firmware/qcom/qcom_scm_trace.h | 143 +++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
---
base-commit: 90c7629ccf1277799b025501e5491429ebf7b6cf
change-id: 20260506-scm-tracepoints-cb645232acbe

Best regards,
--  
Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>


