Return-Path: <linux-arm-msm+bounces-37434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 289BA9C3406
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 18:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC90D281675
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B6B146A62;
	Sun, 10 Nov 2024 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJFtCLRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274C13DDD3
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731259896; cv=none; b=nEmQ+uicdUPU5h1QUsv0iESd8vVywDarFsqhYIWr2utidpIKRraEqhpU/WcifWWQUhDkvHku6oQeWj2OnTheiZe6ZQkdnZfrfgkyoE12rpVwjOVFTc0WToed2RV0Nz4/KNtApWRCYoHpuvZvm6G08THZiydy15wSfk9oUMBKSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731259896; c=relaxed/simple;
	bh=HkkqzqYZ9I8U3OYgFmCXR7x8x0rR8hNjb441DaC0VZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DYQ6pMSJb7S+anJxy4ugebiUMd0DElUMN1sMxVlgWMKbBerCGnKBk12tTlchJ0iAqFfPYoUoUBQvU4zVQG3uxH6S4QjQKzZqmRYaorLhN8Wio/JdIVhDwrct5edBSJFnIGL7NPUr9p854edn62r3rRqb8r1m6ybprA5IP4hEalk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJFtCLRM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AACG3KH019073
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoqymUbSuzTfgs3YfQWe8EZeWIHhOdUDYitzaoggpdU=; b=lJFtCLRMl269Usas
	3Ak6ouXeiC6W3fjbyHgv7FZ0OcFExRF4xKmJkBJoYGdhFOuVGovsvohqYUb/7PY1
	L7nscyrjJaICDQkCbNgB3HrN2uAOaO9F6JbLoHSj4pedpFszvc1eIoCokyAyfpcu
	eJ3Vn+DbOlKDCHwCjLL5dtZMSObUVdKbKV95UaXti/XqiH8mweqOXy0wp9bSRFvh
	mszqbBs4LTwyRRhVDA/Jq7z3/y799czRipsw0pSrnxAfhXuPvL5Cm3PKy4KuWi/F
	YzyjcbvIJn+nv+ocpXd/673oVYDs5GNnnsD+xkzB2ONRyWbcHI+TanKi+b85wrRp
	fys5sg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sy2fte8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:32 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3e5f4437768so3535778b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 09:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731259890; x=1731864690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoqymUbSuzTfgs3YfQWe8EZeWIHhOdUDYitzaoggpdU=;
        b=IgOO/pD9SGVKYKjHzr8zntM6wRZG0X56kKAdGvW0KiD/au/uSdjlcBU4NfD2jJneDK
         1v7F1e5T7ALcsndYPVEAPR7coRdPz/jSfiD0wZ6W746lncn9RuL7JqXsZMW0Yz39NI5E
         L5ZsVvDgahtvXYkvr1fYokrPY9hZmaYSTsjtdec/oBfWOfy6QSTmwvHy6V+UhLvVugOv
         y+FyBbuJIH9GUQ++SRBUGvrLdM1R+r7121Oj5t2doPn4bsP7UCqUCkwmIcDMhOFBrhBI
         hsTaAkO0Ca39Eq0Vj9EJdar6MJmEn4Ev4p1UlmC2cZX7pEBSG669ej9d0wkoxFE340qQ
         jAFg==
X-Gm-Message-State: AOJu0YxivYE261yH/IOQqsr8YnzpX3gbu3VoQgQ58VE6m6bCpSwfQJvP
	s69lFiQQ+NtpiGmaUeiapvQyH2HFJV9eUjrcz1ZXnlVoGoPXG0TXUXye2GYzIlr57Cd9u4IsJWC
	3rRsusG7kLkMqIrhV7ulY65cdUuMYZHrJ473QQNSIy1HHrNPY3zvEsBL3mJaQOX+ckFY8Hpoh
X-Received: by 2002:a05:6808:2105:b0:3e7:6468:1fd5 with SMTP id 5614622812f47-3e794657653mr8350230b6e.34.1731259890667;
        Sun, 10 Nov 2024 09:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWyxhZzgV8jj3hMo4wiNEnob3/wxI89e+SDHXIT7eMFyTQmCzwSrCFBhaciMwwS6unG6wSjg==
X-Received: by 2002:a05:6808:2105:b0:3e7:6468:1fd5 with SMTP id 5614622812f47-3e794657653mr8350216b6e.34.1731259890376;
        Sun, 10 Nov 2024 09:31:30 -0800 (PST)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cb53843sm1718506b6e.0.2024.11.10.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 09:31:29 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 10 Nov 2024 09:33:41 -0800
Subject: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for per-process
 page table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=HkkqzqYZ9I8U3OYgFmCXR7x8x0rR8hNjb441DaC0VZw=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnMO552UOCpdvNfPRiy9GOkjK7Xvxw/DaFyCNyp
 jJhQw+LOgaJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZzDueRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUORA/+JTP943OIpYznMXjcUo9YS9qQBZF3wzGvp2JZEcJ
 ClLWvzOfnzv8dYtF726azGr8Ww82GcjAhA7KnjubhyHOGZ2hkWs2dxIs35kdf2z2MCcLJ2nekTt
 eeopFGoypHfhjACVSDFLGUzPApt1Gjpp2YTO9a0o/kYe6L33kC7d6WDcKaTxB8TIWRbhKZCHxKZ
 OoB9b1W1nnfRt7XRnWJIHtctPLqL3sJ7Z+0IS27cudn1UMoxSc5J2Oz5HgOroLDTuZC9UCryrS5
 x2T3xBRvBgpICaqHJ7QeZefLfYSoy/9OGsMYPkUoYrXvMNvtWia3/HtFM3sBq0kweUPuzB3uVLQ
 lgnxZp2rf0n9mBVx1pSykK0cLFqzMcPktXLcMHAUPEX/jh6IizZzhiODgGbV3wNUge5QUkqu5pa
 Tonj1Vfj82AEDvtGkNcCGPH8tlv6SfetBONB0lHY5sWlIjT0z3bj2G9T8CLINtWRuoyRIxWSs5l
 RfvaIi8OOUiKKF4DwW49JCdmqsIuF5ptcPNwyT2qHB19Z8pGrcbwsOzm+9gH7XUCdeKNkw7HgUZ
 KfMmODvxKAsi8LZITL6ov/T6mqdGSurJp1b8VJ3wCHiBIGU6oiq/FBpU47+clyETjoIW/+OYy/x
 etfA38hrTphrg0AIM7PPlBglWVI2EKO/NFMAqHuUamc8=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: SJGgmNMf1E5v--COEXakgWOYMF_OOKFc
X-Proofpoint-GUID: SJGgmNMf1E5v--COEXakgWOYMF_OOKFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411100155

Support for per-process page tables requires the SMMU aparture to be
setup such that the GPU can make updates with the SMMU. On some targets
this is done statically in firmware, on others it's expected to be
requested in runtime by the driver, through a SCM call.

One place where configuration is expected to be done dynamically is the
QCS6490 rb3gen2.

The downstream driver does this unconditioanlly on any A6xx and newer,
so follow suite and make the call.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 076be0473eb5..75f5367e73ca 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 
 int adreno_hw_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	int ret;
+
 	VERB("%s", gpu->name);
 
+	if (adreno_gpu->info->family >= ADRENO_6XX_GEN1 &&
+	    qcom_scm_set_gpu_smmu_aperture_is_available()) {
+		/* We currently always use context bank 0, so hard code this */
+		ret = qcom_scm_set_gpu_smmu_aperture(0);
+		if (ret)
+			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+	}
+
 	for (int i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 

-- 
2.45.2


