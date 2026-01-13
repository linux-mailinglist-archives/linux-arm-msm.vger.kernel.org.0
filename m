Return-Path: <linux-arm-msm+bounces-88843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C1D1A758
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D546303F750
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4185D34F466;
	Tue, 13 Jan 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl70m0mn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6FhPZ/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89C34EEF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323451; cv=none; b=q7eQdbToFeZoY7pa07GtvYbI5hmALgXxcGd2qa3P9VU7GBwJhb/ZXWjZjpb+CWAYN8ghtbdWb/+PyU7CJdRDhB+qK3eDF+tPfh7CE44v39QelHfi6VHZTjaUitQk7nCgO52Ia4mlTf/BlrCbSgOt99/IiyuaUUGFu9Q/4LLhx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323451; c=relaxed/simple;
	bh=htP3Z9truSrb0C/f6zBgHeYgKgcZBATzt8YmI0trXfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVCfrd4xZ3eXY/LpjaW9VwTqcFEFdjSQkymS4hr098CBgWEcy8KjzbsqKYxyS/Sg2phzEWjYGScAd9iQem5+bnU8JcIe8jUmm9v1yEv0UIPS8QAKYn5JF52T0YQ00oKFV8zyyZ9G5gUMVGq6nY+ctvAw5IyrqSoAeJC9X2oR++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bl70m0mn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6FhPZ/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEaedi405670
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=; b=Bl70m0mnIlE3PPiH
	xlZWgYuYfe3yQGbXCaJHGFprZEdXuDhiWbfEADlSsQSfeMKD0bwzFiXFnHgx/Cc4
	AVJ6nXpTaXAoK+VwLUPpEWR9pJ/RlOWqpXxqSfphEOpORj73NaZ5P/mT5hu1qDYD
	mam1bKmJPDSKGlI8gKF0jErs6HWIirJsPdpNdSPfkmo07yuX02mBXNce+aXOkWAd
	M68CXgvpH5KW73UyI5Ctm3M70MAK/msQmO+Om14m3X6rqcqs9a+CEw/cDfzLnR6p
	Y4JzZHp8dhOUBxyDxQDlCLY+9TdtANtbgkTBDzBAFQOGDNgPKwripZBC7qoIyL7i
	83mR9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06s4j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so31987285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323448; x=1768928248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=;
        b=j6FhPZ/D6ihZxRmkIXQ2LJmoOgdZ1myec7Q3PU0Y155rtC8HYTXvdzg7DOIR8eeVK+
         ISG4edqOp6vfqOnG82vaTCx0ZuULm11bEnWRFg7wuf1psR6OSCLtHe3JmD7AYAk8IThJ
         5nhuABEdsto7KEQUqNC54Cbvjn8MPD9Rj30ILyXx6Kkz4k4FlnWcPoM4SWzf8WPwkv4B
         SYwobAVv0E6NT+3L5VWZlRM7ePG9C2Ghu5zsyClLADhA9gZPpd46BsMqeUefbEAh86ot
         3khOznv6GD3LlUOPKi0GdRd0JL6H5tI6+RVMytrtkb7yUpc2uf3KM/YGUiEOr5XwX/M5
         2P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323448; x=1768928248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=;
        b=DRk5a298PPgngIHKxAikvnkLoeySHS60DbuUCwPHPpPE8uMPisWYLgZeCTLyBGsYat
         Lz0L2JRvcJI/zoxh5hsciZrpuFdoFRKgSJ3Ao5XLYS6YApaFav+DOM+nzTYbiWHczyYq
         EAxKGJ/h1oGB+SEpItkiv6h6I5ept3fK4urTMD01Rge1cnFQhKFElAmh1JthKi4DfLe1
         yFXeAm4vzlzv2kAtYdkaijTDdETGZ6n0av9xRjwR7shfJ5nJPZmBJ2tKcQFsMxuvbnzZ
         iNjA61olinACiSiIbWK7ShE4XyYbzueYrSzcYDhnf0+ORZwMJAu5kqcbFslti6u+JzyL
         7XYw==
X-Forwarded-Encrypted: i=1; AJvYcCXal2Bpo2lOyoIRICIxb6KM56FR8Pjw6bP/DVB1DdjlVqCXYx7iVayaOvDNlQHsDrmWVyJgdcvV39ZnFM3w@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZDBxV9hAO1/ocjfgY1rIfRKRZUTaqSuybPSnFoeq9uBA4GkX
	Nk62Lfk9HMXA2p9lR5y27SRjq5AZKp9W0V4P9hMZk4HCqo9uSYoCXsoTbQlMnTWAdRvBQ3+P1PV
	HyBN9zfbEHBpEPGwEeW5kPmSihrQ0Eb+AQMqONfP7s25QdxqXp353X/ZX7a7vi8UNKCx+
X-Gm-Gg: AY/fxX4S8K2M6yXY0Rj7arrk80e5lLgHgxiMImSrcnyqFScdZs8WxxPsPTGQt48Qp9L
	oRoJATbpliytiX0aKiNnvuokaVF6e6GfDAG9iK8HbUzza/IKR1xvmiNACqNwCcROGj3p9lSIFfI
	EytWErNec2PVLPtnGUZZAc2UzmdJkA3jWtn9WRebEWS871w9T/KMA3P9QvayYrpxswrIssFlc4X
	0XoTHglNJcyKx+tyZT6SUNMWNyERshCocFbW+1B9WhQfTaLdtod3IuTkp0PxkWys4XOvrjV0MRl
	A+03MAKVHMubw8lF85S6IE3Q3XUbNj+qSazyhAQW+0Fl+9rVrI31MO/t6W9gRHVCRkeYDmc84lu
	QLi85+UGeZGxnpUvLu4JhIpn1Dm8dF/3JEPJWFBg6HAU7Dk3f0cCeXoVGAYs7jYCbhwSAhBbI2l
	EqYhVQju06kP2h88D/ge5pDPM=
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id af79cd13be357-8c38942eb97mr3003665085a.89.1768323448374;
        Tue, 13 Jan 2026 08:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/AmuzhGdeXGb9IMgcYMTT/QFul/YgNecvob9Z4X2y8Ir09IUQq8baUg6jojH31xE/m7+iNQ==
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id af79cd13be357-8c38942eb97mr3003661285a.89.1768323447925;
        Tue, 13 Jan 2026 08:57:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:16 +0200
Subject: [PATCH v2 01/11] soc: qcom: ubwc: add missing include
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-1-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=htP3Z9truSrb0C/f6zBgHeYgKgcZBATzt8YmI0trXfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyX+mRV4ra4qO0k58wxnrmUYqzjwCmx66iL
 BixaHexCTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1XTHB/9jF+1UmwmCL8Abj1wTPKQwTjOSMKu6jxaBgqrHCKE6UxKbVVBKzZIVwfVdgEpPK4bJX1V
 Al1LMZOXT1R/4+nvtR89oNI9IjoQHm9V7VN19DULx6VgiTDf+XvDPHpOAMaW4gsZM3K5s4F2Qg8
 703xTjLcG6gJlNgQT6iozLZ4MfV4UIve5RBkxscPBuFTooHSC9klrNJ+LnOZcCQ0LJo9SgRVqz2
 /aydN9DfyYEdDTQ490hOFIoJTzMu8G32KfdTgnZT6nAZH2wdUwPvzfnHDxnGG9AK+HQe0qTIIZL
 ocD1X6Tbmg+JEpK+CG1ZUyg6O8tDRDPKBzSs1aW26UKO1vjQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ATwUpaswjjacv8reWSFaYP0bBevRgYPE
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69667979 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ATwUpaswjjacv8reWSFaYP0bBevRgYPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX2/jBF0qtoMfg
 8whMFIhrHttcPdoT8WHx8Jj2HNmXxBL4lie9/BjSvE6zCfiMshc5lWUqdYxtKoQjpTi3YNQJ3Bd
 x41z6XKlUVfERX2rA1R8konv76+/hnUI4/COIXrqzXbrJgSNLS0mtGxRTdaUfGphzfEfgkuYnfS
 zKbKJorWixU45ya0xrH07ujVe2IP/9yX5f4R/GmRIbF1EACEd2R4EhcuDusWtlyQl+mDL+ugw99
 /4l5GryY1klNLYHJvOQiPhHujWXkcSjwCPhkOBb+6PjIJLK5rYMQc+6INchCIrNIph/ELgs3Kgb
 JzFkOtY1EEDpHBMkH5ejC3KwgE6yzyU1ZtMFGNvTU/Ko6RbeTGHLAjj0aLQPrxT8TFRajDaKSNd
 Y70HfK2dCZP+cR9oUxoRPw+CnFEbyAJAyxuVPOUcq29fkFJhuC94jqvUX5u2VmjEa6blQdU0Mx9
 9qai25c3qKzLnyRtmZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..f052e241736c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 struct qcom_ubwc_cfg_data {

-- 
2.47.3


