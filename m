Return-Path: <linux-arm-msm+bounces-88436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88422D10753
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 04:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5358F3027DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A35A306D36;
	Mon, 12 Jan 2026 03:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg1DY6AM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3LZliX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B6225A35
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768188006; cv=none; b=syPhNMbkPzPczbujGbmrwTvRsPSuzJHTjMPXz+6l70zp072x0oeW+lOHSNED4sN4xs2X7oAz8ARobKqTKoxEqYPgDPNTXlTR8alXOCvRhR1PBJD2wE27QmieNXDB+qDyUOs6FzW9getjrjFNDekqDLbTRD6OHW7cSX1XY4Kg6SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768188006; c=relaxed/simple;
	bh=H1ner0M17Hl0wqh1seC36A6dgPhzLGS+dS+kwiGH4Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ra151pqOAjpH8vj6KaeAIcDpZREhwh+P1vsuC8TFeo8cIoOaAYrABx87jFo3M4sYRCLWI3B9wjwM5hDprBOi8RfCTOb8DgF6Fiy6r+vasxiQkiVw5zSFyYEr1FhpfJvmtnN4lB2MnpC1fFfjwftnB+LtgV7rpJY0y/Whv52M/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kg1DY6AM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3LZliX5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMdCFR1238549
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=; b=kg1DY6AMxLMNu2Vk
	y86WfTV+kTzAZ1DSgxFbOALuUHuAaDpQ40+cmHkQHOGqb0hMj3d5+zQw9z/pdRtL
	+BYSri6MXHy22jt8gnvO2M5HY5oJuSS+2iWDP3AC5qqSSK5xq1EpTNsWe2cnW+I6
	J1HrVAFsTSMAJnCP2Fjtoz97FX/TSiUBotC+OO0ngbmU6rpJU14DV7h+QQYqPM2s
	wEg0SjyB2ouN8j91l3eH+j/hLEXUONvV7/lpwJglD/lCoTtaFaKRjTbtfN+Wvlw+
	u+M1usmbVBnW5e2IWtiqZzbhJYfjIw7ww7YtLq0jP0H1j4GFikX2atSfxBulR2Lo
	81WGlw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfu94g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:19:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9411b2335f4so12663580241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187996; x=1768792796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=;
        b=L3LZliX5Z0IiU66aFuzzRQPeIMKnH9DUHDVnaGGb4Bq48wuwkl2wR7up6PybA3VH90
         9QDB/MUoOOfmgHnXnlTPu8y0FrGfndHIgRJjJKFVWkxuR5YkK7oYfyRJKabiRJjE4d25
         xzTvQcDvl8WyGXE21+cdG/fSz716hKAYcflarFRwhQH5xRQnhUJRs5Ey9xwGVcJ9Wayr
         OvFeMMI9I9YhEuVN9/OrVBaDr2nWgtDuGMIWoLp1rdq9h9hxp72RfacRrMZMJCziNr5z
         P6lWhy1xiKvYglsP0hWkLc8a1b/wW0Z4uWYBhhEmSPYj4s69FNx7hcGo0+F0YTZGEjFs
         UREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187996; x=1768792796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=;
        b=dgigpxZ/y3VEYR2hR0vsIppDnfR8tbGVC/eW0G3V7P43ejNNZbS3Ka06pMTPuft6cG
         uFi5jcXr/wibKNo93+D7WnpnSuqWkmpwa5RdRY4xYA6l2a1FynVTa1ICNqRLTvs+/26S
         KNmVMBILvYTByDdKCCnY4SNvn8J9PKYsdxa40Q/tfaOMKuYyBe0oEEmRneu68O+nFXQ1
         Ax0EeePbXU+nnlpWZgcfNb9t/FILA14dWaZfXEc7ZSPG3Eq4w9or6UGvEBvpJ1FgTyvv
         Aj2lTTccR/racBLvr5M5omnxCcklMqFT03lHW8u3vlc8if/H3Q297F2eYPfYxp7k+34v
         E5Fw==
X-Gm-Message-State: AOJu0YyzxNFDYo4FMdRRwsTg7hzCV2ZMzjhyBp0D+plo8oXBJAc+1l6C
	sWleKu6Ea6YYQsjt046PsXmVos85Jn1xVIhAJbMN387Ssk+7GAgniZ7+GN3fW6TMK4GSZE9eWp5
	8BRRyhlTeYRuDoPOHWuKOJU5YCPhW630qaWwxDIG/yM8TYEmJ4rhsmc97Y4L5TzKlsiKq
X-Gm-Gg: AY/fxX69i63U6Rly3i2C9FnwdUd+/iEggJEkFQYVgL8DYm25MB3cODyQSkM2qxkT+P4
	r/QT3kiiNiWwv5AzfsOBffna2+FBkdMqsjTXag4VGdvfN6SDxnSo2TQn70qZXzaOrXuXzbK9Mq9
	pwhCxWEXNG4mUdl8sMigr+gE1VnPZUWHDtzU+Q/tg99dQAV3czNwOlKpOlkiqmSzNyZBMyRyOO+
	Go0iUVEXf6LLbVpBzz75v/zl5eAXyDGIVc2E4OqpNoeRCt1jUNiAGXAzVirlBezHx+V2qNJmgwu
	FDflADoRknMtlpbqdRsoJqULRnlR0v4oW5sj/Txoqj+3EvyFn6cEPm0Knoc2NptTxAtNgdSR/lt
	K7XGRod+HbiUSDtAMroZgH/p7eqTN1kGizZkXq8tiuPBpjFoHU62DnRlkztuP7bxsliiXjQDQ9k
	Jm7dagcp7SE63DnLF2JZsfkxk=
X-Received: by 2002:a05:6102:5242:b0:5de:31b1:1ffe with SMTP id ada2fe7eead31-5ecb6980e5bmr6986149137.32.1768187995954;
        Sun, 11 Jan 2026 19:19:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy2sOPSG9xnspRGe3S50DMCS9lvh724LPP3uuPnBxMoXPZql+DuoZXe5XMhxwVlt6UBPrypA==
X-Received: by 2002:a05:620a:28d4:b0:8a3:f8c2:5f03 with SMTP id af79cd13be357-8c389421df8mr2032872985a.83.1768187496172;
        Sun, 11 Jan 2026 19:11:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 19:11:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:11:30 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: filter writeback modes using writeback
 maxlinewidth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-max-mixer-width-v3-2-f98063ea21f5@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
In-Reply-To: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zHSRfRG/yEhgqLh6Odv+yciJer7YgF5rsUQscTWE1lE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZj86aFD68n5Ir9ySTR6r3+b7J6Z3y0AMQq5
 gzT7WbLmQKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1VWSB/9aYazlDtkhbS00IerH0YtRm2wj0D6n62SQ0+t78++Kjfo0KnbLQUG6u4ToJVsSE1/uesR
 SiNSI4iPmBkLWk1/b5TteDZnWpXV+prZDGMOt+x1U6cDdcB0i6AnTeUB2z+mRt22PjYA+xBURlk
 xmQV3sDKQq1ckzDOTROXFDSUZ0heuHRZ1zL0oW49LDAEpdSwlo0AQZxGM4O+XjLqAopJrZ3Rmee
 wFiM4d3EAYgxcJY33rkSDohsk9V6oL8eFAR6xSo5QxyqOakPPdeOBoCLRW1v1wyI33tl9e7cDKV
 qijHaBSid8o2tyLDhR4QaUBuvypNXp/LrBaNGkYdy3xOoePM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: POV-3iZbRx1ZBf0WyJF9AQBAUnl89vA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNSBTYWx0ZWRfX+WtFuGmxZqg9
 sIBE0c7LowsW9BpEXlxeWYrfTZO0qysKElTjPXsOUKQ/ni4/OB18EPuRGIG7wtTsE+zCE1yk0fJ
 Z2o0tQp6V4aSs4Fm5vb7ylNgNB6D3WJacX/kwruge3e86oBC1l8g5YpP1n5SHOpZczfM1Llnbh+
 pbN4SDIXpp5uyIc8+x1eEtlZM9e4XuSj3xjI2Xg56YuQzveqqMMZBOL++MOo1aEYJ1FCOfy6NW9
 cEbRs+aJ58EVTRi+5iPQYKQ0DuAx+Ijk8ooCK/zLM1KNQRphEU/0EZP5XXSjwTwQV8Ss0Txlnyu
 VLjQK3lh//FpaeLsl8T7I7sxA08STegXrgrZlthgMb78GrSUfG/tMpDrpgdPAKl2hv9N9X3BrZC
 hy+AM4BHU8fQRvfm/sXF7e/PuhBrDTTCX04il0QlN0jKfons+hzBXZA66A9fWPY0sOciGdDCvuE
 zemhvgK4I10saCBQ5eg==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964685d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K26iOwrG_T4ePdtMxkgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: POV-3iZbRx1ZBf0WyJF9AQBAUnl89vA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120025

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Maximum width of the writeback mode is limited by the hardware buffer in
the WB block rather than by the LM properties (LM doesn't have an actual
buffer). Use the actual hardware limit (the writeback maxlinewidth) to
filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: fixed commit message]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..209b1e27a84b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.47.3


