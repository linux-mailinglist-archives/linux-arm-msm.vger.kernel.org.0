Return-Path: <linux-arm-msm+bounces-97235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NBmBOTAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:34:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D941272AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 684893050E77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1FD3CBE93;
	Thu, 12 Mar 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrGJls8F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcS26SXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439BF3CBE82
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322199; cv=none; b=L34iN0lZ3paqSX7lowGbwVaxftbH5wsgjdb1jPu6jYBqCSMrWj1U2AahyfptKFMRc6vvmBRGgMX9BRKqdiPohPXajMmOzB7ifL+Jvn8+WGh8ZW0h3MY/fl/rEHT1HHgs3wmW/IRkRsfqd5NRN9+HPHAfVaWl2ZVmVMO3TJOR2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322199; c=relaxed/simple;
	bh=CN3kZ0/IBWNiI5YHIzLGKD4m0aY5Oisezj7zkRehZl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=unBl7KbwrJBD8hZOy5PRnEkP0+ts4F9sqCxSVLpZqziTGuzrX6nMLZdwYW8d/sgqQ93awNgEiffe1kM0hZtilk8KcgvxVwMc5RuKJ9zmFnty0YDh0pLasVwQjbJHRAgd3MC2m1qRmk3hExHM2qi/6Eo9cC5ExSUpnOpgUoXILXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrGJls8F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcS26SXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAYXPo4027231
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHkjxAifHisAGsBgDLIKhhx6s1dp+Liwk96nqDXbhiE=; b=nrGJls8F6+SNjwuV
	UpZi9Q2c5amWPB4V7Izz5ZPeUHb81ExPklqbeIJ5hCi1qUQq9VZ3q8GS7+vtzpL2
	cCgIU6uWwI4/zMUcJXVHkq59uLrdAXl/6j4bvEcgB2/bdqKfKOG0FxXfQ+KmgGXG
	4xTGUeNcdyK2e1P9mf1iGLKfeKdkZlxImJuBUKi29cF20ZaYX+IQ+zJSFr40hOYX
	zN3Hoh3VwFDUpfITXhFdIFNipPu6TFAgBfebTDuK3VGGFdQ9EOKJa9+UGxlwC4p6
	AhjN1xdLIgT7s2Q4q1Wiqzl//hegv2daKtag1JP4W4GDGmjUSfe1Zl9PLdueAK4N
	NzsY4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54t5tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so831113285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322197; x=1773926997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHkjxAifHisAGsBgDLIKhhx6s1dp+Liwk96nqDXbhiE=;
        b=NcS26SXPyjlnxWfrRObQED3f1aWl2DXmF7QpSP1Tpx+Jr9WjWNOrcrdcoNv8EYraLD
         cXI7msUKlGsgKmqW6e/H5v1PmE+1LxCLrICt/99V8wZiWureJ9UpsOwvvS0uy/3zaeV6
         SVA0g+eRO68lld4f1cX+TDgz9toMMf/44dRmU6OQ+GHUngbBigONF/9/dHnNEQ513oZK
         boJRFlKKQ/eS4RIaL1ZLOf2pozSk6n/tXxKfFzD8eI2tIo2jIDyda6T8qOf665rQdrSy
         WIsk9PI0WaOZVAHFLAARtrDKY9kyik5DpuS+k1lOygLhAy3e4tTMa/e/2w18q14GiH67
         VitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322197; x=1773926997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHkjxAifHisAGsBgDLIKhhx6s1dp+Liwk96nqDXbhiE=;
        b=IabIhCN7qNZJY3A+wN6bwQjBgWf111ohG76WV0UJzXci4CIFIW4vmqnJSV9eZQZ99x
         yMHsZkVFuhUSxVWejhusb0o+8IQ+UOEkR2bccb+YBCyTGOVeq0dJ0DkpDMDHEpYjp35c
         txYLcSX0xYcqQsmYV91viDnk2SiGmaL3ipcBjRxKlh0R0hUiFZAgcdPSp4i+TTlvD68z
         07rooT1K2cWQ8syZ09/SIZKJuxRWcG+tofW5E0wcTyXjDo9Sblhi/8lfK/MnUDNjJKf7
         g7S4QUBtQCJAYf45hC4L/1omYqu39erz274j/sV5F5RYx64hOdlpK8mkQCao95wZG/KV
         gUWg==
X-Gm-Message-State: AOJu0Yx2k+idfYRcS0cU5PDj9dSDAJWiQGvZLLdet0v+KX3q+a/HZXpI
	lLeDy+zE/S4YYFTb/n74nuFdbkSDRokEpaGcuuNROFxIh/3aAHz/WofhmfHh8Lp9ZdBZA6zSvad
	kHq3WHUPrOsr2boJX/HtZuzfjPUNcJUchpmXbzJV/CLzmphPv9yojjyEX6mws8C48SKTd
X-Gm-Gg: ATEYQzz/uvyFvi4BPDZ9lcBoDVVsQQXFiZRaBWu2VVsjk5SurUlLAaUXA5Bi8LxmbLb
	TvCVu1LVv1PTcnClXkLgfDMX8eX5j7eE23piUdEJ4CTKTzawp4aY0++pDedqdf/wQKLTPxbSQ9S
	pE2wxWUYeO4QwPlB1yksRucuXyvC6zbFJ+JC6LuMBy7KZxKLSjL9GxfGcxd+5Z7LvElwoVeI9Cd
	r4xuyQ2SlPcAghdFZfNaZYPk7lgQ+glei8MRkJd/Nt9waalpt3cCYAcQqK2IyVOTwFnSy7VoaO6
	rEtxsGQit53T2b3ozlWr05kAlJIJytUiXxRLgR2YXGmIv6GlrrGZiowPC6rJXc8f/p2QPdtJTMg
	XFR9IjCN4KjlS4Nmzxb6pCiZ4ra94qVNyOjJNUWp6wWhwc3TjbTXpVKg0QNswPoH60exUpEIbL3
	H5UakJkBcRmb3+GlbZy0dgeFr+xXzB4l4W/Zg=
X-Received: by 2002:a05:620a:2608:b0:8cd:b341:7593 with SMTP id af79cd13be357-8cdb3417670mr86995885a.19.1773322196637;
        Thu, 12 Mar 2026 06:29:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:8cd:b341:7593 with SMTP id af79cd13be357-8cdb3417670mr86991885a.19.1773322196158;
        Thu, 12 Mar 2026 06:29:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:36 +0200
Subject: [PATCH v3 15/27] drm/msm/mdss: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-15-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CN3kZ0/IBWNiI5YHIzLGKD4m0aY5Oisezj7zkRehZl8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+2jQT5pOrOTTeC5VX0xsxPmWNd6PDBdjyjo
 BZtm+GouG+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tgAKCRCLPIo+Aiko
 1TX4B/9882VAuHu2t29avT6n+6Ies3TV9cF9fpKejG/Jz07h8LsQAhLyQiGiqjTzD/4UBVi1XQN
 oZf39xifu9Fs9UmrPRMwkFI2XVppauY1PP2KO1xR0f5PXFDcBLtbVD1nmgG2ajqxr2kahDgS3EQ
 BFIonfPtygQLDnhdp4W/Km7Rlvfd1PbbK9JRZHvhKGIRoAqYjRkBz7YgV3/Iagq8gXNqfRW/7+s
 vYbdMq43QRKkZ50RTYyKltULaB4cQ6nI7B3yMmc3RIDIq4tzZXr7CQcRuOhX/s5liAhCiL/K2Ps
 ZtzhrMNMQIrA3N06rMNVDoocwKHB4YkC0pA/wNtdkh99k7cy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: U_NBR8bl48s-KwLRqGBAHC__u371itvM
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b2bfd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=crYPmtHWi7n-_IQ59sQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: U_NBR8bl48s-KwLRqGBAHC__u371itvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX8SF7HV3YQEwb
 M3hIW4cQ6XS2eFCS5lkXCJhONW4hI25DFe0RY5tOKZP55vi9zuc0ae1RCJQuuFF5cdBmsf+WZ0f
 Ruo7wqeytlcY6iVwkYgXAREeCEBVPPXrtyDZLLrUww6nd9rUICZyH8Nr2GQjXGzCyCFznutr6Cb
 iNLiagNFih8oWOBOmOryXz/1xLIwEY14xlV5lpEz9ZNGNhh3v0Ibn315ss2jE1nSocL//4PTx6i
 VhPcYYnLB/wt6Ce5YHOAUCWgJd4XasqdEUcHGJz46G3eqtK3ok/UozhoEtuVci+xM5P/Y/zsCYX
 muC1mRe+3WcqPyDTNGJvMO2CCnvScdXZ5AnCwFiK2xW+k3mI6l+QjNCWSTH18enmjhyY+qv4rJo
 cytcwAonCxfrNBqjamFChO7a0AOsZxniM0pNBgmEmmLteXJo94VNFbQPbmP2XpWwjHZGlbgqHYj
 OUzEoqdEUaqBbfQBg2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D941272AD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 76657a4a8f65..ca59bcdde7b2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,8 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -197,7 +199,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3


