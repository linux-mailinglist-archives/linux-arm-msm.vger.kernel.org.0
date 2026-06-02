Return-Path: <linux-arm-msm+bounces-110783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP7MBzyhHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633F62B67E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDF1931064B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBCD3D16EC;
	Tue,  2 Jun 2026 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlnGAwf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIjsS9G4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639E3D5673
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391523; cv=none; b=SoxwVllf5gKUPCnvDIimp+3lMhWvv6sQKzu0cuyEFV3QhZZGrtFBaT+2m4+U2uOjLSzx/ksEAE7sjBvEspoqtegz8hI+KVZirx5eNjJoXbw430ifU92Wmkd0QxJuUylSN0APe/u4FGL1nz0OOMluLZ8wmdfKtDvVW1KfebQXbn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391523; c=relaxed/simple;
	bh=zSnGi0bbdZ/VVEDgF7ym6Btkt+/Uv5gTh8caBZqhP6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2RXNynP7tpVNuU7KAY0rBUKSnIOOuSdNGZa+Y7RBO1awjkvXT1F4MuJw35ILpG9PxUIkwgzhD5FmQIFjD+13fX1XE8S0V4sIAKOvbQEQzJzuAVTK4C1icr9LSkAqYy8DOsSdd/5siR22MboKRnd7rciY2ea0cJEsY4zE2/W4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlnGAwf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIjsS9G4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527qY2g3133264
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lGiqHAGb2wqxVw+z1FvZ2fyaog25rtaM9glu7hrHjmw=; b=QlnGAwf3uxb+yD4c
	tPdSciT9tBVT7mcxDTq5WyxFz9IYG/sSEfSuD+0jAstHKTUYhgtvDKN72Pc++q0w
	F7Pe/dy5BFwv6aYlgM/tkGIJ9/OesnjcEzPXMfgLfyLJW8FuPZXk+mgwMXZDXb/q
	KrEWpVbxVRayQSseTLwvjuGtMb9j2G8VqUT7NR6SKO5jaGkhc2kVYJegOMWQGifP
	GRWW7/04R5ZMTUmEvXWmTHHpyQE/NFI49THr/HgKAbZo/W3tQrmrT3/mLrdppNqW
	wzys3VpR0EHw7IGz2ZYaKyqtG3+Ib826z3sZk8jDCyUkbXBfvHPaLbEqDPBBOlqi
	i0GUaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu5wrayt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176d5d7222so6961731cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391521; x=1780996321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGiqHAGb2wqxVw+z1FvZ2fyaog25rtaM9glu7hrHjmw=;
        b=GIjsS9G4TCTJ6pfIeiZYm+n1URdLKHDjlWq2xG036kSdZVINWWv/bR8QZFnJEX9jfE
         hUB5GjyGM8bQIJT8HVuQX+iJqnVizFIfxGbyNBNGSdXDoSPu3p021ZDcPrjrizsu7Vpn
         Gn6WPpbSoBpEqzUkKvfloXGkwkU7G+TYAc2sTr9qEzlR8QWHZSgLbB4/4m4GsPm15sMF
         0h9jGAhQChh0Al7yGB3mngsRoNrehvA6qN4HWbLboWBti82AiwTHXHL3KQqtBhooYgqc
         GAxe+p3BRNBTJ7qtzse2I/MePKqllzBHawA0tRAKL9cwZQ4Nl5+EEw5udtjzY7gqMFOL
         9P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391521; x=1780996321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lGiqHAGb2wqxVw+z1FvZ2fyaog25rtaM9glu7hrHjmw=;
        b=bJyPMTu0aTpiW8Lo2k0K01DbNAmPMbj9jDXGebKk1m7M8a/+P0a6Y5j/3eLOXVQGca
         XcxIZxV+uHZfPfppJDwIQlgE4ltjDp5okgmWlDy6O8TZhOhXHyht1bQLRfbkQ1y0dV5/
         H0VWL9MvbmAPGsKFeustRkKjxiSblzAQJ0/m2Hqn6+2bpyYSg82M53EWSJ+5H84JWPMn
         oPuJkOOthQLu7OrEWws//FdqnJheWggM5mp06kSYOeSb3Pvs14ZqzLtaYWBPk2xsMzAm
         Dh5LKMq3GARwdAD65HST2qTBglDu7+XvEi14EmGBJ2n2YWVzdA9tLxLIEl2bm8Z0Yx6q
         qdNQ==
X-Gm-Message-State: AOJu0YyhC8HmBMlx/u6663ItFTPNBSvojcnJAbUYnr+uRiZ7vlKNi1Xh
	jw7WtPbaodolbIyLbCqmtW++A7t4AMgv0oQe16U9Ztees2Kpnnm6dhnB7hiidoAxxj2K0ilPHee
	gVXCEk0xUcextjKRt0QWbjfAyZPPfwO8K4KMZFrbw5bnyjiR7gjBMhv5xGA/1KtmQmzTM
X-Gm-Gg: Acq92OHIMYuUbPuJFGWhoWmj+ySco4qKTvpvmgbk2nf9sob8zIYKiSEc6g3KGFyGf4T
	vb1lvlhqoEwnijQyT3y57I7a1hLy6ICjvicY8I8/JVl++FVFCYsoh5Rjhmv8wsizPpH2g+/+1ki
	3gYPGmX2/oGiKSHzrcvRnAe9WMlJoNQIJG/CoUce7Pc2zvtDY2wNUlkzySsmnlvw+MbDEQ+HQk/
	3B08si3auQRbbM8HvAxNWtn5wR3Kdw0fWh9qwfXbWk3Xk9i82vOgFyizKnB1owepnPGBq1Cg01G
	WYakK60ifVnOF8PjlCbQn2hDy4ebxz4Q7cTZtcy0XygP7YrZQ+JlaHQKV+2S48p2QwrdT0D22qG
	kHAiqDQlEMawMw/GrIcLE/w76kFa1fu3jXPfmyJNy0BTg588e1stI4RwzQiPrA9RdNQlNT2m9Vl
	LKEMcBrvMpYFfOTub9TA==
X-Received: by 2002:ac8:7d8a:0:b0:517:5f04:f249 with SMTP id d75a77b69052e-5175f04f4camr73862331cf.39.1780391520484;
        Tue, 02 Jun 2026 02:12:00 -0700 (PDT)
X-Received: by 2002:ac8:7d8a:0:b0:517:5f04:f249 with SMTP id d75a77b69052e-5175f04f4camr73861961cf.39.1780391519896;
        Tue, 02 Jun 2026 02:11:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:59 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:20 +0800
Subject: [PATCH v6 08/15] drm/msm/dp: break up dp_display_enable into two
 parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-8-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=10300;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=pS/y0SrXTUOv0Ui2vWFTX1frKGlvknXRwKnhZSdJ1dc=;
 b=nNNdk9vAl2rLvgitc8pIMpxCZM+1qjxYucU+cu5Y7OWkclDZ/6mb6ksXeipvwejGlfOvTGMgB
 wQeyDCrVbrfAoedqEeq6D5QcBvAuL4+8T9JfD5LicUEMroNe2/XkqvJ
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: cK22YGYepZglYscJXrWTq9OWiLwD41_Z
X-Proofpoint-ORIG-GUID: cK22YGYepZglYscJXrWTq9OWiLwD41_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX+J5juLiUfPkj
 6SbjxmUTfUO+sgKHLZdQ2tNLkPn2Bwlx6hAU7ZTmfNydFGEETYKtH5fQRPl+maBtw+Wchpw58m5
 fpNKF73NOSO9cUSjU0O0e8DglQFJaMMeVMUb754yYcVXdjbREnjj+R1K4gCNsvnLozmIHk6MVtH
 qQ8kPo0ap8VK1959CpE3SkpT54zfodJ8BjoKuL0UXYW3rnt9BpEy4aD/waO3SaE2Ur52Px80AaM
 qNx7UUuNI/RAHLp+odLeweu2md9oKY8B3i4b9IyRNxg6UUrbsCGHhbH1FPYmOuyK2vGXxD2d/nJ
 ye5Zb4A9hchFNb/Xf6zvQqdjCdmP7gPHjzRBIjAQh5lJH+1l1yXc6oDD0Hy6EUC1YSTuZrXNBZI
 7IlDDd50LH8XtM0kC0t97YexZluDEGnEMAtjGlpSLRGX23v/oN9vI6F53CoJWvAGyD9cxAAeka/
 m3iE2uVWpndFs2ZlL/g==
X-Authority-Analysis: v=2.4 cv=M/R97Sws c=1 sm=1 tr=0 ts=6a1e9e61 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yY1IV_0HXbUsaRqM5MUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 8633F62B67E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110783-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_enable() currently re-trains the link if needed and then
enables the pixel clock, programs the controller to start sending the
pixel stream. Split these two parts into prepare/enable APIs, to support
MST bridges_enable insert the MST payloads funcs between enable
stream_clks and program register.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  48 +++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 105 +++++++++++++++++++++++-------------
 3 files changed, 102 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ac0a2c387f03..002141a02073 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2505,27 +2505,19 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
-	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
-	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
-
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		pixel_rate >>= 1;
-
-	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
-		ctrl->link->link_params.rate,
-		ctrl->link->link_params.num_lanes, pixel_rate);
+	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
+		   ctrl->link->link_params.rate,
+		   ctrl->link->link_params.num_lanes);
 
 	drm_dbg_dp(ctrl->drm_dev,
 		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
@@ -2539,16 +2531,40 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		}
 	}
 
-	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
-	if (ret)
-		return ret;
-
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl);
 
 	/* stop txing train pattern to end link training */
 	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
+	return ret;
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	int ret = 0;
+	bool mainlink_ready = false;
+	struct msm_dp_ctrl_private *ctrl;
+	unsigned long pixel_rate;
+	unsigned long pixel_rate_orig;
+
+	if (!msm_dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = pixel_rate_orig;
+
+	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+		pixel_rate >>= 1;
+
+	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
+
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set up transfer unit values and set controller state to send
 	 * video.
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f68bee62713f..1497f1a8fc2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f33c754b83c3..cf859f880943 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -617,7 +617,40 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 	return 0;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
+static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	int rc = 0;
+	bool force_link_train = false;
+
+	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
+
+	if (msm_dp_display->is_edp)
+		msm_dp_hpd_plug_handle(dp);
+
+	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
+	if (rc) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		return rc;
+	}
+
+	if (dp->link->sink_count == 0)
+		return rc;
+
+	if (!msm_dp_display->power_on) {
+		msm_dp_display_host_phy_init(dp);
+		force_link_train = true;
+	}
+
+	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	if (rc)
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+	// TODO: schedule drm_connector_set_link_status_property()
+
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+}
+
+static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -628,7 +661,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -658,13 +691,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	return 0;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	/* wait only if audio was enabled */
 	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
@@ -675,6 +705,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	}
 
 	msm_dp_display->audio_enabled = false;
+}
+
+static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	if (!msm_dp_display->power_on)
+		return 0;
 
 	if (dp->link->sink_count == 0) {
 		/*
@@ -1371,14 +1409,13 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_commit *state)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	int rc = 0;
-	struct msm_dp_display_private *msm_dp_display;
-	bool force_link_train = false;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(state,
 						   drm_bridge->encoder);
@@ -1386,44 +1423,29 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display);
-
-	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
-		DRM_ERROR("failed to pm_runtime_resume\n");
-		return;
-	}
-
-	if (msm_dp_display->link->sink_count == 0)
-		return;
-
-	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
+	rc = msm_dp_display_set_mode(msm_dp_display, &crtc_state->adjusted_mode, dp->panel);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
 		return;
 	}
 
-	if (!dp->power_on) {
-		msm_dp_display_host_phy_init(msm_dp_display);
-		force_link_train = true;
-	}
-
-	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	rc = msm_dp_display_prepare_link(dp);
 	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
 		return;
 	}
 
-	msm_dp_display_enable(msm_dp_display, force_link_train);
+	rc = msm_dp_display_enable(dp);
+	if (rc)
+		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(dp);
+	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(msm_dp_display);
+		msm_dp_display_disable(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -1438,6 +1460,15 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }
 
+static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
+}
+
 void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				       struct drm_atomic_commit *state)
 {
@@ -1450,11 +1481,11 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (dp->is_edp)
 		msm_dp_hpd_unplug_handle(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
+	msm_dp_display_disable(msm_dp_display);
 
-	pm_runtime_put_sync(&dp->pdev->dev);
+	msm_dp_display_unprepare(msm_dp_display);
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)

-- 
2.43.0


