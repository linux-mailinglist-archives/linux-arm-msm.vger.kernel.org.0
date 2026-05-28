Return-Path: <linux-arm-msm+bounces-110098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM8rIFcdGGocdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:47:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6E5F0DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1A73304C041
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6A63BBA07;
	Thu, 28 May 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGfo0np6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1rVZVpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03013BE621
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964894; cv=none; b=a6LAwyxJ+0XOz+3BBbxMSEfmvtre5lF6ee50HsTUxMlGDdsI7wAQmQM/a7/Lz3iBMAd+R+qNaobUD4gFe12ERgGu+7SnuXzFr8GtKyQ4RhcBTgvwE/WJBK0l706QiElqEOBHM6c6lYQCKQ4bGIhM9BHCsPgHzQsFQ2pbsVrScCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964894; c=relaxed/simple;
	bh=pflAh4BSt0q6q6tCL4/aOrQGk1ttm1T1ai76/pUmfTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPmqSVA00+KX8CMHUPoRSEneteDkaF1tctxNLvJ+fldib1wy5+TUhk8IXLtNLL086eNBBzUooI5NTU8AQdqSkuE2BxAI0GFqHIm4A0NBGIWpYuS1VJebTDU409maTz6YB6jL2ZHpAk7wH9KuD/tiF5zI/WeFP637MXtDkgY5ptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGfo0np6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1rVZVpK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vUT44184514
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmW5IAsVo0Q40l7XHu8+8e2aqWRn+l01qYhv/DjWm/w=; b=DGfo0np6G1mSreoa
	zYZbrd3lp6K5155byMekgKn9m3i5jX8tPns20xAfmlq05q+OVEm4P2J6C+6yUJgE
	EiG80IGQxz7sb+DNsL0DlZl2I3mSeBLU3xV8BFOx66fKDr0unZkShQD/Y+juBtan
	0/Btx+cIH/Xz6kYFT2F7LWMTMC0c3SUttGXJkZiBroHPOM+azf/s7Z9vuZQuz2iA
	/Xes247HaRn8/39tdtRuM1B+lEWoijiPJb1sNxP9DB/LcYM6CUzvKFEMuxR/gzEh
	eV3pNa6uMghT/xba496hikDVDWmyDBibJQv3xdriB3ISiCHJFz1mzpe1GgsZNEsF
	HzHC1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yf2e2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90ffa709073so2605765485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964890; x=1780569690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmW5IAsVo0Q40l7XHu8+8e2aqWRn+l01qYhv/DjWm/w=;
        b=i1rVZVpKK52lnrvYVJBLIAE6U8VupTBGP+sACMUvqkCPZWCOSJoQJm3FPr8+ZNKA4C
         QQz9Gn0+w1TI0psZb4b9rVksW0xPZT+aIWkIrR8eJbtc8FkV1zDJhUKK8uTmtDK8C9tc
         oxtOzuup80BR2Eh23x9TUJ0/Tqxe0/SkYt9pmYpgPfG52bsjW8DUFAtH63kz/ilV73p5
         iAj8ihsuXGk4rFSpcZz0i9DO+SzPkt303ErLkt2X5lvjgWKqb2SwrdgIVJjuoA9WSpPE
         ijw2EdUPov8iS+/heuuFhiF+m8bP8OyeUitbVeAy76LS9bQWmxIymZbURimxiSgVC41A
         omVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964890; x=1780569690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bmW5IAsVo0Q40l7XHu8+8e2aqWRn+l01qYhv/DjWm/w=;
        b=iuW3ycKpPo3lBu6qxzWviRHhEMic9xKuER1F5/BzNTXJRCf5HkHbr0mv3/hFDC409k
         qTsXHkm1xfnvgTTBZYKb6fmeUqLgbT3VDJeF8LjdNUArA32IQhQ1u0XaLASdeT7VH4pr
         tf1lSc63nTjIZn+MdKXmZ6EkkCWkxqU9ThMbEqgg2EZwMqo0XmRvvGBFEZVpwCo3XW+c
         GMikSxn4ntqdtSMim1/DoUzfItJ5oH0zAA8X0wA4PduIdLFiQHUs6xM9MYuumkTYEC6F
         0EzaxJ9E9u3AL7ec3zkd9NdQydgXsYQa3RtBF03usYpP2dV6TjCGyhBncwb4Frii6lIA
         qRTg==
X-Gm-Message-State: AOJu0YwSEgmPmJf1GSlFtDuSyC7T3uEtCrvgEw24S2qc2icvIjOC5fUQ
	LzocYcWgMY4PvBmfRTD05gV3P3ZZnj7eDzPdHqM2S9A6ZAlDOHNk1lSjewsqzhiIPvZdbtMrG6n
	FC4gdgdzQ3BLGFF799pJoMBl4zSuRl/sh2rXSl0c+7V6IWT8pK0ckZz1IujXKBPGzh65j
X-Gm-Gg: Acq92OER9CwNM9OiT5+OWt2aYKRWJDseHaDhFB+TaLB7vA2vRrTHveW0+l4mXsyOB1P
	QrQ4rE6znF3eef0Cun6rqrHlA3fXeso6jQW979sL7VUDD0dTx0gXpQ2O7nazgEAU/msHyqleEEe
	pW1SouOZm4DNITLxuJWN2eVHDAQVVvx4JsZPvIUHeF6fYr9Q1Rq+hv2ElJJcRq8N3gRddohHnhi
	TB3s9oYCu9h9FubIhWe3Nr36SId2n393leHsn+qoFNjb/d5sr1fuH1s7xcnWouh4AtzRgvD7lVU
	O5qkWjrP4pbMASwNHOC5TQAxsAQvQcZqcGshkVdoUDO39iy5r6ftjVaN3pZ5CcKIPrUq/OmySgP
	4fZOBfvJwpmP4QFE4SHTrP00MyxvAAFQQidJCcYQWBNTd9oacBmZxBxB+D0pvbRQs8u5rlE2S5q
	stz8abcFbNSdXrkFvqtw==
X-Received: by 2002:a05:620a:d93:b0:90d:6234:caa2 with SMTP id af79cd13be357-914b49ba1f8mr3810964885a.40.1779964889865;
        Thu, 28 May 2026 03:41:29 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:90d:6234:caa2 with SMTP id af79cd13be357-914b49ba1f8mr3810960985a.40.1779964889301;
        Thu, 28 May 2026 03:41:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:32 +0800
Subject: [PATCH v5 11/15] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-11-a9221c1f1f3b@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=3896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=vWRaeaHEINP+1viyGh71nSeufwciiMtgzzvwLnLdxKY=;
 b=gyhRfjc06bG29IAATYKBIv8SueLwWVsgEECnmKEbHZ96rKKa8jxFVwZOazQkUCaxKwq8vct3G
 i/zqGXFtvJEC9D3O30CuvA2hJgs+btaySIHnIc0jFs4J9RBV2R0p3Fk
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: qPp1GSk3iyhSNrcVlZh3z3C_EUC3yBSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwOCBTYWx0ZWRfX4oEz2oCWBhvX
 ejwX4L5IaZxCqv9tsdbD9quxkFNLwQp5J8LahejlM0VStA5JFUaxB+oPdH7tOXrvIhV72bwocT4
 Wa8pL1hpFhehULfTvhqisjZcLgydyhZ2jlJjrVJeSfTRR0Ia7WLmg7f7KiZOt5CZntoZZlzkDrO
 b28YnNZyMMFud8Nmy89m9TDP/eyC7i3QifCiZEWPzuSDc4s596bKu0XHg8bl31zWfQgyG1fFcMm
 TW3BANcOH2DQIMpjgbyXDaD9gVstKohfcxW1SSzWp4dzk6iCkGs/yRpFAu03X5YFjCcXbgwcKQX
 7eHLR065cUTJ4bNKpDp1EJdA4qtkvoRpCnS/x0FdqwAl2y6H7PPzF8BPRD3RTpZwuwdRXY3Nery
 aBxvzQfKgnBNsKD7OR9gAypeDWcIQRU6V4Nlk4nubxTVVObocL15glwraIQR+6j0EJWKuV4YYGu
 jZvCxLfmIKCSFBml4Hg==
X-Proofpoint-ORIG-GUID: qPp1GSk3iyhSNrcVlZh3z3C_EUC3yBSO
X-Authority-Analysis: v=2.4 cv=G8gs1dk5 c=1 sm=1 tr=0 ts=6a181bda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2kxiPxfbkJi5fZIrDGYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110098-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 21E6E5F0DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Split dp_ctrl_off() into stream and link parts so that for MST
cases we can control the link and pixel parts separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  7 ++++---
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 88b6f4b8a598..6e78dd62fc1a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2213,7 +2213,7 @@ static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned l
 	return ret;
 }
 
-static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 
@@ -2242,7 +2242,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
+	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
 
 	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
@@ -2636,8 +2637,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel)
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2651,7 +2652,6 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
-	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 00b430392a52..5902cf7e746a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -22,8 +22,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
 				  struct msm_dp_panel *panel,
 				  bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
-		     struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *panel);
+void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 			    struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 230e14615a23..8f472633da82 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -725,15 +725,16 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl, dp->panel);
+		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
+		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 

-- 
2.43.0


