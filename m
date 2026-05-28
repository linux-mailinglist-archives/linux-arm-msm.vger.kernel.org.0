Return-Path: <linux-arm-msm+bounces-110092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDbtJSwdGGocdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:47:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7705F0D97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77A393134E72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC6A3BED23;
	Thu, 28 May 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF9RTp/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaasbFqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F83AD52A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964865; cv=none; b=KBxMhNg96/jMdsqVisFznIJSRflgi6LmHITlGni/EMqPZXbgHsnupkeLPQHJEDH7Jyp+NZJaPdryBDFGQb7GHxIIBITpGdhN3DwIXgZ31/DbaQdv2MnLyVy6AS9JEf15ux/Xli6YY0s0LfaKuLVcf1QQbl+L1OPhzQKmWSNVxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964865; c=relaxed/simple;
	bh=cG/LGNCcQTa4kjEHUBEM5XHcqi1wHebQYuwINqyWaz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVNuMJqJhNEUMH93ZwZDTrFS4ouNb7f6ATxPvLabr+OcwEeATG/kthuf09BkQ3cZoLecTGvjG0jYdI/UiQGJaa/uuXVZgsiV1o4ZtRBjT94XA05UpULkoyQE3XDIyez4c5Lord572qUMTkuH5VZcO3wdrrEKT5bbdq/3ezPyZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF9RTp/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaasbFqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUJW3203245
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj1ey6ImyO3i3vMmCJMMvm8iJ4e0EDN26FxKqAvXcRQ=; b=HF9RTp/f3RpbIIrd
	qA5SVCJLvnyO7HAkP482gjg3dQ7aI2zSSPkdMZue/JcU18fbEH580OX/qnJv07Ra
	dBDX9VaFIamvhapWHMtC3BQARp6L3gksyTpoxTAOOyVgrUJc6Fw/IytAqvIx4YoM
	fcevawvjX84omOfMXZtuE3Wv5M8hveo93nMXk5Z2upzz72UXIdr3aZBVW9LyJdR5
	H0u+qQRCHvCdH71Z0r3X9MGcrOY2P8WthJTq66FrYFLJsMJEUYbbczF+9SAHSZGB
	TnNmkxv83D5BOAEszC+fDkN4s7Z7joU9OPQ22adHS6M2Zg48S0qC4enNbM2deLVQ
	5DdTtw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynje3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914bd251f5cso632969685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964860; x=1780569660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lj1ey6ImyO3i3vMmCJMMvm8iJ4e0EDN26FxKqAvXcRQ=;
        b=gaasbFqxMm4zK91AVtNjLDyi6abGnjnCPknBuMDwI1XeX9B4gRriydTB63oBxSURzH
         JX6XufwlDD4xZSXvG7scSzUSStVfBtKGuJkmqEclKVO8IKOn0cUjYhS7jyn8yEZlXECq
         8XyMIcLNpvnOyVYmT7StMikEK6qSkAyqfqSOViDZwPn/Vypb9vmQgYHCmJ4j7mMx/1ft
         MHJ0HckanPaHvkH8N0lRfuoRPdHytfbEFRrw8XNqS3Eqq4N8CONKpPvYSogB5IgtmLrC
         YgNJ0l7xG0gxCo56KWblsQElgHnyfQtT+hjPJTd4mCTKPMgqFqpOCcOrSNdYPcLrSo7O
         UDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964860; x=1780569660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lj1ey6ImyO3i3vMmCJMMvm8iJ4e0EDN26FxKqAvXcRQ=;
        b=UCgEKjwRcEOd3n+aK0KZbM5wmyWJdYBmaP6MYsvnUqb0S4htFOO3l8zDeelF6LDqCW
         Sh2aNE57URXJ27gxmJkh8zlW/0dVHN29M6FVAe4JGBWHpQgjDPAMwpk/Qf/6RNClPwsG
         bxPYsu7a35YKRGoUbnC/eROTQqLsqlx7PsO+LDZzARS4oQSwL94Y91XW+5FZBpfH2pOv
         E6u5n0IRZLxQ+YpAiBw7qU9izaDo5VwaaXwjWo4Boe/ekJCJYcrjdk9WswzmYaISa7Uw
         czPM38IwYur1zNO7eG8tKvM0k5sEFCVnNK2Dy1CzalIpdM6wjdS+gCNxsUk6fQhuzZar
         HxKg==
X-Gm-Message-State: AOJu0Yx+R5fOYSenmZ4ivweGvN4ZtCxU4D+jGbnamBw+Cjzxr+JTIWkk
	e3TPJcicsEmglDuSnVMQ0xXNBVY/KXcMhaF1iFzlmmpIgbPPjAEZWNQoDjWqFwBywB9GdjRKyPb
	sxhI/rtx0qi7VhO9wFTY2SVTS4mfetYAtgw0qIVMg0RJuo4N7OaU+ANQP1p3FvmbjUF6v
X-Gm-Gg: Acq92OHsjwyA5zPQJa72eAPlnOMgkIt9UeP6x3UnW4Qy2QOMM8my7xSMaT0dJf24H8f
	SaQXnBbmHWafi+c2AanL1CIggo0uwOCGodVvNVHP6DQiGilN4yTvDZcbkjaghsMxVG6UHazg017
	Hy98OYFoddf63KaqD4CrgMGN6/IvtfExcL5aSSHuonZELzVBB3CZY+rkeb3aT1DohGke3OpDdTO
	uW6IgQYErjDm6sYuey8nU0MDUEQQSQG3FseIR+JMGtRVvHtTeOOV+mXcXLA5ezbfuAJkI1mJLbS
	bQMrVWk9QcQdJx1WPuBWOQF+eswcZ6KUitTfj/LZgjhEBlCvKbgAq3T+Plw+412kbsvYgJpuhIL
	M8HVnmdzeDhwVWxqBQj1slFxQ+OOEHuTSXFV2myBCGNkmsSae+b55AuOpoxMnRmwaSjNQBjtPYU
	0qNNPTzbJ3p9sk4/Pu/A==
X-Received: by 2002:a05:620a:1995:b0:915:f9d:5c30 with SMTP id af79cd13be357-9150f9d5ec2mr741388485a.58.1779964859956;
        Thu, 28 May 2026 03:40:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1995:b0:915:f9d:5c30 with SMTP id af79cd13be357-9150f9d5ec2mr741384585a.58.1779964859468;
        Thu, 28 May 2026 03:40:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:40:59 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:26 +0800
Subject: [PATCH v5 05/15] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-5-a9221c1f1f3b@oss.qualcomm.com>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
In-Reply-To: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=2097;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=cG/LGNCcQTa4kjEHUBEM5XHcqi1wHebQYuwINqyWaz4=;
 b=1MPEuzi7QI8Owj0RNyKbbmcyjAce09Crte4j3X2MKDzzDN0sL29ULlXfzr41meYxeD4Fh8RNM
 dibPlaMG0jOCNpG53r4TT3zajMzZxZrARUj+ezY31VJW91Lsehf7N2a
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwNiBTYWx0ZWRfX+y6wXWwd1nn1
 APt2oStnbPb1hVfPLT17u4HJwe9gb7kA4mIG9QeMvmiKIOeIdnljOJ9G+GHc4FB/HYHWBEVyzkM
 yaGz6LPZ0mGEy65pj7tedIawxXc0iEK8asNTbDNsKS1hLfq7Lo4U4iMsrEGrhIgx63Uu8HTGxj0
 vCQJGWFdoHtwITgTpPupzgOKs+TPSDZXHPzDtjzBlpcwTBet3wgXO4vHKEVS/Vxktr/2Ss1+xTp
 OUM4xARy7tz8j78r2NqdpdRaQxKkyy2ziH0xkB7HrDGjeZ7qYu15Xrp/sQTz44XflNhsF1Xs94e
 65buVaK6nhCW9gY/qw8EhtlfQvcmrLtjyrhn6M++jF47ehFPgCz+35rvZ8msYL2tkvlbNe/8Ieg
 U6GGYlKhBPxrODvCl6zLc4UgY+t6lX0s1j/2uoVX5pUoBGmi0tABXcURhZHoG8zgMFZs5WPax3v
 PWIctxYqbQdwuwp1hKA==
X-Proofpoint-ORIG-GUID: RnOnKeqtk2-TaaBu1wziaQlMCQAu-Fod
X-Proofpoint-GUID: RnOnKeqtk2-TaaBu1wziaQlMCQAu-Fod
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a181bbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TC1OlXllJ9dbkp4NpB8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF7705F0D97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor the MISC1_MISC0 register configuration into a standalone helper
function to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cc00e8d2d6c7..d4f48669541a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -459,17 +459,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 			ln_mapping);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
+					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
-
-	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
+							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -483,6 +479,17 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+}
+
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+
+	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
 
 	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }

-- 
2.43.0


