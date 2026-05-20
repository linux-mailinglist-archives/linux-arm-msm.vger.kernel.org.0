Return-Path: <linux-arm-msm+bounces-108812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHKQGr3NDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A71590792
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16F60310945B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C513FC5C1;
	Wed, 20 May 2026 14:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XauMLZbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4G1Kp/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832763FC5A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288729; cv=none; b=Y8c9p6hq3H4CCO7rW7ssH+vFTV4eQ4sgxER8M0bHNsA6ADE6qXQvCBWvg3WBs5ODxqT/+zuOqjKcU6A4TPaMefGePhbS+D54QwJzqYtsrpbwZpJJ6jPnUvsiBPXHvmrc0VDo36okcxnMgDy5dMPsvItP5P7U+/YixcscoaTeKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288729; c=relaxed/simple;
	bh=o9JUkbRpVoaqtqVf/XyHTRO9fA3cJ05Ua+3YfNy0bNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9P08geklfbTQgWCoyzP2euOk/ANx47PaIEJ+1tsx37aLvcU6cRnejl4ZlyOXlEOMs2wjMKCwAU5VpuvBN0zD9N3DfwDGtTRdanznhQCx+gvwhUrZ//Lp4oDjb3ucyHUerpPabHHMSCgjbpM6qlQld9PJGse8bskNWiIx7kynFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XauMLZbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4G1Kp/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXgDK1798325
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0x04teL0xC69U692R2wb4fDmKgXpTUZPxuDE0l28kc=; b=XauMLZbK+tvHEEOd
	Mhfa3km3kT2M/q/iIOv/2nvbN2R0sX5KQDn0DX9aSds5dhtbuVejXWxQTv+fqnIC
	Y+4IuVHFMHvdu93zpQoOdYC6TYU9F6w6s905d/mnebhC1cAh/Tmc64oQX7xb45KL
	0Zv/j9lgKNrlzutDgq+s1bf24UjddICwJhefey1siSg966/zb2H+tNT8HIFHNVZm
	+ly4kOpTR5L2RhpZNykyUsGyLIL4IWP+sU18wuR69TaZoVW2U0Dx+4FNhRs3+cVx
	5r1+KHlNGo7GU107DTYI3mtpQh2i2kXYSxYM15c+ggqi9ptviDaEUtnmEzDs+6+v
	oenbtw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0a3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so130512841cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288725; x=1779893525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0x04teL0xC69U692R2wb4fDmKgXpTUZPxuDE0l28kc=;
        b=e4G1Kp/FxeioJLdw990728h/vhLQt4hV2ccdt4SAwdmEITbC01YDvjNjm9lGoCQfGT
         6XVCpepPrEBtv7n4VRgZzFSdWq96AYqEU7A0md/mmm3riN/fHelRDQYfskiDBthVoO/J
         DuTVCscxgT5JhjiTkBVBGyagbeKwjh4hZci8bYHs40v11LDWpq7iOFsTl/FPWUjbPYZd
         ZWpgxkSWzcvHHJZ75spDh1PLcNULiiFUfXCYSWX7I2eSSILgCy0XfVfOlQsxLr7Ij8nJ
         JX+/MrKQDCHq8VS3KRwUN7TqbX9koSx1zuAg8JTWpQ2BI5ifj5wDJgHa2p9H3UGMnovw
         iTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288725; x=1779893525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z0x04teL0xC69U692R2wb4fDmKgXpTUZPxuDE0l28kc=;
        b=oovP008bG2Tg7b5EOO4XEDry/NPifHc4TOm/IYtVMk2LqavKq8uoJmpNLAvn/qxLpH
         +N/Gvefm8EvyOr0rHwiU4QxMDKgc6vr4bc9WxqsNKaerap/wwCKOlaMuxnFgWod0yoI4
         6iV0+k6Rt9kYTfbpohWky39cuU/XYfZ0sfKQogBsDd/KB4OurNMKCisoajsZefbWe6HN
         rRnt4+W939O1+RiTziqc8RLyGvJNTOyMBe80A/ZswI8KCYO5CJGw44SIkxFIufcjM8uv
         LCf00MDcHPILB/91Wvd6bLfxGk5/E7fv+FWF7kIXTOaVWo3jf1YzjxgFNxALBDe9Yo8o
         01Lw==
X-Gm-Message-State: AOJu0YwgaeNhYK997lm8tYKMDWKUCi1kLmc7nS237T6bCi1bPp2ru/WI
	GlXbSSHGt6/94c45mXRiW8eoffV63j5S3hOjTLliEIgLcIa39XwDyAFWJfc5G9QCfTfrA6k3JOy
	CH4DXS5egcnmtXp/6G4DpNZJgWdr8df0zJvAuZcE+BG2DiDqyCL4lQGywbfQA5ZOsTAKi
X-Gm-Gg: Acq92OHV2T1riLuqvAB650/OloAllyzEwFvKaNS6sbmar9EDkiEVgctFMzMopTQ+EGx
	MJAS7GbPXZe2NtMrO2se9OC+fOzp4w/+8g0M9leXNb1mbuZXhKjShhBAnXjn13GBdbvlngvEN4p
	M8e8FPf8dm36RcUb2xrDJDDRtzRda5Zpalpu9kmVIw2Um/SMN415oC8CiUoZ4HvurdntYdvgW2W
	sBb0jQ1AgLuMRQP7C5tajDbAKZV0w6GmFnKyMa8fQY6skThaMdrqNtiBy1EqBhEgVXD28ufeDkW
	4JONnYQrURr5JRqbJ2l10diKfa9sKXifRGu6rJCDYZnTl/Yey5Nw69dLluqXx+sX+vFOeTxisnI
	6NbgS0J3NBQcpljEyljhzHOuCQ3ec8m7BRJxuAhXOWricqlvQ9+ZoBbrvJZfFN2oZTklmoSn/aR
	4BF7XXCEvR6VVgHVFd97XJxD54hTitGXc7PzI=
X-Received: by 2002:ac8:59c3:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-5164159e60bmr355622601cf.10.1779288725323;
        Wed, 20 May 2026 07:52:05 -0700 (PDT)
X-Received: by 2002:ac8:59c3:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-5164159e60bmr355621971cf.10.1779288724620;
        Wed, 20 May 2026 07:52:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:52:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:33 +0300
Subject: [PATCH v5 26/28] soc: qcom: ubwc: use fixed values for UBWC
 swizzle for UBWC < 4.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-26-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6082;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=o9JUkbRpVoaqtqVf/XyHTRO9fA3cJ05Ua+3YfNy0bNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpqYITPjDh9VNzdWMyu/0fkcO66YkZx3DHdb
 dOvhzBt2l+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KagAKCRCLPIo+Aiko
 1R98B/441iw213VarJMVAPKJ8r4uxxPpk/28lve6J/XN4YKQQTo5QusuGTcB2CM5afK/jeAEBy7
 Nij//lLLSlUdmI4tlFDJoVQEO0vU0EIARxdeRHXzYkYAgM8TnvKkcqfmdShDXR1EGssQdkdKf+2
 N6Di8r+b5Zseqyk8z6LYUCVcbcDXulF7QWznDyiCptiCe1cZeDJL1DddEh9xF3417i9Ohvnz/o0
 w+sqM0E91IMR0kqSZPrwxnWxW3ITcjMagxd5GqoIri6i8Rjet4iVXt6TVIeiXjZ5R0o7GsRDYsY
 mRLYLE9yBfSVQrOOlnBKjePFfYi5PIiCUoQwbcBRGU3ZHbx4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX054iIqLkjguj
 8sUKVOB5eKsfhcZn5UcF4aqzMQAQNXLlge+JWlPChOajtfLdNXMVbHx+tDUvkS2y80yB+PuT1ti
 Z20DZX7Ph9hi7diAOyw3S54B62cSIQA8k1EkY73P714Az8U4uCo/s0r5bUm6J52zcfDgbClVA2h
 LiLxgIddizPGMTjea7tReDJGJbEL2G4vk7N9WRNVfeQcAat/3iAIh9OQiXTypnuBsfYl8zHhj9Q
 sEBqy1Fd46dDy/VOsD/ANTYFwilr1AeSyy7oP7eGvk2NNjhF7EIs9uxu88DsA5ypH223pT2HRuk
 tSfl9N1pyXwvPXZY5hgt7PfG8cOVEXkzE4f+VsUxjLxQSFXI+yknHHqLMkLayJsTEvLzoEq6CuL
 jF3m5EYBPhHvw6jYjEcIqkPQKax6HPH/yw1yA7i/e8zQv0ylscrgQWjbcdDq83UxmmGJ9yRiVpY
 rpyn2UM6MDIhD+/yfTw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca96 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8a_ODPMxA7UucN5sxwIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ef5XqPHZ3VQ-rTO4-ZvVEvhNJNZ1DWOg
X-Proofpoint-ORIG-GUID: Ef5XqPHZ3VQ-rTO4-ZvVEvhNJNZ1DWOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06A71590792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
drivers now use the qcom_ubwc_swizzle() helper, move those values to the
helper, leaving UBWC 4.0+ intact for now.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 34 ----------------------------------
 include/linux/soc/qcom/ubwc.h  | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 8dd91d0b3974..7e321389a399 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -33,17 +33,11 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -60,94 +54,66 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index fee778360ac2..7c9506741001 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -22,9 +22,6 @@ struct qcom_ubwc_cfg_data {
 	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
 	 */
 	u32 ubwc_swizzle;
-#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
-#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
-#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
 
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
@@ -55,12 +52,7 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 
 static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
-
-	if (ret && !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1))
-		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
-
-	return ret;
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
@@ -85,8 +77,31 @@ static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 	return true;
 }
 
+#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
+#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
+#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
+
+/**
+ * @qcom_ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+ *
+ * UBWC 1.0 always enables all three levels.
+ * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+ * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+ */
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 {
+	if (cfg->ubwc_enc_version == 0)
+		return 0;
+
+	if (cfg->ubwc_enc_version == UBWC_1_0)
+		return UBWC_SWIZZLE_ENABLE_LVL1 |
+		       UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->ubwc_enc_version < UBWC_4_0)
+		return UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
 	return cfg->ubwc_swizzle;
 }
 

-- 
2.47.3


