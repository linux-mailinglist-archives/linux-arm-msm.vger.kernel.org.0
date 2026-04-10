Return-Path: <linux-arm-msm+bounces-102646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPwNIkfG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF753D51C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04A9A306D1F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA403B7747;
	Fri, 10 Apr 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GM2YCgar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+jScBsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7173B7742
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813752; cv=none; b=VnEkSr+jIBclhiljTIrSyb9AA2UeSq2no6Mo7hpVV3bb2K706fvRSDaogxOwHhqOCX/iqNPNFm6O5xjUVhem0I+/vSH/9pjqVaERqj26TqJCl/Bzv93VdmQB+jvJatcNR6LPoF/jazsDKnv9OnUkhTHN52fXUpyZpCtGuBYHcsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813752; c=relaxed/simple;
	bh=GUYoXXSUJGZAisDNRvNTNhpBULhZWzNCofjK/SZUO3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW5s44ugqU0S2gzPUkTxvnCKMjl1hOyuhAOkeCBXHRttPT5MOI5rVhsS0MgKWavg5AaPeF60Jx6Lqo8CmwbzK7yVhT7znDC9PXf8HKROb139HclQqjkQVONP1ghb7gVWzvfRU0CAGtfGs5jWc94n3gN4VIw2j5IzjpkMO1Yh+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GM2YCgar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+jScBsQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5o2p94147286
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGnq7H3ZXeojJXkq+UiBQOn2BjOfnFsA8n9NKPoeBF8=; b=GM2YCgar0QsWez8M
	Upcgvokco5I3No8cGX3y5TgbCraiv6whSIBaWKCtsAhPmdSYvcCyoBA+qqBK+EUV
	ENoyxltVRlPcdYmoe1o3pouJftS5mfQuWMC5LYLedqsYaxbZrSsBBmhuXz5uIzJa
	/5Gu9lJ/wLypik1J25yKF2611DfFiW0ISrMVD4D/vKBk2tcMXR2vVvuEfTyH9Am2
	/N5xfujlESU25FQQGsGcA94tjo2VcZM4tXlh4EdWYZaugLDVThVXY0xsYjspoY5O
	tBulea6IVro0q9BnZNtG4Ds2aZLwAji6mL52IIukh1Zu6D84eRlCwZDrD7wcNiiV
	CRr+kA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggsq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so50314696d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813749; x=1776418549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGnq7H3ZXeojJXkq+UiBQOn2BjOfnFsA8n9NKPoeBF8=;
        b=B+jScBsQDahU2pJsQHHzoy0RqdXGgQVs1vUGTE4zeZHoR+yqFBBKpwe+CpLy4layrP
         Ppoa3ojICEQejSLjDTTAWWxueP0Oq+Asd54p81y5RWNAGsQBnR+vEimM5joQJ2EcZ87z
         EsrsrZYF6epq2XWM6GmNbBHVXlSfDZFOVQJocuMKFIf8+AEcsEwpUvIZMC77YzkKpTwy
         oElBwjYIvVG6Tf+dA5kCyQ8g6b4TxU7NUUcAXRB2YfVhyENt+AuUZjjR+b6xB7iY8FNS
         sUR5hiGCgswlQo3inQtlgeNm8QmKwUYd5iW8z9dE5Fflo9WdObryLlbqVxSAzDg7j+yK
         5Frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813749; x=1776418549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGnq7H3ZXeojJXkq+UiBQOn2BjOfnFsA8n9NKPoeBF8=;
        b=snAfeN5GsLoGF7sK87XxPBZSUkagDsuum0iK5vrn78LAZ6V34xjo51rnRIPbPqBOdw
         zsid3C/NEVVJ4LoWdFV2fT9SCi0erkdXKGbyAgPvYF7uwi2Jr51UDe1x7wSIa76/ROEF
         fx5C36TbJ0nPvmQPInD9i3yzG8p6OSd75JGn0ihU1GFCdjdOPAeIP5IIPA0ArubYd/CK
         HxorxkeoxQBk1FgB8BN22ALn2MxOmW1lPmJKAonVt7EaogbDfeEiAvJa1xidXZbcByAV
         3pvH/4L8UpZn5TwEx+laBa159OrqusiQ8xNT0V2HTpxSoUtWPR9S6gJozeTF8g63YFxu
         MNbQ==
X-Gm-Message-State: AOJu0YwzzLH1AZ3fOi79PAD+n/yH1KYjQRc69Hv1u8GAGlz2YMjVwhLq
	wGBxjo/kCfgElVCmu4v3j2NTgNE7kGpdjW7/7HSNwNv57LpCehSqA3ZBvjxOf6e/LqWnfqI+edg
	8WhWASBqachyQDWnN1jCne+WRgCCLHrhhrdkA1KJPxXp29Ynl+/lXVEDyA1GUnT/RS3980Xr1ig
	VGKoD9Ow==
X-Gm-Gg: AeBDievPJft4voYBzmGCKx5+/+06dsMark4vK3HucQzj8jiX09XL3mwF9AvP9AgH+h+
	grmSQ8puWI4yIUmqg4QeeMARByA5kPtSr8m8vWOw0MU+fmy1mEhzjsAJBURDk93V5ACCAsCt6tN
	fCiM+EFx9lP9TMUjyIcaOxiJRGueqkZqBOnHsSuF4qhh1pUJ0pCBAHr2BbGA3NsUX+fWuYTFCfI
	M4FWJDxkO0Y5n8x569KF2ChFIlODDKRcQuwngz5w3p1g1vAKuErp0upmpIy4r5RTxayooPJcR74
	9Lh6lzooo404ZF570sJIOJZb3vyCWjxQqyPxd05arDRcfpK3dcy2zK7iFcnmjEy7Tpst4aAZY4A
	vNH/jv35pExxa31WQdnm7cxmO2AX9GjvxbiTr3PuK4G+ju/UPd39CgJHsZXC3uVUPRYG1j0xwYe
	VJB1WId7U=
X-Received: by 2002:a05:6214:3a89:b0:89a:c64:c97 with SMTP id 6a1803df08f44-8ac86285d9fmr32057156d6.36.1775813749205;
        Fri, 10 Apr 2026 02:35:49 -0700 (PDT)
X-Received: by 2002:a05:6214:3a89:b0:89a:c64:c97 with SMTP id 6a1803df08f44-8ac86285d9fmr32056926d6.36.1775813748796;
        Fri, 10 Apr 2026 02:35:48 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:58 +0800
Subject: [PATCH v4 23/39] drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL
 for MST use cases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-23-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2580;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=jH0cVfAtP120hSC87AlhdrymlK41cuTeQOw2p6hhzug=;
 b=TtbOcGnnVswOiKEFrkl2fRDSQNtLGseH0eo6Qi9FfVVeScNHdeQbh+Kebi1069Ykexg/gfjI4
 uQhj74dlbysB7fpOEiHFemwt11gXJQVSUyJkUHRGbh0HTUo+lbJWssh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: G_u9wZ4gzU5DomnKa6RK4rLB5s9o8R-M
X-Proofpoint-GUID: G_u9wZ4gzU5DomnKa6RK4rLB5s9o8R-M
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8c476 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HaeL3RsyjvW3zFWBFcMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX2QqClGSaHZCs
 F7zw1dJ1OqS1EaRjl79eH3u2Zr4ev2ejckSkriNfQpzoVnqSzxUF59ICOb4CRlL1M+sCmmLErqT
 h4XNQfdoUBRQlBOa2l9+8dD608wErZYhZVSX1N0CuFGBG2Jk2gtzY6OPJOz9bw4lG+eELMAthHT
 WoOwccwhuGtSKEj5V7U93+Wr2r2OC3ZMWIBkq44c9LO+8IwO3T8KH63qsWEHnaRfO9F+Y6tyIHG
 s2e7ekJN3bC6nnJLvP6IyTcTp8btx+F159YCAplhGqkU+JA8BrGuZ3F2BZQnfb7Hfa6mZeXsft6
 zJ/TWATVLbmqXozqm+NfcTvL0fQ1NmyW0VhXu6Ojv1383CQoOepa2jKOTcm0FXxH/oWEkgJjQxQ
 byDWt9dp0YtJocGfultN+NPo2leG934d/5nj9ggG8hB+Q9zGRr77walBtFiQfIzJHCBIoPLBlMS
 ia1hZdpXViyyIS05/1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CF753D51C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. This patch ensures
the register is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9907f2e56e65..199c2806aaa2 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -685,6 +685,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
 	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(msm_dp_panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index a8a6297b37e3..e05d96f33c43 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -753,6 +753,18 @@ void msm_dp_panel_set_pixel_base(struct msm_dp_panel *msm_dp_panel, void __iomem
 	panel->pixel_base = pixel_base;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_display_mode *drm_mode;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 8e7374de90eb..8bab27520439 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -72,6 +72,8 @@ void msm_dp_panel_set_pixel_base(struct msm_dp_panel *msm_dp_panel, void __iomem
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @bw_code: link rate requested by the sink

-- 
2.43.0


