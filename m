Return-Path: <linux-arm-msm+bounces-97244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDohGczBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:38:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F175E272BB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 679FF308CC6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2638D3CEBA1;
	Thu, 12 Mar 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGd+qWBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMQmzaDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77FF3CEBA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322216; cv=none; b=NaKVbAVX+KRvYK9ecZfJ5/vWKcv5Ngx2OX9DNYM4mAN/sLdQxS3MMxY5VuSo91b0x3bIS2LBLI7HBXrHbVZH4ywW7Yq7+S0eGzpKzZpdIQJ8nKJCnKFYiUZ7UfcnXY6N/51aNBOdmhp/SFhOsehg6TwW3iXbXFWuFeaXww24OzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322216; c=relaxed/simple;
	bh=9xPFzWVLRFmfgeNqqZ9JTpL0iWalU/IUqVUpgLOYYOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi+VVwxhDI7efH2KzFnNoPLXoGG/ums13pFrhRvntiO5Tgj/GKFp0SUw+MBJk5NHcGVm3p8a9CkmAwRSX+DDB/Fn6aQAZ/XWyk1QVf7n3JsgjEINjU7RHF33sE/DrlCwofqdSSSFXVMq4oQPbkAERDbRkS5LzSnS6Z2ym6pE4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGd+qWBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMQmzaDh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CD73e21740587
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/klMbCQgdLdWjO1751+IWBTzeQwDqi/QBK/fyMDd48=; b=bGd+qWBb3YxFjke3
	zeDscYS/bkv6qFoDuRRvqFQ1QRKBABn8lmo2ULCw/os+bx7U/ZpllG8RXwU6EUum
	ZYvzB0dOKXUKDNZPoqU7nAGHdyfuYBMVmuJ3euSCgaJpa/SfNOLGDuP3JbIoMBsE
	8Ad38gpignF/yg1imUF5+/dZvP7c/RdCVVxtE7/ztGBeVgOjibHt7MzsfIAgMtBF
	7/OtwUxMQVQzVourN2Mlcog1gJUKNGWB+7lEDXV08MGriRfe6OTyNlBENbwc5w+N
	0a5St7KGDau8xz0QKm1V5ml7Xd97SrFfUfhIFr8uYCvNZ+jhrJ6Vn78IEjT+Zium
	xhjOfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdhjvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so451572185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322213; x=1773927013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/klMbCQgdLdWjO1751+IWBTzeQwDqi/QBK/fyMDd48=;
        b=iMQmzaDhup8PQ5Fd6v5yAzFxX1fB+g8fJJnJ9YuR+5f3CZws2sq4YkzlXH9LruB2A/
         gzIOZ2nxytf33h/VHMNpJoPOJo3aYlpyjCMf8x4VfFJge+rCcDvubuRWPqf5+27T2+0H
         GzJJyASLUlEqtFdtX60Dj2k/TBMUuI0NRPJFWubO9jcbVgL0726788Zd6zbgVTZF0mRb
         bipTUn7VwvcqameZUvpumV48+bUbCGDXCUkglEVKygqhRvTtqfrG3B/nWr1z9foo8pgl
         HVpUalfA8fWr5Ha+VXY6wNw0l0Kmwz/AN5l/dimH2NiN/wXnBoSJjcYMwoM+cMSY+Spe
         lzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322213; x=1773927013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/klMbCQgdLdWjO1751+IWBTzeQwDqi/QBK/fyMDd48=;
        b=jCI36qhN0t6taNfVmVPs/fLjWMZZ3XjnxMSjseKVeVrtZbuBmayjpLEJWWkURtEhPZ
         OpssSanSXWO24fXw+Ujoa/CKH5F9V7Me020VSYBRqLL/YaataSKH2eInFPQkg92YLY9b
         HI7OH0MKMQtHEP4vNUZYo6ImhBJqMtwb8AnGJfaEN43rK6Kc2cnErxq3E5HE7V2ipc/C
         kG3UuDQxJH1F/26IlzGlohFETHqScZcaQ2cHBcnmlnWxNTX6PUd7mYvM8CtD05HuktUG
         N7wt6sxhILIbH0/MORsBhARduXj0W3rKtjThPGBt0VNAxG+hyOgDAGE3JKPqzdE4vqFt
         iOew==
X-Gm-Message-State: AOJu0YzA2H1sWGO0GAbl34NbQ+YO4KtIuFVWf2idhEBgKk9rwoCAfbW7
	RVltXqqOjSDZKC02HBzmNGK3GIB92rrZ6zHNMWgPo4SqS0BLH8iR9WhyFlf8ahB9+VI3sp/f9PZ
	nXNJnK/wr+r1ZUmWOXX9CSrDSaFy+OSiUosHMD4e4HYp3si+0CYT/w/ubKKyVN/hYN8dM
X-Gm-Gg: ATEYQzzlj+hCu2RpLZefkE/kxW4oPxUMwq1Uz5GPs97be84Xs5vZCl+aAD76BfK46LZ
	sr07WnsZGLkLxVomaHE09MWRgfnDmmOfwOD/nn19EV4mFJXlkyAtDWg/AUqAtnO2OiOXSt4l5Rz
	PyZ6Hm7v6cMCg5Zsn4x8W6Rccjh0RiPiHqxtKYT0wqQF5wG287hJ8SHgLSkNiM7Aj5OmwCcgM0X
	D3r8HUtAl7zIdzQcuYVhUKNzXPaYmSy300dr3WQNxepvQqp5/L74bjVsrOFHwDUgfmB72g5NFIh
	hGOFoPxvVFZvQAin3f6WgFCWeFbE9zi3IKzyXpQ83gg4qmOMGSgvr+3gzYLYT0uuIoZgLjD2jpD
	W84q26AXloL5MsF7qktnGVRMBbYmxC4HGN99t7IAXEVQhHXP+RWvSte9Nl9pskc0GY2scWJkv69
	PFJsbjR0csZPEiu73EJAjXTUF/x9aEBcK7h3g=
X-Received: by 2002:a05:620a:2904:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8cda1a573a8mr745271185a.60.1773322212420;
        Thu, 12 Mar 2026 06:30:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2904:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8cda1a573a8mr745259885a.60.1773322211745;
        Thu, 12 Mar 2026 06:30:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:45 +0200
Subject: [PATCH v3 24/27] soc: qcom: ubwc: drop macrotile_mode from the
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-24-b7e8f800176a@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9xPFzWVLRFmfgeNqqZ9JTpL0iWalU/IUqVUpgLOYYOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+4LUsSvH4sjenVhn7VrVZtIYrQuV2Gh0+9B
 FVI8HvG9M2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/uAAKCRCLPIo+Aiko
 1RTxB/4i3hdCnEqI/ozB7uVVvC3euL7Lvvknpr2NZT+xxG6t+0Z4yxnDeFwBB8kqNY5rkTDQPAW
 p+lZshJAduE7VfDn05bJfRszX70+JAbB9Mj9L64/N0U7HW9C969jJPHqScg6P8GW2fPKCYEuk8g
 sBU2Gff72dQMVAcDpfgJ8CBA2XywwA/nsuWwZJk8leJZA5ZOP2MbSNoWNNbbBtkcHWEh//FWr/C
 uM/gWuz1DiQ279m+ABpt0+j4paFfIqtAZSS0/XqH1FFFuXAo9MZ+M+eHqOayMyvyYW4fzsajBcO
 8sAJoZ3pBLRdCUXqGzpBUnqWHyP/hR2kAXkuUyo+tJZqYLjy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX8/BuUURCKawH
 NR/RF/3UQpYY7Wo9RbV4eUzHdpuLEA/8ciTusn2gVhEQdkv+/JqBMruGB0XBYYiJZ75/5/h/4ea
 ijlgnkm2esDoxKwopF2kQSmCqZEHHQV70oobYZVvPZNhmE7PIL8syZlgU4VKdZL3ZLYCju0Z7og
 rVmYL0zkodONyF/eCEw1k8VDjHDNKzXNUo34fTaL0P33i15rndQcQtVBG1ImxQHhhVZQYM1905W
 AxexxPYZxyBVUpVrNezY1U3MwdzMGpu2I6fMSUa9k2i3ycJgouk9E41uBWmtuB56FXhabBJlt7T
 UtVD/PqC54xPGLhyZtYpoQsJ5jByfZk54uNFalUtfk8wqNb+ZeDXaWwayu8kpWyT8CqMjjVPRuB
 GMJ9HRLTGS3NRiR67XrVZ0lhciePkirlOVjzmZiMkN6xHme6RvNncHGUD9pEo//NPRm+s+CsfuZ
 wkhK/DkzcG0sjsooQqg==
X-Proofpoint-GUID: C6dyVNq8rfhw-PSBkrm8zY0e_kTLOna6
X-Proofpoint-ORIG-GUID: C6dyVNq8rfhw-PSBkrm8zY0e_kTLOna6
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2bfe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=lOjMx_-Oxa8n0LcNG1gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97244-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: F175E272BB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All the users have been migrated to using qcom_ubwc_macrotile_mode()
instead of reading the raw value from the config structure. Drop the
field from struct qcom_ubwc_cfg_data and replace it with the calculated
value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
UBWC_3_1 (with macrotile mode).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 15 ++-------------
 include/linux/soc/qcom/ubwc.h  | 18 ++++++++----------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 070bf97e134e..51de36f5f40b 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -21,7 +21,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
@@ -49,15 +48,13 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
@@ -68,11 +65,10 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
@@ -80,7 +76,6 @@ static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -88,7 +83,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
@@ -155,7 +149,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -164,7 +157,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -173,7 +165,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
@@ -181,7 +172,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -189,7 +179,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_swizzle = 0,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 254721f5ea3c..fee778360ac2 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,15 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-
-	/**
-	 * @macrotile_mode: Macrotile Mode
-	 *
-	 * Whether to use 4-channel macrotiling mode or the newer
-	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
-	 * 4-channel and 1 is 8-channel.
-	 */
-	bool macrotile_mode;
 };
 
 #define UBWC_1_0 0x10000000
@@ -77,9 +68,16 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
+/*
+ * @qcom_ubwc_macrotile_mode: whether to use 4-channel or 8-channel macrotiling
+ *
+ * The 8-channel macrotiling mode was introduced in UBWC 3.1.
+ *
+ * Returns: false for the 4-channel and true for 8-channel.
+ */
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->macrotile_mode;
+	return cfg->ubwc_enc_version >= UBWC_3_1;
 }
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


