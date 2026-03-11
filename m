Return-Path: <linux-arm-msm+bounces-96843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC4SFdDgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:26:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F725B8B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFEC730447DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D02337700C;
	Wed, 11 Mar 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZMJGc3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgnHgGiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF8375F9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199446; cv=none; b=EbkVG4f0XIwW3RV740HhADEWv5flEPw3MDygD7NxHq59rwQ4wr2Z6nQ+krTtK/xbeLaQGJ8SJ08awRa//M0ZAgp5yA7MTTG1aZADkfX/LhPMBie2wQtGK7sjtJoUwhJPZxaf7Toec4tdxthO7Q/kaYkmHVhyPvq2B/kAA4Li7aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199446; c=relaxed/simple;
	bh=Met5TZNVp13sok3oQ5iow5YoFyI1888iL0OQn7nMGcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdFzjm9FjfiQSwsQQkJvVO0AGUu6OAuUEB9BELuRkG6KTJExQ6VtQx7lJA4Ill2NeW54drvEg2Mmp49rEPGfN2IgW1BLOhpd8l/WH2dbrchryb4hmu4eV3FwYazLH3RAdatNxJ48E/gyxX/n4q+YkjK02ea7z/kKTn3LzVjbd88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZMJGc3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgnHgGiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIreeh3296079
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2yYkLoxCfripsbdwJQ9JG6vK5PUaKJ8D9t+Ub7ZuELk=; b=DZMJGc3lGwiPaLfo
	5hMUdkJG+9lAs0miqwVlg90vuWwLdN2ngXvUi+FeqkbLkoZOqs/bZvlsPPRPzgwb
	D3XGz6tQh89xOQYY2pQBqEWf20yH2O60W3ODFN7RdVxzjjnUZvvkuMahZuUGP9wk
	4r88sv0jzkUY2/65ssw301AsCoQKQUdgEUWO3bDDWDYrQxnOCeRJ0g34pZiQ7FXH
	qJ58zb3oK3nbWn80SOq+kIiO/ZT8NskjuH6awK5mPqOd1WHyEcCX586/yl5zH3Sc
	RHo6ssIbcH8u4b5p1rjtGWeU1pBh+PN6xEn9FpuV8apJxgkXfIebrI8e/IHdaYQ8
	soqmsQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1musf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:24:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffa1faa59dso10429305137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199441; x=1773804241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yYkLoxCfripsbdwJQ9JG6vK5PUaKJ8D9t+Ub7ZuELk=;
        b=YgnHgGiOMrUmbdXYK4izGVg7qwmitOeJwSVPutsK1fsEQk5c1U86qam3ZDvMgwPB+p
         1R6RM5mqLA8sZRQvB7hnCIaHEcauF363NWa5bkyyaEvnbL6EAE8RVi4VR2N7kV+SoOzY
         wWDKOy/eV21GQAXLjEfzjtqqjUzni4BXxwsYjrg/glA9fVTv10Ngc69hY8TBat/t4Z87
         gsQ8srHms+PiWFy8wC3tH9/A1kVGyhDwCcjHTS/e9ExXL+TJ/OE4pJrJ3gtTP4xShaqe
         pXa22F9wfQV/EHT7zCvJiURs3MliIgvrVOa8xjiTpGI0N3uW7NZgb4e8KD7QrqcvCKin
         8XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199441; x=1773804241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2yYkLoxCfripsbdwJQ9JG6vK5PUaKJ8D9t+Ub7ZuELk=;
        b=S6J0afTvY3i93AIq4z6J3SM9TEvxU5cF6eFYjon/v/XQQyZlqGTdmqWjBnYRVwipEB
         jQsmfj6ahJnydnNPPIyPSOs5JFKpar6gBAsnfwyENkMAu1NpJqpDMivU77/5WBSUgvMK
         7nxawJyOBLcNkaVjkLPh6USE01CvJ6JaafLqXTiXUEh3Gam2XT5XNHhITTVryJ074zXR
         tyCKxeR7fufgevdlu5sl6uu4JleiRChevqBIvgc53OHI1MVpUZiN/vndq0V5+hXW+uPt
         bCgtmUWRJ0mid+axzZj9dhtXhIj8AYPiEC9+9yVPoWY3mAgEzJVYtNKS6xjM0kq9zVmK
         wtsQ==
X-Gm-Message-State: AOJu0YxxH+f+PHY7EXtmU+AiI7v2vKyu0tXv/8HkfeWmREGGyYWzMRgf
	Prwag5ggEIldVE9NjEnv00HwuWRN/RQgfprKQvHnXd1IFRpvUYuJza1UIyiSv4XAhZLsQoeHYiW
	LfbtG+6OxgeyxAqTYFL80NtT21NTIpTKsANHKAD3XeUw55e2InUPAWFoSvL30ZyuJhj+q
X-Gm-Gg: ATEYQzyO8Ox8UipFqzdVcQUoCJfxwB+ox6bhchKNxn0dsW7dzqg9unB0uQ023bAowU4
	gm0YeJojEL5hjIXweGhRZG91XnFNWG+lkVMNaCkRLd0sB2G33DNfrB4Km4DjOQ+Shr2o/1rMvBg
	c375ERSTOYOf/XpKSxvniHUXfDp0S4hRA+cJ4hgTZUNKEopqyWHXBCUqBNO5BIhYlow0pS1lwN0
	55/UvCNL4Rkba4MEXCOH5HT4unJDIUxKWu1yrCYqdFURAgfE4Qn4P0HkE8VmeKcv2udxZ07KmzH
	OgcMMCD9JhZLvmd2+mxxJKTDVGBb127YIYhphEdiR1WxG62e0a8LJqH0J2k904uUHrtgbD4aNW9
	peE832X2hcb06MiNaEkghMoqOpMt4zE2LrATLjxHnkxbRYW9apMkCEmN1TRddGOi7HiYMxa/i1u
	lw7sg7lqFRsFAUklFQYRhWjw5hLCsUNxDqPkw=
X-Received: by 2002:a05:6102:32d3:b0:5f5:5925:defb with SMTP id ada2fe7eead31-601deb937dcmr386186137.10.1773199441049;
        Tue, 10 Mar 2026 20:24:01 -0700 (PDT)
X-Received: by 2002:a05:6102:32d3:b0:5f5:5925:defb with SMTP id ada2fe7eead31-601deb937dcmr386174137.10.1773199440611;
        Tue, 10 Mar 2026 20:24:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:11 +0200
Subject: [PATCH v2 17/25] drm/msm/mdss: adapt for UBWC 3.1 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-17-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Met5TZNVp13sok3oQ5iow5YoFyI1888iL0OQn7nMGcE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAfH/fBkd/4pYO0rbFbNER/KkKakw/fWGb+r
 TMgTNyIijyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHwAKCRCLPIo+Aiko
 1SlSCACv2PrRr+4728piITElTpbl8PMQ+h09EM6weyT6/zNxwOcAEYAxnC56pTOEktWidE5aL7q
 bAhCYVAPrhs2qe5pxH8EBRmxYxN2+zXsL0XEIJ1zGKICXAdfW70DSw515j5KNjemts/bDv/WBsa
 EnCeHf/Toa0CSeDgWv1txuBcQcaJrfQ9RRy1c9/58oMgfEwonfwqfyHHhTkGq7BuCtOqegH23z7
 qn2mL3cUfd54zpcKORloffBIFo3S98Gdx/e+Tl2UzTxsD9/ZkqvDEq1S7To8oR+Ds+kkf4wyQbm
 JynE/VbqIM7H575fsCGuhmQQw2QEp379l+9ejPdcXfxux/Pt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0e053 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ou6ODICaiX18ouMgCewA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 4mHzuJ8BTgHFoOJZYogyFuNY1mmRVxwR
X-Proofpoint-GUID: 4mHzuJ8BTgHFoOJZYogyFuNY1mmRVxwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX8FXzHYOLvaUu
 OO3Itw5/SeZgcwZe9EcFsg3DqgzhlUUg6wfJR4wcWbEs61icXYwwUELlyYsJyIWeyXHR75ZmbtG
 zVNMq7xzmzIU9xEKxdvsYHnqyCsiZRFaCyH3EQeF491EtV5tVqkKtTc+doFqan4ZQR0WD1/ZXDH
 ldQ8AVtVdZJIy3y4paOjH8v9M+3DMivRS1OHfgO8HGlgCQWF2tek2sLX8aN/geBEDrLKDTHOyqC
 g/w5uKh1kusaXVBN6JNMOTZWeujbbd79ZbRS+wN0ggh8G+wCjDBWmab3ULD7j8yR4LvNvzsuLP8
 W+BQUyP49XBfaj27Gqd6Q6xqucRE7F3/+lpyH7UV4IzSVN09f6c9kxhQqmmd4dxQ1LvMn6Hia9J
 0M56qB4UkNBF11HA03GEHXK67Eg3PKdd3yh/tjgGzHd6aXDicrrw4eaEmhIxfjDMI0V1Fb/4Kgu
 fnaK+QlgR4bH2Vw9C2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110026
X-Rspamd-Queue-Id: EA4F725B8B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96843-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0b15d725566c..6cf391facffb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -190,7 +190,8 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0 ||
+	    data->ubwc_enc_version == UBWC_3_1)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3


