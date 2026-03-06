Return-Path: <linux-arm-msm+bounces-95888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOIcMxkGq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD112257B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D52DF31519FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D69E426D19;
	Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3OMDOX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASPrvEjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C78421A10
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815662; cv=none; b=Zfq50aBDcP9HlU84iQThsxM7jv9gIQpTr7LI1BdvZcAQxBg3VC8qHw4Y09oyD/9QXscvby3IOvaK7814Li9YT91mgDOKPBdWTLnyLwxo3phMmnwMvqqmVI36uMhssbZDHWr4t3wM66THJsspaSaaDA1Ljs50wVAXzvgNbWzDS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815662; c=relaxed/simple;
	bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rK5suPHkNoYxu/tn9vw5O2RFWvanL7+KNMV4Pa9YDLmHug/PtbVOmlOFs3d5bXoGiW3d69w1viJ7gA4Kp5rcDH/fzrOGUS4fEmaJdkXafw9ckdFQbVm+TMDzxvwRTawrnEvvDFMX+XDMcpLmqvpvp3i9P05TbGBNmkB6+qm+iFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3OMDOX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASPrvEjH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr0lC1424189
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=; b=b3OMDOX5BD8+4950
	W/lo6or1iwD9WF2ECLHehO6KeYMuvr7U+Mzz+hf7LkAWmIZEHUj+SEMhC6vIRfgU
	PbrDrr8q5QB2buqRY53bAcuJtoIEyxZkSJTnI2fakhSF9mp7CShcn8mAN+Wd0Gd+
	mbyjLI3uQOdLdyc6x34HVCkXYDtUP3489D47J9vc8j3sQgwxbATDRl8KIxHyJvSM
	mHVWeXtB2yeY+RAvXlLG9wiaN0145ECceJNeMKJ8xxEm6KYwHCqWzKYuNWoAELvT
	Yo7kqDbGjhRtlVLK0NCJy+bUr8tkrWjvzx+FnDa5sr/cp9KgGDlKQTGHlLQLlLNo
	4YSrMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t7x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4817f3c8so4613482385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815655; x=1773420455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=ASPrvEjH2ttG1J4pD9mXzTljzkEkRz+LsocH8A1d+o1Y3EPF40E0B/gzIXyda5yLHE
         WZRGpIW4rfVibEI+mBdRLbUDNOInRuNYWc9a3U7RBt1C5V92gD8yErgX1ETc42HxiV+6
         amyucmww4Y/wbe1LFlbRrxjLUmwTrm/qOgcCI/VKNkSVdFFrbsN1ZCaQWBF4iEmO6WdU
         0+Yh1Ddsw6aJuzsag8HUEebGw0RF2qe5Vo2qShHhtXotaZY9UnMAAaigLWHl91hCu7DA
         6i72Nakg8XWeSh8Ens7G0WYrLOTbD6BMlGBvbZ4rumKiyMCF3ZYpKxhZBHrUqPHJixSq
         kC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815655; x=1773420455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=oECjXMrC3m4Y+b8qSVn2Eu3umNgC9mBgnml7QTuDwmwcalRrFs+A/nDs4i0nO3BA3n
         X/YN6hoa1WLjlxtfUoOTiDlHCUjem/6ucoLT6VIvyh0WO5UTDz8LuYFP5a3d0lXCorpM
         TvROR0CXDb7UAlJj+Pu1Q4x9VzlcQXV7K556jneStLZZqz0lfraTeCnDfSBqLgrKxAqF
         eWi4xLnRAJWhhOe/0NxUiI6ua94lUuBwaY6CeXD1KQcT1tHwdvtORyTTV1rmzFINjOZp
         NuTBjNUWKMxlfR3lSDPTwXmXgQaWvFfZ6RnCv4VqWF0PPxlcp/IaFhCNbyzPFDp0Nt9g
         z1hw==
X-Gm-Message-State: AOJu0Yw5eWbUxkdS2ocJVk7EWpAVK4GwU1h+1Elk2+I/0Gz2r3STAmdW
	foBusXHUT8oZKyjIQ8qlqgzErbjW6Dw8AgqFd2G5772q2wINpNsgjOzpFqhdBmSRwAR1y8pAWod
	dJviidBEiarYPSgNwjZKAdZjFlcWl/2ITyoxUVXy+QIS7C+NPvTyc1nBLvBNx2h9QGops
X-Gm-Gg: ATEYQzwn5/yanQJbVaXYy7vSfhS955+MLruUEGCGvQlMYqBBkZTCpcYBI9PSpsQTmkm
	3YtKv01ArzSZMK27kRkZzgasvrfLM2xlFQ3t9g6VI0W/wq74mfv1IOH0QMwvNgQ/I0hM/JmPusB
	qBL7sMZP7TZZ532fv4E6fX8YE7hhG2xpfGBO4hiAlgIul5DaZ5izJ0DVQ3vQ1XvaMNQFeADpXbl
	AZ38AlpG97OA01LYxJkHK7lGVp0w2a2+Sa93D+gmAemKvB+V496UDeXDoy2QiISkPrUGiCF3k7i
	7rP8r6J+YoGj8Tz1LhesTprDGP1pZcoL8SeZR87I+GlOnwjn0X/9drwSWy3VFn0lGAAEwCuYLd5
	vvWZ1/eazZX3/uIwab/C1gW+h012BGVuulS1JF1Milj7drUy49539hlE9SkzsCmulsoLjsY08Bw
	1mlYImb/ZZMK15ElBbschB2hJRVRckGu+5LhM=
X-Received: by 2002:a05:620a:4721:b0:8c9:eacc:dc16 with SMTP id af79cd13be357-8cd6d37176fmr366709385a.29.1772815654610;
        Fri, 06 Mar 2026 08:47:34 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8c9:eacc:dc16 with SMTP id af79cd13be357-8cd6d37176fmr366705185a.29.1772815654039;
        Fri, 06 Mar 2026 08:47:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:18 +0200
Subject: [PATCH 12/24] drm/msm/dpu: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-12-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUO8Ex+JPWJ+F1STr1Fz8blrRQSL1616YHar
 fhCWu7KFZ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1eLWB/4qKS9M2QSk4gBgTzuR+lBoo3EFQLXIn28BVsW9tNK5u4BmuuHD8+4m1d6vzLWv4w/VNVL
 QIlcjUamaXYmVv+YncwGEG/H+ZQuywNypjD0+rjZwiy+ip9aJvCydE81IeOnU91amSAI5shWxzz
 GaQLVVo7eImBApIUz73/Z+STHTKj+Bj2xtMnVH0urEW9YwHjiZ48To8lTKRhXeou25f3cFluJhF
 aDmnNeOAxwtBJ4njrgMNDcNlJaN0ndH8+/Qxc0s8jqRzkL293BMDIvOFM3guxLs2V9tj//4tH+A
 U+pHfC27wAaO2QxuSmkyC6nu1uMV7MfWWNv5/a3D5ZTPJINj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: AxaqESZNDH8grSEubvc6mjwjgO6cVSj9
X-Proofpoint-GUID: AxaqESZNDH8grSEubvc6mjwjgO6cVSj9
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab0527 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=46QewcZEoJiMQYndSOUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXxuKtNxyGTQ19
 iabgb0Jyzbd6ztnZLhngls8KlHmwOiHUoxtGRsTwXgXKG8V/tI8hVnjWfqH+dhTmkSjPNKR0Nuz
 hbAkUsqFv2Oiq7a3nwYQ2mN0H2RrgMMbBZpQIiiPUvVozcVBITFtWx7iRTRaadQoON5FPpiOwcC
 76K4ZqBj/+4W/BTH9mp4o42kGxp3U1L6LxkYPrJcfQ/ca33E5/nplaI35LTRwwEM5+ZbhiPu/9x
 Uh4/A12HxMmII4HzsIxvgLHDq5uUfx036pXI+R13D6Ejbj3YR7xS6TL6Btm+5hhq07QKJrq6LWA
 NmVk8BS+XorCmAcoA2vCXno64QhrCa226IRPYkA0miTMY3ILA32DULQxSo8yCYn8a+BtkRhiumH
 9leAg6PXGPmIHqSlYVExIjs2pYxLjViGrA9Kk8JS/pzLN4qCxfa4j65wrGWhdWHh26QpCQ2MzBq
 ByjS8+SWV3CFa79VCkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 2DD112257B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95888-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.926];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


