Return-Path: <linux-arm-msm+bounces-83893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08FC94D48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 10:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 74B59343E6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 09:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD4727F75F;
	Sun, 30 Nov 2025 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNGLQkWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOhZ23L1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3525A334
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764495644; cv=none; b=cVQe7nzxckkMQ0p58ovSbxJYIwwjed74pL2IY4hsJcl9gI5nKowTIoeYBsXIZ0K8jKmSbDLJ2FKsu1Ke/aKnb2wO5FBEAZuwAOvOQYxa58tX4s1wl+/M5vQsUtsIIr+eR5NGSfKjkV3UtZPM38l+sN5xp8d1rrsqu0BSN5BiLfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764495644; c=relaxed/simple;
	bh=KoWSHnl/yUiVm9AF3KmqjJ41Ujm/tPcp34Hb73ZYxVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jktg1Z4pESQtmKU0rXl1dOJOmZEf+AM9uYXaoTLT8VUoyZWsN9/YR/c4QiYJ9DoR0uJnrSadGSJy2seW7kgQ/Ot/Futn6UEZ9EfizU43stQLa6Di98MfPKSZxXzLEtgjtgUOz9UEpa5OvoR30POkf3F6IJfP+uavkxkyyrIrf+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNGLQkWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOhZ23L1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU2IJ353815399
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX5jFxQ2TYNAZrUrZcm773iTC0ebF7DRBRpALwPcSe0=; b=aNGLQkWRw1SXMX0I
	p340bNMjBGAwUc/8jsoEHRkcqEmDgPCtSWkUYCbiwdamLlpHQOkSDJZgarUXE9c4
	RJ0jAyLXdk1w+VM49uV/Cx/1BgNjDhIp9UmWRJr/wWs41dnmgmbwOWDbMG1uRrgF
	PqxFor8LCkcLlWM00tI7jqDhfSLT+YFBN2K0iKpU4hKkC0zBsMFsNrNZSGmqbn1g
	Ov/OqC0OVbTqnBzSWdi81m4j44ZF09BpJKR9Q8oR9qsWx+OrMWRflkAjzEq4w1fV
	9LVXpwkkg5SJ+23WIeiIujv0wbQmr/zmnkw45xdijb8tK41CejLDYgCzHotwi42k
	xeAlvg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt0j1w0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824b00ee8bso43824936d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764495640; x=1765100440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mX5jFxQ2TYNAZrUrZcm773iTC0ebF7DRBRpALwPcSe0=;
        b=IOhZ23L1wLfCtbexJ8yzLX7Fo4h018XMm4gSvi7xag8X9BY62yJXLiqFwO8eiz5mct
         2qeb3qvg9l0iNowf+V4WB/xX1CS6CA/fasvGaEA0lohBVU8K8ty7q+wVvCwP9WOD+guL
         ehyyjbH+bkksGS+0M16gGe9FRk3bSPIdFoZzytrrQ75sKHQgKPcizNT/NMaXSN5WqT89
         BqrT6XTb2C8pD12QB0RfkLqZb+uLH0aptOcw86w1HkPPRS96H1K2sk34LfoWyg81xSSE
         3CYR1KBX+nWEMEnz6iS/UHkuzBbfcjBtl7qUwg3/uehyHXGMhP1RSYKSwtobMdQkqsZk
         Sdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764495640; x=1765100440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mX5jFxQ2TYNAZrUrZcm773iTC0ebF7DRBRpALwPcSe0=;
        b=AM2U4m4KE5zetBVBRS77cu/LgvO1qIX5iKCqbay66x7e9jHp1H08NOGLHqK3QYxL2g
         ZJ964+Cmo0r1zr2dSYJDyfnBAwwnHi7pDJPxCJn8y2Inuk1MaPvRm5AdCSFlt8+99w02
         NDGE+/swrJk4MlGleroXwfxFTV9Fg4R5fHzZdKWOgdS3uUN4pJKD/qEQLQSiT+dHH01m
         Qm06uqR2fGyH6qB0XjmbhAgzbSWCJyAoZ/Ie9PmysZhcURL0X4Sl9GrukjjPFwn6+B5D
         SIHrojufhY01nVOwM3euQyZCo1frwSjPgoX6zktZs0UP9gVlVgTWzSswIS0AeJbPwuIg
         v5AA==
X-Gm-Message-State: AOJu0YxbIAUi+aco2Py1Rn+P3VxUvmBNMxAKZw4u9P/qXSnOM3pu/JwE
	qBZx178gFTjeAbH5b0DMgpa6lDCn36KrZxXXHrFkOwBVG+kWsagehzpH9fP2E0e/24QcFI5ptPe
	3G8pm1AM62JJR70FFIoH+fEB6/OHPtQcZh2yZqdZPVkb9l9J+W2sFGrLzhz1+22+m/bv+
X-Gm-Gg: ASbGnct3ZbRbvHuXocxL4j0swyB3nkLsMFAMIr1zWcOVUeOV4hG56S3y/OubgO7RhSm
	DdNnXnJkrAimhw34KqUZOL459Fna36JYiP+HUBeXOmPNqMkFklfpifzhD4xbWwMBuALWCotM8B4
	zSlTttFn7xgvvzxdLyv6sVURkDGtofwe0TUvO0qCKLz6LsvLJzC/PYRKyOBnT70ikkmZsjbERLP
	0vP52Lqv4c05aaTICqTJFbVQ5lu/wR7Nr9JAmAjD3EaObzQqVdWYmxYsHHME7+A/UuL895mcg3I
	vVWr7RZ3KT6C6hgbQO82ZHuuc/6AWarZ5reGeCWm0fdRMFT9qQky8gnK2CSnWKxWwHB+enTZcVG
	bi5FDhM+zjDsM0aeFYIpgGrnNa8oWxlfL8w==
X-Received: by 2002:ac8:5a08:0:b0:4ed:ddd9:141d with SMTP id d75a77b69052e-4efbd8f5159mr327963691cf.29.1764495640353;
        Sun, 30 Nov 2025 01:40:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpJXs6UP2fRRY3T7xHT5fVT+8qcq/MZ3hF0wt7w2dgo8aliKvJ/waz72XUIdMqhDHLGVsiDw==
X-Received: by 2002:ac8:5a08:0:b0:4ed:ddd9:141d with SMTP id d75a77b69052e-4efbd8f5159mr327963501cf.29.1764495639900;
        Sun, 30 Nov 2025 01:40:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b762sm906138566b.67.2025.11.30.01.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 01:40:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 10:40:26 +0100
Subject: [PATCH 4/4] ASoC: qcom: Constify APR/GPR result structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-asoc-apr-const-v1-4-d0833f3ed423@oss.qualcomm.com>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4051;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KoWSHnl/yUiVm9AF3KmqjJ41Ujm/tPcp34Hb73ZYxVs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLBEPKSxL6OvVv/OF2tDgc3/UkapwLu7oFY+Tp
 fxQKHMFVBKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSwRDwAKCRDBN2bmhouD
 14geD/4rXPdzppbnUjgLfDJYs3eDZfZXDe0kz/5+Bjxn6boJKZbZTUCi33+XD7t1nixIGMYi6bD
 GQcG9WfykXwmpBph9Gb0kDKtOo90iBzjnT/odEaa+MzmGtGdYs1CoPFUU/+77ozLIu9WeV0M5Yq
 59Qr8mZCQI6EO9yw19hKBC8y+JSt6sQvLsqQjYssJA/Y2qxp6hhbEtsGT4JGrvnH6Ayqoc2JBTh
 MKIkxgw2hRCCIh4LXjgfOTph6LLru4I9OP1QFdJgn6y6z74Pzab9yEGf7/EpowwsboNHmOou4DO
 VKGp6LAxqOlxP9WIjAxAavzrIhoOw+zNGYl1NQum5lUAtnzn3omOtcX5vSotRanLIVFRw0XRtdZ
 aMbvoQCNksZL/oSPFXHof9LvOqKjd8vUJgP3s8eeOQVhtYpDCKTKemo6pMEHZNtpbL8zwJHzEcu
 CZN37rDnvthXsqVu9KB5lUL1+bHqH20iC3kK8Y0ziXBQhIBUtoH1ab3QvI+2sb0otuc9+GR2FSx
 xIsh7bT9xt8GwPr9cv+JnanI0jb8NXKtHCJjcHIFKGr6ivRwiRWwi8ZbwcHzrv59+autI/4TeF0
 cJecJhv9+W7c27wY3nrVpqha1M5pjlfl3TxkdIJ8ZDwUWS+oMqz0PHx9TuH0M73TQZtdQQNCrSw
 nnN8A1CCvGYT/dA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: L1oKCS7zO6Z8zjC0VY4jrOFJJTifOttv
X-Authority-Analysis: v=2.4 cv=WpYm8Nfv c=1 sm=1 tr=0 ts=692c111a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IPJxmXlkufg6yzWa_NIA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: L1oKCS7zO6Z8zjC0VY4jrOFJJTifOttv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA4MiBTYWx0ZWRfX+BI5CNR7/Xlu
 bOmOzYjutmJ88cZHjA69qhl5hqohHRulvCDQLYSEM19h5vml86/fWtScFiop7YjZm7QEiHw2dG9
 J/elyPfKtTdgrrP/p6CZLwn9chr5Dme5ctp4rDdVC1CRqK+NAFVQKT6JIFEh89lusQg5wDKCcLr
 u/mLc1WqSxgAAfhSy1I3sxrFZ9FQslnjoJ42A8i5hQC9MBKlSqvNo4X/HNwPLToHKBKgYlyCKPj
 H5tSL97beOhjakfJje3HAZIKrBTRhGU2qDh4hm2Gzmr6T6vaauGJiPuLYq72UU1oU83fG9lSG0l
 CJ6DKp7DfQhyDTHC66HPJSBLCrm/3bQRwqwXpZdupdb8UAcXVvWHxA7dmItPQova/T1lK05q5Qs
 ZoGGAJ3W+v5/uyD5glZorNTRVQLWuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300082

APR and GPR callbacks receive pointer to const response packet which
holds the response result.  That result should not be modified by
callback, so make it pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6adm.c  | 2 +-
 sound/soc/qcom/qdsp6/q6afe.c  | 2 +-
 sound/soc/qcom/qdsp6/q6apm.c  | 2 +-
 sound/soc/qcom/qdsp6/q6asm.c  | 2 +-
 sound/soc/qcom/qdsp6/q6core.c | 2 +-
 sound/soc/qcom/qdsp6/q6prm.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 608ca0e41539..c415b3003030 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -188,7 +188,7 @@ static void q6adm_free_copp(struct kref *ref)
 
 static int q6adm_callback(struct apr_device *adev, const struct apr_resp_pkt *data)
 {
-	struct aprv2_ibasic_rsp_result_t *result = data->payload;
+	const struct aprv2_ibasic_rsp_result_t *result = data->payload;
 	int port_idx, copp_idx;
 	const struct apr_hdr *hdr = &data->hdr;
 	struct q6copp *copp;
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 4f9f9a7277df..51d73ad7f477 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -961,7 +961,7 @@ static struct q6afe_port *q6afe_find_port(struct q6afe *afe, int token)
 static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *data)
 {
 	struct q6afe *afe = dev_get_drvdata(&adev->dev);
-	struct aprv2_ibasic_rsp_result_t *res;
+	const struct aprv2_ibasic_rsp_result_t *res;
 	const struct apr_hdr *hdr = &data->hdr;
 	struct q6afe_port *port;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index cec135c53b99..3b504e2a9173 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -492,7 +492,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
 	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
 	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
-	struct gpr_ibasic_rsp_result_t *result;
+	const struct gpr_ibasic_rsp_result_t *result;
 	struct q6apm_graph *graph = priv;
 	const struct gpr_hdr *hdr = &data->hdr;
 	struct device *dev = graph->dev;
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index df183b7a4019..6f1667895262 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -603,7 +603,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				     int session_id)
 {
 	struct q6asm *q6asm = dev_get_drvdata(&adev->dev);
-	struct aprv2_ibasic_rsp_result_t *result;
+	const struct aprv2_ibasic_rsp_result_t *result;
 	const struct apr_hdr *hdr = &data->hdr;
 	struct audio_port_data *port;
 	struct audio_client *ac;
diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index 51398199bff3..f4939302b88a 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -70,7 +70,7 @@ static struct q6core *g_core;
 static int q6core_callback(struct apr_device *adev, const struct apr_resp_pkt *data)
 {
 	struct q6core *core = dev_get_drvdata(&adev->dev);
-	struct aprv2_ibasic_rsp_result_t *result;
+	const struct aprv2_ibasic_rsp_result_t *result;
 	const struct apr_hdr *hdr = &data->hdr;
 
 	result = data->payload;
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index eaec6d211cf8..6d9834b5d16b 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -179,7 +179,7 @@ static int prm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	gpr_device_t *gdev = priv;
 	struct q6prm *prm = dev_get_drvdata(&gdev->dev);
-	struct gpr_ibasic_rsp_result_t *result;
+	const struct gpr_ibasic_rsp_result_t *result;
 	const struct gpr_hdr *hdr = &data->hdr;
 
 	switch (hdr->opcode) {

-- 
2.48.1


