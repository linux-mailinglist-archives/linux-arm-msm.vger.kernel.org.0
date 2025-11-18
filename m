Return-Path: <linux-arm-msm+bounces-82211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02490C68575
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3E5AD2A5BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B061E31770B;
	Tue, 18 Nov 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbrWAn92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqcgrPzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68CA316192
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455944; cv=none; b=rpaeFSGxgdldIzAqlIpryONTOL7jyac2LdF6BFRS6kRs5GITC3dp18/SK2/0gyonUxh0GYzHbGMVc0zZU4O2CdeVArAWuyswvsOe9pvCfAnHuQgGjhVgkc8b7VC98qEHe+2hKwdZ+3XsWWaZNpy5PJPBvvIM5L0d6x3tZwINgi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455944; c=relaxed/simple;
	bh=ye3E3o4bkNQLrLn0I1sQjG1xLLVdg0W9qxVP6kAlZGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9gvdUhhOyazhlkF/ZpRCKuZ6wY5OQ9eGS5SyqPdtkcjREwUnxbM8rMCIYFagfYGaNUUQtcxMyNUZnj/tnGA0ZLU/AbWqSOCNS20hD5vwGi0NNuoJDNRWcv2sBbbGq1y/qkl1B2/AMmrFROrn4lb8syUdcS6/m6w/6rWu0jIf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbrWAn92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqcgrPzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fQb62272055
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=; b=PbrWAn92/UAvnxop
	hVL8WnJV+jyrdZzcyx1IT/cxgRshVWUIpNNYmpgd0uNI8bQUiI6E/wR/5qbJuMli
	g4WnDzjNychYcH1QO3cuNwZ9T7MUPXucS7v5Iks/Yf1HuFscEtsB/Arevxk0WlIy
	dzHEaJFVzJevTlVtzBF9+JCLxTJzJUvvbkswwb4TtyTKWKz1PCrkDHJHPYwpoTYC
	CIBzRN8fSp1fVTZPmm6F5vrFtfHBbhXPb4TWUNy5HZ4OCW2ckXGxtk0rU7rzzB/t
	GebM6rn1rYpxTwISucZzRRXNd1PkicUaaqIHjuNqrZiakCW4N002lOqMde/ZBhbn
	bz6J7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgc7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:52:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dde580c8so178166035ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455940; x=1764060740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=;
        b=RqcgrPzrTCxJq8Bhw/UTimvzg0yog3Et+RdjIhotC0Ntb1G/qGR4tXCeVldSeGRmn4
         WkGAT31rKPU8iqZ/PYYuQBLl3uQQU0W/raLNkkqu7qdxk4E1EprUxKwKBkqR+Vkj9tXb
         hAIMmpKPacjmQ7r5k0S6H3Naw4tcaGluCodRclbJUD0j6yaGUKzGMvqJ6y/VdOiBmLPC
         iW/I3L7o6X3T27BJKuo5ukk2Q5ruqLebkZ3WQO2mGf5JG1vyxJPOrv4P/MZep6HOf2iP
         P+e/9w78eMvccEha5ViFfCd5l5C3yC3VjyMwX0gWdEDnIJ7J9NcA9Tz1GmljHNOM+A4m
         R7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455940; x=1764060740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=;
        b=NEzZK7puoyzFFmu9HoLUBSh8IXoJKLaX87c3B7OOZwI0/8OuobbEJYNJ+yBirwGcxU
         v/OLRtcavGwOeYnWTuxypKhvTBnXskqHebwyD9G6Hdt5pZVDgTwHRKND3xoJdcssRf+O
         o7+7uFaxbYlv7EfNN/zJNmlRO0nbDrDsAG6YNRp/chudIZLwcYZr+kLvoLtS02rSjxQQ
         UbfWcJYzwSR9EsI/ddwDO5+LZ8ASMR7EQi2xfxr+f6USBGr5yKjMHuTNBX10Zy5Ujhgl
         jTKPt58d76nQZfab1ecBZOPfdT2esAg22Z3e2Y30GMyM0WQxWm6oTv834LWczkucTaBS
         G4xQ==
X-Gm-Message-State: AOJu0YyNj7tCM5Fedw/gAfiE7i1sI39SgTDv97d/o2E4oFmEuCVhe/gg
	MgtEAM2LX621d+o+WWuBkwuCFq1Y/Pby1VuKeAGJVMyrgaR1EhrZONi51mFMf9Xp0DbOIUouzAy
	yCR1iCTPqiiC9D5AW+8udLkpU2tiV3+g8TnRyXmlKIEO3OVW8aD/C1e7apx67J0/79k9r
X-Gm-Gg: ASbGncusb4cpWdAcOLnPAYv40LiiVzz1AmJLjkqLfWwSDScS4No5L/MWYqK1TQN7956
	rp1vLL/Ds5DCwdvjPs89tEL1Ndu2Zu7YumltHnHz28i93W08QQQIQDZpOGSAmI2C3TQOX5ziHrB
	M0wngvx2xZLfEiEola3fIrbWXZ6eajdS14/GB32HpRqsgEQVqMg/O33OTGErQI3yx0/7ENv0zZC
	+fgfK+Ey9+OtPX5zm7cDIk/It5cMxFFDDwNaZLqVHo893I4nWacuycq02gmKen/6x2s+u9Kw/W8
	IdDle2ommWU9QCXCS5Y81qs9A2EFzGaqRqQ2uTfLc4+6ITD6EJi3yq/5S6QYzKG7WkR0Y7Lhx/O
	cD7sfQcfA3QFT5yZ6B2jtbwQ=
X-Received: by 2002:a17:902:d4c4:b0:26a:8171:dafa with SMTP id d9443c01a7336-2986a6d225dmr192585095ad.21.1763455939699;
        Tue, 18 Nov 2025 00:52:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY5DSlIVYM8XbzjgfaGaoj0qv84BBjOFWR74NO9yqLaQacZkB3oED8rW587lTo9DK6YDF0CQ==
X-Received: by 2002:a17:902:d4c4:b0:26a:8171:dafa with SMTP id d9443c01a7336-2986a6d225dmr192584645ad.21.1763455939244;
        Tue, 18 Nov 2025 00:52:19 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:18 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:35 +0530
Subject: [PATCH v4 08/22] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-8-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ye3E3o4bkNQLrLn0I1sQjG1xLLVdg0W9qxVP6kAlZGU=;
 b=uO/b3x2yM+ErviiHC5Yiqi/gnDy9JSeF3Bmq3OXfo8eK4rnUn7HPMORG4OtVFdsgLXpz3DYe2
 wILpk1MLNgzC4XeeECdd+yI2O2WBC6cJabZuE7vqvTFBDIx8LII4tbD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX+aa9ufMC1Naj
 tcl3aFJN5lQeC8D28TxPeTONteAKpT5R1wxLGVmTp9XkMjehQXO9KDsJaSxAf06vvhlYnNnJcaW
 Ctkdpsnq9ouZEMz8A78dIWqULdPeM24fYexqQdMbqtLDxAdoFHGcxRgO9K/Tk5AQxs605p3VPqb
 XuZHdsexN6gZWKrLMuExtMWv6KZuKkOfZWMjD8gqh1XDyNyUIauylIaZr5HLw+JPN9De8PxPgr/
 G206GMelpOVHaXMVu+OsrfRzkyIDYgpPCxDFs6pnxlpJ6A1J0+aYRgveDIC3TmW6EbtEBrZ08fc
 TVW6GU8r3vtw0usg8lkgm6H094SNvAS2qP8WauPKFzqkE6U8598DiPMaCcAw9q4eQH3n2IvtSow
 GA1hFPVbqVZbyusdgNwNRPHPg4s1Vg==
X-Proofpoint-ORIG-GUID: uwMwUbVA-_hxuC0aLg33i9Pwa-PY6Rmi
X-Proofpoint-GUID: uwMwUbVA-_hxuC0aLg33i9Pwa-PY6Rmi
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c33c4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 575f2f9d3b1d..9edd23d419ec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2641,7 +2641,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2686,6 +2686,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2717,6 +2718,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2750,4 +2752,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 08bb601b3bd3..922d2dee70fb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0


