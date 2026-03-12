Return-Path: <linux-arm-msm+bounces-97234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aATTJOLAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:34:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19523272ACD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DEFF30C4029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189A53CBE7F;
	Thu, 12 Mar 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlV7KYE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGU9sD1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3713CB2F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322198; cv=none; b=tmM2u58os0SPzqbhzkpI/fG1XE9xguBxUiEgDMGKMPSLHnQbnpYRUTFXRY0eTsQz7Vm/QrD8bfh6Ul6rIi2ThilJLbMcX5YU20HEKzCD+Q0j4g0eHOjCgFWI4lzsU/rMDJLpF5DJvLtpa4NHNkuDCHxmzcgTJ3D7WnT7VS4vZ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322198; c=relaxed/simple;
	bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I/iAjutXoDMU7ouD4KeRY319bVzXndZMQHjHY10CzWWKTzCmn0p0Z68kHluy9goSsbaFrq0tuUnxMMXHkgPCqYYx9sfDdJfdKM+wbQxwCvb+AoOKe4UXN9bm2JRgI/TDFCzDq2G81KUfLV299gLMZpP01SuacOQItONPLTXRcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LlV7KYE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGU9sD1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA4lWB1756251
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=; b=LlV7KYE1TbX8pTa+
	YgFsjbh/gIgk+VM7wm6DMI7vzq+cDYuEIXlroRUOElyXdRD3IGEH21CSZ4kAZva8
	JoGfzWT3OWPZOhs4t7URmdFHOfPaET6tG+B63a4TKyH3kv3Upkyxwo+2vNKuKEtd
	E+e1pEKOq6Dpb9aviia45BolMxf/MVWPTcBB8wVZEXrxgfGB/oAd0uySn50CrNHb
	uF9aU3CCxodB2UvN7IuZSuqL3ncIqnV2O8cRLNNE0+YQ83McTzzuspxAJ2uVhA1a
	iusKv+7b/VbhQi6NuBJiG7A9/oLFYGT9SHGfgsRguWbmzBtfP14FDLtkHmJ94W4G
	HyaH3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso1087821785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322195; x=1773926995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=TGU9sD1swsU3TEMuF8ORwMEM7cwCpZlRzA6kr8klJb/9s0ReOMJJh9CVuAEnLLvXY4
         yokDD9ybLgx6iVwCMyAv26qQmnVNOfDOwvfKGNVwfAPgiN9kLsQmbbHRrtOOf4CyrID/
         Cgb+Cb5TFMKGYRuYMUj55xfA1yx1QhoPAYqtA+H03BRAgZPGrASCGq2txb/rKiGNkB2B
         68qTnAaRpoV79MvqlG+KZjsTETKg4qFIisQV9dSCJGPAFLEZea1otpg+TWhjSRnErkOb
         j+oSW/ECFs+mMKh9cVhQi0Ob0MxgMOnL404LbvfM82qAt/S3UkJasN/o5HfXmHoTMe83
         /pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322195; x=1773926995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=ppKfISk03v/qTfNUTI6xQO8GA9ytqwChNpjeHBo/7Y+v3g1NbtsUSey2LP02eWJQEi
         fFOICPHccDagd+ETHFdkgGFw+BF7lWl7KtnDBOmmAiUYgCRw4sb0hroFREfc/aMdriYD
         YsqlhgfpvBfpiathjehaFTeeAhQbjmd333rrgdLLrHAhHdVsU68IOlH7QHorul0XAe6v
         vnsaDrbsqeDJ8k4c4B2JM6F+ZJWYeqnyYYE5Ofjdzfh/FwITRp9yVFexERNZR/2kXj4l
         Jpnmi1990ZqXtWpj5rIu7DRmf8C7qgRa77QIGRLde83fSccqiAHmYKSRdrWy9CgCZ9Ta
         LFnQ==
X-Gm-Message-State: AOJu0YwIYoKVy1bcYPn0EZTy1RiYkojX7eIQ1W4HLkDIjRM614cap63p
	nIl5MW08233z76AkVro5o52QAdXnVa6IGeJiaRrlwY1Qilm0EmG3q2MtojicJKaytCEkByDYvF5
	2UpFhswgGSfsFto3AnsDv85a0ahxiKXM58HUv2PsT8KZgbmft0QJbywC5FL0TcLbthHsw
X-Gm-Gg: ATEYQzxqUaYwoI7dadLJlrOtaNGS5ojYe7UtqgAS5ZMuXUWfcI2a5N9gYyzK0gm7xS7
	xBLKNzWjyPRJZIVme407gvUFHmatsrZgtKYFDZmjQuZt8x9ENWPflGZy9qLIg2kceovmkW0MM2M
	4z5vjFCAjq/oxPDkP2MG2MbayKqFF1Nhco7Wl9OAPue+fzsI2Ro8q7zThpNYtC/1OeL80LgXbTx
	NJrj9H0qtp4qbmfHJj4LlbgEsDN7mhlzIA4yLvj3UqR2h8r4kUQAVBZDRhjyIisoauoPL715OPo
	a3ZpRo8YH3F3+kIODdvb1Tr0mABE3dFC5rFevOVGvIJ54Z8748vVOXONxXavhzu1F41UPnndjeu
	sFA7HsmFx4miqqBVY0ZQNZQ/kQ2hJx9Be8OwgxsZbz7pxpGN7Xmhp9Z/rYBcqsBVjfv6QOshcUq
	Li/ZMPfkCnXc+UNdXYJ7xik/GuM5yVEIqjYUM=
X-Received: by 2002:a05:620a:d8c:b0:8cd:988e:c946 with SMTP id af79cd13be357-8cda19f6294mr859448685a.24.1773322195208;
        Thu, 12 Mar 2026 06:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:8cd:988e:c946 with SMTP id af79cd13be357-8cda19f6294mr859444685a.24.1773322194771;
        Thu, 12 Mar 2026 06:29:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:35 +0200
Subject: [PATCH v3 14/27] drm/msm/dpu: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-14-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+2anppC3ym8KO6XdcRCp1SnmFKlx2bhqppr
 3Vr+RU265aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tgAKCRCLPIo+Aiko
 1Zf6B/90dYQfJofMo0jzPjYwCBIiQVaMZ5/4eRlYzzGNQoW8TFbe609iQZFNio8O2JS7QCh+EpK
 350LDlV7+ha8b14G3gaIML0qRx3W6EGk71G+94lXvHP3M5b3xcYcHN3Og669ZIQf8EvNKGA5KDX
 u+IRFP6dKFEEkQbMpyGFht4qqn2TOLD9CNl9itmO+WUGM3gDXzeuaCa4yhnI1DWDij0wU1la3S7
 OlPgxyfMfYTRF6wTk8GMAHl5ipF+yrHpBF6JQZbUXqbBtSCDbsV7ejq/2cpnjOJ9ZdGeIKHWDAr
 qUcvehsSdbCvxqoF27h+i/r2TRGyUlq7lXABSoxHu1RYvplz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfd3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=46QewcZEoJiMQYndSOUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX6StXPM7G6CQG
 mV07JYQcNaieuvt1zuY+iBPtC0UE/s7SJu2g4jcxpiANO3I8wPENJ/h5w/asqHfoqzad8SVaz1s
 5wrXGdI03nQIHhEVukk4wcBff1MTQEfmAXTJVpSTPfqXLosBibQdukmapWw7owB2Ll0w811a38N
 UEweBt3yqX6lILKyE6lNtV1G8lbLBi2kzPtK6ADKH+uTqm9qWoGRVhYHuk8CvKDIST7+eragO8m
 7aVVr4i5VEDxUpLo1s5kXIhADMfp+2somq+mrwJ/E4yQwC9UFWo+zJs2vt1sD83MYZyMEjh4tkM
 iJfYFq4RuUJGdY1ROF7N2hvk3J568yaB2unyjRjSqNFUMHY9HuCrFx6hoe7K47FhklAh/Jt8EUw
 UFRARLQr/1nB39pqDlTQk4eJAmwLV/8u0kjhlBibMTuMqx4VoaqokYRcSfT0U/42NSJM4xJFYGO
 X+cIeAe9Q0YV97eT2LA==
X-Proofpoint-GUID: H-JVngne1D8J_4pdGKtcowlt1fEjVqZi
X-Proofpoint-ORIG-GUID: H-JVngne1D8J_4pdGKtcowlt1fEjVqZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97234-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 19523272ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d3da70009234..6089a58074ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -318,13 +318,14 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+			ctrl_val = fast_clear |
+				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
 		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {

-- 
2.47.3


