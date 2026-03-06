Return-Path: <linux-arm-msm+bounces-95886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCcKGu8Fq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:50:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4E225788
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52CF73130564
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EA941325C;
	Fri,  6 Mar 2026 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHyqn30/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETtnqHtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED0E40FD80
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815659; cv=none; b=MiUp1eR3UsNB2Ue6925FBIUlm8GiHC+gG/fLGitFekRB4UjvMldLN19+MEJTKq/LF6pYt9PAarg9JdeR7cQWJAk7pJpYcc3XdE6OnrfU+vhfmGK409uBoxSmCalDkrNM1WeToiEB1dGxqdzkFV0cMNZ2xT88uAU7w9+fxZ9hVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815659; c=relaxed/simple;
	bh=T4XlIf9sWC6G5eodtz3g7Nl/H7ebAymEe1iQ8N83kkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rktTQ46ZBfQmRkYK3vfV2Sy4SayFK2hwibBhop0Szo9pOnzu6uCufn6ZCUAqbWO41ZtBmPx8VVEuQlhDAuP5HoXxB7y1Sy861hXqPyhjMyI5V1ClkVFUi0HY6Ai9HRF/+bplWYR9aFc+kii0Q2WTu6sje8Oq+56KEBPNxS9XrlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHyqn30/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETtnqHtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrJj83960155
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=; b=SHyqn30//lKMgHjk
	YbJvYJ4ll9vpAgyGxrgQNSXvNDSWaMUVX9IRRfmNNKHyNAEpA4OFXUaSfS0DiPYI
	ymFOZyRxXCQ9tkv0uIsYhQ1SFRSqEKEtqYGhuEk4pMmQCWiMUTQr8KD3NfcBGQ9X
	/DwkdMpy98DWXY4mNzNVwTOz28E3/rYRtP2BtenQOG48G4iy47sbrqM4QpvG/x4H
	qJyB68zyWfG8ja7EW1cGBAG2qTW8sSk3XbNskmFhyBHvn+Pe2P1KsLUMXdkdc5lW
	nwvMd4gQK6wJ2Zt7zBsVZgINpuENU0G9kCkRpp/+pNt+BW0YH/wa+aC2d/kQ95yX
	/+BKTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9cac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso5942731185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815652; x=1773420452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=;
        b=ETtnqHtSqrIrUn8kIVLSM6GYbXT+oMk0xWBA7ZXyYkn+FEk1kCCDtrz8norlmyeL+P
         3bOheLW4rE4pUV/rPSWqfMYZ+wQF1SxSWIuPTHZBQ86EQ0KcxXYFlT01kZz3vez6QOM8
         QfE8lYK0aZPkJvZ7+4drhqppVNdFX0ZzulMcLFTG4OxKd0ply8Q5WJlt3Jbq7ALmWB2R
         kdeFt/Q+kNelLZ5g7NecX6peyDVe3SYkFS/Zd8DD88kaL5ANTZpjovM8abWWxiiVsqJI
         hKRtFG9PLoq2Isaujv2bpsZnwwyTnteQ4CSn6UQApbPqwIZ3+duD2xy/yZPB7tUDL8hk
         FlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815652; x=1773420452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=;
        b=JwzD2wCCuJXA5eRPy30RZc9yy45DxgDnxZn//QsbecRLf0jRsjCodpfKU3TzkKQ8kr
         e8N++WJVHhWdnwfOP3EKxNKWqTeEUL28giydLBCNwdPqsHINTI2IudvnDdRG7V3vEjy8
         +XzrSgYu1KZ19aJlp1aFYoRcN95r091/qbUL3lZ2r1T9lQYBFbecvns3HdjRG5h4rDTX
         2ZqHpd7msPVmMQQVWE/j2IUphKKpqehoyPm0ZkNeaMGz6HDy4VFZXDh1m2dCsgr8jKcD
         PCNkIDMtn5Iy/m6qvtDRPZOISONBfI9ay+1Q1g5Fj9LSakq5/tkIjUhWzB6pDWsQWIzG
         uA6w==
X-Gm-Message-State: AOJu0YwckqmIRSgR1mDXPOJ0Sa6sx9dhEHsOXHbj2tnj+aCVbZfcVi3r
	iuTXR2zKfz7LXJeqXEdH4rk9d+muGFJjxaYir1/j+3A8oqYaJAECSgKaR1BTMaDyM4pOKuba2Wk
	sA/3z9n1xVpAH7rRgMoavY4AbUkeC/y3woB2mDeYEesqjaSvFzwpF9Ad92be8lEyqVpQi
X-Gm-Gg: ATEYQzzcaswUEbvU2rB59t517HmLmKxbe1Kd6FOlpi945X3qkTTxZm4WnW3lfwQoRtO
	Er+RvY/Wx5sOeBEe/1pTv7ONllT/GkYo+9K5IjhfE/0XfeAAa0r8IEOf6j20ayfGjRshX2378VE
	BIIrtZxGKzqgfO8xLZWBD5tJSayTh6pBPG3Um7s4sfgpB8BiOjpE8BrHcuv+IXbFb0UsHCZpq+N
	HaECvIszpZtgRBDiB7BbeTIoRot+wpF3L8FL1cSNj5H7FP/jM7WLWWTl1X/AAMkkApW0cOBxTXe
	8HbBXWyPAa5K7J6EFdHlTyaU2ZUzvR7g/+jDWueU9qXihc6ehKncicS8nnC0wZqjUpdMu8adY4W
	aTzNYzXqB/jD1C8VazOWihte6a1RfITJWfwlmYIIuK/jP/s16eJoveEy6+KSWY37inFzNqzOC4n
	cvrFecgWxNilSHbFxwyGesAK7nv9s/NzkEAzI=
X-Received: by 2002:a05:620a:f03:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8cd6d3d9183mr369894085a.5.1772815651578;
        Fri, 06 Mar 2026 08:47:31 -0800 (PST)
X-Received: by 2002:a05:620a:f03:b0:8b2:d72d:e41c with SMTP id af79cd13be357-8cd6d3d9183mr369888485a.5.1772815651062;
        Fri, 06 Mar 2026 08:47:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:16 +0200
Subject: [PATCH 10/24] drm/msm/mdss: use new helper to set UBWC bank
 spreading
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-10-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4XlIf9sWC6G5eodtz3g7Nl/H7ebAymEe1iQ8N83kkg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOCroA14RUSjBXpDlMJpG4G9tbOzhXJ7jnX
 AHTxgYfdp+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1cCLB/sH5fdyjgJAnBqdlTRluLWUCiX+r9ZILouuB0tLMDmHwLENSLGdiFpafUBOnwRtvXV4sS/
 72MZ27DxVesz+OFeul+RrNQCrj6YomzTsVqIeWRrhmUulx/MlLuCrgyCTCSTBJYDVMRWPBJYaKb
 YILzDE9wkXQJf2puwhieUS7rZ9MfRAy2ZcwCwJczI0qRjyk4VJmEq/V9fQN9hTfeH0mfiwpaYcx
 uSwIQOU27/dhRM0QJgEcaqZQE5debAvAgCA9X/BdgFGByPzRxtdhJ9wA55scqELFuD0FHnpr7+Q
 zJ5/2s6mTr//sVQ9Um2aCrUz8D4Pq/f3DCPW0xHH4TQkz2aq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXyGtrqZD01vTk
 R3OAYJV9ISl1LtMkv0YTx5kUrRjzcyhLdvJuwiMCpkRt/7HQVuMCfRW8ZwsZGPBqFNtdCdmQNEa
 fu1WWOheVMxuzE8ITcrfonnB0xg6vsvP271PhLuS7vJdznIuR8BondfdPc4GdxKDnC+ZdkigsyW
 1XRyHDvlykpgU3OaZt206+lMVD3YNLt7p6QklxWLJjTMzqCYUtd/xExDEv7HGoOJPxIG3htZ7ZA
 lV9L/z75RKtLZpBBwGDeQoLawh87Nx5pRQ0+vq3VF9FBzBK6m4mwfpibX3vMB+zocxHBAG4KaQ6
 JDNnJef6Kdg3cUaH5pU1qODW26vs2BtDszcISjRJY1frH8kSceaaOREhPLL/8eTSJ5qu2qqj+3u
 7aY/cocB6UFWAvngsnSe5sCTqnr/P0leDMP88KWE4yCb7A7B4BM5L6MgKx32L56MoDopmSsba2H
 wIkr8Y6/UiO/+tF2zAQ==
X-Proofpoint-ORIG-GUID: f1Nj-_amDCEfyktmX5BT56IX-p_vlYDb
X-Proofpoint-GUID: f1Nj-_amDCEfyktmX5BT56IX-p_vlYDb
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab0524 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: A9A4E225788
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95886-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.927];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 41289606407a..90a4b579776a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -204,7 +204,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3


