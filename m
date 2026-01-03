Return-Path: <linux-arm-msm+bounces-87303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E0CF0070
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 14:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 807C930321EF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E2030CD89;
	Sat,  3 Jan 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGewXUaE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LN1W8Ggd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE130C62B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767447913; cv=none; b=rrSZjynLr7mhccyMaz/mli8wn7zbD5FwaLhElUjcsQomU0M8NHG/PylpSXLUBN/1Wm5dhWRjcJekq6aoSWp2AYu5jxUwmzV3g04KKcDHfN3v5WcJH85leN1rMnzNCeJUATjm40U07EAcGuRHW2PGqGjvrPqRdjrKLlhi0KVC8RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767447913; c=relaxed/simple;
	bh=Rw3UNHjF5lDz7p+6JRqD4nwQx9PCBD7zVeGK0vqPjaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/WzFSuJKTM6iNTO9jfOjiVgEmuekNuhA40Yzf+vMh3pPhMqPcv8FtcT6QJa5ggizB6C6FCwSQMQn7NHyyRTlVd2rMxVRGxn5x6sNDUbWwVDXw0q1hWcsr8srMU+TK4wqZGyJakfCs+YgkPAT2hTa/AtKqq/juvajP1ei25t/uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGewXUaE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LN1W8Ggd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6034BpHc3072174
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 13:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmAziWSFS30bDCEv+yDBNRX8QhNldyhtUKzxpqC2+ns=; b=kGewXUaEx8mqQl8f
	HXISwuBm60tPFJGv9CsceK1O+epq/MonQwxdY1P2x6/sGoyhdE9ClLTbsqDvtIRg
	ebURpTd8c+4c99J2zNA+xa7zJv1jJ+ofqWhNqlNhBGo9/OBxJfWmGwQPXJkfJf3X
	inNZwl9xqsaKLFvaUQPrTZF0Gvz/qO6XqbAPkTSA12ySyMy0iCkg3RBwHwEvVXmU
	O42OHDs1qLGIM7OI08hnCtiO7gumLxCbPf+khbwyXEl5hhsjtRYKwAimNYozgriA
	1EHGd83KkieQ29c+EkgkyjcwPIiQ0uhgPO0wjNyjmZfEhlnNT4/kJiND7rg3UjjD
	Jm0ydQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd0jha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 13:45:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so483924181cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767447910; x=1768052710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmAziWSFS30bDCEv+yDBNRX8QhNldyhtUKzxpqC2+ns=;
        b=LN1W8GgdYKQb5+ZyiiF9W+Zu8WA859jLSSSwuIztP9MdYzcmrVNag8mlWHU5FjoNr7
         03I81o2BFlzHYNiDGxquWwq0XGwvXFNYIMc+0VYxVBtvPdDg6wiFR75Q/ULLhQZR9tHN
         fw3/GUomCtktRG4shlnzTz2GvghGAbAW8BOtKvEONRLYA3O2Agu0ILQNeEnRO+LVu13I
         7ffYnjZrLPzrP8+P4PebSO8RYHF0mVQOGbqaM8MUwXZnWXg//PSubjw6iVVj0tYR7rA0
         iNCvl+Gv2Aee2oBJ/YRo1wuB/KW+WKyhMUc6wT8Vz161cb05duvhRBIzsY/iEG4FqTAu
         w7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767447910; x=1768052710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmAziWSFS30bDCEv+yDBNRX8QhNldyhtUKzxpqC2+ns=;
        b=CSVY78M3Asclf4k6FJPHPuN/a34z9XVG4nCxPi+HLaGD5Rj/Tx7L/E06O0dg28CA3t
         SIv4HkIHg9LNZ7uPv8vmy+xQtOe3M5hfeyh7SyXSNRW1xu6HUoe9N88b0763YFT0JArX
         Dn3Ave5HhwZrlSHMJKfOMnjila5EAqVlPOimKaYrkm9Qw4QX2Toq50ECAr0CUAkWdpoZ
         f8FABrnp+NWRuJmWiQpZSL9efNN8v9mChILoSQiIdKMmt5lUwRnpDfkdmSz4+DRQgULp
         FGm6yyBshrGnPJd76AfK1sXuQsxSEM/2/wZq4mgeQGJmnGTFzPuYkD2CRXjOE3rl7Eoo
         0hjQ==
X-Gm-Message-State: AOJu0YwmXdF6YGM/LlKhr0PT0owd4ioIW6vCfNZFZHZAq5diFXWSVtQb
	ZtI5ZAnJM1wuN16ZmHLVkCY6R/XNzikyTaR2lFTa0+fruyOnKhuDpNsYeRgHy92OIukR+7GIbmH
	pXIAmtUi5+Mv5rdmf1D3Vf5UlxRTgWsNGzyf2Bg+CFdSnhT+6K6wZhe0bwFK3bGeatGfk
X-Gm-Gg: AY/fxX4exh/1rEzNhkJkdn1rP0aZlEWry1xBC/ZjGZX46K5Y9pK/M1jcyq+s+qtXnN2
	IV5GHsPhtYr69P88bzwnSsnZQLfGFxx7GlMn2OOUfUV+Ozw6USPUX3DbGwqu77chDjDfOvFhonW
	qO2RVC1GDLmknCS9b8bI16LVtbx35u4IErmAlFM5uldyw19jdMi0n16oax9imGCu0NzJz6u3lqi
	kqnNaOd9KdhZksPT7lnpaQ2LpfCZd/M1nxdmtkC+QJvXhk6gYFmNwnuXNZeCzTbLsUA7uT0aH27
	F553Kx9UfkH3Ii3GH25CmbuOWgUuooB3sK6n1DbUIT4tQaw4cF0YDdFNnn1kdScKq1LhmqU3dAh
	LDyjTK6B7LNrXSAzRH6xvJCnlkfT8yzHHSNoIhNGUvznXoX7NcKv4dkQmJXNl6xuShaOkSum9aW
	w4XQ2OviSCe3o8wjWHIhi2BZc=
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr548082601cf.10.1767447910487;
        Sat, 03 Jan 2026 05:45:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXIHftH501Xcz7KCHVqf6NVsmLuQhDuE8GsYwFfscKWj1PNkWCl8PFicDVboZqEcS7QGM2Mg==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr548082441cf.10.1767447910092;
        Sat, 03 Jan 2026 05:45:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 05:45:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 15:45:05 +0200
Subject: [PATCH v2 2/3] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-max-mixer-width-v2-2-ef5d3d246709@oss.qualcomm.com>
References: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
In-Reply-To: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Q+6Hy5bqNCfkb+pfv9e+lklJAD+9trTQ+iZuAR312s=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlZHWKjI73KgwBmz7MJKjjT2qRFABHkI3AxrhBbXqNUR+fkN
 4kBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpWR1iAAoJEIs8ij4CKSjV+roH/0AV
 Op0fcJYg6gjaWvUXZmerJ/B2VkJLRxcC+tIPtrFMhlEFI5jwPPjvDHN5ZlJyi8GTwYjDPo61plB
 Jk+sO3wctRIbOh6NTCiV7cTwDRdJeQYdlZwj+hlRiSD9bpkiNtHOx0UU2TJItgIfrVaW3srE8hk
 WO3v6dsWHPIqDyiiu6dA+nt6D1uLVUa2muhPUrog6BlnP8A+dQqc+7K3D/k8HTNx7HiiQXVI6Ai
 FxBvuCWmDEpE/YaNwo5lRgn758jGluFf2VJF1nWBXR9y+1aTN+XOthQALDVV9SULNxDVeGHmKPa
 4MPFMWUeq2tXsfHhaj47aar/D0X6A40XvLQew/Q=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: m6hzNonT0XchaoPY_ypNPWuhfQ3Tdx_y
X-Proofpoint-GUID: m6hzNonT0XchaoPY_ypNPWuhfQ3Tdx_y
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=69591d67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IdaEjn1bWG-LatOizd0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfX34F3L0pAf4Gq
 oAB/PWPys78bAt7M8VDD85qSLrRO6+s3sE51s3WcKAYq6PNWK2XT0LyhzNciLQvCFCbtMxdFR2N
 7PDq3Ho1G8QpXVoAD/xoVM6I1FEI1qxYgCeoFJH0dmzdPLCQQnTpUFviMMW59CbauI0tIACAlcM
 POB1MnfOv4TNO5SUqgZKQuIEVwCDDVVrrYIILnUteU94bo0YGY18XHfcgM1RIxYlNFh2NHxmZ1J
 a+9XnC57PKbc/828y89XL2Ok9ApdTZAOm0fRGZJk5ZYQ1/Ik/7tnp0vsLOt9DgOaNZL49VCo5r+
 4GjV/5ef2IG61xI1ZY6Wph62QBgyFUl6Id2G3enaGjufv+VQjB8hAL4x68fq/+EwjL3PGaxHQ3c
 USO8OySjjMdsOO0xHWVa7Dbqhe1O2ybhNCBonlO/N4NhRwY4nhLWGgXbc6pq7v2W4nFcdy3aDWQ
 xArAqFPNF23SjyORrAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Since the max mixer width is not a strict hardware limit, use the actual
hardware limit (the writeback maxlinewidth) to filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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


