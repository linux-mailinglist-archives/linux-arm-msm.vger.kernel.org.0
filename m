Return-Path: <linux-arm-msm+bounces-90435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBjfHZr/dWmMKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:33:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA98046B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B16530490ED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F5C318B8A;
	Sun, 25 Jan 2026 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqrwAWTS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZL0a/o3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737973195F0
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340631; cv=none; b=eHLHiHGgeN9ra8qlwpgw6h3bvqp/4ansJhMp4iYGPF/YGlT6msgJqNSIDrvsmsh3V/bgROe3tf4FJ6gki67P2IX7ZfcE53EwHo+4oBb/VxexU4fkU2DDWsJ+nWpSwynQY3X/ZolokxdDaFJf25DzaSRVAMPsFXnfzp96WLreEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340631; c=relaxed/simple;
	bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9Q5faMfC5Zj5ntnwdTwc7O8kOxCDjgD59ScENG/gBXLMKreL93ZrWMVXq7pnHs8XYoN3o0ogL5sn7ZxifG0OYVPV7z59BAfmE5JGDCwXNWx1YcjbPK8yRRwfh8ZNz1pIS2z/dFN7w099fVc5NAfAAUMQA3o6EW4bCgxV62bvyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqrwAWTS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZL0a/o3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P9eb4Y3364319
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=; b=ZqrwAWTSQABX2npi
	TVIHRRRAO64dO8G/rheiBW9cDNHF+Tt3eW0tjfIPQfhQtjN9wCkIumkHfhgBdHo5
	3xGpFhJYsGZsmRVVV/hayuQD5N3Pejw6g3FYJ+C1tURa/x5wE96/6gLZpp74HbcR
	u+5nh0G2gbKFn+WSC0tDRC+osTk1bhrSTuO2Z95iWpKyRHT5glW3FzodXo61advE
	bKq0JnqxjNAfew6LySMuJ/IE3+uQxXVRTNApunhfLnRqLKAYiZ2Vqze0FICkL63c
	gGli5QmgDSsEvWrOt26g3I7/Q+zSHIXJvvV682Wr2euf9UjtlOrPQ4emV9hlKU3V
	CJRRQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9ft1y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so1320057685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340628; x=1769945428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
        b=ZL0a/o3uMMvPsbSSH4DSrP0qIk1JuOtseDtVcL5auY33al04Slur7SzKYyv7KDcPYP
         yjD82SAopVVVEfLt8NKoX1nof1TSis8vyDZretQZep+3HoI/YIQd9gbBrkcv6QSx4uRt
         tRoeYglF99vavZJG97WHoRLIdKKgIzScqCu3J86ynMGDlJD7wJdLeLkFco44k3cVztNp
         Y7NOL7qHMpcwQWmk8jzJYIAhVCu5Y8ooC4R/pHAr4WKDldJDGM9OTrkVe3777pO6GKPz
         sTUYPT7cP6+Y6cOWiUcWMEc9MH3MsVDUXOzjXXqAXLzdrkuEjyV69QhdJR5X3ZaZaVem
         8nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340628; x=1769945428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SyQqdK9jmZKeNVXJQVvQIDZmFlPQgBoBYfDnZTubWOk=;
        b=G+3GjI2qqUdMW7LVaWT1JklNZ6v9xeG8awxV3GZGoZilY9znP7yZV5A6PY47ioeGY2
         PeY9Dkx0jxz6czD9/R1hdp9Yn3HhfpLo3FzG76rFC8B8TKAeDybn/wftiVSfUqzXLLEw
         qoUJBcMG7x09+aNCIU8jLjJz8Zv1vLqtdJlDfRQpUiNM1d47bzfWPsVUq4sKFV9W7+u6
         Gh0nKKSUBA5dq3RH29bCVkCbJdhgMiVFiYuipTR6qeWhpiRZduLZ6eVLuxFDmJchNV7C
         MXNq3xsQGke3mv5rbdaToQ3wCYPXInXPdo82Sj362bIMb7r9fYOf+6ycj6CziWUa2NF7
         ahQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwMpF0ebC6PtScueYF5sgYu9UR4vrgGkXK/Szkow/kD/ix3ce0lFffOA6hBXprPbqBWZnlEFWMx9HjtXGn@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+XDX0mBPFGQBL1YgJxUvA5a0FLciN1ltIS6NqJMAMVLjV/FA
	seUaCt4RXClo1sHmwpwUffEBM9QhFtN1cfrsoFKLUX3R37lWrIRxL1+mBJ2zaOuUJ3+6HOV4KeF
	KLeiTAs4xzE4ZkrOI3V3XSkElE3CWO6lAVdkmhTVP7nO7gi5Mptfw6Mlb3qnmBDkGzsxn
X-Gm-Gg: AZuq6aKnak/MaOQALl4jOxlOw391/wRZTLEM3lbTtDbAghJ7Znftjgjd6EyMEoiXEbU
	SM47WQGmAw4ShKI1lfLamZGVInsgIpx4UtlEWFiEelGSlTJejwyythBLCG7vX6aidm/9hk48RBO
	aCHn/8T74OqwoMGOV6dQs0SfHvKOW1AXlZSV9+rjsdKWNdAtSrYLIepv6T6PGKl26np3jd400CO
	6Zi/WDujM7OdUTXp33cLvuaLBCtSySc+bzWz89Fr0fJCaJ/I/wPQ4v5y/nK6qJdZBeIBS5Sx71U
	cPxS7zitHhrCqB63TmxuAIcJjPQQr7PpRUZ2h9kGpmp00cpAl+kQ2AeI+BoEEWSjEkS/D3xIQeJ
	Fpz89yxE6019/sqCwRHnMjglsIax5JGMgTMa90EKkyB8ULzb33qsIz9YkZcK5CUOoPNKLwkZIxo
	uKf8SNRv4iUFe+yoCK7PZKI1M=
X-Received: by 2002:a05:620a:461f:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c6f95fd92emr156261885a.28.1769340628073;
        Sun, 25 Jan 2026 03:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c6f95fd92emr156258385a.28.1769340627680;
        Sun, 25 Jan 2026 03:30:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:08 +0200
Subject: [PATCH v4 6/9] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-6-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I0GJCkT+M6rzwScGE2nHMtdPm0YonKxq+nwx5NI6V5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/r+/CRSOtjlesB321W8+/NVuCWNV5b7blO
 3tD6mjH262JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1UMeCACfr6fMyFR/w1e2kdiDjfvPQe/y223f1zEgA73d6AKI50kP2ZsaBhG04vLvbeVPTzZdQzv
 ftfQdeTefNyGINHx3JGZaX2evrbO2fKqgIAQlYUvmvpCyB9XoyKxgpIPmAr1VjKAxRKPugxxW0Q
 rgGGaUDtSRlhjpMJmO7TDFGanZK4Q00jh4OprV9iM3qwhWGCldRVI2N68bR3QOVoHT7s3j4VruK
 aodCfVgHUClwmn33Ad23lKsNGaIfPKi9WKfLMsFT4qIlCAzQnYwQsBdZ5OSfeTVecqQ0g1yq/+D
 kjhB3WEiz30ELAQL5J/Q7KCz+A5wRoERB3HoDGvxSBZqpC9K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZHUvGky04UtD3gmlWf3KZnGOq90fv5yS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX7K9efJDDZV1Y
 OKAsoISOLZzaGVqBcQNg14xjt490csgGKbFiPJb4j6lg81YatEJkseBDFrtTqHyph0Am3o9CMgf
 8qI3qRxB7Acrg2VKalwTZ3JTwmcyrbPE1NqjKXoSq3JvAD2rAbnnpkRga2USe9B1fcGYCE6EK1i
 qyre7Pis+mnFBzMs0+44afcrEr26myRpqbHCSz1db0ID7Tl7gkDknFk5Ry+vtrRrRjw3fD5A5v4
 N4dLYDj5Hnjy06iMZNnAzbUkJ9GA56TwxedhWkjxGyPuebfmk+dP5LBRg37q36DAk/tHeUGoigS
 7De8yZuxaq8mY2+T3O535CmHW5IO9jK5bPGqK3VSXOWl7zXHILG99ZJm2W9ajltKCzg/zINaAjN
 hq9VdfsTqSO/SbFBw/L4Mcj1SgF0+MUCGjNODu56DUpMeuKH7/ClMaozQRASRZBALmrNs/fIwEj
 G/9rQkFExyV50/BDArA==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=6975fed5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4H5-pPW84uT1T8hsIVgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZHUvGky04UtD3gmlWf3KZnGOq90fv5yS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90435-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4AA98046B
X-Rspamd-Action: no action

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5639eb5a75b6..e217f15ef028 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,9 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index bdeb92e0b7bc..8072f430bd26 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,9 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


