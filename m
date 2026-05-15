Return-Path: <linux-arm-msm+bounces-107853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLtcJLQJB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:55:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC254EE18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC5030B55E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2962747ECF4;
	Fri, 15 May 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpPasz/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4tFtyTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C6480DD0
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844287; cv=none; b=IwE/Zq2XP3DNQkyXCrPDyXGtrwmJpsBAFbxlOjmUv+y2HXM3rwem8QxG77hQ4F8JJiH0rehanz4UDMOjbe7mfhtKXJpb9JZ/2pZSeT9VIC/+QoqLpPU0obSCrDBLhNibcZbdNRJs9BU+BURVH2XhOGvQxt+sr+YegAYhPEQPbjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844287; c=relaxed/simple;
	bh=GuDkSGHXh51394zehdssZwBFyWSqgABeQjzsuWrMbYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kY+J8cVpH22pnkY1jGbkDdds5TYeTmuImGesMrmxXLLpuRuhfQAUu2ncV9tKJbusgWJ96HCh4PCIGd1gCS5zt9nBifkykySbWUymyMyR95om7Eebz0JRwtbcXDaf+IU4IohTFUowwpED8+WbzvshAVn0YJ6rvjFSgy0NQ3Ga7UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpPasz/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4tFtyTo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB1qgT3670906
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96cmMTj3N00MudUqygedt3aK0QSx3cDzw0CEI6BkIuk=; b=FpPasz/xd4FAQ62f
	hGy71BFJDvdKCmdaAqlDofnGrM1hLy+wpQ4bA40Qq6Hy/Dqtt3t4bPs4TroGj6D3
	EbYFQ/sdLmX5z7iV7crGqL073OxDdkwllkjBv17hG1klaj3KgnsW9kFEp0/4yepC
	bQNLFZENdS1N7FpQBDKxW99Y5S01HqxdNEsKm3QpOzxyZYDRsFOV3judn620oEvp
	XDCs5LOS+tYBg1LuqjkMJi3E4fND6JBN/dGwyCuyWiWTiywIB2UujFx9CILvl57Y
	GeR9pZbxzk2MpLrLxCbXRM3e1Y8PXrkmBzJSz+YBeRHLmEGpeoz2yqDUCTci9KNw
	pZJDDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s336y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:24:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso18312986a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844284; x=1779449084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96cmMTj3N00MudUqygedt3aK0QSx3cDzw0CEI6BkIuk=;
        b=h4tFtyTo3FGsmSNLk3HKRzZTic/xIGrVWB34kS9c1AieqaSru0p3BX8BYCYGZ05/nZ
         X0Ls514riBiJ2H1V0VhjDcoM7Gx+90bxMA52TBKGALQIqwc5dVzPzPdJD1t0KUNqenDG
         pjYQJUkPtlJEwhun1SMSChEH6YqLfzg6+SlAKCbR6AOxXGF06yj7t6n/nnRnXWqjO4Tv
         ieuYMfw1Cr98wn9FYwpvaPK1kCvn79zY1wb0v2aIz+NJyi8LpZa8yWDVAqLXtgLSyrwa
         KfgTfTZASJbZivX/SP5fkgHenFHhidMfcrizLLKh5bPCeUFYnXo3GdcG4m5hBSswdEXx
         piqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844284; x=1779449084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96cmMTj3N00MudUqygedt3aK0QSx3cDzw0CEI6BkIuk=;
        b=M3KBe5MZ6OLuKDKyixZrA5LHLCuGEh41rGtX1G9MriUv2gR+A9zcvYOh7TEix3mY02
         bPpGIBseqkdU/BjHwzuJ9CyZs8rjexpo4vWnGJ3zeseaRVjUa3ga6Ii0WWeNyGLDTO5g
         ACch4reEudc3RHP112zPG7g09LR7NyNUyjhe/er3gTP6mESnZYVY+YBY+DN2bh/yp/QD
         Mb9WWMipu/kdCIrTDJwNP4nF30bR6Vvc0A5rpycWl7iK1990RRJBfMC4M5KQPw2GUgXJ
         eGeZcE/BM18wShx0q2G1l5aoS9bqegCo+i7IM4bsSUQENO2HriYIA3RwKiyEIbdtvjLr
         C/Mg==
X-Forwarded-Encrypted: i=1; AFNElJ/72JnkwHK0/8Jfm0K5s/EJFQcfSxkcxN68gRXloVjVI+czv/Np8jETN7QeRZbfacsOowpN90q9oqxKe5eH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQj8dKIz06avz2QeXfqArfAqfVlAdfcSou3Qa5FOhAP8hwjhis
	0nm7ZuLGCNPB3Uj07RyWnC9rU5MhUoNDDaUvEpg/rz0RsqUjUi23KYKXu7vOQRo9SqORRjgWdZn
	vo6UfGjbMKIQjm6/sHHrapn8rLFGcZfIg046c/sIeVn2h7tJ344Ffoc8CUz9EcJBprW8U
X-Gm-Gg: Acq92OHG9ZF67zBsbjN6MvUQgrxQQ9VdfU5ihcJ9fJLoZBwHeLBJwat2bR0h/vQ+zBY
	fYr3QcvAYRzKCIJDd9PzMceBCZAHjjPL5a+r9EARjUVZm6e8uP1cQhgen4LZm1so9vtGdWina2B
	vU+oqTk0iwS6IrzSDBloviKDkEc8YrjcNajr0p7NKqKvgFCyGZhDIM0h+J8d8v9K2wdGmVxmyMx
	ZGMPEkmzDm0U5v3pei/ju/1fntrn4NvVJwb0cP6vWDfg2BZgm/FSm+1sLg2zPtA9NpFgOQ6mhI2
	3JzKdyVb++EHSMFET9gYWDUlrv8pl2yez8TzKHWxojxwta33bt2slEsnpRTKqKvGX/z3Xm4gWOV
	8Va65MMB8WulT3vfHj2MhnQv2v+npN/I3sDpHDvsLoP6sYRBWWDJgRLo=
X-Received: by 2002:a17:90b:3505:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-36951dc1726mr3488476a91.27.1778844283979;
        Fri, 15 May 2026 04:24:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3505:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-36951dc1726mr3488435a91.27.1778844283338;
        Fri, 15 May 2026 04:24:43 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:42 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:27 +0530
Subject: [PATCH v6 12/14] media: iris: Add platform data for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-12-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=9058;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=GuDkSGHXh51394zehdssZwBFyWSqgABeQjzsuWrMbYA=;
 b=RETb7f6l0Da9In8p5tzfZrL+21AaTpbM+1XUZnJHO7MmoSQgXFee7tt7nKwMe1+FfP8VlC8Jy
 5mVE1HsVU+QCai8/vXVpZBidjKVYWyYfwGoRJscN9s0y3bXX6o7yXvd
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX3AveSVJGuube
 8BY53a8QxNcOeDMr2S3jf86w4GLa+D4eMrnWMBQ7d5BZEGP4sAubwEgHCZkB+/Ibwp99CuTmama
 dqzNhdMP5FATzi02yxUpLTYb4lya4kXRI+5RK2Tl3b9Rv29UDg4fwbzWjMhYSVQL7Rf3exAcSfJ
 nyVCenIGs1Yu65f5PG/y68GAkVuX6r2SUrnfCRsxSnf1oIwPpSRQUcXd6DJAlSxbJUG5iCBH55E
 bOAtKbbpmw8SzJzoZAoXCc23WwpQb14jaZpsrU9JMowjn7E66qoM9kqQ41MwuyJtLk8+R2LlMEW
 5yQNPN8ROskKRzJ0tc/QYpacFal4VjpxTYOpGPDz4NEOHizZcXGU9lWyzh7R7o4RIr+9SVNMunW
 Dtyf3y/qaoijI17jZ+ONAEHn8vL8umd5Yd2KU56mjh1EuDU12HR3SnWDka//kUXTHJogwQO3EUz
 jajfNlSjgbv7vNqDydA==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a07027c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fUP_7ltcoKe1ygVge38A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5FGe6z5V-mqSsRwA2p85MPOaxzIutlLu
X-Proofpoint-ORIG-GUID: 5FGe6z5V-mqSsRwA2p85MPOaxzIutlLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150115
X-Rspamd-Queue-Id: EDFC254EE18
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107853-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../platform/qcom/iris/iris_platform_glymur.c      | 98 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 38 +++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 6 files changed, 163 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 6deadd531c8e..6c45d4ad13a8 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index b8bd200962f7..9abf970c71ae 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -29,6 +29,10 @@ struct iris_inst;
 #define DEFAULT_QP				20
 #define BITRATE_DEFAULT			20000000
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -43,6 +47,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..4c5b9fcf5019
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/media/qcom,glymur-iris.h>
+#include <linux/iris_vpu_bus.h>
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_glymur.h"
+
+const struct platform_clk_data iris_glymur_clk_table[] = {
+	{IRIS_AXI_VCODEC_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,			"core"			},
+	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
+	{IRIS_AXI_CTRL_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
+	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
+	{IRIS_AXI_VCODEC1_CLK,		"iface2"		},
+	{IRIS_VCODEC1_CLK,		"vcodec1_core"		},
+	{IRIS_VCODEC1_FREERUN_CLK,	"vcodec1_core_freerun"	},
+};
+
+const char * const iris_glymur_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+	"bus2",
+	"vcodec1_core",
+};
+
+const char * const iris_glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const struct platform_pd_data iris_glymur_pmdomain_table = {
+	.pd_types = (enum platform_pm_domain_type []) {
+		IRIS_CTRL_POWER_DOMAIN,
+		IRIS_VCODEC_POWER_DOMAIN,
+		IRIS_VCODEC1_POWER_DOMAIN,
+	},
+	.pd_names = (const char *[]) {
+		"venus",
+		"vcodec0",
+		"vcodec1",
+	},
+	.pd_count = 3,
+};
+
+const struct tz_cp_config iris_glymur_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
+
+int iris_glymur_init_cb_devs(struct iris_core *core)
+{
+	u64 dma_mask = core->iris_platform_data->dma_mask;
+	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
+	struct device *dev;
+
+	dev = iris_vpu_bus_create_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	if (device_iommu_mapped(dev))
+		core->fw_dev = dev;
+	else
+		device_unregister(dev);
+
+	return 0;
+}
+
+void iris_glymur_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->fw_dev)
+		device_unregister(core->fw_dev);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..e0d07ccf658c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct platform_clk_data iris_glymur_clk_table[9];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct platform_pd_data iris_glymur_pmdomain_table;
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+int iris_glymur_init_cb_devs(struct iris_core *core);
+void iris_glymur_deinit_cb_devs(struct iris_core *core);
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 8a0f67d1a74a..b15555bf25ca 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -41,6 +42,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static struct iris_fmt iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -100,6 +107,37 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc = &iris_vpu36_p4_s7_gen2_desc,
+	.init_cb_devs = iris_glymur_init_cb_devs,
+	.deinit_cb_devs = iris_glymur_deinit_cb_devs,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = &iris_glymur_pmdomain_table,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = iris_glymur_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(iris_glymur_clk_table),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.num_cores = 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 3f2fc4e197c2..69f4c534288f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -382,6 +382,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


