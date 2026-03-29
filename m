Return-Path: <linux-arm-msm+bounces-100565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ACGCblzyGkNmQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:35:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAE35053B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8573044A78
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 00:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2311A0BF1;
	Sun, 29 Mar 2026 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4LtILkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AokgzxWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAAB175A98
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744409; cv=none; b=TTbOaxpbCnF0WtrUxlmp1DNCllWh5CWb9Ng66eXXF9m+Tdzka04nz2SkndyyyfHnjGoY1kfNc57WnLfTZGk/u+RPe07q0X/Xr5HHnzXihRpngp5yO4QMplhGsMvljIFm5M2mb2Z1KRkFr8cvWonRqMOSCxfL690iG4u9X7KyOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744409; c=relaxed/simple;
	bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oM7exPw7BA7NT4Dqw/gRL1r43OJcUhN9ZvsuC46eH2Yy9/y0+472xotQEekMD45pD+yul+pZp1sd/CtjypSo9iWsfyzCOn7lrRuSDWmY1yi/de45bbYim3tBf+mROv5hT6rvRafbUY2nL3+1FRE6NMaXe/vUI5j2wK4keey3xdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4LtILkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AokgzxWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T0UWe4528201
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=; b=p4LtILkOcOG5alEN
	Z8sZRYkpRLYXWsQaTLEz5tRjzpiLTi26uMmusy/kxjV1xDPFj8ODsjW1YRkFc83V
	WuKZnR89btzrqVWycPYcBfohbIi87+jpQ9hSnzhe9RUe/S7xX4+bw0m/VWEq8Zjl
	AfeVcPem1JaY3KaEkCuHJKi+FgTkb3O9E4GXczR3IgDt+7V12M+93a0HbnBykerI
	XpuCcv0j4XCuc9sRTSDAFRX8nrXk9J0mIS6M/VtYCatk6mO/qzalYZOd0Ba10GwN
	jaYCHLtkBZUoN9TJcTx3swNb5b2blEPKGQcSmue2rS94CHU3aH/jLmccau0qNH+s
	weSjtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6mfsrehg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd767c51efso352441585a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744406; x=1775349206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=AokgzxWqEuPbB0RXbtScfb4Pmf0h/VtR5HDKTuO/ebqmpzN6SQ4WVDmWGTnX9UaUl9
         IGm7yhK/7MmX/qanuYfm9nE10u5Pfu0RqQkJzthpK4IqJV9iUYczl201A1Cf8PoHouyA
         R9RXad2u2cxguCRA52LtxIqQ5J2C+SO6dtIcEbuDvWtKUpD3+qRC0hrY81UiTk5ClMLQ
         0JNdUR7Qtn2Y1iXm3FH+U7KRheJFeohrb+EP1KcFODof43BIo1X+8p+LWfIQOKznhWIU
         sb4w6pL9nUAGRHeejIoqzcaHKKITgHFit5n/bYUQYcRwoT/7vkI5Po7QLCVbVsYE+LB0
         PvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744406; x=1775349206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=EDeFy5gI4S4vN3++/sK7BQnZTLL/VkvtEIKtxF+3x/8aRJ/sUIH34gKgNUi6mpN9tK
         BXbDzahyXWxKZwAKj10WfWLgXSSzjxryzdyYwraLsaUgbPGqEzF0tPQFRe5bAiZPN28B
         oeAtLXbk0NyarpVEVikEFwaXBx0uga0Xb9mhgKdLt+Qy+0ba3wS9qoVrxC2swmUqfgq9
         6TmS/EwlClHOozAkr423fmxdemoGwtibYd6vhZIc2d0s9R5ScT+n/VHBvdjZS3t1o69f
         X0qG80KHsJw6ikFKNjLrELIy5sE50TjfiMnj9Wp3AoPEuLkryyQu7y/hJUeo5dm/HMtH
         y+VA==
X-Forwarded-Encrypted: i=1; AJvYcCWuQ4wVEAJw+HgqpZwRY9Tq2ZaQ5ryJ+m5MKMMHuRC7QSi6ip4lmLjEjYOvh9hj777Op/yw6g/N+g1y5ob4@vger.kernel.org
X-Gm-Message-State: AOJu0YxkrbxC3apzT6RHE4RGRscErJeEGi1/8whv6R0FojVjyPAzQ5zg
	ferqxOrbND52n9//R2jIAdFzyZjzIs9DhoXfzkj+2LFntv9P3WeYHBVhJ3Fje7n6lBbbZ4x4UeY
	dCVpNo/sB3B0ipvHmT4WHD85bdl/CJ6REAI6z3Tws091D+6de3bwPi+egbUSdHcpUa9eA
X-Gm-Gg: ATEYQzw1ib1PyZggMi8vJWvvCXDMgvEeOz7bMR1Tx+QPokWofdl2yHeWuCJB447V6NO
	crJWOIrCMEVuqaRUcGCtv6x53nGTjth6ZBjvho8CJprHR6woDAZ487fgnVCjpSfgnxG50TKizmA
	3NZdVa/OKVT9zQ91iW02xvznNC/oc19WGOnnHlXLli2sEGGGb4ZmhHfz4hvHyY7zXtW1ee+oycR
	eOBH0KXBtW5mK9j9jpM9cx7jdN9QyHF1G3Mmi1/5Z+kcPdCusOergR5b/+4BpYLhisLOyJgbVG0
	ezXb+bi8WTwQlMahuJGo1qB/p0CX3Q1O1a0BknEOXw0ST4ZuA3vS5ugWfoD1bgugojd+pzIoFSi
	JGVFcZniFJ82+NOv2kpe4mUMztIvzzRsmg4ZcKA2KLEbNB7fvxmoX10HPobSL/Z7kTBpNi06Mbo
	Bl3Gxknojb4LWwG6FI4VzalqQgMqeJCforZ0g=
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr115096281cf.19.1774744406160;
        Sat, 28 Mar 2026 17:33:26 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr115095961cf.19.1774744405613;
        Sat, 28 Mar 2026 17:33:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:03 +0200
Subject: [PATCH v11 02/11] media: qcom: iris: use common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-2-eea672b03a95@oss.qualcomm.com>
References: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
In-Reply-To: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6562;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNHKb4i7aMgav2rqUCMle2rb3eWzrcfiWoLm
 VEC12ClpAmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzRwAKCRCLPIo+Aiko
 1WHPB/90WB4nVrtBSggkNkGFRyjttpcc9DS7gCXQnU/JSo3WCT0UFxuGlwElHNcUkwXRRwqD72K
 VYqhCf5VqOW0M7CGuj5PyXz3mtcJtsCSba2tC9F/+bRM+faVAxp1bA/Rp2jYnQx1ddVFr/jGNxr
 JoKCucJKV0FlFrUK2fLHZWfjsjO7C25Kq+K6H5nKq/Dpdx6JCHpCJA6CXA4yDhHFVP/l7sLRPrg
 ei78WsCcBrd5TXEjg4MlbejnxTnibfE31X7Vwy/T0B6BrA5G/3OWzqpj/C7nAGHvtFNOnwdU5zq
 nSTiHGuDWZYp+QkKsF2iFTnygtxE6eDvHMS90JWLNU3L5xo4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I5pohdgg c=1 sm=1 tr=0 ts=69c87357 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfXxsv9+mx/pFfB
 /JYJxQqIzOHmdpCYHMDnZGXwVQewAGCMm99OvrNvVVTDph5YBe3wCKAq1kmhmgz3bHtUIWlmOEf
 46VujuzsslM/jGtDrAA7x+ELneXQqmuI/6X5Uu/1mbL5MzWsrBrmUbSTxnfUnwtnwKBNsZLSCde
 xTEUPDL4ZQhNhSsBVt3BvSqCbA6XWoRSy8oaQ+QsGO0QpB7K6uBMT0lb2DCN/iijo5dXWI0/aYf
 sk2fYf9f7EeIPRTTb/SCFOmxNcZkYYUGtoSkA9MSLBgIn9SJumjCZ8eR+EfIYmrANeotGByFyhv
 0LPBemtjP18znjN55WfCi0K9GMn0l3rO35DOXfSR/IL7TN/OpTiRX1rS1Qbyr5KIR5cHYM9C+Nn
 nMx2j8RsfIBcKghH/llX5Huj927S0Z1UOiVYurYQQQvpTpP1TT3dwqkWcT55kWil+OE7vTJlO86
 iSCwj+GY4rZm500TcIA==
X-Proofpoint-ORIG-GUID: 0oM3alHfylbWCmKx73blFXY2N3Jov16v
X-Proofpoint-GUID: 0oM3alHfylbWCmKx73blFXY2N3Jov16v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100565-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AEAE35053B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The set_preset_registers is (currently) common to all supported devices.
Extract it to a iris_vpu_common.c and call it directly from
iris_vpu_power_on(). Later, if any of the devices requires special
handling, it can be sorted out separately.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 7 -------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 9 ---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c      | 7 ++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h      | 2 ++
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..d7106902698c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -207,7 +207,6 @@ struct iris_platform_data {
 	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
-	void (*set_preset_registers)(struct iris_core *core);
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 07ed572e895b..ed07d1b00e43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -260,11 +260,6 @@ static struct platform_inst_caps platform_inst_cap_sm8250 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8250_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8250_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -343,7 +338,6 @@ const struct iris_platform_data sm8250_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.clk_rst_tbl = sm8250_clk_reset_table,
@@ -397,7 +391,6 @@ const struct iris_platform_data sc7280_data = {
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
-	.set_preset_registers = iris_set_sm8250_preset_registers,
 	.icc_tbl = sm8250_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
 	.bw_tbl_dec = sc7280_bw_table_dec,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 1f23ddb972f0..c84d4399f84d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -756,11 +756,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.max_operating_rate = MAXIMUM_FPS,
 };
 
-static void iris_set_sm8550_preset_registers(struct iris_core *core)
-{
-	writel(0x0, core->reg_base + 0xB0088);
-}
-
 static const struct icc_info sm8550_icc_table[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -917,7 +912,6 @@ const struct iris_platform_data sm8550_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
@@ -1018,7 +1012,6 @@ const struct iris_platform_data sm8650_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8650_clk_reset_table,
@@ -1114,7 +1107,6 @@ const struct iris_platform_data sm8750_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8750_clk_reset_table,
@@ -1212,7 +1204,6 @@ const struct iris_platform_data qcs8300_data = {
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
-	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
 	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
 	.clk_rst_tbl = sm8550_clk_reset_table,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..faabf53126f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -468,7 +468,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	core->iris_platform_data->set_preset_registers(core);
+	iris_vpu_set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
@@ -485,3 +485,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	return ret;
 }
+
+void iris_vpu_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + 0xb0088);
+}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index f6dffc613b82..07728c4c72b6 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -39,4 +39,6 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
+void iris_vpu_set_preset_registers(struct iris_core *core);
+
 #endif

-- 
2.47.3


