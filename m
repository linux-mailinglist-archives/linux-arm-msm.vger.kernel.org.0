Return-Path: <linux-arm-msm+bounces-110780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGuuK92iHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:31:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC062B990
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 969BB3146491
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A53D3CF973;
	Tue,  2 Jun 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUufF27A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="inWsgx1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75833D45D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391507; cv=none; b=fSAtkf3B5W3RXi9lW5cks+jaYo5NFt68ei9BZwRlQ3u6C2XkAFpx1TQFMNlDOgoVcwJjBmVPLu7oydvdwdvxFbJ1h7FNSlThQRJAEeAPdEu7Ri4ksq2BmCkpUiBeFcf7d+vdAG7s87wVJVAaX8bNY5S15GpwXudvGDW7db3+4MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391507; c=relaxed/simple;
	bh=k2Fff3upCougTurRhx1qk32jaQDI5eLSE+rUossKmgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h4EyDk+HPqNoUZKum1ihwneZhw9k9FU9PEEJHpuWDjOqLFxefCz2bsvkeQIm6l41UDH5kZeP0WCHsZ5yrezxHS/iXg6UtxactniG6A+JLqajFkZVpf5THVthGvSm0owtIhiUnSoyYmN6IVHL2SZjz6wn/18KVqwGkho1j7GKtXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUufF27A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=inWsgx1V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526MVUc2767171
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w64aJR4GsiijIIC+qw1V7Ljp4DhfTK7YqGC8ys2CQuk=; b=JUufF27AjkSwlUqw
	Insnk7c+Z+YHrWCvAUts5brdKPfLi7qWo9keD74aDxhLFgg7sOpsIO+qKHt5WYhd
	5J2P4W2IJpiR98MjtgazuuHkCCoY8dg9p5y8Rfq/Qye6D1H1OzO8JJKOloRAI9wO
	rvaCZnnGLtV+8wOJm5sksgEmMeZz1B4B7pbU04cCLGKv1CbPcSFugsUcylk+u603
	4TwhqbUQooCWlT2zH8iC/6Of6dpWIVLGx57+uwQEBkl7bBPlRW7LYZN5q8WCerlm
	VCMDqh7IVNrO7Wq2RHklDgIzGwBKzZ+r+gMl8akkwX8aEAd/QPltqaOxfIkygtk7
	Rwnk3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0pqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d8b6e4dfso157310881cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391505; x=1780996305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w64aJR4GsiijIIC+qw1V7Ljp4DhfTK7YqGC8ys2CQuk=;
        b=inWsgx1VHk2ZAHZ+x9EhHUD65EDzcRHsi6EEfrq4+JhtvWUB4Yk0jeaVBzPyAy9B0W
         t3A1Zduf1sdyLIwSocKPBo6KorV0qgmt+q7c45UfyceR1JR1yTOyoR3Gbc7Xct8ruL4w
         MuPO6zeqsCNl9R6O00mtdtEryI5tLqMhvcKaGupymTl7pM9LC/u0EYdQdX7mAHLGbZ7Z
         gTDTXmlClR8i7Xcdw+Q/VwD07zvr5xD194gDWJ9xWwGJtOfnHdKQN0CNkN6k4Tnpo2YT
         s8J11mywr0yzYywoejXKxMSKWSd2m1hovZ8zoKK3oZ+TWqBqQTKNFgbI6TQurPorVdqC
         yIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391505; x=1780996305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w64aJR4GsiijIIC+qw1V7Ljp4DhfTK7YqGC8ys2CQuk=;
        b=SXJJVS2ihhBYdROzpo/6aEsDEtWz17WTvUzystWqXeGHknFnhdw10OWbYgTRspNFbN
         veC3bmiYnbmm/e9rMgQf96KBS6VAOwgOZjVtbkf8OtUIDZIfw5X3CDKieJ4YxuVvpKpa
         rqw58TuKQ1h6wtzgFTY/fTc1XKv90quy3HQbept//vPUc1R5HC+zVhVVzOSp0aExJ67E
         X0eJpXQDmo4LJih6unijGdKWGYJp/Wopsy28kSE+UuwucTCmFyJtHNE/TxRfgsXwwxNz
         JzmJCv9+6pngBCIVVmdTRIr37pX36sInc8DsLe+hD1jF5cQ9D+SOSrAJ6V7Hy0D3ALKO
         l1Gw==
X-Gm-Message-State: AOJu0YxszbmS0QA+Yxv+/GnezUU1RIa4QHXuCj2ws3QME/jrczeJzGgC
	a5TVI+tu3WDVgdiC3ypfPH2DyIwYnQJroiSQAhT3qTC2VtQ4bO+CZWpFDquu4Sh2NqH4wPzbtrG
	p6UG0BzJdBDFN5xni70IqPBEfNoHMF/f1DH3zjghG7r5/vdzBv/zEVG19p2qtU1J3CmQK
X-Gm-Gg: Acq92OG/ZXJUMxIFN9Q8r4PECbB2YuK9rCHoqBGXv2P4ONh65X74D8vS7qx4GrQqG35
	xNGUnxbDQzlf3nTTgh2bjAnn0lLS3hjobSKRF0j1ifnz7b1jWyKyTq/SbloPQcZX0XiXaciZA2U
	ZooeJCk0nU7Pr44I2QMtF+LLrxV0HFKR6DZzGRLrUkjXQINimZCWvCD2XYIYyQW6JbIVK2NW6m8
	EQuiJizUajIZTbh6o6sTiKi6Pl8i7ObhHiaqMIZDtX/u8O0YUmAnUpD4BHYDLKJKh+i9F+45wp5
	KkSbqJUkn0zwzXNa6sEbQL/zdPl1SLaOq1jZNNfmm9OrKG4ts+ejDa4vugiFW4Da4Lq9IWBWc8j
	Rbtjb67UltVT+Bl4PGh0X7l5ugWvEi8tD+VwfxTglTOXQLe7jYkUCiapQnw7ChieN5Y7Au5G6VW
	kc4yNZzGQsbh2e8ofVjw==
X-Received: by 2002:a05:622a:1812:b0:50f:c9a2:1643 with SMTP id d75a77b69052e-517662835efmr36172881cf.11.1780391505052;
        Tue, 02 Jun 2026 02:11:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1812:b0:50f:c9a2:1643 with SMTP id d75a77b69052e-517662835efmr36172701cf.11.1780391504654;
        Tue, 02 Jun 2026 02:11:44 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:17 +0800
Subject: [PATCH v6 05/15] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-5-2c17ff40a9b2@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=2097;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=k2Fff3upCougTurRhx1qk32jaQDI5eLSE+rUossKmgQ=;
 b=i05DXxqApSBHDn24Y/faO64tUx0fwhQhNrJN23hr3yxu0q6ThLoselo9pXKhvx2pg3MCF6Xpc
 uOM/uL5oVQKBuNBbQTbinDYz8cOaqbhcNVc6RquNhHROUM7d9+u9qWU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: EA2Zmw3_S7gnfFmHCaiAGkYMS7f9SCom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX2EO/lFs83ojl
 gU0AKmN1HwnQ9uFiyvRpxu8rEFi167ar4qIWGQvlmI9HO5JilsQNCrpKC0Nnl87BKkmgSSfBJ+i
 TLPC0XWlR2oTlR59Y4VxlcWSmtj5x4IMJ0656UL8kKPZh5L7WrIyd4Otf32+DKHFB114qLAYXMF
 Xsj0DlFV09OxsA9Zwu+j+h32eo07JKdcBNjeZluYbO7owcOFoEx0JvClINSl1nFXYkX9GirMTGW
 flgPeTaTzj2rjHr4HATe9zzfqxJ6IaP0vbMOy5EVls7r2WRGccSW9g4sMHU+eWvq88u8LyOYZ5K
 1Gx++JLrYuGzR8+XL4Ndxlo/Pci2RHK69qkZoS7nOIr8/glbmxyxOKaJF+h3SE6Z7q5YjiAwp/K
 gQGWdSB105DQzEI9+A9e8f8ulxNHX5HK0WiDVJgynrUg9Ij4QHCHm6ws5R07k81WDkMOIJQmCNL
 FGhqaoAnmNh8hqhcZJA==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e9e52 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=TC1OlXllJ9dbkp4NpB8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: EA2Zmw3_S7gnfFmHCaiAGkYMS7f9SCom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 14DC062B990
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110780-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

Refactor the MISC1_MISC0 register configuration into a standalone helper
function to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ed2ba47881fd..71d45b2c4daf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -458,17 +458,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
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
@@ -482,6 +478,17 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
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


