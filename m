Return-Path: <linux-arm-msm+bounces-108797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI0TA4LNDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51459590731
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D837C3087417
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85903F23CA;
	Wed, 20 May 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uj5lADhC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vw2WNksr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B883F2117
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288706; cv=none; b=Tdl64NchLNVdWFeYmAYmoTMtHxL9/dYFY0KibGuQlChSDb3oRGHG/f8I1OScyEWcV5wMVzgSa88iuTXWKnEijE8vztefvvxAb4OKkok2dwcZ+ojSn/Y9rPRUYwN8OydyHUfMFDAwAObX883ZajWBS2iA7UnAjsBssbln0eeZ4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288706; c=relaxed/simple;
	bh=gBDFjN7fs9zNZK1OT0Rge6uEp5iYTQNKw6PU4vljOxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2Mt2Rf1B5E2Q2xuD5bkPzKLNHS2FAJ1WUOU8JV8m9zMPWkFWHu/WjW3hQaB6dkvD2DWAdVYpbGk9uWwrNT95/ov0ovbkWA82e4cBOLlF+pJ4xcPCAYE32qTBxu70HeLE5/LNJUoBRmvE5vSD4rU6irSRBID8DqTEkhq4CWgdQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uj5lADhC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vw2WNksr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCktNJ1725708
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHppxJbIcnxAbn5e5BxkZY1HBroOaNwMncF5FMMJzNI=; b=Uj5lADhCgKZb1LaT
	D7zB9BClKwWbn05PR90+3hViJ/HU5K+8mWgMA6bYhecEEEuwtQscJmhyi9p6k31Y
	TDtguLgTNDw0mMfq/0zH1+LEJ/IuTMHdUSUerBakr9mbiPB+TzUhYj0w7ctG/g/m
	mCVHpNOe7E3aBepVBrqSXPCwN2Kv2zkXnMmsCFz4ZB/pxHmwFh3idfdQtdojL9R3
	e4Cm4Ct/4F8UpuaY4C4jTnDP4ourA7uzONJUuJUwZbcYhEQ/N2gH0CTj229drROg
	xL2TLmt5rGQW/IK1rTxyHuXJovUIfL+KOJGWkHT1YY5VVZb9RpYV1ggfRzmVzWNp
	C9Wt5w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn8vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5752402f5e1so13094697e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288703; x=1779893503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHppxJbIcnxAbn5e5BxkZY1HBroOaNwMncF5FMMJzNI=;
        b=Vw2WNksrW4lEwUuUBsdHv8RP0GF2SwSxnBI78BtDMiCVdD/KTGL5eywTq0NVAjyor+
         oCivx7MeXaQsr5F0fU6ciiwPA/wFw6ZDP/e7VZZBYkNBKfqxVHEtlcgVT2UAhn34r490
         rjIQCw/w1LS5LhK1xRYlm5BclzxX5McZtdQ9Nx2lrjfD+VxzEMjvAkb5umxkIkMCflxd
         Bj0JIsRhvavzSt9C0Q2WXMy5/bjP4q5RvSMwx+8RskkGq+8KVb4XISnNS3Jaucpw9hKX
         8Q6vGHPBpSCYmNZBowB7qDHWEnBq0ydOHiEle9EFBgm7s457WSSIGuyGvNikBkfVHF2l
         QGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288703; x=1779893503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHppxJbIcnxAbn5e5BxkZY1HBroOaNwMncF5FMMJzNI=;
        b=IFWXm2Aeazt6fR1lGe8m7TJnI2Xw1Vl/PyeSH0WffjvHJ0ajw/FNNG/T8Wa2dLdccS
         WTgISWtKCkS/5QzG/YyIAi1eWFtlq3edHhI7XBDWE2eAgZXhQxSG3UPXoRFkMHVvuRP3
         uUrtbRJnFB4o99eb7T+5YodfQvD9ymJzn9jPMg5WnuJczSWzxUjQECmmcLeTC+xWm05W
         smXyybDjubjmsLtNi7HirbwHc9lS6c1BccO2O6npu38gzIwehyfmAz8YCGVAMbb3VN7d
         5A6/LegMfON5qJOQEY8vrwPG5qZsu143NXmY9Ovskk53y/Qs302EsZAwOQxxw4dm/oW6
         sKjA==
X-Gm-Message-State: AOJu0YyHF1uxBdOkTkBIlUDVvqvwsM3KFYVCMbsq2ladreYh/KeriIQr
	0W/5vI4WTsrCKEAfd9+PtyVRvgl9/ZeL8I/fBJ2igiNjOyVqU1PdxvgwVyhm/u0ACTJ+N3BaPwR
	3xvJeIaaUGazVqm65iFxCe00kJ5O3T47C7ilRG6QRGGjXET/ytWDs9Wx56E4DLOBH7ENm
X-Gm-Gg: Acq92OFjHlnQZ1m08tyutk7mRE++uk/vPA+xGJDxlOGArUlNefASI1FRP+BW71Ka3k8
	gwtt1hPm1RiWh89r0jkf/6cuICwU8W9lN5xREZIggZ5MV+J0C8yU+W97RRcL60KrMrtIg1mEY6c
	hESb1FX/Yq50XeEasE82ha9Ja/Zbtc2aXmQRI9Px6x072IxnrWWhpfazTwur+grZq45f7QqMxNU
	94j32YvAldoGh1HQTaRtfUU9wBRGq3nZQW4W53B8t8w5sqoLpyZIpNgrPhf4Aut2dYN6rnDPSXi
	/IhXDYHGbotRy+TlbNIXGeljNVXD2Vu7ZFeuD/aFXfWddU8/qZaznWSKB3MzRezRyJpwolNArDt
	dou0p3KgA5l1xgE8+d3FJLz/90VFNDHW+M8S4i0NcKYdW/vlCqc/OW+V4KG+wBIAJWPXIR4KB1/
	vGRRmYFU0RgilkgYlyA/adFJjZ/IANWTAd8+7AycNO4nSWPQ==
X-Received: by 2002:a05:6122:3b87:b0:56d:9f2a:d6b1 with SMTP id 71dfb90a1353d-5760c094366mr14488209e0c.12.1779288700842;
        Wed, 20 May 2026 07:51:40 -0700 (PDT)
X-Received: by 2002:a05:6122:3b87:b0:56d:9f2a:d6b1 with SMTP id 71dfb90a1353d-5760c094366mr14488131e0c.12.1779288700206;
        Wed, 20 May 2026 07:51:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:17 +0300
Subject: [PATCH v5 10/28] drm/msm/mdss: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-10-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gBDFjN7fs9zNZK1OT0Rge6uEp5iYTQNKw6PU4vljOxU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpn5CalDZqbTqL/Jq1BQ4go8L+gmdNsxQigR
 qilEu7iUXqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZwAKCRCLPIo+Aiko
 1S9RB/0UDuf0TK/Oq67GOhJEtwUfg6VhDxZ01giJdv3bCzs/5SdM0iUFUw5fYTVEIlaZgTk/ESO
 cCUT+jc/4d6rmWvD1+NTnVR10NrN9QxH8NFFjV14yP+I+s8Rpn9TlFr7Hevv/iKPGAciNqLduhH
 T/lAcw+wJi1HwTPm8k0XLEyEpNIYA/PfoNtqii4t2VtPF0kE9j3Fuocdndx5W+P6SA97FFC0WRS
 33D1kw27PsKDJrXyf8bK4RnVcUieLsScjrPPUtghYTIkww38p1WQTOJ9G/AR0/vonPil69JEctR
 abKoE/8hQnyMa1wB5qqhXeHXHcrLb4nSul2DLuiKqylYcCXZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX0WRpM4kVbsuK
 z1AGTWcgYtDX4rqL6BlVCyKrZEsb7kTyzyIrMv6Ugs0vGDzD6cukIPBMK2+r9vEAlMV7jUACOQK
 SzzHgPfLdOHeOH9/20M/k6FC919b/4rQz+DF7CxRF/5jhENNHa4OiTdyHXcmZ22UgPn5YI9IGTC
 Ow5xjQ9BUdBbcqgq5pTg0mPByFKZMhSxYt84mcjqf4+fhccKAWm8DWjQ4pl4OJtTFxu/XgNCQZs
 6dXYaY5NIXtWyRxkcWsI90/M4ZWP1qPLqBLh1iLb9amTZDNc4AslTZ/xBMp0BmpK6lb+lQ9U68f
 vhdUqZEHxeeYNRLdbXXrDIL/bD3CL7b6Mw/pXihyEjd1FiW+o5l2b5NLR8JLhsj2CscGWL3OXwi
 SrWuhaggOLE1mmqG9kECL+kulQdsnODZA/Hvj2viNOzRboi/T0/WW9xrFTKy0rFrfqDOEMrFT2R
 QiGkNV2wODFTX/ouz7A==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dca80 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: lxbGeux-LP1d-iMCqKHuX6aFBgChISEO
X-Proofpoint-ORIG-GUID: lxbGeux-LP1d-iMCqKHuX6aFBgChISEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 51459590731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9f2b366d45fc..2742d4bb2a4d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	if (data->ubwc_enc_version == UBWC_3_0)
@@ -204,7 +204,7 @@ static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->macrotile_mode)
+	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


