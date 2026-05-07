Return-Path: <linux-arm-msm+bounces-106271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCopL/U0/Gk2MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:45:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A24E3A30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15B213024359
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA8F35CB7F;
	Thu,  7 May 2026 06:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUzPpLSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6VJWXKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901B341057
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136160; cv=none; b=fVOTMXBAjLTi3HKb+RUx0EqKNr2q2CZkUE/UJGM475rEEuUhJfiZpqVsXSley6+GfboKDGyYzq7jdbQYJflU0WJhwoyxszXoa41t16xKWp/np4bPMx2efS3vMpboDCAXcPrhLrk1lvD0vyD0ewdpuicBfqfksDAiDSZu8zbs0Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136160; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBHyLjpBZ+PJUGNDBoia37+33bFUkOMvqXIYyWWmSPNnWW4rv2VS0uMx6+WE7MwudyzQoa/jwQlMrx90sCxzriq1g78AQPgI4bxszrpSCSHXzeURE5hiCu57kGphn09tjvaJCebxgS+/8BtYZcvd8dUPPhE0VEJmLPbeO65rMWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUzPpLSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6VJWXKy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eAHH1669567
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=fUzPpLSRqrvMJ+rc
	0DaTs3ZDEaxIrzc1RwOOYGl/zeM9naFf2+ZYaXU8YGISzQ6jUCRa6nCXKsn6r7nx
	7cSKwESeHAXZhDi8jfmIuxTkId/a218/R1BGoCUTPfsr3+c3UeYZvXPZdh77hbXu
	/3h58KJwEGyuRqssLAr0cJ68I8RwHn/FFeTxNl53tNcGHOibLkRQhzN+l4mJvdZZ
	OoafMlUi1PJKQsJ57nJQL8/B9EAKHwlb/0IIExbqVTnfanaLFCbr9vNc+60YCzry
	ZM+JuKXugNbqA9Mq2mjKu4TIva9rBLDQTPPTlXu2amU87j97dzM5mxb+G2vrun8m
	dPQ8bQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0j9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so15874011cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136155; x=1778740955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=R6VJWXKyCpm6lH181R/EaTOi6u6pu2vfELAii4N/mcMxWqYfZDbEOvaDlkOEP1Rg2K
         RW6alGXqq5ZDLX6uFA82ZIBKJRs7TmRQBvjiCGAZjggrcrkQLAE2vM6RLBIU49SZ/p7X
         2iw/JxVsTo8IFjPbmCdM7K2mAmTBvxsJpnt3OWYb8yET30lvBWB4PYyfvMAoB5OlVnAo
         viGaVaAgVIln8z0d7PlFTb8PvsnI99IZM0sX/PEGrlCiNYSPirVj7hTinUho4j2w6gkq
         qdB8IpJDItLlCUlmy24GGKuYE4KoT8Xw16PxLcnceSzyojT6f5U+emMJnw4Roh6Y2Pq8
         H/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136155; x=1778740955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=D/M0gX9B67jcd8CsREQ2e7U6ot324u+lwiHM2Ds76SPT8nlfY3Qwsw+1gons7+FBhe
         DRB/mLZ4dDwmBMnU0UvSOTC0CgqRQilszjoepLmCyS3MCLbYcXbkfYwix9hVT1EUngYE
         /2WNMRZZ5OQqV04plt/HXbo367sE0K25NMfUcDlDfng3YzF+oJyQBPoj3DzC48ptucxb
         ZvZar5i8N3ibzHbBfwxMgRS4fcyKrBPqjLSfmzcJJA4JRV1J62x0kBc3VseIGqNNvObj
         R4gH9scCNCtZxtqJwKlDv4ZsiLzR2NpYRJQrdzOUGi3QUincYTCcYIRy5js4zmScyWWZ
         u10w==
X-Forwarded-Encrypted: i=1; AFNElJ9j5pTmkYQyfTUKipqsIcsVV+5f0JcsSBeIMCyTaONAvflsgVctPUe3MmFsPu2qc+01JGMPCoVz7GHFN8zl@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXI60hLv4T223sj+VHqVsoXkZF6doSKbpJF1T/dCZDpiyAZCB
	qTq9FFnqkJBWnO8kYNEUxQjPAhEEOGl+QTfZE82A/Jv4SYG4Fl+Zn+UiNFs5phEgYiAUvB7aYNU
	oGvK8KskP6pT3RDhGutoG7R10Ydi8rdz2cBFFx934q/Sx/ef9v9KNUUg/8obIyHGRBZ9y0yxBZm
	+M
X-Gm-Gg: AeBDiestKbijiwl0bcFRdKKYPVWOQ3EmJXDp/1lDb/5BjDRzSE7BVILVR262dPZeNOO
	INySQwHXeARHws8GY1WAPPhnqaED3C0Flcmoo11VaRAofsFEttn+KW4c+5UPImuqhOVApsczM5I
	Lkv9qPae8T2sMxHqH5JlsqAXYd9/e7iKg0AVD8rNFzNnr84gmpDrnEbMIT5+2dVxX9b5bITMe38
	Btlq/8FsP71kOBgMSVo0bzziY9m/Vzmq9bVnuzDLAWuEAf7oLJcIesrycp2cesGEno2ZVCVwTg9
	gpn6D5PDdiPY4hBjNC7z3Y7Wg1mClEMg+wrEjIAgXXqM5zNwiumavhe0abVvI/pHn7BMMfO4E25
	jHVllisDcCbKb5SYv2wPHgMMVo3WFch1xLq9qJFIdklUwQ5+jjPiAg0d4+oTfwK4QLs9B7KCNv/
	98uahJol57mOoS/q2CObnQ3bjam9VegWCfUPvN/75rAlHmYg==
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr83758631cf.25.1778136154741;
        Wed, 06 May 2026 23:42:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr83758411cf.25.1778136154310;
        Wed, 06 May 2026 23:42:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:11 +0300
Subject: [PATCH 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-11-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+jdsV7MseOwQW66yLMscPcOnhnVEdBcQ8/
 Ny43XpoBfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1Ww4B/4mPa5QArsW8v3nUUEOi2w9G3VC53fCXjBZ1EptaHH760eARJhIKJmeMcfonukah8u/RT6
 K4NgZvc3vvXU4ctgHBqqfRxtW5Mwkf+BWnXlmUJH3eICK+cXuHNsIhIqjjRAdlPXyve9U4/dcjL
 +KAzSrlKXNQKNAUaQ08eZpETKj7rgyzSSM19wRi/yreLPt92iwpJ9m1WJkzrJx+ZUwzOtFnWLjG
 aC5OYKf/CCiNxPa6XhaoE1T6fbN+vV9IZsRg7O8ZjG4G/411SipsL1UGsRcmLAEWkQaUKkM0WOw
 JFbPHWDM+bZxzTYeYyAOcIWXR4QaXLBuu6r/Yl66+xfwlfkh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfXwdqWcs+IEVqx
 PRfrD7ByKfrfZ7bUeIyskNaFAYSDSIZ3s76bZVIACkKK5tX3iZcQX0MWzj1ZqaIRpjT5vfGQH4G
 YLIFPg5YyVF2REqHvhCi1ufMDYbxuENAkJ+OswFB7DZOI8XT8A8LJKX3CKel0rUda8WTOsgOd+9
 CD/cVg7BSKD8gk2bzFaM4b/bzCHZmUPPV3nVRrUi15xh5151e6b7h1MhThMVkf+anaBN0Xjj9Gm
 7lzUeW/5MtkOxJ5LQx9GsQNFjhGEaXZ6InHJE9+om2ahudwp3bdGjy6l7AqMcmylVgLnNiPyjfI
 joorgp3re0L5U6gvNcw43IrR+nFjVo8POcyKkfd/KgQHkAkpoq5kZl5NLnngI/yxhM1fkxku+Fy
 LRXertE3EHpvXQlS4+Wa2wneAZfP5bZq3uNSDf8YPKuMkzjuo7D3b+52i/uHZck7o7bqKpMh/cS
 inks9aOdNKzAl6FN5KA==
X-Proofpoint-GUID: 6D3qOjLwsy5Yg8_VL2LRhR3_qyGDfoSZ
X-Proofpoint-ORIG-GUID: 6D3qOjLwsy5Yg8_VL2LRhR3_qyGDfoSZ
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc345c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: 059A24E3A30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106271-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


