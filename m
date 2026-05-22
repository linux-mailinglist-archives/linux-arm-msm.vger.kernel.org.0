Return-Path: <linux-arm-msm+bounces-109177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IX8ESP6D2qESAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C05AF96B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1235130074D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2561C373BE0;
	Fri, 22 May 2026 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOwyvpG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyQtb9qN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0190361DD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431965; cv=none; b=VzYUA6YMbftjGZUw3dPn7blhxZgrAebrKYZrvyZe3MD3YO+qUXuwhrdUXP3MghJSSxxWc5RlOX7aX08crraABgULWHvkxDedWFDdSpKFCOI6DzGbFoIs0HkePV/AtNmJUiN5qZyYTYy83nValkXrQqdwl2wqZyADrsALd0EYjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431965; c=relaxed/simple;
	bh=enw+fPqVPWUrB9X0CbAk+u1kPpuvWToKj69Js2hLlrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=liIMO+3AzUTC52TBDB+YLGVhd8agRa5QNW2FYrLVTcmjp6yFV5yajOj07mA/z9FiON4Wcs8cepskoYf0an45I1UTZzxKXjBAf1Zc8hvODFeDpoYWAuLj4hwkGpB17RmzSiv1TOHj17ashNHcQEwbCdiUsp9kBNPWDOdg6FVydU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOwyvpG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyQtb9qN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M3jeHb2765573
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SEJmmWqsuZHumhCT1gIgXW
	0uUCe6FOcXl7LGeuufUV4=; b=bOwyvpG+aZYh7lQKcfwciL7gGbdh7+9f9gBasD
	1+vqcR8kp9A2MJv3xZ3i+Px5xoqS1/D6r4Ogium9RfinL2L4+DScxgsdiPGMPBYu
	f76u1cSHjZdlND1QRbzYC1i7cvBZAe7pqzkHfSrEEE2xX3xOTl70eBXbchU4Gu6n
	oB9tdSlnPFx21iVqG/4s2+//cuswveaoHoBwENk1LZ8EvgOcHSY53itEzKpgEaLD
	RaGOBdWe1UQHcGLcHpu8rfKfUTvMwAuzg42C4VueYV4xAj695ClzKE9rA1GLZ6B0
	ZdynU156kjIRV1s3XC8YRIURfe7hykbkGHoIxQHFCHRCy9rw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7uefg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso14146683a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779431962; x=1780036762; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEJmmWqsuZHumhCT1gIgXW0uUCe6FOcXl7LGeuufUV4=;
        b=TyQtb9qNrgNDzwnawIm0X05y6mc725Kzk5emEivVkN39UYffzzEc6EAoMszsBgtyFa
         pknnhvGlF+xgZwRJdAIeYdH3XzfgCsAR0i8IBOMM6f8P/4miSVyH5jvah2Vq7uXcNd5B
         FQBgbm8erxfaFgFXabNN9ouGDaVJ4vnb2Qk2JuLeo9giv3KWhtLfv86OTLELJ//Ze/j5
         MGSOoq+/Rsys0n/FGwGy2pxg8Jn461ukjLzVERptI+S8j5he4TLiTa5mp5bzXYCo+nPC
         EVZqWGvtMIipXI6jskFGn6gCblZJF3lI0rC74tDrPYDmZ7wDbTVHFoiswyjOd1fzESeL
         zBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779431962; x=1780036762;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEJmmWqsuZHumhCT1gIgXW0uUCe6FOcXl7LGeuufUV4=;
        b=Bd8/7kVlrk3Sm9J2/w5prNW7X6lkHADF4I3g1+bsPqAMYy8lMw6l9T1PUSAffa19nj
         Tc2cvgPibepNxrqinG5m3o4MgDKnvpFE6zcojZvoaa9bNS82T1mhJLV0BN8eHKuePOCC
         4kuRzUnTvcJhbO26pcBTkQmymJMQ62khj46rPlVu8sTukpNrT1FaJUvFjfts6qHQJCcg
         cmtjDKvwh2n0xDp7uJcbpBRS9PhslG6Y1FmZE5JgI5ud6laQTCdfRxcmvESSWox1tTr/
         SGrewGXPeH4nmhrRe3NEIl/iKtSwyCTwbM+apw1VkP/KREAqownnrU2nLRgCeu1Ro9IT
         2PiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XNhZBWCzZ69OLeoM9Wmehrm4WU6dBkEyqY4SSuQmZApVev9HeymBsIrF0Bo+myohY3P3qk8EvRaNoKBGo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9rD9ILpk1BudHbn/CrVuFiVrOt2AbHUxJCh5OsJ+iTKXwDR5
	+dqgkLkfUKEuSiYmEqvHrdTZQQk2swy4yYCFAUJJgoBjpvlbaw++3EKktjX5R3UPH7GQRQanV9/
	9FiudNBsgkAIQz25PRHRJAr7F3NzKAAwm//9CvmehVhQOIqj/kbP6nWND7YxgPCb/fScC
X-Gm-Gg: Acq92OF4FK5IE/UpDNzUfwOv1I6SZ40X+kTqqhaNOK7c29T32ed7cvO6Dled35qce13
	6q4/WenMI7nA270GCpoRJIpD3Yr09twDRCrDJ1NqKEpzURuuBUVRZg5RHM0vezRQv6GIdy0DSsa
	J7Lgs9QAOqp117oDSLLZn+ZsnmU29tgu9pWDHxcp35Nukuex0agwGNMspEHqX+KCExe04V9wyMc
	7btBoSGdvgdP+b/VbHU6BgEuWNBCEuKiKnVroE05gFjZJd7ux1MUQdTzqCeHN9r1MyWZkr5Ge5P
	d88/Tf9cC/ycbtFo5jFM4ADZyHrOL9fUEaBjfWfeANhmangY2DtPeW0xud6+MUz3Nz2lZss5iQn
	1WLb9zRHYYZM19OZILBn3MMxyNYEKUP1XK4LaDP1jMQCMslYWSyI6IIubOYLU6R1kEo+E3RH6hM
	QN+RcwRhd5GxfisVzs3G31XiKSLltPUIFrubHoxLzdfvhcqqUrRx8=
X-Received: by 2002:a17:90b:3ecc:b0:369:d7c6:450a with SMTP id 98e67ed59e1d1-36a671e974emr2623037a91.0.1779431961594;
        Thu, 21 May 2026 23:39:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecc:b0:369:d7c6:450a with SMTP id 98e67ed59e1d1-36a671e974emr2623014a91.0.1779431961074;
        Thu, 21 May 2026 23:39:21 -0700 (PDT)
Received: from hu-yrangana-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cf56sm888822a91.12.2026.05.21.23.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:39:20 -0700 (PDT)
From: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] firmware: qcom: scm: add tracepoints for the SMC
 call interface
Date: Fri, 22 May 2026 12:08:58 +0530
Message-Id: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAP6D2oC/32NQQ6CMBBFr0K6tqSU0ogr72FYtEORGqHYKURDu
 LstbtXNJC/5781K0HhrkJyylXizWLRujMAPGYFejVdDbRuZcMYlq5ikCAMNXoGZnB0DUtBSVLz
 kCrQh0Zq86exzL16aD+OsbwZCyqRFbzE4/9pfLkXa/a4vBWW0VEXdagkV68TZIeaPWd3BDUMeT
 yr+14WG+lhyKVjxRW+2bXsDky6sKgYBAAA=
X-Change-ID: 20260506-scm-tracepoints-cb645232acbe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779431958; l=2523;
 i=yuvaraj.ranganathan@oss.qualcomm.com; s=20260506;
 h=from:subject:message-id; bh=enw+fPqVPWUrB9X0CbAk+u1kPpuvWToKj69Js2hLlrA=;
 b=Q6WUyp/w63E+9hQHPuq+kY3GrImpJw7C/i1jyoHmP6nUFPSP/Gxv3HOtEgIW2sG9wKV8J3XY7
 /ITI5p3dkhsA8W1lTnzWQMZ4OFrEhq6gNvQ9XT/kd6Kr+uBNS8dLTC5
X-Developer-Key: i=yuvaraj.ranganathan@oss.qualcomm.com; a=ed25519;
 pk=ln7RObom4c2W8MEnQqwZbOi6X198/6toN51al5+6rKI=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a0ffa1a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=NewMqQjGTZYH1I1-BI4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: i-OgOTPeHO3yIGL3hzABvxGYmvOB2s9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA2NCBTYWx0ZWRfX64aB2Qod2CoE
 YyMR9sl4eXyktSKi6qhiuARpuXuDDWme+66ozxDmm0SEmaR9aqNsiH+Uy+6UoCuxxrSgfKGNRac
 GBEVHlb+/3PTeBCFwl74nVZyesDm3LZ++Xf07uTVdgPNsGWUwVuFWcGUwjvXvZRBB0S1OH65pt7
 3s3kfcenkr469Xhk+o8nDQ9hsX1M2IoGWFDcjlinEwH5d2X9engjvVytSnH+Nf9B1Xfer6Vn2px
 gCVnvPRpqaIuwCI9imEN1q4mufgz5MQa0GGJBHEcQ7n8VV8UnZ3W5K3aHLmqaOjgdo7gfIumStd
 vdE0f4hpjY6QDos4YztcSwd3YQmrLWhF3TUThseCF+pwR4l2AqynJl0bpMtmvNqrV/pjtZpGI9c
 hBDQhWlfbC9+Y8cn9l7aEsbO61lkUwclR2c48QfvJKpH45eyVeChNZcF8IRuwLUG1RgityEufx1
 dAbP3ORYJ+batcKh0Eg==
X-Proofpoint-ORIG-GUID: i-OgOTPeHO3yIGL3hzABvxGYmvOB2s9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109177-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yuvaraj.ranganathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 493C05AF96B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v2:
- Remove tabs before assignments as suggested in review.
- Link to v1: https://patch.msgid.link/20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com

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


