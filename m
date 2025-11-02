Return-Path: <linux-arm-msm+bounces-80043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C5C29632
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 21:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86DD04E0735
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 20:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03817FBA2;
	Sun,  2 Nov 2025 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWBWx/yB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3qVeoht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413534D3A3
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762114697; cv=none; b=cld+vOD2dRNbkZB6xUOz6uZQBDyiP0AwgHnLRS4K8WURChuzed4YAjiAKwtirbq+Wt5tPhsVHeLW1Tmo5Op57soH4V1MAGP1t4edJX3HKNYHqT88k7MKf5IsYTRe2r7gcKy7IPqewhjGj6keDBBo4zHYvG+qAPLNJXBL/1c24aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762114697; c=relaxed/simple;
	bh=erLQdH2hFyuTRZMYIjIe/j6tIxDdwbeINvkt2RfUKbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gCnJDsir4V9pLXBxtyRg2+5WH6mSgNVv4i4M7JIyGOmW4SYWnaoL9hve2PD/ZAHIbv+ZgkioAb6GcJVAVfUdBaaBoQFSkynSE6STvcHnaBlEpBNejFYrT1wqp284Lwbfv8l6og9hdQW64iTIT9PDfGdQ+ztBMlMNAGnpqRaNxEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWBWx/yB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3qVeoht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2JSdbu1021538
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 20:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OdVVm5Vn5j16GpFoAhqQIq
	kr1rOrtokzqAEudEAWiB4=; b=eWBWx/yBwG72a6CpbkESp/9Gkwnt77AY/pYIwS
	yYqyC+jqv8tPPpasAzcKX2ocmcQeO+wWq1d7898YSkuvqCkSwI7R1rPjxyAQ6Z8F
	0YtfdiuJwp5evM8vkC+u32rVIcTUswoeCkp1lkiLl21HDkX9jCEv9NPPmyVBxNN8
	wwsa2otK4V6BRpNwmCeO6lVcTpnauY+RTyssg6Z/1ynVA0bHBRiDhR4btXmEsq9z
	3kzbS7Ljtfnm4hnLZvJAO+IMH3n7vPTOpJJG+/pjKsS5zqIghfXd0MLrfpDj6UGL
	zCE9X6b4/yqu6GD8M2//ibphGpg2xa6ARf8a8n7ubcu6HxJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8jkh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 20:18:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed18b4c621so72615271cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 12:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762114694; x=1762719494; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdVVm5Vn5j16GpFoAhqQIqkr1rOrtokzqAEudEAWiB4=;
        b=C3qVeohtF9TOuMnXaklc8+zsJOyOW8/Acm/zuuRNEsaAkJJDTStI8s13+u65WsViPN
         25i0atlFpXgt91JWvmFM3PLIteh7OKH/ICpbLmrWC7KWqASpp2VlitW/DbFW3raPOzUU
         Bn/DwYgNPv7f1lV2yrU84fXp5OzjcbGSZ5R3RfbYAByoco3OlZBTiwHIOQFaVrEy857n
         v1GxcuRJ3hwHKPljwI9YwU1bVNCzfOEx0xhOSuVxaNwK4mTrM0ooux3Q++UbOXtdgHZT
         RqvtsGrdLtWIohuFLZqorflISOKvYd5tWPaqd5s6HX1E2zFrCPMIvoczoQq3RbfwdmEm
         0nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762114694; x=1762719494;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdVVm5Vn5j16GpFoAhqQIqkr1rOrtokzqAEudEAWiB4=;
        b=NqA7Bfc00QIH7ZTrwL1+BhQdDU4ThL3Zj9TsqqLf3e6ZBwlx3nd/q4foVkaQ+39uyV
         vvxNic8lklSY622J66H77lq0Gc8FYk61SImuUgthzZoWp0fJ0u7okn/n3MM2jXI+VMMw
         zP6z6SOvg4GXjNSEN7bonmg0mM/p2UCJZ9HSvPmRe5HGdcdVCzBz+UBfr0ex72sjt1ah
         lyHJNbPQB3nIalUSenXIy2LBqb6XCIdjqW8D+E3qaGINqt/eZH2afyfFAWvugnZbJCR5
         opOzrejoboLVWjEiczI6hHksdWFGdpn71xWPKQCEXcEvPoWJj5BNVzwDUQhRh3fsfDd/
         a+zQ==
X-Gm-Message-State: AOJu0Yxcb2+t0oIuiCJpfjz0mS0zIArzDA0jO+Z6k/2LPHM3ulo62wCU
	lsMRjG2IvkuGnEe/X8jPgEDUDHe/OuDK0f0u+J2pVCoPdKfwvEmHYDnolPPdhIhgcxqhBOpEPMo
	wc8viAmIXIr+5NmMdafTFuBICnItADt++1wdBunMXut99pT0bZu/KkFwnfSMb7/seaSRu7PcF8b
	eC
X-Gm-Gg: ASbGncu4JPTABYJcXEOGWj3grJRrzLS3h4tpZ5WIMqXFKqOemBQUPrP2TOpaAQWQJSV
	TJO0TTQPEgXs06qVf6e39rBsgzbBmFRKSYcY9Rnea9xiGeBNKEiEP1hZrqQuikt/5gDsSEdrMO5
	tIMgX3UV6XPEBZICIwFkt8PnuUptAvW1rlVzObUydDf0lYZxdYi49T7lpEx5laRMNtfyW8BgqTN
	sIF1AdXK8FKS/Oe8mruR5LfFFPjMtSXVb04K4xiIWxbBqPquwMb1AJFapBV5nmsXMYq25+7BQNe
	KMoJP3+A6Zg3WW9npe1XDLZfgnx1BGoaDr+31IoamLCBKGNMV6aXbmuZdV61sY6dyNunCw2rYel
	i5CnucwwTT2fG+2aCPS68nLuvhIDKstQ2TIl9C8aM0dWNqIU6T6eA1HTpPQPx1k1TP89Mg0vnjA
	wcTE9O/DW8QJiT
X-Received: by 2002:ac8:5a93:0:b0:4e8:a1f9:cdd4 with SMTP id d75a77b69052e-4ed217b672fmr170989281cf.1.1762114693614;
        Sun, 02 Nov 2025 12:18:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNY0tTsWpJIEVOwgyhh2aDBh15yHlc+p7d7sVA9dguQynWO7J16BHzPL9ZYWnQ2g3x4FEhEg==
X-Received: by 2002:ac8:5a93:0:b0:4e8:a1f9:cdd4 with SMTP id d75a77b69052e-4ed217b672fmr170988921cf.1.1762114692957;
        Sun, 02 Nov 2025 12:18:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb45easm17907781fa.16.2025.11.02.12.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:18:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 22:17:48 +0200
Subject: [PATCH] drm/msm: fix allocation of dumb buffers for non-RGB
 formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-drm-msm-fix-nv12-v1-1-096dbcb4a51f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGu8B2kC/x2MSQqAMAwAv1JyNtBEBPEr4sElag6t0kARpH+3e
 ByGmRdMkorB4F5IktX0ihWocbCeczwEdasM7Lkj8oxbChgs4K4PxkyMRLuXfm1pYYGa3Umq+5f
 jVMoHgmpqXGIAAAA=
X-Change-ID: 20251102-drm-msm-fix-nv12-11f0e8c31b2e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2149;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=erLQdH2hFyuTRZMYIjIe/j6tIxDdwbeINvkt2RfUKbo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpB7yD/G8dYX1IJ/v5RG27i7L8oP+YwceUGEdgy
 xxQklGIHouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQe8gwAKCRCLPIo+Aiko
 1YAlB/9GFWDG6Qs9XLi9san0VImTyWb/8ucy6+dKwfetnjjNWWqTV6h9suB0PIILnfPIg/PvwWR
 HSNwXfM3XHKNL+ap2sUdQ1/2zyqeYN/xgSXQzDherzVvdQ6JYyb87GrkigsAvK1KNURR5B+KhP3
 RDuf0rkmPcK0qVB70Juu3bUznxyVR7vWMsin/XP9HOWYyi11I+VJx5fE0Pa8RYmkYcVC5lsL6p6
 HFB2Z7SbxxwfCFUX4ylfzgD68J+OAhPZEKiVASwIxQKosrFAR2A9vGNM+mhaWzKT9v51A0UeC6W
 gEna0BLv7NPDxHlGTYOkuBLUZ3wU2u1uNDlODZbduVbi8s5l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: e_3kXgEP4-rib_6ai7sZ3DLavJmsfUlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE4NyBTYWx0ZWRfXzpro+immrhOU
 2TgV4jGaaTCPNXMoCPz3KFO8ITrHRLg3njzu8oO5pmrn0B4+zNWWkgOgFrCEbvQVplXrQVUU99q
 vgEcCjw4Ttn/jfWT/ZsIbD+m9JL7+nKlNYE2uyX1rJ3VBKc2m1vbFWL2uwwiaHZ8uulnwshoj0Y
 7puH9N6zPdr8Bklw7fYWs+9ZeXXo56+RHL2SEKIS56mZ+bTg/ec6h/FUujAKS3udrLjh0RyjY5g
 RL6ZFoDbdbFfQpq0x4DFeaSra9+G6gjhi7ZuLPBrA6f8J1opB2Qpj8+8TeOE44gE27ipetjwQix
 Vs2ZyuzGM8LWw3Mo5WqIKqCB5RM4GaY2BBFJHC48ekTyDoLckbI8wmpI7TNHyoJBs7EE4eqgWok
 4W5Dmi0m1PUSwmr9IxCv2Lt03MrnVA==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=6907bc86 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KVldPKIrq6pl5aLy4YAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: e_3kXgEP4-rib_6ai7sZ3DLavJmsfUlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020187

Several users (including IGT kms_getfb tests) allocate DUMB buffers for
YUV data. Commit 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with
drm_mode_size_dumb()") broke that usecase, since in those cases
drm_driver_color_mode_format() returns DRM_FORMAT_INVALID.

Handle the YUV usecase, aligning to 32-bit pixels.

Fixes: 538fa012cbdb ("drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()")
Closes: https://lore.kernel.org/all/vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 435c0067c2641786ca7b4a42cca0ae7e7dda3451..b9cfdb2ff33b63b92cff2568db491d0692bbe459 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -701,7 +701,6 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args)
 {
 	u32 fourcc;
-	const struct drm_format_info *info;
 	u64 pitch_align;
 	int ret;
 
@@ -711,12 +710,16 @@ int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	 * Use the result as pitch alignment.
 	 */
 	fourcc = drm_driver_color_mode_format(dev, args->bpp);
-	if (fourcc == DRM_FORMAT_INVALID)
-		return -EINVAL;
-	info = drm_format_info(fourcc);
-	if (!info)
-		return -EINVAL;
-	pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	if (fourcc != DRM_FORMAT_INVALID) {
+		const struct drm_format_info *info;
+
+		info = drm_format_info(fourcc);
+		if (!info)
+			return -EINVAL;
+		pitch_align = drm_format_info_min_pitch(info, 0, SZ_32);
+	} else {
+		pitch_align = round_up(args->width, SZ_32) * DIV_ROUND_UP(args->bpp, SZ_8);
+	}
 	if (!pitch_align || pitch_align > U32_MAX)
 		return -EINVAL;
 	ret = drm_mode_size_dumb(dev, args, pitch_align, 0);

---
base-commit: 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
change-id: 20251102-drm-msm-fix-nv12-11f0e8c31b2e

Best regards,
-- 
With best wishes
Dmitry


