Return-Path: <linux-arm-msm+bounces-107058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJbqHPnrAmrzygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:59:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B529A51D2AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3585E3039475
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAE939EF2D;
	Tue, 12 May 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv25xJyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSAmKC+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8B39D6EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576141; cv=none; b=eXVtSKnCto8GwmegQFgmhIPEsilJHJKKdL4TgcQ6oLskXy6AQMhEfp+O2+EB8kOOCmpvm/6oeswZNs9Vq45u7ecpmlQzDphGdBSV6k0CJP0AMeGmrjPFSIsWcy+0TzU6I+D7K1CPpZ2SREq4md8HyqDx/POYzawEDtlCO0s7hXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576141; c=relaxed/simple;
	bh=9gYfHLZOzyiYGH9KPxb4N5OlEJKgD1lg9nnnmd8L9Go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9Rg+eQR96wWQHaVL+KyzZ66emyeyzRD25Q+2t8Rm4h3juilTzQ4jThwwhQEFp0MV4i4FW8KKyA1yMLg4oG/vCmeaw0z5tYwCp8yAkfsCgGXMyyXOb4yg+bByBLuC9cAaTk5bbAy8aXT8ekZ2Arct7fxcWs1N1ll0NHMCjQyHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv25xJyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSAmKC+A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5IrgE2186527
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4Nff6i9fOJtMY+TCmFBlmFCK9ZgA1aIWnbaBNyHj+8=; b=kv25xJyE6gytY7OT
	nNqf/X6YKxaVCvORxbcOA8nhHQYfP9RVOksALZUE+j+pnN7J++l8zwBB/B2pjgyT
	/vLVqvR35S+bM0qQLfs4gWAFnU+emQ7pcWZWYUYLJEMte7ZBHilBE6MIoMmQEFPg
	O3tSTlZevKqrPMb2xdSVvndEqOkuAqLV7petvAuKXcDJD/FJuo3s6bw8PAQqJfCZ
	3aVWee2caZ7zGqWdB8h9ThFCuOywR3WbTzvvX2PIv+jcx4Kk/q1gI4m6gsKP/mZZ
	+fi14WfpKwKvrx8MRc6APFlqNX6fJr8KojhfzjEa3OtiVbH8+dAYU37g7zWmsfJP
	2JljkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0t913-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so100896815ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576123; x=1779180923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4Nff6i9fOJtMY+TCmFBlmFCK9ZgA1aIWnbaBNyHj+8=;
        b=VSAmKC+AnPj2BgiOx+TyrWpD7VD+jFfl7oLtQLqWZok+/TQ13p6OvFfD2GXMm4Q9DZ
         eQgDAaUtRh/nZsRONN0MfGezMc9ZmKC9FpjZ58otib5t3t4uOgSpfjF0acSHMNuruD3u
         ROJ+N4NUqqdYLn+HsnF+ws0BVv8EO8e0DkWoHnBHIPyk5GINtLhsLB1OCVohgZLh0qUb
         vwqITc12SfCJFkVdUBdvBw2x1XsyONAVF5kYHUktFf5aFW2rCUCP6ekl0/asvn41SeMf
         cA81hDksKXhlsRA16bSRtScJar/fl/YVmhmiPeslwfKv2ztoyHsShgytGLTYx8IXQkmI
         i5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576123; x=1779180923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4Nff6i9fOJtMY+TCmFBlmFCK9ZgA1aIWnbaBNyHj+8=;
        b=HHcEFN630PgyaOpTgx2Xvwtj8xD+Vfa21QuBpf1PfobWvzsRdAMXehPVPVW44EIwyE
         ZK1dL06a9H4Pla84/c1TNa/CZiiUgA5ldNw3E+YmlfyOQtwNnc6NLFNY/BsAbO4i0c9L
         Oa1Wtd8ilJipLhWKqy+mvdx/G0boOPf6TxxmxKTjaGAs74A+Q6d8PDccCvk8KgxZVi0p
         BsgTVPbwLVJAyrvccSFCYWe1w514emBG+xz89fkcNDoA8+Uar3Whv6xDqTvICGoKihdP
         nSRi0rgeDyvdZrxqFm91rXVq2z1ywxGbGhrZDb7rEnBaOv7jtiScxIhLgO5sdAdkjX54
         6ELQ==
X-Forwarded-Encrypted: i=1; AFNElJ9h9PnBCFcJSgfgVjdYV+ASRFaShdQhZaak9m4GMAwvDzFV2Kkaa9G2inOvxjp+BzB1A8CaYxDZMh4MsEfD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/heqsQEYCqqnXZ4jFfrK8w8hZg5ZDtSkpw382ppgbPkvbOwWS
	G2ps7JOusefb+TpJ581N7+7UrLQnUJvk7S4uSXJftI1l0Q5lADak9O+DNA3DgVf1MLaktsAlvE5
	yDbgAEkrm2AVHD9qnMtL2QgKc8vA2S33PqTgjAb0HeWQMjM1GfiZTuhLAdIqT6tfwmg1t
X-Gm-Gg: Acq92OFukNBYMTe2s+jsMwdWjbdtl+80Q/TMp+f8cxI3gJLAdsJfp1F6dFoATvR6tcK
	6lJn5qyT6Kd2ggwZwliOnIndNbnJGe25BeY7TFwGTjdK1YwKJu1UYGdtiukZIEMTRteXZxj8UQk
	TzMQfqZvFgA/De8X8+hXJjhCsmZHq1UuzSo26e8vQv2f4c2lLh82GpgxYkXok3wGmVd6bO/jINi
	x9FXXj0gr+JcmL5/qZpMeHL+KzSogPLpQpItVfw89KLF0kzFw11a+mWAvWXCIekrJJdfrhMQbCN
	hokXbIuOdDgmNXprjiTThaFU1FlcR/YQYRDWRL9aiHstaAzXuRVQgLZomZTzWVLVht8Kc8IQoha
	xP90tnvf8d6tZZqTt9LUgBr3E5X8DDahbzTWTDnVrcRqQ0MYF1YfA25osG4BaOEWiW/YFcZCU6A
	8kh1Q33ZSGtuJ+JziWweiu
X-Received: by 2002:a17:902:da90:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2bc7a9a3787mr148881855ad.13.1778576123155;
        Tue, 12 May 2026 01:55:23 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2bc7a9a3787mr148881445ad.13.1778576122505;
        Tue, 12 May 2026 01:55:22 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:21 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:10 +0800
Subject: [PATCH v7 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-1-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=7834;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=9gYfHLZOzyiYGH9KPxb4N5OlEJKgD1lg9nnnmd8L9Go=;
 b=YiaKkVaS7dNvC+H3SifVvTe1BjRhO6yEoN2kRrG1czAJZCxP9gwtZylYLwHGNV+EnEOwPoQQp
 wFY666EqVlWCaKDTrrWgkwXZoPmZPc9+6wuFfjkxeKeSeitu1IDvL9T
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX4VxabYnJs/t1
 FI7gVwWLPXEd38hmeb/y87pB9W1lWhf9mmm/T84HIhwLbAYaMO3+2Lmsh7+vqL6vtEDAcDEHQeQ
 PQNb8j2i3mgYKr4TKWptVTys+r1uhZiSDsgEMNvpyr84KG715u4igZMETz/VcQqoYfIrc45XolQ
 +4Rp4DuiGeZer6kPugua7otHahfslhLjd8PI7oFlmamu0hNkebLYCOvsFTfyZv8f8FVPCYys4kC
 OBCxr/DD+m62mDF7Kq5CHM2KEufNQk/T7cLnsyQgc2ymTQ3YEE2PuJGuNZZ9gfckFWkYFcY2T57
 iDzzNgci4UmRFC9ZMtygZvpQjifewEA8FCPTdgfDAARdFWiBPTj10jzJXi/lmPgeOmt6rZ8Hlv3
 GI2oCZzdo+hDPxsE5lqP0ocTGpaCI1qh8yndesiaHTECAZDLV1tfQrnOgd0q8bf7cs+KdYWkJAP
 LR8scTRG8fgtG81+q6g==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02eafc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=vcDqveFK9my7lXZq-ZEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iKV89YlB4b1HdjXWay-61oXtnZtGfCpY
X-Proofpoint-ORIG-GUID: iKV89YlB4b1HdjXWay-61oXtnZtGfCpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
X-Rspamd-Queue-Id: B529A51D2AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107058-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for intra refresh configuration on gen1 encoder by enabling
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 19 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  2 +-
 6 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d71cceeea929778f7eb4f83531858..287cfc53294169cf5b75375105abc3c8c2d2a551 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -970,7 +970,44 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
+	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_refresh hfi_val;
+
+	if (!ir_period)
+		return -EINVAL;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		hfi_val.mode = HFI_INTRA_REFRESH_RANDOM;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		hfi_val.mode = HFI_INTRA_REFRESH_CYCLIC;
+	} else {
+		return -EINVAL;
+	}
+
+	/*
+	 * Calculate the number of macroblocks in a frame,
+	 * then determine how many macroblocks need to be
+	 * refreshed within one ir_period.
+	 */
+	hfi_val.mbs = (fmt->width / codec_align) * (fmt->height / codec_align);
+	hfi_val.mbs /= ir_period;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_val, sizeof(hfi_val));
+}
+
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9518803577bc39f5c1339a49878dd0c3e8f510ad..a0d5338bdc910bd30407132e8b700c333ad74e4c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,7 +34,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 60f51a1ba9412d5c0a34b8b911ba53c69b236b10..9344d20042fd4dd5ed123463a93188f36efbd137 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -224,6 +224,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_qp_range,
 	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = ((4096 * 2304) >> 8),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ir_period_gen1,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 83373862655f7b78b8b698117a7d2fee00b6405e..051ba0d157c77263ea57b15296c86f61629621de 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -687,6 +687,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
+		struct hfi_intra_refresh *in = pdata, *intra_refresh = prop_data;
+
+		intra_refresh->mode = in->mode;
+		intra_refresh->mbs = in->mbs;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9b9eb5f793c3be127acd8afad2138..04c79ee0463d7f32a2042044fe4564718cc01561 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -139,6 +139,14 @@
 #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
 #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
 #define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
+
+#define HFI_INTRA_REFRESH_NONE			0x1
+#define HFI_INTRA_REFRESH_CYCLIC		0x2
+#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
+#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4
+#define HFI_INTRA_REFRESH_RANDOM		0x5
+
+#define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -447,6 +455,11 @@ struct hfi_framerate {
 	u32 framerate;
 };
 
+struct hfi_intra_refresh {
+	u32 mode;
+	u32 mbs;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index ce8490d64854c6a3150f6baa3f1958150030de07..401519fef0e2e87152e3c7fd7080490e9659d60d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -713,7 +713,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_ir_period,
+		.set = iris_set_ir_period_gen2,
 	},
 };
 

-- 
2.43.0


