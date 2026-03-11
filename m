Return-Path: <linux-arm-msm+bounces-96833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNLSDODgsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:26:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D32325B8BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BCEE322F799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04AA33F5B3;
	Wed, 11 Mar 2026 03:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgNMVsZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F33Z/5rL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D8371877
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199419; cv=none; b=TLzpYd3phhm9ID7LWiA5qmoW2bj99sJ/5fHj0F79Jj+bW+aDHvnf2ykgNkLcZJYSsYva0HNUeJwaqoH79RRq7rybbFWwi51c5CWBj5zqvCit/uGP5BrlrS3+8J15OSN6/tG+bkyzRehHTFtstJJ366zo0l62zmSrH/4/A0VIrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199419; c=relaxed/simple;
	bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZToFcTK1E1+7CPbCnoP7FI4MapFW5HPRkMhfShWQn3Gr+5yFp4kFmASC2FqZFn2ufweT5XvX7zH0YPY0o5MAso7gQJxTXZB7Y8iXXkQCYqCwc8DGFkAhhnSA3DBN3l8hcNcKBZtus6bsu/oSRe2OAxbP5RhqNd//NWS9LO6n2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgNMVsZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F33Z/5rL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJHPlT3418255
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=; b=cgNMVsZxErBUR+FZ
	T+qVtr9b1dx2619MlUbmEGH719FcC3bq4a7gXH/wghH2uqcnucunxcL5FQBj85uj
	qt5VCGLaj5pFGn8oSc+zw1txQNzJR3hnuVRQCsgne79V54Ht5sdkwk8xChgOk5a8
	5HqAltakLkzPXQiWfY7CdevljZHAhD1QPuG8hyNiYivDGDUgsc9nHTeI2kwTR3b1
	DO7BBDNvefVyE7XtZ8Q7fUfWsVH0L60GG5hOullhyYvq8FgWxlPBfVpsNNRbtUoM
	3w4Rqr+ulovv2HFoeC7ejdoD9JjhVRkPZ4HedC3/8VAe9yM2+B9VcTjM/w+mY6AM
	jEPi6Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2b61k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffaa511969so7624290137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199417; x=1773804217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
        b=F33Z/5rLo9SpIeCX7AJAJVTrTceSG7KUF8GUcbiYuJ2A1s0TksS6VNaOtqrZ3hqw4v
         o9Agrf5QqmWxVhBSzTS4uQJcWxbdFc0colF1t4ZMb8+sD8G9huXDl4VY2LRC6juLYgCu
         7ic1VVwSsdHhlBhtDH7RDXunSEoKSEV4XxwSk8ukEagmt4hvbTlsPBjnVEWN+xNxhT3v
         vNPOXOXBLNJ0CSU1MMn+XAsNKKpX1f/bnUkfzTYxazPHpa7NgNzyetkh7pxSGdeiH0+U
         w2gHoWbH057Z9Deni535rwiWHFO8G0GY9x4+5E+sEopzzNdXGjd40MiFLEF/z56O9ev/
         DUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199417; x=1773804217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
        b=tniuV+1TeOchYbQW5GVIT7TgLMZZDd2xOtKhv5GmwZZpc0yRbrsDkmeWCLLghj+I3Y
         pYtipxSF+ff6oWn4LsXLesFONu5obSdw1vBrAUX4LztYb2Rx41p4GlcbEW9rz1TiTVwP
         s7MUTQpIEWoXs3lzbQRxUQnDhFSY7/po2cwSILyO8l8QPGFGLISx2WW2YwOFbjBhq5oH
         oBKrqTIfn6NYossgSe+Qi7JGZCLbesKqPrAFJhfS5xluzHmFXCdcfyjjK2IJjyWdprsr
         pTYetzljGnlCG594VwREfg/NxQRTHJ5HQlv8c1xTsjw1ru2ASfokAD16EJAS3M+Gx5dH
         Sljw==
X-Gm-Message-State: AOJu0Yx31tnVm40DXJ4qYVXfGMZzI6MiNvgC/o5cs7+ajN3dVQTl83lv
	8zwigKcSjMHc/8Y/jSupPObY79joIVM3qaqRoV4ZAASxtRpLm2LH5RW7lGLItiWHTLvlmWSQ9PG
	70ik+PPVT5DaccMo/GzpDg5CdUnL/1MK3Jlmy/fB0KrXsk8qNSrnH99+q3wZiviYWRTTX
X-Gm-Gg: ATEYQzwFDDRdQAfncj4qgHlAvMREEWaQlrSVrltGFTflh1vvI0Ouy1Dz7PKMdp0SjJC
	zHnax3ygISwf1RdtJ9vVV1me6GATkpfbeP4ju5WJYzr7xxby98Tx5/TA8oZRNM12ukm+3Snt0lC
	R64plE8F+8ob2jyy09tB4BtbQxCB9tfoDt7+Hy20dbv4FU05tNfzSWy4pPwn15Sa9RoXmdSXeoa
	kaW2rva3W2MqozrEMUzOY7xfUf3sYYerJP2SG5B5FKiC6JDGdm+Gi8vaYFeAwWyyYwHuRQfuG6V
	NWKwCpeghcnA73VHZpHvDO9TtSKCXMaVlBKAmcBRNHWosoFnm8AZ89N/yMbMA7jnsZEBcpbg3hT
	P70oGstdvjxcNhBsBKOJAkcwVYQe2EKrtpCL77FnwZzpDtYioJsjJISwAcuGRCzVIcAJ9sOwwsv
	aYjVQoJs6gQr0lSPkm9AVfSaRHcp/cMVhvne8=
X-Received: by 2002:a05:6102:5491:b0:5fd:f8d6:e5d3 with SMTP id ada2fe7eead31-601deb93545mr402767137.10.1773199416520;
        Tue, 10 Mar 2026 20:23:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:5fd:f8d6:e5d3 with SMTP id ada2fe7eead31-601deb93545mr402760137.10.1773199416080;
        Tue, 10 Mar 2026 20:23:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:01 +0200
Subject: [PATCH v2 07/25] drm/msm/adreno: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-7-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAeO4nElIJcpuyqbvQC62M0/OONI27Dtl7Qg
 uWcvp4x3wqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHgAKCRCLPIo+Aiko
 1X0kB/wJwyuj+XLI2LEBuuKOWUFkxdi8dLenQPx9p5GvUg/qDaDdI3lJrLI0e6dSH/jM7X43NqF
 vp97cFEvLGZdiP3JIxQWRXV2Vx2mfcZFE2kVgMAnTrq+OfY+8JohGMZkZjYr/L9djyw8E1rdKlw
 yOSoBZswqU9MR5MQClsZ3qzhz3EmHuxs4D5M8X8ns76JoRBasuj31BzzW3Fwc6O3oH4N0k8gvLv
 81GxHCtnumJZl6va1/kqsxDwY+ZnfwAxOg93USVQ9uBO6gHK1Feq7AP/PXU0fNSt0g4Hv5KY5bn
 5S9ZAOi7sOp/QBdnF5CKnUZFeckHk5s8kT+I4m++nWpdeefC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0e039 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: gFAfivDHUBJEto7laawiX0b9jPUkDQty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXxcMUnU+bmkQL
 s0PcBAwaazm395DJ2Mj8ad5qn0q3GoMVl5WmSl7ipE8f2rEFFJTYfLT2Oar0BEBcdKpfmKGnGKZ
 fAptAm5x+tizytI0dPDj+Ojv2J/UAd+mnLVwzaDw+sS9Ll89Km3oi9L6RGjoQ19vBx54yppYQzT
 fwQR5M2IkrA3qC1It4h2Yq387W22FHm5MSSRPu4nJaY53OEiQjA63bdVTFBNtFgBd4sehRnS1Zy
 Us7IEVj7VwwJIcMCGDBr334v35/62D2O5TGzLLWFou1TORTYg6D+5X3ZvdhsDO+Kduu6Jinvdux
 I4dNaZafz9QaGEw5GwUdX5OcW+pm+QxCUQ3e3NILw8AY+T+rWdZc+2IQfASu4EfjVkNwZMjfMPZ
 S1NXmGsgMj0ZQGtpmPSyvWG1EOcJtbzFQRJxl9eQXFkSSZ55J7evV6CBfg89IvDge0LEbVGBhdG
 9iQuNBiDJdZVo80bRjw==
X-Proofpoint-GUID: gFAfivDHUBJEto7laawiX0b9jPUkDQty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 8D32325B8BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6eca7888013b..2027e479d5b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -744,7 +744,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -752,8 +752,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3


