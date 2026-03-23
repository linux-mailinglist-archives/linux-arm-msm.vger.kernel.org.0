Return-Path: <linux-arm-msm+bounces-99389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P6uHnWfwWn+UAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:15:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E887E2FD106
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A809C309E74C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54853DFC7C;
	Mon, 23 Mar 2026 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of4Rq/g0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzQ+k9nF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A113382F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296790; cv=none; b=TVp72JDmaYttCRizQrzVKHO84bOa5SMXqUZeUIe9CYHkdoceb/oUcQsOgpJExlGk5oDEBmBI+ubATA8ro6/yELmdtEKGLVTqqgHzswRZ1tUzXBSfH+pKlq/XlHKpSJ1NpxBcQElygvTQXkAqOBUcd//FDZ20fo2Mf+LkDtdx4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296790; c=relaxed/simple;
	bh=Y47hfhEP77VPPLQuO6M98YMW2oPSMLiiSh5WGqdD588=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUxbGU9TNRlOv6AjdV6Q+Mfp3AT+lHMY22HyHLitZzs0OVm0f4oZTg2/putLpK5+C9c3pKxfY81pJdTCxxezaXn0oYXcLOlVN2Z4DKAZS4Yw0H9G2wayNEEU+STOaoBmJ/mStpVNoDfO7WOJXLeRQlDVwbEJ9E6QkRom2e+IdaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of4Rq/g0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzQ+k9nF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXkI1761799
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gnUn4vlm4hYrJYBjxx32v/u7fbwTJqrSqNxW05+/Zk=; b=Of4Rq/g0bVYsAXN4
	7FyNacw+Ksh0aBGZFUtPhXJPVvFJa9IT7+MO0154eM+3SQxlZHO7TtpwUXAjEhZ1
	gC+7w9P1VGZTTMbnEHNagPc7rS4xSVSeVg7/MOorRE+17EM6BUnfUQhy7DIu8pir
	MCD3gB4HXOy49CvwSD4zugOLd8hPJVNlNdWHLj16qQdL5qfngvBAe9wNV1VLHQUO
	SegZETfwgnJVDg+98fb2/Lt+sxmZJZ+CxxJ2fEMoSzkPV3ME3q9LrQOxKfBUm1Fu
	5/i9U0oUivGqUfDV4B2FzgtqQmKMpJrjYfEnTFZau3E/FZuGHtfhGgKD8qP1E9wH
	1u1/mA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f09ds6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a1436347eso316132b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296787; x=1774901587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gnUn4vlm4hYrJYBjxx32v/u7fbwTJqrSqNxW05+/Zk=;
        b=jzQ+k9nF0sidrCQ6eXjfE8+G81rFyEy9Jd0l/I1RKpkggXcXY3x7muf0YXX2kViS8h
         4Vhy+5eQAABC7ss0ZfNIY83V4oez2jjHk8ryIe/uFfWMqVBDAqxEuxPTfPIBwIZ3FoZh
         4CReM7xAMnJ2uzKdPXfV2cJKAbl/nL92shyVpHbtJCbe9zs64G4TkkCrHp6JaoCuGzIV
         xmXZm+WG1r97IjDwcusSKUGRB+w1aBMgv2TlS+7RF9aaIou/RSuLSMhjv5JxCbRRUgaX
         tkGrRIsB1L82aAlSxJyntlz9PyBavJvI3jt/BJzk8dwWgYofA/YqBMPSGDo4gi4f5XY0
         J4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296787; x=1774901587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9gnUn4vlm4hYrJYBjxx32v/u7fbwTJqrSqNxW05+/Zk=;
        b=FN4qIhFllaM+VHQscOXiaKyOPc0fAMyvapYP6hE6v0OGNT7KOinO6tU9zvo4FDozDz
         +u6ZANYKq5UA0uxDQxwwEZIzd5nrZzvcOat4NF9fkbTvEA1AhSK6UuyLMTFwAES7rx/g
         QZ9Q1TTP07/rrORskD7AkcrvT0uC9CVd/ekW0rvXB7vFIId097nFh74yWjd0waogTySr
         zGcmyQB6+Mf1MELxwN6sRV2/J1BkVpePUa80UabSsIv7aWiNiT8aLlN0TXcSVRZ8Dwnv
         YFOshN/7+JCgcrSt+o+Ufakj3aUgaFQTVvYD2jryBz5RVOdAQqMqeteCZN2zICWiJ4g6
         L++Q==
X-Gm-Message-State: AOJu0YyK5BEb+kCYz7uhC36YhR3v/+v9jmGXgOFgPk+OX7+756jrTiiH
	Jgm4pT83o0jYk5nuegCZ00Qoov/9TyqPQuzsdDSO5nm9MVLA2vJHe2WaLlqxbD7MEMo0gDQnGTC
	KQzrQTFy6R9br4EErcQvKOdxqnrkIu2f4NSVuIVgZtJdt1heRWX/rXrMkyjSVKO20lqwZ
X-Gm-Gg: ATEYQzzidmVpFqVnYxT5tEvAskLJoAZ/HqHgy9jRfRlFFEcejqAFGBp+EzUETe7U5a9
	XqHzGZ+2Mp8luDiFGaL2lwmUkxCRbk8iXuUKtjl6M0+6iACy5CaI3S8xr9be/Nd7QopREcRTvNw
	wXXqQuGaq2MlfXG6odz8+K5b3SZA5dxad7UZP7HdqYB4mns2JP912Ns/jvlgME2l3fBNadmCMhB
	zjGB+M8ANpth7VPWamEX9iVTCYc5JOfytIZfvd6EiFm2rNM2fZW3v6GAAlhqW31PTFBWY6ogAv9
	fcV7pSLxbs2PF5/k/qqXRDyCQOJIT8087rkmgVKa1UmhK2gKF9XGnRhBu5H15bv4ttNDiI7fjXO
	A9D/jYw9l7YdRxr2mGOcf1RbETVOnj9/kTDAQ67EcIJ6XvQ==
X-Received: by 2002:a05:6a00:13a6:b0:81e:4476:f67c with SMTP id d2e1a72fcca58-82a8c22de4dmr11789579b3a.3.1774296787428;
        Mon, 23 Mar 2026 13:13:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a6:b0:81e:4476:f67c with SMTP id d2e1a72fcca58-82a8c22de4dmr11789558b3a.3.1774296786933;
        Mon, 23 Mar 2026 13:13:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:17 +0530
Subject: [PATCH 05/16] drm/msm/adreno: Coredump on GPU/GMU init failures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-5-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=4487;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Y47hfhEP77VPPLQuO6M98YMW2oPSMLiiSh5WGqdD588=;
 b=uNx5nipFybpSsxCpeoPj8dQ+2Szp58MCMSQh230ApmII8VwqLiThw0TG2UiEPDhMGLF4u6Hsv
 Cnqrk16U9iaCYLw/aJmPZTNSksnZB5JVRYhyIW0xPFVKxUOlY62uvYC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c19ed4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Uv9L2OBOgJoomgqfufwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: So2DSS1Uc7q8aYy0lupwVlvU0KifTsOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX5m+iyIs5veUT
 I+PN2Sez7ODuAmnIixsImbOEGyQtZxMdfb3qkP+vUVpTIICVb7Nd9VCM0a0ZVQDVFsdFvppuWAC
 EEQKJzSs2LsHNu8iAPgPDENgvLPjrH6mGuIY7JdHIco+LAgYG88v1xeseuX8oQns6P7XdcBcqFs
 HOthZimS917uAAZSeSc5Q7EOBvvFld63DZTE4vZVDLFEQfCO/j8FxcnNLulfN1fJz+3VYbiYU6J
 uc3AU0T6b8pChpIdBTrgLYY5lcKGYamS5eBjqhC+2dh1+5pMAOiOmnrDQTpUWaXJPivk7MgtYhh
 DqvVhwRIc4FL/GukBJ6N5otWkAjNjIumGFiIHD3SoXu+9gWfax7Wcurr2Nw37w3rPkkoBb17Owz
 rqj02HQOIrNB/xylb9yi0CjPtFCX9DletC7gXx65ubnGSlPj7FJ49wruay6jAKghiOmbgtxJmUn
 oyVvHGTB7GF5O0pThBw==
X-Proofpoint-GUID: So2DSS1Uc7q8aYy0lupwVlvU0KifTsOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99389-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: E887E2FD106
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Capture coredump on GPU or GMU errors during initialization to help in
debugging the issues. To be consistent with the locks while calling
msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
msm_gpu->lock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 ++
 drivers/gpu/drm/msm/msm_gpu.c              | 5 +++--
 drivers/gpu/drm/msm/msm_gpu.h              | 2 ++
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 690d3e53e273..6d511dc54e43 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1240,6 +1240,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
 		disable_irq(gmu->gmu_irq);
+		msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
 		a6xx_rpmh_stop(gmu);
 		pm_runtime_put(gmu->gxpd);
 		pm_runtime_put(gmu->dev);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4edfe80c5be7..85b3e1f0e4fa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -105,6 +105,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	 */
 	pm_runtime_enable(&pdev->dev);
 
+	mutex_lock(&gpu->lock);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(&pdev->dev);
@@ -112,15 +113,15 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 		goto err_disable_rpm;
 	}
 
-	mutex_lock(&gpu->lock);
 	ret = msm_gpu_hw_init(gpu);
-	mutex_unlock(&gpu->lock);
 	if (ret) {
+		msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
 		DRM_DEV_ERROR(dev->dev, "gpu hw init failed: %d\n", ret);
 		goto err_put_rpm;
 	}
 
 	pm_runtime_put_autosuspend(&pdev->dev);
+	mutex_unlock(&gpu->lock);
 
 #ifdef CONFIG_DEBUG_FS
 	if (gpu->funcs->debugfs_init) {
@@ -136,6 +137,8 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 err_disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 
+	mutex_unlock(&gpu->lock);
+
 	return NULL;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1bc0e570bd12..10d9e5f40640 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -391,9 +391,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	case MSM_PARAM_TIMESTAMP:
 		if (adreno_gpu->funcs->get_timestamp) {
+			mutex_lock(&gpu->lock);
 			pm_runtime_get_sync(&gpu->pdev->dev);
 			*value = (uint64_t) adreno_gpu->funcs->get_timestamp(gpu);
 			pm_runtime_put_autosuspend(&gpu->pdev->dev);
+			mutex_unlock(&gpu->lock);
 
 			return 0;
 		}
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..472db2c916f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -361,7 +361,7 @@ static void crashstate_get_vm_logs(struct msm_gpu_state *state, struct msm_gem_v
 	mutex_unlock(&vm->mmu_lock);
 }
 
-static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
+void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
 {
@@ -886,7 +886,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
 
-	msm_gpu_hw_init(gpu);
+	if (msm_gpu_hw_init(gpu))
+		msm_gpu_crashstate_capture(gpu, NULL, NULL, NULL, NULL);
 
 	submit->seqno = submit->hw_fence->seqno;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 666cf499b7ec..eb5b3a7b81f9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -747,6 +747,8 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 }
 
 void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_info *fault_info);
+void msm_gpu_crashstate_capture(struct msm_gpu *gpu, struct msm_gem_submit *submit,
+		struct msm_gpu_fault_info *fault_info, char *comm, char *cmd);
 
 /*
  * Simple macro to semi-cleanly add the MAP_PRIV flag for targets that can

-- 
2.51.0


