Return-Path: <linux-arm-msm+bounces-97221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAyiDsu/sml5PQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:29:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3C27287E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F25EA302086A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4953BED5D;
	Thu, 12 Mar 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5dAh1qV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGOGt83w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1C38737C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322176; cv=none; b=J/0J8Xk+MOz1uviHFhd7/m3HCp4RMA0eDNuI5cU8PY/Rt/0XU3RJeN3cO25hV8LDYpIPXPCzAsuE3Z6pt8W0BW3KujKu9b2Gm3/i4IFrAIHad8Y1cbndDtPFxoP5ufnHQkJ6InUrq2QWOybhe98xYV3sV1D6JMjtsFOg8HK57sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322176; c=relaxed/simple;
	bh=FcXX+QO0E2e2UbnHHDWvIWF4Nm+gAqQ21/54o+KGzd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNDoysCEHXTRyr2QJyZDdkBSUpI2V7XDxaSq1kVrrLGFH+W0raTS2juwpRRU3VgNvaBmDEwRgBG6SE1w2NNZf6B2Rv5yxxWySvm1shNrxmEnYdi+ooTYgE5QbBpC9IYJGCWYl1ooWgvNC8DeQFfuAp/y8jan7CikKyz4rbV97W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5dAh1qV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGOGt83w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9vLoW3668464
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2lO51oxWqRuqIMOMa1LT63isf0ox5oldYaFyA2HvGI=; b=d5dAh1qVWvXcYlzw
	7TY6mbPMaRnyCfOjsNGXlEnX64c8RrE8ij29OyV4xIQdu6ruEYFbjpYvZ3plbMFl
	BAqx5Rc6qLAeZzy0y05YY8BXyI92DosUGbo1zrFKllDvLRCNQlWnU078ykqVYAnO
	z+4Ph2mwP+KiuKit8uO1blPiEWm2geLI1cAb+i6jawO0NC4D8fK/OUq0R4lUYf9l
	y77RQqYsYjkGFJ9/lRo9W4cZKoj2YdgBSb3p1TEpomI7u14VETUiQbl/9G/sIxxg
	sMFG7Kjx4EXl/7AGYcnbcy4X/DuCpepUAwCWGFP7GEGpsOvUd8lcAK4pgSaWmJCy
	No+LzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j7rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so658170185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322174; x=1773926974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2lO51oxWqRuqIMOMa1LT63isf0ox5oldYaFyA2HvGI=;
        b=PGOGt83wELKJO8Tg1YRaJUBOlUTG4nNmvxZhmRNFDSoJDrwXGoHSTb5Zi1CH9d3g7y
         yhM4sd3Mi4mrtXgsl9hYi/D0GxduZcm8+ex6shfdNKZYGt1GV9QC78c5XLV5CiH76+dK
         hbTO4s/rHzXFKmjcDJMsmiMyD4fhdasOgq02DJZE/EDMlpzuJogN9rlP7wZ1YSDrRxsW
         AQAfTGL4lo1cWY68QftLFM0uhfyv9icj44Qu1LDm/T0wB64LpV/KK6dsEkrDbCLZCxMR
         B5fpvtVqnls4/E0ngduoMxOV+IK6n1vqwN8AQ9EBwhf1w7Jx+sUSYxOeTVwhgH2uqKH0
         JoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322174; x=1773926974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2lO51oxWqRuqIMOMa1LT63isf0ox5oldYaFyA2HvGI=;
        b=wSlxaAFSRb5cj+wJJzhII4QjsPNRXiDgZqHTqcIJVYg2G5ekd9xiLWQIbmBgsPYl9O
         bP7I7woCEOtkwkxm5PYySrw6ZXn5zkUp7p/ljddpOKlFiCp2F8z1IKs00nrbrsgL0Fma
         FMR9rlvEv4LKXVyyT7ckSYXgJaP6M7vCRhar79pDcjcTLpzMHb260X+nBdTIBbcJhJd9
         0yAa366JUD42a5E8yAB2sbH84/6XYsBKg4prMAH1hPm508Lu5033hl8B+f1TVbwomH2D
         vx2j+5HAmFLa+FHLnc5SVi1Us+EKgx/NiEhFE+wlfZQJ7piDZYICsORof13T6Gx3fvcN
         4gDg==
X-Gm-Message-State: AOJu0YyRu6WiaQcuTpr6fRv1XIaUmhvHfnfXsrsXtXhTM3Jv7zrSJoOP
	QIY7ZsQhH8F3FKB1BzqLkGZiDInuVylciUooK2tpZOYeVaTZWO8xHTB0pw/4diBiMZo4W1KE5Sp
	qO/3JH4IsCIY8K6riD2GTUXPnOQLTIcKsiMuB4vFo0qoFQIVfVU6A0dtRyJO+ocBxIz3A
X-Gm-Gg: ATEYQzzh2TN4YN/8Unna5kMiqyLLJ23n/2nd3MDCH/NG9IC22i2qwHT5SjlvZpDX/Fu
	AR43Bs1XkrAhyvI5ZVzsPHy5sG3MIXUIFiIHxObzq1Hn3cGq4GN/o3TLOtNTEePDW2+xFDOabln
	A89e0sQQ4fusV5eG6njAOYllxIcYDbQ0luOmU6hwnGxA9pqllVUZE2XZLXq8o+os8SpMR15AsYm
	0IN15aP3PfttdkQJ1HsoZK57KwVE9oYeC7U4zEyUTrB+yXX3nMoppkpBfz6S1KH2YvmN5hjF1EF
	BrUmGuV0olx1Gl2TS5iW/lCr/QQzCOZb/zZuGz8xT7xqE3d7BZikmTUT5W/XZGNAIoiDIqVvq1n
	9NxQ2dui+OUlZ7XUKdCit9HCZD0KPnb1vFCkcZ/GiqWjCjGrBLX9Yc3HZDaZPcu3+ylkjbHfU30
	/9qtxiwTt9mK9VyIQooopCc3WjhDBpucyWqPU=
X-Received: by 2002:a05:620a:a3cb:b0:8cd:b317:a0b3 with SMTP id af79cd13be357-8cdb317ae33mr79321385a.24.1773322173810;
        Thu, 12 Mar 2026 06:29:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a3cb:b0:8cd:b317:a0b3 with SMTP id af79cd13be357-8cdb317ae33mr79318185a.24.1773322173216;
        Thu, 12 Mar 2026 06:29:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:22 +0200
Subject: [PATCH v3 01/27] drm/msm/mdss: correct UBWC programming sequences
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-1-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6614;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FcXX+QO0E2e2UbnHHDWvIWF4Nm+gAqQ21/54o+KGzd8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+0lEjFyOEH60Ac/jnZa9bs33g2Aqfq+Yj0Q
 Pwa09NPO72JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tAAKCRCLPIo+Aiko
 1WpoB/9VZxaclHZBWaXPVLeLx4Siy6u3v870jqaZoKW6oUPlJz4Qd/3CCRJovsYhcDTolDy5OJO
 +kMIzcHfsBP758n6gxunzEe3qyFeLoiNkfzzPnuGsLqmjSHXlaLKzYjvPAeWd77ApUe/oiFWinh
 bajw1AQPTrqFf62864QM8skUdsNyr/+nblqSKAJJLNayAE5kwb9hIojsypsQIbjfY2iFIxtRNEQ
 TOtSK/QG1ZFjxymqKb8pFbN56mdp1lG9lQBTF4yWCdJXIonQeotxxd2E2NK2j2EkojtvXWRAkP6
 UKgFrmNcFO13o8JeVzQnF1UM1Z3CvAa0H6n82ivux0dXrLya
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: KsUD5WrkXwRVFzWEeKTDrP3OYsmYxOoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX5b3MKJqA/TGv
 X9lfETS0/K9SPTBuU7kxZ0EiY4MKIHPSaiwB4UndkK4nqWJpWlcO2d0DYlguZT/i56qfG2md0T0
 BCr8htjQscpkgC5nsVarr1DVx7dbiPYdr3V1tfnQa6WVMGSkQzfknWVux0ybUBZWtYgFqQTZxIO
 x0qdliUjjvRtrTVu+sE/lNfnFlys/owUy1tlKZZMWnP4D5/SJ8HafJ3ptVzcCk0Tk/0Hp5aFswW
 Y02o7AggUmZ/9pNWhxU4nCkTKvto9N35z2etda7Kixn+XDPzD/ff4woZFNkTeqW+D9NEW/DMqSI
 PoDa+F5tPfr4XFdWIfqVFheiGdREROAIh+TupzEM/Y7SMX5CwNABj6MYHeT/8Fw2x69H+LdpiJV
 om2YyTqvpEZa5g4vl7wlzNgqQQSVDXQwqwLMxNYfAy6lQm/ENLpK8/B3og5M9P8J8STnooZW36p
 vnZN5xqVag9RuTNublw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bfbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hQCg4X1xv2bm5S_WMKMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KsUD5WrkXwRVFzWEeKTDrP3OYsmYxOoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-97221-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 96D3C27287E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UBWC registers in the MDSS region are not dependent on the UBWC
version (it is an invalid assumption we inherited from the vendor SDE
driver). Instead they are dependent only on the MDSS core revision.

Rework UBWC programming to follow MDSS revision and to use required (aka
encoder) UBWC version instead of the ubwc_dec_version.

Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 115 +++++++++++++++--------------------------
 1 file changed, 41 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..7cb8aeaa7ecf 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,22 +166,19 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
@@ -199,11 +196,12 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
+	u32 ver, prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -211,45 +209,42 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
-
-	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	} else {
-		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		else
-			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	}
-}
-
-static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
-{
-	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
-	if (data->macrotile_mode)
-		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	if (data->ubwc_dec_version == UBWC_6_0)
-		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_enc_version < UBWC_4_0)
+		prediction_mode = 0;
 	else
-		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-
-	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+		prediction_mode = 1;
+
+	if (data->ubwc_enc_version >= UBWC_6_0)
+		ver = 5;
+	else if (data->ubwc_enc_version >= UBWC_5_0)
+		ver = 4;
+	else if (data->ubwc_enc_version >= UBWC_4_3)
+		ver = 3;
+	else if (data->ubwc_enc_version >= UBWC_4_0)
+		ver = 2;
+	else if (data->ubwc_enc_version >= UBWC_3_0)
+		ver = 1;
+	else /* UBWC 1.0 and 2.0 */
+		ver = 0;
+
+	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+#define MDSS_HW_VER(major, minor, step)	\
+	((((major) & 0xf) << 28) |	\
+	 (((minor) & 0xfff) << 16) |	\
+	 ((step) & 0xffff))
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
+	u32 hw_rev;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -275,43 +270,15 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
-	/*
-	 * ubwc config is part of the "mdss" region which is not accessible
-	 * from the rest of the driver. hardcode known configurations here
-	 *
-	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
-	 * UBWC_n and the rest of params comes from hw data.
-	 */
-	switch (msm_mdss->mdss_data->ubwc_dec_version) {
-	case 0: /* no UBWC */
-	case UBWC_1_0:
-		/* do nothing */
-		break;
-	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
-		break;
-	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
-		break;
-	case UBWC_4_0:
-	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
-		break;
-	case UBWC_5_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	case UBWC_6_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	default:
-		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
-			msm_mdss->mdss_data->ubwc_dec_version);
-		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
-		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
-		break;
-	}
+	hw_rev = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION);
+
+	if (hw_rev >= MDSS_HW_VER(6, 0, 0))
+		msm_mdss_6x_setup_ubwc(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(5, 0, 0))
+		msm_mdss_5x_setup_ubwc(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(4, 0, 0))
+		msm_mdss_4x_setup_ubwc(msm_mdss);
+	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
 }

-- 
2.47.3


