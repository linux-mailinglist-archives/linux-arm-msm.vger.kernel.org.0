Return-Path: <linux-arm-msm+bounces-102629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GALyFvfE2Gk4hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:37:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CBF3D504D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34508307173A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ECC38A73A;
	Fri, 10 Apr 2026 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJqiNuFM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWS7xyts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5646378831
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813667; cv=none; b=VufGHYvzInQ6cYzY4KS2EL0wUeRVC1Gq0gvcAnqpQb2eLnsFR6kHtlD1S0jq5D6YQ8YQAQal3HNRZDZsdbe69o7QKBoKzhp3Q/ggC1YszycFvMPd/5DoRkAFI3cFGDIUoAAaSwzq5+aM/nDpseFNaVRFEpDPTqKgMVG2QI4+SYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813667; c=relaxed/simple;
	bh=+7cU1V6ZRhvWTG/SKpP6TFbrSez8ukI57faMvb2HD5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mu1x4qbF/zDrISL86npQuFik86W2r0edvjI9nbPa2KvlkTMkEtg9rXYI/3sCZKXSZ3JRrk6PwyEXdy5pqF+nONiCrp8xqFlIiQbj9tg231Df/XrHg1F45635D1/3zBPtqAkVBY4RHXMMQMPKrToRrTVYzqfxGYCzHZUmJasHwTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJqiNuFM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWS7xyts; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5Iwmc3352581
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7h2ubxib4+P3xl/EpXUQFk46aXZCl+6yefZzWfhblSM=; b=UJqiNuFM6WXic0MI
	WUasUaEiZ5hkXkcs1ErQq/5N66CBJQNawudi0WM3HJV18na2iEQcGggRYa371pt+
	oaOBewQamRRUSDtrlXTpWaMavL8fVqz68Wtsr94HTVFrtvI3KUzsFNQRkld1g0EY
	ChUt6c9F2x+uQvxBsdsWiXyCFdKOa1W76OulD6NCTCAti6swYjsFFZCh/oix1euP
	vFf1xfypTE9lC5sfIXvyqgKR6iMop6DSa3z5mMZPVlpIfCGyxhn/QaqNJDx9giR5
	z2Z59r9WUMFuY/+VVh5n+q0kCNSOVt/rnAHLFQ1LOG2QLFI0IDZOlMIwQRU55Pwa
	pQHPgQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1quv47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a0ef4a7021so29496816d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813663; x=1776418463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h2ubxib4+P3xl/EpXUQFk46aXZCl+6yefZzWfhblSM=;
        b=UWS7xytsH4XmdNrb3aEtdKKPyX83jPeoqS6b2KZAR59u4ocO1teHncfaI1vnysyqzG
         TOu5KoXxO17pdBxKwD2d56NLNfOnbNP/7SdP2qUt+hvVzSFCY6a6vVGKchTXKiPXXQGE
         ++3qPY+CBFStDvf/6voNrsPF0IVOS2O6KeZruwPgdeGIKfealjF0yTUr5VTCm4a8R842
         Wu6cB6lcNF/N5Np2mTW30EQm4lBYC9H1R+gtgJLHr+q2r0njPHHquPYRMCs4i4PCM2g+
         xam/q+NDtWmeyfpxHcMvSbJRFlQeYXqAnTqOauBSXb/5klkOVvFvB5AEd3mcZ8HwENO4
         zp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813663; x=1776418463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7h2ubxib4+P3xl/EpXUQFk46aXZCl+6yefZzWfhblSM=;
        b=bKZFcBIk/MIl83csW0jtbZGuEfdcjDQ+Dx/IHYbvjyJIeaAjdiuFgOUJ9VGcto5Nj0
         2whbipFbc2xoaEf6w4n4zNFrNtZHornmfRtbX7hlbc9fPrCXoxriKwFfpv1jx76RwAFD
         F6rV5YF2Y+3L7bYWiXBEteKc0yFJdCII81azgfoQpwtyTm0DeUhGegxg2iDeXGJWiAUI
         jHkJgDH9tZY6ZHnpl6zeEuSzefPUFLGm17l8TX/x+o5b9wxsfUhc+AZ0zUk1yyW00AQt
         FaAmNxFTFC8Eu7zDuAWI2iFIsXbJf8guWxTAFVWnJAtIO6Gbfegvb1uzQNOSPeWHUXh1
         QfJQ==
X-Gm-Message-State: AOJu0Yz934eXU+7hq24flCNbC1djhxwgiF/NOQdxQsmBl4af/KgcAIBf
	nr5MrTubYZS4HxMJ59FQT73bWJu9a/CvdCSYlmbzp0E9PLot95GmiMcAVCNtcS1JF5uJrKulcB5
	tS0SFPIgkH2yX3t7NGpqp16VWWWUBACzPHwVVxCStnMVL2MvrM0wMXvlw6mHpEejpeV4q7j8L6o
	7S
X-Gm-Gg: AeBDietoZ/Se057T72ZtbzkURbo2jryyn3ndu13+TlCybnoz670YUfkDIju/rf3EzNK
	e6uQTfGKb2gM2PTWpr4Z1q9ERFJ0o4F2VSVhLOYLa3t9jqFp5qKlxX60SnLDV5S2RG3oo9Gu5Hr
	N7/s61lG5+wv+ERFtqrNjIZg/15GzulZkRvxYz3ZI2xGfM+E7ucokgadbM3Xq5k01NDsoIRlY1S
	We33OuGRAISsxWXVw7eYrU5j9m/nXme3T2tXbbFkOppOPChb9WcQHo6QZRrcXPgvB9HNPAHEvv+
	JrpnatQwPQ+2XhVOeKFsPGGxy80CkDdDxUuzoRjvmKgEcg/1BSZlwqw8OapMNhE9uhAMZ0zKvSE
	IfcZEzamDvcyHG01XT5az1bXbuB2X1TOcaohNb3TQrQnw57k0f7V+LTy3+wVQSHKndkA/QEjU+q
	FYH9edQow=
X-Received: by 2002:a05:6214:3f82:b0:8a7:1498:5f67 with SMTP id 6a1803df08f44-8ac86106cc5mr32395596d6.18.1775813663257;
        Fri, 10 Apr 2026 02:34:23 -0700 (PDT)
X-Received: by 2002:a05:6214:3f82:b0:8a7:1498:5f67 with SMTP id 6a1803df08f44-8ac86106cc5mr32395146d6.18.1775813662772;
        Fri, 10 Apr 2026 02:34:22 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:22 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:41 +0800
Subject: [PATCH v4 06/39] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-6-b20518dea8de@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2097;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=+7cU1V6ZRhvWTG/SKpP6TFbrSez8ukI57faMvb2HD5k=;
 b=LCulurXQCSKN0x9TrouPq77gILySvl8E7N7vxJB4Uvnj+KQ5odYyAMqe4OUUvcle5+iaABwJw
 idu4XOz57scD+43PuOg3QQpZ9iIKJQ0ZFMzGW64oI+tK7hI6OSU+edt
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfX55r04VOpPYgq
 XQiNJLd9PGE044pGAc30+XnqWJ2J9hXt7Zqw53G0Ercw93qx8IV5nq23NxLfoOFDoEpl644Oq2H
 slxE2W4mU9uTRBhinjlKt+uuRlxeQBCBQknXlV2K2/Pop6h7Q03NSkEcB74fIKq7HFiD+Jf/p3H
 8SpKLSL0fcpxYHXJN1AOhJqDGYt6ebUeFqb5VDoH3/Y44Qb3vA650wUnoHu6sS/NRqQUqTmIviQ
 O20sDQ5OXu1/TFItikm6gOENl5jwDcq0F+mG/PKl4gFCdkYqqFuzFMf3asyIcTGmif+acwjGHCJ
 +iXkZWPOnnfzJ3+Hqpo3U/wkY8u1b2kPPL50MFlffBw1n4i9xrQmsglfJTlXakSaEdozF3ORHOM
 FpR+km2LjxS2svG3x4TDTZhih7Yu8UPuK6vG8dgkbozF+tjBW+01+WK5w3LzGcAHPrp18UpgOQg
 2wQ7yAQazc2nhZ8PyVA==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8c420 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kqER-IEIHq1TX1bzL54A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: o7ahb8GayquSU9btKs7Lw4MpKPXa0eBs
X-Proofpoint-ORIG-GUID: o7ahb8GayquSU9btKs7Lw4MpKPXa0eBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102629-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5CBF3D504D
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
index 85315467b5d0..fd6caebae148 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -455,17 +455,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
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
@@ -479,6 +475,17 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
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


