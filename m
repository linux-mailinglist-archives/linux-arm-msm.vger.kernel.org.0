Return-Path: <linux-arm-msm+bounces-107215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPwUFmmTA2pz7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC957529A8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D246309372A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A763559DF;
	Tue, 12 May 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Piyn6MQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhcWFFHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8EF3C3795
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619222; cv=none; b=OLjkh2WuIJtJjNLA1YYoq95c0vwrYlO9ddc5m8ygTEfxSa3sGnXJVQa6Y5qA2sErF1zlL4gPNeeTPsJEflsxoHJNsAI2RJQj3T8Ca1iuiZ4x2XKv+zRf6A8zlIrHqW/DPZ/kIpwJiwLz2K6GbG6ljHPt4Ccdfw8DC1PcPIxemWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619222; c=relaxed/simple;
	bh=y12N0KJvr64smCvrggJzXSn04iLlv4CRGLxoGyZ3CWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bAJHz2bWCLnG0Pp6ayrhHPut3uLviX/2W/rEJgjg9tSPIBVBohT7T7Apgc3ulV3FIDcX+OWckUFr8jxEtFvSm8yqn3iPsUwDr9PfOhLFuWXG4Z5p68yjMGdd5+z99D7QXx0J9wepqflCeQvP8Y/4p15A0K+z73yap8sbIkvp2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Piyn6MQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhcWFFHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CIvnkR129277
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swPhCGipxaJd5Dc4rfX69t4v279JtEBqZKQ855juAH4=; b=Piyn6MQj4QBsCGwz
	4NIknQg/yIJB+GTC/kEzCFMxGFnDg7KsCrWvIvitwSiPn/jsh4/ktnJyu3P6RhsQ
	Z39R2mmSNC8LcjjE+ol0YpeQ6Hgo9KLx4EGk/ouR64/Z5tEO/Wd9LOWaNCqphTnU
	YflBSBLrIj0cFDmICZzG4tAYaGMMpeu0svp1hzYJRxlM7dYc7bO0BoxtGWmucMam
	Q8PfXeakOyM22jlQeAk9KvB1IXKQE0lQUwST6ZJk4DHd0111JRFpLN/mX+6QJdyl
	H22h5La6/9vWejgX2iqEgTGaebzPiciTrGpMUt55O4SeWAekdcFfoNgw55a/F5ZD
	FxNFUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn1yvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83536dc3be5so6418129b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778619218; x=1779224018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swPhCGipxaJd5Dc4rfX69t4v279JtEBqZKQ855juAH4=;
        b=GhcWFFHW6/trZvOOPyoM3HN/uybjFmg0VtS3poyfBuEPkYxeqp12XKcJo+gsakw3uv
         KMIYPBd2P28DM+RX5UA29v2o7FaDBtC537w+qelFsxitrBFTFr2+w6rGbem9FF3VC9eu
         E+Jg+GyhISpKJvZwV+3i19dmGxwyMbTNi1lZ0pWpsXc4HzGGVTB+e5kWuQTURNxqsCYe
         kCS7acl5QdhRTgJNnpCZICQ16w8FYxrtazSQynlzfht6ghyVFzSMvbOigo59+EAmWfMK
         08GZo4b/xRBTDv5L5SGF8JaZW4bDeJJXsnLbt11Y7sXa1FeC/D4uE4eC7p1l/o9eWya9
         018w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619218; x=1779224018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swPhCGipxaJd5Dc4rfX69t4v279JtEBqZKQ855juAH4=;
        b=cMbInJD4goFqvfo0EeWKfNetRund08pm91jy5elLJKGJqZZ9f2ChG24TuQmimBoxcu
         5PejtNKwpbZ82xUwAl4iX3GueLBVheTlIKQtpVJ4kuDopZxtNZh0MxMsFdtlL7BDdWzj
         Mk+vxEE77R4UVkn6DaMJwlPaICshi+lsbgYZ5TMObiivlD4GpBcWdst27FDggo/oPgOs
         3LsNo/5iiXqW8IWukS36jea4hivmmcXGpRgz7JxVA8iqMOfYccoMrwi7cNVnNuJbdK32
         LZa0SPiLbrWCZR/Lku3ENMLGI7mP7BxhWaBHDjuQY4YCBibK4NmaC/rfaFM0FRDcTX8W
         WKfQ==
X-Gm-Message-State: AOJu0YyXHIatOxtTIfS8ld7Svnlp1aswDAYUnDzYQc8ugLARpiOyjjpD
	fEanm7l5qFf1YdFufr/kUMxJhQh3dfRpSkIUe3DWNumc3sqH7K5ezbVfif4aMoFeT+SDNu8ANRh
	e57I4QtYnTq8LR2NlnHEzHwvJ3V6OG1/Ynd2z436zaeM575OBJv9cMXOyr0llVLR3Bj44
X-Gm-Gg: Acq92OH2FOTjV2FSgYIZVe6svb1njzwkCIvXZWd3gBTg7YscCtDhdeKq63Sa48tGR6i
	actcDm2Ris8dfRxcEpYwRYe7ZhHlM+FLZdGnDiBVvnxePCrsiXlnRJo+ERdN6Xx0I0QV6AkTPhK
	Gt1qfDUOyEqKGu1hGnMecSYciHLIz55+uYz4OgKltmRza6wt3fIgT1MpVORhUzFMObBSKosGUKC
	YexqFRADr3SxV7fOGYUWH65yWyFYPOzT7JU1qzYgYlco7q+i3gjwvTMXQdCDP9a9Hk5Fy5xay29
	Pc4ZFd0NttKy8eEpU7zlOSxrQQSvIsaZxcyz7EGYboznxVOcJ+xDPxI5Ee2PbqGIHryKMo5Wpz0
	OBdk6VgWTBK8C22XUpnfXwJPlAWgYj9lRXDpMoOlebPGgGg==
X-Received: by 2002:a05:6a00:18aa:b0:832:e65:ddcd with SMTP id d2e1a72fcca58-83f042ddf57mr256269b3a.45.1778619218050;
        Tue, 12 May 2026 13:53:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:18aa:b0:832:e65:ddcd with SMTP id d2e1a72fcca58-83f042ddf57mr256233b3a.45.1778619217531;
        Tue, 12 May 2026 13:53:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm25453004b3a.15.2026.05.12.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:53:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 02:22:59 +0530
Subject: [PATCH RFT 4/5] drm/msm: Always use component model for standalone
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-gmu-sync-state-fix-v1-4-6e33e6aa9b4f@oss.qualcomm.com>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
In-Reply-To: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778619193; l=4605;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=y12N0KJvr64smCvrggJzXSn04iLlv4CRGLxoGyZ3CWI=;
 b=pMv3uWBLuKrtsb+osbNDctX4oBE0ISGKmHp9tbKJzC6lx8D3z5z42w3xBQrTFswn//Jp5URXd
 zuFJtfX9zOsDQVk5SA+qRpFqpJNCpY0mXDeS7PNZ8V64J9FEq/Makgo
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: xAYVAHjAU_u723RKAdtahXB-YNrr3v4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIxNCBTYWx0ZWRfX5n2tzOwLbZfC
 uUVe4vimxJT/EP0gd2VDrW2h+3sT5t0sg3rUIw/zIwYg6e2DPTxN//5Ane5bu+Xng19SBJU+QiC
 4Vwz3NpHnWZj7Ri10diVOhOvf9RNh95UsOkIQscK8Upt/yQ3hsOoq7uoJDBQA30ua75ZHVCaGpG
 hIS/A8Yg3/wNvROc+HK+mtvsWyTdSeljnygZaiLPLU+HPbVLI7PToCQcRPud8aLMykGAv6J2DYB
 69XJc3DM5WBKdjg3z3fXfhiu1LV6Tz98wSJdqEF+GY5clIlHgoFGOQ8t5ZUgbuP+jnQW5VBveKS
 o4MjhsMwNd3tQGjdKz0YKfHB4aq+UGW5S9RsjGjv+PILhzpzz4+lOo96kxFDEUgaWPPbSxXcfyz
 f2meDeDcZMyRnqhOKX3xr+2DJ2q/YrZcUBcDa2qFOQS61EcDD9ZfaFva0JgqQWn6n9Ptt8eMk6G
 NkRhLW6NsmNmschnfCg==
X-Proofpoint-GUID: xAYVAHjAU_u723RKAdtahXB-YNrr3v4r
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a039352 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_hlE4qLb6NvLkdTQTB4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120214
X-Rspamd-Queue-Id: CC957529A8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

When separate_gpu_kms=1 (or the device is compatible with "amd,imageon"),
msm_gpu_no_components() evaluates true and adreno_probe() bypasses the
component framework by calling msm_gpu_probe() directly. In this case,
we skip creating components and directly bind the GPU.

That shortcut makes it impossible to add a second sibling on the GPU
master without introducing ad-hoc plumbing. To prepare for adding the
GMU as a peer component on this master, turn the GPU pdev into both a
component master and the sole component of itself in this path. A follow
up patch will introduce GMU as a component device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 20 ++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.c              | 35 +++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h              |  6 ++---
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 66953e551d86..67686424f3a1 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -271,18 +271,26 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (msm_gpu_use_separate_drm_dev(pdev))
-		return msm_gpu_probe(pdev, &a3xx_ops);
+	int ret;
 
-	return component_add(&pdev->dev, &a3xx_ops);
+	if (msm_gpu_use_separate_drm_dev(pdev)) {
+		ret = msm_gpu_probe(pdev);
+		if (ret)
+			return ret;
+	}
+
+	ret = component_add(&pdev->dev, &a3xx_ops);
+	if (ret && msm_gpu_use_separate_drm_dev(pdev))
+		msm_gpu_remove(pdev);
+
+	return ret;
 }
 
 static void adreno_remove(struct platform_device *pdev)
 {
+	component_del(&pdev->dev, &a3xx_ops);
 	if (msm_gpu_use_separate_drm_dev(pdev))
-		msm_gpu_remove(pdev, &a3xx_ops);
-	else
-		component_del(&pdev->dev, &a3xx_ops);
+		msm_gpu_remove(pdev);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b61deafd02c3..af5aa7ff6179 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1097,10 +1097,25 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-int msm_gpu_probe(struct platform_device *pdev,
-		  const struct component_ops *ops)
+static int msm_gpu_drm_bind(struct device *dev)
+{
+	return msm_drm_init(dev, &msm_gpu_driver, NULL);
+}
+
+static void msm_gpu_drm_unbind(struct device *dev)
+{
+	msm_drm_uninit(dev, NULL);
+}
+
+static const struct component_master_ops msm_gpu_drm_ops = {
+	.bind = msm_gpu_drm_bind,
+	.unbind = msm_gpu_drm_unbind,
+};
+
+int msm_gpu_probe(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv;
+	struct component_match *match = NULL;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -1116,13 +1131,21 @@ int msm_gpu_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
+	/*
+	 * The GPU pdev acts as both the component master and the sole
+	 * component (added by adreno_probe()). Future patches add the
+	 * GMU node as a second component on this same master.
+	 */
+	drm_of_component_match_add(&pdev->dev, &match,
+				   component_compare_of, pdev->dev.of_node);
+
+	return component_master_add_with_match(&pdev->dev, &msm_gpu_drm_ops,
+					       match);
 }
 
-void msm_gpu_remove(struct platform_device *pdev,
-		    const struct component_ops *ops)
+void msm_gpu_remove(struct platform_device *pdev)
 {
-	msm_drm_uninit(&pdev->dev, ops);
+	component_master_del(&pdev->dev, &msm_gpu_drm_ops);
 }
 
 static int __init msm_drm_register(void)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6fcb696ceb7c..6264ff27496f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -544,10 +544,8 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);
 
-int msm_gpu_probe(struct platform_device *pdev,
-		  const struct component_ops *ops);
-void msm_gpu_remove(struct platform_device *pdev,
-		    const struct component_ops *ops);
+int msm_gpu_probe(struct platform_device *pdev);
+void msm_gpu_remove(struct platform_device *pdev);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);

-- 
2.51.0


