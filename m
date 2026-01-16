Return-Path: <linux-arm-msm+bounces-89333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD37D2D385
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6FA53301BDE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC0334EEEA;
	Fri, 16 Jan 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOrJgAJN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NrdXh6UU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AB35295D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548474; cv=none; b=pvlz8qA4suwTpCfBwer0c5JiIPa1FTOVAf+dYyzpPFYtDKWqaHIJGLSvbMZbo6lGYKs1Vhmd4jv4CjVi4ZT+ZJgG+zOV+ssB1C1dTO99bzLG7/aTx6w4S976Lu3snyRr6MCdyfRQETzWja7Fz7QqONcbT+hxvyQQBYrmanLATLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548474; c=relaxed/simple;
	bh=isNHAvh6bOOHjhw7YnHhExK2VyE29bdL8UUCGiIh8oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jP13KGYRzSLaNfHBaxoirxgTrCdXHjZMdIHUn7mMc8qIfUYCyF4CSeq1WLxSrakpn2P2Uu6s0w3ji2WsraDorxMmJddw0YK74/DlDhweIZZJBZdXLyTk4mCZWCyRoU5TjpsU99PCjxWeQm4J2Q9QvqV3UOP+TB7U+I6jPqTPcZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOrJgAJN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NrdXh6UU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbYJT1240908
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQwSpE841/w5w8K49zba/GNESKQ877/YE4Yy4Ses/40=; b=TOrJgAJNzi8qpOJZ
	XYT0Tk5ekbRg8Qss/oBJW4Nc4+H2IMEAUQBU9WOK/aWY6kFsOd6QpEph8f2Brrtb
	hhO4cRYLg35YBMab7rGO9RKbIxr87aW8CTkVM27FKy0qkqwycUyAyKXSeylgD0oK
	P2+hfDFQ6ICvliEcjmZbNnby5JNwgiv4Qi69YKWqRCQo9OkdcPeNecj1PpMsq2u2
	HmTCiWQoo2FHWl2XT4xXgu3/V2Js/EDyebe9P3jZYV6EHscYOZZP/N8ze3cjhh0A
	hle8B+E5mbGE09S84Q22KiRMS3yNy7fqQgm/pibj8HBYDjbnEfOsSy3f65R/AsjN
	sGG4Wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ss7bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so240901885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548472; x=1769153272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQwSpE841/w5w8K49zba/GNESKQ877/YE4Yy4Ses/40=;
        b=NrdXh6UUGFETC9QHveLvAKKnJCDpvLyP/eZCjuNsS2m09Xh9IGmviCNzRC9OjEwanC
         ekVGHmESdc1p71OWZGlOPFG7X1Ld+hg+tP3/Y1StXb/VpiVqVsfluOfCfZbUfosb/8T3
         XWYocQtqjhWn9zqp6YCWBztBkuC7FGeh/LsfVLs8dcNXPWVkr2OMs/y31wiMZbygLqcw
         pZuPEKbEUSZkwi3BpfWgXeCGWoL1f03Js7XO4XO/DrBcSzk0g0dsAYyTzZ+PyHY+FUKy
         b247h5nBPD8Nh80AAXsuLZYoqYdKiszy0Y6G/COdC5tFsAFI3CgLGo80CyzYThP/rApH
         ALOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548472; x=1769153272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQwSpE841/w5w8K49zba/GNESKQ877/YE4Yy4Ses/40=;
        b=BuPTSG8Rf7k2AQN9VIIfv32d0/axMrNv+InFE5yRwc9I6NNVqNkuuvik68IvXesrua
         thXqmXmLIRVz4OQJcTsCLfAY/zTYt555vfTV0xOTSVg9g4BO8odYU0BQXf5X7ZoXWBr/
         EcuiAo6Y4QKgGtD4ZZeeqZCYiabwu0IeLql6lprBYY8ycz09snlbAC2Tb9RhTfcjg8/m
         f7WtVLl+68EriBeuUpZTwzt3YQb0jmAlHj073VBYKxQ+oy2L8qBkMJVeojmHn4ukn42j
         R6u8UbLB5t2XKqKUSsbyXMsMsVhOwDO5SVSVFflNUI8vPDys6Dike49cvRpD7I50AeC+
         70qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU079OnhoxEVpftvYiDs2N6WPNR8POv4uwXFABGE2kABy1cIKUjdxxDNbZqsu3XkoD1+3wRcyp0FBC1kcPC@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXoJUTBDeGG7DqXNglxgk6jfSL5Y3xY8T4zXRyQ/UUNKmc5LT
	ah2g2JvT1JGwyDH6tSqrDHKV/o+lohXQ9UTxkFIxt7adJMehuZ0AV84jqiZmp03iw5mMkogjOd6
	hgXgaRjHNC3WG0gBXY5g21+69UTpXKU0auDDTS/N2xllcVqyzAI6i6TXAJp1d38GpSXcm
X-Gm-Gg: AY/fxX5RPtWplNpOESjCgInoSLId8eRIdxwCl28GKfMsxCF29i8O5CsdT/JaHuDB1M0
	hgXKrF9ly6fLTK+Ifu+vXKPZzZGkhe0z+wpk70lCI5mMNWpd3VceN7+AfzcCrjJwYL8LH+LXYgP
	j6ZyysvksMMaPHBMvIthAGTeftDRRV2KUPjsMKQnW4fGJjuCyJLtT0BbcoEM9WyBKjNaKfnafWv
	Wa3/oTZeQb7454cOl8Ae+5l2DzieXdOevMa+4IZ4RHiTHApNRM9Iyu45BFSrrNf7p2i0tOxgr8/
	TN5XoPkoQgHRntCcb7wjr2Zhd3CIEWWeGoo6uZkhKZKZ4INf0RZu8iJAFo353rsS+ZBiMmYfm+0
	Uc8n5ZunGsxnXJSP404uk/gnOQ8sYfVCdRg9oEqLaWc5xYqEh4wOjsE5y8JID/XelWZA0CI7n43
	gGpW5zx0aqPGVOOgQZULWpkQg=
X-Received: by 2002:a05:620a:4544:b0:8c5:2b63:2d21 with SMTP id af79cd13be357-8c6a67bf47bmr289870085a.88.1768548471625;
        Thu, 15 Jan 2026 23:27:51 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8c5:2b63:2d21 with SMTP id af79cd13be357-8c6a67bf47bmr289868485a.88.1768548471174;
        Thu, 15 Jan 2026 23:27:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:42 +0200
Subject: [PATCH v3 8/9] media: iris: don't specify max_channels in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-8-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2353;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=isNHAvh6bOOHjhw7YnHhExK2VyE29bdL8UUCGiIh8oI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehq4h46M3g3Zgg1RlTaVr5p9SW+M0K5Q8QHP
 Rku01mDAemJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1UsJB/9om8iiVWFw7UE0znMS9RLRdli9Jy0yJxZQEPBAOmkpmYTAIdyDbNA+Sy4fDOGxcvv1fZU
 9R7yjlfqKHuCq2HpMqBZ3DjrdX9YOHMF3QWMCyky6IgNYylz3Pq4v47zD7Xbsn8/4xcsfGZSbUw
 27pDQIt6/M2ZYoteiYJK8JLjWLr+BQ5LRN26PuHZAhcpi5z/ixU+ay6QF11VrBFo/5e4qCGJNaH
 uIyo7HzDSFH4+fxcMVyRsb0ufCWrHKGXZWktJusuzSkxBlJA1uQrN9Qh9iyP9VmohUcVGN5Q1Rh
 kma2U96aQ5PqxbUHUJcgXi5/b46yCw5nakxIV6QBuisbepaC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0GQq29MCn7X3MGNSZhX1XpHwS6V-_Hmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXwo5PX4b+0bPo
 K2QwLcOT7lV4/cYgaLqbhCyxfGVp61IWLk4j8hHRmZaC85eXymeYMtH+dgGiPtxQOA6xBr/FNZX
 VH5xUQMxRkOmnBsORvhqcRYr4vq9hVb4F78VIatcg+4WSXzbtQrKComyyLgd+ySc0M4jnwswyiu
 ejAYlEHTZ4OnF9Eo55U6wr4ipbi1MnAqL85w1BUd2otTirtOQLzSwbpFfOd1PG0jSieHTbfGas3
 m8qar38NKexHFIjm6GXoCMhpVwIhB4zpt7fAbC/JhLEj5k1IrCKRqrLztdrYmYlFtLgzRasitya
 BZ1kcHammr+n5SrtiHoQYEJocbTP4NV/rs1BnWjxs12jiHdj0rv/xK+QNI1KJtSA0BpaWNUxRi+
 T7RcEHgOM34XtYjVWc9/gdQMBsWT2W6ZsQHEKH0FAXYzyniMBTKgIK5F+1XQVBn5sZdcGea5u85
 MDxQOGyBleW7nYG8Tlw==
X-Proofpoint-GUID: 0GQq29MCn7X3MGNSZhX1XpHwS6V-_Hmp
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969e878 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a49394b92768..0d05dd2afc07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,7 +140,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


