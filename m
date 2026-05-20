Return-Path: <linux-arm-msm+bounces-108808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO6vOH7NDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA0590723
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E297931F6C91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5F73F9F50;
	Wed, 20 May 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7lGl3pm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nr1to+a9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00023F65EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288723; cv=none; b=B8V32LIb0TU21Hp5GD1WlPeW5BpWeXjIjLHS6Fc3JUM/sic5NUI7QoChHgxLPFPiJF2E7QkvnGBdGY6mPBc7Kdu8lCVTQy3Wyz28fIpi+gTzK078YxOmCqzLjeo4BQ8YOzSTS1gT//TGzmTFUQgCOdcvmWXFxAXGRfEO+hEUJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288723; c=relaxed/simple;
	bh=Thp/IJnKPd7xQIcLEgMC3qoCNBhsyqRUJiNUBJx6MWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqncKj4ZGWnJCnSubuxIE/tla/8BtsS6W9yeMJlF3oLyFtK4BjcDRrM1a3pOvPbxA6Q0Mt+Sk1zblij+Zgn5RAvnW7uVlI4Nf3SSVvNBruI03lzoHXJHRtu+zeOGRCQIxYqFkcnx7pVSBhgh5O/e0MCMBY077CrHbG7Q9ezmgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7lGl3pm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nr1to+a9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oPID1177884
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/qLGSxqXwwwVGUcv6G1OqxzPF06V6e0wxfns8XSMAw=; b=H7lGl3pmZ7DeVKvR
	t3KyEof3XnqrMGQhsI32Y2hv86/XWqFckrOLv0sG7YiftZpm16D2NnX3UspeXRPX
	jf/Ca8aTn+nfMJDz+zo+WQE57IsGXW5CHm+Dh2NWxORBA8mfkQMvCBF0nKerflDQ
	zrI4ERZvF3jkxeJA3UswS8zfR0o0UhTTZmLOAcMs9hGaSAPFjd6d4I8h2/8HHI3m
	NxRiqQr4c5VwcOgD2mXHcpNO/2gTg4VCZZ02QxhXlftK5SYcc3BXGIpnCQU5bPXw
	Ch5ciyQizL4qXzelVhm1OfnEsVIKnaMGLx2tJgkOdA3W2GOUNcMA2+KjBRObzpZx
	YzEjQA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6s3mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:01 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-958a0e94ff9so1653658241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288720; x=1779893520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/qLGSxqXwwwVGUcv6G1OqxzPF06V6e0wxfns8XSMAw=;
        b=Nr1to+a9HI3GvwnfLegzO9ACey+wKcryDFPA0qT6Y/qTebzLfkSopxAFcwgDEh9z/X
         5IwmTtIw6E+qayb/AMSDAfPIC01HYELJOXbdpxrMvBR13/ZJJi28rOTT6KVrvikVbQFq
         /6WCU9SBkTkgDqVwKIeDXT8LATsYFYm/TgTliJXrwrd8QnVAe23hTh3kogLq9Rb+sKSp
         kx0P/MVf8nwmmqPf2t33LAO6Hig0nmqPQ24P+/RGgrh5pJ1rxF+CVAoq9W3J2itKp7Fl
         gi/Y5tI3yezNZoX0qoa6MVbIYDfngQjHzAXX5Li6zrhOxsGoAkuakOpGuFl7MweqQQgH
         dDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288720; x=1779893520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/qLGSxqXwwwVGUcv6G1OqxzPF06V6e0wxfns8XSMAw=;
        b=CbVZP1di2l+aEeP7FDyFWcLA5SWgDhxkAiVhsy+4C+6QuCrL0h1tH6FYFjKmbi9MwC
         X6UEGp0XIa/EK3B3q0J1YdDWsA7rZSXEZxpD1N95r852pZbKkRxjF+g1sWYqd9EqBeZJ
         qjm5s08SceRdyfRas6+hGbleFUTMj1GfZrgY3ulk8rqt5mn3sKw7jLaGc+Vf0c9HtXjS
         j27CIJ1t+HYe9Z3oUhYiXdhKCgI4pBzxZImR9omeWbV5J2peV85AqwTCfj8MKHsSRLfG
         iUpve2LC/H1F1KaK2JXZ6vu2/dVh+VZjNZrEp9zooL+AefGtSl3Jnl8c187XtKvnYVLV
         Zs7g==
X-Gm-Message-State: AOJu0YzelsNrddHzHvMRQx3MK7RwO13XbCjReXW/jBTQVbME+ssCZ7Gp
	s6TXpi1Iteus9bC3EefEUttO6x0LUMLRqsP9KkkwahJHcUTSvqcysUaE3mUlQsa04Vb4xKhXTCf
	Gr0naKDSQrJ4bTXdkibyPrF3hLBoAqnP+HMpcrWQR0IY4JXBZJtslLpo3weVsIw4iOeln
X-Gm-Gg: Acq92OFVl0cCQxubD1l8b7RVGe4Ybb24t7eycAZsT66KcohpvuFBFYcslY2Afr2auTz
	VY2JbRJQMTukxoeuhZMGGu54f9EbWBuwDkGjpYr/IAaU4HCnUdKy6Tn9RkmFTPdf+nBYrwLeq2H
	xf9EMkueU5fxJUixmlfwI9KXQScC/JHM9ZXz/hw/QXbk7i+h/vjUaUdLRuFqhZuGnQaMs/vWZv/
	sjRKBQwkQnVpgkp6jDtf86OeHoV1oL0gCUuu+XakQWHcqhb9vH6L6nlWvvZYMDwXX09i37w66dc
	FyslQbqmc99XBKjD+kxqzgxoJbPLjsVXwOMfiMDAXACv0b75aI9UH2P2x34pxlypv8jjs8ESfAo
	DeTAGgA7Mi2ORoIawAH/BwYG5xG/5b5EySq5yk1Do0kYVh8y6fwAxOymWfoKOxoGEYkBspCrvaG
	T0FQ6DzrPKiQXtBKQLiYvGbD7yCTYq0dkL5f8=
X-Received: by 2002:a05:6122:4006:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-5760c043936mr13265755e0c.9.1779288714763;
        Wed, 20 May 2026 07:51:54 -0700 (PDT)
X-Received: by 2002:a05:6122:4006:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-5760c043936mr13265675e0c.9.1779288714078;
        Wed, 20 May 2026 07:51:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:26 +0300
Subject: [PATCH v5 19/28] drm/msm/mdss: use new helper to set amsbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-19-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Thp/IJnKPd7xQIcLEgMC3qoCNBhsyqRUJiNUBJx6MWM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpoFFRI3WyfXSK9O95QsuMY1666C12cCQb7a
 cD/xKpr2YyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaAAKCRCLPIo+Aiko
 1THkB/40gP3ZEmrupD44oloIguqfQaB2fi4+QLN1aH7nBjip3cOq11gm87Vp0WFIBe+F9Dbr2ik
 RVv6dOM4i4vQtKJ9cTcnnrpUDyQFZHq5Pad+CeWuo2vAD8Bt5haj/ZBFjchASZelUuXKl8PUXfu
 zpy8U2ASXM+rLmn2kHEpIXkGHzy7b8fQVUfVOU4yPB+HfwVdM8QbMEOnURihVImmq7/QS4Jz3R1
 EEz+7h3zF6EYtcNle3X1EFHhOE8f0aH0QgPr++PbXeLi4HkLc1qUMkc5Sx2yc8r2c65k6HOOSFB
 Toc+jMm2Q6gSRXpf/0kW3+gsX4yScm/XS7COufOKU7Kn80IR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: QPnmJkSis7hrt0jnK4sKopwLSE2NJRUF
X-Proofpoint-ORIG-GUID: QPnmJkSis7hrt0jnK4sKopwLSE2NJRUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX1n8VuzvCjtnr
 fGZRZxCILIxThuuGsNxYKdH6ArQ6nvm1kr8H018VPtezUShTW9iSmAKZb2225n3Rrd1BDlS/fft
 ALQqJEXXD8yOXQwhPRyWawxoHqfel1N45/0R+V0D6e98tFpmYOWDN3TIlOtQnQlOYhrOUgHDfJh
 mVeGsfSrECBugbXMIQDGxli0+/jgjZG/Ur/0Pn02uj9xVb8kZNonpPkCBvq1Ly7tI6Zi3zhcVT9
 7jJabzd/DWuahHn4kClchrGJe6TvVYb9QYc987AlJQUoikPhKNrmc4YiIVR6aXq23gLfC55GEln
 NlBtkruYhQEFC6VJNS6CaYoU0IK2kzz3E65ALHHEAXd2XKVesT7K22QLT+CmFMUzZqSsYhYeXuT
 Fv67/OOxLTPJ8tZn6cwsEPadUjv+KhtFjASD26YQwLuhkKeqKJ8Ee9wIudEFBO0FiLNZgZwWbHa
 7DarcZ2YGwwevagsXOw==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dca91 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=o_KNKqYLTMeQBHdYLnoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 57FA0590723
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of checking the UBWC version
directly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 3c1f04f12c3d..4b230868ed90 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_3_0)
+	if (qcom_ubwc_enable_amsbc(data))
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


