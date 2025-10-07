Return-Path: <linux-arm-msm+bounces-76237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B786BC2150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2410D19A40E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A60C2E1C61;
	Tue,  7 Oct 2025 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRYsPwKw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A62E7BDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759853858; cv=none; b=iHnVI6fikyZQ/a1iDB6hjN5J+7EOdQm49TsPxiBFMa9UBL252owVFE4tTz1cV9l62Wvw1H4vi2heOe4swIorAjZK3Kp++W6Tcvd/vT31GcIoRr6nGHOiJkD+wYm+N7ljT4+K5DpTrfn6SoiQGcDFf0biv+oKMwbJR9MUTSFOJtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759853858; c=relaxed/simple;
	bh=Lk3fMAZTY2CbZyLoQ9ROEKkNYBdHcDKhzneXS8EP3mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7j6A4OrajcMqt9ZxdalPW2w2TDsffssxyNHhBhO/Pn7aldY3P5bwBiTPrgr9YaV9Z3hNvoV51bH7zt0TGhCGZeK8zu43oPlY+M0eLopEtQyQm2f4TeqNktvM5FWGUyYedDmhx+82ySGnp4iCg1CPH8vaPUEn9GoIpAJkjpNkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRYsPwKw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETYhn008250
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IZE6vPm/mR2Vdzuy+jmtdhyTKAyBvn+66g0
	GdcTYzUE=; b=BRYsPwKwhISpGnkR8+SyG/cMFPJpEnONriZiEA3vpmJmCZ6KKpi
	nZTA6gj7U5qaEpfGMxzP+h3cvGVcCilsSovUoptRwWVwxUuQWR053sGMauqN8j7G
	nty3uu3byMTMWH5ggyF6P+/0k6abj7mpR0vN5pKCc4H7kc5pTqfjAvKblwB1BRKx
	Bz8rmCn4Q2BN0eWq8aalfdowRDhs1BCuS/glcZ2ncvmAuiqnTlTYxY384gTYU55J
	FgPl5AAbxq6WcGcssJXD9h5PqArFeRxaFMUVZVlkBUWbR069Z9dVfio7J67e3Jm9
	AMWTF2ZxK1mYmDoo5kdvpzzzPW0gOH/DKmA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6yu8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:17:36 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a87b8f9c6so3410944e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759853855; x=1760458655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZE6vPm/mR2Vdzuy+jmtdhyTKAyBvn+66g0GdcTYzUE=;
        b=Qvw3xRHb5yFFFSiiQ3WlCY79w3Gp3huQ7gFMh47UHiqXGypsN/eVHCwVe1IMgBdeFu
         UD/qipFX3cBiF17MxcbZNMsuS4sm2qHKYKbSo688F4+CLzeeEQUGIcFrSZYwvb/rS2go
         c4c7oBZwW96gvSLMADA0z029rdN2ks+nt+cXXZy/l6li/Qmx6tdyn1WsM4uHqBpoOAx3
         /H9V2pfSUgjcgp7WxTC9EFAQbc3QYJCJXEEw7fsRsjstTTFS7YmwNGoFHkV+9SiQ1s0W
         6P+vfdoLzGocghhtEb47S4mw/HlhzLP87T0d1VQkzSZw23PsHdrdsrmDfPZtQdODuYIE
         PXZg==
X-Forwarded-Encrypted: i=1; AJvYcCWl8PeksunBp8aap2fxg87X50KB6gRvh33+aoVa/B2KrNFjM26FJN8KGlwdnajotNJvpfZPKsCEwsWJ7bzV@vger.kernel.org
X-Gm-Message-State: AOJu0YxpoCA1oJkhvmuJLXPrXdBAkbKxpwHCC+Fv3xhhN37aQHPUArVW
	FAfxmuTpM+m8EFMX+N0R0k8CWyjw9AZDmB6qMSvslSXhECqq7wem9L1K+eV4CYSW4QOQoNSqoTU
	29lhkJ+12Hd7wl4acEX1iCHYO3f6D/KESzateTr4hvMv9iUnmHC4OvoRGBoJ5gLIDPRS4
X-Gm-Gg: ASbGncsOTKH8nSFrscNio7LT6Rgwbo5XfRjV/dFhtksePxlJ03+na7TGbPlbrPyTnmm
	hOo/5T5+VNMUrSYG0XCbtO7IdcoSoJ6evZl15LP0mrSsPcr9nFVc75AXIhPLUoi+sdiDoaFhuna
	QrA/EZoIGNwHK7YALn4ihii0ybJFHoD/8RbQpN22yhPwAw9FyK7F0bDym1n5nuPal/DOdt4yHo+
	1S3sU5h8eiFq+zAg0/JqHzgedzTAX+hnbYC6oSd3vPxjHJRAIy2TtMxWan2ivXraRGXRCRoppk4
	uKlwbDy+eUC/5JByY8jyBDlE4DaWSgiHtFsfE74nERsh/bXcbyfL6/kK29TzHWEtjQZU9Cy46XE
	gFjQrOz2jYw==
X-Received: by 2002:a05:6122:320a:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-554b8a70d75mr102741e0c.3.1759853855132;
        Tue, 07 Oct 2025 09:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe1uPOLGMhSgUB9H4U78fo2BYswE+ye7kZS5YxkfM9h1TqIT/jN8eZnr1dbhNpAeuCOMLhIw==
X-Received: by 2002:a05:6122:320a:b0:54a:721a:e4db with SMTP id 71dfb90a1353d-554b8a70d75mr102711e0c.3.1759853854512;
        Tue, 07 Oct 2025 09:17:34 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4e5d8sm1413174866b.82.2025.10.07.09.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:17:34 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Add QuPFW image entry for AIC200
Date: Tue,  7 Oct 2025 18:17:33 +0200
Message-ID: <20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e53d20 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ToPsW-EOJ6-KaudcJkcA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7NlrErGfYMQgQR0QN72In0hnn7WC6KsV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX4aEe96geYF0p
 ItOiozO7IplUMbJ1Xlt+cDWI7X2DKEBJHjcIFIv7qNrWWSu/qy+Q5EGF1EA9B0Fh+q7ksx68ARy
 IbmAL0/E79VjaQa34bxPvPU4hYX0NP+wXlDqTPV7zPaO4s1DsWzeC6VeaW9lNiFvOHm7zkn7DOJ
 1U6i+c831IzMlX/XdnqWCyExyPqUhOj9DcJdtFnnAWf3oSuKFmj0qIJdTV3eXLEx2GFbCdY1hvN
 d9LO/EsCIqTsLq1n83+F7WhKrJ4tkZimh1ClI8Qadn//b+QMr6hvCDgcGlmrBOtlzX33b/eXSh8
 Tn8w3iOekr+hJvoYrXekCs7HeyV6NG6figLKrE6yy9utFxOaJB7VkdomnakMYgd6jDv1yRIA38D
 TNQFpe7GflE/nzdvB1fgJlosJBFv5A==
X-Proofpoint-ORIG-GUID: 7NlrErGfYMQgQR0QN72In0hnn7WC6KsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

From: Youssef Samir <quic_yabdulra@quicinc.com>

Update the Sahara image table for the AIC200 to add an entry for QuPFW
image at id 54.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..3137fdf20be6 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -202,6 +202,7 @@ static const char * const aic200_image_table[] = {
 	[49] = "qcom/aic200/shrm.elf",
 	[50] = "qcom/aic200/cpucp.elf",
 	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
 	[57] = "qcom/aic200/cpucp_dtbs.elf",
 	[62] = "qcom/aic200/uefi_dtbs.elf",
 	[63] = "qcom/aic200/xbl_ac_config.mbn",
-- 
2.43.0


