Return-Path: <linux-arm-msm+bounces-108800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMZ/HM7QDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:18:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3A590ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24F1E3136686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925443EF0A1;
	Wed, 20 May 2026 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHbdFFFP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUdxJS4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388823F4DC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288713; cv=none; b=WoxsmLgR2SRRKs3XD9OVStIF1hb6zrYwsSik0ym6vKq8QfN+ANo9koAAMZEUwRZ89zERtfkVrE7QmTKhCFEMHiYJ3ZQjFOrk/ZxgLyKNmv6SzREiqx+lox5UbbrooLGFOg6ISQ8BExIYsGsVzIW6XqTAZrDIplgRlnozBdCqv44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288713; c=relaxed/simple;
	bh=UwVvsKLkUIORbtzZurFAWqIbbBEib65pVmAxe/wBnTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rphHlS0MKKPMEqGK5CUPIswcCUpVa6oqk3EBfQWd/zYu64ARtM11iJoqo8R0rOoaRj+BBMdv/jhl+xGyg9oZKEwuBO6vFhAJB7nqo3/eE8wIcgMOQFwG/DanWTFeFDnigzduikbEwU/e2cwYYRZ289MhsVDuI7ohqJH8UCD0Rg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHbdFFFP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUdxJS4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXvGj1798612
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeXGSGSeoUMRQKY4PjIJ+D/sVcYw4EfpKGdbvxvr2ek=; b=aHbdFFFP9TbmyrcL
	r51Iz+KGXnDnQz8LWjgH4KKhm7kHoNo/svoU8sxkInYfWPfOumROZkM+oh2wibel
	JUd4ws5jp5P7FE05LdiBOtguntJr97EWHebgVmO+B9Fbxq/qVrOSqyo8F9n5Ekq+
	zCmlsz30QiMbkz2Yt1PHpTEHWO0btbP0M/bMHbbFH97eJpU178IUlCwBu1ST0osT
	+lux4Z90GbTYKamihMMkRzm4YuJeFyOoOyBclrSi4N/DEzzYIibHy7dkm+2r2dQh
	NGFK2dB/eUG0pNqzQr0yyJiCwjf5MSR7RtI3Vzrt64G+a3H3xXXFDkfgMP9+Jm8U
	ZkgJOw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0a1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575242b4308so12873669e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288711; x=1779893511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeXGSGSeoUMRQKY4PjIJ+D/sVcYw4EfpKGdbvxvr2ek=;
        b=ZUdxJS4W+xSuShlE6JDfOPTBi0wTDGMmtd4OB+t43aVr/AujSjXLF0fskZyxjUpcM/
         ha9NkRhypS17NLb2zXIXVPxOlsGnTcCiH51dAAQpdpV68TYIDSoHuIqx1k1uZOqF0i6g
         43/vooIQYlmGvT1xAu/Kr6fnWTNk6Ie2x807PPjs3uc+t2jDrmPoPQgWH9wnKbzMx7SD
         x1QQT3VLI04aV0r8PusbxWJuLeeTH9uuIujepVTvz5K+QXqw/zeaWouoGMQtZqxTTSAv
         WRmck/VII1Xox76UX1VxDRN9IUytZQQBY0qN0iO79+nC471sQVoyJOKVM1k+R1yu+BRG
         E5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288711; x=1779893511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YeXGSGSeoUMRQKY4PjIJ+D/sVcYw4EfpKGdbvxvr2ek=;
        b=Ahku9O7DG5zEhlAT6axpwDNcIykMWs2w78P2QYRue8FPRxbkM80Diy81Ey7kvSY+8g
         twzm0toWaX1HfIe/cMhfbSurMjGtWWDaHE1YmrfZXodJHoPLwdn0E9zdo8+z9SiaOjp1
         hNWjwAcnXfbMYJmr0TaroKGmH+OI1lYpB68LT2n50OPT5hxStFdnYVSE8rCPjdvucXND
         FQzAjJmFHs66Z7+yr4/BG6B7pJg3XARE5pKt8gQ2R7t9ivGH5PuRhMjehE216iguAhfV
         ZggJTb0ytnTrM6RAqqp1XK6ZABulyh5ibsrgcYVlPy1ayUdUdVASFNIn+cjrs3xD6i65
         rgUg==
X-Gm-Message-State: AOJu0YyUrNKsoxIvMjLvTnATLK59vCGTpG1oAiXRxxS4gHUu+cXIXNK9
	N92f9xxA5bzTX+gEOGTDewwA3GQd+ssC/UNTyl3WlZ5ieddnDdZaz4tDFz8clUKe/UwKfOwpXQu
	UIXigr3G38ozEQJF439QN7YQf3KiF4Puo7pxI0qGv9Asoe5nrkkEBywYKXEGN8MUAQC2p568a/r
	qD
X-Gm-Gg: Acq92OEu/4VEmVHLFs0u7E3QNlA2wByLub5rRgWofF7oetNrd8CQnQMvLHouCLSMRKU
	rMqp9NQZk/SQ7FilMYzdDYCJct98WT1OHMUVxAVXuwcx25LfkuVAYUMejJ+wBXZS1H8TDiLDdv2
	QGzhXPGWv5WUo3y7j29y1XFVC0Zt7oFNUIoRXam+4l68b1Yz72N9gzA8BPFrRRaMG95I4EIBK3U
	YTsbeBs4fjWF7cD/k9XeNzZe61S5KawxHcJAwAcaLYL8dBCBavNzbHN0dRhvEqlb26kHnTZNE85
	XdmttTic9wCQYygC6bQJWn3pBaC59lRJMmROt04DBlPsGPoeMmMkRvuc7jMRRJSczeGQ1voBOxD
	g6IvdS7Ch+PPGFjFH3/vZYrpsf3DRo08qOECrx2CXysEKNQgljISrIly0esL8luF19lDyD3IjBK
	NGWiVRe/dYmkvaBa/89WxqC0Boi3A/niNbnfw=
X-Received: by 2002:a05:6122:348d:b0:56b:7023:1393 with SMTP id 71dfb90a1353d-5760c04adbbmr15005064e0c.11.1779288709952;
        Wed, 20 May 2026 07:51:49 -0700 (PDT)
X-Received: by 2002:a05:6122:348d:b0:56b:7023:1393 with SMTP id 71dfb90a1353d-5760c04adbbmr15004990e0c.11.1779288709418;
        Wed, 20 May 2026 07:51:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:23 +0300
Subject: [PATCH v5 16/28] drm/msm/adreno: set fp16compoptdis for UBWC 3.0
 formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-16-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UwVvsKLkUIORbtzZurFAWqIbbBEib65pVmAxe/wBnTg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpoZsoCoh4ITjYLrfP7D/p6oAmgMVaq2dyEI
 bBUkSILO6OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaAAKCRCLPIo+Aiko
 1fiSCACcq93Vxr0c5qkcZviyqS9YIR9v5nVgibape0QZdC2E8mWm0n7XbJVGelM/7pjRv+22goK
 2bzp00kLkEOoBkGlWT+EpNoTd1v7+BDYYxD7S0vkF6LndQbgbh9qHLEMp/6IVXRMinvIlLDLsxa
 PFxS1AX1VUkUqoKhENMIc9kt3xPCwEmbWBvpaW9/cWTn/bZGuKA9dxew4mINUO4PY9cMmjtqTyz
 6omgFgniK0OrO2XIfrmOhfmxx49QAK+B07xz9eF9+TM3rjoYgfAf+nf+fC0SwZVf+drK9HLZ3ss
 Iix01Ndu4hQ/U220XtaNaooOg10PLNeX99e0J3ZuGB1PzEp9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfXxBawAeQ4xZBj
 tZ03rmRgHQnkszHSpvTNq9fnGTbgRiJGa4QpmxPwOHKRiZ2huo130LmMQ6Nu2GWCi2jE5OlMEUN
 7XrHr77k8+OCiYpR4LvJz8nZ4fm3IohUl96Im0G6k4z2xo0ByOLv3yAcuGa0SWLNgZ+xMn+qaei
 9BcsUCHOs6mjGiZm2s4a9H+j/N1mdEgz8ArOXXJDDnrVLW4CCP3b+8ebaoFjl70qxsZnLdFI2vR
 JPQx4UPeOHpnVs384Ht0yIS7ZiwmaYgYO/qaTjCqEZZu3nmrme4Rkrdo+rE/lGPNRZwoHgqJTGT
 Fd8g5J7tTUO2CSNhC5YLVlc0LFqDP0254MC6qn25JjO/BXiLALzFOQa4i5DfbSXs75gY0oZkQBc
 z4LVikcYJrw9xDg004XqZbPnVWBR39eJA0SeHAlEAn36N2BcVHFES/fsqE40AyYJv88vVPrjVmO
 TNuTX+KHot5zOV0yp8g==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dca87 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CoZj-JnWnDGe1ZqNdgAA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: P28YDsu9tSRNUWtgSwzWphtT5sdGyR_z
X-Proofpoint-ORIG-GUID: P28YDsu9tSRNUWtgSwzWphtT5sdGyR_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCF3A590ADC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fp16compoptdis bit should be set if the system targets UBWC 3.0
format in addition to UBWC 4.0.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 7a6223ddd8cf..867c7d05f670 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -303,6 +303,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		break;
 	case UBWC_3_0:
 		amsbc = true;
+		fp16compoptdis = true;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);

-- 
2.47.3


