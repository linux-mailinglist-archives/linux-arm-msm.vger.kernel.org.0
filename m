Return-Path: <linux-arm-msm+bounces-106376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eskxOgmP/GnDRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEF4E8ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97CB0305C26A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015C63FB7CA;
	Thu,  7 May 2026 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq1IJy/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEDkCifj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8357441C303
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159051; cv=none; b=JpZkGx5i8jqjX5ZYEflhzCpQt+7ON2N1gPK70E66F7vJ80cgCiB5UaK7FujcXuxvSh+3cqcXrrKtBUmCtr6iCsOCimTm+esuZ0vvFoucrOvCd/4uShOb1aOS53UKe5oWCzRdJ/Low8BO1LdzugJwU6iO9CPRcgBdF0If6DxHtT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159051; c=relaxed/simple;
	bh=6/5IEPHnHjsy/MNdRL68KMLC1ruE2SNNotIn7x431DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KxvSZR6qd1NLR5h8OTjdjyf0j0TYAwKKOnfo5uNezHdvzV1e0BbRuc2sb3Uxuabjrr+AJfyZLh5JZn7AN0Es+0oQImUfxmuA3+UKfXcdLtKx2aTFs4Tz5LL59Qdqljh7hqYaaXbU7XvEnJc5z1mAc7X3USzyQsnPZOBOt/eca4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq1IJy/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEDkCifj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BjbMN3924358
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8UKyBMI9aXDerKMMuS9I2o4XUlZFnkN8S7rKi7M+vI=; b=Uq1IJy/htIJt+NQP
	+97RGvKvMroukDlzt519f8z+PqWkQET+cP6dWSEoY8jeVlArZ4G1orGtyCazXWrP
	lCc5d/EhRaLPN3eSv1tZfYWUr7hEDCEU7ji2geJz6m8WXMysyihaYYMnpNj26Ygc
	DrInNxh4Q+oH2GNdiFa9FTpRstwGjaqhlCg8Hdx2krprQHfYAy/IBf07kS/BO44M
	rJ1b0oD0TQH4LWLKjlLyxThQu/AKCaG+AP4gZjXhTr2zsY/8wDgj4lBBkpAMV7MN
	ROiWwRNSQtnhCbSoggSsEBtDgHZCfyopMn5kafLVQoYBFAZWGi2ClYKel2h4HlY5
	Zwwgzg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88b5jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:09 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dcd7302f00so627267a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159049; x=1778763849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8UKyBMI9aXDerKMMuS9I2o4XUlZFnkN8S7rKi7M+vI=;
        b=DEDkCifjLBbylbbOOwnqpnm9sCoLA6UrkaPwqTbwNT6jTdArtAvl1s0YT0BQ8ysoE0
         9tBsDVZpMynOolVTUTUIw2m0ZraGYoR5Px/3Yh3QgCeJhjE2dzvZKFUrAfuqVX5J2fiJ
         +M+uPoqLKVOmd3rhmt2vZRdV0qWsvZB2ONg4FfW2Wn+a7aVzQKLXS9Af6KJYslaeCYVE
         RagoP3PvEy3zCc3jx5xkAdD7nK1sYfNPUEVAJZnqP4Ga2b1A6f5N3deaisWUMBS9K37z
         WX9z1YGn/WAp5LIVV8f7xaUzvoKZibDG4Z5QOjreOuD9wQu7Aiiu/HEvs18T3J94CcVl
         DTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159049; x=1778763849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E8UKyBMI9aXDerKMMuS9I2o4XUlZFnkN8S7rKi7M+vI=;
        b=FVhj/agl9/zr+Z/dVzB9CnLhRYcEsKZcgjL4Y0uhBIjlVZF+5SC7k4Oto/KJlgkNwa
         NrCOTOEMDTaZCRwl7fCIV2Fput1vM9eaFTeAS/D/jXyHHMhNKgtCtVeFq/fXn6gTPO2F
         CljbdfiLG2Xmn4nobGXpp9o2t8VDMMhJpYSI9JW6ub6sBV9fhcqXljX6AB7qR+cTkImM
         VBa5mScm9fyH+xApdXqpTcaqdesKWF15gSZHM4UGz//HQ+/BCVLZ6/Ug+jQlqdq8gjXe
         l36HCzbelWIgPqxhdwR+/ZcTucYJ+DTQZU05TYdW9YNZD/uL5EXZH2HHoNzboifRXodz
         apuw==
X-Gm-Message-State: AOJu0Yy0wxfqtrgWwf3+2fqXk2ocBgYD3ZGiqLQrXr5GwIRn8OYZW5eW
	UYOjJ72ZXWzQvWq7lzV8zJJsiImTqVx/iWzW5l99AkZ268NXKvrovru2tl5sO+IZGGFZdKXrwFI
	1zrFUUr2DQoOjcsUoAwDwWdzg+M8MHib1jITvGH1r8lP0lREr6DSHQDtKLsIodl7qtBKG
X-Gm-Gg: AeBDieuEqVO5BOyhc8XzfrZ3rI0kqjypI6FBFWhPlUnToo8kwVwfCL4mA2o2BJDJiMW
	tf+Yog8EYmBUgy9BwVsHYLfbEM8iDpAG3+Gz/1Op7xUcBgYE7VonEzRg2qRQkcRV3EJk540u0UE
	HAf02Za88T+CjLZMwn2oGJsj5ZJkyeGH9EHAqNz/CeJSgbC/Vn37Py9A+F1ZqffcNGFIjnsyU6B
	RIdN46OMsXNr+D56TMpxiVpeX6KY5iMaF27dC0dIoLPA8SOB3EEVo/2yn5Of13Kj/lT60R3Emrj
	7r5qGegDj9vUMlDo6HXqEYgItZM2n2SLvGoUFdGNWtmmD+/hGy5C9cHV/RtyOVkIf0p+2ipZvLl
	f5KPBWShyyjDVZn3qQ4ouajGk68cbP7Aui/wOie7qkEtdpiYjssxPkdcD3NhValIp8fvw23egHN
	4yGPipLk1nzk1P7pVZ5U3Q4evd2JXl95c++6i8npsJGNpgnOxhRaY87ASS
X-Received: by 2002:a05:6830:d10:b0:7dc:c43b:9599 with SMTP id 46e09a7af769-7e1dee5c2a3mr4091758a34.7.1778159048938;
        Thu, 07 May 2026 06:04:08 -0700 (PDT)
X-Received: by 2002:a05:6830:d10:b0:7dc:c43b:9599 with SMTP id 46e09a7af769-7e1dee5c2a3mr4091665a34.7.1778159048321;
        Thu, 07 May 2026 06:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:17 +0300
Subject: [PATCH v4 21/29] drm/msm/dpu: drop ubwc_dec_version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-21-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/5IEPHnHjsy/MNdRL68KMLC1ruE2SNNotIn7x431DE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2Hiuz6OTOj8UzEXAFUw/dmR4jvL5EtTdsnI
 2df/NhAQPGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhwAKCRCLPIo+Aiko
 1e/2B/wMxNYcytNhIYIBg35i5k6yugSw72+pS1wXnY/InuMscCe5nB0HcZfOLizjCtlCAq7eL7d
 Fy8JHAuLUS53M8E2nhjNqIByrAWWSW25IOsGW9D/SKueRMcoc2RVu8UwE4qSWZSmYIJUV/+K4mG
 6m17Ww0RMjc3Lf0L3gOHW4ZGWlVzget66HXzQgiNIasg7HcVJWhrvHy5iF3Aa7NbqNrX656jG9e
 nyNyA0C3HSB/KSgSYu5pt0Fag6Rl5R37o33oo/DedOjgB9TDZTwDu7rrOVN7E3v/OFaua6mS/Gi
 eHSCbmZ4mE1iAmT5Q73vIXlmtbKlf7m8XQt+fMtYq/2oEZc0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FYe0LUDCMmuWDXACte6dvXK4TkvRS-JQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX095YpglyMChG
 5YQDGhYTURaLwEoeiCf5h9aGA12JRTo1SEEGwRXHQ3DXZ+bNMPcZ05x2Ei5l7F2vYOQaVJ3dsi4
 u1iX8vHG7kaE33g3cJQCvLrKAR9i74MO+yPnGTYTEuNugW7ne60hep6Lse6t1xVmaZdTAqvCdAz
 IqErofM+AXfTPXbH4oM2tXvhmfgU9/iuvfHRt9yIPMJ8k8rHSK/PxpIt7Q8p+9sfUQuiMSdGSo2
 oalBmXvtc85CnzQG4sHLqN7RAZb77FquPzWFT6PszO7mOj8Yo4OAChEmTuRXH6oi1OMH3LBznbq
 Dryl1gJjPkX96vpsqpcnWNeiAZ3trTuxGNzYQZ/tsR+OEFV7oAiRAy6CddbjOOmeB+9bHyYhYXT
 lR6f+V9W7E8zcNTxLyTb0U3QkFySGfh7K64JzCJQz6rmy4/8fm07Aj2QXio5lOsiwzkYlAkKLys
 wCPtXL0sT/gcAhfgKWA==
X-Proofpoint-GUID: FYe0LUDCMmuWDXACte6dvXK4TkvRS-JQ
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc8dc9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 7BAEF4E8ED7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106376-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3c315d5805b8..5f42058bedbb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1781,8 +1781,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3


