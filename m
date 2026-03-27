Return-Path: <linux-arm-msm+bounces-100498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGjMEpMTx2lUSgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:32:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F034C4DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2C653041BCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFB5388E67;
	Fri, 27 Mar 2026 23:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0m7hhBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEZ2skM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC5B38CFFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654133; cv=none; b=h3YnmCqhlaXgLDNXB5h/n2Wk3DV1GDRLdc7vbB2exqpdPno63QY2mwGtnuRmMHCqDfSqUgAb0lLfL/sITOi3P1vflaYXXp5i3AahLLhYjN91ZFjX9LbJey6YoAmpPErJxQHZRggRAgbAfB1RuGIGUC7V8La8Hgxh5eOuKKAk93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654133; c=relaxed/simple;
	bh=UnGlccQOyrgjPF037WTnCf6++MPZK2sCDOcuFmLrNnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ciXGDVRTWJDfgUOYrGYHayr/YNlY9b3hPfEYgQ1ClVo/8mf0Ln1Q2MWVH0cQ+rQCEdeQTxkSltoTKFGcY0qt88SXGh3V9DztKkAqkHS8KnqMRYY4JQTv89o+bAfujfQ73Lxzu95wysRKdUdEqQkATCw7lqcP7on8b0mb4gMROmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0m7hhBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEZ2skM/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN45xT2860711
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=; b=d0m7hhBBiHNeKU+z
	sZVVpLavVQS94t4NlSudUg7nnstVJkjuzv0VLL+5mv3zviqZMLyHhvOWJWtrPaFy
	/nBzVMZZ7ewJit5zMSWdqZzevsToXQyXcYfrZKLaXnS224vfW0ueaqiqR1QR9pl7
	8FAzyPKQyPKvkJ2Tp9tN4WYkLXChcXQJvCOEg8k+2IlMB1X+lyK4Pg/rKfvTJgK/
	jQ8WxAjck+dnu5GNmiKCeYXJ8E0xbkx0/1itjxuYYmuH45Jzx6FKFNjKELs65QL4
	nkfO6e2zoxemkW9TmWyJCQhAhpaeKL4EPbUaIiFRMo8A/1Whj6w9tG9xP2yu1Plo
	1qHuiw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s8eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:28:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so9064621cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774654130; x=1775258930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=cEZ2skM/+TToSe1TUXJNfL1sRfVxs5ISCV3TQXAyX5GL0I5SVk7D2g1+noH1pjMf+R
         dbxqlLFRIF0o1CtNtGydLdrGeLFwJS2XVc9478EV9iaxJVMG6ggqFQXdGgwxpkFiyR4O
         wr06mgf2ERjuU6fIlMWgVUfBEHflNHC73QLztdsaQa1TOndH0fzIycjLPFfcsc9T9m3p
         nF8olrKMonE+I+t63GC0nzIfNFpT/wRkqGln7+/WtxQuTwt7q6Aj9r0N7lz1Jzf3FdTA
         NOih8kFpLvdKfOUu3BhiSkQiT2k4DwwxJ6onPCwA4SfHfsdh5/nZKS7wrUbYMmKDyNEC
         z90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654130; x=1775258930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKS7pL3yVGjvqx3jYCkzYbYDA12Tn9fOt01/J1qqmf4=;
        b=Gfo+gE/P0wrTke8vXCu+2ArBtSUG/o32g+M6Y+1X/e36gJZLfjl+QvsHdSlt2Wxp0C
         XtfBYxe0FYCtBwyluU7+eYJ5mZjBeLgHZ80aclrhQrjMULpVAlT3KKVDrmRuxqXMMxCR
         R3z0e6Pw/ywKdstCnMRwZaoUhoLm0GCmoj9C1QVtefD4pSC4GuAxRCnQNz+d3F3h/Z/S
         SZ73W5V4ItDaKqvlSqbiGlSgR8DsMUcpPH+yyjUy41c3MDRts+1NwTH2zeDLfwMrWW/h
         NC0bljkRgpHeAX1T8YDUqlR6tsVAzyhlkEZ2cLPsp9ALAvjJ2c/2t01ytTXUuRoNhE23
         RNWw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3EMT/ew7k8upUudtyNGk+punw97hHH01NVh3CHjLtV64wwhFgoG1WSnLrh+F+IOONXXDAaDlhC+n5Qkz@vger.kernel.org
X-Gm-Message-State: AOJu0YzChvvUogh93Hu18Lp+wevF52th9xluTJwWY7+7YBNuhit8uzFL
	EqlyXyE9zCVA1vLlkUFbIWdXvF3NN9qx9ZJQRN+C6IqRfk32xhHAHlSNcv0HOY66eAXwiO64fYq
	ljAgXcm+SZKF/vnHmbjybrLqNrfDNjDUf5UgVUNoI+/rVqpbf3i//Z4oI3BRIHHGfmcm9
X-Gm-Gg: ATEYQzzo1eOETY5xXG4rob+icYDOKEgukd3qF3qeda6faog6ktgtRChepsaOzF0XfsQ
	ioQYDnlm7Iyr+dyhrWr81BzI4XZtBlM+BUyD0YYYymlq4MV2gH4xD8C5RfaVJlCIdVMD91TycyA
	1JIM1BvkEsZ3ziyq7lyF/N6x9VvkKje2jaMTVKmFtfd6IRcDbOpJyZF31PRHwycbEIxLZ75RN/q
	7vn1CwK33NQIIBlTpcYQ4ta72lDCqlCVHKKNb3OuODcoz2+KveUiSRcBriJgYwua1uxDcqDBEgS
	XqNtvqzn8kDdXvBlRjtf5vi8wfIoVmrk7y7YxdC39PrZ3/YhCBNqGGOo5GxrUKaXZgVxxdnVaBq
	2s0rO35xCxDms9FD1m+kif1HPopXy5TbiPuGSxG6/E7lML0qsTlYV4C/mQ9L7tthHAoBYjfbaY8
	rhJ9qO6TzC/ku9QymJyQLIa6oub3mXGftv75g=
X-Received: by 2002:ac8:58d4:0:b0:509:1ad4:6309 with SMTP id d75a77b69052e-50b9951400emr91811051cf.32.1774654130077;
        Fri, 27 Mar 2026 16:28:50 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:509:1ad4:6309 with SMTP id d75a77b69052e-50b9951400emr91810781cf.32.1774654129572;
        Fri, 27 Mar 2026 16:28:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83729522sm1177991fa.14.2026.03.27.16.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:28:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 01:28:37 +0200
Subject: [PATCH v10 02/11] media: qcom: iris: use common
 set_preset_registers function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-iris-platform-data-v10-2-46b92bfe7b52@oss.qualcomm.com>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
In-Reply-To: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxxKnknao5cwxwtx/tODLX97PFOQlLoKrQC3mq
 n0o1GuWJweJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaccSpwAKCRCLPIo+Aiko
 1TRMB/sEC9oTn6QZbQQe6V/cu1z+0oxm6QhCGecX/uEyUttkSQNovTeNauSZeZZhYmfsu/6crku
 7nBXOZ8y9ETKirkYO5RO+BSZJIsTaHXuR6U2zmFZ5A3OBHeIl394ZKhHfcN7baOkPXs6kur/cU1
 6L024DixfVTK7aF+9BlHbd1boWt54Y1cqK/0PvfFfhu/q17PHk3dcgty4ALl67BWVeKRClFrHlW
 1jq3O4yq/o8ZJCucDQiikaEHp9ZWC6oXuGubs1kZUfQsD0HGbhqip17Uep2eTx7MRtycZBtjCer
 BzAskuXtkNmcKs+KdjqBdbIgQyoTR9A7GF1394426UhQWiJ1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OpWfdrXdTuE0wezXJ9CB-DCxkJgy3CS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NSBTYWx0ZWRfXznQRDfX+V9Ou
 sIWs7ONoCcC27gjAX87VmQvLpEF2zL+v4oJLkNANnFl0xEwQfZeAbpsFbkpS4hQJTcJLvpFDCsK
 qPGTWe94fbpPxjfpoff3gHFFk7coMIiss6AQ5Dt5LqFMV1XKAhBhV3grT3413/XLyhUqHLuV+9h
 o+Tv0ALzRxQdm6VRqUnib9QJ9bdL+8ZzAvu+fGfWS2FgnnuyR3avgF2F/2TrpGYA68EGF6lQbZ0
 nRhUp2+3f13MOawuw28RaFp5QUO6y65Dq9HPj4en3z5VYmdOc6tubxX9hoVTt5nAKgGVAz29Kos
 Wz5uQT87bx3HJw1VH/LL5B8pVA3Teamjn8aafjPZiCuw2dIPh2wSrkR50EjFPWLSPaAwE3LMJmp
 j4BWYpNFkTJFyl6Zx3QJM2LYoIIibfKhzSLDiaYPVu5S6b4sj02f2tkG10HVU+RK9QKYGO6zKiN
 bRgJQlEfOC/RLsLldgw==
X-Proofpoint-GUID: OpWfdrXdTuE0wezXJ9CB-DCxkJgy3CS0
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c712b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LmgrmXmU8fDMlo1BKrQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270165
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
	TAGGED_FROM(0.00)[bounces-100498-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: BB5F034C4DB
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


