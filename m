Return-Path: <linux-arm-msm+bounces-95887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKcODA4Gq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28F22579F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD27301D68E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF6C42669D;
	Fri,  6 Mar 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUo/ZWRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDRyPOsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4743F0775
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815662; cv=none; b=ZRs/3Tob2uBA26boVma86Ce3S8kGl3OcyejqLiEEro7aFRGZah9JARLDa6BEeXt+19jjMswjvRzirs4iKKGCvLx2vM7DcHNl60F+xNIzfBuQBGAqk74iiXUMF68ndVh22lC5wTddnoGIKmWiTJ1LiYWMaczQytCantzslk5vN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815662; c=relaxed/simple;
	bh=qsOpdLggOXLMpfbLwFYg8PlGDKmsRsIEs54oYjYlw/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTZrK0GJnVgwzqU4fcofmWDUtpcP2A9WHtQgSv8f9kGs824hFrpLcqAx33BDpoejUmgee6/2QhBKfBit4VnIDEBXeA5XYZAueiFWlAYom5ad8PlkNbKTxD4FCwEArGZPnuaSW3Ntu/OQI8ZCOicvaT6Cwt2T3Hia6+fcShI745Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUo/ZWRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDRyPOsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FqwNR1187733
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=; b=RUo/ZWRh/8xT01VC
	bRYEW5v8dCgJtq+Jio/JoywLt2w5tQffzAwEQYS0dEX00XMymcOxEXbIyL4Xt4jm
	aas/XjwGagNROUYBqF2qn4KMLrctlO5dTIkfTgbkpuTSg6dwxWbxuqQoXGjQ41zK
	yonQti4zSCCn/1iIBcBzTFEJTnmUuRwfXWLhX1OKXjVhfKxJ6pCDYP2Rkw7/WYM7
	iMy9z4APiIWIiJSgXOCyZ5PrYG8pLCf4++K2iLGqhFDvKhFnC9k/VSIH1RtV3Qb1
	PQXlwqh332s+MFRAtQUQQCYH0Em5HONvXNNRXDm+eppn6D0v49AB00dA4ZO3Lv6y
	uk+fMg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sbfgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899edf01747so443524146d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815656; x=1773420456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=;
        b=FDRyPOsjDy0qwoLx+RU5rI3007AP0bJ9z8AzcTIsENWBnH847SimQwT34CJvbhgFYX
         PRuKymXtQZtYitVcKdZi4GFztB/7CN3X7WSU4SrtcDLcEqKKQDKHzNMnZPwG8rBhKFTY
         VSyoYcN1Z4rp8/4JzHo19qPde+D7aTaF9raq8/j0Gh+h7zBAEETDrvvJVRxLM0r/ymLf
         1vHZNj4ZIqq/+y7Qc9GtkaIzJDgXH0L/Ooy8iEWjPbDqaulQ82/jSAVPvhOgz6K7xOja
         T/LAW78zkxdSZJ88WyYy2YA+m1ShpLZVvGjeRNViqmFFu2kVv5N6H8xAGJjy9wpHuUoc
         0pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815656; x=1773420456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=;
        b=OGs+jCbPx4V05pcUF7mLglXByhGw4gbW6QN4uKeGnKeIwfO+/Tq/AUpjappTadhxbf
         0TvyC+QdqZx3NkslarOocJpNmqhuGqBRNYAq1mu0eQcsyZ0FkAZeDVvihPdi7oyisijV
         r2PNJXKpVzSPV8iK3N8cnhxgrH9zjdHMlf34GY4wlkkj4eS+aapj2+r+Rk6m25Vmd4zs
         5v+PMo83liC9zcfrXYg4zzYn71CBeOjZwCHRaIqHj+azawLbwJgAWpNBW1tXeBUDUSdJ
         gEN6+2FKL6rnxD5J9x7+VNdo42WJeYPPjhsAGCoMUTt7wuAzotPSG7UZ8f/4LrJedmQ3
         O3UQ==
X-Gm-Message-State: AOJu0Yx0rV8O4bSSVk9d2pa83HQB12RaqRGe6GZ/wHN+/u2B7Ul5Hhxo
	6LGsczbIbQeJEfJM5LhTX1e6jIOc8zdPqCtu/BWKJXRm+ZE5YSjPfW4Kg5HfFaLNwwUMuBc/3dx
	sY8SGPosCszgH1HyOXFV0lhWgVS8Zp3HoxziehiVTdSCHgP86YmZUFexOTnf8nsxL59Wq
X-Gm-Gg: ATEYQzzLW4RIFy2l2CwYw9NbY0SvbjksnRM9Z1SglFrB5ubgZN2rrGjx+HX6N/DxjNP
	o90nS0SqmILyf2s3bSj04mxea6KGPLhSvYr5FutOUP6UwL5G1phqXW2CI6BdnB0qV6Ik9MDou9g
	OyYrL5fY0F1UjKd2sQWZvN40ZEzhgmJg1zK9V/HW1hJdiHIzdL23kbK27DYaC435FxLtPRWoAiI
	ZIBQKccHrvGHulmIcOvV9Et4clkkwF3xrL8g8hbqj3eIsNMRPDl03vxuSNr1MWcyWbXxKkz3ehg
	D/XnQf/9KyKvw6x+A7dMNR28OIu992v+TRUTmQBuoGQBjUj1RA5bp7n4p5vnQrxYXFMd9v5yPVS
	FjG475dUla5ffUIwIFJEXbdtfxXGtUb+Me6xBsYmB4lVUQUKUyohkauH+ctIWD2HFzLTQlIXwnM
	RJ/B2VCgyIRrOfNIWLWe4ly/f4lZo2sNK4Ai4=
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cd6d324021mr353872885a.12.1772815656008;
        Fri, 06 Mar 2026 08:47:36 -0800 (PST)
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id af79cd13be357-8cd6d324021mr353869385a.12.1772815655528;
        Fri, 06 Mar 2026 08:47:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:19 +0200
Subject: [PATCH 13/24] drm/msm/mdss: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-13-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qsOpdLggOXLMpfbLwFYg8PlGDKmsRsIEs54oYjYlw/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOwmtRsGD4tC9puPqHYNiohxXzcLjDEA5Uh
 CAgwY2R9lSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1dcOB/9RSpFMP6nY1bR64RNcJvTiVkU2qOr2TrLnNTTJdrKYmebkWCnVJR4OawMqK9lHX1rn1QK
 oZwfQDrzMkq7vhgODaLuZwp9Lz+zZcLVBcS3QbxMSUtQXvFw/DewIC2Nllol7BQ2iH0vndNjg2M
 m7fEzvOEKpZz23v2ndm5pM9L4omgJZzSnYo7ueL1glzcdLBH6CdBK7er1EnEY5Sw2pqFjqb4zr2
 AMHgLiltIygWZWI9zOZe7jGued11wULPqYWI6NzkKZd77RCFz94sL0NKXKRMy3YyodMHq0DU6tC
 pKBBos0H9ueHjLKhp79Q39DtztobCoXWvzSIeP1IuAxjciSM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX5PieTxPB78eC
 TW+DoJMW+OCpDkvQgz5OEC1P0AL+sl5lDI1sEWFblWXQ/AEiW8gBxBQzb7ogSm6nzxEIlv0NQxZ
 liffoSRqH6pZj3fYUcZWlzObIPgngGpu13hLPvELILtpC0Dlo1C6Y9ZKgemdUzEMXYodBK6+Rm9
 zL3kAHpDvyiT5dVDA7pIL5agfRxqYwvMDNdQTGvOn9U9dRF6wmLzyVCt+aQbl3dLyKLp5kACkrv
 wU9Fwjo7sNrjde3zUbsYX08M4SoKQpnSjLQv0hz6Mol1Capeuprw30I21rXkZPYT8EMdROi0xwz
 JUXQR5dv/jTn7UDOxZWZ3Zxf6jeN4NpbVSY6Sy5xSv8xLONXcmNmRgwIYQONM+0cktilZnxildj
 okF4lScRpmQwxV5ONoopPexR4UpYpSa/lA5ZHQwNGD0mLDQD2JPXcUVwgxApV9+GREoY8qfrZmM
 IXP+m2kfmQtgYL0sPdg==
X-Proofpoint-ORIG-GUID: mXuIHWxHcshp-aWQmfMUgH2ukV3GM5_A
X-Proofpoint-GUID: mXuIHWxHcshp-aWQmfMUgH2ukV3GM5_A
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69ab0529 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=o1f3_DkCrcuZBLJIWnwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 7F28F22579F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95887-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90a4b579776a..2c2cfefe9b9a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,7 @@ static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_bank_spread(data))
@@ -200,7 +201,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3


