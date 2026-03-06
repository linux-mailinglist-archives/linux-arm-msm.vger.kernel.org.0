Return-Path: <linux-arm-msm+bounces-95898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBC0Bk0Hq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:56:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAEF2258BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB4B331BC31E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB5A47B42E;
	Fri,  6 Mar 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2f4iqvG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXvmLpah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E327243CED7
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815675; cv=none; b=cQaVSyS7eOkpqSnIGsFHq8jvx0kIunbb55gO2w/+/nmtAGoCTx1qxqhZ07UhidOUFJbwYU0jAI/nQOygR/IQDyNyx+XtHV3o0qEaUWKryjhU1v3shFoMZyq5fPAqlj5VNFmkz6QHSv5q9ELHyEXUHijNgAQTvgowV98QqtHPvrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815675; c=relaxed/simple;
	bh=tj6XzNi8kmutyETp0LxvPkXmIY6ffqvxy5q//a2BCA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UITdQSba176KOvijXpKrRCe1MtJ+08RH3aw2WGu1t0vXJjYE8YyZr68icynzmenj9v2Dij2BhcepAx4VJaeCamsYEB2cOU6NPZG43EwKnY97xTKJheZQFW9Cuv4gykUNyhW0XxJFpwucrxaa3cFv7HjDlbVKlsRUiSQ4ywCyHmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2f4iqvG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXvmLpah; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrEO32008825
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vA3WhLlP1iWl7UcsLAeaGw5jmPq/306vzHJjVKcA9Vk=; b=A2f4iqvGh5/XTNxD
	4BsQ1urPOXzpo2jJkDEyA+P+E5+678DZqJB4tOYGf2b6C2Lc3HtfdYVByFj9uvvh
	W2sHYGapgvK8Za2JHW8JEvi9eKAObnJjbxpHYPZ0ABbuVu6QQbu26O72MG0ElRx0
	YIYMwoNVWxQWMO/bwt0TNWwK1X7ONAtpNgHIpdnJVXuXGp1Qd+UTxdIGdEb3fhWy
	64wETICqqpcdy8U1f0EGhGuezmIl3LN7mM2VqXqj0EK2wR0xKhY1Q9ooe+qMCvZJ
	n+YEOzdYbpdLA7/LF/8k45G4euVRIWQRbahEIBQ9S22oCymIHqmGJHE+i4Hg481k
	/Xly3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahcmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so5928057785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815670; x=1773420470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA3WhLlP1iWl7UcsLAeaGw5jmPq/306vzHJjVKcA9Vk=;
        b=fXvmLpahdqlSYQ8urhNdcBfUeoQIN5KW3ZDMclHTGUCfjwkVwuvRrm6x3SNBAS6aZC
         yAdq9lqbRzfmE2YvkK0Py5YKXgo+8fSqdptldtVXXp7SO13ncsEvwgtDn/HQiZ2NGnEr
         9OtIwS75NbG6DRA/jxkhkD3CIxvqqv5CgiuIJMkAch28U+9tKbEKgcIl1q9wXr9OU4Kk
         OCZtihUO5DtPGbFcU2RqfvG2n3rn0jjY2kXPDyS9cLJzePUEX0WCXqfuQvJzORKjfkHF
         Yx+Ese05Z4ttTSGZsGT8clIs6v4PLrzOUGkTsEpM8Gyxc6/AdwC+Wno3PCTWO1LpjleN
         0pTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815670; x=1773420470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vA3WhLlP1iWl7UcsLAeaGw5jmPq/306vzHJjVKcA9Vk=;
        b=FQyVhGCu8VcZ/TguvYHZE8wGL72JTx0/QaEaoFYl+sKXTtIqO/0g/uyFwhr3vnRFvA
         6+xY1/F7IHOPDPvncXX0YL318Lcl4RnBOK6lF/RJrMEy8C8EJIh0xDMqc8MnLp3rl5gJ
         Sjy31dJymInhUwfV5xVffyC64yA4mc/RqTluAT6+aTXJeb6TIQUZ5RHQklgHnanzYQAk
         LOZFxA8b5Z/O59vs2aX+P13Qrn6hMyX8g8GlM8LvYeVDyETSmv7ump5L+6WT0iYC6SGx
         rg3jgq8hHrzV7Q8/2cWjTDcX5YZa+gDE/GgD2UIBSrBjnpAtNz/eh4JiPsnJ6HwGf92a
         b4Dg==
X-Gm-Message-State: AOJu0Yzax0bCmka0A/AJfwXTqgj9HtzWpkwuusR4GP9HklYjS8G37Vip
	91IzPow61ww3O3Fpiha74ssOnOoFBkZRbwZGC/dLSg/tceuD1zEOljpzlNlVO16bJzySjsbvxse
	gYSmKvAPXxZeWIl1OcclHfCpxOOR3VVnN4uJdCETuHEncFdS1DVnb+zdoYCfxb+40Ptcu
X-Gm-Gg: ATEYQzzRKOluolymuCLs5eyw0SPL6O5UJJ6PbvKnaUpg78DJnQS15qW82eCQI+ZRDlU
	G8jLXcjdcUsOES1FusPCqz29jAKwc/IDC+dLYOEUK4ALYcpKkmlbBox04knAyiRwg1JFzoorOCU
	eG77dMBp3FpZdqRY9M8OETO8lGso4A6T+EXYy630l+7AGkO1F9fuWg3Kl4TPTJ/klBbtiCKx7gS
	wsp/XkrpYjtouIDSt+qf0RjjNAc0S4GnHaGhj7ErDCmWQcyiUC99Ni2fImnmvGQCLqdUyBN1aqD
	1MS40R4sAVhw2zL5Ftxw/phQdq6B8PsIBaXOJPUNQ4gLQV6RHrPsuZov3SyWDa5YABfUYMNHCdT
	1DXX8Q3usEjORuF52FK6tvF16ObqD37ZKNbQK13FWkXmzqejbjSAkO2UUh5TrUxi2cEKEd/4xju
	z4aVANlfdKbs03yrUqqH3q8PViG/oJtUXKveo=
X-Received: by 2002:a05:620a:1a2a:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cd6340944dmr796463485a.6.1772815670147;
        Fri, 06 Mar 2026 08:47:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a2a:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cd6340944dmr796458785a.6.1772815669559;
        Fri, 06 Mar 2026 08:47:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:28 +0200
Subject: [PATCH 22/24] soc: qcom: ubwc: use fixed values for UBWC swizzle
 for UBWC < 4.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-22-9cfdff12f2bb@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5938;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tj6XzNi8kmutyETp0LxvPkXmIY6ffqvxy5q//a2BCA8=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGmrBRDIinuB5A3uj3d1RagdnQTSCFpIvCmm/XUFw1DrPZ2uS
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpqwUQAAoJEIs8ij4CKSjV4rwH/jRY
 pPq5zx6h96JKw20tkm5J1a3/9U3wAxmnVKSgEH/W5IKGN8m2rXObPKmsT0yndu9ogJ301zVtdLZ
 l+exOi6aBj24x/cd8Jv2uni9gAkcFJBtZ+McTmRJhdG93gaA759YowzZXt4KaSQu+Hy1uADwPEG
 GJp7IA1m82AzotujR36vroGpqziCk4Ra75MquvlFwjtz0TroezsCvghusAflWjX81jV9rxnI4oW
 VDQnR+I7JkxCWgA5C6sE4LnKV22oeawjA0+p6K1RKl+dbTGjQSQQZo7Ccpd986sXAy6yOBSFnfB
 UdnxYzutczs/Yl0/Znk+4dNtw0q0JuOoc3NYzTw=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mOkZ8jn1faJHDVRxRlFjUQHZTPFbS50Q
X-Proofpoint-ORIG-GUID: mOkZ8jn1faJHDVRxRlFjUQHZTPFbS50Q
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0536 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=8a_ODPMxA7UucN5sxwIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXw9gBlPJJcGU7
 2GGa/TIi/SsjtNAQhQX3E/WXoTgWGWnzbDqPFtOqENUSGn7JZITQWyjFaM3oXGwjQx9tynq+0kq
 AcQuCNZUZtF2/E1H8uGX7HMEGk2ltEtKKMSlkO6AEUCdjACld/Wt6Fi2Emg3siYyUAIeLuScTS6
 QZNY6GV1uJfTOg5mPR5Kfx8IwOyOgsy2N95ZYU729OgwxGQBL+N4Zf3eECtdaFiuUpFBBASbPgZ
 ngmwdKvZuIh2q/L2VgfylnHl++fzPxVQM5Ujv8sh8CXjuD1n4pzGYvojgTxnNcdqDRqIIkJwxDO
 kKW1h0xAJr5bIQdz8p8wkifdV+fDdrdKiCqqmOzuxllQv6CPyiqp+WSen3QKO6c6F/mi6EMdMrf
 WoMn5ztYWL2t41ryR05qfV8wxH1aDdroooTjqRHAGav27B9HoIxIiVmHtLYTlGBKY/J9116/hM3
 Y03XWwsEHhliG2/58bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 6CAEF2258BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.937];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
drivers now use the qcom_ubwc_swizzle() helper, move those values to the
helper, leaving UBWC 4.0+ intact for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 34 ----------------------------------
 include/linux/soc/qcom/ubwc.h  | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 51de36f5f40b..49edfabb5e18 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -25,17 +25,11 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
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
 
@@ -52,94 +46,66 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
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
 	.ubwc_enc_version = UBWC_3_0,
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
index d4a0cfb133fa..0cbd20078ada 100644
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
 
 /*
@@ -88,8 +80,31 @@ static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
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


