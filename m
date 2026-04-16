Return-Path: <linux-arm-msm+bounces-103439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI2aHZPu4Gl4ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:13:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6640F6DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD3330821EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92853DE43D;
	Thu, 16 Apr 2026 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSYpZNPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSTyB1M2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B33CD8D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348617; cv=none; b=dD8j+jukxShTnCTeBhtFt2V+K5FO7cRGyqNyKndOkF57Db/mZGV7+GvScy8gQpC1fQ/BQX7bxKoW6S4HegVpqzCfhEg04dHnAF3dDL0+6RJ24cUTZmemBQpT/hoxZBccG3r8Cej5G/DpQySblDa3kaPPBcd1kpVcGwjRjLz8s9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348617; c=relaxed/simple;
	bh=28E7Vcxz/zL/tJvNl4R7cGAC0IOtuHloTBJjNXp+ts8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NWg1VDbuBS3dUssxSrVTy9ZA4sUaMXnsOJPhUIjKgqsu2Fy0E6UCatSZNyFmByjrhcIDEEFSoHemgJUVdFKUx4Ab3YjUJpO3aAalWLiMMK0x3AgNtODfHBkS3c2MgH4erEkJQAnd4MMKJViBPdIjh/YDpZr7mU+zvBlU9K8seIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSYpZNPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSTyB1M2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xh5V4124954
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=; b=LSYpZNPnRr96YJZW
	wKqC8e5FjmGdIngL4CGU1WSka5g66sFuP02bJzXT1NL0swaaspCBUNdufQP5r73i
	oyIqIc2FX21mWzm8lNo5eDKG7bJI66b1BP9mR0dyYthkaJ23QVtZoU36otjx4Utd
	xjt3rLyX2iYLV7Hj8NIIG1p3di9p8MODiWiQB+et4HDpv/27qO17HtetoCW8duka
	vXL7Cmp8i9BUxRqNdgVQ7FMQFNrbw7VNKLwl4GthGvma+dP7O9aUIan8At/HoQSg
	MFhBNGjICFmfTPKA9x+agRR+nQaC5eIa1fC2/mANtqTj0m31+PdMm/k77fHKjyXs
	RaFcnA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf90ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:13 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-799001d7289so249243327b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348613; x=1776953413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=;
        b=BSTyB1M2vUJJXqK0MKIyKbm+B43vpZh6DqOTzKw66l5tn81yLFwPwlCfMxiez92vLc
         NRQJqpseZGjbAvzWYOnWYRC3NEBO17IMElxI/+Tvvq9Pt1jG0mYpgDJbosogUc0kKRNN
         cgXibYA6PnF6vQoJJNWUo7AqsNn2+J97/pUQ+TRRgdMFswKJzcZshz2sDlowxwPQO5d3
         g/Hw1T6dbHh40OaXRMyKiMi71kbJ/9i8AIu9a95Ae3b2pPTP2moiAr/8aQzkJbojXnis
         Y8QSJa8L7mHCzm5M/61dUZ6vfviIH2mtBplP0meGXS6Zbs82l3sRIfdMQE46tneaWyye
         G5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348613; x=1776953413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W899JKnFZJ6i4LZoCOiJODPDV7JFYUGw4LZ0YibnRaI=;
        b=mpQXtIehL65ShMUBX22COkbD9IwiULq0XxqevDhKQyJgZphj+KEsuXCnnxnS0mEKFA
         L/9esdM+QV/oHHkSff2q21p3LGYG2dA66X+pCouw7g02Nyf22rHqMcWOG1ZTmLPi+Be4
         Z3LMYKXFtNdQxg38qNaAUQ1OzXL2lgHOrQQ9FoTxzT+ThS96BdNGLq2nq1pPLRZpQm+B
         4ZcsWLttTSgp5DDT6pNICqUMm9dT7tNpkcn6SQCsw3vIjnWxAxyvyf7CdDTCo/caXgFq
         kOpFuWY4Q+hYeeiS1Su5CkgMoB4n2ZYRK5G7d1q94t1pdf/Xqb+CrTF7eLq9yOzfrcru
         4k8w==
X-Forwarded-Encrypted: i=1; AFNElJ9H+HXENvGgLKywJz1xR4pJr53cG3GiVAj2DZtygZW7nPVZ3E/wdOzLL7cLxwYZK1yEdrH4uIYMjKekTnhv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8DfQgjM7DUJR2BjhdXofWiL0BDHBLBTphsLgfHhsbd3kdSJD1
	Q4NzUeZUav7AYEv7MK2ZO9TY3o3bkQGlJHb+LyDA0Y2EK6r2L455S60A3g9IcjYm7W7kz0ziXtD
	W4q2oQZVV8Gm+eL+iBGQcPmNFUPe1UrYg8YMLoAMi+df9MhAaCuJzMquWXiP4gx1BMDQt
X-Gm-Gg: AeBDieuBg3QHiuryS7WuBux+1zGVOtjMfl5qvxXwuRBTB/LRBzwekBHrCdv+FEUpHHy
	5LPaMp54c+HEulhVbsjg8HHX0uXbzc8Cazfgp/sFcmhpKpPFIuRGl0Th8roToGJTjogPCLpZzgg
	3HyWr43xiW3Y5nSqd3janHU7CueId5M56QuP4SFWxRt4MG/Vjkn7rjofszPubva/tXbSburEGHB
	Hap04NsXIjj6tzN/zOBuUxiQR1ZzMoDt+rOeGUUAuPq25YLsfDmhQMNf7FxAydeu5GNMMLx7sWd
	HLJ1em4msrx8oSEqz5vdrhh4m92L9eWPhEOXdrqy0Z/laNaO+XsuSGncCyQGS6bDXzi3VlK7iVO
	FUSnSbp01HkW6k/JTuqWXB/tnv0C+hyVg3kFCCtwcJvHcGh2WlGU=
X-Received: by 2002:a05:690e:1504:b0:652:cacb:ba15 with SMTP id 956f58d0204a3-652cacbc0fbmr8016135d50.64.1776348612750;
        Thu, 16 Apr 2026 07:10:12 -0700 (PDT)
X-Received: by 2002:a05:690e:1504:b0:652:cacb:ba15 with SMTP id 956f58d0204a3-652cacbc0fbmr8016067d50.64.1776348612014;
        Thu, 16 Apr 2026 07:10:12 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:11 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:44 +0530
Subject: [PATCH v5 3/7] bus: mhi: Centralize Sahara firmware image table
 selection at probe time
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-3-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=8668;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=28E7Vcxz/zL/tJvNl4R7cGAC0IOtuHloTBJjNXp+ts8=;
 b=XWpmcV6fJDjnetWvTknnLHmt0XMO7To/AjsDMb5xTAMK2v+MLMHinXZ9VcPKAm/ohA24eT7g0
 9unbhhGtOixD4XZmUvYq6YQxFEfklQ2Q3NrNgfrLGJb3Ah8FT6CnqVP
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 47WmJJT52-vXq3rA3zZWp71DqGVBvNfB
X-Proofpoint-ORIG-GUID: 47WmJJT52-vXq3rA3zZWp71DqGVBvNfB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNSBTYWx0ZWRfX5QQ8FnhuT1i1
 bn92C4/xDkZDylo2E+ZHhOp0HzT7Vj8OUyEiCn2XaFHEM2v49t8pNON6KRvrzlApJhqaAfcGrhR
 wPvsTCcqXkU8mTVTbDAbjrZ/VfEnNVkS9Xe0AfsakfdDHcHthtS3JbJr6A/yBQFW1EaFMAOqMUW
 CF/oTG81dGFfAfyktS4Gx8qExJFY2FzJe+BJETxdJEgOvofOfg7/FVvTY0Cp0mQ25CB+/dfUBii
 Zgd9PmL6JzEYdY6ESKxDC8R6yGLYnEKUcPAJczVilRiMB3JjrB12nXMPuWEPD38ZeXVkuTlJJ8Y
 ZBOjUjogVub7QA+3AxyX6rUm6VJIVeFqgbgHL0Z6q7FzhBQBEXdjp3n5+Ip6uN8C+v2nFuWTNLa
 yuJwzoa4OUKmgCZLz9AYq3/yYYL7UmwY3rBLI7hl6+Pbeurz65GgTn9F1nIOHu08asYRjHDmqEN
 Z9YlYGBYafHupfmMxgw==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0edc5 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FaWmrOfgj8M-bvBoqZ0A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160135
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103439-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13A6640F6DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sahara driver currently selects firmware image tables using scattered,
device specific conditionals in the probe path. This makes the logic harder
to follow, harder to extend for new devices, and spreads device knowledge
across multiple code paths.

Refactor firmware image table selection into a single, explicit probe time
mechanism by introducing a controller provided firmware mapping table that
captures device matching, Sahara image tables, firmware folder names, and
streaming behaviour in one place.

This centralizes device specific decisions in the controller driver,
simplifies the Sahara probe logic, and removes ad-hoc conditionals while
preserving existing behavior for all supported AIC devices. This is in
preparation for adding QDU100 support.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c          | 61 ++++++++++++++++++++++++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c | 60 +++++----------------------
 include/linux/mhi.h                          | 17 ++++++++
 3 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 4d787f77ce419fcd2b250f9cabaec9c26f2da8dc..1f9ef871421b976c35cfad59aed715da96c1813b 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,6 +20,62 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
+static const char * const aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+static const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
+};
+
+static const struct mhi_sahara_fw_table aic100_sahara_fw = {
+	.image_table = aic100_image_table,
+	.table_size = ARRAY_SIZE(aic100_image_table),
+	.fw_folder = "aic100",
+	.non_streaming = true,
+};
+
+static const struct mhi_sahara_fw_table aic200_sahara_fw = {
+	.image_table = aic200_image_table,
+	.table_size = ARRAY_SIZE(aic200_image_table),
+	.fw_folder = "aic200",
+	.non_streaming = false,
+};
+
 static const char *fw_image_paths[FAMILY_MAX] = {
 	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
 	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
@@ -871,6 +927,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 		mhi_cntrl->name = "AIC100";
 	}
 
+	if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC100"))
+		mhi_cntrl->sahara_fw = &aic100_sahara_fw;
+	else if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC200"))
+		mhi_cntrl->sahara_fw = &aic200_sahara_fw;
+
 	/* use latest configured timeout */
 	mhi_config.timeout_ms = mhi_timeout_ms;
 	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 858dc5bc39c1ad42922cabef3b1abcd43bc4f0f4..e339c67e236af271645ca81cc517efd9eead87e4 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -179,48 +179,7 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
-};
-
-static const char * const aic100_image_table[] = {
-	[1]  = "qcom/aic100/fw1.bin",
-	[2]  = "qcom/aic100/fw2.bin",
-	[4]  = "qcom/aic100/fw4.bin",
-	[5]  = "qcom/aic100/fw5.bin",
-	[6]  = "qcom/aic100/fw6.bin",
-	[8]  = "qcom/aic100/fw8.bin",
-	[9]  = "qcom/aic100/fw9.bin",
-	[10] = "qcom/aic100/fw10.bin",
-};
-
-static const char * const aic200_image_table[] = {
-	[5]  = "qcom/aic200/uefi.elf",
-	[12] = "qcom/aic200/aic200-nsp.bin",
-	[23] = "qcom/aic200/aop.mbn",
-	[32] = "qcom/aic200/tz.mbn",
-	[33] = "qcom/aic200/hypvm.mbn",
-	[38] = "qcom/aic200/xbl_config.elf",
-	[39] = "qcom/aic200/aic200_abl.elf",
-	[40] = "qcom/aic200/apdp.mbn",
-	[41] = "qcom/aic200/devcfg.mbn",
-	[42] = "qcom/aic200/sec.elf",
-	[43] = "qcom/aic200/aic200-hlos.elf",
-	[49] = "qcom/aic200/shrm.elf",
-	[50] = "qcom/aic200/cpucp.elf",
-	[51] = "qcom/aic200/aop_devcfg.mbn",
-	[54] = "qcom/aic200/qupv3fw.elf",
-	[57] = "qcom/aic200/cpucp_dtbs.elf",
-	[62] = "qcom/aic200/uefi_dtbs.elf",
-	[63] = "qcom/aic200/xbl_ac_config.mbn",
-	[64] = "qcom/aic200/tz_ac_config.mbn",
-	[65] = "qcom/aic200/hyp_ac_config.mbn",
-	[66] = "qcom/aic200/pdp.elf",
-	[67] = "qcom/aic200/pdp_cdb.elf",
-	[68] = "qcom/aic200/sdi.mbn",
-	[69] = "qcom/aic200/dcd.mbn",
-	[73] = "qcom/aic200/gearvm.mbn",
-	[74] = "qcom/aic200/sti.bin",
-	[76] = "qcom/aic200/tz_qti_config.mbn",
-	[78] = "qcom/aic200/pvs.bin",
+	const char			*fw_folder;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -796,6 +755,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct mhi_sahara_fw_table *sahara_fw;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -808,14 +768,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	sahara_fw = mhi_dev->mhi_cntrl->sahara_fw;
+	if (!sahara_fw || !sahara_fw->image_table || !sahara_fw->table_size)
+		return -ENODEV;
+
+	context->image_table = sahara_fw->image_table;
+	context->table_size = sahara_fw->table_size;
+	context->non_streaming = sahara_fw->non_streaming;
+	context->fw_folder = sahara_fw->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 88ccb3e14f481d6b85c2a314eb74ba960c2d4c81..060dafffac67c5c920adc1562a61a7233e8d583f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -234,6 +234,21 @@ struct mhi_channel_config {
 	bool wake_capable;
 };
 
+/**
+ * struct mhi_sahara_fw_table - Controller provided sahara firmware mapping
+ * @image_table: Sparse array indexed by Sahara image ID
+ * @table_size: Size of @image_table
+ * @fw_folder: Firmware folder name.
+ * @non_streaming: Streaming feature support (optional)
+ *
+ */
+struct mhi_sahara_fw_table {
+	const char *const *image_table;
+	u32 table_size;
+	const char *fw_folder;
+	bool non_streaming;
+};
+
 /**
  * struct mhi_event_config - Event ring configuration structure for controller
  * @num_elements: The number of elements that can be queued to this ring
@@ -360,6 +375,7 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @sahara_fw: Sahara firmware mapping
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -445,6 +461,7 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	const struct mhi_sahara_fw_table *sahara_fw;
 };
 
 /**

-- 
2.34.1


