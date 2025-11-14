Return-Path: <linux-arm-msm+bounces-81761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256BC5B2DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B59A34747F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6872F24A076;
	Fri, 14 Nov 2025 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLjQtVA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2F2Fmu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E2F246774
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091533; cv=none; b=S2vsrjY0GZRW4ZBwE/CrGXjhim1pFPT/Mpt55GSAU2HeoWWim1OO5WmObtrQFHAVkj4jibpV8mrckr9cDj67GY7nSdaR3lt8toWq8t77xpnV7FnF4VoAXU5Mo2/v2zM7C1O0btgFabUH76sbu25SrgMGIQks8Bu05QtD3DP5LxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091533; c=relaxed/simple;
	bh=UzdYxELmm0fm7erfuB0UTWHLqKKoidbNoonBnq8ggb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FTXkjH0mgmi1uqpAEFIVr9RWOqxuWJonxZPnj51d5FyMKty9IgOWdx5LOgLK7lj70QWw75KRwEvXknbnzNP524KyxaSABrF+6L/qPNJLijtto8/4anfDCNuhNlgNp+4aVqODgGJLFUjHvYt7hLHdqjJuPyqsllunR6nV7FMCoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLjQtVA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2F2Fmu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaoNl1424135
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tFJvq1rRN1cvHD8aK1gK4T
	3ZkfSL8LrK55nyklIFhF8=; b=hLjQtVA7tg9QaVKMVkGX5lDbjapvfaLAWseh7T
	/G+b4dtNwVgW4bTuayMg6zdtd3qLY5HX94rayHCZyyIKUgyFjaRqMwkkQ0u14m/2
	zFfG2ZIdbNgG0cNITv5VNudmqMu8ixH+A2gOK+c2dIEi8dgL+bzXbW5SUeOLoFGB
	ItmEqy7S0Nr5Skj3MP23TN040tfWo7aDyRw99xC+hg6QEuNOIN6cKE/aZFvIo0g4
	tIVAH5VAurIbgnr/tdeQKLl4WVXz9b4HyQ/A8m7rIxeLAy9ePoLeTYnkPLOC7rV8
	ESEWqWOsM+yjv2YLgR0U5C5LZr5TDDlHWfPYr4HpfL+VecCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0nsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:38:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55735710f0so2613778a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091530; x=1763696330; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tFJvq1rRN1cvHD8aK1gK4T3ZkfSL8LrK55nyklIFhF8=;
        b=U2F2Fmu8hsayzQi4Z4xHO/pyQgkxwiZUg05ErJlNwdLOOl+bhPUOGQkW0Tdamhemfq
         lVGOSA7l8ZLtjyszzUSqMYEy4Lk+MyJWDrwra/MONyxUsdL9rouErqI7aChn93Fj9xRX
         RsgPxJ5YPnAdwKrlA4VVm/Fyy5iIFKXiowkCxRn1Zu2+kdrbvUQZV2vcLLxCne9pRJXu
         GYXWM37ovnuq3iFk7NqVV2t3ogXWDLCo+Pxo6bL1G+pFaDr1l3dUm0hbyn5iW4m5gDjc
         mezitAC4xjMaR5b0h4sGNiltGlF7fpgxSMfJcGq0TomI03LP6D9MF5Mok3Ah4zRIixrV
         Dppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091530; x=1763696330;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFJvq1rRN1cvHD8aK1gK4T3ZkfSL8LrK55nyklIFhF8=;
        b=vx19bCLkPKl7Mr9BZ9cjK7VBSmw7Z6ibETOaX2hSMgyaDMV8K5eSCQJz8PRnaJirfz
         eFoWC2vX8IJGQ3xT4Mxru+mfdGavFHH2fr64+jh69atlLiSednrVwm3kyX6VjiwYkf9W
         sDU9Lf65JaNn7Nu0EYw6OLYGbSBWoOPU35YuKsVzPuWzQbCHCcc5h7FQ2lN/0Rlc58Nm
         1IIu7g2i/K4D11sZashDYC4jli1W8kGBHPKH8QQWVapTktMf3OQ5dyTDtRK5Rf9Qti5r
         wKLSZm/xRTNiM9sRw2InDR6bpEolhOQYc5qTy9VSa1Kic+7MyUny9sa8Bt8aCDh4IuHg
         rm3w==
X-Gm-Message-State: AOJu0YwIysD7OMy9w+1o1xTITCwuQKIxcsbCJme4UhPWWeaKvUMkpkea
	sCxmYjI0nLD5/rGs7Z7T/Z4OP1pcaWlzPlsjcM4CP5/16s+bb33O216ubGC1zquRAu/L/4/SN0M
	xFPUFKo6ROrd1LeMHA0bFDrx5K8z2SCVylTQWpLwZhAAyAVC+HKB+20SNJ93BwkIEh8Q=
X-Gm-Gg: ASbGncvcTuzx4AAFvaOGH8s4XQhuv9lNu7R6HE+6CdxeNVoyorBRTqwyjh/Bu8tMtZ9
	xvhuZrv61pbDdMF8yOX1XqxWeg58zBiuOmBg85ordUhDMxWyw6NM4HDGjhiztNRnUymY2xFH4uJ
	ZTxbP03t7XJ0PkZwHcGd82J6eYwc00Euqdw1DINCuiQK+nDYfe8kJaSp1iv/eIe5dKEfDl7z6q3
	N+j06iVOeZrlv6JzHUrHudQISfL4AgS87qIh6YqEWBxPcgXqJ6wkRCfYoecyX4cSKuq0W7WLHzK
	zMBw3MM3jse+UYnbTtocFEKTKzM4Qt/1Uv7Ij0rXcjgsbZBPhWvekvtD3LCAtJOEiA36wQs4f+5
	0D+72eZX+02a2jdYZiyYRyIugrYEBTlAma0elWr0OHYbVAXvoQe1liYGy7IAPy9irguDY
X-Received: by 2002:a05:693c:2a09:b0:2a4:3593:c7d1 with SMTP id 5a478bee46e88-2a4abadfd9bmr420856eec.17.1763091529485;
        Thu, 13 Nov 2025 19:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBih7Mht4+enNunC0YOwy9e/fKbrdtOHYPaIbEUPGCInd8JEQjQFhYdCZ+tdObyIg/hJHBCw==
X-Received: by 2002:a05:693c:2a09:b0:2a4:3593:c7d1 with SMTP id 5a478bee46e88-2a4abadfd9bmr420846eec.17.1763091528757;
        Thu, 13 Nov 2025 19:38:48 -0800 (PST)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm4788886c88.1.2025.11.13.19.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:38:48 -0800 (PST)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 19:38:42 -0800
Subject: [PATCH v2] tee: qcomtee: initialize result before use in release
 worker
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-qcom-tee-fix-warning-v2-1-915a460e7d21@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEKkFmkC/4WN0Q6CMAxFf4X02RI2RMEn/8PwsLACTWSTDVFD9
 u9WfsCXJqf39nSDSIEpwiXbINDKkb0T0IcMutG4gZCtMOhCV0qpAufOT7gQYc9vfJng2A1Y2qq
 256PR2tYgp49AEu/aWys8clx8+OxfVvXb/hGuChXa5qT7punLurJXH2M+P81d2lMuA9qU0hdZA
 Kt8vwAAAA==
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=6916a44a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=u3OCN9FIZgIKTxxdmMwA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX+BZ95vMdsCNX
 FzzeTQp5fwJaIICSVSURuPi5PXOHf4Qic9vcmEPRFIrb2oEkng6dMmyEwijxI0jYr3Sbz7MxHn4
 xd3PxhtTDklhJx3PB/YlBFhDydlOQ3+Ckt1p19gNg5Gn7Ewype3T91SMYc5fwE4qL6dNYdB951x
 pmj0L8f87arztQp144F8kD3hyQM1wAWkfsPQJj+u0UIy71tXAxH+w04M4uWeJCuJjv48FvPwbl9
 GUQZVQntZTzPXG7KreXIRSyJIXyEylfWVyarSO5nwFw7lNnnSYLabqTWwOBJjKgKqU5SDgvNUKH
 s5IH2lEjz6xMdymhZn0UbxzkKHbD3x8TQ159Q2+Xd6S2oIFnIgpDuQULI3DSuO+3KA/X05YrRDG
 6tXXTAU5H/EawvWuUtlq/ojA293BIg==
X-Proofpoint-ORIG-GUID: -VavBVaM4PlG-Uz6kKn1-mHuLrlcNz7K
X-Proofpoint-GUID: -VavBVaM4PlG-Uz6kKn1-mHuLrlcNz7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Initialize result to 0 so the error path doesn't read it
uninitialized when the invoke fails. Fixes a Smatch warning.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650b5@oss.qualcomm.com/
Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v2:
- Update subject to tee: qcomtee:.
- Link to v1: https://lore.kernel.org/r/20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com
---
 drivers/tee/qcomtee/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index b6715ada7700..ecd04403591c 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -82,7 +82,7 @@ static void qcomtee_do_release_qtee_object(struct work_struct *work)
 {
 	struct qcomtee_object *object;
 	struct qcomtee *qcomtee;
-	int ret, result;
+	int ret, result = 0;
 
 	/* RELEASE does not require any argument. */
 	struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };

---
base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
change-id: 20251110-qcom-tee-fix-warning-3d58d74a22d8

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


