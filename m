Return-Path: <linux-arm-msm+bounces-100570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEFhFJF0yGkNmQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:38:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E793505A1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994DA30B4788
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 00:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538821CAA65;
	Sun, 29 Mar 2026 00:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8xuuyh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6Qyv+OD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0544C1C84BC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744430; cv=none; b=c82BhSkDA/u72zPcs6kl3PM9d6/wVYlHC81YCNMkAwNmaczdX9PtMk4Hp9EcG/CWi0NTKKqPSv0VBmwOZWk/1JiwPRAOO/OfBfN3DqLrp5LoS0c58gkntyvuIybFoZ9M9rbOUJMZ6fINVs8YyZMjVje4Ori7EX895+fXsnB5tls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744430; c=relaxed/simple;
	bh=LyKW9a4ahjfp9UqYl+c9Z+AjjY5xRtESGt5zAt7he4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u25BQhMUU3Xo6HBS506fc63kNWG3j4BTJIdM3WC9AZZUTjQBdvdiLbjA9DTX2aynjU3aAEwcOKk5CbMvnyWJw7bipHxhbsyJvLOcLcefjXhcHTa2swAksNHpOE0NBk9D1z0GmnapipJkFW85XS12rOG89sQujIkL9WbYnZhN54w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8xuuyh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6Qyv+OD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SMuTeT2984913
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=; b=f8xuuyh+7r/3p9p1
	J0iorhoiCEVzUFC31FLYDtoiW6fDvp4BhWK2uLFqGCrHEriyJozjNARKJ1FmrvoY
	wD1IWWhP5PmV1ZvncJaKpinuzFyCvAsyHZtp0DttrrAVW7vxLlm7tchCQUF1R5d3
	uSNRVoG8pPlXAzJePpf/qqYSTKTYJL//H9UYOX3ppbmEm1QErvtBpjCs9zsE9wRy
	RXK+tXVTc0nWFvpMon43GvmBDCeyRfR4GO3vsh0AaI2titLRE7Yhn/Dsj7QQeBz4
	eemI7CHFy5/jlFKYbK7xHIZRmzuQg3/7muhBYOEPlbQphWbWgxUIDGJsWdxVB4gz
	LMyH2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwhvnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:33:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50925fed647so107577501cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744426; x=1775349226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=;
        b=H6Qyv+ODp5btkco8jZquM+Zy32YGSjuZxXCVkT599koYfdvj00a7M0tUAeO1dJ450E
         pWsWDN2FrrmOnSmA4ADfgD+WZs9H4sBdwTTVUB52VmB1+owJI87HWfQdyhIokoQT4oZ5
         wXjljqx3PBDbco8OKJ/Nk7E7/5ctcMw1jOL3YCDjfKachsbGRBE8z2iX/UTkBDDDo+OY
         PbEbhshZTzk1PqVF8pqjYrkpgNfSoEIgNDwM4/KOkKZ2E8c8dt8r2loeb2H3kvtM1jfa
         UjZXVpeSokNTrWfI1uUKQydclKN4HJCGuMbA+LmG46JKPmaKmBf/nw/W+LMfFmmT3SVr
         Jd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744426; x=1775349226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhDAQJJ+GZc5YlpYLZVgOxWSZEdxeXyNt/r9yrd96NU=;
        b=dD6+B6/8aN/EHlNwibgIvs1Bd+iuIGrXfLRHi1SqShPdL0p5HUsGwFSXGtMyZpyhku
         JdE3B6NpahHDbiIlyLE+yMe0bP2t0f0AwDM6ORLMHk3lNPxGBDH6/jLy0wPGZU4WSvPr
         vh79x8Ty3MpkjSbYTouMY7Ec5+2GSLwLSYk+ULA/wMVJCemfJ1DhKoD2180t1E7unvbr
         MFXm0OFD8yIcn91LFfLiDV3mcJmuusep3Bf8WPTzhkc4CeLiMKadNMdNj5qIydoEMJLf
         C2NKTYqbXl4sga20QpkCoEJpAqHFhkxTOJThc/K44Vwcxi/CVGxPIoo828ki3fPt9s7A
         YuNg==
X-Forwarded-Encrypted: i=1; AJvYcCVtswUBuqSV5zk8FZ7GPkKOE+mYKEgJx3+bTiNxF4vKAgzdIOGHyGiDvSepcyuk5ycNMsYfCbhUg2y5ITmi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi7jFp8b0wWYlevrp/QuY9YAaSpQn96z+ZezNkv2X/h2fXwYi5
	PwsxnWHisRhZxSS3jyZATHQDOMLI//jk7b68atu9PJfRltC+O8lhqFrsKO7SlHyWHoQnySrbV+o
	1PG4UJxxMo3BE6v5QA4d8DGB8wuPzc9JfKfPDMh/Jf0IKqAtTBtvC0as/93dio8ahP9jc
X-Gm-Gg: ATEYQzyn83ASQdR+RUfkxXYb9J4UcSLAGPTvWus9jXDws3jz0HnNRgINvDYfUzGFWV+
	1dAu9H2NLmYmKmefuXAf2z0i6QVEi6cJUVNmGbA0OJUr72FzR7v8wYkIaw1XV2vZZdBAdKSm085
	F3/a1bICby601zFd/a4sTQrpRhDZwveV+JmbqHlv/o/Rd7RXAurAufb3ai7+69OcUMJPVc1fcdG
	S59XtIaq02YeO3RxS6kcsqZZxKrSyXphCmtWwBCCIoeT4mypoC27MmU050FjGDxfcjFuUKa0p36
	yCpEJ1WjgT0hPUgTP5W4I4LNLRRabphiq+sEZ2nTs1/MzNr3gir7RFqHIt7BSlryfH/RC+SGSYR
	xrpApe3uUrZou1OIs410c8dw1/aeGFdKXk/WZfs4DgDpuPCzvLwkOX8oRe/4WFoxPxChAbWlzTz
	G8RvPE7G3rWJpynRoCz8+sCwuzRS1KkZtEIQg=
X-Received: by 2002:a05:622a:118c:b0:50b:3895:facc with SMTP id d75a77b69052e-50ba383e352mr108759931cf.14.1774744426299;
        Sat, 28 Mar 2026 17:33:46 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:50b:3895:facc with SMTP id d75a77b69052e-50ba383e352mr108759741cf.14.1774744425848;
        Sat, 28 Mar 2026 17:33:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83892035sm7024731fa.22.2026.03.28.17.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:33:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 02:33:08 +0200
Subject: [PATCH v11 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-iris-platform-data-v11-7-eea672b03a95@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LyKW9a4ahjfp9UqYl+c9Z+AjjY5xRtESGt5zAt7he4s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpyHNI1W5CaNKDeMj4yPC99mfspgvwQf2EJ8KRB
 QvbgxjJjnuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCachzSAAKCRCLPIo+Aiko
 1frwB/9YMXxNA2a+d+d3UvsKfmOeJGafhCu8Ai+AYTXfF2+ZIkT7oe5x0GP6FDbJrrcMbYAsmdi
 J1QHF19TvhkXxM0C84y0zEE2/R9za6n1LwplTT3pGAFKTUuum1/Uzhgv/DlH4n400ID4tZx1T1h
 oi479q5FFUtStkqr/JnJBpz4576V+lE7YNmdnTIxjM9QehNZoX3nwmIyefnOGmVLm+s6KRG1Kx0
 VwOdp5qDjmu0ta9HnYbxxOtL70H7W5d/YPJiyKmTFogqq5pdCZsvzulobkk5J+lLV3IE5CYR593
 ytvXmNsepKO1gFa/eAhdYiS4xsdI0gfKLny0lrTGVOTO8fxJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c8736a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qqQcAvOoDgVuqrtd-OoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: sOGTrR0Upal1x9XWJP0zUAZBOScbpaMN
X-Proofpoint-ORIG-GUID: sOGTrR0Upal1x9XWJP0zUAZBOScbpaMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMiBTYWx0ZWRfX1n2+Svt4T4sn
 36s/7f5eVFWAfdAKBsHlmOemvNvQED2Vs9hJFesn+M+aW6XLwDA4ydyNHtW0eUTW7h4GaqrTs6T
 DFxgAY+8LhqUd2yf1WUXe6VelEY4vcr4ATpw4qs3JAREcBwSAVaChbrQHbVNrAZBO/j/AvT/YlX
 ZCxRzmkc4DSoO0/3IkqMQN+qIUQl30a7sXVLbqveW95C5mRCMjlQXSnUw2261zc/eTIP0ik92s9
 SEqBGaVAf5ifOQucnnoVsiTPFCzD8vPSw1pRmVCgud4NwAsrL89Gxp5VdinVgMcVmHkhXkNjcYN
 hXGgEaTNAH3Yd5C0o/TfMG9z0KuLfJIxnEMuIE+9YqdgoBnlq6W9Lfm5/rm7Yw8bJ+8rq/A4giK
 QA825nT0SP0V932niUucyvTqZCJXyWsTKoRxiUTuJrQacWy8dWSjmEG71UPV1DXu+C8flGXiLnH
 +n+e5pXQ/0qB9HlbWEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
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
	TAGGED_FROM(0.00)[bounces-100570-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E9E793505A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HW response time is a constant between platforms. Remove it from the
iris_platform_data structure and use it directly.

Suggested-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c            | 3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 2 --
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 4 ----
 drivers/media/platform/qcom/iris/iris_utils.c           | 5 +----
 5 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b..e6141012cd3d 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -28,14 +28,13 @@ void iris_core_deinit(struct iris_core *core)
 
 static int iris_wait_for_system_response(struct iris_core *core)
 {
-	u32 hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	int ret;
 
 	if (core->state == IRIS_CORE_ERROR)
 		return -EIO;
 
 	ret = wait_for_completion_timeout(&core->core_init_done,
-					  msecs_to_jiffies(hw_response_timeout_val));
+					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d1daef2d874b..e8a219023aaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -232,7 +232,6 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
-	u32 hw_response_timeout;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 9925a893b404..6ed4c4ae4056 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -361,7 +361,6 @@ const struct iris_platform_data sm8250_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
@@ -410,7 +409,6 @@ const struct iris_platform_data sc7280_data = {
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.max_session_count = 16,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 10a972f96cbe..abe523db45c2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -936,7 +936,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1036,7 +1035,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1127,7 +1125,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1222,7 +1219,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_sm8550,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
-	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..29b07d88507e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -55,16 +55,13 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
-	struct iris_core *core = inst->core;
-	u32 hw_response_timeout_val;
 	struct completion *done;
 	int ret;
 
-	hw_response_timeout_val = core->iris_platform_data->hw_response_timeout;
 	done = is_flush ? &inst->flush_completion : &inst->completion;
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(done, msecs_to_jiffies(hw_response_timeout_val));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	mutex_lock(&inst->lock);
 	if (!ret) {
 		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
2.47.3


