Return-Path: <linux-arm-msm+bounces-72159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B810B44AEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 02:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFADC3BDB27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 00:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444711EBFF7;
	Fri,  5 Sep 2025 00:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE5ESYjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8849E1DE4FB
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757032743; cv=none; b=UZpEfkgmc3xf4vu/nt/Xf0vZsHTlHx9c4IgioFcUSHmqAl6Uvd97vsAk2C9Q+nDxqibWeltcElmQAX9CBKyej4VSyQLA+ATB6yK3RgTdZIcffJ/RlkMvFQ905AChG5WA1+CUDb9bB+CT4KAvXQSnVcmNf3wHCWMLc7dwayyHz1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757032743; c=relaxed/simple;
	bh=XLkwtyygZJdPj3GjkZgZ1aANtwazJqGOIEmkYbUxRwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J5Xt8lil2O+K4qK5ajpl6v/52V075w56omQsT+uABXiyfDghhFJt9o+IXuCqejOBxuIKYwTPUkgOAzYJOxLPvAEZA1Sk6dlZAxTSrdy2A44V+1JsyFQtbd8rpLOC4hyWMBij3tiVTI7sldoHiv7DhMeeGcqAzSyB+02pN2dQ61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VE5ESYjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Hsaa7031741
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 00:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLiIOtcLE7wWiaqufYm5bdrdybL14BNM8N/yFfbsTSY=; b=VE5ESYjllYEICnuR
	D+Vcj5mbyBY0Ok7ERnQG2ZMTt6JiQzXKuJjGttNEr5NrumYFafTrlw9RxDz/QwzH
	niqcWvxyiVSOFqgMCbLMKKRg3Txhb3AR26xlE+gkAre1HRTLCGfAJ8jQGZ/UQ02D
	UszrjoReuu+sXBg6faQRIOajSLNQq0hJDz6Naopre4wXIzRNuDUF3n93PpO+tZ/4
	SUkcwDUjHXx8eKpvV3ewQWyG/1AcihAmzIIFhsN+5AZsvFWjt8f2JhXO0b+sjonu
	7fQo8cFEzg7DKzhnGeBf0LuYb0inQxZnb1wUTowSMB+4PtIjoniG3fIqhv4UgdwT
	6yv1lA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw09bx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 00:39:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5e178be7eso24175621cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 17:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757032740; x=1757637540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLiIOtcLE7wWiaqufYm5bdrdybL14BNM8N/yFfbsTSY=;
        b=OndfpV1sqH/2JYDvTe842SOOgTY10quX3tiu7M301UUyjy5bjxRiQad/HpTJ9mAYsL
         0prWw0mnxE5oW36yT8y7B2tuT+yrCElMf72Ssp71C/i5/vWW2F6hzbgkfZ9CWyXy1J1s
         A5qkBZVTczjHVuYiE00Zk9ZPl9PQOmbKlPrq99/Uze+XMqlZVjblQvQ0VwxsKV584xO7
         +AnKQjbG4tJn8NIawpYVp79rwf2edHNCn73anGzsS46MFnayUKaU6pUadoHgZTu8Qk58
         lhbVKUh/KY4OGX9H/MIFSyPAJi+RfcQbdvOOTF8r9E0WqgLjx83O5Iz2FM7Cq2Jnthzb
         UUBQ==
X-Gm-Message-State: AOJu0YyRwEX8su7lmCVH8NjznHfLgiVdehMxyn8KAzmABLTa29Y//NIz
	IxSm0I+hRNhcx6jthBj1yJsdzQfGyeNZz9UMrNRMQAaqdmHynqUe5y4ON1skLf3HcJqaYSalXZ+
	8u3KLf73As5G38STwWkQ5kdKJJ95sqEw5bo9a8cEO/0678oFICVpQoEmJM+TZ1KXKZswp
X-Gm-Gg: ASbGncthYJj9BJINYLbLzjiMhOpmkcmcGggBE9aG/i/YApPudWVNTXlSibG1+XQwUpi
	nwK/u7GSNU8zaEBs8lGlXGRnFcZQTvallGtIJKy+na8iq6Da/f56HQF0usJa+s53k+8aMvrpzXW
	cwzmBbq73tYfkh/1wxGjmlme2i+QqBLGgKB3h66V/mUEuinCgBPtsP3/75ly4Q9fbiOmn4CEJaA
	NkOv42vWCE3SE5hspFCu6bC3b68uxjvtgyMGiWZHPG7kikIRoOcU2tr5F7efiKhZu9HS0+Yy0LT
	5QdGpJWDT79KgzCfVpIi+12y0B9JNRaeTW29patowwy7AqrVozFPpkJbzn6yog6v6+wUqYx1jDb
	z/Bs2N1BbQCWWCFv6qLlWu9A0hL1I97XgtRHBlmFQgUPhGz3nFdxs
X-Received: by 2002:a05:622a:551:b0:4b3:61b:58f4 with SMTP id d75a77b69052e-4b5e18395b0mr40913371cf.53.1757032739643;
        Thu, 04 Sep 2025 17:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP0nB2Vt3LMYDBx118zsJ4giTEWN/hLJl0xD4HXyg7zzaWIFQByUuhZsTTOJxoycKJ8OS8WA==
X-Received: by 2002:a05:622a:551:b0:4b3:61b:58f4 with SMTP id d75a77b69052e-4b5e18395b0mr40913091cf.53.1757032739088;
        Thu, 04 Sep 2025 17:38:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 17:38:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:37 +0300
Subject: [PATCH v2 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-8-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XLkwtyygZJdPj3GjkZgZ1aANtwazJqGOIEmkYbUxRwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEK71uU2bZ8JQXFBGN1IDBH5OYQyC9Xm8v8v
 tnUi8qYOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCgAKCRCLPIo+Aiko
 1b2yB/wKB4v8Bk2zFkuQDoVspBPY3bca3px+IzVDe5SyzF0FfBVY/9ca/uty+7qgAX9i8dVh8NV
 LdCBJWXW7Wfb6sEB9hw323dwH4NlMLa8gY1KW5GQiOVPehuK5Pwc8yCxUOs+oG1gD9zkpY3crTj
 HvtY8KdCmsZZcOKPOGb5b1apoatF0mT/b3xWXFicKF/NQ7Tb80KTtgvQsZkQTzvDn0gbyk7bzLD
 gWxUFA9aIalzlrIfuxodQxpj5zPC/dCyc9LKMSgC8Zm+tco4YF6FhId2X3J1vDIKPmNfidpAC7J
 /RBiA+aOsGY62ro7QEhoCaSHJla3hJbN+kFDytWN6VvHG/SP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: heSS_5Yodo9jUqDOQlh7e_Qz5f6bLpu5
X-Proofpoint-ORIG-GUID: heSS_5Yodo9jUqDOQlh7e_Qz5f6bLpu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX0wuqV37l/FQT
 eJdYM8bYYvwBjBBXjACpXhXzFQt6+QESYH+NQq5i64D7D+Ua4nTjWTQelpxmFc28mwK5JzQCmmd
 PA4uSNNRVQYGGEsIn0udm7dqXMyrdvSL/5uRjAwFJAowM46xofFrJieDgB5q8UX+NNZdZkXRh6E
 6ayoxtqLytXPe9Dq4AS5+FKWTdAitZ2r/rL7aZTgjSLPGQgvPf5hSJXP3iQdRzwe7kI2GUViqSW
 w4vZUrJAYKD8ISdyVA5iyIdc40FduaHXavCxQYfbd53W2ay+zubSba9HEg8RaBbn96v9oF+i+qg
 yOkvDAuuhp1K8b4BWKUOWfcfZ1rmRKzf/ChgEv/WlyNQKeg6ElHY0UlcRccYMSlMdf6wy0gyllE
 peXaxx4G
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68ba3124 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=iz29p33r4uX7jxN-whAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 79f7f973dbf348acf2c06e66afedeb8f22e7a8ca..35c443f006bbbde446cfcc0862c49d06a8e10bb4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -325,26 +325,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.47.2


