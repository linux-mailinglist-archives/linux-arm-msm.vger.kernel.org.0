Return-Path: <linux-arm-msm+bounces-95881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULTtDWUFq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82F225701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04F353038526
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A670D413220;
	Fri,  6 Mar 2026 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQHU/CJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOFqjMGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307741325C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815651; cv=none; b=En1ZK/Uwryc8jvr9vIEmsYJYyvrjIgNHdTEwhuTOrixrgRAhRSr1PTW7DXnOIX+iLCuNzcnk86xw8VFggiTgSaaHeJiLMIRmh/0s7K5qLgaxU0siESmLBm3PNEUhQZO1ZOJjVYKuLQ8VVfPUkweIUHkmQsv2iQzKin2JaJ7/r1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815651; c=relaxed/simple;
	bh=dSBWM2x+kwZjmcQFVewwgxBgzRu48ixGoJYbIjzhJjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMMQuy1l9BPz8q8/o5Az+WuOqZ34XCNlSosBTc++97lt/Vxd57p9N1fhzsvmzBgCanX+d0MMsvokDsuGeO+kodJYuIjnHwlnTPDXJ4fwmpDK5A4FRbDdwm88b2KpXDxlIlhQUta/n7Ocj++9fQ1kOQI3nXixl8IaoRZ3hR64Ke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQHU/CJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOFqjMGL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrHts080217
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=; b=jQHU/CJHY5MIn6ZY
	aCSa4lqOAqgPrFoHJiZLiatiMeY3RG7EoVpygYZKTT+feeX0KHXAChnzoNtelO48
	zbrLl1vLkjDaJLWiYYdI+RwCOF4DSXOTT5+IHLWeZt9vNxXGMTBu+F4Ou3Lz95rs
	Rt+7KUNev0Rtgr/aFoUFV0RdAbn83m4TfVPZ4NZ/6Y3hZnJzqW3qvZoSoXzzj51j
	geHtdb16JctMLyLShtDDoV2zpu3iQ4x+V4QKUt4uvBmIwa+PDxGtQdkD8b8C+I1I
	ZNLXNe4PS2eiEV/qGU5Iw4SYHnhspL/H+uSIVitmv0mgac5uYpEbnYmPQcsK4ZOZ
	+1IIpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43k6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso1228029885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815643; x=1773420443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=;
        b=DOFqjMGL5V6eYkXjj8rNThXx8IobGA9gYsKJb6iQmQInvXCXAU65Nkcu44mj1fpRhJ
         LsakhUJokf6Hax4kaLz8ZME7C6V69fPuXCMMIyRLZpkG7kw8WmChdRD5oegt85s0QGzT
         c3tXwF6uc8nJlW6Wd6w5WrS8TaxKqJOHqzpESQ8MmF/z/fK3r+Ng2M6DuZM6vS7dtV65
         5rQ1PxloBcxsPtjjKsWNDhfNMzEuTR+pcWI+ObufLeUqWujV9DBf3GW8WjqwZT26HDpL
         VU+THHaUMxYaALD7mfwk/x/4otRRpblVSENaXOD8jROmj2/AGuG7F1SkaKaTZeS4fBHt
         eLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815643; x=1773420443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=;
        b=VpQ29w0VhUkEmRjO7PX99Nw6V3VCaZj8IgSMhPV/iQtiQeDjPnWRED5vpLWyJXpu1+
         HPqtzlwyy4m7ys1gaXWQGRsGn46O5BBvtveelMhbqs7SnjuNfxKTnrvH5NWcbvHfjp3h
         VFH8aVHIWUsORfl+MSlQAfQYG0PBZQBvja2SqUnCP+laLjJYxEVA+xtBWET30HgaRrze
         NXM0pxRMCKxG6Cdqb1bi7T70gk5w3yzK7l5ROJkn6GG04LrYmlOFAL+AUqTnQaPHM2vj
         I0MAennRgbJp2c3g85WfVz2mnoYdB4oVI4kA/apBojX0LjVIp95pZuotBv7HVTv31/U0
         ACcg==
X-Gm-Message-State: AOJu0Yx/k58nTFO5j+9epxvr9EpubzxZd+T/bQFq68dtMGfb85dlrNFC
	Ouoi+fmcufU4QdSdNW25DfqRVYwB5jTpiJTfyIGzNmKCZpDelLTwELBhzjZ0eNy00TlCPzjdsuw
	S5cZauoZ7aJn22sDWY1hFn38T8iDjpfG77muYKHuNQqV0CXBdHoKiorOgqZ9+DmgyTmTr
X-Gm-Gg: ATEYQzyikSB/CNAO2OmIl8B59IOlK5RoE+fHrYFUb/x+ZSWogGnoSZCUMbWtmQY1/+F
	ITFBB59LpSdXaxAhJoqW5lw7um07GKdqWzj9lPeaBS5sQ82u3/0TY3fEa5WVu3SG+/BmsWTe90j
	WJ4F6jT+PmZo5Eczwb82qbAu3cpxhWNolZkfJDEeFX+0mkkkLqg2uY+aE8DPXnbwbr3mKlr9u9C
	lb4qE+ZhsI3UZXvUNrLCh/O6+CAPlSt9VmAROUh8oVVt0NcTybRLsiTAIU5iQjipH42G7XH7i6n
	h4NYDmAUAgFJOhgFjTpaMVTc/W7YjJRgp1RQKinGwbec1Pisb/ee5bgNWwrSSfig+pj2DPfAY5n
	XgAyTHvtvRvM3wNxjFDyB2P0ZD4PbiRle1vGLwVkEqZ0zT34j4m+QlixC2xZuRGzFJbUXVujqXu
	+DNJc0FCLM7QgnB5UHmrrdv91mXR32OEQ5oDk=
X-Received: by 2002:a05:620a:46a6:b0:8cb:4ef2:f3b4 with SMTP id af79cd13be357-8cd6d48d6bdmr344383085a.73.1772815642595;
        Fri, 06 Mar 2026 08:47:22 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8cb:4ef2:f3b4 with SMTP id af79cd13be357-8cd6d48d6bdmr344378085a.73.1772815642060;
        Fri, 06 Mar 2026 08:47:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:11 +0200
Subject: [PATCH 05/24] drm/msm/adreno: use qcom_ubwc_version_tag() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-5-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSBWM2x+kwZjmcQFVewwgxBgzRu48ixGoJYbIjzhJjM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNAqeJoTbTsD3xfc25tA2JTYbYyry1SyyAB
 JBOvxzy/+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1Up4CACjWn/4ferCxCSGdGqQBb4i8bAXXaYWwL4r+o7o1tnvLZy9TM5DgjZtTw6j9wSifHZVjJQ
 KpB0lVk3zwj1ON9SsrFJ6HvaP5dKhfhCBShpUBLB//PBv/ho+l3htScn1PPfLY1jjb2nCEjAzE9
 gwhanlPxIrIzvd2h0MxJhZ5dsQK7w0mGxrAY0TrvsiNzOVM76gd2ILAGl2rK2ZwnuYfVKiv4W8g
 BDhBVO5jiqVAkW8UI7PkdFFQUbCSKIo/NQ7HksoTxx1y61/Gba7feWW/PRgFNJqOSxT5ZqnTMwx
 VDurHEwjSuCaWkIwV1eur+Cdc/iv1KbnCIk9j1Y6gAT3JbmA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fMZjGqdxHFO1OdhhRhke1a1nLaU4C_Uw
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab051b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QjZuzksZpR1x1fsoQ4cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX+Q0yckJRl9eP
 hyi+vT3tDItptCTb5JhO6VXEfAtx0hb6ome7CZfP/0Leb5K+hZTEcbxFx5FaWs4TB0QsTvRlPA9
 T7jK8Znqrq9MBqHrXlTPTBikl3qlf5ss/fYng5+KxDtn8vWqaxBIg7+FsMUGuJdzudC0xV0aE4V
 WwHnJ7tVMVjS/HfJr+owOM0w7A89e7mV/o27IvoIJrVB9UBi/4vIkwYtOm2CeTH3BRVHmH7IjGy
 QnHWSoc2PP1bS4/ZPZgQUIhR7KJ2TQAb5mj2GR3iCJ/mXhtETMD7OMreh3ipycn9FBMy7FrPiRh
 Y/M1Rq0lAT/NOVm1oI8g2WER1zMK6zyspfKdb7WnXG+ZVehBqUvILI6m1JuLRYeltaVUO3khGfP
 YVdNTynq/YlVWzLXnE6hGDxeXvTI11SI/EOWDCsM11La4dAIiss4bCH339ZHD6VAli6Lzaowdfd
 I7nsmn4aDwBYYUJy0CQ==
X-Proofpoint-GUID: fMZjGqdxHFO1OdhhRhke1a1nLaU4C_Uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: CB82F225701
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.929];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  8 +++-----
 drivers/gpu/drm/msm/msm_mdss.c        | 16 +---------------
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..6dc1d81fcaeb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -272,35 +272,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = false, amsbc = false;
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
-	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		mode = 5;
 		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;
-		mode = 4;
 		break;
 	case UBWC_4_0:
 		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
-		mode = 2;
 		break;
 	case UBWC_3_0:
 		amsbc = true;
-		mode = 1;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 		break;
 	}
 
+	mode = qcom_ubwc_version_tag(cfg);
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9f81f43283b9..798a23fbc906 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -204,7 +204,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-	u32 ver, prediction_mode;
+	u32 prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -222,20 +222,6 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	else
 		prediction_mode = 1;
 
-	if (data->ubwc_enc_version >= UBWC_6_0)
-		ver = 5;
-	else if (data->ubwc_enc_version >= UBWC_5_0)
-		ver = 4;
-	else if (data->ubwc_enc_version >= UBWC_4_3)
-		ver = 3;
-	else if (data->ubwc_enc_version >= UBWC_4_0)
-		ver = 2;
-	else if (data->ubwc_enc_version >= UBWC_3_0)
-		ver = 1;
-	else /* UBWC 1.0 and 2.0 */
-		ver = 0;
-
-	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 

-- 
2.47.3


