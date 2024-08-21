Return-Path: <linux-arm-msm+bounces-29165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D41959213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 03:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804FA1C2204A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 01:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CF7134AC;
	Wed, 21 Aug 2024 01:14:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1838EEBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 01:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724202849; cv=none; b=mRYFaCLqIEiyhOEbfFbSViORSMy08DccRxtaEiPjdeh5+gVlX15golX/t38YTL5LQ+cqY7aa9kUXznRrwp7V6FB9atjqxg+F7uWPT3TfNpHmMKITj+pEphwttP7GhaMwzkDQiTS+J90StsXli31BNdmONh7ef0YWxMe3TjSEKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724202849; c=relaxed/simple;
	bh=Mrl40UjWDdzgZ+Jb/LHew4cNs8Zzx6ZyicJES1WxU4g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WoL6vcy1CgqyTP2RpBKyMf+iVB86FVdvDI2wxcy/fU44BplJJuYgSbvQAnOg2xt9DW9oKhkZlxDXQWIqSdpXkX5NywpSjsw0Vq8FoSETvtVgXgR3JdjhFhEz4zXGFPAA3Cg7LnoSPZl5+zXcpK1xlZNjaiFvhnrS/GyKOBIItWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WpSwg1LJzzhXvK;
	Wed, 21 Aug 2024 09:12:03 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 88BFA180101;
	Wed, 21 Aug 2024 09:14:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 21 Aug
 2024 09:14:02 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <konrad.dybcio@linaro.org>,
	<quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
	<marijn.suijten@somainline.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
CC: <lizetao1@huawei.com>, <linux-arm-msm@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: [PATCH -next] drm/msm/adreno: Use kvmemdup to simplify the code
Date: Wed, 21 Aug 2024 09:21:34 +0800
Message-ID: <20240821012134.1947547-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.

No functional change intended.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..ef473ac88159 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -688,11 +688,9 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 				size = j + 1;
 
 		if (size) {
-			state->ring[i].data = kvmalloc(size << 2, GFP_KERNEL);
-			if (state->ring[i].data) {
-				memcpy(state->ring[i].data, gpu->rb[i]->start, size << 2);
+			state->ring[i].data = kvmemdup(gpu->rb[i]->start, size << 2, GFP_KERNEL);
+			if (state->ring[i].data)
 				state->ring[i].data_size = size << 2;
-			}
 		}
 	}
 
-- 
2.34.1


