Return-Path: <linux-arm-msm+bounces-89583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1CFD3A15A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F6DF301587A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F3B33D4F2;
	Mon, 19 Jan 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5nFLgAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG48zTqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C2733CE83
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810648; cv=none; b=r3UVL6Ow5yE7BvIUuBo64TVA3C1dvFmv9vj61CEH5hsKJHx+is6eXthdN61otUy1NH94yjKQIiyezsrdAVSt+u0VHXUcM0RKw2LJc1mbGzR4V4NMg1rGAuDi6EMQ9Q/wYf1WmlaBqTWWwXKnNwsG7vTyNxYKFzyd7INBXURvAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810648; c=relaxed/simple;
	bh=9rYsLNuEACuzhywI0tRJ339OJWdDN6xkayUa/9Ma/Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbTM0OCXL8Zx3KReRG42byYmpXqA3+KO+yrBX+1d/9Qc7eJ8YMRdkexYpTREwDnMIfezBbyN48HVIQqdXtLttl9+i4+gm/ZvKj9/pNQoTdKHWbLJFgwWAXH0LN4RyblGX34xceDxc+/lW6nhsfksmF8qFyb90+cqaER3zKi7mL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5nFLgAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG48zTqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J5JPvT1990912
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87X96O69HjPFMulPg1QR+SL19iQWTFSZSdfYbuNZu7Y=; b=f5nFLgAY1HDPwSHD
	z9EAo74k2884XGgOpgA4Ti84KPi8+DgA+VPSkYhElavI7IETWl7mWZ+uG7tY83lG
	3qgnB1M5m9Yxa5FYrUsNFwzymaWMyqgpuXrzxDwDo+/Hn9GIB8Gwz0GDTYXZ4/Nv
	C6KofOe1SxF/nSKY5VkWKZZg9GrJjhCl8R7uLzGjJ+/QauDAbBB2ErEinopnhqnM
	c+pic2gOvwWBuj5eBs71QbxsGojWfS0ulG0kT9PJ6dGTlji3tMVt86PUIJ6Tq1tv
	pc2OljToIW50KavPmsd8HHuZZkGyybAxlzR8wlsCdv6DCS5wi+ORnluXPWiK00/k
	6R/dxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74898-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b20137a6so457521185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810643; x=1769415443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87X96O69HjPFMulPg1QR+SL19iQWTFSZSdfYbuNZu7Y=;
        b=NG48zTqVeNhXdFfRsClLExfKqZ4ajQOQrC07JfpBZ7/MJsL5i5BN0UaaF1AXhuW56S
         nQwoxX3SLz/k+GCmM+e6S6drKSC0lKR5rlLCNwr9qr7MP6H/ZbyRtc/PA2Nf767JL/h9
         fS9kCr4Ja9kF+0wjK504i6J5IR/Vz5+cz9qO7JuyeduCY7IegbeYdufWxr55/Xmr+LeR
         zReJOZ17+UEK1DtVQP7uZKIgz3rJ3NYuL3bd40lG/6tHxcyJmmScnRFgFcVmI4oFyGRB
         ++V0KDsB0QsWO+hbvT1iLxQ5DcHXyUhXyK6J03f+J9sfjrA6r3FDlo1oRARQH6AURGae
         iBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810643; x=1769415443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=87X96O69HjPFMulPg1QR+SL19iQWTFSZSdfYbuNZu7Y=;
        b=l9zLJMag2kkkNoeZuZSMXcXx8l/ezJk2kfDyaUTGVXWfiNo86msQbWme3jZSkrcCyU
         F1mOkSZ4AuQdvyejYV1/o8HujDT8G855p4VkxYqqBkgkcoGiEeXxupHfizaUFIwHTp5U
         LEKDThnNVcsOg3/zO0UdgMUZLrKZbhYBVlr+yFnOLGQ7W+p4KuoXYCX5PLwaBkQc2gdx
         ca2ZYmJ5q+SYBYaAZ0cFKbBRpAJe0U0O8sTsRtr65omCJw7CjQVajtUbXOeJU0bFMogo
         51Kwlx2lOdfKt4ED73BvAoyjyYGmv5xhILIQQeUArBIXP1gexPPwsuUb36bKhMgiYXe7
         TUeA==
X-Gm-Message-State: AOJu0YylKYdrc7R6rzMfNfZBOcM/FzBfOY3dUQrGeygZPSkxNWibemdh
	6vD430W+gRGKP6cpK+TsXjXyQG8WFuwU53p3+jVdvpLDiZnEQWoLYNUOYhr9QYeLT7+JhaQyoST
	pmnVEuj3J5OVtGR9T4NvyvI+BkQRiT+ocI/Zc/km5Y1bIrOMKbcoSnhl0QoTJBj0xie5G
X-Gm-Gg: AY/fxX4RSOBFD7h+Ul8bsQlHhT5LokLvmjG4Io2VLIfLx0pzEKCEPV5u/Pcrfzu83sy
	TIFKZteuRpGKgt9pOpffQYEouw0PU8s4VWSxadzdP5fJKJBRptQ680FzX4stfs7scG34ZOE2pgu
	3m5GINWzYWf7o4p1TXL9iYGGiHzwNdS5k1SCb4GgjEKkW/jjrqDh8STLBWhIEMa90KbP+LryKsx
	shHjyHGMjugAv7llVlkPD03/mLu7SA9KmzYkWNgrD+3HHp57c/xNGOD+7PvA8xKaWQyC/K38u3O
	quC52uRmyXA1Xdk5mR9BMBJGHSfKa6/vUr0GeKf0eouY9oiQ+5VAzbNnCwYA+PC7Cu4ShggS8vb
	sWQGkTlUGxGF+68Xlz1FZMSXFdSk8H2IDY9l1nX/T5iJP5cFJVWv5ti2ZUt2sCgvB8opDhdq+yy
	SVHg1w8yFyRscqEp7YhEnTE1k=
X-Received: by 2002:a05:620a:4049:b0:8b2:ec1e:fe30 with SMTP id af79cd13be357-8c6a6768664mr1454263585a.57.1768810643254;
        Mon, 19 Jan 2026 00:17:23 -0800 (PST)
X-Received: by 2002:a05:620a:4049:b0:8b2:ec1e:fe30 with SMTP id af79cd13be357-8c6a6768664mr1454261285a.57.1768810642692;
        Mon, 19 Jan 2026 00:17:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:17:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:17 +0200
Subject: [PATCH v3 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2955;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9rYsLNuEACuzhywI0tRJ339OJWdDN6xkayUa/9Ma/Po=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLLojkLl0l+zM1+h0l2qpcUidmSQV1rw+h9
 D+WwgtfE22JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1cGZCAC0A7tmbVhi9GlkQf5dplKw2Mi34dw/Bqiahw6XorhTYT5UCjmIMBhkwgtvJT7mPbwp875
 gcQKMZmC5tXIHeSNPStlBtQzk9Q2Ty1NkjB+cLjU37G4qdcdVxr6ppbhywf5bQHsDqPdcTicSEY
 uerl5IVtPd0pqryeyTuOTUvqQYo+pllR3oNpC47OayU2ZwtENSE1HVKR5qFAdKn4SzcWy9ty7DZ
 /ksQKWtv6pOGTrE3efVoZfpR6wU2ZbJ9QBO0p2tp4LDJwnVbby7HNZu5gWawdBYHCLR+1xS6UK9
 XPTC1wSjeiO0mIsiV1e4WZvuGqkiCLW3PWl7x9lEIvEXQzxx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696de893 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7FpWx5GjbivZIX0HvvoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GQEuM0-H76Qoe8Mla9nvSNM5fWQuyVPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX41UQAlmbQYuH
 JJXq+1fNsrf9QTk/rkb6NJajn624ft/shm6bS5nUQbASz6IXI7MM9H5/5W4R+aGPmD8Mblf5YK4
 RnmJ/OEFcB5RxEGovjNNKwge9MD2gTrQF3t7m+0xWQXmCkDtM49JBmhP4MnhOYmC9Hie717x3QO
 kT+9ciloMlx7ct9VHcMJSv5prp9y694OYHJdI0KcbxXCcDbJIxYm3WV7SuqlxwYqA9QViGdm4qN
 r40XPZV7uLu6U8czHQijP5ApcNug6QQg/lO+KddoI94rYsvs37v7TbbzJbtktPc9rBgPnPL10rD
 Tarimvpn96Z3u/KN9s6Os273TiMka+Vhn6DP/G3Jg6MBhd30xa83rezNAlZsGl0fKrRT6gl6t2N
 bmETRo8x+t5FJykmkWfFsEfRxK8si/NQbY1cnuJXDexPyufXptUiuTQl7tqwyIKQ8+/klhpUcDy
 kuvr37zEaX2Q8aTAMqA==
X-Proofpoint-GUID: GQEuM0-H76Qoe8Mla9nvSNM5fWQuyVPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067

Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
than 4.0. Replace switch-case with if-else checks, making sure that the
register is initialized on UBWC 5.x (and later) hosts.

Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a99e33230514..80a9fb76b139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+		u32 ctrl_val;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
@@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			hbb << 18);
-		switch (ctx->ubwc->ubwc_enc_version) {
-		case UBWC_1_0:
+
+		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
-					BIT(8) |
-					(hbb << 4));
-			break;
-		case UBWC_2_0:
+			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+				BIT(8) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_3_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(hbb << 4));
-			break;
-		case UBWC_4_0:
-			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
-					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
-			break;
+			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
+			if (MSM_FORMAT_IS_YUV(fmt))
+				ctrl_val = 0;
+			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
+				ctrl_val = BIT(30);
+			else
+				ctrl_val = BIT(30) | BIT(31);
+		} else {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+			ctrl_val = 0;
 		}
+
+		DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
 	}
 
 	opmode |= MDSS_MDP_OP_PE_OVERRIDE;

-- 
2.47.3


