Return-Path: <linux-arm-msm+bounces-106367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBN4HzqP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB9D4E8EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BF430AD71F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042143FF8AA;
	Thu,  7 May 2026 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4OlXS5A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E42IFifG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4163FF880
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159025; cv=none; b=ipC0Y+Z0B5GGl10J8Nd1/S6NydGe5hEwcnkClwegbvSgitY5Awv2JJo7lCjhnNkpgj7jUB+i3XOUpdC8yjTOxbW/jID/6Vm1oiZvzim2Ikcgh6JR83ExxKeocEgJ74ry/y7tWl51eAhVe8N7MUaL4MIGTP5egwfBcs32jJnzUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159025; c=relaxed/simple;
	bh=05LhYAKGVaBgZaN0qt9lOXQChuEy0ARdc0e/ucvP2Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ot1fGKoSvHPGjw0QV3hTOrcOtlbp5gKoI1pgeg8tamJzcWcynzyl4Fz7qXva6ijzFnZzqr9kgGvhhYLoWQLgVnDCiSTkIbJHQtFe0w4GgBGaMET06EeUliOH62lLjCE2c0lIxgFIl0r/PHCKr8yHCWtACgEXKzmxu4a2W5223rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4OlXS5A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E42IFifG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5VEZ1971617
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiUTlYZdmXRE6wHZobRlLY7t2S1s4URFF4b8EHPtYQc=; b=M4OlXS5ALFlhkFd9
	lGFCXfCT5Cy+fR723ysKYQoY5UdnPwAtBVPIW5wQmIHDnvaF57qvyLQTfeAvpO0Z
	U6IcGpJNiWhCDEtG967GB+Dif/ENmmJHmHnTD+7mHGkK5e+vKKV4YYG2jsVMrq4c
	PQJsWJB0mwEECqVMV7mx/Jz11pWg+bUhtMq6meOq1wGec+mNdHcnrzIAfJMtmbqb
	vC1045ULf9UyeBVHKVYjfHfOLSEF0jVhyQJF+u8BQvhfS9LVZD5vR8os9bVqLK37
	WP3qo4t16BpctT1z675jThbvyQraQ8nPU7fYiZruyWXxakOavZ5XpfIp40KTQvzO
	WtZZXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej86d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso9363765ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159023; x=1778763823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiUTlYZdmXRE6wHZobRlLY7t2S1s4URFF4b8EHPtYQc=;
        b=E42IFifGhc2nNH/lP4lCzoPzz8ELf4k5Ebq8dLEghNS11ga/irdWWecseH5EvD0ION
         SpolrS68O80VBkFiiiNLmOHP55QQjqp0sev64TXa4z3SR33VbTA8KrAUP7q5XphQaEDP
         pPaaK9RJB08YmF7S3V2XQ/l2x0KPubq5GIzM6vBY1XzC8dpjfVQW+rB08RzIChIY7KG7
         pBpYCYgytwAC6ixau8tpYRqsOz3IHETW70Sfd0FIolTKJDelyTXLKY51fe7SdDDkCsJw
         kA2LnTrTtJjPFTGrmqPwWCDYFtVPay4jo9OUb7kJIW+bpnvVxTHFcgd38htSok+1SQXj
         40Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159023; x=1778763823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oiUTlYZdmXRE6wHZobRlLY7t2S1s4URFF4b8EHPtYQc=;
        b=BVq4VorQtsPwUrAUi2Oh9ocf+L7mLQgndOjALHCcbpvLjMaPGIb6RMlEeYW5QeKcel
         noamgaFMdgZ565huCRallhCDZCwBWXoPhEgUpxQlBMEvzprkZpGsuCyKxOMZeKd7mP7n
         dNfmqxBomWvmTnsKVDDvcQkYIwoAQKwCsn401GfcsMC7lc/bsctBC+wIgoYtVG+xZLH7
         OHEWplkCGsdWknk2Me2DDkg9eTHuQ2NSyxoArUDrqtwrHWewkhtuTuxZOg4YqHexg0oA
         XULMwWP4iqV794/eS7+rHs2yK0Kv/+vfyM3o2sHmov4PVQQXe6o0B8AJPQRBrTQMVdv5
         muNA==
X-Gm-Message-State: AOJu0YzuS5CF7GJuu7Fo+uYFE4qadvMoXlhSYtIr+FH5Liai+qDgy3W1
	jRSTAH+1kT+zljXgOY2zxUCpp+XpEmBmWNkDhApwYWrIh2a86hE/RBA+kheBrRGs6IFZG5YXz0Y
	lWvMKYbXrp31P8eed3bBEXOlIV4r81qmOVR6xGz4BYRe47RAS6yYoWHg/nfMei5SyhZHZ
X-Gm-Gg: AeBDietoi88ALg0wtF502VANJoD4Vl/Yma8G+9qDtBU7Dn5ca13Vm0N2WFdFdVwSHck
	k6VkVNFaoiYepNr+ChGiHYmNU5yNC5r1ihSMmH/kxRqFsmdCDoTlUXUjsB4d3QPnpP8afXavLBm
	1IUwplUhCRDlPnaQSxRpTRAQoHVmSA1ZLLR5flbhYeF48wkr+z2kTCKRrmWuqu5nvbHKCSMSF0U
	ZZA7YWg3mGZEOZPyM40cyH7qlAldDsdO6umIu0Y+AqxVtWqkb5DHDgzXsRh3bupX+dNdAXr6C4H
	l9ppAZv1JPBg1Yx3DGw5oviDFP1caWEfMyCUZauHfCdQbinPrPBnyCUyi6vCwJ5XUNztLPvafOz
	mlcvJRoLQy/6AV7JGHyjfrGqbWuC5H6syU2Y6S+yoIqCH6MMGutNsSg2me9f6i9/+2noEN5+TbO
	JeFUjpe0eL35LwAsIe2v1xNKt4uwAkSpPsUyjeUyvSTkmt2g==
X-Received: by 2002:a17:903:228c:b0:2b2:4194:9521 with SMTP id d9443c01a7336-2ba79287606mr83822685ad.25.1778159023433;
        Thu, 07 May 2026 06:03:43 -0700 (PDT)
X-Received: by 2002:a17:903:228c:b0:2b2:4194:9521 with SMTP id d9443c01a7336-2ba79287606mr83821705ad.25.1778159022681;
        Thu, 07 May 2026 06:03:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:08 +0300
Subject: [PATCH v4 12/29] drm/msm/mdss: use new helper to set UBWC bank
 spreading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-12-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=05LhYAKGVaBgZaN0qt9lOXQChuEy0ARdc0e/ucvP2Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2Fhhk+y1A/vA53ZjfHg0b1j3nZP1YRm9BP5
 KmCDexqGM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhQAKCRCLPIo+Aiko
 1XleB/4yDRk+HvjFV1avro56hNN8IRnAnCgBilurLhhmm58AXYk2zSEzrvSs5Ybj6/NuMoAiSgr
 MouNFv9OqHDFlmAd/OuOLwiDpBe40kOWdY8B1itZnspKo6CI9ZCMPUucJg1smVMDZndAzMcVGib
 TKoIM/Pa6mjUtyhjHBS17piCGA0rbGij1NZH9WhhczUKI2WTn4qbBYYEWsecDT/YxCPIS8RG6Nu
 lzqkjTc2E3dLefeTMT50prp65Y5iDwD5SgXt9xEgY9WePG9AS750B345qCPe3tN+OCmmI7XGFI+
 1hA8ZRKnYfqkuQ/K2Z2rzdNgWxsyokiQ5PJBnJ+ub6xoGURM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX2OWU2iKYHaRe
 UwU35TQoPqXWcmC4XIDs5bVNHJ9utcojwMwQOlSuk0XXJs6YGCgyzhtl9QsCb2fSD5tcRea0xF5
 NUo4L+Vo2SMDUYRXxYeYdzgdwkxtQOndqWKsO/YpnY96mY4u61bt+QLhYUBvU+yGkB2bGuFubsE
 Qmd1x3RfvCWIRpUkgeqPuw0uE8BNu+acGPbStoe7ottobJfs4BrkYv9MgvxOJXcO2/qKpzs1Utd
 AB0pyCtBaO3p6hSqLu4rJp0dsBwOxcGKHHZwLDOUgdcC8EPXmu2BTPBGjDfGbGXyNrbqgvWIInL
 XeC0MXPxHQTmo0E1hNUyXsKm96pr1foduK2Rz+VdyTxkzNvsC4PEu57oWypSt1kyBkbsR8cAFGc
 9t4J/wT0OKYMaOLIFInEd6eoPD+aTxLlXXRmnUXQvzcbgGtjgLbTij/IsV0TD3bmi9TOhdGY/E4
 bmELycEWzEAzV/+jQHA==
X-Proofpoint-GUID: w2dot9KP855G7uA0cAvv_vgGCbCW8d7V
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc8db0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vkIeKiNhsAXvYQN2DwYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: w2dot9KP855G7uA0cAvv_vgGCbCW8d7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 1DB9D4E8EFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106367-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2742d4bb2a4d..bf106d849dea 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -201,7 +201,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3


