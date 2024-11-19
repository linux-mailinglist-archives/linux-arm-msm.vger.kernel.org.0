Return-Path: <linux-arm-msm+bounces-38391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD23D9D2D5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 425CD1F25712
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F8D1D95B3;
	Tue, 19 Nov 2024 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llnqIwk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4B1D7E31
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732039020; cv=none; b=hXQkkI6D+1Xcpen9Sx1zs5CL/3/IBRCpLsYS6K2WP3FxnvXv19Qy9ALbohOWjnncKxA37kRiDTvS0nwnKhFrCaNOk4AGIp37+CJ9YWqTtP3FmdH5rkP+MDTUF43jF24FV9y8ezrWQyvKsokvCC56TaSyxdiUoIWJ1JPzC8FyN7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732039020; c=relaxed/simple;
	bh=oXkj1C6Jx8yUMHy3C9MjrWlRZXnbo4AjWBLbi4B14uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbJf/d5TvLFIxaFwTHVkh9EHQquGO6QIbom7KqgdsmpDYUs/rhnevTAzWOhiPIcQ1dG4IsY+YiHckBl7htA6Tp1NaGeH4noek5FOkNaScMnObQouCPcSFXIZkwpCK4lo3yToZ4szc0sru8PiMYbXdSVan9l+iQb3q/Y6sPUKgFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=llnqIwk7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so41544205e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 09:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732039015; x=1732643815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjXGo5viMHe7/zGLjLLL+XFyV/IDG+n2c4d5eIBcvfQ=;
        b=llnqIwk7DU3RTRv7MSKnlSi/i7tOPCL3LYfgntzbVxQacf0+DJlpmwOAHcTYzLLN6z
         qo9kDDZBbGfM4XFsOkitwY8f5JmGNq183FsW1q+diSJTp1X/qABXMUjo8feaWgT5mYRZ
         SWUxYFT7Qc1fE+Ue5fg9ZKsByPSGD8mOdV4kxpL8gGSTvMaLaGMUY5NhUd0JdnXCLukG
         kEc8iOoBTpuvFHC+dHvdCXC9xk74xrASsTQ/GsQqw/SEWnZt9Rjgh94Eo4wb+DajLAVs
         BCYj3k6aSHMB7JrUAWrx/NRUKc2nEqZp0Rlhkh6B6BBpodlPtKH7cb3aU1MfO2T49U8o
         +0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732039015; x=1732643815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjXGo5viMHe7/zGLjLLL+XFyV/IDG+n2c4d5eIBcvfQ=;
        b=jj8ctJdSBwB6CkBu7VcdK+a4enYQqxxuSO1jYqxBznpW0eSUUH5KeSF853mhJ1H8YX
         InWvreQ4qY49N56janmWNq2fcKbMWPIbDK17UXm+Fs/7HbtkreUHLlAMNSEZfPuUzZP8
         +lr4TkVVepT5+pSPMiYzcMUVqAATltyuF7HwI34jhRGFtLfQaOezagATjIH9x9yQ07gr
         l4CVj9f0L5oKGf1RKU9Fc0Guo/lND/4w2swAHe8xLTIrxVw7c2WM3hIQznPQEECOopnF
         16r9pWiKTIG2Av1TxJp86UHVfFa9oJbfUhGDPfv9vixb/BzGL6qmxHIW6IQzetRgl4rH
         giIA==
X-Forwarded-Encrypted: i=1; AJvYcCX9gxOXGi6TO4MbSbLqqISxsswgHl3mVvuxwYE3uZOfTVXGm3OkV1vEUG5t71VgAEIVCuaDxFUhigUf+rfr@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGQTQfoDCad7IQCtvKZFkOPvWNCioXRZfpmWUHxZ+ALTVyuA7
	BEnJDQVanyevHTtNRjgpwswY1aPb1dzO3UkylKUq9f3GkSHtq9GnoM4m8+t57kA=
X-Google-Smtp-Source: AGHT+IETH0Hm2buMkvy/Ll4++F3Vi1yZx/qAIhcIkteGjWjEm1IVZlr1JHBK3iJywT3czzSrxctNNg==
X-Received: by 2002:a05:600c:3491:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-432df7901femr123471485e9.28.1732039015397;
        Tue, 19 Nov 2024 09:56:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:56:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:43 +0100
Subject: [PATCH v2 08/11] drm/msm: adreno: request for maximum bus
 bandwidth usage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-8-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oXkj1C6Jx8yUMHy3C9MjrWlRZXnbo4AjWBLbi4B14uI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFaHpmsc8d0QhqhvhKQzuhIHbOW/nweLHVI4J4K
 yOvheo2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWgAKCRB33NvayMhJ0a6wD/
 wMgXLGer+Gwmpc2QXN/wUIVfxGxIJekwSowXEGKXdUnynbp8xruE7XqMXPRugx8J70wKaRkPVIDBAq
 YlvzhmgygfqOd99bB4cxv/m+LhYaB/sqeIpGxXxIFg9JUTmOww07+g5wSg8uS6g4x/6m/AE1QW6inw
 6Vi/BiDDegOqKGTC04oXy/3wuJGJkjx/hLAsfoQnmKO6rNLc7nlepQN+a86EgENOC9uP5dWo51XxiH
 Qcw0D+UEhPz7Sywxlxx7/x7hYR42vAQ9XIZE6df2tJtl+qSn5RqVSdnuk+VpVOZeN5GLzycCdaAQZZ
 +BpzDDGet1cB9RPKolF1+3rtxHRPKGaf44xlgrXdngpLlCDX3feji1t2DqUyVLy26qj+wBGcF3yC62
 5zcZUam9IXez+ZA6dmDUpWQ8bDHDUN8pH/tnJQ5NxqC5H2AUPhl6X7UgH1GVhn4wBI6oACdLFbfRLS
 cMR6fJTddxi7KPzvhhZo+GYeEA1oP/PnjjCSPMzGW/h+tSi/RVAGm5s/NBp+sO//57MwUqIIcmMYhO
 74L35njgwh0bb2h+YhE8Sbonu83uTFPWOvTov/B+Qp8FRQOiZkHZnmAgPO6L5jvzvJUZhLOTrl/Tda
 bmMyLXaUOA/pQYp//Bky30nqQHwALOEFRZJO8MR5XVxt+ciFfsVHs8vCb7uQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When requesting a DDR bandwidth level along a GPU frequency
level via the GMU, we can also specify the bus bandwidth usage in a 16bit
quantitized value.

For now simply request the maximum bus usage.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index dc2d0035544e7848e5c4ea27f1ea9a191f9c4991..36c0f67fd8e109aabf09a0804bacbed3593c39d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -134,6 +134,17 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			if (bw == gmu->gpu_bw_table[bw_index])
 				break;
 		}
+
+		if (bw_index) {
+			/*
+			 * Append AB vote to the maximum bus usage.
+			 * AB represents a quantitized 16bit value of the
+			 * max ddr bandwidth we could use, let's simply
+			 * request the maximum for now.
+			 */
+			bw_index |= AB_VOTE(MAX_AB_VOTE);
+			bw_index |= AB_VOTE_ENABLE;
+		}
 	}
 
 	gmu->current_perf_index = perf_index;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 bw;
 };
 
+#define AB_VOTE_MASK		GENMASK(31, 16)
+#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
+#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
+#define AB_VOTE_ENABLE		BIT(8)
+
 #define HFI_H2F_MSG_PREPARE_SLUMBER 33
 
 struct a6xx_hfi_prep_slumber_cmd {

-- 
2.34.1


